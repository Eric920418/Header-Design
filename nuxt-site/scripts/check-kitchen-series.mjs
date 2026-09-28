import assert from 'node:assert/strict'
import { existsSync, readFileSync } from 'node:fs'
import ts from 'typescript'

function loadData(path) {
  const url = new URL(path, import.meta.url)
  const { outputText } = ts.transpileModule(readFileSync(url, 'utf8'), { compilerOptions: { module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2022, esModuleInterop: true } })
  const exports = {}
  new Function('require', 'exports', outputText)(relative => JSON.parse(readFileSync(new URL(relative, url), 'utf8')), exports)
  return exports
}
const { KITCHEN_SERIES_PAGES: pages } = loadData('../data/kitchenSeries.ts')
const { KITCHEN_STYLES: styles } = loadData('../data/kitchenStyles.ts')
assert.equal(pages.length, 10)
assert.equal(new Set(pages.map(page => page.slug)).size, 10)
const base = process.env.TEST_BASE_URL || 'http://localhost:3100'
const config = readFileSync(new URL('../nuxt.config.ts', import.meta.url), 'utf8')
const password = process.env.PREVIEW_PASSWORD || /previewPassword: '([^']+)'/.exec(config)?.[1]
const login = await fetch(`${base}/api/preview-access`, { method: 'POST', headers: { 'content-type': 'application/json' }, body: JSON.stringify({ password }) })
assert.equal(login.status, 200, '本機預覽登入失敗')
const cookie = login.headers.getSetCookie().map(value => value.split(';')[0]).join('; ')
const images = new Set()
for (const page of pages) {
  const style = styles.find(style => style.slug === page.slug)
  assert.equal(style?.route, `/home-style/${page.slug}`)
  assert.equal(style.available, true)
  assert(page.intro.title && page.intro.paragraphs.length && page.suites.length && page.finishes.length && page.equipment.length, `${page.slug}: 缺少完整內容`)
  assert.equal(new Set(page.suites.map(suite => suite.id)).size, page.suites.length)
  for (const suite of page.suites) {
    assert(suite.images.length && suite.descriptions.length && suite.name, `${page.slug}: 空套系`)
    suite.images.forEach(image => images.add(image))
    for (const link of suite.links || []) assert.equal(new URL(link.url).protocol, 'https:')
  }
  page.heroSlides.forEach(image => images.add(image))
  for (const item of [...page.finishes, ...page.equipment, ...page.cases]) {
    assert(item.image, `${page.slug}: 缺少圖片來源`)
    images.add(item.image)
  }
  const response = await fetch(`${base}${style.route}`, { headers: { cookie } })
  assert.equal(response.status, 200, style.route)
  const html = await response.text()
  assert(html.match(/<h1\b[^>]*id="ai-kitchen-hero-title"[^>]*>(.*?)<\/h1>/s)?.[1].includes(page.name), `${page.slug}: SSR 標題錯誤`)
  assert(html.includes('hero-slide-copy') && html.includes('hero-template-title'), `${page.slug}: 未共用首頁標題`)
  for (const marker of ['ai-suite-stage', 'ai-finishes__grid', 'ai-equipment__grid', 'https://pse.is/9kq37z']) assert(html.includes(marker), `${page.slug}: ${marker} 遺失`)
  assert(html.includes(page.suites[0].name.replaceAll('&', '&amp;')), `${page.slug}: 套系內容錯誤`)
  if (!page.cases.length) assert(html.includes('此系列目前尚無公開推薦案例。'))
  console.log(`PASS ${style.route}: ${page.suites.length} 套系、${page.finishes.length} 板材、${page.equipment.length} 廚電、${page.cases.length} 案例`)
}
assert.equal((await fetch(`${base}/home-style/not-a-series`, { headers: { cookie } })).status, 404)
for (const image of images) {
  if (image.startsWith('/')) assert(existsSync(new URL(`../../public${image}`, import.meta.url)), `找不到本機圖片：${image}`)
}
if (process.argv.includes('--images')) {
  const queue = [...images].filter(image => image.startsWith('https://'))
  await Promise.all(Array.from({ length: 6 }, async () => {
    while (queue.length) {
      const image = queue.pop()
      const response = await fetch(image, { method: 'HEAD', signal: AbortSignal.timeout(30000) })
      assert(response.ok && response.headers.get('content-type')?.startsWith('image/'), `圖片異常 ${response.status}: ${image}`)
    }
  }))
}
const component = readFileSync(new URL('../components/internal/KitchenSeriesPage.vue', import.meta.url), 'utf8')
assert(component.includes('title-${heroTransition}') && component.includes('heroTransition.value += 1'), '標題動畫必須隨輪播重啟')
assert(!component.includes('@mouseenter') && !component.includes('@mouseover'), '滑鼠懸停不可暫停輪播')
assert(component.includes('handleSuiteKeydown') && component.includes("event.key === 'ArrowDown'"), '套系須支援鍵盤')
console.log(`PASS 10 系列、SSR、404、${images.size} 圖片${process.argv.includes('--images') ? ' HTTP 檢查' : '來源檢查'}、動畫與鍵盤回歸`)
