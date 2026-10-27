import {workspaceNames} from '../../shared/cms/navigation.mjs'
import {query,transaction,fail} from './database.mjs'
import {getDocument,changeDocument,validate,normalizeVideos} from './content.mjs'
import {homeHeroSchema} from '../../shared/cms/hero-media.mjs'
import {homeGallerySchema} from '../../shared/cms/gallery-cases.mjs'
import {builderSeriesSchema} from '../../shared/cms/builder-series.mjs'
import {kitchenSeriesHeroSchema} from '../../shared/cms/kitchen-series-hero.mjs'
import {editingSchema,resourceGuide} from '../../shared/cms/presentation.mjs'
import {workspaceFor,workspaces,firstImage,changedItems} from '../../shared/cms/workflow.mjs'
import {createDraftPreview} from './previews.mjs'

export function workspaceInput(key,input){
 const w=workspaceFor(key)
 if(!w||w.id!==key)fail(404,'找不到要修改的區塊')
 if(!input||!['preview','save','publish','unpublish'].includes(input.action)||!Array.isArray(input.documents)||input.documents.length!==w.ids.length||new Set(input.documents.map(d=>d?.id)).size!==w.ids.length||input.documents.some(d=>!d||!w.ids.includes(d.id)||!Number.isSafeInteger(d.revision)))fail(400,'修改範圍不完整，請重新開啟此區塊；輸入仍保留在畫面上')
 return w
}
export function readableError(error,id,schema){
 if(!error.statusCode||error.statusCode>=500)return error
 const match=error.message.match(/^內容((?:\.[\w-]+|\[\d+\])*)/)
 if(match?.[1]){
  const path=match[1].replace(/\[(\d+)\]/g,(_,i)=>'.'+(Number(i)-1)).slice(1),parts=path.split('.');let s=schema
  const labels=parts.map(p=>{if(/^\d+$/.test(p)){s=s?.item;return`第 ${Number(p)+1} 項`}s=s?.fields?.[p];return s?.label||'內容'})
  error.message=error.message.replace(match[0],labels.join(' › '));error.fieldErrors=[{documentId:id,path,message:error.message}]
 }
 return error
}
export function workspaceSummariesFromRows(rows){
 const published=Object.fromEntries(rows.filter(d=>d.publishedBody).map(d=>[d.id,JSON.parse(d.publishedBody)]))
 return workspaceNames(workspaces,published).map(w=>{const docs=w.ids.map(id=>rows.find(d=>d.id===id)).filter(Boolean);return{...w,thumbnail:docs.map(d=>d.body?firstImage(JSON.parse(d.body)):'').find(Boolean)||'',updatedAt:docs.map(d=>d.updatedAt).sort((a,b)=>new Date(b)-new Date(a))[0],pending:docs.some(d=>d.draftId!==d.publishedId),published:docs.some(d=>d.publishedId),missing:docs.length!==w.ids.length}})
}
export async function workspaceSummaries(){
 const rows=(await query('SELECT d.id,d.revision,d.draftId,d.publishedId,d.updatedAt,v.body,p.body AS publishedBody FROM cms.Documents d LEFT JOIN cms.Versions v ON v.id=d.draftId LEFT JOIN cms.Versions p ON p.id=d.publishedId')).recordset
 return workspaceSummariesFromRows(rows)
}

export async function changeWorkspace(key,input,user,connection){
 const w=workspaceInput(key,input)
 if(['publish','unpublish'].includes(input.action)&&user.role!=='admin')fail(403,'只有管理員可以更新官網或暫停顯示')
 const run=async tx=>{
  const result=[]
  // Stable lock order avoids deadlocks between overlapping page workspaces.
  for(const item of [...input.documents].sort((a,b)=>a.id.localeCompare(b.id))){
   const d=input.action==='preview'?await getDocument(item.id):((await query('SELECT * FROM cms.Documents WITH(UPDLOCK,HOLDLOCK) WHERE id=@id',{id:item.id},tx)).recordset[0])
   if(!d)fail(404,'此內容已不存在')
   if(d.revision!==item.revision)fail(409,'有人已修改這個區塊。你的輸入已保留，請先查看最新內容再決定如何調整。')
   const validationSchema=kitchenSeriesHeroSchema(d.id,builderSeriesSchema(d.id,homeGallerySchema(d.id,homeHeroSchema(d.id,JSON.parse(d.schemaJson))))),schema=editingSchema(validationSchema,d.id)
   try{
    const body=normalizeVideos(structuredClone(item.body),validationSchema);validate(body,validationSchema)
    const versions=(await query('SELECT id,body FROM cms.Versions WHERE id=@draft OR id=@published',{draft:d.draftId,published:d.publishedId},tx)).recordset
    const previous=versions.find(v=>v.id===d.draftId),published=versions.find(v=>v.id===d.publishedId)
    let state={revision:d.revision,draftId:d.draftId,publishedId:d.publishedId}
    if(input.action!=='preview'){
     if(input.action!=='unpublish'&&JSON.stringify(body)!==previous?.body)state=await changeDocument(d.id,{action:'save',revision:state.revision,body},user,tx)
     if(input.action==='publish'&&state.draftId!==state.publishedId)state=await changeDocument(d.id,{action:'publish',revision:state.revision},user,tx)
     if(input.action==='unpublish'&&state.publishedId)state=await changeDocument(d.id,{action:'unpublish',revision:state.revision},user,tx)
    }
    const history=input.action==='preview'?{}:{updatedAt:(await query('SELECT updatedAt FROM cms.Documents WHERE id=@id',{id:d.id},tx)).recordset[0].updatedAt,versions:(await query('SELECT v.id,v.createdAt,u.name AS actor FROM cms.Versions v LEFT JOIN cms.Users u ON u.id=v.actor WHERE documentId=@id ORDER BY createdAt DESC',{id:d.id},tx)).recordset}
    result.push({id:d.id,...state,...history,body,changes:changedItems(published?JSON.parse(published.body):null,body,schema),title:resourceGuide(d.id).tabTitle||resourceGuide(d.id).title})
   }catch(e){throw readableError(e,d.id,schema)}
  }return{documents:result,...(input.action==='preview'?{previewToken:await createDraftPreview(user.id,result,tx)}:{}),impacts:[...new Map(w.ids.flatMap(id=>resourceGuide(id).impacts).map(i=>[i.href+'|'+i.label,i])).values()]}
 }
 // Preview validates and creates only a short-lived snapshot; no versions, refs or audit records.
 return input.action==='preview'?run(connection):connection?run(connection):transaction(run)
}
