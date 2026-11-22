import assert from 'node:assert/strict'
import {readFile} from 'node:fs/promises'
import {runInNewContext} from 'node:vm'
import {randomUUID} from 'node:crypto'
import ts from 'typescript'
import {ref,reactive,computed,watch,nextTick,effectScope} from 'vue'
import {pageEditors,pageBlocks} from '../shared/cms/page-editors.mjs'
import {editorSchema} from '../server/cms/page-editors.mjs'
import {workbenchBlocks,itemKey,itemCaption,itemThumbnail,positionContent,freshArticleValue,thumbnailPlaceholder,inspirationPosition,pagePositionContent,newsBreadcrumbPosition,homeHeroPosition,itemWebsitePath,articleDateLabel,updateArticleField} from '../shared/cms/workbench.mjs'
import {pagePositions} from '../shared/cms/positions.mjs'
import {firstImage} from '../shared/cms/workflow.mjs'
import {blockThumbnail} from '../shared/cms/page-editors.mjs'
import {valueAt,searchPages,pageTaskLink} from '../shared/cms/page-editors.mjs'
import {sameContent,pageChanges,changeImpacts,blockImpacts,publishReview,pageSearchItems,pageMedia,hasPageChanges,itemPublication} from '../shared/cms/changes.mjs'
import {normalizeVideos,validate} from '../server/cms/content.mjs'
import {readableError,workspaceSummariesFromRows} from '../server/cms/workspaces.mjs'
import {editingSchema} from '../shared/cms/presentation.mjs'
const seed=JSON.parse(await readFile(new URL('../shared/cms/seed.json',import.meta.url)))
const docs=seed.map(d=>({...d,body:d.data,schema:editorSchema({...d,schemaJson:JSON.stringify(d.schema)})}))
{
 const homeBlocks=workbenchBlocks('home',pageBlocks(pageEditors[0],docs))
 const heroBlock=homeBlocks.find(b=>b.id==='home:主視覺輪播'),promiseBlock=homeBlocks.find(b=>b.id==='home:品牌承諾')
 const hero=docs.find(d=>d.id==='view-components-home-HomeHero'),project=docs.find(d=>d.id==='view-components-home-HomeProject')
 const saved={[hero.id]:hero.body,[project.id]:project.body},edited=structuredClone(saved)
 const context={heroTitlePages:[{href:'/home-style/basic-plus',title:'Basic+',fallbackTitle:'Basic+'}]}
 const links=impacts=>impacts.map(i=>i.href)
 assert.deepEqual(links(blockImpacts(heroBlock,[],context)),['/#hero-title','/home-style/basic-plus'])
 assert.deepEqual(links(blockImpacts(promiseBlock,[],context)),['/#brand-promise'])
 edited[project.id].copy.text3+='其他區塊修改'
 edited[hero.id].slides[0].description+='輪播描述修改'
 let changes=pageChanges(homeBlocks,[hero,project],saved,edited,context)
 assert.deepEqual(links(blockImpacts(heroBlock,changes,context)),['/#hero-title'])
 edited[hero.id].slides[0].title='有專屬圖文的系列'
 changes=pageChanges(homeBlocks,[hero,project],saved,edited,context)
 assert.deepEqual(links(blockImpacts(heroBlock,changes,context)),['/#hero-title'])
 edited[hero.id].slides.find(s=>s.route==='/home-style/basic-plus').title='Basic+ 預設標題'
 changes=pageChanges(homeBlocks,[hero,project],saved,edited,context)
 assert.deepEqual(links(blockImpacts(heroBlock,changes,context)),['/#hero-title','/home-style/basic-plus'])
 assert.deepEqual(links(changeImpacts([{documentId:'data-kitchenStyles',path:'KITCHEN_STYLES.0.desc'}])),['/#kitchen-series'])
 assert.deepEqual(links(changeImpacts([{documentId:'site-visuals',path:'images.asset_82b9dd3e'}])),['/franchising/intro','/franchising/form','/franchising/download'])
 assert.deepEqual(changeImpacts([{documentId:'site-visuals',path:'brandVideoId'}]),[])
 assert.deepEqual(changeImpacts([{documentId:'data-builders',path:'builderPartners.0.name'}]),[])
 assert.deepEqual(links(changeImpacts([{documentId:'data-brandPavilions',path:'pavilionNotice.0'}])),['/about/exhibition'])
 assert.deepEqual(links(changeImpacts([{documentId:'news-articles',path:'items.0.detail.paragraphs.0',category:'latest',slug:'test'}])),['/news/latest/test'])
}
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
assert.throws(()=>validate(badBuilder,builderSchema),e=>{const issue=readableError(e,'view-pages-builders-index',editingSchema(builderSchema,'view-pages-builders-index'),badBuilder);assert.equal(issue.fieldErrors[0].path,'copy.text2');assert.match(issue.message,/區塊中文主標題（第一段）/);return true})
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
assert.equal(serviceScene.mappedImage,serviceScene.image,'The shared section photo must display above the text cards')
assert.equal(builders.find(b=>b.name==='合作夥伴').kind,'inactive','Archived builder partners are not a website section')
assert.equal(itemWebsitePath('data-storeCases','臺北市'),'','County selection keeps the filter position instead of linking to a case detail')
assert.equal(itemWebsitePath('data-storeCases',{slug:'songzhu'}),'/gallery/songzhu')
for(const brand of ['sakura','svago','teka']){
 const p=pageEditors.find(p=>p.id==='products-'+brand)
 const block=pageBlocks(p,docs).find(b=>b.name==='商品頁型錄按鈕')
 const catalogueCovers=[{title:'已公開型錄',image:'/real-cover.webp'}]
 const position=pagePositionContent(block,previewBodies,{catalogueCovers})
 assert.equal(position.fixedAction,'廚房商品型錄下載')
 assert.deepEqual(position.items,catalogueCovers)
}
const faqBodies=JSON.stringify(previewBodies),faqContent=pagePositionContent(franchise.find(b=>b.name==='加盟常見問題'),previewBodies,{}, {caption:'如何申請',image:'',value:{question:'如何申請？',answer:'先填表'}})
assert.equal(faqContent.questions[0].answer,'先填表');assert.equal(faqContent.image,'');assert(faqContent.contextImage,'Text-only positions retain the real page context without claiming a borrowed item photo')
assert.equal(JSON.stringify(previewBodies),faqBodies)
assert(builderScene.heading.some(f=>f.value==='目前輸入的建商標題'));assert(!builderScene.bodyText.some(f=>/圖片說明/.test(f.label)))
for(const category of ['latest','activities','video']){
 const id='news-'+category,blocks=workbenchBlocks(id,pageBlocks(pageEditors.find(p=>p.id===id),docs))
 const articleBlock=blocks[1]
 assert.equal(articleBlock.name,'麵包屑導覽設定')
 assert.equal(articleBlock.kind,'breadcrumb')
 assert(articleBlock.aliases.includes(id+':文章最上方與返回導覽'))
 const copy=previewBodies[articleBlock.fields[0].documentId].copy
 const sample={title:'已公開文章',image:'/actual-cover.webp'},background='/article-background.webp'
 const scene=newsBreadcrumbPosition(articleBlock,previewBodies,{detailSample:sample,detailHeroImage:background})
 assert.equal(scene.image,background)
 assert.equal(scene.article,sample)
 assert.equal(scene.title,copy.text1)
 assert.deepEqual(scene.categories.map(c=>c.value),[copy.text3,copy.text5])
}
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
const code=ts.transpileModule(script+'\nthis.ui={choose,back,item,add,move,remove,rows,active,visible,page,search,itemSchema,reorder,startDrag,drop,toggleVisibility,dragged,cancelItem,changed,focusRow,root};',{compilerOptions:{target:ts.ScriptTarget.ES2022}}).outputText
const model=reactive({modelValue:Array.from({length:8},(_,i)=>({id:'row-'+i,title:'內容 '+i,image:'/image.webp'})),schema:{type:'array',label:'輪播內容',item:{type:'object',fields:{id:{type:'string'},title:{type:'string'}}},template:{id:'',title:''}},documentId:'home',path:'slides'})
const route=reactive({query:{}}),state=ref({}),errors=ref([]),workbench={rows:ref({}),baseline:ref({home:{slides:JSON.parse(JSON.stringify(model.modelValue))}}),focused:ref(''),editing:ref(''),selection:ref(null),metadata:ref({}),busy:ref(false),select:()=>{}},emitted=[]
const context={ref,computed,watch,nextTick,useRoute:()=>route,useRouter:()=>({replace:async value=>{route.query=value.query}}),sameContent,itemPublication,defineProps:()=>model,defineEmits:()=>((_,v)=>{emitted.push(v);model.modelValue=v}),inject:(key,fallback)=>({'cms-workbench':workbench,'cms-item-selections':state,'cms-field-errors':errors}[key]??fallback),provide:()=>{},valueAt,itemKey,itemCaption,itemThumbnail,freshArticleValue,articleDateLabel,newStoreId:()=>123,crypto:{randomUUID},CSS:{escape:x=>x},document:{querySelector:()=>null},window:{confirm:()=>true},JSON}
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

// Cancellation must restore only this record, even after moving a row without an ID.
model.documentId='cancel-test';model.path='items';model.schema={type:'array',label:'測試清單',item:{type:'object',fields:{title:{type:'string',label:'名稱'}}},template:{title:''}}
model.modelValue=[{title:'甲'},{title:'乙'},{title:'丙'}];workbench.baseline.value={'cancel-test':{items:JSON.parse(JSON.stringify(model.modelValue))}};workbench.rows.value={};state.value={};workbench.focused.value='';await nextTick()
ui.choose(ui.rows.value[0],true);ui.item(0,{title:'甲修改'});ui.item(1,{title:'乙修改'});await nextTick();ui.move(0,1);await nextTick()
assert.equal(ui.active.value.value.title,'甲修改');ui.cancelItem();await nextTick()
assert.equal(model.modelValue[0].title,'乙修改');assert.equal(model.modelValue[1].title,'甲');assert.equal(ui.active.value.value.title,'甲');assert.equal(ui.changed(ui.active.value),false)
ui.back();ui.choose(ui.rows.value[0],true);ui.cancelItem();await nextTick();assert.equal(model.modelValue[0].title,'乙','Reopening a record must still restore the last saved value')
const count=model.modelValue.length;ui.add();await nextTick();assert.equal(model.modelValue.length,count+1);ui.cancelItem();await nextTick();assert.equal(model.modelValue.length,count,'Cancelling a new item removes only that item')
// A deep link opens the right item and page once, without repeatedly stealing input focus.
model.documentId='direct-test';model.modelValue=Array.from({length:9},(_,i)=>({id:'direct-'+i,title:'項目'+i}));workbench.rows.value={};state.value={};route.query={list:'direct-test:items',item:'direct-8'};await nextTick();await nextTick()
assert.equal(ui.active.value.key,'direct-8');assert.equal(ui.page.value,2);assert.equal(workbench.editing.value,'direct-test:items')
ui.item(8,{...model.modelValue[8],title:'仍在編輯'});await nextTick();assert.equal(ui.active.value.key,'direct-8');await ui.back();await nextTick();assert.equal(route.query.item,undefined);assert.equal(route.query.list,undefined);route.query={list:'direct-test:items',item:'direct-8'};await nextTick();await nextTick();assert.equal(workbench.editing.value,'direct-test:items','The same search result must be able to reopen after returning')
const shortcutBefore=model.modelValue.length;model.schema.source=false;route.query={create:'direct-test:items'};await nextTick();await new Promise(resolve=>setImmediate(resolve));assert.equal(model.modelValue.length,shortcutBefore+1);assert.equal(route.query.create,undefined);await nextTick();assert.equal(model.modelValue.length,shortcutBefore+1,'An already-consumed create link must not add another item')
let returnedToAdd=0;ui.root.value={querySelector:selector=>selector.includes('data-row-key')?null:{focus:()=>returnedToAdd++}};ui.focusRow();await nextTick();assert.equal(returnedToAdd,1,'Cancelling the last new item returns focus to add/search instead of the page body');ui.root.value=undefined
scope.stop()
const nestedModel=reactive({modelValue:['一','二'],schema:{type:'array',item:{type:'string'},template:''},documentId:'nested',path:'paragraphs'}),nestedState=ref({}),nested={...context,defineProps:()=>nestedModel,defineEmits:()=>((_,v)=>nestedModel.modelValue=v),inject:(key,fallback)=>key==='cms-array-depth'?1:key==='cms-item-selections'?nestedState:fallback}
const nestedScope=effectScope();nestedScope.run(()=>runInNewContext(code,nested));nested.ui.add();await nextTick();assert.equal(nested.ui.active.value.index,2,'Nested text/image additions must open the new item');nested.ui.choose(nested.ui.rows.value[0]);nested.ui.move(0,1);await nextTick();assert.equal(nested.ui.active.value.value,'一','Moving a nested item must keep editing the same content');nestedScope.stop()
{
const pavilion=docs.find(d=>d.id==='data-brandPavilions'),pavilionBlocks=workbenchBlocks('pavilions',pageBlocks(pageEditors.find(p=>p.id==='pavilions'),docs)),savedBodies={[pavilion.id]:structuredClone(pavilion.body)},nextBodies=structuredClone(savedBodies)
const pavilionRow=nextBodies[pavilion.id].brandPavilions[0],hours=Object.keys(pavilionRow).find(k=>/hour|time/i.test(k));assert(hours);pavilionRow[hours]+='驗收'
const detail=pageChanges(pavilionBlocks,[pavilion],savedBodies,nextBodies);assert.equal(detail.length,1);assert.match(detail[0].label,/台北館/);assert(detail[0].label.includes('時間'));assert(!detail[0].label.includes(hours));assert.notEqual(detail[0].before,detail[0].after)
const impacts=changeImpacts(detail);assert.equal(impacts.length,2);assert(impacts.every(i=>/品牌館/.test(i.label)));assert(!impacts.some(i=>/影片/.test(i.label)))
const stored=structuredClone(pavilion);stored.publishedBody=structuredClone(pavilion.body);stored.body.brandPavilions[1].address+='先前修改'
const reviewingBodies={[pavilion.id]:structuredClone(stored.body)};reviewingBodies[pavilion.id].brandPavilions[0][hours]+='本次修改';const review=publishReview(pavilionBlocks,[stored],reviewingBodies);assert(review.current.length);assert(review.saved.some(c=>c.label.includes('台中館')));assert(!review.saved.some(c=>c.label.includes('台北館')))
reviewingBodies[pavilion.id].brandPavilions.reverse();const reorderedReview=publishReview(pavilionBlocks,[stored],reviewingBodies);assert(reorderedReview.current.some(c=>c.kind==='order'));assert(reorderedReview.saved.some(c=>c.label.includes('台中館')&&c.after.includes('先前修改')),'Reordering must never hide an older saved edit in another row')
stored.body.brandPavilions[0][hours]+='先前營業時間';const overwritten={[pavilion.id]:structuredClone(stored.body)};overwritten[pavilion.id].brandPavilions[0][hours]+='本次營業時間';const overwrittenReview=publishReview(pavilionBlocks,[stored],overwritten);assert(!overwrittenReview.saved.some(c=>c.label.includes('台北館')),'The same stable item field is shown once, using its current value')
const indexed=pageEditors.map(p=>{const b=workbenchBlocks(p.id,pageBlocks(p,docs));return{...p,title:p.name,blocks:b.map(block=>({...block,items:pageSearchItems(block,Object.fromEntries(docs.map(d=>[d.id,d.body])))}))}})
const direct=searchPages(indexed,'台北館');assert(direct.some(r=>r.page.id==='pavilions'&&r.item?.caption==='台北館'));assert(direct.every(r=>r.item?.scope==='data-brandPavilions:brandPavilions'))
for(const id of ['news-latest','news-activities','news-video'])for(const block of indexed.find(p=>p.id===id).blocks)for(const i of block.items)assert(docs.find(d=>d.id==='news-articles').body.items.find(row=>itemKey(row)===i.key).summary.category===id.slice(5),'Search cannot leak other categories into a page')
const media=pageMedia(docs.filter(d=>pageEditors[0].ids.includes(d.id)),Object.fromEntries(docs.map(d=>[d.id,d.body])));assert(media.length);assert(media.every(i=>i.label&&!/copy\./.test(i.label)));assert.equal(new Set(media.map(i=>i.src)).size,media.length)
}
console.log('PASS: actual-name item search, category scoping, exact before/after values and changed-document impacts, other saved changes, isolated item cancellation after reorder/reopen, new-item cancellation, deep-link pagination and page media descriptions')

console.log('PASS: all 28 pages retain every field and old link; screenshot home order; list selection/edit/focus; custom case insertion sorting, drag scope, cross-page movement, search/busy guards and visibility toggles')

// Public status and pending counts reflect content, never version numbers or a draft switch.
const article=structuredClone(newsDoc.body.items[0]),publishedDoc={id:newsDoc.id,publishedBody:{items:[structuredClone(article)]}}
assert.equal(itemPublication(publishedDoc,'items',article,0).label,'官網已刊登')
assert.equal(itemPublication(publishedDoc,'items',{...article,id:'new-item'},0).label,'尚未刊登')
const futureHidden={...article,enabled:false};assert.equal(itemPublication(publishedDoc,'items',futureHidden,0).label,'有待更新修改');assert(itemPublication(publishedDoc,'items',futureHidden,0).visible,'The current website remains visible until publication')
assert(!itemPublication({...publishedDoc,publishedBody:{items:[{...article,enabled:false}]}},'items',article,0).visible)
assert.equal(itemPublication({...publishedDoc,publishedBody:null},'items',article,0).label,'尚未刊登')
assert.equal(itemWebsitePath(newsDoc.id,article),'/news/latest/'+article.slug)
const newsPage=pageEditors.find(p=>p.id==='news-latest'),newsBlocks=workbenchBlocks(newsPage.id,pageBlocks(newsPage,[newsDoc])),pub={[newsDoc.id]:structuredClone(newsDoc.body)},draft=structuredClone(pub)
assert(!hasPageChanges(newsBlocks,pub,draft))
draft[newsDoc.id].items.find(i=>i.summary.category==='activities').summary.title+='其他分類的草稿'
assert(!hasPageChanges(newsBlocks,pub,draft),'Another news category must not count toward this page')
draft[newsDoc.id].items.find(i=>i.summary.category==='latest').summary.title+='本頁的草稿';assert(hasPageChanges(newsBlocks,pub,draft))
const newsMedia=pageMedia([newsDoc],pub,newsBlocks)
for(const i of newsDoc.body.items)assert.equal(newsMedia.some(m=>m.src===i.summary.cover),i.summary.category==='latest','Page images must respect the active category')
assert(newsMedia.every(m=>m.caption&&m.purpose&&!m.label.includes(' › ')&&m.location));const punctuated=structuredClone(pub);punctuated[newsDoc.id].items[0].summary.title='新品｜品牌故事';assert(pageMedia([newsDoc],punctuated,newsBlocks).some(m=>m.caption==='新品｜品牌故事'&&m.purpose==='列表卡片圖片'))
assert.equal(articleDateLabel('2026-11-17'),'NOV 17, 2026')
const standard={...article,summary:{...article.summary,displayDate:'JUN 15, 2026'}},dated=updateArticleField(standard,'summary.publishedAt','2026-11-17');assert.equal(dated.summary.displayDate,'NOV 17, 2026');assert.equal(standard.summary.displayDate,'JUN 15, 2026')
const custom=structuredClone(article);custom.summary.displayDate='活動期間依門市公告';assert.equal(updateArticleField(custom,'summary.publishedAt','2026-11-17').summary.displayDate,'活動期間依門市公告')
const distinct=updateArticleField(article,'summary.cover','/changed.webp');assert.equal(distinct.detail.cover.src,article.detail.cover.src,'A separate article image must never be overwritten')
const noCover=structuredClone(article);noCover.detail={};assert.equal(updateArticleField(noCover,'summary.cover','/changed.webp').detail.cover.src,'/changed.webp')
const sameCover=structuredClone(article);sameCover.detail.cover.src=sameCover.summary.cover;assert.equal(updateArticleField(sameCover,'summary.cover','/changed.webp').detail.cover.src,'/changed.webp')
const newsTask=pageTaskLink([{...newsPage,blocks:newsBlocks}],newsPage.id,'news-articles:items',true,{q:'原搜尋',page:'2'});assert.equal(newsTask.query.block,newsBlocks.find(b=>b.fields.some(f=>f.documentId==='news-articles')).id);assert.equal(newsTask.query.create,'news-articles:items');assert.equal(newsTask.query.q,'原搜尋');assert.equal(newsTask.query.page,'2')

console.log('PASS: published-vs-draft status, category-scoped pending/media, preserved custom dates and images, direct task links and one-shot creation')

const identical=workspaceSummariesFromRows([{id:'data-kitchenSeries',body:'{"title":"相同內容"}',publishedBody:'{"title":"相同內容"}',draftId:'new-version',publishedId:'old-version'}]);assert.equal(identical.find(w=>w.ids.includes('data-kitchenSeries')).pending,false,'Equal content in different versions must never create a pending task')
const articleSource=await readFile(new URL('../components/admin/AdminArticleFields.vue',import.meta.url),'utf8'),articleProps=reactive({modelValue:structuredClone(article),schema:editingSchema(newsDoc.schema,newsDoc.id).fields.items.item,documentId:newsDoc.id,path:'items.0'}),articleContext={computed,valueAt,updateArticleField,defineProps:()=>articleProps,defineEmits:()=>((_,value)=>articleProps.modelValue=value)}
runInNewContext(ts.transpileModule(articleSource.match(/<script setup[^>]*>([\s\S]*?)<\/script>/)[1].replace(/^import .*$/gm,'')+'\nthis.ui={main,extra,field,update};',{compilerOptions:{target:ts.ScriptTarget.ES2022}}).outputText,articleContext)
const articleUi=articleContext.ui;assert.equal(articleUi.main.value[0],'summary.title');assert.equal(articleUi.field('summary.publishedAt').inputType,'date');assert.equal(articleUi.field('detail.sections').newItemLabel,'段落')
for(const group of ['summary','detail'])for(const key of Object.keys(articleProps.schema.fields[group].fields)){if(key==='category')continue;const path=group+'.'+key;assert([...articleUi.main.value,...articleUi.extra.value].includes(path),'Every original article setting must remain reachable: '+path)}
assert(!articleUi.extra.value.includes('slug'));const oldDetail=JSON.stringify(articleProps.modelValue.detail);articleUi.update('summary.title','新標題');assert.equal(JSON.stringify(articleProps.modelValue.detail),oldDetail,'Editing title must preserve a custom image description and all existing body content')
console.log('PASS: identical-version workspace counts and all original article settings remain reachable without changing custom content')

assert(sameContent({title:'相同',image:'/a.jpg'},{image:'/a.jpg',title:'相同'}),'Object key order is not a content change');assert(!sameContent(['甲','乙'],['乙','甲']),'Visible list order remains a real change')
