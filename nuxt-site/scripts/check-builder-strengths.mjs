import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import {transpileModule,ScriptTarget,ModuleKind} from 'typescript'

const source=readFileSync(new URL('../pages/builders/index.vue',import.meta.url),'utf8')
assert(!source.includes('@media (max-height: 759px)'),'矮桌機不得直接取消左欄固定')
assert(source.includes('ref="strengthsCopy" class="builders-strengths-copy"'))
assert(source.includes('top: var(--strengths-sticky-top, calc(var(--site-header-height, 60px) + 15px))'))
assert(source.includes('@media (min-width: 768px) and (max-height: 899px)'))
const shortCss=source.slice(source.indexOf('@media (min-width: 768px) and (max-height: 899px)'),source.indexOf('@media (max-width: 767px)'))
assert(!shortCss.includes('font-size:'),'短視窗只能調間距，不能因高度縮字')
assert(source.includes('.builders-strengths-copy { position: static; height: auto; }')&&source.includes('.builders-strengths-content { display: block; min-height: auto; padding: 0; transform: none; }'),'手機維持單欄自然捲動')
assert(source.includes('ref="strengthsContent" class="builders-strengths-content"'))
assert(!source.includes('--strengths-content-scale'),'不得再對左欄整組縮放造成二次縮字')
assert(source.includes('.builders-strengths-copy[data-strengths-overflow="true"] { position: static; }'))
const stickySource=source.slice(source.indexOf('const strengthsCopy ='),source.indexOf('const moduleCounter ='))
assert(stickySource.startsWith('const strengthsCopy ='))
assert(!stickySource.includes("'scroll'")&&!stickySource.includes('scrollTo')&&!stickySource.includes('preventDefault'),'不得攔截右欄或全頁捲動')
const js=transpileModule(stickySource,{compilerOptions:{target:ScriptTarget.ES2022,module:ModuleKind.ESNext}}).outputText
function harness({width=1280,height=720,copyHeight=560,headerHeight=60,observer=true,visual=true,fonts=true}={}){
  const events=()=>({listeners:new Map(),addEventListener(type,fn){this.listeners.set(type,fn)},removeEventListener(type,fn){assert.equal(this.listeners.get(type),fn);this.listeners.delete(type)}})
  const mounted=[],unmounted=[],styles=new Map(),content={offsetHeight:copyHeight},copy={dataset:{},style:{setProperty:(key,value)=>styles.set(key,value),removeProperty:key=>styles.delete(key)}},header={offsetHeight:headerHeight}
  const viewport={...events(),height},window={...events(),innerWidth:width,innerHeight:height,...(visual?{visualViewport:viewport}:{}),...(observer?{ResizeObserver:true}:{})},fontSet=events()
  const document={querySelector:selector=>{assert.equal(selector,'header[data-breadcrumb-root]');return header},...(fonts?{fonts:fontSet}:{})}
  let io
  class Observer{constructor(callback){this.callback=callback;this.targets=[];this.disconnected=false;io=this}observe(target){this.targets.push(target)}disconnect(){this.disconnected=true}}
  const api=new Function('ref','onMounted','onBeforeUnmount','window','document','ResizeObserver',js+';return {strengthsCopy,strengthsContent,updateStrengthsSticky};')(value=>({value}),fn=>mounted.push(fn),fn=>unmounted.push(fn),window,document,Observer)
  api.strengthsCopy.value=copy;api.strengthsContent.value=content;mounted.forEach(fn=>fn())
  return {api,window,viewport,fontSet,styles,copy,content,header,get io(){return io},top:()=>Number.parseFloat(styles.get('--strengths-sticky-top')),unmount:()=>{unmounted.forEach(fn=>fn());api.strengthsCopy.value=undefined;api.strengthsContent.value=undefined}}
}
for(const width of [768,1024,1199,1280,1366,1440,1920])for(const height of [480,600,667,700,720,768,800,900,1080])for(const copyHeight of [320,420,560,684,1000]){
  const test=harness({width,height,copyHeight})
  assert.equal(test.top(),75,'任何高度都不得把中文主標推到導覽上方')
  if(copyHeight<=height-95){
    assert.equal(test.copy.dataset.strengthsOverflow,'false')
    assert(test.top()+copyHeight<=height-20,'固定時頂部與統計底部必須同時可見')
  }else{
    assert.equal(test.copy.dataset.strengthsOverflow,'true','放不下應自然閱讀，不得縮字、負top或裁切')
  }
  assert.equal(Number.parseFloat(test.styles.get('--strengths-copy-height')),copyHeight,'不得用縮小整組的方式讓內容塞進視窗')
  assert.deepEqual(test.io.targets,[test.content,test.header])
  const stable=[...test.styles];test.io.callback();assert.deepEqual([...test.styles],stable,'重複量測不得累積縮放')
  test.unmount();assert(test.io.disconnected);assert.equal(test.window.listeners.size+test.viewport.listeners.size+test.fontSet.listeners.size,0)
}
const resizing=harness();resizing.content.offsetHeight=640;resizing.io.callback();assert.equal(resizing.top(),75);assert.equal(resizing.copy.dataset.strengthsOverflow,'true')
resizing.viewport.height=600;resizing.viewport.listeners.get('resize')();assert.equal(resizing.top(),75);assert.equal(resizing.copy.dataset.strengthsOverflow,'true')
resizing.content.offsetHeight=400;resizing.fontSet.listeners.get('loadingdone')();assert.equal(resizing.copy.dataset.strengthsOverflow,'false')
resizing.header.offsetHeight=80;resizing.io.callback();assert.equal(resizing.top(),95,'導覽高度變更也必須重算')
resizing.window.innerWidth=767;resizing.window.listeners.get('resize')();assert.equal(resizing.styles.size,0,'進入手機版移除桌機位置')
assert.deepEqual(resizing.copy.dataset,{},'手機清除極矮窗狀態')
resizing.window.innerWidth=1280;resizing.window.listeners.get('resize')();assert.equal(resizing.top(),95)
resizing.unmount();const before=[...resizing.styles];resizing.io.callback();assert.deepEqual([...resizing.styles],before,'卸載後遲到回呼不得更新')
const fallback=harness({observer:false,visual:false,fonts:false});assert.equal(fallback.top(),75);fallback.window.innerHeight=600;fallback.window.listeners.get('resize')();assert.equal(fallback.top(),75);assert.equal(fallback.copy.dataset.strengthsOverflow,'true');fallback.unmount()
const boundary=harness({height:695,copyHeight:600});assert.equal(boundary.copy.dataset.strengthsOverflow,'false');boundary.viewport.height=694;boundary.api.updateStrengthsSticky();assert.equal(boundary.copy.dataset.strengthsOverflow,'true');boundary.unmount()
console.log('PASS 315組寬／高／內容尺寸：不依高度縮字或整組縮放、固定時上下同時可見、放不下自然閱讀；字型／導覽重算、手機、穩定量測及卸載清理')
const regression=readFileSync(new URL('./check-frontend-regressions.mjs',import.meta.url),'utf8')
const counter=regression.slice(regression.indexOf('const moduleCounterSource='),regression.indexOf("console.log('PASS 建商Home7雙欄"))
assert(counter.startsWith('const moduleCounterSource='));new Function('assert','buildersSource',counter)(assert,source)
console.log('PASS 原兩秒計數一次、CMS自訂數值、減少動態、無observer及卸載回歸')

const base=new URL(process.env.TEST_BASE_URL||'http://localhost:3100')
assert(['localhost','127.0.0.1','header-design-two.vercel.app','sakura-demo-vanlantech.com'].includes(base.hostname)&&base.pathname==='/'&&!base.username&&!base.password&&!base.search&&!base.hash)
assert(['localhost','127.0.0.1'].includes(base.hostname)||base.protocol==='https:'&&!base.port)
const password=readFileSync(new URL('../nuxt.config.ts',import.meta.url),'utf8').match(/previewPassword: '([^']+)'/)?.[1];assert(password)
const login=await fetch(new URL('/api/preview-access',base),{method:'POST',redirect:'error',headers:{'content-type':'application/json'},body:JSON.stringify({password}),signal:AbortSignal.timeout(30000)});assert.equal(login.status,200)
const cookie=login.headers.getSetCookie().map(value=>value.split(';')[0]).join('; ')
async function get(path,method='GET'){const response=await fetch(new URL(path,base),{method,redirect:'error',headers:{cookie},signal:AbortSignal.timeout(30000)});assert.equal(response.status,200,path);return response}
const cms=await(await get('/api/content/view-pages-builders-index')).json(),html=await(await get('/builders')).text()
const strengths=html.slice(html.indexOf('id="builders-solutions"'),html.indexOf('class="builders-home-one'))
assert(strengths.includes('builders-strengths-copy')&&strengths.includes('builders-strengths-content')&&strengths.includes('智能整合，打造建築新價值')&&strengths.includes('OUR STRENGTHS')&&/Smart Solutions <span\b[^>]*>For<\/span>/.test(strengths)&&strengths.includes('Better Living'))
assert(strengths.includes(`aria-label="${cms.strengths[0].value[0]}+${cms.strengths[0].value[1]}"`))
assert.equal((strengths.match(/class="builders-solution ev/g)||[]).length,3)
let previous=-1
for(const item of cms.strengths){const at=strengths.indexOf(`src="${item.background}"`);assert(at>previous);previous=at;assert.equal(strengths.split(`src="${item.background}"`).length-1,1);await get(item.background,'HEAD')}
assert(html.includes('--strengths-sticky-top')&&html.includes('--strengths-copy-height')&&!html.includes('--strengths-content-scale')&&!html.includes('6.4svh'),'實際SSR必須帶不縮字的量測規則')
assert(!html.includes('max-height:759px'),'正式頁不得仍載入取消固定的舊規則')
const bundles=[...new Set([...html.matchAll(/(?:src|href)="(\/_nuxt\/[^"?#]+\.js)"/g)].map(match=>match[1]))]
assert(bundles.length>0&&bundles.length<=40,'限定檢查此頁實際載入的同站程式包')
let stickyBundle
for(const path of bundles){const code=await(await get(path)).text();if(!code.includes('--strengths-content-scale')&&code.includes('--strengths-copy-height')&&code.includes('header[data-breadcrumb-root]')){stickyBundle=path;break}}
assert(stickyBundle,'實際載入的JS必須移除整組縮放，不只SSR有樣式')
console.log('PASS',base.origin,'建商SSR／實際JS',stickyBundle,'、完整三圖與原文／CMS統計、矮螢幕CSS及圖片HTTP200')
