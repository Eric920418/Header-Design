import assert from 'node:assert/strict'
import { readFileSync, realpathSync } from 'node:fs'
import { createServer } from 'node:http'
import { createRequire } from 'node:module'
import vm from 'node:vm'

const require = createRequire(import.meta.url)
const { transpile } = require('typescript')
const nuxtRequire = createRequire(realpathSync(new URL('../node_modules/nuxt/package.json', import.meta.url)))
const { ofetch } = nuxtRequire('ofetch')
const source = readFileSync(new URL('../pages/preview-access.vue', import.meta.url), 'utf8').match(/<script setup lang="ts">([\s\S]*?)<\/script>/)[1]
const script = transpile(source, { target: 99 })

function page(fetch, redirect = '/') {
  const navigations = []
  const context = vm.createContext({
    definePageMeta() {}, useSeoMeta() {}, useRoute: () => ({ query: { redirect } }),
    ref: value => ({ value }), $fetch: fetch,
    window: { location: { assign: path => navigations.push(path) } },
  })
  return { ...vm.runInContext(`${script}\n;({ unlockPreview, password, pending, errorMessage })`, context), navigations }
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
  const external = page(async () => ({ ok: true }), '//example.com')
  await external.unlockPreview()
  assert.equal(external.navigations[0], '/')
  console.log('PASS: 錯誤密碼後可重試、成功保留目的頁、拒絕外站導向')
}
finally {
  server.closeAllConnections()
  await new Promise(resolve => server.close(resolve))
}
