import {query,fail} from './database.mjs'
import {alignSource,normalizeVideos,validate} from './content.mjs'
import {changeDocumentGroup,workspaceSummaries,readableError} from './workspaces.mjs'
import {changedItems} from '../../shared/cms/workflow.mjs'
import {resourceGuide} from '../../shared/cms/presentation.mjs'
import {createDraftPreview} from './previews.mjs'
import {pageEditors,pageEditor,pageBlocks,pageSummary,valueAt,withValue} from '../../shared/cms/page-editors.mjs'
import {editingSchema} from '../../shared/cms/presentation.mjs'
import {homeHeroSchema} from '../../shared/cms/hero-media.mjs'
import {homeGallerySchema} from '../../shared/cms/gallery-cases.mjs'
import {builderSeriesSchema} from '../../shared/cms/builder-series.mjs'
import {kitchenSeriesHeroSchema} from '../../shared/cms/kitchen-series-hero.mjs'
import {caseLibrary} from './case-library.mjs'
import {pagePositions,positionImage} from '../../shared/cms/positions.mjs'
import {firstImage} from '../../shared/cms/workflow.mjs'

export const editorSchema=d=>kitchenSeriesHeroSchema(d.id,builderSeriesSchema(d.id,homeGallerySchema(d.id,homeHeroSchema(d.id,JSON.parse(d.schemaJson)))))
export async function pageEditorSummaries(){
 const [rows,schemas]=await Promise.all([workspaceSummaries(),query('SELECT d.id,d.schemaJson,COALESCE(p.body,v.body) AS body FROM cms.Documents d LEFT JOIN cms.Versions p ON p.id=d.publishedId LEFT JOIN cms.Versions v ON v.id=d.draftId')])
 const documents=schemas.recordset.map(d=>({id:d.id,schema:editorSchema(d),body:d.body?JSON.parse(d.body):{}}))
 return pageEditors.map(p=>{const summary=pageSummary(p,rows,documents);return{...summary,blocks:summary.blocks.map(b=>({...b,fields:b.fields.map(({documentId,path,label,searchTerms})=>({documentId,path,label,searchTerms}))}))}})
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
 const definition=pagePositions[p.id],ids=[...new Set(['site-visuals',...p.ids,...(p.id==='news'||p.id==='franchise'?['news-articles']:[]),...(definition?.sections||[]).flatMap(s=>Array.isArray(s.image)?[s.image[0]]:[])])]
 const rows=(await query(`SELECT d.id,v.body FROM cms.Documents d JOIN cms.Versions v ON v.id=d.publishedId WHERE d.id IN (${ids.map((_,i)=>'@context'+i).join(',')})`,Object.fromEntries(ids.map((id,i)=>['context'+i,id])))).recordset
 const bodies=Object.fromEntries(rows.map(d=>[d.id,JSON.parse(d.body)])),heroImage=firstImage(positionImage(definition?.hero,bodies))
 const result={heroImage,blockImages:Object.fromEntries((definition?.sections||[]).map(s=>[p.id+':'+s.name,firstImage(positionImage(s.image,bodies))])),sections:definition?.sections||[]}
 if(p.id==='inspiration'){const cases=await caseLibrary();return{...result,heroImage:bodies['site-visuals']?.images?.asset_7692def0||'/section-3/store-songzhu.jpg',cases:cases.slice(0,3),detailCase:cases.find(c=>c.route.startsWith('/design-inspiration/'))}}
 const articles=bodies['news-articles']?.items?.filter(i=>!p.category||i.summary.category===p.category)||[]
 if(p.id==='news')result.samples=articles.slice(0,3).map(i=>({title:i.summary.title,image:i.summary.cover}))
 if(p.id==='franchise')result.samples=articles.filter(i=>/franchise/.test(i.slug)).slice(0,3).map(i=>({title:i.summary.title,image:i.summary.cover}))
 if(p.id.startsWith('news-')&&articles[0])result.detailPath=`/news/${p.category}/${articles[0].slug}`
 if(p.id==='knowledge'){const first=bodies['knowledge-articles']?.items?.find(i=>i.slug!=='systemcabinet');if(first)result.detailPath='/knowledge/design/'+first.slug;result.specialImage=bodies['knowledge-articles']?.items?.find(i=>i.slug==='systemcabinet')?.summary.cover}
 if(p.id==='stores'&&bodies['data-storeCases']?.storeCases?.[0]){const first=bodies['data-storeCases'].storeCases[0];result.detailPath='/gallery/'+first.slug;result.specialImage=first.cover||first.images?.[0]}
 return result
}
async function pageRows(p,connection){return(await query(`SELECT d.*,v.body,p.body AS publishedBody FROM cms.Documents d LEFT JOIN cms.Versions v ON v.id=d.draftId LEFT JOIN cms.Versions p ON p.id=d.publishedId WHERE d.id IN (${p.ids.map((_,i)=>'@id'+i).join(',')})`,parameters(p),connection)).recordset}
export async function readPageEditor(id){
 const p=pageEditor(id);if(!p)fail(404,'找不到要修改的頁面')
 const [rows,history,summaries]=await Promise.all([pageRows(p),query(`SELECT v.documentId,v.id,v.createdAt,u.name AS actor FROM cms.Versions v LEFT JOIN cms.Users u ON u.id=v.actor WHERE v.documentId IN (${p.ids.map((_,i)=>'@id'+i).join(',')}) ORDER BY createdAt DESC`,parameters(p)),workspaceSummaries()])
 const documents=await Promise.all(p.ids.map(async id=>{
  const d=rows.find(d=>d.id===id);if(!d)fail(404,'本頁內容尚未備齊，請聯絡維護人員；既有內容未變更。')
  const body=d.body?JSON.parse(d.body):{}
  return{id,revision:d.revision,draftId:d.draftId,publishedId:d.publishedId,updatedAt:d.updatedAt,schema:editorSchema(d),body:id.startsWith('catalog-')?await alignSource(id,body):body,versions:history.recordset.filter(v=>v.documentId===id)}
 }))
 const [rowsForDisplay,position]=await Promise.all([rowPresentation(p),positionPresentation(p)]),summary=pageSummary(p,summaries,documents)
 if(position?.detailCase)summary.blocks=summary.blocks.map(b=>b.preview==='inspiration-detail'?{...b,href:position.detailCase.route}:b)
 summary.blocks=summary.blocks.map(b=>p.id==='knowledge'&&b.name.startsWith('系統櫃')?{...b,href:'/knowledge/design/systemcabinet'}:position?.detailPath&&b.fields.some(f=>/-slug-$/.test(f.documentId))?{...b,href:position.detailPath}:b)
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
 if(!equal(merged,next))fail(400,'修改包含目前頁面以外的內容，請重新開啟正確位置；目前輸入仍保留。')
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
  return{documents,previewToken:await createDraftPreview(user.id,documents,connection),impacts:[...new Map(p.ids.flatMap(id=>resourceGuide(id).impacts).map(i=>[i.href+'|'+i.label,i])).values()]}
 }
 return changeDocumentGroup(p,input,user,connection,async(d,previous,next,schema,tx)=>checkPageBody(p,d.id,d.id.startsWith('catalog-')?await alignSource(d.id,previous,tx):previous,next,schema))
}
