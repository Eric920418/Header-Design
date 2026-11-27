import assert from 'node:assert/strict'
import {readFile} from 'node:fs/promises'
import {clarifySharedBlock,focusedSharedSetting,previewFieldRole,sharedFields} from '../shared/cms/shared-settings.mjs'
import {pageEditors,pageBlocks} from '../shared/cms/page-editors.mjs'
import {workbenchBlocks,pagePositionContent} from '../shared/cms/workbench.mjs'
import {editorSchema} from '../server/cms/page-editors.mjs'
import {storeCaseSharedPosition} from '../shared/cms/positions.mjs'
const seed=JSON.parse(await readFile(new URL('../shared/cms/seed.json',import.meta.url)))
const docs=seed.map(d=>({...d,body:d.data,schema:editorSchema({...d,schemaJson:JSON.stringify(d.schema)})}))
const snapshot=JSON.stringify(docs),bodies=Object.fromEntries(docs.map(d=>[d.id,d.body]))
let count=0
for(const page of pageEditors)for(const block of workbenchBlocks(page.id,pageBlocks(page,docs))){
 const before=JSON.stringify(block),clarified=clarifySharedBlock(page.id,block)
 assert.deepEqual(clarified,block,'Presentation decoration must be idempotent: '+block.id)
 assert.equal(JSON.stringify(block),before)
 for(const f of sharedFields(clarified)){
  assert(f.schema.sharedSetting,block.id+':'+f.path)
  const meta=f.schema.sharedSetting
  assert(meta.sourceLabel&&meta.scope&&meta.location)
  assert(f.schema.help.includes('官網位置：'))
  const target=focusedSharedSetting(clarified,bodies,f.path,f.documentId)
  assert.equal(target.path,f.path)
  assert.equal(target.documentId,f.documentId)
  assert.equal(target.label,f.label)
  assert.deepEqual(target.value,f.path.split('.').reduce((v,k)=>v?.[k],bodies[f.documentId]))
  count++
 }
}
assert.equal(JSON.stringify(docs),snapshot,'No stored schema, value or destination may change')
const block=(page,id)=>workbenchBlocks(page,pageBlocks(pageEditors.find(p=>p.id===page),docs)).find(b=>b.id===id)
const field=(page,id,path)=>block(page,id).fields.find(f=>f.path===path)
assert.equal(previewFieldRole({label:'分類按鈕上方的標題文字',schema:{}}),'heading')
assert.equal(previewFieldRole({label:'一般文章上方返回文字',schema:{}}),'button')
const catalogue=block('series-catalogue','series-catalogue:型錄管理')
const sample=structuredClone(catalogue);sample.fields.find(f=>f.path==='copy.text3').label='標題旁的預覽按鈕文字'
assert.equal(pagePositionContent(sample,bodies).buttons.find(f=>f.path==='copy.text3').role,'button','Location wording must not turn a button into a heading')
const hardware=field('product-catalogue','product-catalogue:型錄管理','copy.kitchenwareTitle')
assert.equal(hardware.schema.sharedSetting.retainSelection,true)
assert.equal(hardware.schema.sharedSetting.scope,'僅廚房配備型錄卡片使用')
assert.equal(field('visuals','visuals:共用主視覺背景','images.asset_7692def0').schema.sharedSetting.href,'/news#news-page-title')
assert.equal(field('franchise','franchise:加盟資格與條件','copy.text47').schema.sharedSetting.href,'/franchising/intro#franchise-qualification-title')
const store=block('store-cases','store-cases:頁面共用設定'),absent=structuredClone(bodies)
absent['data-storeCases'].storeCases.forEach(row=>{delete row.meta?.household})
assert.equal(focusedSharedSetting(store,absent,'metaLabels.household').inactive,true)
absent['data-storeCases'].storeCases[0].meta.household='3人'
assert.equal(focusedSharedSetting(store,absent,'metaLabels.household').inactive,false)
assert.equal(storeCaseSharedPosition(store,{},'案例規格','','metaLabels.household').previewPage,store.href.split('#')[0]+'#case-spec-title')
assert.equal(focusedSharedSetting(store,bodies,'seo.title'),undefined)
const header=block('menu','menu:左側主導覽'),row=bodies['view-components-SiteHeader'].leftNav.find(i=>Array.isArray(i.mega))
assert(pagePositionContent(header,bodies,{}, {value:row}).buttons.some(f=>f.path==='copy.text2'))
assert.equal(JSON.stringify(docs),snapshot)
console.log(`PASS ${count} common field roots: immutable/idempotent labels, explicit locations and scope, stable source roles, conditional absent specs, per-card selection, original values and live-page anchors`)
