import {query,fail} from './database.mjs'
import { documentSchema } from '../../shared/cms/document-schema.mjs'
import {alignSource,normalizeVideos,validate} from './content.mjs'
import {changeDocumentGroup,workspaceSummaries,readableError} from './workspaces.mjs'
import {changedItems} from '../../shared/cms/workflow.mjs'
import {resourceGuide} from '../../shared/cms/presentation.mjs'
import {orderNewsPages} from '../../shared/cms/navigation.mjs'
import {publicContent} from '../../shared/cms/public-content.mjs'
import {createDraftPreview} from './previews.mjs'
import {pageEditors,pageEditor,pageBlocks,pageSummary,valueAt,withValue,storeCasesPageId} from '../../shared/cms/page-editors.mjs'
import {editingSchema} from '../../shared/cms/presentation.mjs'
import {caseLibrary} from './case-library.mjs'
import {pagePositions,positionImage} from '../../shared/cms/positions.mjs'
import {firstImage} from '../../shared/cms/workflow.mjs'
import {pageSearchItems,publishReview,hasPageChanges,sameContent} from '../../shared/cms/changes.mjs'
import {workbenchBlocks} from '../../shared/cms/workbench.mjs'
import {kitchenHeroStory} from '../../shared/cms/kitchen-series-hero.mjs'

export const editorSchema=d=>documentSchema(d.id,JSON.parse(d.schemaJson))
export async function pageEditorSummaries(){
 const [rows,schemas]=await Promise.all([workspaceSummaries(),query("SELECT d.id,d.schemaJson,COALESCE(p.body,v.body) AS body,p.body AS publishedBody,v.body AS draftBody FROM cms.Documents d LEFT JOIN cms.Versions p ON p.id=d.publishedId LEFT JOIN cms.Versions v ON v.id=d.draftId WHERE d.id<>N'catalog-cases'")])
 const documents=schemas.recordset.map(d=>({id:d.id,schema:editorSchema(d),body:d.body?JSON.parse(d.body):{}}))
 const bodies=Object.fromEntries(await Promise.all(schemas.recordset.map(async d=>{const body=JSON.parse(d.draftBody||d.body||'{}');return[d.id,d.id.startsWith('catalog-')?await alignSource(d.id,body):body]})))
 const published=Object.fromEntries(await Promise.all(schemas.recordset.map(async d=>{const body=d.publishedBody?JSON.parse(d.publishedBody):null;return[d.id,body&&d.id.startsWith('catalog-')?sameContent(body,JSON.parse(d.draftBody||'null'))?bodies[d.id]:await alignSource(d.id,body):body]})))
 return orderNewsPages(pageEditors,published).map(p=>{const summary=pageSummary(p,rows,documents);return{...summary,pending:hasPageChanges(summary.blocks,published,bodies),blocks:summary.blocks.map(b=>({...b,items:pageSearchItems(b,bodies),fields:b.fields.map(({documentId,path,label,searchTerms})=>({documentId,path,label,searchTerms}))}))}})
}
function parameters(p){return Object.fromEntries(p.ids.map((id,i)=>['id'+i,id]))}
async function rowPresentation(p){
 const result={}
 for(const id of p.ids.filter(id=>id.startsWith('catalog-'))){
  const brand={'catalog-sakura':'櫻花','catalog-svago':'SVAGO','catalog-teka':'TEKA'}[id]
  const rows=brand?(await query("SELECT CONVERT(nvarchar(80),p.id) AS id,(SELECT TOP(1) url FROM sync.BuyKitchenPublicFiles WHERE product_id=p.id AND type IN ('main','product_images') ORDER BY CASE WHEN type='main' THEN 0 ELSE 1 END,COALESCE(sort,2147483647),id) AS image FROM sync.BuyKitchenProducts p WHERE p.channel=N'展板' AND p.Brand=@brand",{brand})).recordset:[]
  result[id]=Object.fromEntries(rows.map(r=>[r.id,{image:r.image||'',href:'/products/'+id.slice(8)+'/item/'+r.id}]))
 }
 return result
}
async function positionPresentation(p){
 const definition=pagePositions[p.id],ids=[...new Set(['site-visuals',...p.ids,...(p.brand?['data-productCatalogues']:[]),...(p.id==='inspiration'?['data-storeCases','custom-cases']:[]),...(definition?.sections||[]).flatMap(s=>Array.isArray(s.image)?[s.image[0]]:[])])]
 const rows=(await query(`SELECT d.id,v.body FROM cms.Documents d JOIN cms.Versions v ON v.id=d.publishedId WHERE d.id IN (${ids.map((_,i)=>'@context'+i).join(',')})`,Object.fromEntries(ids.map((id,i)=>['context'+i,id])))).recordset
 const bodies=Object.fromEntries(rows.map(d=>[d.id,JSON.parse(d.body)])),heroImage=firstImage(positionImage(definition?.hero,bodies))
 const result={heroImage,blockImages:Object.fromEntries((definition?.sections||[]).map(s=>[p.id+':'+s.name,firstImage(positionImage(s.image,bodies))])),sections:definition?.sections||[]}
 if(p.id==='builder-series')result.builderCatalogueHero=firstImage(positionImage(pagePositions['builder-catalogues'].hero,bodies))
 if(p.brand)result.catalogueCovers=(bodies['data-productCatalogues']?.PRODUCT_CATALOGUES||[])
  .filter(i=>['sakura-kitchen-2026','kitchenware-2026'].includes(i.id))
  .map(i=>({title:i.id==='kitchenware-2026'?'櫻花整廚廚房配備型錄':i.title,image:i.cover}))
 if(p.id==='service'||p.id==='visuals')result.serviceVideoCover=bodies['site-visuals']?.serviceVideoCover||'/section-3/service-process/video/service-guide-2027-20261027-poster.webp'
 if(p.id==='home')result.heroTitlePages=(await homeImpactContext()).heroTitlePages
 if(p.id==='inspiration'){
  const cases=await caseLibrary(),stores=bodies['data-storeCases']?.storeCases||[],custom=bodies['custom-cases']?.items||[]
  const describe=c=>({...c,description:stores.find(i=>i.slug===c.slug)?.article?.[0]?.paragraphs?.[0]||custom.find(i=>i.id===c.slug)?.excerpt||''})
  return{...result,heroImage:bodies['site-visuals']?.images?.asset_7692def0||'/section-3/store-songzhu.jpg',cases:cases.slice(0,3).map(describe),caseLibrary:cases.map(describe),detailCase:cases.find(c=>c.route.startsWith('/design-inspiration/'))}
 }
 const articles=bodies['news-articles']?.items?.filter(i=>i.enabled&&(!p.category||i.summary.category===p.category))||[]
 if(p.id==='news'){
  const {newsArticles,recentNewsArticles}=publicContent('data-news',bodies['news-articles']||{items:[]})
  const samples=items=>items.slice(0,3).map(item=>({title:item.title,image:item.cover}))
  result.samples=samples(newsArticles)
  result.recentArticles=recentNewsArticles.map(({id,title,cover,displayDate,publishedAt})=>({id,title,image:cover,date:displayDate||publishedAt}))
 }
 if(p.category){
  const first=articles[0]
  const images=bodies['site-visuals']?.images
  result.detailHeroImage=p.category==='latest'
   ?images?.asset_44761f00||'/section-5/brand-pavilion/pavilion-taichung.jpg'
   :images?.asset_7692def0||'/section-3/store-songzhu.jpg'
  if(first){
   result.detailPath=`/news/${p.category}/${first.slug}`
   result.specialImage=first.detail?.cover?.src||first.summary.cover
   result.detailSample={title:first.summary.title,date:first.summary.displayDate,image:result.specialImage,alt:first.detail?.cover?.alt||first.summary.title}
  }
 }
 if(p.id==='knowledge'){
  const related=(bodies['knowledge-articles']?.items||[]).filter(i=>i.enabled&&i.slug!=='systemcabinet')
  if(related.length)result.detailPath='/knowledge/design/'+related[0].slug
  result.relatedArticles=related.slice(0,2).map(i=>({title:i.summary.title,image:i.summary.cover}))
 }
 const storeCases=bodies['data-storeCases']?.storeCases||[]
 if(p.id==='stores'&&storeCases[0])result.specialImage=storeCases[0].cover||storeCases[0].images?.[0]
 if(p.id===storeCasesPageId&&storeCases[0]){
  const first=storeCases[0],spec=storeCases.find(store=>Object.values(store.meta||{}).some(Boolean)),contact=storeCases.find(store=>store.contact)
  result.detailPath='/gallery/'+encodeURIComponent(first.slug)
  result.storeCaseExamples={
   'case-header':{slug:first.slug,anchor:'store-case-hero'},
   'case-breadcrumb':{slug:first.slug,anchor:'store-case-breadcrumb'},
   'store-booking':{slug:storeCases.find(store=>store.meta||store.contact)?.slug,anchor:'case-booking'},
   'store-contact-booking':{slug:contact?.slug,anchor:'case-store-booking'},
   'store-info':{slug:(spec||contact)?.slug,anchor:spec?'case-spec-title':'case-store-title'},
   'store-navigation':{slug:first.slug,anchor:'case-navigation'},
   'store-reviews':{slug:storeCases.find(store=>store.reviews?.length)?.slug,anchor:'case-reviews-title'},
  }
  const fieldExample=(store,anchor)=>({slug:store?.slug,anchor})
  result.storeCaseFieldExamples={
   ...Object.fromEntries(Object.keys(bodies['view-pages-gallery-slug-']?.metaLabels||{}).map(key=>['metaLabels.'+key,fieldExample(storeCases.find(store=>store.meta?.[key]),'case-spec-title')])),
   'copy.text4':fieldExample(contact,'case-store-title'),
   'copy.text5':fieldExample(storeCases.find(store=>store.contact?.lineUrl),'case-line-link'),
   'copy.text6':fieldExample(storeCases.find(store=>store.contact?.mapUrl),'case-map-link'),
  }
  for(const section of definition.sections){
   if(['case-header','case-breadcrumb'].includes(section.kind)){result.blockImages[p.id+':'+section.name]=heroImage;continue}
   const example=storeCases.find(store=>store.slug===result.storeCaseExamples[section.kind==='store-shared'?'store-booking':section.kind]?.slug)
   if(example)result.blockImages[p.id+':'+section.name]=firstImage(example.images)||example.cover
  }
 }
 return result
}
async function homeImpactContext(connection){
 const rows=(await query("SELECT v.body FROM cms.Documents d JOIN cms.Versions v ON v.id=d.publishedId WHERE d.id=N'data-kitchenSeries'",{},connection)).recordset
 const pages=JSON.parse(rows[0]?.body||'{}').KITCHEN_SERIES_PAGES||[]
 return {heroTitlePages:pages.filter(page=>page.heroSlides?.some(image=>!kitchenHeroStory(page,image)?.title)).map(page=>({href:'/home-style/'+encodeURIComponent(page.slug),title:page.name,fallbackTitle:page.name}))}
}
async function pageRows(p,connection){return(await query(`SELECT d.*,v.body,p.body AS publishedBody FROM cms.Documents d LEFT JOIN cms.Versions v ON v.id=d.draftId LEFT JOIN cms.Versions p ON p.id=d.publishedId WHERE d.id IN (${p.ids.map((_,i)=>'@id'+i).join(',')})`,parameters(p),connection)).recordset}
export async function readPageEditor(id){
 const p=pageEditor(id);if(!p)fail(404,'找不到要修改的頁面')
 const [rows,history,summaries]=await Promise.all([pageRows(p),query(`SELECT v.documentId,v.id,v.createdAt,u.name AS actor FROM cms.Versions v LEFT JOIN cms.Users u ON u.id=v.actor WHERE v.documentId IN (${p.ids.map((_,i)=>'@id'+i).join(',')}) ORDER BY createdAt DESC`,parameters(p)),workspaceSummaries()])
 const documents=await Promise.all(p.ids.map(async id=>{
  const d=rows.find(d=>d.id===id);if(!d)fail(404,'本頁內容尚未備齊，請聯絡維護人員；既有內容未變更。')
  const body=d.body?JSON.parse(d.body):{}
  const published=d.publishedBody?JSON.parse(d.publishedBody):null,aligned=id.startsWith('catalog-')?await alignSource(id,body):body
  return{id,revision:d.revision,draftId:d.draftId,publishedId:d.publishedId,updatedAt:d.updatedAt,schema:editorSchema(d),body:aligned,publishedBody:published&&id.startsWith('catalog-')?sameContent(body,published)?aligned:await alignSource(id,published):published,versions:history.recordset.filter(v=>v.documentId===id)}
 }))
 const [rowsForDisplay,position]=await Promise.all([rowPresentation(p),positionPresentation(p)]),summary=pageSummary(p,summaries,documents)
 summary.pending=hasPageChanges(summary.blocks,Object.fromEntries(documents.map(d=>[d.id,d.publishedBody])),Object.fromEntries(documents.map(d=>[d.id,d.body])))
 summary.blocks=summary.blocks.map(b=>{
  if(p.id===storeCasesPageId){
   const example=position.storeCaseExamples?.[b.kind]
   const href=example?.slug?`/gallery/${encodeURIComponent(example.slug)}#${example.anchor}`:position.detailPath
   return {...b,href:href||'/gallery'}
  }
  if(p.id!=='knowledge'&&position.detailPath&&b.fields.some(f=>/-slug-$/.test(f.documentId))){
   const anchor=p.category?(b.kind==='breadcrumb'?'#article-breadcrumb':['navigation','news-shared'].includes(b.kind)?'#article-categories':''):''
   return{...b,href:position.detailPath+anchor}
  }
  return b
 })
 return{...summary,documents,rowPresentation:rowsForDisplay,positionPresentation:position}
}
const equal=(a,b)=>JSON.stringify(a)===JSON.stringify(b)
function editable(previous,next,schema,newItem=false){
 if(equal(previous,next))return
 if(!newItem&&(schema.hidden||schema.readOnly||schema.identity||Object.hasOwn(schema,'fixed')))fail(400,'這項內容的固定資料不可從此位置修改；目前輸入仍保留。')
 if(schema.fields&&next&&Object.keys(next).some(k=>!Object.hasOwn(schema.fields,k)))fail(400,'修改包含不支援的欄位；目前輸入仍保留。')
 if(schema.fields)for(const[k,s]of Object.entries(schema.fields)){
  const managed=schema.editor==='hero-images'&&['image','mobileImage','desktopFocusX','desktopFocusY','mobileFocusX','mobileFocusY'].includes(k)||schema.editor==='store-location'&&['region','city'].includes(k)
  editable(previous?.[k],next?.[k],managed?{...s,hidden:false}:s,newItem)
 }
 if(schema.item&&Array.isArray(next))for(const[v,index]of next.map((v,i)=>[v,i])){
  const identity=v&&typeof v==='object'?(v.id??v.slug):undefined
  const old=identity===undefined?previous?.[index]:previous?.find(i=>(i.id??i.slug)===identity)
  const item=schema.source?{...schema.item,fields:Object.fromEntries(Object.entries(schema.item.fields).map(([k,s])=>[k,{...s,...(['id','name'].includes(k)?{readOnly:true}:{})}]))}:schema.item
  editable(old,v,item,old===undefined)
 }
}
export function checkPageBody(p,id,previous,next,schema){
 if(!next||typeof next!=='object'||Array.isArray(next))fail(400,'修改內容格式不正確')
 const blocks=pageBlocks(p,[{id,schema}]),fields=blocks.flatMap(b=>b.fields)
 let merged=structuredClone(previous)
 for(const f of fields){
  const old=valueAt(previous,f.path),value=valueAt(next,f.path)
  if(equal(old,value))continue
  if(f.schema.rowFilter){
   const keep=rows=>rows?.filter(row=>valueAt(row,f.schema.rowFilter.path)!==f.schema.rowFilter.value)
   if(!equal(keep(old),keep(value)))fail(400,'其他分類的文章不可從目前頁面修改；請從對應官網分類進入。')
  }
  if(f.schema.rowIds&&(!Array.isArray(value)||!Array.isArray(old)||value.length!==old.length||old.some((row,index)=>{
   const replacement=value[index]
   return row.id!==replacement?.id||!f.schema.rowIds.includes(row.id)&&!sameContent(row,replacement)
  })))fail(400,'此處只可修改官網引用的加盟文章。新增、刪除或其他文章請到「優惠消息」管理。')
  editable(old,value,f.schema)
  merged=withValue(merged,f.path,value)
 }
 if(!sameContent(merged,next))fail(400,'修改包含目前頁面以外的內容，請重新開啟正確位置；目前輸入仍保留。')
}
export function pageEditorInput(id,input){
 const p=pageEditor(id)
 if(!p)fail(404,'找不到要修改的頁面')
 if(!input||!['preview','save','publish','unpublish'].includes(input.action)||!Array.isArray(input.documents)||input.documents.length!==p.ids.length||new Set(input.documents.map(d=>d?.id)).size!==p.ids.length||input.documents.some(d=>!p.ids.includes(d?.id)||!Number.isSafeInteger(d?.revision)))fail(400,'本頁修改範圍不完整，請重新開啟；目前輸入仍保留。')
 return p
}
export async function changePageEditor(id,input,user,connection){
 const p=pageEditorInput(id,input)
 if(input.action==='preview'){
  const rows=await pageRows(p,connection)
  const documents=await Promise.all(input.documents.map(async item=>{
   const d=rows.find(d=>d.id===item.id);if(!d)fail(404,'此內容已不存在')
   if(d.revision!==item.revision)fail(409,'有人已修改本頁內容。你的輸入仍保留，請查看最新內容後再調整。')
   const schema=editorSchema(d),previous=d.body?JSON.parse(d.body):{}
   try{checkPageBody(p,d.id,d.id.startsWith('catalog-')?await alignSource(d.id,previous,connection):previous,item.body,schema);const body=normalizeVideos(structuredClone(item.body),schema);validate(body,schema);return{id:d.id,revision:d.revision,body,title:resourceGuide(d.id).tabTitle||resourceGuide(d.id).location[0],changes:changedItems(d.publishedBody?JSON.parse(d.publishedBody):null,body,editingSchema(schema,d.id))}}catch(e){throw readableError(e,d.id,editingSchema(schema,d.id),item.body)}
  }))
  const stored=await Promise.all(rows.map(async d=>{let body=JSON.parse(d.body||'{}'),publishedBody=d.publishedBody?JSON.parse(d.publishedBody):null;if(d.id.startsWith('catalog-')){body=await alignSource(d.id,body,connection);if(publishedBody)publishedBody=await alignSource(d.id,publishedBody,connection)}return{id:d.id,schema:editorSchema(d),body,publishedBody}})),blocks=pageBlocks(p,stored)
  const context=p.id==='home'?await homeImpactContext(connection):p.id==='inspiration'?{caseDetailRoute:(await caseLibrary(connection)).find(c=>c.route.startsWith('/design-inspiration/'))?.route}:{}
  const review=publishReview(workbenchBlocks(p.id,blocks),stored,Object.fromEntries(documents.map(d=>[d.id,d.body])),context)
  return{documents,review,previewToken:await createDraftPreview(user.id,documents,connection),impacts:review.impacts}
 }
 return changeDocumentGroup(p,input,user,connection,async(d,previous,next,schema,tx)=>checkPageBody(p,d.id,d.id.startsWith('catalog-')?await alignSource(d.id,previous,tx):previous,next,schema))
}
