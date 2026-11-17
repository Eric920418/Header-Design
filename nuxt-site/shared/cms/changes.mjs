import {valueAt,pageEditors,pageBlocks} from './page-editors.mjs'
import {resourceGuide,editingSchema} from './presentation.mjs'
import {itemCaption,itemKey,itemThumbnail} from './workbench.mjs'

export const sameContent=(a,b)=>JSON.stringify(a)===JSON.stringify(b)
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

export function pageChanges(blocks,documents,previous,next){
 return documents.flatMap(d=>contentChanges(previous[d.id],next[d.id],editingSchema(d.schema,d.id)).map(change=>{
  const body=change.kind==='remove'?previous[d.id]:next[d.id]
  const owns=f=>f.documentId===d.id&&overlaps(f.path,change.path)&&(!f.schema.rowFilter||valueAt(body,change.path.startsWith(f.path+'.')?f.path+'.'+change.path.slice(f.path.length+1).split('.')[0]+'.'+f.schema.rowFilter.path:f.path)===f.schema.rowFilter.value)
  const block=blocks.find(b=>b.fields.some(owns))
  const owner=block?null:pageEditors.filter(p=>p.ids.includes(d.id)).flatMap(p=>pageBlocks(p,[d]).filter(b=>b.fields.some(owns)).map(b=>({page:p,block:b})))[0]
  const row=d.id==='news-articles'?body?.items?.[Number(change.path.split('.')[1])]:null
  let cursor=body,stable=true
  const keyParts=change.path.split('.').map(key=>{if(Array.isArray(cursor)){const item=cursor[Number(key)],id=item&&typeof item==='object'?(item.id??item.slug):undefined;cursor=item;if(id===undefined)stable=false;return id===undefined?key:'@'+id}cursor=cursor?.[key];return key})
  return {...change,keyParts,stable,documentId:d.id,blockId:block?.id,location:block?.name||(owner?owner.page.name+' › '+owner.block.name:'其他已儲存內容'),...(row?{category:row.summary?.category,slug:row.slug}:{})}
 }))
}

export function changeImpacts(changes){
 const result=[]
 for(const c of changes){
  let targets=resourceGuide(c.documentId)?.impacts||[]
  if(c.documentId==='site-visuals'){
   const index=/^brandVideo|^images\.asset_10b5a86c/.test(c.path)?0:/^serviceVideo/.test(c.path)?1:/^pavilionVideo/.test(c.path)?2:/^franchiseVideo/.test(c.path)?3:-1
   if(index>=0)targets=targets.slice(index,index+1)
  }
  if(c.documentId==='news-articles'&&c.category)targets=targets.filter(i=>i.href==='/news'||i.href.startsWith('/news/'+c.category)||/franchise/.test(c.slug||'')&&i.href.startsWith('/franchising/'))
  result.push(...targets)
 }
 return [...new Map(result.map(i=>[i.href+'|'+i.label,i])).values()]
}

export function publishReview(blocks,documents,bodies){
 const saved=Object.fromEntries(documents.map(d=>[d.id,d.body])),published=Object.fromEntries(documents.map(d=>[d.id,d.publishedBody]))
 const current=pageChanges(blocks,documents,saved,bodies),pending=pageChanges(blocks,documents,published,saved)
 const replaced=(c,n)=>{
  if(n.documentId!==c.documentId||!n.stable||!c.stable)return false
  // Ordering does not replace saved text or images in another item.
  if(c.kind==='order'||n.kind==='order')return c.kind===n.kind&&sameContent(c.keyParts,n.keyParts)
  return c.keyParts.slice(0,Math.min(c.keyParts.length,n.keyParts.length)).every((key,i)=>key===n.keyParts[i])
 }
 return {current,saved:pending.filter(c=>!current.some(n=>replaced(c,n))),impacts:changeImpacts(pageChanges(blocks,documents,published,bodies))}
}

export function pageSearchItems(block,bodies){
 return block.fields.filter(f=>f.schema.type==='array').flatMap(f=>(valueAt(bodies[f.documentId],f.path)||[]).flatMap((value,index)=>{
  if(f.schema.rowFilter&&valueAt(value,f.schema.rowFilter.path)!==f.schema.rowFilter.value)return []
  return [{key:itemKey(value,index),scope:f.documentId+':'+f.path,caption:itemCaption(value,index,f.schema),image:itemThumbnail(value,f.schema)}]
 }))
}

export function pageMedia(documents,bodies,blocks){
 const result=[]
 function scan(value,schema,labels=[]){
  if(typeof value==='string'&&(/\.(?:webp|png|jpe?g|svg|avif|gif|pdf)(?:$|[?#])/i.test(value)||/^\/media\/[a-f\d-]{36}$/i.test(value))){result.push({src:value,label:labels.join(' › '),pdf:/PDF|檔案/.test(schema?.label||'')||/\.pdf(?:$|[?#])/i.test(value)});return}
  if(Array.isArray(value))value.forEach((v,i)=>scan(v,schema?.item,[...labels,itemCaption(v,i,schema)]))
  else if(value&&typeof value==='object')for(const[k,v]of Object.entries(value))scan(v,schema?.fields?.[k],[...labels,schema?.fields?.[k]?.label||'圖片'])
 }
 if(blocks)for(const block of blocks)for(const f of block.fields)scan(valueAt(bodies[f.documentId],f.path),f.schema,[block.name,f.label])
 else for(const d of documents)scan(bodies[d.id],editingSchema(d.schema,d.id))
 return [...new Map(result.map(i=>[i.src,i])).values()]
}
