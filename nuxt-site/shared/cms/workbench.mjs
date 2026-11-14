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
 return firstImage(image)||metadata.image||''
}
export function thumbnailPlaceholder(label=''){
 const map=/門市|縣市|區域|地區|據點/.test(label),file=/PDF|型錄|檔案|下載/.test(label)
 const drawing=map?'<path d="M8 20 48 8l48 18 40-14v68l-40 12-48-18-40 14Z" fill="#e8e3d7" stroke="#a99a81"/><path d="M48 8v66m48-48v66M8 49l40-12 48 18 40-14" fill="none" stroke="#fff" stroke-width="4"/><path d="M72 20c-12 0-20 9-20 20 0 15 20 32 20 32s20-17 20-32c0-11-8-20-20-20Z" fill="#b28b4f"/><circle cx="72" cy="40" r="7" fill="white"/>':file?'<path d="M44 8h40l20 20v60H44Z" fill="#fff" stroke="#b28b4f" stroke-width="2"/><path d="M84 8v20h20M55 43h36M55 54h29M55 65h23" fill="none" stroke="#b28b4f" stroke-width="3"/>':'<rect x="10" y="10" width="124" height="76" rx="5" fill="white" stroke="#c1b69f"/><path d="M10 26h124" stroke="#c1b69f"/><rect x="20" y="36" width="42" height="38" rx="3" fill="#e9dfcd"/><path d="m24 69 10-12 9 8 8-14 8 18" fill="none" stroke="#b28b4f" stroke-width="3"/><path d="M73 40h47M73 52h39M73 64h29" stroke="#b28b4f" stroke-width="4"/>'
 return 'data:image/svg+xml,'+encodeURIComponent(`<svg xmlns="http://www.w3.org/2000/svg" width="144" height="96" viewBox="0 0 144 96"><rect width="144" height="96" fill="#f4f0e7"/>${drawing}</svg>`)
}
export function positionContent(block,bodies,selected){
 const values=block?.fields.map(f=>({f,value:valueAt(bodies[f.documentId],f.path)}))||[]
 const text=values.filter(({f,value})=>typeof value==='string'&&f.schema.type==='string'&&!f.schema.format)
 return{title:selected?.caption||text.find(({f})=>/標題/.test(f.label))?.value||block?.name||'',image:selected?.image||blockThumbnail(block||{fields:[]},bodies),description:selected?.value?.description||selected?.value?.summary?.excerpt||text.find(({f})=>/介紹/.test(f.label))?.value||'',value:selected?.value,kind:block?.kind||'content'}
}
