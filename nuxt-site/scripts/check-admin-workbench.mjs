import assert from 'node:assert/strict'
import {readFile} from 'node:fs/promises'
import {runInNewContext} from 'node:vm'
import {randomUUID} from 'node:crypto'
import ts from 'typescript'
import {ref,reactive,computed,watch,nextTick,effectScope} from 'vue'
import {pageEditors,pageBlocks} from '../shared/cms/page-editors.mjs'
import {editorSchema} from '../server/cms/page-editors.mjs'
import {workbenchBlocks,itemKey,itemCaption,itemThumbnail,positionContent,freshArticleValue} from '../shared/cms/workbench.mjs'
import {valueAt} from '../shared/cms/page-editors.mjs'
import {normalizeVideos} from '../server/cms/content.mjs'
import {readableError} from '../server/cms/workspaces.mjs'
import {editingSchema} from '../shared/cms/presentation.mjs'
const seed=JSON.parse(await readFile(new URL('../shared/cms/seed.json',import.meta.url)))
const docs=seed.map(d=>({...d,body:d.data,schema:editorSchema({...d,schemaJson:JSON.stringify(d.schema)})}))
const newsDoc=docs.find(d=>d.id==='news-articles'),invalid=structuredClone(newsDoc.body);invalid.items[0].detail.videoId='無效網址'
assert.throws(()=>normalizeVideos(invalid,newsDoc.schema),e=>{const issue=readableError(e,newsDoc.id,editingSchema(newsDoc.schema,newsDoc.id),invalid);assert.equal(issue.fieldErrors[0].path,'items.0.detail.videoId');assert.match(issue.message,/YouTube/);assert(issue.message.includes(invalid.items[0].summary.title));return true})
for(const p of pageEditors){
 const old=pageBlocks(p,docs.filter(d=>p.ids.includes(d.id))),before=JSON.stringify(old),next=workbenchBlocks(p.id,old)
 const paths=blocks=>blocks.flatMap(b=>b.fields.map(f=>f.documentId+':'+f.path)).sort()
 assert.deepEqual(paths(next),paths(old),p.id+' must preserve every field exactly once')
 assert.equal(JSON.stringify(old),before,'Display grouping cannot mutate server field definitions')
 for(const b of old)assert(next.some(n=>n.aliases.includes(b.id)),'Old block link missing: '+b.id)
}
const home=workbenchBlocks('home',pageBlocks(pageEditors[0],docs))
assert.deepEqual(home.filter(b=>!b.secondary).map(b=>b.name),['首頁輪播圖片','品牌系列','設計風格圖片','廚房產品','集團品牌標誌','設計案例','品牌承諾','全台門市據點'])
const image='/home-2026/hero/10bn/aikitchen.webp',selected={caption:'AI Kitchen',image,value:{image,description:'介紹'}}
const before=JSON.stringify(selected);assert.equal(positionContent(home[0],{},selected).image,image);assert.equal(JSON.stringify(selected),before)
assert.equal(itemThumbnail({name:'來源商品'},{},{image:'/source.webp'}),'/source.webp')
const source=await readFile(new URL('../components/admin/AdminItems.vue',import.meta.url),'utf8')
const script=source.match(/<script setup[^>]*>([\s\S]*?)<\/script>/)[1].replace(/^import .*$/gm,'')
const code=ts.transpileModule(script+'\nthis.ui={choose,back,item,add,move,remove,rows,active,visible,page,search,itemSchema};',{compilerOptions:{target:ts.ScriptTarget.ES2022}}).outputText
const model=reactive({modelValue:Array.from({length:8},(_,i)=>({id:'row-'+i,title:'內容 '+i,image:'/image.webp'})),schema:{type:'array',label:'輪播內容',item:{type:'object',fields:{id:{type:'string'},title:{type:'string'}}},template:{id:'',title:''}},documentId:'home',path:'slides'})
const state=ref({}),errors=ref([]),workbench={focused:ref(''),editing:ref(''),selection:ref(null),metadata:ref({}),busy:ref(false),select:()=>{}},emitted=[]
const context={ref,computed,watch,nextTick,defineProps:()=>model,defineEmits:()=>((_,v)=>{emitted.push(v);model.modelValue=v}),inject:(key,fallback)=>({'cms-workbench':workbench,'cms-item-selections':state,'cms-field-errors':errors}[key]??fallback),provide:()=>{},valueAt,itemKey,itemCaption,itemThumbnail,freshArticleValue,newStoreId:()=>123,crypto:{randomUUID},CSS:{escape:x=>x},document:{querySelector:()=>null},window:{confirm:()=>true},JSON}
const scope=effectScope();scope.run(()=>runInNewContext(code,context))
await nextTick();const ui=context.ui
assert.equal(ui.visible.value.length,6);assert.equal(workbench.selection.value.caption,'內容 0');assert.equal(workbench.editing.value,'')
ui.choose(ui.rows.value[2]);assert.equal(emitted.length,0);assert.equal(workbench.selection.value.caption,'內容 2');assert.equal(workbench.editing.value,'')
ui.choose(ui.rows.value[2],true);assert.equal(workbench.editing.value,'home:slides')
ui.item(2,{...model.modelValue[2],title:'修改後'});await nextTick();assert.equal(workbench.selection.value.caption,'修改後')
ui.back();assert.equal(workbench.editing.value,'');assert.equal(model.modelValue[2].title,'修改後');assert.equal(ui.active.value.key,'row-2')
ui.page.value=2;await nextTick();assert.equal(ui.visible.value.length,2);assert.equal(ui.active.value.key,'row-6')
ui.search.value='修改後';await nextTick();assert.equal(ui.page.value,1);assert.equal(ui.active.value.key,'row-2')
errors.value=[{documentId:'home',path:'slides.5.title',message:'請填寫'}];await nextTick();assert.equal(ui.active.value.key,'row-5');assert.equal(workbench.editing.value,'home:slides')
model.schema.source=true;assert.equal(ui.itemSchema.value.fields.id.readOnly,true)
errors.value=[];model.documentId='news-articles';model.path='items';model.modelValue=[];model.schema={...docs.find(d=>d.id==='news-articles').schema.fields.items,newCategory:'activities',newItemLabel:'活動'};ui.add();await nextTick()
assert.equal(ui.active.value.value.summary.category,'activities');assert.equal(ui.active.value.value.summary.categoryLabel,'優惠活動');assert.equal(ui.active.value.value.summary.excerpt,'');assert.equal(ui.active.value.value.summary.cover,'');assert.equal(ui.active.value.value.detail.sections.length,0,'New articles must not copy a real existing article')
scope.stop()
console.log('PASS: all 28 pages retain every field and old link; screenshot home order; actual list handlers cover six-row paging, selection without writes, right-pane edits, retained input, error location and source read-only fields')
