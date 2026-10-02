// Read-only regression check. Requires the local dev server and published local CMS.
import assert from 'node:assert/strict'
import {readFile} from 'node:fs/promises'
import {createHash} from 'node:crypto'
import sharp from 'sharp'
import {franchiseInitialValues,franchiseChoiceGroups,franchiseErrors} from '../shared/franchise-form.mjs'

const base=process.env.TEST_BASE_URL||'http://localhost:3100'
assert(['localhost','127.0.0.1'].includes(new URL(base).hostname),'僅測試本機')
const config=await readFile(new URL('../nuxt.config.ts',import.meta.url),'utf8')
const password=process.env.PREVIEW_PASSWORD||/previewPassword: '([^']+)'/.exec(config)?.[1]
const login=await fetch(`${base}/api/preview-access`,{signal:AbortSignal.timeout(45000),method:'POST',headers:{'content-type':'application/json'},body:JSON.stringify({password})})
assert.equal(login.status,200)
const cookie=login.headers.getSetCookie().map(v=>v.split(';')[0]).join('; ')
async function get(path,status=200){const r=await fetch(base+path,{signal:AbortSignal.timeout(45000),headers:{cookie}});assert.equal(r.status,status,path);return r}
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
const benefits=await readFile(new URL('../components/internal/BrandBenefits.vue',import.meta.url),'utf8')
assert(!benefits.includes('is-scroll-story')&&!benefits.includes("addEventListener('scroll'"),'品牌特色不得依賴滾動進度')
assert(benefits.includes('12s ease-in-out infinite'),'品牌特色必須循環自動播放')
for(const name of ['first','second','third'])assert(benefits.includes('@keyframes benefit-'+name))
assert(benefits.includes('0%, 25%, 100%')&&benefits.includes('0%, 50%, 100%'),'02 與 03 必須依序延後出現')
assert(benefits.includes('prefers-reduced-motion: no-preference'),'減少動態效果必須保留靜態內容')
const advantage=await(await get('/about/advantage')).text()
assert.equal((advantage.match(/class="brand-benefit-card"/g)||[]).length,3,'SSR 必須提供三張卡片內容')
console.log('PASS 品牌特色自動依序播放設定、靜態 SSR 內容與減少動態效果')
const exhibition=await(await get('/about/exhibition')).text()
assert(exhibition.includes('href="/builders#appointment"'),'品牌館預約 CTA 必須連至建商表單錨點')
assert(exhibition.includes('※ 本預約服務限建商合作夥伴使用'))
assert(exhibition.includes('aria-describedby="pavilion-booking-notice"'))
assert((await(await get('/builders')).text()).includes('id="appointment"'),'目標表單區塊必須存在')
const buildersHtml=await(await get('/builders')).text()
assert(/id="builder-form-heading"[^>]*>預約品牌館參訪<\/h3>/.test(buildersHtml),'建商表單標題需為預約品牌館參訪')
const builderCataloguesHtml=await(await get('/builders/catalogues')).text()
assert(/<p class="builder-catalogue-notice"[^>]*><span[^>]*>本專區型錄僅供建設公司、工程專案及設計師等大宗採購參考。<\/span><span[^>]*>若有個人家用需求，歡迎至櫻花整體廚房門市選購。<\/span><\/p>/.test(builderCataloguesHtml),'建商型錄用途警語需完整顯示')
assert(builderCataloguesHtml.includes('aria-label="開啟 2026 建商專區型錄 PDF"')&&builderCataloguesHtml.includes('download="SAKURA-建商專區型錄-2026.pdf"'),'建商型錄預覽與下載入口需保留')
const buildersAside=/class="builders-hero__aside[^\"]*"[^>]*>(.*?)<\/div>/s.exec(buildersHtml)?.[1]
assert(buildersAside&&!/<p(?:\s|>)/.test(buildersAside)&&buildersAside.includes('href="#appointment"'),'建商 Hero 刪除說明但保留聯繫 CTA')
assert(buildersAside.includes('立即預約')&&!buildersAside.includes('專人聯繫'),'建商 Hero CTA 文案需為立即預約')
assert(/id="builders-team-title"[^>]*><strong[^>]*>嚴選國內外優質品牌<\/strong><span[^>]*>打造不同定位與多元風格的理想家居空間<\/span>/.test(buildersHtml),'建商品牌區需呈現兩行中文標題')
const solutions=/id="builders-solutions"[^>]*>(.*?)<section class="builders-partners"/s.exec(buildersHtml)?.[1]
assert(solutions,'建商分段圖文區塊必須存在')
const proposalImages=['design-modules.webp','ai-factory.webp','project-platform.webp','home-in-one.webp','dedicated-services.webp','icare.webp']
let previousImage=-1
for(const image of proposalImages){
 const src='/section-6/builders/proposal-20261002/'+image
 const at=solutions.indexOf('src="'+src+'"')
 assert(at>previousImage,'素材順序不符：'+image)
 assert.equal(solutions.split('src="'+src+'"').length-1,1,'素材不得重複：'+image)
 previousImage=at
 const bytes=Buffer.from(await(await get(src)).arrayBuffer()),meta=await sharp(bytes).metadata()
 assert.equal(meta.format,'webp');assert(meta.width>=1280&&bytes.length<2*1024*1024)
}
assert.equal((solutions.match(/class="builders-service"/g)||[]).length,3)
assert(solutions.includes('45+萬')&&solutions.includes('AI智能')&&solutions.includes('管理平台'))
assert(!solutions.includes('builders-strength')&&!solutions.includes('One-Click Registration'))
assert(/class="section-pill section-pill--dark"[^>]*>.*?Property Developers/.test(buildersHtml),'建商 Hero 必須保留原有膠囊小標籤')
assert(buildersHtml.includes('櫻花 HOME IN O.N.E'))
assert(/id="builders-title"[^>]*><span[^>]*>提供一站式整體解決方案<\/span><br[^>]*>為建案提升價值與銷售力/.test(buildersHtml),'建商標題金色需在第一段')
assert(!buildersHtml.includes('Find Your Inspired'))
const buildersSource=await readFile(new URL('../pages/builders/index.vue',import.meta.url),'utf8')
assert(buildersSource.includes('font-weight: 700; line-height: 1.6')&&buildersSource.includes('color: #c4a574'))
assert((await readFile(new URL('../assets/css/main.css',import.meta.url),'utf8')).includes('.franchise-hero, .builders-hero)'),'建商 Hero 不得被全站 80px 覆蓋')
const scroll=await readFile(new URL('../app/router.options.ts',import.meta.url),'utf8')
assert(/el: to.hash, top, behavior: 'instant'/.test(scroll),'錨點需直接定位，避免原生平滑捲動中斷')
assert(scroll.includes("hookOnce('page:loading:end'"),'跨頁錨點必須等待 CMS 頁面完成渲染')
console.log('PASS 品牌館預約 CTA、警語與目標錨點／直接定位設定')
const introduction=await readFile(new URL('../pages/about/introduce.vue',import.meta.url),'utf8')
const moveSource=introduction.slice(introduction.indexOf('function moveHistory('),introduction.indexOf('function updateHistoryFocus(')).replace('direction: number','direction')
const calls=[],motion={value:false}
let next=true,prev=true
const historyApi={value:{canScrollNext:()=>next,canScrollPrev:()=>prev,scrollNext:()=>calls.push(['next']),scrollPrev:()=>calls.push(['prev']),scrollTo:(index,jump)=>calls.push(['to',index,jump]),scrollSnapList:()=>Array(9)}}
const move=new Function('historyEmblaApi','reducedMotion',moveSource+'; return moveHistory')(historyApi,motion)
move(1);next=false;move(1);move(-1);prev=false;move(-1);motion.value=true;move(1)
assert.deepEqual(calls,[['next'],['to',0,false],['prev'],['to',8,false],['to',0,true]])
historyApi.value=undefined;move(1)
assert(introduction.includes("event.target.matches(':focus-visible')"),'滑鼠點按焦點不可停止紀事自動播放')
assert(introduction.includes('if (!historyPaused.value) moveHistory(1)'))
const historyTemplate=introduction.slice(introduction.indexOf('<section class="about-history"'),introduction.indexOf('<section class="about-values'))
assert(!historyTemplate.includes('@mouseenter')&&!historyTemplate.includes('class="about-history__card ev"'),'Hover 不得暫停，逐卡 reveal 不得干擾輪播位移')
console.log('PASS 品牌紀事首尾回捲、無 API／減少動態效果與滑鼠焦點規則')
const franchise=await readFile(new URL('../pages/franchising/intro.vue',import.meta.url),'utf8')
const stories=(await content('data-franchise')).franchiseMarketingStories
assert.equal(stories.length,5,'行銷案例必須保留五筆')
assert.deepEqual(stories.map(s=>s.shortTitle),['藝人 袁艾菲','藝人 小蠻與邵翔','藝人 徐凱希','藝人 荳荳','藝人 鍾欣怡'])
for(const story of stories){const r=await fetch(base+story.image,{method:'HEAD',headers:{cookie}});assert.equal(r.status,200,story.image)}
const franchiseHtml=await(await get('/franchising/intro')).text()
assert.equal((franchiseHtml.match(/class="project-block"/g)||[]).length,5,'SSR 必須輸出五張行銷卡片')
assert(franchiseHtml.includes('暫停輪播')&&franchiseHtml.includes('下一個行銷案例'))
assert(franchise.includes("loop: true, slidesToScroll: 1"),'行銷案例必須首尾循環')
assert(franchise.includes('if (!marketingPaused.value) scrollMarketing(1)')&&franchise.includes('if (api && !isReduced)'),'行銷輪播必須支援暫停與減少動態效果')
const marketingTemplate=franchise.slice(franchise.indexOf('<div v-reveal="{ anim: \'fadeIn\' }" class="franchise-project-carousel">'),franchise.indexOf('<!-- PPT 6.1'))
assert(marketingTemplate.includes('ref="marketingViewport"')&&!marketingTemplate.includes('@mouseenter')&&!marketingTemplate.includes('delay: (index % 3)'),'Hover 與逐卡動畫不得干擾行銷輪播')
const marketingSource=franchise.slice(franchise.indexOf('const scrollMarketing ='),franchise.indexOf('watch([marketingApi')).replace('direction: -1 | 1','direction')
const marketingCalls=[],marketingMotion={value:false},marketingApi={value:{scrollNext:jump=>marketingCalls.push(['next',jump]),scrollPrev:jump=>marketingCalls.push(['prev',jump])}}
const moveMarketing=new Function('marketingApi','reducedMotion',marketingSource+';return scrollMarketing')(marketingApi,marketingMotion)
moveMarketing(1);moveMarketing(-1);marketingMotion.value=true;moveMarketing(1);marketingApi.value=undefined;moveMarketing(1);moveMarketing(-1)
assert.deepEqual(marketingCalls,[['next',false],['prev',false],['next',true]])
console.log('PASS 五筆行銷案例／圖片、SSR、自動循環設定、暫停、方向與減少動態效果')
const application=franchiseInitialValues()
Object.assign(application,{name:'測試姓名',email:'test@example.test',phone:'0912345678',experience:'否',budget:'200萬以下',area:'台北市',timeline:'半年內',consent:true})
for(const group of franchiseChoiceGroups)application[group.key]=group.multiple?(group.optional?[]:[group.options[0]]):group.options[0]
Object.assign(application,{storeAddress:'台北市測試路 1 號',storeWidth:'4.5',storeArea:'30'})
assert.deepEqual(franchiseErrors(application),{})
assert.deepEqual(franchiseErrors({...application,residence:undefined,lineId:undefined,motivation:undefined,sources:undefined}),{})
for(const group of franchiseChoiceGroups){
 assert(franchiseErrors({...application,[group.key]:group.multiple?['非法選項']:'非法選項'})[group.key],group.key)
 if(group.multiple){
  assert(franchiseErrors({...application,[group.key]:group.options[0]})[group.key])
  assert(franchiseErrors({...application,[group.key]:[group.options[0],group.options[0]]})[group.key])
 }
 if(!group.optional)assert(franchiseErrors({...application,[group.key]:group.multiple?[]:''})[group.key])
}
for(const value of ['0','-1','NaN','Infinity','100001','3.456'])assert(franchiseErrors({...application,storeArea:value}).storeArea)
assert(franchiseErrors({...application,storeAddress:''}).storeAddress)
assert.deepEqual(franchiseErrors({...application,storeType:'承租店面',storeAddress:'',storeWidth:'',storeArea:''}),{})
assert(franchiseErrors({...application,motivation:'x'.repeat(4001)}).motivation)
assert(franchiseErrors({...application,experience:'偽造值'}).experience)
assert(franchiseErrors({...application,consent:false}).consent)
const applicationHtml=await(await get('/franchising/form')).text()
for(const group of franchiseChoiceGroups)assert(applicationHtml.includes(group.label),group.label)
assert(applicationHtml.includes('個人資料')&&applicationHtml.includes('加盟規劃')&&applicationHtml.includes('可複選'))
assert(!applicationHtml.includes('所有欄位皆為必填'))
const invalidApplication=await fetch(base+'/api/forms/franchise',{method:'POST',headers:{cookie,origin:base,'content-type':'application/json','idempotency-key':crypto.randomUUID()},body:JSON.stringify({...application,team:['非法選項']})})
assert.equal(invalidApplication.status,400)
assert((await invalidApplication.text()).includes('經營團隊'))
console.log('PASS 加盟欄位 SSR、共用必填／複選／長度／條件驗證與 API 非法選項拒收')
console.log('PASS 背景、君璽圖、英文小標、28 案例／篩選／門市返回連結、錯誤參數、PDF 預覽下載一致、翻牌鎖定規則')
