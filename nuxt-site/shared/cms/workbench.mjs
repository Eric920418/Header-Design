import {firstImage,rowName} from './workflow.mjs'
import {blockThumbnail,pageFieldValue,valueAt,withValue} from './page-editors.mjs'
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
export function itemWebsitePath(documentId,item){
 if(!item)return ''
 if(documentId==='custom-cases'&&item.id)return `/design-inspiration/${encodeURIComponent(item.id)}`
 if(!item.slug)return ''
 const slug=encodeURIComponent(item.slug)
 if(documentId==='news-articles'&&item.summary?.category)return `/news/${item.summary.category}/${slug}`
 if(documentId==='knowledge-articles')return `/knowledge/design/${slug}`
 if(documentId==='data-kitchenSeries')return `/home-style/${slug}`
 if(documentId==='data-storeCases')return `/gallery/${slug}`
 return ''
}
export function articleDateLabel(value){
 if(!/^\d{4}-\d{2}-\d{2}$/.test(value||''))return value||''
 const date=new Date(value+'T12:00:00Z')
 return Number.isNaN(date.getTime())?value:new Intl.DateTimeFormat('en-US',{timeZone:'UTC',month:'short',day:'numeric',year:'numeric'}).format(date).toUpperCase()
}
export function updateArticleField(article,path,value){
 let next=withValue(article,path,value)
 if(path==='summary.publishedAt'&&(!article.summary.displayDate||[article.summary.publishedAt,articleDateLabel(article.summary.publishedAt)].includes(article.summary.displayDate)))next=withValue(next,'summary.displayDate',articleDateLabel(value))
 if(path==='summary.cover'&&(!article.detail?.cover?.src||article.detail.cover.src===article.summary.cover))next=withValue(next,'detail.cover',{...article.detail?.cover,src:value,alt:article.detail?.cover?.alt||article.summary.title})
 if(path==='summary.title'&&article.detail?.cover?.alt===article.summary.title)next=withValue(next,'detail.cover.alt',value)
 return next
}
export function freshArticleValue(value,schema){
 if(schema.hidden||schema.readOnly||Object.hasOwn(schema,'fixed'))return value
 if(schema.type==='array')return []
 if(schema.fields&&value&&typeof value==='object')return Object.fromEntries(Object.entries(value).map(([key,v])=>[key,schema.fields[key]?freshArticleValue(v,schema.fields[key]):v]))
 return schema.type==='string'?schema.enum?.[0]||'':value
}
export function itemCaption(value,index,schema={}){
 if(typeof value!=='object')return schema.item?.format==='media'?'圖片 '+(index+1):String(value||'文字 '+(index+1))
 if(value?.year)return String(value.year)+' 年'
 if(Array.isArray(value?.value)&&Array.isArray(value?.lines))return value.value.join(' ')+' · '+value.lines[0]
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
 const values=block?.fields.map(f=>({f,value:pageFieldValue(bodies,f)}))||[]
 const text=values.filter(({f,value})=>typeof value==='string'&&f.schema.type==='string'&&!f.schema.format)
 return{title:selected?.caption||text.find(({f})=>/標題/.test(f.label))?.value||block?.name||'',image:selected?.image||blockThumbnail(block||{fields:[]},bodies),description:selected?.value?.description||selected?.value?.summary?.excerpt||text.find(({f})=>/介紹/.test(f.label))?.value||'',value:selected?.value,kind:block?.kind||'content'}
}
export function inspirationPosition(bodies,presentation={},selected){
 const copy=bodies['view-pages-design-inspiration-index']?.copy||{},detail=bodies['view-pages-design-inspiration-id-']?.copy||{}
 const cases=(presentation.cases||[]).slice(0,3)
 if(selected)cases.splice(0,1,{title:selected.caption,image:selected.image,selected:true,enabled:selected.value?.enabled!==false})
 return{copy,detail,cases,detailCase:presentation.detailCase||cases[0],heroImage:presentation.heroImage}
}
export function homeHeroPosition(bodies,selected){
 const hero=bodies['view-components-home-HomeHero']||{},isSlide=selected?.documentId==='view-components-home-HomeHero'&&selected.path==='slides'
 const index=isSlide?selected.index||0:0,slide=isSlide?selected.value:hero.slides?.[0]
 const styles=bodies['view-components-home-HomeStyleMarquee']
 return{slide,copy:hero.copy||{},styles:styles?.cmsSettings?.visible===false?[]:styles?.styles||[],index,pan:index%2===0?'-4%':'4%'}
}
export function newsBreadcrumbPosition(block,bodies,presentation={}){
 const copy=bodies[block?.fields?.[0]?.documentId]?.copy||{}
 return{
  title:copy.text1||'',
  categories:[{value:copy.text3,path:'copy.text3',destination:'copy.field2'},{value:copy.text5,path:'copy.text5',destination:'copy.field4'}],
  image:presentation.detailHeroImage,
  article:presentation.detailSample,
 }
}

export function pagePositionContent(block,bodies,presentation={},selected,focusedPath=''){
 const page=block?.id?.split(':')[0],definition=pagePositions[page],base=positionContent(block,bodies,selected)
 const fields=(block?.fields||[]).map(f=>({...f,value:pageFieldValue(bodies,f)}))
 const texts=fields.filter(f=>typeof f.value==='string'&&!f.schema.format&&!f.schema.enum&&!f.schema.advanced&&!/圖片說明|替代文字/.test(f.label)).map(f=>({path:f.path,label:f.label,value:f.value}))
 const arrays=fields.filter(f=>f.schema.type==='array').flatMap(f=>(f.value||[]).filter(v=>!f.schema.rowFilter||valueAt(v,f.schema.rowFilter.path)===f.schema.rowFilter.value).slice(0,3).map((v,i)=>({title:itemCaption(v,i,f.schema),image:itemThumbnail(v,f.schema,presentation.rows?.[f.documentId]?.[v?.id]),value:v})))
 const sample=/全部消息列表|最近文章推薦|最新加盟資訊/.test(block?.name)?presentation.samples||[]:[]
 const fixedAction=block?.fixedAction
 const referenceItems=fixedAction==='廚房商品型錄下載'?presentation.catalogueCovers:fixedAction==='更多廚房知識'?presentation.relatedArticles:sample
 const items=selected?[{title:selected.caption,image:selected.image||'',value:selected.value}]:arrays.length?arrays:referenceItems||[]
 const video=fields.find(f=>f.schema.format==='youtube')?.value
 const videoImage=typeof video==='string'&&/^[\w-]{11}$/.test(video)?'https://i.ytimg.com/vi/'+video+'/hqdefault.jpg':''
 const focusedImage=firstImage(fields.find(f=>f.path===focusedPath&&f.schema.format==='media')?.value)
 const blockImage=firstImage(positionImage(block?.image,bodies))||presentation.blockImages?.[block?.id]||''
 const serviceCover=block?.kind==='video'&&block?.name==='服務介紹影片'?bodies['site-visuals']?.serviceVideoCover||presentation.serviceVideoCover:''
 const mappedImage=blockImage||serviceCover
 const image=selected?selected.image||mappedImage:focusedImage||arrays.find(i=>i.image)?.image||base.image||mappedImage||videoImage||''
 const media=fields.filter(f=>f.schema.format==='media').map(f=>({path:f.path,label:f.label,image:firstImage(f.value)})).filter(f=>f.image)
 const heading=texts.filter(f=>/標題|小標|品牌名稱|區塊(?:英|中)文標籤/.test(f.label)),buttons=texts.filter(f=>/按鈕|連結文字/.test(f.label)&&!/介紹|說明/.test(f.label))
 const detail=fields.some(f=>/-slug-$/.test(f.documentId))||/系統櫃/.test(block?.name)
 const contextImage=(detail?presentation.detailHeroImage:'')||firstImage(positionImage(definition?.hero,bodies))||presentation.heroImage||''
 const auxiliary=fields.filter(f=>typeof f.value==='string'&&f.schema.advanced&&!f.schema.format).map(f=>({path:f.path,label:f.label,value:f.value}))
 const displaySettings=fields.filter(f=>['cmsSettings','seo'].includes(f.path)).map(f=>({label:f.label,value:f.value||{}}))
 const destinations=fields.filter(f=>typeof f.value==='string'&&f.schema.format==='url'&&f.schema.destination)
 const destination=destinations.find(f=>f.path===focusedPath)||destinations[0]
 const item=selected?.value,paragraphs=item?.intro?.paragraphs||item?.paragraphs||item?.description||item?.summary?.excerpt||item?.detail||item?.quote||item?.summary||''
 const paragraphsList=Array.isArray(paragraphs)?paragraphs.filter(p=>typeof p==='string'):typeof paragraphs==='string'?[paragraphs]:[]
 const questions=items.flatMap(i=>i.value?.items||i.value?.questions||i.value?.question&&[i.value]||[]).slice(0,3)
 const details=fields.filter(f=>f.schema.fields&&!['cmsSettings','seo'].includes(f.path)).flatMap(f=>Object.entries(f.schema.fields).filter(([,s])=>!s.hidden&&!s.format&&s.type==='string').map(([key,s])=>({label:s.label||f.label,value:f.value?.[key]}))).filter(f=>typeof f.value==='string'&&f.value)
 return{...base,image,mappedImage,fixedAction,destination,auxiliary,displaySettings,texts,items,media,heading,paragraphs:paragraphsList,questions,details,contextImage,thumbnail:image||contextImage,heroImage:contextImage,sections:definition?.sections||[],buttons,text:texts.filter(f=>!buttons.includes(f)),bodyText:texts.filter(f=>!heading.includes(f)&&!buttons.includes(f)),description:base.description||paragraphsList.join(' '),kind:block?.kind||'text'}
}
