<script setup lang="ts">
import {valueAt,withValue,pageFieldValue,pageEditorLink,storeCasesPageId,desktopCatalogueFields,usesDesktopCatalogue,inspirationSharedGroups} from '~/shared/cms/page-editors.mjs'
import {cmsDate,firstImage} from '~/shared/cms/workflow.mjs'
import {imageReadingHelp,resourceGuide} from '~/shared/cms/presentation.mjs'
import {pageChanges,changeImpacts,blockImpacts,pageMedia,hasPageChanges,itemPublication} from '~/shared/cms/changes.mjs'
import {workbenchBlocks,pagePositionContent,itemWebsitePath,itemKey,recentArticleIndexes,updateFranchiseMarqueeImage,franchiseSupportImage,updateFranchiseFaqDestination} from '~/shared/cms/workbench.mjs'
import {franchiseDownloadActions,franchiseDownloadSettings,franchiseMarqueeDocument,franchiseMarqueeRows} from '~/shared/cms/positions.mjs'
import {FRANCHISE_FAQ_DISPLAY_LIMIT} from '~/data/franchise'
import {knowledgeArticlePath,knowledgeArticleSections,knowledgeSharedSections,isSystemCabinetDocument,legacyKnowledgeSection} from '~/shared/cms/knowledge-editor.mjs'
import {seriesEditorSections,seriesEditorSection,sectionForSeriesField} from '~/shared/cms/series-editor.mjs'
import {storeRegionCities} from '~/shared/cms/store-location.mjs'
import {builderHomeOneDocument,builderHomeOneImage,builderHomeOneImages} from '~/shared/cms/builder-home-one.mjs'
import {builderCatalogueNoticeAnchor,isBuilderCatalogueNotice} from '~/shared/cms/builder-catalogue.mjs'
import {productCatalogueDocument,productCatalogueTitle} from '~/shared/cms/product-catalogue.mjs'
const props=defineProps<{id:string}>()
const route=useRoute(),router=useRouter(),{api,session,message}=useCmsAdmin()
const {data:namedPages}=useNuxtData<any[]>('cms-pages')
const pageData=ref<any>(),docs=ref<any[]>([]),bodies=ref<Record<string,any>>({}),baseline=ref<Record<string,any>>({}),error=ref(''),notice=ref(''),busy=ref(false),fieldErrors=ref<any[]>([]),selections=ref<Record<string,string>>({}),locationOpen=ref(false),positionOpen=ref(false),focusedField=ref(''),formRoot=ref<HTMLElement>()
provide('cms-field-errors',fieldErrors);provide('cms-item-selections',selections)
const blocks=computed<any[]>(()=>{const named=namedPages.value?.find(p=>p.id===props.id);return workbenchBlocks(props.id,(pageData.value?.blocks||[]).map((b:any)=>({...b,name:named?.blocks.find((n:any)=>n.id===b.id)?.name||b.name})),pageData.value?.positionPresentation?.recentArticles||[])})
const active=computed(()=>blocks.value.find(b=>b.aliases.includes(route.query.block))||blocks.value[0])
const newsRecent=computed(()=>active.value?.kind==='news-recent')
const franchiseNews=computed(()=>active.value?.kind==='franchise-news')
const newsArticleList=computed(()=>newsRecent.value||franchiseNews.value||active.value?.kind==='news-overview')
const regionField=computed(()=>active.value?.fields.find((field:any)=>field.documentId==='data-storeCases'&&field.path==='regionCities'))
const regionNames=Object.keys(storeRegionCities),storeRegion=ref(regionNames[0]!),regionLabelId=useId()
const cityListPath=computed(()=>`regionCities.${storeRegion.value}`)
const cityListScope='data-storeCases:regionCities.'
function selectStoreRegion(region:string){
 if(regionNames.includes(region))storeRegion.value=region
}
watch(()=>route.query.list,list=>{
 if(props.id==='stores'&&typeof list==='string'&&list.startsWith(cityListScope))selectStoreRegion(list.slice(cityListScope.length))
},{immediate:true})
function changeStoreRegion(event:Event){
 selectStoreRegion((event.target as HTMLSelectElement).value)
 if(typeof route.query.list==='string'&&route.query.list.startsWith(cityListScope))
  void router.replace({query:{...route.query,list:undefined,item:undefined}})
}
const workbench={focused:ref(''),editing:ref(''),selection:ref<any>(null),rows:ref<Record<string,any>>({}),baseline,documents:docs,metadata:computed(()=>pageData.value?.rowPresentation||{}),busy,returnFocus:()=>{},position:()=>{positionOpen.value=true},select:(edit:boolean)=>{positionOpen.value=!edit&&window.innerWidth<1024}}
provide('cms-workbench',workbench)
const catalogueWorkbench=computed(()=>['series-catalogue','product-catalogue'].includes(props.id))
const catalogueItemEditing=computed(()=>catalogueWorkbench.value&&!!workbench.editing.value)
const seriesPart=computed(()=>props.id==='series'?seriesEditorSection(route.query.seriesPart):null)
const focusedGroup=ref('')
const franchiseCatalogue=computed(()=>active.value?.kind==='franchise-download-catalogue')
const franchiseDownloadCommon=computed(()=>active.value?.kind==='franchise-download-document')
const legacyDownloadGroup=computed(()=>franchiseDownloadSettings.find(group=>route.query.block==='franchise-download:'+group.name))
const sharedInspiration=computed(()=>active.value?.id==='inspiration:頁面共用設定')
const sharedKnowledge=computed(()=>active.value?.id==='knowledge:頁面共用設定')
const sharedNews=computed(()=>active.value?.kind==='news-shared')
const newsTopLinks='文章標題上方的分類連結'
const knowledgeArticles=computed(()=>active.value?.id==='knowledge:文章管理')
const systemCabinetFields=computed(()=>knowledgeArticles.value?active.value.fields.filter((f:any)=>isSystemCabinetDocument(f.documentId)):[])
const knowledgeSection=computed(()=>legacyKnowledgeSection(route.query.block))
const positionBlock=computed(()=>{
 const block=active.value
 if(block?.kind==='builder-catalogue-cards'&&focusedGroup.value===builderCatalogueNoticeAnchor)
  return {...block,previewPage:'/builders/catalogues#'+builderCatalogueNoticeAnchor}
 if(franchiseCatalogue.value&&focusedGroup.value==='franchise-pdf-actions')
  return {...block,previewPage:'/franchising/download#franchise-pdf-actions'}
 if(franchiseDownloadCommon.value){
  const group=franchiseDownloadSettings.find(group=>group.fields.includes(focusedField.value)||group.name===focusedGroup.value)
   ||(!focusedField.value?legacyDownloadGroup.value:undefined)
  if(group)return {...block,name:group.name,previewPage:'/franchising/download#'+group.anchor}
 }
 if(newsArticleList.value&&!workbench.editing.value)return {...block,previewPage:block.href}
 if(sharedNews.value&&focusedGroup.value===newsTopLinks&&block.href.endsWith('#article-categories'))return {...block,previewPage:block.href.replace(/#article-categories$/,'#article-header-categories')}
 if(regionField.value)return {...block,storeRegion:storeRegion.value,previewPage:`/gallery?region=${encodeURIComponent(storeRegion.value)}#gallery-filter-title`}
 if(seriesPart.value&&block)return {...block,name:seriesPart.value.name,seriesPart:seriesPart.value.id}
 if(knowledgeArticles.value){
  const group=focusedGroup.value||knowledgeSection.value
  const section=knowledgeArticleSections[group as keyof typeof knowledgeArticleSections]
  if(section&&workbench.selection.value?.value?.slug==='systemcabinet'){
   return {...block,name:section.title,kind:section.kind,fields:systemCabinetFields.value.filter((f:any)=>f.formGroup===group),previewPage:knowledgeArticlePath+(section.anchor?'#'+section.anchor:'')}
  }
  return {...block,fields:block.fields.filter((f:any)=>!isSystemCabinetDocument(f.documentId))}
 }
 if(sharedKnowledge.value){
  const previous=typeof route.query.block==='string'?route.query.block.split(':').at(-1):''
  const group=focusedGroup.value||(Object.hasOwn(knowledgeSharedSections,previous||'')?previous:'文章底部返回按鈕')
  const section=knowledgeSharedSections[group as keyof typeof knowledgeSharedSections]
  if(section){
   const path=group==='延伸文章按鈕'?knowledgeArticlePath:pageData.value?.positionPresentation?.detailPath
   return {...block,name:section.title,...section,fields:block.fields.filter((f:any)=>f.formGroup===group),previewPage:path?path+'#'+section.anchor:block.href}
  }
 }
 const detail=pageData.value?.positionPresentation?.detailCase?.route
 if(block?.preview==='inspiration-breadcrumb'&&focusedGroup.value==='breadcrumb-detail'&&detail)
  return {...block,previewPage:detail+'#design-inspiration-breadcrumb'}
 if(!sharedInspiration.value)return block
 const previous=typeof route.query.block==='string'?route.query.block.split(':').at(-1):''
 const legacyGroup=previous==='整頁共用文字'?'案例內頁文字':previous
 const selectedGroup=focusedGroup.value||legacyGroup
 if(selectedGroup==='顯示與搜尋設定')return {...block,preview:'inspiration-page',href:'/design-inspiration'}
 const target=inspirationSharedGroups[selectedGroup as keyof typeof inspirationSharedGroups]
 if(!target)return block
 return {...block,preview:target.preview,href:target.anchor?'/design-inspiration#'+target.anchor:detail||block.href}
})
const positionSelection=computed(()=>knowledgeArticles.value&&positionBlock.value?.previewPage?undefined:workbench.selection.value)
watch(()=>route.query.block,()=>{focusedGroup.value='';if(pageData.value&&knowledgeSection.value)void openSystemCabinet()})

const builderCatalogueShortcuts=computed(()=>{
 if(props.id!=='builder-series')return []
 const catalogue=namedPages.value?.find(p=>p.id==='builder-catalogues')
 return [
  {id:'builder-catalogues:麵包屑編輯設定',name:'麵包屑編輯設定',hint:'建商專區型錄頁的導覽文字',image:pageData.value?.positionPresentation?.builderCatalogueHero||'/section-3/store-songzhu.jpg'},
  {id:'builder-catalogues:型錄管理',name:'型錄管理',hint:'管理建商型錄封面、預覽與下載檔案',image:catalogue?.thumbnail||'/section-6/builders/catalogues/developer-catalogue-2026.jpg'},
 ]
})
const navigationBlocks=computed(()=>seriesPart.value?seriesEditorSections:builderCatalogueShortcuts.value.length
 ?[...blocks.value.slice(0,1),...builderCatalogueShortcuts.value,...blocks.value.slice(1)]
 :blocks.value)
const currentLocation=computed(()=>seriesPart.value?.id||active.value?.id)
async function chooseLocation(id:string){
 if(builderCatalogueShortcuts.value.some(block=>block.id===id)){
  await router.push(pageEditorLink('builder-catalogues',route.query,id))
  return
 }
 if(!seriesPart.value)return selectBlock(id)
 locationOpen.value=false
 focusedField.value=''
 await router.replace({query:{...route.query,seriesPart:id}})
 await nextTick()
 formRoot.value?.querySelector<HTMLElement>(workbench.editing.value?'.cms-item-editor-heading':'.cms-block-title')?.focus({preventScroll:true})
}
function seriesLocation(path:string){
 return seriesPart.value&&path.startsWith('/home-style/')?path.split('#')[0]+'#'+seriesPart.value.anchor:path
}

provide('cms-media-context',computed(()=>pageMedia(docs.value,bodies.value,blocks.value)))
const collections=computed(()=>active.value?.fields.filter((f:any)=>f.schema.type==='array'&&!systemCabinetFields.value.includes(f))||[])
const franchiseFaq=computed(()=>active.value?.kind==='franchise-faq')
const faqCover=computed(()=>bodies.value[franchiseMarqueeDocument]?.copy?.field53)
function editableBlockFields(block:any){
 const fields=block?.fields||[]
 if(block?.kind!=='franchise-faq')return fields
 const card=blocks.value.find(b=>b.id==='franchise:加盟資料下載入口')
 const cardFields=(card?.fields||[]).filter((field:any)=>['copy.field52','copy.field53','copy.field54'].includes(field.path))
  .map((field:any)=>field.path==='copy.field52'?{...field,schema:{...field.schema,help:'封面點開的頁面。若封面和標題原本使用同一個連結，會一起更新。'}}:field)
 return [...fields,...cardFields]
}
const visibleFields=computed(()=>editableBlockFields(active.value))
const hardwareTitleField=computed(()=>props.id==='product-catalogue'?visibleFields.value.find((f:any)=>f.path==='copy.kitchenwareTitle'):undefined)
function restoreHardwareTitle(){
 const field=hardwareTitleField.value
 if(field)update(field,valueAt(baseline.value[field.documentId],field.path))
}
function productCatalogueItemSchema(schema:any,id:string){
 if(id!=='kitchenware-2026')return schema
 return {...schema,fields:{...schema.fields,title:{...schema.fields.title,hidden:true}}}
}
function editCatalogueItem(field:any,index:number,value:any){
 const rows=[...pageFieldValue(bodies.value,field)]
 rows[index]=value
 update(field,rows)
}
const builderNoticeFields=computed<any[]>(()=>active.value?.kind==='builder-catalogue-cards'
 ?visibleFields.value.filter((f:any)=>isBuilderCatalogueNotice(f.path)):[])
const homeOneSettings=computed<any[]>(()=>active.value?.kind==='builders-home-one'?visibleFields.value.filter((f:any)=>f.schema.format==='media'):[])
const homeOneThumbnail=computed(()=>builderHomeOneImage(bodies.value[builderHomeOneDocument]?.copy,builderHomeOneImages[1]).src)
function updateHomeOneService(field:any,index:number,path:'title'|'copy',value:string){
 const services=pageFieldValue(bodies.value,field)
 update(field,services.map((service:any,i:number)=>i===index?{...service,[path]:path==='copy'?value.split('\n'):value}:service))
}
const caseManagement=computed(()=>active.value?.preview==='inspiration-cases')
const headerId='view-components-SiteHeader'
const catalogueIndex=computed(()=>bodies.value[headerId]?.leftNav?.findIndex(usesDesktopCatalogue)??-1)
const catalogueFields=computed(()=>active.value?.id==='menu:左側主導覽'&&catalogueIndex.value>=0
 ?active.value.fields.filter((f:any)=>desktopCatalogueFields.includes(f.path)):[])
const commonFields=computed<any[]>(()=>{
 const body=bodies.value[franchiseMarqueeDocument]
 const repeated=active.value?.kind==='franchise-marquee'?franchiseMarqueeRows.filter(row=>valueAt(body,row.image)===valueAt(body,row.loop)).map(row=>row.loop):[]
 return visibleFields.value.filter((f:any)=>f.schema.type!=='array'&&!f.schema.advanced&&f!==hardwareTitleField.value&&!catalogueFields.value.includes(f)&&!systemCabinetFields.value.includes(f)&&!homeOneSettings.value.includes(f)&&!builderNoticeFields.value.includes(f)&&!repeated.includes(f.path))
})
const brochureSettings=computed(()=>franchiseDownloadCommon.value?commonFields.value.filter(f=>franchiseDownloadActions.includes(f.path)):[])
const downloadSettings=computed(()=>franchiseDownloadCommon.value?franchiseDownloadSettings.map(group=>({...group,fields:commonFields.value.filter(f=>group.fields.includes(f.path))})):[])
const mainFields=computed(()=>commonFields.value.filter(f=>!brochureSettings.value.includes(f)&&!downloadSettings.value.some(group=>group.fields.includes(f))))
const sharedFormGroups=computed(()=>{
 const groups=sharedNews.value?{'文章底部的分類選單':{},[newsTopLinks]:{}}:sharedKnowledge.value?knowledgeSharedSections:inspirationSharedGroups
 return Object.entries(groups).map(([key,group])=>({
  key,title:'title' in group?group.title:key,help:'help' in group?group.help:'',fields:commonFields.value.filter((f:any)=>f.formGroup===key),
 })).filter(group=>group.fields.length)
})
const systemCabinetGroups=computed(()=>Object.entries(knowledgeArticleSections).map(([key,section])=>({
 key,title:section.title,fields:systemCabinetFields.value.filter((f:any)=>f.formGroup===key),
})).filter(group=>group.fields.length))
function systemCabinetChanged(item:any){
 return item?.slug==='systemcabinet'&&systemCabinetFields.value.some((f:any)=>JSON.stringify(pageFieldValue(bodies.value,f))!==JSON.stringify(pageFieldValue(baseline.value,f)))
}
function restoreSystemCabinet(){
 for(const field of systemCabinetFields.value)update(field,pageFieldValue(baseline.value,field))
}
function focusSystemCabinet(group=''){
 const section=formRoot.value?.querySelector('.cms-knowledge-article-sections')
 const target=group?section?.querySelector<HTMLElement>(`[data-position-group="${CSS.escape(group)}"] > summary`):section?.querySelector<HTMLElement>('h3')
 target?.focus()
}
watch([knowledgeSection,workbench.editing],async ([group,editing])=>{
 if(!group||editing!=='knowledge-articles:items')return
 await nextTick()
 focusSystemCabinet(group)
},{flush:'post'})
async function openSystemCabinet(block=typeof route.query.block==='string'?route.query.block:'knowledge:系統櫃材質重點'){
 const list='knowledge-articles:items'
 const article=bodies.value['knowledge-articles']?.items?.find((item:any)=>item.slug==='systemcabinet')
 if(!article)return
 const item=itemKey(article,0)
 if(route.query.block!==block||route.query.list!==list||route.query.item!==item||route.query.legacy)
  await router.replace({query:{...route.query,legacy:undefined,block,list,item}})
}
function catalogueChanged(item:any){
 return usesDesktopCatalogue(item)&&catalogueFields.value.some((f:any)=>pageFieldValue(bodies.value,f)!==pageFieldValue(baseline.value,f))
}
function restoreCatalogue(){
 for(const field of catalogueFields.value)update(field,pageFieldValue(baseline.value,field))
}
async function openCatalogueEditor(){
 const index=catalogueIndex.value
 if(index<0)return
 const list=headerId+':leftNav',item=workbench.rows.value[list]?.order[index]??itemKey(bodies.value[headerId].leftNav[index],index)
 await router.replace({query:{...route.query,block:'menu:左側主導覽',list,item}})
}
const settingGroups=computed(()=>{
 const groups=new Map<string,{title:string;readingGroup?:string;imageReading?:boolean;formGroup?:string;fields:any[]}>()
 for(const field of visibleFields.value){
  if(!field.schema.advanced||systemCabinetFields.value.includes(field))continue
  const {readingGroup,imageReading}=field.schema
  const key=readingGroup||field.documentId+':'+field.path
  if(!groups.has(key))groups.set(key,{title:imageReading?'圖片朗讀設定':readingGroup?readingGroup+'的朗讀文字':field.schema.disclosureTitle||field.label,readingGroup,imageReading,formGroup:field.formGroup,fields:[]})
  groups.get(key)!.fields.push(field)
 }
 return Array.from(groups.values())
})
const positionPresentation=computed(()=>({...pageData.value?.positionPresentation,rows:pageData.value?.rowPresentation}))
function blockPicture(block:any){
 const shortcut=builderCatalogueShortcuts.value.find(item=>item.id===block.id)
 if(shortcut)return shortcut.image
 if(seriesPart.value){
  const item=workbench.selection.value?.value
  return firstImage(block.id==='intro'?item?.suites:block.fields.map((key:string)=>item?.[key]))
 }
 if(block.kind==='news-shared'&&positionPresentation.value.detailSample?.image)return positionPresentation.value.detailSample.image
 return pagePositionContent(block,bodies.value,positionPresentation.value).thumbnail
}
function trackField(event:FocusEvent){
 const target=event.target as HTMLElement
 if(target.closest('[data-cms-keep-field]'))return
 focusedField.value=target.closest('[data-cms-path]')?.getAttribute('data-cms-path')||''
 const group=target.closest<HTMLElement>('[data-position-group]')?.dataset.positionGroup
 if(group||(franchiseDownloadCommon.value||franchiseCatalogue.value||builderNoticeFields.value.length)&&focusedField.value)focusedGroup.value=group||''
 if(active.value?.preview==='inspiration-breadcrumb'&&focusedField.value.startsWith('copy.breadcrumb'))
  focusedGroup.value=focusedField.value==='copy.breadcrumbDetail'?'breadcrumb-detail':''
}
watch([()=>active.value?.id,storeRegion],()=>{workbench.focused.value='';workbench.editing.value='';workbench.selection.value=null;focusedField.value=''},{flush:'sync'})
function closeItem(){workbench.editing.value='';workbench.returnFocus()}
function preparePreview(){previewPath.value=props.id==='home'||locationHref.value===active.value?.href?'':locationHref.value;showPreview()}
const title=computed(()=>namedPages.value?.find(p=>p.id===props.id)?.title||pageData.value?.title||(props.id==='home'?'首頁':'修改頁面'))
const modified=computed(()=>blocks.value.filter(b=>editableBlockFields(b).some((f:any)=>{
 const value=(source:Record<string,any>)=>{
  const field=pageFieldValue(source,f)
  return f.schema.recentArticleIds?recentArticleIndexes(field,f.schema.recentArticleIds).map(index=>field[index]):field
 }
 return JSON.stringify(value(bodies.value))!==JSON.stringify(value(baseline.value))
})))
const dirty=computed(()=>modified.value.length>0),pending=computed(()=>hasPageChanges(blocks.value,Object.fromEntries(docs.value.map(d=>[d.id,d.publishedBody])),baseline.value))
const impactContext=computed(()=>({heroTitlePages:pageData.value?.positionPresentation?.heroTitlePages,caseDetailRoute:pageData.value?.positionPresentation?.detailCase?.route,newsDetailRoute:pageData.value?.positionPresentation?.detailPath}))
const changeDetails=computed(()=>pageChanges(blocks.value,docs.value,baseline.value,bodies.value,impactContext.value)),changesOpen=ref(false)
const status=computed(()=>dirty.value?`尚未儲存 · ${changeDetails.value.length} 處修改`:pending.value?'已儲存，官網尚未更新':'官網已更新')
const shared=computed(()=>changeImpacts(changeDetails.value).filter(i=>i.href.split('#')[0]!==pageData.value?.href.split('#')[0]||/全站|所有官網頁面/.test(i.label)))
const returnLink=computed(()=>{const {sitePage,block,edit,part,seriesPart,legacy,field,item,list,create,returnPath,returnSection,...query}=route.query;if(typeof returnSection==='string')query.section=returnSection;return{path:returnPath==='/admin/content'?'/admin/content':props.id==='home'?'/admin':'/admin/content',query}})
const activeDocs=computed(()=>docs.value.filter(d=>visibleFields.value.some((f:any)=>f.documentId===d.id)))
const historyDocs=computed(()=>activeDocs.value.filter(d=>!franchiseNews.value||d.id!=='news-articles'))
const unpublishDocuments=computed(()=>docs.value.filter(d=>d.publishedId&&(!pageData.value?.unpublishIds||pageData.value.unpublishIds.includes(d.id))))
const impacts=computed(()=>{
 const block=active.value
 const changes=pending.value?pageChanges(blocks.value,activeDocs.value,Object.fromEntries(activeDocs.value.map(d=>[d.id,d.publishedBody??d.body])),bodies.value,impactContext.value):changeDetails.value
 if(franchiseFaq.value){
  const related=changes.filter((change:{blockId?:string;documentId:string;path:string})=>change.blockId===block.id||visibleFields.value.some((f:any)=>f.documentId===change.documentId&&f.path===change.path))
  return related.length?changeImpacts(related):blockImpacts({...block,fields:visibleFields.value},[],impactContext.value)
 }
 if(franchiseNews.value&&!changes.some((change:{blockId?:string})=>change.blockId===block.id))
  return blockImpacts({...block,fields:block.fields.filter((f:any)=>f.documentId!=='news-articles')},[],impactContext.value)
 if(!newsRecent.value)return blockImpacts(block,changes,impactContext.value)
 const item=workbench.selection.value?.value?.id
 const edited=changes.filter((change:{blockId?:string;documentId:string;rowId?:string|number})=>change.blockId===block.id||(item!==undefined&&change.documentId==='news-articles'&&change.rowId===item))
 return edited.length?changeImpacts(edited):blockImpacts({...block,fields:block.fields.filter((f:any)=>!f.schema.recentArticleIds)},[],impactContext.value)
})
const payload=(action:string)=>({action,documents:docs.value.map(d=>({id:d.id,revision:d.revision,body:bodies.value[d.id]}))})
async function selectBlock(id:string){locationOpen.value=false;await router.replace({query:{...route.query,block:id,legacy:undefined,field:undefined,list:undefined,item:undefined}});await nextTick();formRoot.value?.querySelector<HTMLElement>('.cms-block-title')?.focus({preventScroll:true})}
function update(f:any,value:any){
 const body=bodies.value[f.documentId]
 const next=f.documentId===franchiseMarqueeDocument&&active.value?.kind==='franchise-marquee'?updateFranchiseMarqueeImage(body,f.path,value)
  :f.documentId===franchiseMarqueeDocument&&franchiseFaq.value&&f.path==='copy.field52'?updateFranchiseFaqDestination(body,value):withValue(body,f.path,value)
 bodies.value={...bodies.value,[f.documentId]:next}
}
async function load(){error.value='';try{const result=await api('page-editors/'+props.id,{timeout:20000,retry:0});if(!Array.isArray(result?.documents)||!Array.isArray(result?.blocks))throw Error('伺服器未回傳完整頁面內容，請確認連線後重試。');workbench.rows.value={};pageData.value=result;docs.value=result.documents;bodies.value=Object.fromEntries(result.documents.map((d:any)=>[d.id,d.body]));baseline.value=JSON.parse(JSON.stringify(bodies.value));if(props.id==='knowledge'&&(isSystemCabinetDocument(route.query.legacy)||knowledgeSection.value)){
 await openSystemCabinet(knowledgeSection.value?String(route.query.block):'knowledge:系統櫃材質重點')
 }else if(route.query.legacy){const b=result.blocks.find((b:any)=>b.fields.some((f:any)=>f.documentId===route.query.legacy));if(b)await router.replace({query:{...route.query,block:b.id,legacy:undefined}})}if(props.id==='menu'&&route.query.block==='menu:展開選單中的型錄入口')await openCatalogueEditor()}catch(e){error.value=message(e)}}
async function focusError(){const issue=fieldErrors.value[0];if(!issue)return;const block=[active.value,...blocks.value].find(b=>editableBlockFields(b).some((f:any)=>{
 if(f.documentId!==issue.documentId||!(issue.path===f.path||issue.path.startsWith(f.path+'.')))return false
 const ids=f.schema.rowIds||f.schema.recentArticleIds
 if(!ids)return true
 const index=Number(issue.path.slice(f.path.length+1).split('.')[0])
 return recentArticleIndexes(pageFieldValue(bodies.value,f),ids).includes(index)
 }));if(block&&(!seriesPart.value||block.id!==active.value?.id))await selectBlock(block.id);const part=seriesPart.value&&issue.documentId==='data-kitchenSeries'&&sectionForSeriesField(issue.path);if(part)await chooseLocation(part.id);if(issue.documentId===headerId&&desktopCatalogueFields.includes(issue.path))await openCatalogueEditor();if(props.id==='knowledge'&&isSystemCabinetDocument(issue.documentId)){const field=systemCabinetFields.value.find((f:any)=>f.documentId===issue.documentId&&(issue.path===f.path||issue.path.startsWith(f.path+'.')));await openSystemCabinet('knowledge:'+(field?.formGroup||'系統櫃材質重點'))}
 if(regionField.value&&issue.documentId===regionField.value.documentId&&issue.path.startsWith('regionCities.'))selectStoreRegion(issue.path.split('.')[1])
 await nextTick();await nextTick();const input=formRoot.value?.querySelector<HTMLElement>('[aria-invalid=true]');for(let p=input?.parentElement;p;p=p.parentElement)if(p instanceof HTMLDetailsElement)p.open=true;input?.focus()}
function reload(){if(!dirty.value||window.confirm('重新載入會捨棄本頁尚未儲存的修改，確定繼續？'))void load()}

const previewOpen=ref(false),previewReady=ref(false),previewResult=ref<any>(null),previewError=ref(''),previewState=ref(''),mobile=ref(false),previewPath=ref(''),initialToken=ref(''),previewFrame=ref<HTMLIFrameElement>(),previewSize=ref({width:480,height:640})
let timer:ReturnType<typeof setTimeout>|undefined,previewTimer:ReturnType<typeof setTimeout>|undefined,sequence=0,needsReload=false,recovery=0,controller:AbortController|undefined,observer:ResizeObserver|undefined
const previewScale=computed(()=>Math.min(1,previewSize.value.width/(mobile.value?390:1440)))
const frameStyle=computed(()=>({width:(mobile.value?390:1440)+'px',height:previewSize.value.height/(previewScale.value||1)+'px',transform:`scale(${previewScale.value})`}))
const previewUrl=computed(()=>{const [path,anchor]=(previewPath.value||active.value?.href||pageData.value?.href||'/').split('#'),slide=props.id==='home'&&active.value?.id==='home:主視覺輪播'?`&cmsSlide=${workbench.selection.value?.index||0}`:'';return`${path}${path.includes('?')?'&':'?'}cmsPreview=page:${encodeURIComponent(props.id)}&cmsDraft=${encodeURIComponent(initialToken.value)}${slide}${anchor?'#'+anchor:''}`})
const choices=computed(()=>docs.value.flatMap(d=>{
 const b=bodies.value[d.id],items=d.id==='data-kitchenSeries'?b?.KITCHEN_SERIES_PAGES:d.id==='data-storeCases'?b?.storeCases:['custom-cases','knowledge-articles','news-articles'].includes(d.id)?b?.items:[]
 return(items||[]).filter((i:any)=>i.enabled!==false&&(!pageData.value?.category||i.summary?.category===pageData.value.category)).map((i:any)=>({label:i.summary?.title||i.title||i.name||i.slug,path:seriesLocation(itemWebsitePath(d.id,i)||'')}))
}))
const locationHref=computed(()=>{const selected=workbench.selection.value,item=selected?.value;if(item?.enabled===false||item?.available===false)return pageData.value?.href||'/';return seriesLocation(positionBlock.value?.previewPage||(props.id==='home'?'':selected?.href||itemWebsitePath(selected?.documentId,item))||positionBlock.value?.href||pageData.value?.href||'/')})
const publicLocation=computed(()=>{
 const selected=workbench.selection.value
 if(newsArticleList.value&&!workbench.editing.value){
  const listId=franchiseNews.value?franchiseMarqueeDocument:props.id==='news-latest'?'view-pages-news-latest-index':'view-pages-news-index'
  return docs.value.find(d=>d.id===listId)?.publishedBody?positionBlock.value?.href:''
 }
 if(props.id!=='home'&&selected&&(itemWebsitePath(selected.documentId,selected.value)||selected.href)){
  const published=itemPublication(docs.value.find(d=>d.id===selected.documentId),selected.path,selected.value,selected.index)
  return published.visible?seriesLocation(positionBlock.value?.previewPage&&knowledgeArticles.value?positionBlock.value.previewPage:itemWebsitePath(selected.documentId,published.item)||selected.href||'/'):''
 }
 return activeDocs.value.length&&activeDocs.value.every(d=>d.publishedBody)?positionBlock.value?.previewPage||positionBlock.value?.href||pageData.value?.href||'/':''
})
watch(previewFrame,frame=>{observer?.disconnect();if(frame?.parentElement){observer=new ResizeObserver(([entry])=>{if(entry)previewSize.value={width:entry.contentRect.width,height:entry.contentRect.height}});observer.observe(frame.parentElement)}},{flush:'post'})
function failPreview(reason:string){clearTimeout(previewTimer);previewReady.value=false;needsReload=true;previewError.value=reason;previewState.value='目前輸入尚未套用，可重試或返回修改'}
function sendPreview(){if(!previewOpen.value||!previewReady.value||!previewResult.value||needsReload)return;previewState.value='正在更新效果…';previewFrame.value?.contentWindow?.postMessage(JSON.parse(JSON.stringify({type:'sakura:preview',documents:previewResult.value.documents,previewToken:previewResult.value.previewToken})),location.origin);clearTimeout(previewTimer);previewTimer=setTimeout(()=>failPreview('官網預覽沒有回應，請重新載入；目前輸入仍保留。'),20000)}
function receive(event:MessageEvent){if(!previewOpen.value||event.origin!==location.origin||event.source!==previewFrame.value?.contentWindow)return
 if(event.data?.type==='sakura:ready'){previewReady.value=true;if(previewResult.value?.documents.length!==docs.value.length||!previewResult.value.documents.every((d:any)=>JSON.stringify(d.body)===JSON.stringify(bodies.value[d.id])))return;needsReload=false;sendPreview()}
 if(event.data?.type==='sakura:applied'&&!needsReload&&event.data.previewToken===previewResult.value?.previewToken){clearTimeout(previewTimer);previewState.value='目前輸入的效果・尚未更新官網';previewError.value='';recovery=0}
 if(event.data?.type==='sakura:preview-error'&&!needsReload){failPreview(event.data.message||'預覽載入失敗。');if(event.data.statusCode===404&&event.data.previewExpired&&recovery<1){recovery++;void reloadPreview(false)}}
}
async function checkPreview(show=previewOpen.value){
 if(!docs.value.length)return
 controller?.abort();controller=new AbortController();const n=++sequence,snapshot=JSON.stringify(payload('preview'));if(show)previewState.value='正在準備目前輸入…'
 try{const r=await api('page-editors/'+props.id,{method:'POST',body:payload('preview'),timeout:20000,retry:0,signal:controller.signal});if(n!==sequence||snapshot!==JSON.stringify(payload('preview')))return;if(!Array.isArray(r?.documents)||typeof r?.previewToken!=='string')throw Error('官網效果未收到完整回應，請確認連線後重試；目前輸入仍保留。');fieldErrors.value=[];if(show&&previewOpen.value){previewResult.value=r;previewError.value='';if(!initialToken.value||needsReload||!previewReady.value){needsReload=false;previewReady.value=false;initialToken.value=r.previewToken;previewState.value='正在載入官網畫面…';clearTimeout(previewTimer);previewTimer=setTimeout(()=>failPreview('官網畫面載入超過 20 秒，請重試；你仍可繼續修改。'),20000)}else sendPreview()}return r}catch(e:any){if(n!==sequence)return;fieldErrors.value=e.data?.data?.fieldErrors||[];if(show)failPreview(message(e));else error.value=message(e);await focusError()}
}
function showPreview(){mobile.value=window.innerWidth<768;previewOpen.value=true;void checkPreview(true);nextTick(()=>document.querySelector<HTMLElement>('.cms-effect-panel')?.scrollIntoView({block:'nearest'}))}
function closePreview(){previewOpen.value=false;sequence++;controller?.abort();clearTimeout(timer);clearTimeout(previewTimer);observer?.disconnect();previewReady.value=false;previewResult.value=null;initialToken.value='';previewError.value='';nextTick(()=>document.querySelector<HTMLElement>('.cms-savebar .cms-preview-button')?.focus())}
async function reloadPreview(manual=true){if(manual)recovery=0;needsReload=true;previewReady.value=false;await checkPreview(true)}
watch(bodies,()=>{if(!previewOpen.value)return;clearTimeout(timer);timer=setTimeout(()=>void checkPreview(true),400)},{deep:true})
watch(previewPath,()=>{if(previewResult.value){needsReload=true;void checkPreview(true)}})

const confirming=ref(false),confirmMode=ref('publish'),confirmation=ref<any>(),validating=ref(false)
async function save(action='save'){
 if(busy.value)return;busy.value=true;error.value='';notice.value=''
 try{const r=await api('page-editors/'+props.id,{method:'POST',body:payload(action),timeout:20000,retry:0});if(!Array.isArray(r?.documents)||r.documents.length!==docs.value.length||new Set(r.documents.map((d:any)=>d.id)).size!==docs.value.length||r.documents.some((d:any)=>!docs.value.some(x=>x.id===d.id)||!Number.isSafeInteger(d.revision)||!d.body||typeof d.body!=='object'||Array.isArray(d.body)))throw Error('伺服器未回傳完整儲存結果，請確認連線後重試；目前輸入仍保留。');for(const d of r.documents){bodies.value[d.id]=d.body;const saved=docs.value.find(x=>x.id===d.id);Object.assign(saved,d);if(action==='publish')saved.publishedBody=JSON.parse(JSON.stringify(d.body));if(action==='unpublish'&&!d.publishedId)saved.publishedBody=null}baseline.value=JSON.parse(JSON.stringify(bodies.value));for(const [scope,state]of Object.entries(workbench.rows.value)){const [id,...parts]=scope.split(':');const rows=valueAt(baseline.value[id],parts.join(':'))||[];state.saved=Object.fromEntries(state.order.map((key:string,i:number)=>[key,JSON.parse(JSON.stringify(rows[i]??null))]))}confirming.value=false;fieldErrors.value=[];notice.value=action==='publish'?'官網已更新。':action==='unpublish'?'已暫停本頁內容的官網顯示。':pending.value?'本頁修改已儲存，官網尚未更新。':'本頁內容已儲存，與官網相同。';await refreshNuxtData(['cms-pages','cms-workspaces','cms-documents','cms-overview']);return true}catch(e:any){confirming.value=false;error.value=message(e);fieldErrors.value=e.data?.data?.fieldErrors||[];await focusError();return false}finally{busy.value=false}
}
async function requestSave(){if(!shared.value.length)return save();confirmMode.value='save';confirmation.value={current:changeDetails.value,saved:[],impacts:shared.value};confirming.value=true}
async function confirmPublish(){if(validating.value||busy.value)return;clearTimeout(timer);error.value='';validating.value=true;confirmMode.value='publish';try{const r=await checkPreview(false);if(r){confirmation.value=r.review;confirming.value=true}}finally{validating.value=false}}
function unpublish(){
 confirmMode.value='unpublish'
 confirmation.value={impacts:changeImpacts(unpublishDocuments.value.map(d=>({documentId:d.id,path:''})),impactContext.value)}
 confirming.value=true
}
async function restore(d:any,version:string){if(dirty.value){error.value='請先儲存本頁修改，再取回以前的內容。';return}if(!window.confirm('這會將同份資料的完整舊版另存為草稿，可能包含其他區塊；官網不會立即改變。確定繼續？'))return;busy.value=true;try{await api('documents/'+d.id,{method:'POST',body:{action:'restore',revision:d.revision,version}});await load();notice.value='已取回以前的內容，確認後再更新官網。'}catch(e){error.value=message(e)}finally{busy.value=false}}
function beforeUnload(e:BeforeUnloadEvent){if(dirty.value){e.preventDefault();e.returnValue=''}}
watch(()=>props.id,load,{immediate:true})
onMounted(()=>{window.addEventListener('beforeunload',beforeUnload);window.addEventListener('message',receive)})
onBeforeUnmount(()=>{sequence++;controller?.abort();observer?.disconnect();clearTimeout(timer);clearTimeout(previewTimer);window.removeEventListener('beforeunload',beforeUnload);window.removeEventListener('message',receive)})
onBeforeRouteLeave(()=>!dirty.value||window.confirm('本頁還有尚未儲存的修改，確定離開？'))
onBeforeRouteUpdate((to,from)=>to.query.sitePage===from.query.sitePage||!dirty.value||window.confirm('本頁還有尚未儲存的修改，確定離開？'))
</script>
<template><section ref="formRoot" class="cms-page-editor cms-work-editor cms-workbench cms-position-workbench" :class="{'cms-is-editing':!!workbench.editing.value&&!catalogueWorkbench,'cms-catalogue-item-editing':catalogueItemEditing,'cms-text-editing':!collections.length,'cms-inspiration-workbench':id==='inspiration','cms-home-workbench':id==='home'}" :aria-busy="busy" @focusin="trackField">
 <header class="cms-page-editor-heading"><div class="cms-title-group"><NuxtLink :to="returnLink" class="cms-editor-breadcrumb">← 返回</NuxtLink><h1>{{ title }}<span>｜{{ id==='inspiration'?active?.name:'內容管理' }}</span></h1></div><AdminContentSearch /><a v-if="publicLocation" :href="publicLocation" target="_blank" rel="noopener noreferrer" class="cms-button">查看官網 ↗</a><button v-else type="button" class="cms-button" @click="preparePreview">預覽草稿</button></header>
 <p v-if="error" class="cms-error" role="alert">{{ error }} <button type="button" class="cms-button" @click="reload">查看最新內容</button></p><p v-if="notice" class="cms-notice" role="status">{{ notice }}</p><p v-if="!pageData&&!error" class="cms-empty" role="status">正在載入頁面內容…</p>
 <template v-if="pageData">
 <button type="button" class="cms-button cms-location-toggle" :aria-expanded="locationOpen" @click="locationOpen=true">選擇區塊：{{ seriesPart?.name||active?.name }} ▾</button>
 <div class="cms-page-edit-layout">
  <nav class="cms-block-nav cms-panel" aria-label="官網區塊"><h2>選擇{{ title==='首頁'?'首頁':'官網' }}區塊</h2><button v-for="b in navigationBlocks.filter(b=>!('secondary' in b&&b.secondary))" :key="b.id" type="button" :aria-current="currentLocation===b.id?'location':undefined" @click="chooseLocation(b.id)"><AdminThumbnail :src="blockPicture(b)" :alt="b.name+'區塊縮圖'" /><span><strong>{{ b.name }}</strong><small>{{ b.hint }}</small></span><i v-if="modified.some(m=>m.id===b.id)" aria-label="尚未儲存">●</i></button><details v-if="blocks.some(b=>b.secondary)"><summary>其他設定</summary><button v-for="b in blocks.filter(b=>b.secondary)" :key="b.id" type="button" @click="selectBlock(b.id)"><AdminThumbnail :src="blockPicture(b)" :alt="b.name+'區塊縮圖'" /><span>{{ b.name }}</span></button></details></nav>
  <div class="cms-page-form cms-panel">
   <div v-if="catalogueWorkbench" id="cms-item-editor" v-show="catalogueItemEditing" />
   <div class="cms-block-heading"><div><h2 class="cms-block-title" tabindex="-1">{{ caseManagement?'自建案例':seriesPart?.name||active?.name }}</h2><p v-if="!caseManagement" class="cms-field-help">{{ seriesPart?.hint||active?.hint }}<template v-if="collections.length&&!newsArticleList">；選內容看位置，按「編輯」修改。</template></p></div><button type="button" class="cms-button cms-position-toggle" data-cms-keep-field @click="positionOpen=true">看位置</button></div>
   <div v-if="active?.id==='franchise:加盟資料下載入口'" class="cms-download-editor-link">
    <p class="cms-field-help">這裡編輯加盟介紹上的入口。下載頁的大圖、主標題和按鈕請到下載頁編輯。</p>
    <NuxtLink :to="pageEditorLink('franchise-download',route.query)" class="cms-button">編輯「加盟資料下載」頁 →</NuxtLink>
   </div>
   <p v-if="caseManagement" class="cms-case-scope">這裡管理從後台新增的案例。請到<NuxtLink :to="pageEditorLink(storeCasesPageId,route.query)">「門市案例」</NuxtLink>修改門市文章與照片。從其他系統同步的案例請回原系統修改。</p>
   <p v-if="franchiseNews" class="cms-case-scope">按「編輯文章」修改標題、封面、摘要或內文。更新後，「優惠消息」也會使用修改後的文章。</p>
   <fieldset v-if="homeOneSettings.length" :disabled="busy" class="cms-edit-form cms-home-one-images">
    <legend>區塊圖片</legend>
    <AdminFields v-for="f in homeOneSettings" :key="f.path" :model-value="pageFieldValue(bodies,f)" :schema="f.schema" :document-id="f.documentId" :path="f.path" @update:model-value="update(f,$event)" />
    <p class="cms-field-help">三項服務共用一張合圖。下方可逐筆修改標題與說明。</p>
   </fieldset>
   <fieldset v-if="franchiseCatalogue" :disabled="busy" class="cms-edit-form cms-download-file-settings" data-position-group="franchise-pdf-actions">
    <AdminFields v-for="f in commonFields" :key="f.path" :model-value="pageFieldValue(bodies,f)" :schema="f.schema" :label="f.path" :document-id="f.documentId" :path="f.path" @update:model-value="update(f,$event)" />
    <p class="cms-field-help">「線上預覽」與「下載 PDF」共用此檔案。下方圖片顯示在官網頁面中。</p>
   </fieldset>
   <fieldset :disabled="busy" class="cms-edit-form cms-collection-fields"><template v-for="f in collections" :key="f.documentId+':'+f.path+(newsRecent?':recent':'')"><div v-if="f.documentId===headerId&&f.path==='leftNav'" class="cms-block-field">
    <AdminItems :model-value="pageFieldValue(bodies,f)" :schema="f.schema" :document-id="f.documentId" :path="f.path" :has-related-changes="catalogueChanged" @update:model-value="update(f,$event)" @cancel-related="restoreCatalogue">
     <template #item-settings="{row}"><fieldset v-if="usesDesktopCatalogue(row.value)&&catalogueFields.length" class="cms-fields">
      <legend>型錄按鈕</legend>
      <AdminFields v-for="field in catalogueFields" :key="field.path" :model-value="pageFieldValue(bodies,field)" :schema="field.schema" :document-id="field.documentId" :path="field.path" @update:model-value="update(field,$event)" />
     </fieldset></template>
    </AdminItems>
   </div><div v-else-if="hardwareTitleField&&f.path==='PRODUCT_CATALOGUES'" class="cms-block-field">
    <AdminItems :model-value="pageFieldValue(bodies,f)" :schema="f.schema" :document-id="f.documentId" :path="f.path" :display-name="row=>productCatalogueTitle(row,bodies[productCatalogueDocument]?.copy)" :has-related-changes="row=>row.id==='kitchenware-2026'&&valueAt(bodies[hardwareTitleField.documentId],hardwareTitleField.path)!==valueAt(baseline[hardwareTitleField.documentId],hardwareTitleField.path)" @update:model-value="update(f,$event)" @cancel-related="restoreHardwareTitle">
     <template #editor="{row}">
      <AdminFields v-if="row.value.id==='kitchenware-2026'" :model-value="pageFieldValue(bodies,hardwareTitleField)" :schema="hardwareTitleField.schema" :document-id="hardwareTitleField.documentId" :path="hardwareTitleField.path" @update:model-value="update(hardwareTitleField,$event)" />
      <AdminFields :model-value="row.value" :schema="productCatalogueItemSchema(f.schema.item,row.value.id)" :document-id="f.documentId" :path="f.path+'.'+row.index" @update:model-value="editCatalogueItem(f,row.index,$event)" />
     </template>
    </AdminItems>
   </div><div v-else-if="seriesPart&&f.path==='KITCHEN_SERIES_PAGES'" class="cms-block-field">
    <AdminItems :model-value="pageFieldValue(bodies,f)" :schema="f.schema" :document-id="f.documentId" :path="f.path" :series-part="seriesPart.id" @update:model-value="update(f,$event)" />
   </div><div v-else-if="knowledgeArticles&&f.documentId==='knowledge-articles'" class="cms-block-field">
    <AdminItems :model-value="pageFieldValue(bodies,f)" :schema="f.schema" :document-id="f.documentId" :path="f.path" :has-related-changes="systemCabinetChanged" @update:model-value="update(f,$event)" @cancel-related="restoreSystemCabinet">
     <template #item-actions="{row}"><button v-if="row.value.slug==='systemcabinet'" type="button" class="cms-button" @click="focusSystemCabinet()">跳到專題內文</button></template>
     <template #item-settings="{row}">
      <section v-if="row.value.slug==='systemcabinet'" class="cms-knowledge-article-sections">
       <h3 tabindex="-1">系統櫃專題內文</h3>
       <p class="cms-field-help">選擇文章的段落，就能修改該處的文字、圖片和連結。</p>
       <details v-for="group in systemCabinetGroups" :key="group.key" class="cms-secondary" :data-position-group="group.key" :open="knowledgeSection===group.key">
        <summary>{{ group.title }}</summary>
        <AdminFields v-for="field in group.fields" :key="field.documentId+':'+field.path" :model-value="pageFieldValue(bodies,field)" :schema="field.schema" :document-id="field.documentId" :path="field.path" :label="field.schema.type==='object'?field.label:undefined" @update:model-value="update(field,$event)" />
       </details>
      </section>
     </template>
    </AdminItems>
   </div><div v-else-if="active?.kind==='franchise-support'||franchiseFaq" class="cms-block-field">
    <p v-if="franchiseFaq" class="cms-field-help">官網顯示排序前 {{ FRANCHISE_FAQ_DISPLAY_LIMIT }} 題。</p>
    <AdminItems :model-value="pageFieldValue(bodies,f)" :schema="f.schema" :document-id="f.documentId" :path="f.path" :fallback-image="franchiseFaq?faqCover:franchiseSupportImage(bodies)" :display-limit="franchiseFaq?FRANCHISE_FAQ_DISPLAY_LIMIT:undefined" @update:model-value="update(f,$event)" />
   </div><div v-else-if="active?.kind==='builders-home-one'" class="cms-block-field">
    <AdminItems :model-value="pageFieldValue(bodies,f)" :schema="f.schema" :document-id="f.documentId" :path="f.path" :fallback-image="homeOneThumbnail" @update:model-value="update(f,$event)">
     <template #editor="{row}">
      <AdminFields :model-value="row.value.title" :schema="f.schema.item.fields.title" :document-id="f.documentId" :path="`services.${row.index}.title`" @update:model-value="updateHomeOneService(f,row.index,'title',$event)" />
      <AdminFields :model-value="row.value.copy.join('\n')" :schema="{...f.schema.item.fields.copy,type:'string',help:'每行顯示為一句服務說明。'}" :document-id="f.documentId" :path="`services.${row.index}.copy`" @update:model-value="updateHomeOneService(f,row.index,'copy',$event)" />
     </template>
    </AdminItems>
   </div><div v-else class="cms-block-field"><AdminFields :model-value="pageFieldValue(bodies,f)" :schema="f.schema" :label="f.path.split('.').at(-1)" :document-id="f.documentId" :path="f.path" @update:model-value="update(f,$event)" /></div></template></fieldset>
   <fieldset v-if="builderNoticeFields.length" :disabled="busy" class="cms-edit-form cms-builder-notice-settings" :data-position-group="builderCatalogueNoticeAnchor">
    <legend>型錄下方說明</legend>
    <p class="cms-field-help">這兩段文字會顯示在官網型錄卡片下方。</p>
    <AdminFields v-for="f in builderNoticeFields" :key="f.path" :model-value="pageFieldValue(bodies,f)" :schema="f.schema" :document-id="f.documentId" :path="f.path" @update:model-value="update(f,$event)" />
   </fieldset>
   <details v-if="collections.length&&commonFields.length&&!franchiseCatalogue" class="cms-common-settings" :open="['builders-appointment','product-care'].includes(active?.kind)||undefined">
    <summary>{{ franchiseFaq?'右側加盟資料卡片':newsRecent?'側欄標題設定':active?.kind==='product-care'?'選購指南標題與共用文字':active?.id==='home:主視覺輪播'?'輪播區塊共用設定':'本區塊共用設定' }}</summary>
    <p v-if="active?.kind==='builders-strengths'" class="cms-field-help">這些文字顯示在官網圖文旁，留空時沿用官網原文。</p>
    <p v-if="active?.kind==='builders-appointment'" class="cms-field-help">中英文主標題及前置英文留空時沿用官網原文。</p>
    <fieldset :disabled="busy" class="cms-edit-form" :class="{'cms-franchise-support-settings':active?.kind==='franchise-support'}">
     <div v-for="f in commonFields" :key="f.documentId+':'+f.path" class="cms-block-field" :class="{'cms-block-field-long':active?.kind==='franchise-support'&&f.schema.format==='media'}">
      <AdminFields :model-value="pageFieldValue(bodies,f)" :schema="f.schema" :label="f.path.split('.').at(-1)" :document-id="f.documentId" :path="f.path" @update:model-value="update(f,$event)" />
     </div>
    </fieldset>
   </details>
   <fieldset v-else-if="sharedInspiration||sharedKnowledge||sharedNews" :disabled="busy" class="cms-edit-form">
    <fieldset v-for="group in sharedFormGroups" :key="group.key" :data-position-group="group.key" class="cms-inspiration-form-group" :class="{'cms-news-link-settings':sharedNews}">
     <legend>{{ group.title }}</legend>
     <p v-if="group.help" class="cms-field-help">{{ group.help }}</p>
     <AdminFields v-for="field in group.fields" :key="field.documentId+':'+field.path" :model-value="pageFieldValue(bodies,field)" :schema="field.schema" :document-id="field.documentId" :path="field.path" @update:model-value="update(field,$event)" />
    </fieldset>
   </fieldset>
   <fieldset v-else-if="regionField" :disabled="busy" class="cms-fields">
    <div class="cms-field">
     <label :for="regionLabelId">區域</label>
     <select :id="regionLabelId" :value="storeRegion" @change="changeStoreRegion"><option v-for="region in regionNames" :key="region" :value="region">{{ region }}</option></select>
    </div>
    <AdminFields :key="cityListPath" :model-value="pageFieldValue(bodies,regionField)?.[storeRegion]" :schema="regionField.schema.fields[storeRegion]" :document-id="regionField.documentId" :path="cityListPath" @update:model-value="update(regionField,{...pageFieldValue(bodies,regionField),[storeRegion]:$event})" />
   </fieldset>
   <template v-else-if="!collections.length">
    <fieldset :disabled="busy" class="cms-edit-form" :class="{'cms-franchise-download-fields':brochureSettings.length}"><div v-for="f in mainFields" :key="f.documentId+':'+f.path" class="cms-block-field" :class="{'cms-block-field-long':brochureSettings.length&&(f.schema.format==='media'||f.path==='copy.text9')}"><AdminFields :model-value="pageFieldValue(bodies,f)" :schema="f.schema" :label="f.path.split('.').at(-1)" :document-id="f.documentId" :path="f.path" @update:model-value="update(f,$event)" /></div></fieldset>
    <section v-if="brochureSettings.length" class="cms-download-actions-settings">
     <h3>預覽與下載按鈕</h3>
     <p class="cms-field-help">更換 PDF 請到「型錄管理」。</p>
     <fieldset :disabled="busy" class="cms-edit-form cms-franchise-download-fields">
      <div v-for="f in brochureSettings" :key="f.path" class="cms-block-field"><AdminFields :model-value="pageFieldValue(bodies,f)" :schema="f.schema" :document-id="f.documentId" :path="f.path" @update:model-value="update(f,$event)" /></div>
     </fieldset>
    </section>
    <details v-for="group in downloadSettings" :key="active.id+group.name" class="cms-secondary" :open="legacyDownloadGroup?.name===group.name" :data-position-group="group.name">
     <summary>{{ group.name }}</summary>
     <p class="cms-field-help">{{ group.help }}</p>
     <fieldset :disabled="busy" class="cms-edit-form">
      <AdminFields v-for="f in group.fields" :key="f.path" :model-value="pageFieldValue(bodies,f)" :schema="f.schema" :document-id="f.documentId" :path="f.path" @update:model-value="update(f,$event)" />
     </fieldset>
    </details>
   </template>
   <p v-if="active?.help" class="cms-field-help cms-position-help">{{ active.help }}</p>
   <details v-for="group in settingGroups" :key="active.id+group.title" :open="!group.imageReading&&!collections.length&&!commonFields.length" class="cms-secondary cms-purpose-settings" :data-position-group="group.formGroup">
    <summary>{{ group.title }}</summary>
    <p v-if="group.imageReading" class="cms-field-help">{{ imageReadingHelp }}</p>
    <p v-else-if="group.readingGroup" class="cms-field-help">訪客使用螢幕閱讀器瀏覽{{ group.readingGroup }}時，會聽到這裡設定的文字。平常可沿用原文。</p>
    <fieldset :disabled="busy" class="cms-edit-form"><div v-for="f in group.fields" :key="f.documentId+':'+f.path"><AdminFields :model-value="pageFieldValue(bodies,f)" :schema="f.schema" :document-id="f.documentId" :path="f.path" @update:model-value="update(f,$event)" /></div></fieldset>
   </details>
   <details class="cms-secondary"><summary>影響頁面（{{ impacts.length }}）</summary><ul v-if="impacts.length"><li v-for="i in impacts" :key="i.href+i.label"><a :href="i.href" target="_blank" rel="noopener noreferrer">{{ i.label }} ↗</a></li></ul><p v-else class="cms-field-help">這些設定目前沒有官網顯示位置。</p></details>
   <details v-if="session?.role==='admin'" class="cms-secondary"><summary>其他操作</summary><button type="button" class="cms-button" :disabled="busy||dirty||!unpublishDocuments.length" @click="unpublish">暫停本頁內容</button></details>
   <details class="cms-secondary"><summary>過去的修改</summary><p v-if="franchiseNews" class="cms-field-help">文章版本可從<NuxtLink :to="pageEditorLink('news',route.query,'news:最新消息列表')">「優惠消息」</NuxtLink>查看。</p><section v-for="d in historyDocs" :key="d.id"><h3>{{ resourceGuide(d.id)?.tabTitle||resourceGuide(d.id)?.location[0] }}</h3><div v-for="v in d.versions" :key="v.id" class="cms-history-row"><span>{{ cmsDate(v.createdAt) }} · {{ v.actor||'初始內容' }}</span><button v-if="session?.role==='admin'" type="button" class="cms-button" :disabled="busy||dirty" @click="restore(d,v.id)">取回這份內容</button></div></section></details>
  </div>
  <aside class="cms-inspector cms-panel" :class="{'is-editing':!!workbench.editing.value&&!catalogueWorkbench}" aria-label="位置示意與編輯"><AdminPositionPreview v-if="!workbench.editing.value||catalogueWorkbench" :block="positionBlock" :bodies="bodies" :selected="positionSelection" :page-title="title" :presentation="positionPresentation" :focused-field="focusedField" /><div v-if="!catalogueWorkbench" id="cms-item-editor" /></aside>
 </div>
 <footer class="cms-savebar" aria-label="目前內容操作"><span class="cms-save-status" role="status">{{ status }} <button v-if="dirty" type="button" class="cms-change-link" @click="changesOpen=true">查看修改</button></span><div class="cms-actions"><button type="button" class="cms-button cms-preview-button" :disabled="busy" @click="preparePreview">預覽效果</button><button type="button" class="cms-button" :class="{'cms-button-gold':dirty}" :disabled="busy||!dirty" @click="requestSave">{{ busy?'處理中…':'儲存草稿' }}</button><button v-if="session?.role==='admin'" type="button" class="cms-button cms-button-gold" :disabled="busy||validating||(!dirty&&!pending)" @click="confirmPublish">{{ validating?'正在確認…':'更新官網' }}</button></div></footer>
 <AdminDialog :open="changesOpen" title="本頁尚未儲存的修改" wide @close="changesOpen=false"><AdminChangeList :changes="changeDetails" /><p v-if="!dirty" role="status">目前沒有尚未儲存的修改。</p></AdminDialog>
 </template>
 <AdminDialog :open="positionOpen" title="官網位置示意" @close="positionOpen=false"><AdminPositionPreview :block="positionBlock" :bodies="bodies" :selected="positionSelection" :page-title="title" :presentation="positionPresentation" :focused-field="focusedField" /></AdminDialog>
 <AdminDialog :open="previewOpen" title="預覽效果" wide class="cms-live-preview" @close="closePreview"><aside v-if="previewOpen" class="cms-effect-panel" aria-label="官網效果"><div class="cms-effect-toolbar"><strong>完整官網效果</strong><button type="button" class="cms-button" @click="mobile=!mobile">{{ mobile?'看桌機':'看手機' }}</button><button type="button" class="cms-button" @click="reloadPreview()">重試</button><button type="button" class="cms-button" @click="closePreview">返回修改</button></div><select v-if="choices.length" v-model="previewPath" aria-label="選擇預覽頁面"><option value="">目前頁面</option><option v-for="p in choices" :key="p.path" :value="p.path">{{ p.label }}</option></select><p class="cms-field-help" role="status">{{ previewState }}</p><p v-if="previewError" class="cms-error" role="alert">{{ previewError }} <a v-if="previewResult&&initialToken" :href="previewUrl" target="_blank" rel="noopener noreferrer" class="cms-button">另開效果畫面 ↗</a></p><div class="cms-effect-viewport" :class="{'cms-effect-mobile':mobile}"><iframe v-if="previewResult" :key="initialToken" ref="previewFrame" :style="frameStyle" :src="previewUrl" title="目前輸入的官網效果" @error="failPreview('預覽載入失敗，請重試；目前輸入仍保留。')" /></div></aside></AdminDialog>
 <AdminDialog :open="locationOpen" title="選擇要修改的位置" @close="locationOpen=false"><nav class="cms-block-nav cms-block-picker" aria-label="選擇官網區塊"><button v-for="b in navigationBlocks" :key="b.id" type="button" :aria-current="currentLocation===b.id?'location':undefined" @click="chooseLocation(b.id)"><AdminThumbnail :src="blockPicture(b)" :alt="b.name+'縮圖'" /><span><strong>{{ b.name }}</strong><small>{{ b.hint }}</small></span></button></nav></AdminDialog>
 <AdminDialog :open="confirming" :title="confirmMode==='unpublish'?'確認暫停本頁內容':confirmMode==='save'?'確認儲存共用內容':'確認要更新到官網的內容'" wide @close="confirming=false"><p>{{ confirmMode==='unpublish'?(pageData?.unpublishIds?'暫停後，官網將隱藏此頁面。請先確認下方的使用位置。':'這會暫停本頁管理的所有內容。使用共用資料的頁面也可能無法載入。'):confirmMode==='save'?'儲存草稿後，官網不會立即改變。':'以下修改會一起更新到官網，請確認項目與修改前後內容。' }}</p><p v-if="confirmMode!=='unpublish'&&confirmation&&!confirmation.current?.length&&!confirmation.saved?.length" class="cms-notice" role="status">已儲存內容與官網相同；確認後只會同步更新狀態，文字與圖片不會改變。</p><section v-if="confirmation?.current?.length"><h3>本次尚未儲存的修改（{{ confirmation.current.length }}）</h3><AdminChangeList :changes="confirmation.current" /></section><section v-if="confirmation?.saved?.length"><h3>其他已儲存、尚未更新的修改（{{ confirmation.saved.length }}）</h3><AdminChangeList :changes="confirmation.saved" /></section><details v-if="confirmation?.impacts?.length" open><summary>這些內容的官網使用位置</summary><ul><li v-for="i in confirmation.impacts" :key="i.href+i.label">{{ i.label }}</li></ul></details><p v-if="error" class="cms-error" role="alert">{{ error }}</p><div class="cms-actions"><button type="button" class="cms-button" :disabled="busy" @click="confirming=false">返回修改</button><button type="button" class="cms-button cms-button-gold" :disabled="busy" @click="save(confirmMode)">{{ busy?'處理中…':confirmMode==='unpublish'?'確認暫停':confirmMode==='save'?'確認儲存':'確認更新官網' }}</button></div></AdminDialog>
</section></template>
