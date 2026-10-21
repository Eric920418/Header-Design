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
const publishedSeriesResponse = await fetch(`${base}/api/content/data-kitchenSeries`, { headers: { cookie } })
assert.equal(publishedSeriesResponse.status, 200, '需讀取已發布套系說明，不以型別樣本代替')
const publishedSeries = (await publishedSeriesResponse.json()).KITCHEN_SERIES_PAGES
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
  if(page.slug==='clever'||page.slug==='elegant'){
    const activePublishedSuite=publishedSeries.find(item=>item.slug===page.slug)?.suites[0]
    assert(activePublishedSuite,`${page.slug}: 缺少已發布套系`)
    const details=html.match(/<div\b[^>]*class="[^"]*\bai-suite-details\b[^"]*"[^>]*>([\s\S]*?)<\/section>/)?.[1]||''
    const descriptions=[...details.matchAll(/<p\b[^>]*class="ai-suite-details__description"[^>]*>([\s\S]*?)<\/p>/g)].map(match=>match[1])
    const expected=page.slug==='clever'&&activePublishedSuite.descriptions.length>1?[activePublishedSuite.descriptions.join(' ')]:activePublishedSuite.descriptions
    const escape=text=>text.replaceAll('&','&amp;').replaceAll('<','&lt;').replaceAll('>','&gt;').replaceAll('"','&quot;').replaceAll("'",'&#39;')
    assert.deepEqual(descriptions,expected.map(escape),`${page.slug}: Clever僅合併說明為一段，Elegant維持原段落與內容`)
  }
  const collectionsHeading=html.match(/<div\b[^>]*class="ai-section-heading"[\s\S]*?<\/h2>/)?.[0]||''
  assert(collectionsHeading.includes('Kitchen Collections')&&collectionsHeading.includes('class="bilingual-heading-lead"'),`${page.slug}: 原小標籤與雙語共用對齊組不得遺漏`)
  for(const text of ['Explore Our','探索廚房美學','Creative','Projects That','Define Our Style'])assert(collectionsHeading.includes(text),`${page.slug}: 只調位置，不得更改原標題：${text}`)
  const casesHeading=html.match(/<h2\b[^>]*id="cases-heading"[\s\S]*?<\/h2>/)?.[0]||''
  assert(casesHeading.includes('class="bilingual-heading-lead"')&&casesHeading.includes('風格廚房實例'),`${page.slug}: 推薦案例保留原中文與共用對齊`)
  assert.equal(casesHeading.replaceAll(/<[^>]*>/g,'').replaceAll(/\s+/g,' ').trim(),'Explore Our風格廚房實例 Take A Look At Our Latest Articles',`${page.slug}: 只刪除英文末尾句點，其他字詞不變`)
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
  const equipmentSection=html.match(/<section\b[^>]*aria-labelledby="equipment-heading"[\s\S]*?<\/section>/)?.[0]||''
  assert.equal((equipmentSection.match(/class="ai-equipment__item"/g)||[]).length,page.equipment.length,`${page.slug}: 輪播不可截斷或複製產品資料`)
  for(const label of ['上一個推薦廚電','下一個推薦廚電'])assert(equipmentSection.includes(`aria-label="${label}"`),`${page.slug}: 缺少輪播方向控制`)
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
const suiteDescriptionsExpression=component.match(/^const suiteDescriptions = computed\(\(\) => (.+)\)$/m)?.[1]
assert(suiteDescriptionsExpression,'Clever說明需由原始資料衍生，不能覆寫CMS')
const renderSuiteDescriptions=new Function('data','activeSuite','return '+suiteDescriptionsExpression)
for(const page of publishedSeries)for(const suite of page.suites){
  const before=structuredClone(suite),result=renderSuiteDescriptions(page,{value:suite})
  assert.deepEqual(result,page.slug==='clever'&&suite.descriptions.length>1?[suite.descriptions.join(' ')]:suite.descriptions,`${page.slug}/${suite.id}: 只合併Clever，其他系列不變`)
  assert.deepEqual(suite,before,'段落顯示不能改寫原始文案、圖片或配備')
}
assert.deepEqual(renderSuiteDescriptions({slug:'clever'},{value:{descriptions:[]}}),[],'空說明不新增空段落')
assert.deepEqual(renderSuiteDescriptions({slug:'clever'},{value:{descriptions:['單段原文']}}),['單段原文'],'單段說明保留原文')
assert(component.includes('v-for="description in suiteDescriptions"'),'前台需實際使用段落顯示結果')
console.log('PASS Clever全部套系合成單段、逐字保留／無原地寫入，其他九系列段落與資料不變')
const headingCss=readFileSync(new URL('../assets/css/main.css',import.meta.url),'utf8')
assert(/\.ai-section-heading \{[^}]*grid-template-columns: 30% 70%;/.test(component)&&/\.ai-section-heading h2 \{[^}]*margin: 70px 0 0;[^}]*font-size: 50px;/.test(component),'保留系列標題原欄位、頂距與桌機50px')
assert(headingCss.includes('.ai-section-heading, .about-services__heading')&&headingCss.includes('--bilingual-heading-top: 70px;'),'系列左側標籤需依原70px標題頂距套共用補償')
assert(headingCss.includes('--template-heading-title-gap: 47px;')&&headingCss.includes('align-items: center;')&&headingCss.includes('.bilingual-heading-lead { display: contents; }'),'保留共用47px／置中與手機原分行')
assert(/\.ai-equipment__grid \{[^}]*--columns: 5;[^}]*flex-wrap: nowrap;[^}]*touch-action: pan-y pinch-zoom;/.test(component),'廚電桌機單排五產品，保留垂直觸控捲動及縮放')
assert(component.includes('.ai-equipment__viewport { overflow: hidden; }')&&component.includes('.ai-equipment__grid { --columns: 2; --gap: 14px; }'),'輪播需裁切且手機維持兩產品')
assert(component.includes("slidesToScroll: 1, duration: reducedMotion.value ? 0 : 24")&&component.includes("loop: false, align: 'start' as const"),'每次一產品、不複製循環並尊重減少動態偏好')
assert(component.includes('@keydown.left.prevent="equipmentApi?.scrollPrev()"')&&component.includes('@keydown.right.prevent="equipmentApi?.scrollNext()"'),'廚電輪播需支援左右方向鍵')
assert(component.includes(':disabled="!equipmentCanPrev"')&&component.includes(':disabled="!equipmentCanNext"'),'輪播到頭尾或不足一屏時需停用對應箭頭')
const equipmentWatch=component.slice(component.indexOf('watch(equipmentApi,'),component.indexOf('const activeSuite ='))
const createEquipmentWatch=new Function('api',`const equipmentApi={},equipmentCanPrev={value:false},equipmentCanNext={value:false}; let cleanup; const watch=(_source,run)=>run(api,undefined,fn=>{cleanup=fn}); ${equipmentWatch} return {previous:equipmentCanPrev,next:equipmentCanNext,cleanup};`)
for(const count of [0,1,4,5,6,10])for(const columns of [2,5]){
  let index=0;const last=Math.max(0,count-columns),events=new Map()
  const api={canScrollPrev:()=>index>0,canScrollNext:()=>index<last,on:(event,fn)=>{events.set(event,fn);return api},off:(event,fn)=>{assert.equal(events.get(event),fn);events.delete(event);return api}}
  const state=createEquipmentWatch(api)
  assert.equal(state.previous.value,false);assert.equal(state.next.value,last>0)
  index=last;events.get('select')();assert.equal(state.previous.value,last>0);assert.equal(state.next.value,false)
  index=0;events.get('reInit')();assert.equal(state.previous.value,false);assert.equal(state.next.value,last>0)
  state.cleanup();assert.equal(events.size,0,'切換頁面需解除輪播監聽')
}
assert.equal(createEquipmentWatch(undefined).previous.value,false,'輪播尚未初始化時箭頭停用')
console.log('PASS 廚電五／兩產品單排、完整資料、箭頭邊界與重設／清理、鍵盤及減少動態來源防護')
assert(component.includes('.ai-finishes__image--borderless :deep(img) { transform: scale(1.012); }'), 'BASIC+ 原圖自帶灰框需以微幅裁邊隱藏，不改原圖顏色')
assert(component.includes('KITCHEN_EQUIPMENT_CUTOUTS[equipment.image] || equipment.image'), '去背只替換已知舊網址，未來後台換圖應保留')
assert(component.includes('title-${heroTransition}') && component.includes('heroTransition.value += 1'), '標題動畫必須隨輪播重啟')
assert(!component.includes('@mouseenter') && !component.includes('@mouseover'), '滑鼠懸停不可暫停輪播')
assert(component.includes('handleSuiteKeydown') && component.includes("event.key === 'ArrowDown'"), '套系須支援鍵盤')
assert(component.includes('.ai-equipment__image :deep(img) { transition: opacity .35s ease; }') && component.includes('a.ai-equipment__card:hover .ai-equipment__image :deep(img) { opacity: .6; }'), '推薦廚電僅讓可點擊圖片柔和淡化，不淡化文字、箭頭或錯誤提示')
assert(component.includes('@media (min-width: 768px) and (hover: hover) and (pointer: fine)') && component.includes('a.ai-equipment__card:focus-visible .ai-equipment__image :deep(img) { opacity: .6; }'), '淡化需支援鍵盤且避免手機觸控黏住 Hover')
assert(component.slice(component.indexOf('@media (prefers-reduced-motion: reduce)')).includes('.ai-equipment__image :deep(img)'), '減少動態偏好需停用圖片淡化轉場')
console.log(`PASS 10 系列、SSR、404、${images.size} 圖片${process.argv.includes('--images') ? ' HTTP 檢查' : '來源檢查'}、動畫與鍵盤回歸`)
