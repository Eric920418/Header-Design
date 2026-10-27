import {nameBindings,workspaceNames} from './navigation.mjs'
import {contentAliases} from './public-content.mjs'
import {resourceGuides,resourceGuide,homeResources} from './presentation.mjs'

const assigned=new Set(),groups=[]
function add(id,area,title,extra=[]){const ids=[id,...extra].filter(i=>resourceGuide(i)&&!assigned.has(i));if(!ids.length)return;ids.forEach(i=>assigned.add(i));groups.push({id,area,title,ids,href:resourceGuide(id).href})}
for(const id of homeResources)add(id,'home',resourceGuide(id).tabTitle,id.endsWith('HomeProject')?['data-kitchenStyles']:[])
for(const [id,area,title,extra] of [
 ['view-pages-about-exhibition','stores','集團品牌館',['data-brandPavilions']],
 ['view-pages-about-introduce','pages','關於我們',['data-aboutUs']],
 ['view-pages-about-advantage','pages','品牌優勢',['data-brandAdvantage']],
 ['view-pages-service-process','pages','服務流程',['data-service']],
 ['view-pages-franchising-intro','pages','加盟介紹',['data-franchise']],
 ['view-pages-builders-index','pages','建商專區',['data-builders']],
 ['view-pages-catalogues-catalog','products','商品型錄與保養',['data-productCatalogues']],
 ['view-pages-catalogues-kitchenware-catalog','pages','品牌系列型錄',['data-catalogues']],
 ['view-pages-knowledge-design-systemcabinet','news','系統櫃文章',['data-kitchenSystemCabinet']],
 ['data-kitchenSeries','pages','廚房系列內頁',[]],['news-articles','news','消息、活動與影片',[]],['knowledge-articles','news','廚房知識文章',[]],
 ['custom-cases','cases','新增與編輯案例',[]],['catalog-cases','cases','其他案例的顯示與排序',[]],['data-storeCases','stores','門市案例與介紹',[]],
 ['data-productBrands','products','品牌介紹',[]],['catalog-sakura','products','SAKURA 商品',[]],['catalog-svago','products','SVAGO 商品',[]],['catalog-teka','products','TEKA 商品',[]],
 ['view-components-SiteHeader','settings','網站選單',[]],['view-components-SiteFooter','settings','網站頁尾',[]],['site-visuals','settings','共用背景與影片',[]],
])add(id,area,title,extra)
for(const [id,guide]of Object.entries(resourceGuides))if(!assigned.has(id)&&id!=='view-components-FloatingButtons')add(id,'pages',guide.location[0])
export const workspaces=groups
export const workspaceDefaults=workspaceNames(groups)
export function workspaceFor(id){id=contentAliases[id]||id;return groups.find(w=>w.id===id||w.ids.includes(id))}
export function editorLink(id,query={}){
 const w=workspaceFor(id),home=w?.area==='home',section=nameBindings[w?.id]?.section||'all'
 const {area,edit,part,...rest}=query
 return{path:home?'/admin/home':'/admin/content',query:{...rest,...(home&&rest.section?{returnPath:'/admin/content'}:{}),...(!home?{section:rest.section||section}:{}),...(w&&id!==w.id&&w.ids.includes(id)?{part:id}:part&&w?.ids.includes(part)?{part}:{}),edit:w?.id||id}}
}
export function rowName(value,index=0){return value?.summary?.title||value?.title||value?.name||value?.zh||value?.en||value?.store||value?.question||value?.label||value?.heading||`第 ${index+1} 項`}
export function firstImage(value){
 if(!value||typeof value!=='object')return ''
 for(const key of ['image','cover','img','src','desktopImage','images','heroSlides','slides']){const v=value[key];if(typeof v==='string'&&v.startsWith('/')&&!/\.pdf(?:$|\?)/i.test(v))return v;if(v&&typeof v==='object'){const found=Array.isArray(v)?v.find(i=>typeof i==='string'&&i.startsWith('/'))||firstImage(v[0]):firstImage(v);if(found)return found}}
 for(const v of Object.values(value))if(typeof v==='string'&&/^(?:\/|https?:\/\/)/.test(v)&&/\.(?:webp|png|jpe?g|svg)(?:$|[?#])/i.test(v))return v
 for(const v of Object.values(value))if(v&&typeof v==='object'){const found=firstImage(v);if(found)return found}return ''
}
export function changedItems(previous,next,schema){
 const result=[]
 for(const [key,value] of Object.entries(next||{})){
  if(JSON.stringify(previous?.[key])===JSON.stringify(value))continue
  const s=schema.fields?.[key],label=s?.label||'內容'
  if(Array.isArray(value)){
   const before=previous?.[key]||[],identity=v=>v&&typeof v==='object'?(v.id??v.slug):undefined
   for(const [i,v]of value.entries()){const identityValue=identity(v),old=identityValue!==undefined?before.find(o=>identity(o)===identityValue):before[i];if(JSON.stringify(old)!==JSON.stringify(v))result.push(`${label}：${rowName(v,i)}`)}
   for(const [i,v]of before.entries())if(identity(v)!==undefined&&!value.some(n=>identity(n)===identity(v)))result.push(`${label}：移除${rowName(v,i)}`)
   if(!result.some(r=>r.startsWith(label+'：')))result.push(label+'：順序或項目已調整')
  }else if(s?.fields&&value&&typeof value==='object')result.push(...changedItems(previous?.[key],value,s).map(x=>`${label} › ${x}`))
  else result.push(label)
 }return [...new Set(result)]
}
