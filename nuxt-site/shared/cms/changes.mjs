import {valueAt,pageFieldValue,pageEditors,pageBlocks,inRowScope} from './page-editors.mjs'
import {effectiveHomeHeadingBody} from './home-headings.mjs'
import {headingFieldLabel} from './heading-labels.mjs'
import {editingSchema} from './presentation.mjs'
import {itemCaption,itemKey,itemThumbnail} from './workbench.mjs'
import {fieldImpacts} from './impact-targets.mjs'
import {builderStrengthsCopy,builderStrengthsDocument,builderStrengthsFields,isBuilderStrengthsCopy} from './builder-strengths.mjs'
import {builderHomeOneDocument,builderHomeOneField,builderHomeOneImage,builderHomeOneImages} from './builder-home-one.mjs'
import {builderAppointmentDocument,builderAppointmentHeadingFields,builderAppointmentHeadingValue,isBuilderAppointmentHeading} from './builder-appointment.mjs'
import {builderCatalogueDocument,builderCatalogueNoticeFields,builderCatalogueNotice,isBuilderCatalogueNotice} from './builder-catalogue.mjs'
import {productCatalogueDocument,productCatalogueFields,productCatalogueText} from './product-catalogue.mjs'

export function sameContent(a,b){
 if(a===b)return true
 if(!a||!b||typeof a!=='object'||typeof b!=='object')return false
 if(Array.isArray(a)||Array.isArray(b))return Array.isArray(a)&&Array.isArray(b)&&a.length===b.length&&a.every((v,i)=>sameContent(v,b[i]))
 const keys=Object.keys(a).filter(k=>a[k]!==undefined)
 return keys.length===Object.keys(b).filter(k=>b[k]!==undefined).length&&keys.every(k=>Object.hasOwn(b,k)&&sameContent(a[k],b[k]))
}
export function hasPageChanges(blocks,published,draft){
 return blocks.some(b=>b.fields.some(f=>{
  const values=body=>{const value=pageFieldValue(body,f);return (f.schema.rowFilter||f.schema.rowIds)&&Array.isArray(value)?value.filter(i=>inRowScope(f.schema,i)):value}
  return !sameContent(values(published),values(draft))
 }))
}
export function itemPublication(document,path,value,index){
 const rows=valueAt(document?.publishedBody,path),identity=value&&typeof value==='object'?(value.id??value.slug):undefined
 const item=Array.isArray(rows)?identity===undefined?rows[index]:rows.find(i=>(i.id??i.slug)===identity):undefined
 const visible=item!==undefined&&document.publishedBody?.cmsSettings?.visible!==false&&item?.enabled!==false&&item?.available!==false
 return {item,visible,label:!visible?item===undefined?'尚未刊登':'官網未顯示':sameContent(item,value)?'官網已刊登':'有待更新修改'}
}
const overlaps=(a,b)=>a===b||a.startsWith(b+'.')||b.startsWith(a+'.')
const display=value=>value==null||value===''?'尚未設定':typeof value==='boolean'?value?'是':'否':String(value)

// Keep values separate from labels so Vue can render untrusted text without HTML.
export function contentChanges(previous,next,schema,path='',labels=[]){
 if(sameContent(previous,next))return []
 if(schema?.item&&(Array.isArray(previous)||Array.isArray(next))){
  const before=previous||[],after=next||[],identity=v=>v&&typeof v==='object'?(v.id??v.slug):undefined
  const result=[]
  for(const [index,value]of after.entries()){
   const id=identity(value),oldIndex=id===undefined?index:before.findIndex(v=>identity(v)===id),old=before[oldIndex]
   const name=itemCaption(value,index,schema),itemPath=path+'.'+index
   if(oldIndex<0||old===undefined)result.push({path:itemPath,label:[...labels,name].join(' › '),before:'尚未建立',after:'新增此項',kind:'add'})
   else result.push(...contentChanges(old,value,schema.item,itemPath,[...labels,name]))
  }
  for(const [index,value]of before.entries())if(identity(value)!==undefined?!after.some(v=>identity(v)===identity(value)):index>=after.length)result.push({path:path+'.'+index,label:[...labels,itemCaption(value,index,schema)].join(' › '),before:'原有內容',after:'移除此項',kind:'remove'})
  const order=rows=>rows.map((v,i)=>identity(v)??i)
  if(before.length===after.length&&order(before).every(v=>order(after).includes(v))&&!sameContent(order(before),order(after)))result.push({path,label:[...labels,'排列順序'].join(' › '),before:before.map((v,i)=>itemCaption(v,i,schema)).join(' → '),after:after.map((v,i)=>itemCaption(v,i,schema)).join(' → '),kind:'order'})
  return result
 }
 if(schema?.fields){
  return Object.entries(schema.fields).flatMap(([key,s])=>contentChanges(previous?.[key],next?.[key],s,path?path+'.'+key:key,[...labels,s.label||'內容']))
 }
 return [{path,label:labels.join(' › ')||'內容',before:display(previous),after:display(next),image:schema?.format==='media'}]
}

export function pageChanges(blocks,documents,previous,next,context={}){
 return documents.flatMap(d=>contentChanges(effectiveHomeHeadingBody(d.id,previous[d.id]),effectiveHomeHeadingBody(d.id,next[d.id]),editingSchema(d.schema,d.id))
  .filter(change=>d.id!=='data-builders'||!overlaps('builderPartners',change.path)).map(change=>{
  const body=change.kind==='remove'?previous[d.id]:next[d.id]
  const owns=f=>f.documentId===d.id&&overlaps(f.path,change.path)&&inRowScope(f.schema,change.path.startsWith(f.path+'.')?valueAt(body,f.path+'.'+change.path.slice(f.path.length+1).split('.')[0]):undefined)
  const block=blocks.find(b=>b.fields.some(owns))
  const owner=block?null:pageEditors.filter(p=>p.ids.includes(d.id)).flatMap(p=>pageBlocks(p,[d]).filter(b=>b.fields.some(owns)).map(b=>({page:p,block:b})))[0]
  const [collection,index]=change.path.split('.')
  const row=Array.isArray(body?.[collection])?body[collection][Number(index)]:undefined
  const scope={documentId:d.id,category:d.id==='news-articles'?row?.summary?.category:undefined,slug:row?.slug,rowId:row?.id,blockHref:block?.previewPage||block?.href}
  let cursor=body,stable=true
  const keyParts=change.path.split('.').map(key=>{if(Array.isArray(cursor)){const item=cursor[Number(key)],id=item&&typeof item==='object'?(item.id??item.slug):undefined;cursor=item;if(id===undefined)stable=false;return id===undefined?key:'@'+id}cursor=cursor?.[key];return key})
  if(d.id===builderStrengthsDocument&&isBuilderStrengthsCopy(change.path)){
   const key=change.path.slice(5)
   change.label=builderStrengthsFields[key].label
   change.before=builderStrengthsCopy(previous[d.id]?.copy)[key]
   change.after=builderStrengthsCopy(next[d.id]?.copy)[key]
  }
  if(d.id===builderAppointmentDocument&&isBuilderAppointmentHeading(change.path)){
   const key=change.path.slice(5)
   change.label=builderAppointmentHeadingFields[key].label
   change.before=builderAppointmentHeadingValue(previous[d.id]?.copy,key)
   change.after=builderAppointmentHeadingValue(next[d.id]?.copy,key)
  }
  if(d.id===builderCatalogueDocument&&isBuilderCatalogueNotice(change.path)){
   const key=change.path.slice(5)
   change.label=builderCatalogueNoticeFields[key].label
   change.before=builderCatalogueNotice(previous[d.id]?.copy,key)
   change.after=builderCatalogueNotice(next[d.id]?.copy,key)
  }
  if(d.id===productCatalogueDocument&&change.path.startsWith('copy.')&&Object.hasOwn(productCatalogueFields,change.path.slice(5))){
   const key=change.path.slice(5)
   change.before=productCatalogueText(previous[d.id]?.copy,key)
   change.after=productCatalogueText(next[d.id]?.copy,key)
  }
  const homeOne=d.id===builderHomeOneDocument&&builderHomeOneField(change.path)
  if(homeOne){
   const field={documentId:d.id,path:change.path}
   change.label=homeOne.label
   change.before=display(pageFieldValue(previous,field))
   change.after=display(pageFieldValue(next,field))
  }
  return {...change,label:headingFieldLabel(change.label),keyParts,stable,...scope,blockId:block?.id,location:block?.name||(owner?owner.page.name+' › '+owner.block.name:'其他已儲存內容'),impacts:fieldImpacts({...scope,path:change.path},context,previous[d.id],next[d.id])}
 }))
}

export function changeImpacts(changes,context={}){
 const targets=changes.flatMap(c=>c.impacts??fieldImpacts(c,context))
 return [...new Map(targets.map(i=>[i.href+'|'+i.label,i])).values()]
}

export function blockImpacts(block,changes,context={}){
 if(!block)return []
 const edited=changes.filter(c=>c.blockId===block.id)
 return changeImpacts(edited.length?edited:block.fields.map(f=>({documentId:f.documentId,path:f.path,category:f.schema.rowFilter?.value,blockHref:block.previewPage||block.href})),context)
}

export function publishReview(blocks,documents,bodies,context={}){
 const saved=Object.fromEntries(documents.map(d=>[d.id,d.body])),published=Object.fromEntries(documents.map(d=>[d.id,d.publishedBody]))
 const current=pageChanges(blocks,documents,saved,bodies,context),pending=pageChanges(blocks,documents,published,saved,context)
 const replaced=(c,n)=>{
  if(n.documentId!==c.documentId||!n.stable||!c.stable)return false
  // Ordering does not replace saved text or images in another item.
  if(c.kind==='order'||n.kind==='order')return c.kind===n.kind&&sameContent(c.keyParts,n.keyParts)
  return c.keyParts.slice(0,Math.min(c.keyParts.length,n.keyParts.length)).every((key,i)=>key===n.keyParts[i])
 }
 return {current,saved:pending.filter(c=>!current.some(n=>replaced(c,n))),impacts:changeImpacts(pageChanges(blocks,documents,published,bodies,context))}
}

export function pageSearchItems(block,bodies){
 const fallback=block.kind==='builders-home-one'?builderHomeOneImage(bodies[builderHomeOneDocument]?.copy,builderHomeOneImages[1]).src:''
 return block.fields.filter(f=>f.schema.type==='array').flatMap(f=>(valueAt(bodies[f.documentId],f.path)||[]).flatMap((value,index)=>{
  if(!inRowScope(f.schema,value))return []
  return [{key:itemKey(value,index),scope:f.documentId+':'+f.path,caption:itemCaption(value,index,f.schema),image:itemThumbnail(value,f.schema)||fallback,...(block.id==='knowledge:文章管理'&&f.formGroup?{articleSection:f.formGroup}:{})}]
 }))
}

export function pageMedia(documents,bodies,blocks){
 const result=[]
 function scan(value,schema,labels=[],itemName=''){
  if(typeof value==='string'&&(/\.(?:webp|png|jpe?g|svg|avif|gif|pdf)(?:$|[?#])/i.test(value)||/^\/media\/[a-f\d-]{36}$/i.test(value))){const purpose=/^(圖片|圖片檔案|檔案路徑)$/.test(labels.at(-1)||'')?labels.at(-2):labels.at(-1);result.push({src:value,label:[itemName||labels[0],purpose].filter(Boolean).join('｜'),caption:itemName||labels[0]||'本頁圖片',purpose,location:labels.join(' › '),pdf:/PDF|檔案/.test(schema?.label||'')||/\.pdf(?:$|[?#])/i.test(value)});return}
  if(Array.isArray(value))value.forEach((v,i)=>{if(inRowScope(schema||{},v))scan(v,schema?.item,[...labels,itemCaption(v,i,schema)],itemName||itemCaption(v,i,schema))})
  else if(value&&typeof value==='object')for(const[k,v]of Object.entries(value))scan(v,schema?.fields?.[k],[...labels,schema?.fields?.[k]?.label||'圖片'],itemName)
 }
 if(blocks)for(const block of blocks)for(const f of block.fields)scan(pageFieldValue(bodies,f),f.schema,[block.name,f.label])
 else for(const d of documents)scan(bodies[d.id],editingSchema(d.schema,d.id))
 return [...new Map(result.map(i=>[i.src,i])).values()]
}
