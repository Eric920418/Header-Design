import assert from 'node:assert/strict'
import { readFileSync, realpathSync } from 'node:fs'
import { createServer } from 'node:http'
import { createRequire } from 'node:module'
import vm from 'node:vm'

const require = createRequire(import.meta.url)
const { transpile } = require('typescript')
const nuxtRequire = createRequire(realpathSync(new URL('../node_modules/nuxt/package.json', import.meta.url)))
const { ofetch } = nuxtRequire('ofetch')
// Run the actual config and middleware: a stale deployment pin must not outlive a release.
const configSource = readFileSync(new URL('../nuxt.config.ts', import.meta.url), 'utf8').replace(/^import .*\n/gm, '')
const config = vm.runInNewContext(transpile(configSource.replace('export default ', 'this.config = '), { target: 99 }) + '\nconfig', {
  defineNuxtConfig: value => value, tailwindcss: () => ({}), process: { env: { VERCEL: '1', VERCEL_SKEW_PROTECTION_ENABLED: '1' } },
})
assert.equal(config.nitro.vercel.skewProtection, false, 'Document requests must not be pinned to an old release')
const lockSource = readFileSync(new URL('../server/middleware/preview-lock.ts', import.meta.url), 'utf8').replace(/^import .*\n/gm, '').replace('export default ', 'this.handler = ')
const removed = [], gate = { defineEventHandler: value => value, getRequestURL: event => new URL(event.url),
  getCookie: (event, name) => event.cookies[name], deleteCookie: (event, name) => removed.push(name),
  useRuntimeConfig: () => ({ previewPassword: 'test' }), isPreviewAccessTokenValid: token => token === 'valid',
  createError: options => Object.assign(Error(options.statusMessage), options), sendRedirect: (event, url) => url,
}
vm.runInNewContext(transpile(lockSource, { target: 99 }), gate)
for (const url of ['/admin/content', '/builders?cmsPreview=builders', '/api/content/site-visuals', '/preview-access']) {
  removed.length = 0
  gate.handler({ url: 'https://cms.example' + url, cookies: { __vdpl: 'old-release', sakura_preview_access: 'valid', sakura_cms_session: 'signed-in' } })
  assert.deepEqual(removed, ['__vdpl'], 'Clear only the old deployment pin, preserving both sign-ins')
}
removed.length = 0
assert.throws(() => gate.handler({ url: 'https://cms.example/api/admin/workspaces', cookies: { __vdpl: 'old-release' } }), error => error.statusCode === 401)
assert.deepEqual(removed, ['__vdpl', 'sakura_preview_access', 'sakura_preview_expires_at'])
removed.length = 0
gate.handler({ url: 'https://cms.example/admin', cookies: { sakura_preview_access: 'valid' } })
assert.deepEqual(removed, [], 'Current sessions need no cookie rewrite')
console.log('PASS: release pins are disabled and retired; proposal protection and CMS sign-in remain intact')
const source = readFileSync(new URL('../pages/preview-access.vue', import.meta.url), 'utf8').match(/<script setup lang="ts">([\s\S]*?)<\/script>/)[1]
const script = transpile(source, { target: 99 })

function page(fetch, redirect = '/') {
  const navigations = []
  const timers = new Map()
  const events = new Map()
  const context = vm.createContext({
    definePageMeta() {}, useSeoMeta() {}, useRoute: () => ({ query: { redirect } }),
    ref: value => ({ value }), $fetch: fetch,
    setTimeout: (callback, delay) => { const timer = { callback, delay }; timers.set(timer, timer); return timer },
    clearTimeout: timer => timers.delete(timer),
    onMounted: run => run(), onBeforeUnmount() {},
    window: {
      location: { assign: path => navigations.push(path) },
      addEventListener: (name, handler) => events.set(name, handler),
      removeEventListener: name => events.delete(name),
    },
  })
  return { ...vm.runInContext(`${script}\n;({ unlockPreview, password, pending, loadingSite, errorMessage })`, context), navigations, timers, events }
}

// Exercise the page's actual timeout through ofetch against a non-responding server.
let mode = 'hang'
let requests = 0
const server = createServer((req, res) => {
  requests++
  req.resume()
  if (mode === 'hang') return
  res.writeHead(mode === 'wrong' ? 401 : 200, { 'content-type': 'application/json' })
  res.end(mode === 'wrong' ? JSON.stringify({ statusMessage: '密碼錯誤，請確認大小寫與空格後再試一次。' }) : '{"ok":true}')
})
await new Promise(resolve => server.listen(0, '127.0.0.1', resolve))
try {
  const base = `http://127.0.0.1:${server.address().port}`
  const access = page((path, options) => {
    assert.equal(options.timeout, 15000, '登入必須在 15 秒停止等待')
    assert.equal(options.retry, 0, '登入不得自動重送密碼')
    return ofetch(base + path, options)
  }, '/builders#appointment')
  access.password.value = 'test-only-password'
  const started = performance.now()
  const first = access.unlockPreview()
  await access.unlockPreview()
  await first
  assert.equal(requests, 1, '等待時重複送出不可再建立請求')
  assert(performance.now() - started >= 14000 && performance.now() - started < 20000)
  assert.equal(access.pending.value, false)
  assert.match(access.errorMessage.value, /15 秒/)
  assert.match(access.errorMessage.value, /timeout|abort/i, '保留底層錯誤')
  assert.equal(access.navigations.length, 0)
  console.log('PASS: 無回應時 15 秒結束、顯示錯誤、解除鎖定且不重複請求')

  mode = 'wrong'
  await access.unlockPreview()
  assert.match(access.errorMessage.value, /密碼錯誤/)
  assert.equal(access.pending.value, false)
  assert.equal(access.navigations.length, 0)
  mode = 'ok'
  await access.unlockPreview()
  assert.equal(access.errorMessage.value, '')
  assert.equal(access.navigations[0], '/builders#appointment')
  assert.equal(access.loadingSite.value, true, '驗證成功不代表目的頁已完成載入')
  assert.equal(access.pending.value, true, '目的頁等待期間不可重複送出密碼')
  await access.unlockPreview()
  assert.equal(requests, 3, '目的頁等待期間不可再建立登入請求')
  assert.equal(access.navigations.length, 1)
  const [timer] = access.timers.values()
  assert.equal(timer.delay, 75000)
  timer.callback()
  assert.equal(access.pending.value, false)
  assert.equal(access.loadingSite.value, false)
  assert.equal(access.timers.size, 0)
  assert.match(access.errorMessage.value, /驗證已成功.*75 秒/)
  await access.unlockPreview()
  assert.equal(access.navigations.length, 2, '目的頁逾時後可以重試')
  access.events.get('pageshow')({ persisted: false })
  assert.equal(access.pending.value, true, '首次 pageshow 不應提前解除目的頁等待')
  access.events.get('pageshow')({ persisted: true })
  assert.equal(access.pending.value, false, '從瀏覽器快取返回密碼頁須可再次操作')
  assert.equal(access.loadingSite.value, false)
  assert.equal(access.timers.size, 0)
  const external = page(async () => ({ ok: true }), '//example.com')
  await external.unlockPreview()
  assert.equal(external.navigations[0], '/')
  console.log('PASS: 錯誤密碼後可重試、成功保留目的頁、拒絕外站導向')
  console.log('PASS: 目的頁等待保持鎖定、不重送、75 秒逾時可重試、歷史快取返回解除等待')
}
finally {
  server.closeAllConnections()
  await new Promise(resolve => server.close(resolve))
}
