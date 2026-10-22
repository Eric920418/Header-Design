// Read-only acceptance against the requested origin, never the local CMS as a proxy for production.
import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import {transpileModule,ScriptTarget,ModuleKind} from 'typescript'
import {normalizeClass,normalizeStyle} from 'vue'

const footerSource=readFileSync(new URL('../components/SiteFooter.vue',import.meta.url),'utf8')
assert(footerSource.includes('class="footer-logo-mask absolute bottom-[30px] left-1/2 z-10 w-[calc(100%-30px)] max-w-[1410px] -translate-x-1/2 overflow-hidden"'),'Footer Logo保留原尺寸與位置，另設向上顯示遮罩')
assert(footerSource.includes('<div v-reveal="{ anim: \'slideInUp\', viewportEdge: true }" class="footer-logo-reveal">'),'動畫必須掛在Footer Logo，不是首頁Kitchen')
assert(footerSource.includes(':src="cmsCopy.copy.field13" :alt="cmsCopy.copy.field14" width="3156" height="245"'),'保留CMS Logo與替代文字，用圖片原比例預留觀察範圍')
const revealTs=readFileSync(new URL('../plugins/reveal.ts',import.meta.url),'utf8')
const revealJs=transpileModule(revealTs,{compilerOptions:{target:ScriptTarget.ES2022,module:ModuleKind.ESNext}}).outputText
  .replace(/^import .* from ['"]vue['"];?\s*$/m,'').replace('export default defineNuxtPlugin','return defineNuxtPlugin')
function checkReveal({edge=false,top=940,reduced=false,observer=true}={}){
  const classes=new Set(),frames=[];let directive,io
  const element={dataset:{},style:{},classList:{add:(...items)=>items.forEach(item=>classes.add(item)),remove:(...items)=>items.forEach(item=>classes.delete(item)),contains:item=>classes.has(item)},getBoundingClientRect:()=>({top})}
  class Observer {constructor(callback,options){this.callback=callback;this.options=options;this.disconnects=0;io=this}observe(el){this.element=el}disconnect(){this.disconnects++}}
  const plugin=new Function('defineNuxtPlugin','normalizeClass','normalizeStyle','window','IntersectionObserver','requestAnimationFrame',revealJs)(fn=>fn,normalizeClass,normalizeStyle,{innerHeight:1000,matchMedia:()=>({matches:reduced}),...(observer?{IntersectionObserver:Observer}:{})},Observer,fn=>frames.push(fn))
  plugin({vueApp:{directive:(_name,value)=>directive=value}})
  directive.mounted(element,{value:{anim:'slideInUp',viewportEdge:edge}})
  const flush=()=>{while(frames.length)frames.shift()()};flush()
  return {classes,io,element,flush,unmount:()=>directive.beforeUnmount(element)}
}
const footerAtBottom=checkReveal({edge:true})
assert.equal(footerAtBottom.io.options.rootMargin,'0px');assert(footerAtBottom.classes.has('is-visible'),'Logo貼底仍需觸發');assert.equal(footerAtBottom.io.disconnects,1)
const normalAtBottom=checkReveal()
assert.equal(normalAtBottom.io.options.rootMargin,'0px 0px -10% 0px');assert(!normalAtBottom.classes.has('is-visible'),'其他區塊原90%觸發點不變');normalAtBottom.unmount();assert.equal(normalAtBottom.io.disconnects,1)
const offscreen=checkReveal({edge:true,top:1100})
assert(!offscreen.classes.has('is-visible'),'Footer未進入畫面不得先播完');offscreen.io.callback([{isIntersecting:true}]);offscreen.flush();assert(offscreen.classes.has('is-visible'));assert.equal(offscreen.io.disconnects,1)
for(const option of [{edge:true,reduced:true},{edge:true,observer:false}]){const result=checkReveal(option);assert(result.classes.has('is-visible'));assert(!result.io)}
console.log('PASS Footer Logo upward-reveal target, bottom-edge observer, offscreen wait, original default, reduced motion and cleanup')

const base=new URL(process.env.TEST_BASE_URL||'http://localhost:3100')
assert(['http:','https:'].includes(base.protocol)&&!base.username&&!base.password&&base.pathname==='/'&&!base.search&&!base.hash,'只能指定完整網站origin')
assert(['localhost','127.0.0.1','sakura-demo-vanlantech.com','header-design-two.vercel.app'].includes(base.hostname),'只允許本機或兩個既有正式網域，禁止將預覽密碼傳至其他網站')
assert(['localhost','127.0.0.1'].includes(base.hostname)||base.protocol==='https:'&&!base.port,'正式網站必須使用標準HTTPS')
const password=process.env.PREVIEW_PASSWORD||readFileSync(new URL('../nuxt.config.ts',import.meta.url),'utf8').match(/previewPassword:\s*['"]([^'"]+)['"]/)?.[1]
assert(password,'找不到既有預覽登入設定')
const login=await fetch(new URL('/api/preview-access',base),{method:'POST',redirect:'error',headers:{'content-type':'application/json'},body:JSON.stringify({password}),signal:AbortSignal.timeout(45000)})
assert.equal(login.status,200,base.origin+' 預覽登入失敗')
const cookie=login.headers.getSetCookie().map(s=>s.split(';')[0]).join('; ')
async function get(path){
 const response=await fetch(new URL(path,base),{redirect:'error',headers:{cookie},signal:AbortSignal.timeout(45000)})
 assert.equal(response.status,200,base.origin+path+' HTTP錯誤')
 return response
}
const content=await(await get('/api/content/view-components-SiteHeader')).json()
const footerContent=await(await get('/api/content/view-components-SiteFooter')).json()
const designLinks=footerContent.sitemapGroups.find(group=>group.title==='設計案例')?.links
assert.equal(designLinks?.find(link=>link[1]==='/home-style/aikitchen')?.[0],'品牌系列',base.origin+' 正式已發布Footer品牌系列名稱錯誤')
const newsLinks=[['優惠活動','/news/activities'],['最新消息','/news/latest'],['媒體影音','/news/video']]
assert.deepEqual(footerContent.sitemapGroups.find(group=>group.title==='優惠消息')?.links,newsLinks,base.origin+' Footer消息分類須為三個指定入口')
const pavilion=content.rightNav.flatMap(item=>item.children||[]).filter(item=>item.to==='/about/exhibition')
assert.equal(pavilion.length,1,base.origin+' 品牌館入口必須唯一')
assert.equal(pavilion[0].label,'櫻花集團品牌館',base.origin+' 正式已發布Header名稱錯誤，不得以本機結果替代')
const franchise=content.rightNav.find(item=>item.to==='/franchising/intro')
assert(franchise,'保留我要加盟分類')
assert.deepEqual(franchise.children.filter(item=>['/franchising/form','/franchising/download'].includes(item.to)),[{label:'加盟申請表單',to:'/franchising/form'},{label:'加盟資料下載',to:'/franchising/download'}],'保留已發布的兩個加盟額外入口')
for(const path of ['/','/news']){
 const html=await(await get(path)).text(),header=html.match(/<header\b[\s\S]*?<\/header>/)?.[0]
 assert(header,base.origin+path+' 主導覽不存在')
 const labels=[...header.matchAll(/<a\b[^>]*href="\/about\/exhibition"[^>]*>([\s\S]*?)<\/a>/g)].map(m=>m[1].replace(/<[^>]+>/g,'').trim())
 assert(labels.length>0&&labels.every(label=>label==='櫻花集團品牌館'),base.origin+path+' 真實SSR主導覽仍為舊名稱')
 assert(header.includes('aria-controls="franchise-extra-desktop"'),'原加盟伸縮箭頭不得消失')
 console.log(`PASS ${base.origin}${path} Header: 櫻花集團品牌館；加盟箭頭及兩筆入口保留`)
 const footer=html.match(/<footer\b[\s\S]*?<\/footer>/)?.[0]
 assert(footer,base.origin+path+' 頁尾不存在')
 assert(/class="footer-logo-reveal ev"[^>]*data-ev="slideInUp"/.test(footer),'正式Footer Logo需真正有slideInUp動畫標記')
 assert(footer.includes('footer-logo-mask')&&footer.includes(`src="${footerContent.copy.field13}"`),'正式Footer遮罩內保留原Logo圖片')
 const footerLabels=[...footer.matchAll(/<a\b[^>]*href="\/home-style\/aikitchen"[^>]*>([\s\S]*?)<\/a>/g)].map(m=>m[1].replace(/<[^>]+>/g,'').trim())
 assert.deepEqual(footerLabels,['品牌系列'],base.origin+path+' 真實Footer品牌系列名稱錯誤')
 const news=[...footer.matchAll(/<section\b[\s\S]*?<\/section>/g)].map(m=>m[0]).find(section=>/<h2\b[^>]*><span[^>]*>優惠消息<\/span><\/h2>/.test(section))||''
 const renderedLinks=[...news.matchAll(/<a\b[^>]*href="([^"]+)"[^>]*>([\s\S]*?)<\/a>/g)].map(m=>[m[2].replace(/<[^>]+>/g,'').trim(),m[1]])
 assert.deepEqual(renderedLinks,newsLinks,base.origin+path+' 真實Footer消息分類錯誤')
 console.log(`PASS ${base.origin}${path} Footer: 品牌系列；優惠活動／最新消息／媒體影音`)
}
for(const [,path] of newsLinks)await get(path)
console.log(`PASS ${base.origin} Footer三個消息分類目的頁HTTP200`)
