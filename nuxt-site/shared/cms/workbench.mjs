import {firstImage,rowName} from './workflow.mjs'
import {blockThumbnail,valueAt} from './page-editors.mjs'

const home=[
 ['主視覺輪播','首頁輪播圖片','首頁圖片、標題與連結','hero'],
 ['品牌系列','品牌系列','首頁系列卡片','cards'],
 ['設計風格','設計風格圖片','風格圖片與連結','cards'],
 ['廚房產品','廚房產品','首頁產品區塊','cards'],
 ['集團品牌標誌','集團品牌標誌','品牌標誌與連結','logos'],
 ['設計案例','設計案例','首頁案例輪播','cards'],
 ['品牌承諾','品牌承諾','品牌介紹與影片','video'],
 ['全台門市據點','全台門市據點','門市查詢入口','stores'],
]
// Display groups only; original document paths and server write scopes stay intact.
export function workbenchBlocks(page,blocks){
 const combined=page==='inspiration'?['案例內容','案例顯示與順序','列表標題與按鈕']:page==='knowledge'||page.startsWith('news-')?['文章內容','列表標題與按鈕']:page==='stores'?['門市與案例','列表標題與按鈕']:[]
 const title=page==='inspiration'?'案例列表':page==='stores'?'門市與案例':page==='knowledge'?'文章列表':'消息列表'
 const result=[]
 for(const b of blocks){
  const merge=combined.includes(b.name),existing=merge&&result.find(i=>i.name===title)
  if(existing){existing.fields.push(...b.fields);existing.aliases.push(b.id);continue}
  const h=page==='home'&&home.find(i=>b.id==='home:'+i[0])
  const fields=b.fields.map(f=>f.documentId==='news-articles'?{...f,schema:{...f.schema,label:({'news-latest':'最新消息','news-activities':'優惠活動','news-video':'媒體影音'})[page]||f.label,newItemLabel:({'news-latest':'消息','news-activities':'活動','news-video':'影片'})[page]||'文章'}}:f)
  result.push({...b,name:h?.[1]||(merge?title:b.name),hint:h?.[2]||(b.fields.some(f=>f.schema.type==='array')?'圖片、文字與順序':'標題、介紹與按鈕'),kind:h?.[3]||(/門市|品牌館/.test(b.name)?'stores':/型錄/.test(b.name)?'catalogue':'content'),fields,aliases:[b.id]})
 }
 if(page==='home')result.sort((a,b)=>(home.findIndex(i=>a.id==='home:'+i[0])+1||99)-(home.findIndex(i=>b.id==='home:'+i[0])+1||99))
 return result
}
export const itemKey=(value,index)=>String(value&&typeof value==='object'?(value.id??value.slug??index):index)
export function freshArticleValue(value,schema){
 if(schema.hidden||schema.readOnly||Object.hasOwn(schema,'fixed'))return value
 if(schema.type==='array')return []
 if(schema.fields&&value&&typeof value==='object')return Object.fromEntries(Object.entries(value).map(([key,v])=>[key,schema.fields[key]?freshArticleValue(v,schema.fields[key]):v]))
 return schema.type==='string'?schema.enum?.[0]||'':value
}
export function itemCaption(value,index,schema={}){
 if(typeof value!=='object')return schema.item?.format==='media'?'圖片 '+(index+1):String(value||'文字 '+(index+1))
 return schema.rowLabel?value?.[schema.rowLabel]||rowName(value,index):rowName(value,index)
}
export function itemThumbnail(value,schema={},metadata={}){
 const image=typeof value==='string'&&schema.item?.format==='media'?value:schema.rowImage?value?.[schema.rowImage]:firstImage(value)
 return (Array.isArray(image)?image[0]:image)||metadata.image||''
}
export function positionContent(block,bodies,selected){
 const values=block?.fields.map(f=>({f,value:valueAt(bodies[f.documentId],f.path)}))||[]
 const text=values.filter(({f,value})=>typeof value==='string'&&f.schema.type==='string'&&!f.schema.format)
 return{title:selected?.caption||text.find(({f})=>/標題/.test(f.label))?.value||block?.name||'',image:selected?.image||blockThumbnail(block||{fields:[]},bodies),description:selected?.value?.description||selected?.value?.summary?.excerpt||text.find(({f})=>/介紹/.test(f.label))?.value||'',value:selected?.value,kind:block?.kind||'content'}
}
