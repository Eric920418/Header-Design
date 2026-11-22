import {query,fail} from './database.mjs'
import { documentSchema } from '../../shared/cms/document-schema.mjs'
import {alignSource,normalizeVideos,validate} from './content.mjs'
import {changeDocumentGroup,workspaceSummaries,readableError} from './workspaces.mjs'
import {changedItems} from '../../shared/cms/workflow.mjs'
import {resourceGuide} from '../../shared/cms/presentation.mjs'
import {createDraftPreview} from './previews.mjs'
import {pageEditors,pageEditor,pageBlocks,pageSummary,valueAt,withValue} from '../../shared/cms/page-editors.mjs'
import {editingSchema} from '../../shared/cms/presentation.mjs'
import {caseLibrary} from './case-library.mjs'
import {pagePositions,positionImage} from '../../shared/cms/positions.mjs'
import {firstImage} from '../../shared/cms/workflow.mjs'
import {pageSearchItems,publishReview,hasPageChanges,sameContent} from '../../shared/cms/changes.mjs'
import {workbenchBlocks} from '../../shared/cms/workbench.mjs'
import {kitchenHeroStory} from '../../shared/cms/kitchen-series-hero.mjs'

export const editorSchema=d=>documentSchema(d.id,JSON.parse(d.schemaJson))
export async function pageEditorSummaries(){
 const [rows,schemas]=await Promise.all([workspaceSummaries(),query('SELECT d.id,d.schemaJson,COALESCE(p.body,v.body) AS body,p.body AS publishedBody,v.body AS draftBody FROM cms.Documents d LEFT JOIN cms.Versions p ON p.id=d.publishedId LEFT JOIN cms.Versions v ON v.id=d.draftId')])
 const documents=schemas.recordset.map(d=>({id:d.id,schema:editorSchema(d),body:d.body?JSON.parse(d.body):{}}))
 const bodies=Object.fromEntries(await Promise.all(schemas.recordset.map(async d=>{const body=JSON.parse(d.draftBody||d.body||'{}');return[d.id,d.id.startsWith('catalog-')?await alignSource(d.id,body):body]})))
 const published=Object.fromEntries(await Promise.all(schemas.recordset.map(async d=>{const body=d.publishedBody?JSON.parse(d.publishedBody):null;return[d.id,body&&d.id.startsWith('catalog-')?sameContent(body,JSON.parse(d.draftBody||'null'))?bodies[d.id]:await alignSource(d.id,body):body]})))
 return pageEditors.map(p=>{const summary=pageSummary(p,rows,documents);return{...summary,pending:hasPageChanges(summary.blocks,published,bodies),blocks:summary.blocks.map(b=>({...b,items:pageSearchItems(b,bodies),fields:b.fields.map(({documentId,path,label,searchTerms})=>({documentId,path,label,searchTerms}))}))}})
}
function parameters(p){return Object.fromEntries(p.ids.map((id,i)=>['id'+i,id]))}
async function rowPresentation(p){
 const result={}
 for(const id of p.ids.filter(id=>id.startsWith('catalog-'))){
  const brand={'catalog-sakura':'櫻花','catalog-svago':'SVAGO','catalog-teka':'TEKA'}[id]
  const rows=id==='catalog-cases'?(await query("SELECT c.id,(SELECT TOP(1) url FROM sync.DesignCloudFiles WHERE caseId=c.id AND type='Image' ORDER BY mainImage DESC,CASE WHEN sort IS NULL THEN 1 ELSE 0 END,sort,url) AS image FROM sync.DesignCloudCases c WHERE c.isWebsite=1")).recordset:brand?(await query("SELECT CONVERT(nvarchar(80),p.id) AS id,(SELECT TOP(1) url FROM sync.BuyKitchenPublicFiles WHERE product_id=p.id AND type IN ('main','product_images') ORDER BY CASE WHEN type='main' THEN 0 ELSE 1 END,COALESCE(sort,2147483647),id) AS image FROM sync.BuyKitchenProducts p WHERE p.channel=N'展板' AND p.Brand=@brand",{brand})).recordset:[]
  result[id]=Object.fromEntries(rows.map(r=>[r.id,{image:r.image||'',href:id==='catalog-cases'?'/design-inspiration/'+r.id:'/products/'+id.slice(8)+'/item/'+r.id}]))
 }
 return result
}
async function positionPresentation(p){
 const definition=pagePositions[p.id],ids=[...new Set(['site-visuals',...p.ids,...(p.id==='news'||p.id==='franchise'?['news-articles']:[]),...(p.brand?['data-productCatalogues']:[]),...(p.id==='inspiration'?['data-storeCases','custom-cases']:[]),...(definition?.sections||[]).flatMap(s=>Array.isArray(s.image)?[s.image[0]]:[])])]
 const rows=(await query(`SELECT d.id,v.body FROM cms.Documents d JOIN cms.Versions v ON v.id=d.publishedId WHERE d.id IN (${ids.map((_,i)=>'@context'+i).join(',')})`,Object.fromEntries(ids.map((id,i)=>['context'+i,id])))).recordset
 const bodies=Object.fromEntries(rows.map(d=>[d.id,JSON.parse(d.body)])),heroImage=firstImage(positionImage(definition?.hero,bodies))
 const result={heroImage,blockImages:Object.fromEntries((definition?.sections||[]).map(s=>[p.id+':'+s.name,firstImage(positionImage(s.image,bodies))])),sections:definition?.sections||[]}
 if(p.brand)result.catalogueCovers=(bodies['data-productCatalogues']?.PRODUCT_CATALOGUES||[])
  .filter(i=>['sakura-kitchen-2026','kitchenware-2026'].includes(i.id))
  .map(i=>({title:i.id==='kitchenware-2026'?'櫻花整廚廚房配備型錄':i.title,image:i.cover}))
 if(p.id==='service'||p.id==='visuals')result.serviceVideoCover=bodies['site-visuals']?.serviceVideoCover||'/section-3/service-process/video/service-guide-2027-20261027-poster.webp'
 if(p.id==='home')result.heroTitlePages=(await homeImpactContext()).heroTitlePages
 if(p.id==='inspiration'){
  const cases=await caseLibrary(),stores=bodies['data-storeCases']?.storeCases||[],custom=bodies['custom-cases']?.items||[]
  const describe=c=>({...c,description:stores.find(i=>i.slug===c.slug)?.article?.[0]?.paragraphs?.[0]||custom.find(i=>i.id===c.slug)?.excerpt||''})
  return{...result,heroImage:bodies['site-visuals']?.images?.asset_7692def0||'/section-3/store-songzhu.jpg',cases:cases.slice(0,3).map(describe),detailCase:cases.find(c=>c.route.startsWith('/design-inspiration/'))}
 }
 const articles=bodies['news-articles']?.items?.filter(i=>i.enabled&&(!p.category||i.summary.category===p.category))||[]
 if(p.id==='news')result.samples=articles.slice(0,3).map(i=>({title:i.summary.title,image:i.summary.cover}))
 if(p.id==='franchise')result.samples=articles.filter(i=>/franchise/.test(i.slug)).slice(0,3).map(i=>({title:i.summary.title,image:i.summary.cover}))
 if(p.category){
  const first=articles[0]
  if(p.category==='latest'){
   const registration=articles.find(article=>article.slug==='2026-franchise-seminar')
   const section=registration?.detail?.sections?.[3]
   if(section)result.registration={title:registration.summary.title,heading:section.heading,images:section.images||[],path:'/news/latest/2026-franchise-seminar#article-registration'}
  }
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
 if(p.id==='stores'&&bodies['data-storeCases']?.storeCases?.[0]){const first=bodies['data-storeCases'].storeCases[0];result.detailPath='/gallery/'+first.slug;result.specialImage=first.cover||first.images?.[0]}
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
 if(position?.detailCase)summary.blocks=summary.blocks.map(b=>b.preview==='inspiration-detail'?{...b,href:position.detailCase.route}:b)
 summary.blocks=summary.blocks.map(b=>{
  if(p.id==='knowledge'&&b.name.startsWith('系統櫃'))return{...b,href:'/knowledge/design/systemcabinet'}
  if(b.kind==='registration')return{...b,href:position.registration?.path||p.href}
  if(position.detailPath&&b.fields.some(f=>/-slug-$/.test(f.documentId))){
   const anchor=p.category?(b.kind==='breadcrumb'?'#article-breadcrumb':b.kind==='navigation'?'#article-categories':''):''
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
  const context=p.id==='home'?await homeImpactContext(connection):{}
  const review=publishReview(workbenchBlocks(p.id,blocks),stored,Object.fromEntries(documents.map(d=>[d.id,d.body])),context)
  return{documents,review,previewToken:await createDraftPreview(user.id,documents,connection),impacts:review.impacts}
 }
 return changeDocumentGroup(p,input,user,connection,async(d,previous,next,schema,tx)=>checkPageBody(p,d.id,d.id.startsWith('catalog-')?await alignSource(d.id,previous,tx):previous,next,schema))
}
