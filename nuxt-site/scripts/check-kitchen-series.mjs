import assert from 'node:assert/strict'
import { existsSync, readFileSync } from 'node:fs'
import ts from 'typescript'
import sharp from 'sharp'

function loadData(path) {
  const url = new URL(path, import.meta.url)
  const { outputText } = ts.transpileModule(readFileSync(url, 'utf8'), { compilerOptions: { module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2022, esModuleInterop: true } })
  const exports = {}
  new Function('require', 'exports', outputText)(relative => JSON.parse(readFileSync(new URL(relative, url), 'utf8')), exports)
  return exports
}
const { KITCHEN_SERIES_PAGES: pages } = loadData('../data/kitchenSeries.ts')
const { KITCHEN_STYLES: styles } = loadData('../data/kitchenStyles.ts')
const { KITCHEN_EQUIPMENT_CUTOUTS: cutouts } = loadData('../data/kitchenEquipmentCutouts.ts')
assert.equal(Object.keys(cutouts).length, 9)
assert.equal(cutouts['/cms-assets/future-custom-equipment.png'] || '/cms-assets/future-custom-equipment.png', '/cms-assets/future-custom-equipment.png', '後台換圖不可被去背對應蓋掉')
for (const image of Object.values(cutouts)) {
  const file = new URL(`../../public${image}`, import.meta.url)
  const metadata = await sharp(readFileSync(file)).metadata()
  const stats = await sharp(readFileSync(file)).stats()
  assert(metadata.hasAlpha && !stats.isOpaque, `去背圖必須真的透明：${image}`)
  assert(stats.channels[3].min === 0 && stats.channels[3].max === 255, `去背圖不得為空白：${image}`)
}
assert.equal(pages.length, 10)
assert.equal(new Set(pages.map(page => page.slug)).size, 10)
const base = process.env.TEST_BASE_URL || 'http://localhost:3100'
const config = readFileSync(new URL('../nuxt.config.ts', import.meta.url), 'utf8')
const password = process.env.PREVIEW_PASSWORD || /previewPassword: '([^']+)'/.exec(config)?.[1]
const login = await fetch(`${base}/api/preview-access`, { method: 'POST', headers: { 'content-type': 'application/json' }, body: JSON.stringify({ password }) })
assert.equal(login.status, 200, '本機預覽登入失敗')
const cookie = login.headers.getSetCookie().map(value => value.split(';')[0]).join('; ')
const homeHeroResponse = await fetch(`${base}/api/content/view-components-home-HomeHero`, { headers: { cookie } })
assert.equal(homeHeroResponse.status, 200, '需讀取本機已發布首頁Hero名稱')
const homeHero = await homeHeroResponse.json()
if (process.argv.includes('--cutouts')) {
  const response = await fetch(`${base}/api/content/data-kitchenSeries`, { headers: { cookie } })
  assert.equal(response.status, 200)
  const published = (await response.json()).KITCHEN_SERIES_PAGES
  assert.equal(published.length, 10)
  const sources = new Set(published.flatMap(page => page.equipment.map(item => cutouts[item.image] || item.image)))
  for (const source of sources) {
    const image = await fetch(`${source.startsWith('/') ? base : ''}${source}`, { headers: source.startsWith('/') ? { cookie } : {}, signal: AbortSignal.timeout(30000) })
    assert(image.ok, `廚電圖片無法載入：${source}`)
    const buffer = Buffer.from(await image.arrayBuffer())
    assert((await sharp(buffer).metadata()).hasAlpha && !(await sharp(buffer).stats()).isOpaque, `已發布推薦廚電仍有不透明背景：${source}`)
  }
  for (const page of published) {
    const html = await (await fetch(`${base}/home-style/${page.slug}`, { headers: { cookie } })).text()
    for (const item of page.equipment) assert(html.includes(cutouts[item.image] || item.image), `${page.slug} ${item.model}: 未使用去背來源`)
  }
  console.log(`PASS 已發布十系列 ${published.reduce((sum, page) => sum + page.equipment.length, 0)} 個廚電位置、${sources.size} 個來源全部透明，SSR 使用對應圖片`)
}
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
  const lightFinish = page.finishes.some(finish => finish.code === 'D0032' || (page.slug === 'clever' && finish.code === 'D8410'))
  const borderlessFinish = page.finishes.some(finish => page.slug === 'basic-plus' && finish.code === 'K540D')
  assert.equal(html.includes('ai-finishes__image--light'), lightFinish, `${page.slug}: 白色色卡細框範圍錯誤`)
  assert.equal(html.includes('ai-finishes__image--borderless'), borderlessFinish, `${page.slug}: 只裁除 BASIC+ 瓷白原圖灰框`)
  const heroTitle = homeHero.slides.find(slide => slide.route?.split(/[?#]/)[0] === `/home-style/${page.slug}`)?.title.trim() || page.name
  const escapedHeroTitle = heroTitle.replaceAll('&','&amp;').replaceAll('<','&lt;').replaceAll('>','&gt;')
  assert.equal(html.match(/<h1\b[^>]*id="ai-kitchen-hero-title"[^>]*>(.*?)<\/h1>/s)?.[1], escapedHeroTitle, `${page.slug}: Hero需與已發布首頁對應名稱一致`)
  assert(!html.includes('ai-hero__cta')&&!html.includes('Start<br>Project'), `${page.slug}: 不可保留左側Start Project CTA`)
  for(const marker of ['ai-hero__story-controls','ai-hero__catalogue-link','ai-hero__explore-link'])assert(html.includes(marker),`${page.slug}: 右側控制不可刪除：${marker}`)
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
assert(component.includes('.ai-finishes__image--borderless :deep(img) { transform: scale(1.012); }'), 'BASIC+ 原圖自帶灰框需以微幅裁邊隱藏，不改原圖顏色')
assert(component.includes('KITCHEN_EQUIPMENT_CUTOUTS[equipment.image] || equipment.image'), '去背只替換已知舊網址，未來後台換圖應保留')
assert(component.includes('title-${heroTransition}') && component.includes('heroTransition.value += 1'), '標題動畫必須隨輪播重啟')
assert(!component.includes('@mouseenter') && !component.includes('@mouseover'), '滑鼠懸停不可暫停輪播')
assert(component.includes('handleSuiteKeydown') && component.includes("event.key === 'ArrowDown'"), '套系須支援鍵盤')
assert(component.includes('.ai-equipment__image :deep(img) { transition: opacity .35s ease; }') && component.includes('a.ai-equipment__card:hover .ai-equipment__image :deep(img) { opacity: .6; }'), '推薦廚電僅讓可點擊圖片柔和淡化，不淡化文字、箭頭或錯誤提示')
assert(component.includes('@media (min-width: 768px) and (hover: hover) and (pointer: fine)') && component.includes('a.ai-equipment__card:focus-visible .ai-equipment__image :deep(img) { opacity: .6; }'), '淡化需支援鍵盤且避免手機觸控黏住 Hover')
assert(component.slice(component.indexOf('@media (prefers-reduced-motion: reduce)')).includes('.ai-equipment__image :deep(img)'), '減少動態偏好需停用圖片淡化轉場')
console.log(`PASS 10 系列、SSR、404、${images.size} 圖片${process.argv.includes('--images') ? ' HTTP 檢查' : '來源檢查'}、動畫與鍵盤回歸`)
