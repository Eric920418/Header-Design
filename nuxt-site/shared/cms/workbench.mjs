import {firstImage,rowName} from './workflow.mjs'
import {blockThumbnail,valueAt} from './page-editors.mjs'
import {decoratePosition,pagePositions,positionImage} from './positions.mjs'

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
 const result=[]
 for(const b of blocks){
  const h=page==='home'&&home.find(i=>b.id==='home:'+i[0])
  const old=page==='knowledge'&&b.name==='文章管理'?'文章列表':page==='stores'&&b.name==='門市管理'?'門市與案例':page.startsWith('news-')&&/管理$/.test(b.name)?'消息列表':''
  const fields=b.fields.map(f=>f.documentId==='news-articles'?{...f,schema:{...f.schema,label:({'news-latest':'最新消息','news-activities':'優惠活動','news-video':'媒體影音'})[page]||f.label,newItemLabel:({'news-latest':'消息','news-activities':'活動','news-video':'影片'})[page]||'文章'}}:f)
  result.push(decoratePosition(page,{...b,name:h?.[1]||b.name,hint:b.hint||h?.[2]||(b.fields.some(f=>f.schema.type==='array')?'圖片、文字與順序':'標題、介紹與按鈕'),kind:b.kind||h?.[3]||(/門市|品牌館/.test(b.name)?'stores':/型錄/.test(b.name)?'catalogue':'content'),fields,aliases:[...new Set([b.id,...b.aliases||[],...(old?[page+':'+old]:[])])]}))
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
 const form=/申請表單|聯繫|預約/.test(label),faq=/問答|常見問題|評論/.test(label),nav=/選單|頁尾|版權|導覽/.test(label),table=/比較|條款/.test(label)
 const drawing=form?'<rect x="20" y="8" width="104" height="80" rx="4" fill="white" stroke="#c1b69f"/><path d="M32 21h52M32 33h80v13H32Zm0 24h80v13H32Z" fill="none" stroke="#b28b4f" stroke-width="2"/><rect x="78" y="76" width="34" height="6" rx="3" fill="#b28b4f"/>':faq?'<rect x="14" y="12" width="116" height="74" rx="4" fill="white" stroke="#c1b69f"/><path d="M24 28h72m17-5v10m-5-5h10M24 49h92M24 65h72m17-5v10m-5-5h10" stroke="#b28b4f" stroke-width="3"/><path d="M24 37h61" stroke="#ddd1bc" stroke-width="3"/>':nav?'<rect x="10" y="10" width="124" height="76" rx="4" fill="white" stroke="#c1b69f"/><path d="M10 28h124M10 68h124M24 20h19m12 0h19m13 0h19m-82 56h27m12 0h27" stroke="#b28b4f" stroke-width="3"/><path d="M24 43h35M24 53h72" stroke="#e1d7c5" stroke-width="4"/>':table?'<rect x="16" y="14" width="112" height="68" rx="3" fill="white" stroke="#c1b69f"/><path d="M16 32h112M16 48h112M16 65h112M52 14v68M90 14v68" stroke="#b28b4f" stroke-width="2"/>':map?'<path d="M8 20 48 8l48 18 40-14v68l-40 12-48-18-40 14Z" fill="#e8e3d7" stroke="#a99a81"/><path d="M48 8v66m48-48v66M8 49l40-12 48 18 40-14" fill="none" stroke="#fff" stroke-width="4"/><path d="M72 20c-12 0-20 9-20 20 0 15 20 32 20 32s20-17 20-32c0-11-8-20-20-20Z" fill="#b28b4f"/><circle cx="72" cy="40" r="7" fill="white"/>':file?'<path d="M44 8h40l20 20v60H44Z" fill="#fff" stroke="#b28b4f" stroke-width="2"/><path d="M84 8v20h20M55 43h36M55 54h29M55 65h23" fill="none" stroke="#b28b4f" stroke-width="3"/>':'<rect x="10" y="10" width="124" height="76" rx="5" fill="white" stroke="#c1b69f"/><path d="M10 26h124" stroke="#c1b69f"/><rect x="20" y="36" width="42" height="38" rx="3" fill="#e9dfcd"/><path d="m24 69 10-12 9 8 8-14 8 18" fill="none" stroke="#b28b4f" stroke-width="3"/><path d="M73 40h47M73 52h39M73 64h29" stroke="#b28b4f" stroke-width="4"/>'
 return 'data:image/svg+xml,'+encodeURIComponent(`<svg xmlns="http://www.w3.org/2000/svg" width="144" height="96" viewBox="0 0 144 96"><rect width="144" height="96" fill="#f4f0e7"/>${drawing}</svg>`)
}
export function positionContent(block,bodies,selected){
 const values=block?.fields.map(f=>({f,value:valueAt(bodies[f.documentId],f.path)}))||[]
 const text=values.filter(({f,value})=>typeof value==='string'&&f.schema.type==='string'&&!f.schema.format)
 return{title:selected?.caption||text.find(({f})=>/標題/.test(f.label))?.value||block?.name||'',image:selected?.image||blockThumbnail(block||{fields:[]},bodies),description:selected?.value?.description||selected?.value?.summary?.excerpt||text.find(({f})=>/介紹/.test(f.label))?.value||'',value:selected?.value,kind:block?.kind||'content'}
}
export function inspirationPosition(bodies,presentation={},selected){
 const copy=bodies['view-pages-design-inspiration-index']?.copy||{},detail=bodies['view-pages-design-inspiration-id-']?.copy||{}
 const cases=(presentation.cases||[]).slice(0,3)
 if(selected)cases.splice(0,1,{title:selected.caption,image:selected.image,selected:true,enabled:selected.value?.enabled!==false})
 return{copy,detail,cases,detailCase:presentation.detailCase||cases[0],heroImage:presentation.heroImage}
}
export function pagePositionContent(block,bodies,presentation={},selected,focusedPath=''){
 const page=block?.id?.split(':')[0],definition=pagePositions[page],base=positionContent(block,bodies,selected)
 const fields=(block?.fields||[]).map(f=>({...f,value:valueAt(bodies[f.documentId],f.path)}))
 const texts=fields.filter(f=>typeof f.value==='string'&&!f.schema.format&&!f.schema.enum&&!f.schema.advanced&&!/圖片說明|替代文字/.test(f.label)).map(f=>({path:f.path,label:f.label,value:f.value}))
 const arrays=fields.filter(f=>f.schema.type==='array').flatMap(f=>(f.value||[]).filter(v=>!f.schema.rowFilter||valueAt(v,f.schema.rowFilter.path)===f.schema.rowFilter.value).slice(0,3).map((v,i)=>({title:itemCaption(v,i,f.schema),image:itemThumbnail(v,f.schema),value:v})))
 const sample=/全部消息列表|最近文章推薦|最新加盟資訊/.test(block?.name)?presentation.samples||[]:[]
 const items=selected?[{title:selected.caption,image:selected.image||'',value:selected.value}]:arrays.length?arrays:sample
 const video=fields.find(f=>f.schema.format==='youtube')?.value
 const videoImage=typeof video==='string'&&/^[\w-]{11}$/.test(video)?'https://i.ytimg.com/vi/'+video+'/hqdefault.jpg':''
 const focusedImage=firstImage(fields.find(f=>f.path===focusedPath&&f.schema.format==='media')?.value)
 const image=selected?selected.image||'':focusedImage||base.image||firstImage(positionImage(block?.image,bodies))||presentation.blockImages?.[block?.id]||videoImage||(/內頁|系統櫃|文章底部/.test(block?.name)?presentation.specialImage:'')||''
 return{...base,image,texts,items,heroImage:firstImage(positionImage(definition?.hero,bodies))||presentation.heroImage||'',sections:definition?.sections||[],buttons:texts.filter(f=>/按鈕|連結文字/.test(f.label)),text:texts.filter(f=>!/按鈕|連結文字/.test(f.label)),description:base.description||selected?.value?.intro?.paragraphs?.join(' ')||'',kind:block?.kind||'text'}
}
