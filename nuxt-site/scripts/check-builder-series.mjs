import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import ts from 'typescript'
import sharp from 'sharp'
import {validate} from '../server/cms/content.mjs'
import {BUILDER_SERIES_ID,builderSeriesSchema,builderSeriesImages} from '../shared/cms/builder-series.mjs'
import {updateBuilderSeries} from './update-builder-series-20261020.mjs'

const read=path=>readFileSync(new URL(path,import.meta.url),'utf8')
const series=JSON.parse(read('../data/builderKitchenSeries.json'))
const source=read('../pages/builders/sakura-kitchen.vue')
const original=JSON.parse(source.match(/useCmsResource\('view-pages-builders-sakura-kitchen', (.+)\)/)[1])
const before=structuredClone(original)
const schema={type:'object',fields:{series:{type:'array',min:1,item:{type:'object',fields:{name:{type:'string'},image:{type:'string',format:'media'}},required:['name','image']}}},required:['series']}
const schemaBefore=structuredClone(schema)
const effective=builderSeriesSchema(BUILDER_SERIES_ID,schema)
assert.equal(builderSeriesSchema('unrelated',schema),schema)
assert.deepEqual(schema,schemaBefore)
validate({series:original.series},effective)
validate({series},effective)
assert.throws(()=>validate({series:[{...series[0],images:['javascript:alert(1)']}]},effective),/不安全/)
assert.throws(()=>validate({series:[{...series[0],images:['/../private']}]},effective),/不安全/)
assert.throws(()=>validate({series:[{...series[0],unexpected:true}]},effective),/不支援/)
const updated=updateBuilderSeries(original,series)
assert.deepEqual(original,before)
assert.deepEqual({...updated,series:original.series},original)
assert.equal(updateBuilderSeries(updated,series),updated)
assert.throws(()=>updateBuilderSeries({...original,series:[{name:'自訂內容',image:'/custom.webp'}]},series),/另行修改/)
assert.throws(()=>updateBuilderSeries(original,series.slice(1)),/8組/)
const duplicate=structuredClone(series);duplicate[1].name=duplicate[0].name
assert.throws(()=>updateBuilderSeries(original,duplicate),/不可重複/)
assert.deepEqual(series.map(i=>i.name),['足元抽套系 01','足元抽套系 02','原色系列 01','原色系列 02','原色系列 03','原色系列 04','溯光系列','靚雅系列'])
assert.deepEqual(series.map(i=>i.subtitle),['HORIZON','HORIZON',...Array(4).fill('NEUTRAL COLOR'),'LUMINOUS SPACE','MODERN CHIC'])
assert.equal(new Set(series.flatMap(i=>i.images)).size,18)
assert.deepEqual(builderSeriesImages(undefined),[])
assert.deepEqual(builderSeriesImages({image:'/old.webp',images:[]}),['/old.webp'])
assert.equal(builderSeriesImages(series[0]),series[0].images)
for(const item of series){
  assert.equal(item.image,item.images[0])
  for(const [index,path] of item.images.entries()){
    assert(path.endsWith(`-${index+1}.webp`))
    const metadata=await sharp(new URL('../../public'+path,import.meta.url).pathname).metadata()
    assert.equal(metadata.format,'webp');assert.equal(metadata.width,2400)
  }
}
for(const path of ['../server/cms/content.mjs','../server/api/admin/[...path].ts'])assert(read(path).includes('builderSeriesSchema('),'CMS讀取與修改都需使用同一可選schema')
assert(read('../nuxt.config.ts').includes('store-location|builder-series'),'共用schema必須內嵌Nitro，避免dev載入工作區外路徑')

// Execute the page's actual handlers with native-dialog/focus stubs; not a browser acceptance test.
const handlers=source.slice(source.indexOf('async function openSeries'),source.indexOf('useSeoMeta('))
const js=ts.transpileModule(handlers,{compilerOptions:{target:ts.ScriptTarget.ES2022}}).outputText
let opens=0,closes=0,focuses=0
const dialog={open:false,showModal(){this.open=true;opens++},close(){this.open=false;closes++}}
const selected={value:undefined},active={value:99},images={get value(){return builderSeriesImages(selected.value)}}
const controls=new Function('seriesDialog','selectedSeries','activeImageIndex','selectedImages','nextTick',`let seriesOpener;${js};return {openSeries,moveSeriesImage,closeSeries,finishSeriesClose}`)({value:dialog},selected,active,images,()=>Promise.resolve())
const opener={isConnected:true,focus(options){assert.deepEqual(options,{preventScroll:true});focuses++}}
await controls.openSeries(series[0],{currentTarget:opener})
assert.equal(opens,1);assert.equal(active.value,0);assert.equal(selected.value,series[0])
controls.moveSeriesImage(-1);assert.equal(active.value,1)
controls.moveSeriesImage(1);assert.equal(active.value,0)
controls.closeSeries();controls.finishSeriesClose()
assert.equal(closes,1);assert.equal(focuses,1);assert.equal(selected.value,undefined)
await controls.openSeries(series[6],{currentTarget:opener})
assert.equal(active.value,0);controls.moveSeriesImage(-1);assert.equal(active.value,2)
controls.moveSeriesImage(1);assert.equal(active.value,0)
opener.isConnected=false;controls.closeSeries();controls.finishSeriesClose();assert.equal(focuses,1)
selected.value={image:'/old.webp'};active.value=0;controls.moveSeriesImage(1);assert.equal(active.value,0)
selected.value=undefined;controls.moveSeriesImage(-1);assert.equal(active.value,0)
for(const binding of ['aria-haspopup="dialog"','@click.self="closeSeries"','@cancel.prevent="closeSeries"','@close="finishSeriesClose"','@keydown.left.prevent="moveSeriesImage(-1)"','@keydown.right.prevent="moveSeriesImage(1)"','aria-live="polite"','autofocus','eager fit="contain"','data-lenis-prevent'])assert(source.includes(binding),binding)
assert(/\.sakura-kitchen-series__card h3 \{[^}]*font-family: var\(--font-brand-serif\);[^}]*font-size: 26px;/.test(source),'保留字型與桌機字級')
assert(source.includes('grid-template-columns: repeat(3, minmax(0, 1fr))')&&source.includes('grid-template-columns: 1fr;'),'桌機三欄／手機單欄')
assert(source.includes('width: 44px; height: 44px;')&&source.includes('html:has(.builder-series-dialog[open])'),'觸控目標與背景捲動鎖')
console.log('PASS 8 groups / 18 assets; optional CMS schema and legacy compatibility; safe/idempotent update; actual modal handler boundaries, focus and source semantics (not browser QA)')

if(process.argv.includes('--http')){
  const origin='http://127.0.0.1:3100'
  const password=read('../nuxt.config.ts').match(/previewPassword:\s*['"]([^'"]+)['"]/)?.[1]
  const login=await fetch(origin+'/api/preview-access',{method:'POST',headers:{'content-type':'application/json'},body:JSON.stringify({password}),signal:AbortSignal.timeout(45000)})
  assert.equal(login.status,200,await login.text())
  const cookie=login.headers.getSetCookie().map(s=>s.split(';')[0]).join('; ')
  const get=async path=>{
    const response=await fetch(origin+path,{headers:{cookie},signal:AbortSignal.timeout(45000)})
    assert.equal(response.status,200,path)
    return response
  }
  const body=await(await get('/api/content/'+BUILDER_SERIES_ID)).json()
  assert.deepEqual(body.series,series,'已發布API必須為真實8組相簿，不能只改Vue樣本')
  assert.deepEqual({...body,series:original.series},original,'其他Hero／文案／預約保持不變')
  const html=await(await get('/builders/sakura-kitchen')).text()
  const cards=[...html.matchAll(/<article\b[^>]*class="sakura-kitchen-series__card(?:\s[^\"]*)?"[^>]*>([\s\S]*?)<\/article>/g)]
  assert.equal(cards.length,8)
  for(const [index,card] of cards.entries()){
    const item=series[index]
    assert(card[1].includes(item.image)&&card[1].includes(item.name)&&card[1].includes(item.subtitle))
    assert(card[1].includes('aria-haspopup="dialog"')&&card[1].includes(`查看${item.name} ${item.subtitle}系列圖片`))
  }
  const dialogTag=html.match(/<dialog\b[^>]*>/)?.[0]
  assert(dialogTag&&!/\sopen(?:\s|[=>])/.test(dialogTag),'SSR彈窗初始關閉')
  assert.equal((html.match(/href="\/builders#appointment"/g)||[]).length,3,'三處預約入口保留')
  await Promise.all(series.flatMap(item=>item.images).map(async path=>{
    const response=await get(path)
    assert.match(response.headers.get('content-type'),/image\/webp/)
    assert((await response.arrayBuffer()).byteLength>10000)
  }))
  console.log('PASS actual local published API + SSR: 8 cards, bilingual names, covers, closed native dialog, 3 unchanged booking links; all 18 image URLs return WebP 200')
}
