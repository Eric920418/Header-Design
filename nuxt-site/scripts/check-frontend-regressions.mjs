// Read-only regression check. Requires the local dev server and published local CMS.
import assert from 'node:assert/strict'
import {readFile} from 'node:fs/promises'
import {createHash} from 'node:crypto'

const base=process.env.TEST_BASE_URL||'http://localhost:3100'
assert(['localhost','127.0.0.1'].includes(new URL(base).hostname),'僅測試本機')
const config=await readFile(new URL('../nuxt.config.ts',import.meta.url),'utf8')
const password=process.env.PREVIEW_PASSWORD||/previewPassword: '([^']+)'/.exec(config)?.[1]
const login=await fetch(`${base}/api/preview-access`,{method:'POST',headers:{'content-type':'application/json'},body:JSON.stringify({password})})
assert.equal(login.status,200)
const cookie=login.headers.getSetCookie().map(v=>v.split(';')[0]).join('; ')
async function get(path,status=200){const r=await fetch(base+path,{headers:{cookie}});assert.equal(r.status,status,path);return r}
const content=async id=>(await get('/api/content/'+id)).json()
const series=await content('data-kitchenSeries')
const styles=await content('data-kitchenStyles')
assert.equal(styles.KITCHEN_STYLES.find(i=>i.slug==='premium').image,series.KITCHEN_SERIES_PAGES.find(i=>i.slug==='premium').heroSlides[0])
assert.equal((await content('view-components-home-HomeWhatWeDo')).copy.text3,'Brand Commitment')

const pages=await Promise.all([1,2,3,4].map(async p=>(await get('/api/design-inspiration/cases?page='+p)).json()))
assert.deepEqual(pages.map(p=>p.items.length),[9,9,9,1])
const cases=pages.flatMap(p=>p.items)
assert.equal(new Set(cases.map(i=>i.id)).size,28)
assert.deepEqual(cases.filter(i=>i.storeSlug).map(i=>i.storeSlug).sort(),['case10','case35','case56'])
const filters=await(await get('/api/design-inspiration/filters')).json()
let empty=false
for(const form of filters.forms)for(const style of filters.styles){
  const result=await(await get('/api/design-inspiration/cases?'+new URLSearchParams({form,style}))).json()
  assert.equal(result.total,cases.filter(i=>i.form===form&&i.style===style).length)
  if(!result.total)empty=true
}
assert(empty)
for(const q of ['page=0','page=5','style=bad','page=1&page=2'])await get('/api/design-inspiration/cases?'+q,400)
for(const item of cases.filter(i=>i.storeSlug)){
  const html=await(await get(`/gallery/${item.storeSlug}?from=inspiration&style=${encodeURIComponent(item.style)}`)).text()
  assert(html.includes('/design-inspiration?style='),'門市故事返回列表遺失篩選')
  assert(html.includes('門市案例'))
}
const html=await(await get('/design-inspiration')).text()
for(const slug of ['case10','case35','case56'])assert(html.includes(`/gallery/${slug}?from=inspiration`))
const catalogue=(await content('data-productCatalogues')).PRODUCT_CATALOGUES.find(i=>i.id==='kitchenware-2026')
const preview=Buffer.from(await(await get(catalogue.pdfUrl)).arrayBuffer())
const download=Buffer.from(await(await get('/api/catalogues/kitchenware-2026')).arrayBuffer())
assert.equal(preview.subarray(0,5).toString(),'%PDF-')
assert(preview.equals(download),'預览與下載必須為同一份 PDF')
const sha=b=>createHash('sha256').update(b).digest('hex')
if(process.env.FRONTEND_ASSET_DIR)assert.equal(sha(preview),sha(await readFile(process.env.FRONTEND_ASSET_DIR+'/櫻花整廚2026廚房配備型錄260909.pdf')))
for(const file of ['../components/home/HomeServices.vue','../components/SiteFooter.vue']){
  const source=await readFile(new URL(file,import.meta.url),'utf8')
  assert(!source.includes('bg-[var(--cms-image'),'背景不得含被空白拆開的 Tailwind 類別')
  assert(source.includes('style="background-image: var(--cms-image-'))
}
const board=await readFile(new URL('../components/home/HomeStoreLocation.vue',import.meta.url),'utf8')
assert(board.includes('const keepSelected = focused.value\n'),'篩選不得鎖定門市')
assert(board.includes('focused.value = false'),'切換篩選應取消鎖定')
console.log('PASS 背景、君璽圖、英文小標、28 案例／篩選／門市返回連結、錯誤參數、PDF 預覽下載一致、翻牌鎖定規則')
