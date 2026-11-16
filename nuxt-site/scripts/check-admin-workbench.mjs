import assert from 'node:assert/strict'
import {readFile} from 'node:fs/promises'
import {runInNewContext} from 'node:vm'
import {randomUUID} from 'node:crypto'
import ts from 'typescript'
import {ref,reactive,computed,watch,nextTick,effectScope} from 'vue'
import {pageEditors,pageBlocks} from '../shared/cms/page-editors.mjs'
import {editorSchema} from '../server/cms/page-editors.mjs'
import {workbenchBlocks,itemKey,itemCaption,itemThumbnail,positionContent,freshArticleValue,thumbnailPlaceholder,inspirationPosition,pagePositionContent,homeHeroPosition} from '../shared/cms/workbench.mjs'
import {pagePositions} from '../shared/cms/positions.mjs'
import {firstImage} from '../shared/cms/workflow.mjs'
import {blockThumbnail} from '../shared/cms/page-editors.mjs'
import {valueAt} from '../shared/cms/page-editors.mjs'
import {normalizeVideos,validate} from '../server/cms/content.mjs'
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
 assert(pagePositions[p.id],p.id+' requires an explicit page position')
 for(const b of next.filter(b=>!b.secondary)){
  assert(b.hint&&b.kind,p.id+' '+b.name+' needs a clear purpose and image layout')
  assert(b.positionIndex||p.id==='inspiration',p.id+' '+b.name+' needs an explicit website location')
  assert(!/^(標題與說明|整頁共用文字|列表標題與按鈕|圖片集)$/.test(b.name))
  const values=Object.fromEntries(docs.map(d=>[d.id,d.body])),snapshot=JSON.stringify(values),scene=pagePositionContent(b,values)
  assert.equal(scene.kind,b.kind);assert.equal(JSON.stringify(values),snapshot,'Position views must never change content')
  if(scene.image)assert.match(scene.image,/^(?:\/|https?:|data:image)/)
  assert(!b.fields.some(f=>/版面文字|顯示文字（第|內容欄位/.test(f.label)),p.id+' '+b.name+' contains an unclear field name')
 }
}
const home=workbenchBlocks('home',pageBlocks(pageEditors[0],docs))
assert.deepEqual(home.filter(b=>!b.secondary).map(b=>b.name),['首頁輪播圖片','品牌系列','設計風格圖片','廚房產品','集團品牌標誌','設計案例','品牌承諾','全台門市據點'])
const inspiration=workbenchBlocks('inspiration',pageBlocks(pageEditors.find(p=>p.id==='inspiration'),docs))
assert.deepEqual(inspiration.filter(b=>!b.secondary).map(b=>b.name),['主視覺標題','案例管理與顯示排序','案例篩選列','搜尋結果提示','案例卡片按鈕','無符合案例提示','案例內頁文字'])
assert.deepEqual(inspiration.find(b=>b.preview==='inspiration-card-button').fields.map(f=>f.path),['copy.text8'])
assert(!inspiration.find(b=>b.preview==='inspiration-cases').fields.some(f=>f.path==='copy.text8'))
for(const old of ['案例內容','案例顯示與順序','案例列表','列表標題與按鈕','整頁共用文字'])assert(inspiration.some(b=>b.aliases.includes('inspiration:'+old)))
for(const i of Array.from({length:11},(_,i)=>i+1))assert.equal(inspiration.flatMap(b=>b.fields).filter(f=>f.documentId==='view-pages-design-inspiration-index'&&f.path==='copy.text'+i).length,1)
const filterFields=inspiration.find(b=>b.preview==='inspiration-filters').fields
assert.deepEqual(filterFields.filter(f=>!f.schema.advanced).map(f=>f.label),['型式選單名稱','風格選單名稱','篩選按鈕文字'])
assert(filterFields.find(f=>f.path==='copy.text2').schema.advanced);assert(filterFields.every(f=>f.schema.singleLine))
const previewBodies=Object.fromEntries(docs.map(d=>[d.id,structuredClone(d.body)])),presentation={heroImage:'/hero.jpg',cases:[{title:'真實案例',image:'/case.jpg'}]},serialized=JSON.stringify(presentation)
const heroSchema=home.find(b=>b.id==='home:主視覺輪播').fields.find(f=>f.path==='slides').schema
assert.equal(heroSchema.label,'輪播內容');assert.equal(heroSchema.searchLabel,'搜尋輪播名稱')
const heroBefore=JSON.stringify(previewBodies),heroSelected={documentId:'view-components-home-HomeHero',path:'slides',index:1,value:{image:'/selected-home.webp',title:'所選輪播',description:'目前的介紹',mobileImage:'/mobile-home.webp',desktopFocusX:20}}
const heroScene=homeHeroPosition(previewBodies,heroSelected)
assert.equal(heroScene.slide.title,'所選輪播');assert.equal(heroScene.slide.image,'/selected-home.webp');assert.equal(heroScene.slide.mobileImage,'/mobile-home.webp');assert.equal(heroScene.slide.desktopFocusX,20);assert.equal(heroScene.pan,'4%')
assert.equal(homeHeroPosition(previewBodies).slide.title,previewBodies['view-components-home-HomeHero'].slides[0].title);assert.equal(homeHeroPosition(previewBodies).pan,'-4%');assert.equal(homeHeroPosition({}).slide,undefined)
assert.equal(homeHeroPosition(previewBodies,{documentId:'other',value:{title:'無關內容'}}).slide.title,previewBodies['view-components-home-HomeHero'].slides[0].title);assert.equal(JSON.stringify(previewBodies),heroBefore,'Home position views cannot modify shared content')
assert(homeHeroPosition(previewBodies).styles.length);assert.equal(homeHeroPosition({'view-components-home-HomeStyleMarquee':{styles:[{}],cmsSettings:{visible:false}}}).styles.length,0)
const heroCommon=home.find(b=>b.id==='home:主視覺輪播').fields
assert.equal(heroCommon.find(f=>f.path==='copy.text8').label,'滑過時按鈕文字（第一行）');assert(heroCommon.filter(f=>/^copy.field[1-4]$/.test(f.path)).every(f=>f.schema.advanced))
previewBodies['view-pages-design-inspiration-index'].copy.text5='套用篩選';previewBodies['view-pages-design-inspiration-index'].copy.text9='沒有符合的案例'
const samplePosition=inspirationPosition(previewBodies,presentation)
assert.equal(samplePosition.copy.text5,'套用篩選');assert.equal(samplePosition.copy.text9,'沒有符合的案例');assert.equal(samplePosition.cases[0].title,'真實案例')
assert.equal(inspirationPosition(previewBodies,presentation,{caption:'正在編輯',image:'/selected.jpg'}).cases[0].image,'/selected.jpg');assert.equal(JSON.stringify(presentation),serialized,'The schematic cannot mutate published case samples')
const builders=workbenchBlocks('builders',pageBlocks(pageEditors.find(p=>p.id==='builders'),docs)),builderHero=builders.find(b=>b.name==='頁面最上方')
assert(builderHero.fields.some(f=>f.path==='copy.field6'),'Builder hero image must be beside its heading, not in brand information')
previewBodies['view-pages-builders-index'].copy.text2='目前輸入的建商標題';previewBodies['view-pages-builders-index'].copy.field6='/changed-builder.webp'
const builderScene=pagePositionContent(builderHero,previewBodies,{heroImage:'/published-builder.webp'})
assert(builderScene.text.some(t=>t.value==='目前輸入的建商標題'));assert.equal(builderScene.image,'/changed-builder.webp');assert.equal(builderScene.heroImage,'/changed-builder.webp')
const badBuilder=structuredClone(previewBodies['view-pages-builders-index']);badBuilder.copy.text2=42
const builderSchema=docs.find(d=>d.id==='view-pages-builders-index').schema
assert.throws(()=>validate(badBuilder,builderSchema),e=>{const issue=readableError(e,'view-pages-builders-index',editingSchema(builderSchema,'view-pages-builders-index'),badBuilder);assert.equal(issue.fieldErrors[0].path,'copy.text2');assert.match(issue.message,/主標題第一行/);return true})
const franchise=workbenchBlocks('franchise',pageBlocks(pageEditors.find(p=>p.id==='franchise'),docs))
assert(franchise.find(b=>b.name==='加盟資料下載').fields.some(f=>f.path==='copy.field53'),'Franchise PDF cover belongs to downloads, not FAQ')
const faqScene=pagePositionContent(franchise.find(b=>b.name==='加盟常見問題'),previewBodies,{}, {caption:'申請條件',image:'',value:{question:'如何申請？',answer:'先填表'}})
assert.equal(faqScene.image,'','Text-only selections must not borrow a neighboring photo');assert.equal(faqScene.items[0].value.answer,'先填表')
const pavilion=workbenchBlocks('pavilions',pageBlocks(pageEditors.find(p=>p.id==='pavilions'),docs)).find(b=>b.name==='品牌館空間介紹')
previewBodies['view-pages-about-exhibition'].copy.field7='/right-pavilion-photo.webp'
assert.equal(pagePositionContent(pavilion,previewBodies,{},null,'copy.field7').image,'/right-pavilion-photo.webp','Focusing the second photo must show that photo, not the first one')
assert.notEqual(thumbnailPlaceholder('申請表單'),thumbnailPlaceholder('品牌優勢問答'));assert.notEqual(thumbnailPlaceholder('網站選單'),thumbnailPlaceholder('板材比較'))
const activities=workbenchBlocks('news-activities',pageBlocks(pageEditors.find(p=>p.id==='news-activities'),docs)).find(b=>b.name==='活動管理')
assert.equal(blockThumbnail(activities,previewBodies),previewBodies['news-articles'].items.find(i=>i.summary.category==='activities').summary.cover,'A category thumbnail cannot borrow another category cover')
const products=workbenchBlocks('products-sakura',pageBlocks(pageEditors.find(p=>p.id==='products-sakura'),docs)).find(b=>b.name==='商品顯示與排序')
const productId=previewBodies['catalog-sakura'].items[0].id,productScene=pagePositionContent(products,previewBodies,{rows:{'catalog-sakura':{[productId]:{image:'/real-source-product.webp'}}}})
assert.equal(productScene.thumbnail,'/real-source-product.webp');assert.equal(productScene.items[0].image,'/real-source-product.webp');assert(!previewBodies['catalog-sakura'].items[0].image,'Read-only source images must never become editable content')
assert.equal(itemCaption({year:'1978'},0),'1978 年');assert.equal(itemCaption({value:['45','萬'],lines:['設計模組']},0),'45 萬 · 設計模組')
const sharedService=builders.find(b=>b.name==='三大服務'),serviceScene=pagePositionContent(sharedService,previewBodies,{}, {caption:'專業銷講',image:'',value:{title:'專業銷講'}})
assert.equal(serviceScene.image,'/section-6/builders/proposal-20261002/dedicated-services.webp','A text card may use its explicitly mapped shared section image')
const faqBodies=JSON.stringify(previewBodies),faqContent=pagePositionContent(franchise.find(b=>b.name==='加盟常見問題'),previewBodies,{}, {caption:'如何申請',image:'',value:{question:'如何申請？',answer:'先填表'}})
assert.equal(faqContent.questions[0].answer,'先填表');assert.equal(faqContent.image,'');assert(faqContent.contextImage,'Text-only positions retain the real page context without claiming a borrowed item photo')
assert.equal(JSON.stringify(previewBodies),faqBodies)
assert(builderScene.heading.some(f=>f.value==='目前輸入的建商標題'));assert(!builderScene.bodyText.some(f=>/圖片說明/.test(f.label)))
const articleBlock=workbenchBlocks('news-latest',pageBlocks(pageEditors.find(p=>p.id==='news-latest'),docs)).find(b=>b.name==='文章最上方與返回導覽')
assert.equal(pagePositionContent(articleBlock,previewBodies,{specialImage:'/same-article.webp'}).contextImage,'/same-article.webp')
const image='/home-2026/hero/10bn/aikitchen.webp',selected={caption:'AI Kitchen',image,value:{image,description:'介紹'}}
const before=JSON.stringify(selected);assert.equal(positionContent(home[0],{},selected).image,image);assert.equal(JSON.stringify(selected),before)
assert.equal(itemThumbnail({name:'來源商品'},{},{image:'/source.webp'}),'/source.webp')
const privateImage='/media/12345678-1234-1234-1234-123456789abc'
assert.equal(firstImage(['',privateImage]),privateImage)
assert.equal(firstImage([{image:''},{image:'https://images.example.test/kitchen.avif?size=small'}]),'https://images.example.test/kitchen.avif?size=small')
assert.equal(firstImage({images:['/download.pdf?token=x',privateImage]}),privateImage)
assert.equal(firstImage({href:'/products/sakura',video:'/video.mp4'}),'')
assert.equal(firstImage({pdfUrl:privateImage,brochureUrl:privateImage}),'','Private PDF files must not be treated as photos')
assert.equal(itemThumbnail(['',privateImage]),privateImage)
assert.equal(blockThumbnail({fields:[{documentId:'test',path:'decor',label:'裝飾線稿',schema:{type:'string',format:'media'}},{documentId:'test',path:'poster',label:'影片封面',schema:{type:'string',format:'media'}}]},{test:{decor:'/decor/drawing.png',poster:'/actual-poster.webp'}}),'/actual-poster.webp')
for(const label of ['文字段落','全台門市據點','型錄 PDF'])assert.match(decodeURIComponent(thumbnailPlaceholder(label)),/^data:image\/svg\+xml,<svg[\s\S]+<\/svg>$/)
assert.notEqual(thumbnailPlaceholder('文字段落'),thumbnailPlaceholder('全台門市據點'))
assert(!thumbnailPlaceholder('<script>不可信標題</script>').includes('script'))
const thumbnailSource=await readFile(new URL('../components/admin/AdminThumbnail.vue',import.meta.url),'utf8'),thumbnailProps=reactive({src:privateImage,alt:'SAKURA縮圖',contain:true}),thumbnailContext={computed,defineProps:()=>thumbnailProps,thumbnailPlaceholder}
runInNewContext(ts.transpileModule(thumbnailSource.match(/<script setup[^>]*>([\s\S]*?)<\/script>/)[1].replace(/^import .*$/gm,'')+'\nthis.mark=mark;',{compilerOptions:{target:ts.ScriptTarget.ES2022}}).outputText,thumbnailContext)
assert.equal(thumbnailContext.mark.value,true,'Uploaded logos retain full image display even without a recognizable filename')
thumbnailProps.contain=false;thumbnailProps.alt='品牌標誌縮圖';assert.equal(thumbnailContext.mark.value,true)
thumbnailProps.alt='一般照片';assert.equal(thumbnailContext.mark.value,false)
const source=await readFile(new URL('../components/admin/AdminItems.vue',import.meta.url),'utf8')
const script=source.match(/<script setup[^>]*>([\s\S]*?)<\/script>/)[1].replace(/^import .*$/gm,'')
const code=ts.transpileModule(script+'\nthis.ui={choose,back,item,add,move,remove,rows,active,visible,page,search,itemSchema,reorder,startDrag,drop,toggleVisibility,dragged};',{compilerOptions:{target:ts.ScriptTarget.ES2022}}).outputText
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
model.documentId='custom-cases';model.schema=editingSchema(docs.find(d=>d.id==='custom-cases').schema,'custom-cases').fields.items;model.modelValue=Array.from({length:8},(_,i)=>({...JSON.parse(JSON.stringify(model.schema.template)),id:'case-'+i,title:'案例 '+i}));state.value={};workbench.focused.value='';workbench.editing.value='';await nextTick()
ui.choose(ui.rows.value[0]);workbench.focused.value='catalog-cases:items';workbench.editing.value='catalog-cases:items';const oldCases=JSON.stringify(model.modelValue);ui.reorder(0,2);await nextTick();assert.equal(workbench.focused.value,'custom-cases:items');assert.equal(workbench.editing.value,'','Moving a custom case must leave an unrelated source editor')
assert.equal(model.modelValue.slice(0,3).map(i=>i.id).join(','),'case-1,case-2,case-0','Drag ordering inserts the selected case, not swaps two rows');assert.equal(ui.active.value.key,'case-0');assert.notEqual(JSON.stringify(model.modelValue),oldCases)
ui.toggleVisibility(ui.active.value);await nextTick();assert.equal(ui.active.value.value.enabled,false);assert.equal(workbench.selection.value.value.enabled,false);ui.toggleVisibility(ui.active.value);await nextTick();assert.equal(ui.active.value.value.enabled,true)
ui.reorder(2,6);await nextTick();assert.equal(ui.page.value,2);assert.equal(ui.active.value.key,'case-0');assert.equal(ui.visible.value[0].key,'case-0')
ui.search.value='案例 0';await nextTick();const filteredSnapshot=JSON.stringify(model.modelValue);ui.reorder(6,0);assert.equal(JSON.stringify(model.modelValue),filteredSnapshot,'Filtering must not reorder hidden rows')
ui.search.value='';await nextTick();workbench.busy.value=true;ui.reorder(0,1);ui.toggleVisibility(ui.rows.value[0]);assert.equal(JSON.stringify(model.modelValue),filteredSnapshot);workbench.busy.value=false
const transfer={value:'',effectAllowed:'',setData(type,value){this.value=value},getData(){return this.value}},dragEvent={dataTransfer:transfer,preventDefault(){}}
ui.startDrag(dragEvent,ui.rows.value[0]);ui.drop(dragEvent,ui.rows.value[2]);await nextTick();assert.equal(transfer.effectAllowed,'move');assert.equal(ui.active.value.index,2);assert.equal(ui.dragged.value,'')
const protectedSnapshot=JSON.stringify(model.modelValue);ui.startDrag(dragEvent,ui.rows.value[0]);transfer.value='unrelated-table';ui.drop(dragEvent,ui.rows.value[2]);assert.equal(JSON.stringify(model.modelValue),protectedSnapshot,'Foreign drag data must not move cases')
for(const [from,to]of [[-1,2],[0,99],[NaN,0],[0,1.5]])ui.reorder(from,to);assert.equal(JSON.stringify(model.modelValue),protectedSnapshot)
const renamedRow=ui.rows.value.find(r=>r.key==='case-0');ui.search.value=renamedRow.value.title;await nextTick();ui.choose(ui.active.value,true);let automaticOpens=0;workbench.select=()=>automaticOpens++
ui.item(ui.active.value.index,{...ui.active.value.value,title:'改名後仍可找到'});await nextTick();assert.equal(ui.rows.value.length,0);await ui.back();await nextTick();assert.equal(ui.search.value,'');assert.equal(ui.active.value.key,'case-0');assert(ui.visible.value.some(r=>r.key==='case-0'));assert.equal(automaticOpens,0,'Returning from a renamed filtered item must not open the position dialog')
ui.add();await nextTick();assert.equal(ui.active.value.value.title,'新增案例');assert.equal(ui.active.value.value.enabled,true);assert.equal(workbench.editing.value,'custom-cases:items')
scope.stop()
console.log('PASS: all 28 pages retain every field and old link; screenshot home order; list selection/edit/focus; custom case insertion sorting, drag scope, cross-page movement, search/busy guards and visibility toggles')
