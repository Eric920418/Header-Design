// Public names are resolved from published content, independently of editable drafts.
export const siteSections=[
 {key:'design',label:'設計案例',shortLabel:'案例',anchor:'/design-inspiration'},
 {key:'products',label:'廚房產品',shortLabel:'產品',anchor:'/products/sakura'},
 {key:'service',label:'門市與服務',shortLabel:'服務',anchor:'/gallery'},
 {key:'news',label:'優惠消息',shortLabel:'消息',anchor:'/news'},
 {key:'brand',label:'品牌承諾',shortLabel:'品牌',anchor:'/about/introduce'},
 {key:'franchise',label:'我要加盟',shortLabel:'加盟',anchor:'/franchising/intro'},
 {key:'builders',label:'建商專區',shortLabel:'建商',anchor:'/builders'},
 {key:'shared',label:'網站共用設定',shortLabel:'共用',anchor:''},
]
const home=[
 ['HomeHero','首頁輪播圖片','圖片與按鈕',[]],
 ['HomeProject','品牌系列','標題與系列卡片',['text1','text2']],
 ['HomeServices','廚房產品','品牌圖片與連結',['text1','text2']],
 ['HomeGallery','設計案例','輪播案例與按鈕',['text3']],
 ['HomeWhatWeDo','品牌承諾','介紹文字與按鈕',[]],
 ['HomeStoreLocation','櫻花整體廚房全台門市據點','地圖與門市資料',['text2','text3']],
 ['HomeStyleMarquee','設計風格圖片','風格名稱與圖片',[]],
 ['LogoMarquee','集團品牌標誌','標誌圖片與連結',[]],
]
const entries=[
 ['view-pages-about-exhibition','brand','櫻花集團品牌館','館別介紹與圖片','/about/exhibition'],
 ['view-pages-about-introduce','brand','關於我們','品牌故事與圖片','/about/introduce'],
 ['view-pages-about-advantage','brand','品牌優勢','介紹與常見問題','/about/advantage'],
 ['view-pages-service-process','service','服務流程','步驟與常見問題','/service-process'],
 ['view-pages-franchising-intro','franchise','加盟介紹','介紹與申請入口','/franchising/intro'],
 ['view-pages-builders-index','builders','建商專區首頁','介紹與合作資訊','/builders'],
 ['view-pages-catalogues-catalog','products','廚房商品型錄','型錄與保養問答','/catalogues/catalog'],
 ['view-pages-catalogues-kitchenware-catalog','design','品牌系列型錄','封面與下載檔案','/catalogues/kitchenware-catalog'],
 ['view-pages-knowledge-design-systemcabinet','design','系統櫃專題','文章內容','/knowledge/design/systemcabinet'],
 ['data-kitchenSeries','design','品牌系列','各系列介紹與圖片','series'],
 ['news-articles','news','優惠消息','消息、活動與影音內容','/news'],
 ['knowledge-articles','design','廚房裝修指南','文章內容','/knowledge'],
 ['custom-cases','design','設計靈感','案例內容','/design-inspiration'],
 ['catalog-cases','design','設計靈感','案例顯示與排序','/design-inspiration'],
 ['data-storeCases','service','案例門市','門市與案例內容','/gallery'],
 ['data-productBrands','products','廚房產品','品牌介紹與圖片',''],
 ['catalog-sakura','products','SAKURA 廚電','商品顯示與排序','/products/sakura'],
 ['catalog-svago','products','SVAGO','商品顯示與排序','/products/svago'],
 ['catalog-teka','products','TEKA','商品顯示與排序','/products/teka'],
 ['view-components-SiteHeader','shared','網站選單','選單名稱與連結',''],
 ['view-components-SiteFooter','shared','網站頁尾','聯絡資訊與連結',''],
 ['site-visuals','shared','共用背景與影片','圖片與影片',''],
 ...[
 ['builders-catalogues','builders','建商專區型錄','封面與下載檔案','/builders/catalogues'],
 ['builders-sakura-kitchen','builders','SAKURA KITCHEN','介紹與系列卡片','/builders/sakura-kitchen'],
 ['design-inspiration-index','design','設計靈感','頁面標題與按鈕','/design-inspiration'],
 ['design-inspiration-id-','design','設計靈感','案例共用文字','/design-inspiration'],
 ['franchising-download','franchise','加盟資料下載','檔案介紹與圖片','/franchising/download'],
 ['franchising-form','franchise','加盟申請表單','表單標題與說明','/franchising/form'],
 ['gallery-index','service','案例門市','列表標題與篩選文字','/gallery'],
 ['gallery-slug-','service','案例門市','案例共用文字與按鈕','/gallery'],
 ['knowledge-index','design','廚房裝修指南','列表標題','/knowledge'],
 ['knowledge-design-slug-','design','廚房裝修指南','文章共用文字','/knowledge'],
 ['news-index','news','優惠消息','分類與列表標題','/news'],
 ['news-latest-index','news','最新消息','列表文字','/news/latest'],
 ['news-latest-slug-','news','最新消息','文章共用文字','/news/latest'],
 ['news-activities-index','news','優惠活動','列表文字','/news/activities'],
 ['news-activities-slug-','news','優惠活動','文章共用文字','/news/activities'],
 ['news-video-index','news','媒體影音','列表文字','/news/video'],
 ['news-video-slug-','news','媒體影音','影片共用文字','/news/video'],
 ['privacy','shared','隱私權政策','條款文字','/privacy'],
 ].map(([id,...rest])=>['view-pages-'+id,...rest]),
]
export const nameBindings=Object.fromEntries([...home.map(([id,name,purpose,fields])=>['view-components-home-'+id,{section:'home',name,purpose,fields}]),...entries.map(([id,section,name,purpose,route])=>[id,{section,name,purpose,route}])])
const text=value=>typeof value==='string'?value.replace(/\s+/g,' ').trim():''
const pathname=value=>typeof value==='string'?value.split(/[?#]/)[0]:''
function links(item){return[...(item.children||[]),...(item.mega||[]),item]}
export function sectionNames(published={}){
 const header=published['view-components-SiteHeader']||{},nav=[...(header.leftNav||[]),...(header.rightNav||[])]
 return siteSections.map((s,index)=>{const order=s.anchor?nav.findIndex(n=>links(n).some(c=>pathname(c.to)===s.anchor)):-1;return{...s,label:text(nav[order]?.label)||s.label,order:order<0?100+index:order}}).sort((a,b)=>a.order-b.order)
}
export function workspaceNames(workspaces,published={}){
 const header=published['view-components-SiteHeader']||{},nav=[...(header.leftNav||[]),...(header.rightNav||[])],sections=sectionNames(published)
 return workspaces.map(w=>{
  const b=nameBindings[w.id];if(!b)throw new Error('缺少官網位置名稱：'+w.id)
  const sectionTitle=b.section==='home'?'首頁':sections.find(s=>s.key===b.section).label
  let pageTitle=b.name
  if(b.fields?.length){const values=b.fields.map(key=>text(published[w.id]?.copy?.[key]));if(values.every(Boolean))pageTitle=values.join('')}
  else if(b.route==='series')pageTitle=text(nav.find(n=>n.seriesMega)?.children?.find(c=>!c.to)?.label)||b.name
  else if(b.route){pageTitle=text(nav.flatMap(links).find(n=>pathname(n.to)===b.route)?.label)||b.name
   if(b.route==='/catalogues/catalog')pageTitle=text(header.copy?.text20)||pageTitle
   if(b.route==='/knowledge/design/systemcabinet')pageTitle=text(published['knowledge-articles']?.items?.find(i=>i.slug==='systemcabinet')?.summary?.title)||pageTitle
  }else if(w.id==='data-productBrands')pageTitle=sectionTitle
  let pageLinks=[{href:b.route&&b.route!=='series'?b.route:w.href,title:pageTitle}]
  if(w.id.startsWith('catalog-')&&w.id!=='catalog-cases')pageLinks.push({href:w.href,title:pageTitle+'｜商品列表'})
  if(w.id==='data-productBrands')pageLinks=[]
  if(b.route==='series')pageLinks=(published['data-kitchenStyles']?.KITCHEN_STYLES||[]).map(s=>({href:s.route||'/home-style/'+s.slug,title:text(s.zh)||text(s.en)}))
  return{...w,pageLinks,section:b.section,sectionTitle,sectionOrder:sections.find(s=>s.key===b.section)?.order??-1,pageTitle,purpose:b.purpose,title:pageTitle+'｜'+b.purpose,location:[sectionTitle,pageTitle,b.purpose],searchTerms:[w.title,b.name,b.purpose,sectionTitle,pageTitle,...w.ids].join(' ')}
 })
}
export function sectionForQuery(query={}){
 const section=typeof query.section==='string'?query.section:''
 if(section==='all'||siteSections.some(s=>s.key===section))return section
 return({pages:'all',cases:'design',products:'products',stores:'service',news:'news',settings:'shared'})[String(query.area)]||'all'
}
export function matchesWorkspace(workspace,search){const words=String(search).toLocaleLowerCase().trim().split(/\s+/);return words.every(word=>(workspace.title+' '+workspace.searchTerms).toLocaleLowerCase().includes(word))}

export function navigationSections(rows=[]){
 return siteSections.map(s=>{const w=rows.find(w=>w.section===s.key);return{...s,label:w?.sectionTitle||s.label,order:w?.sectionOrder??siteSections.indexOf(s)+100}}).sort((a,b)=>a.order-b.order)
}

export function namedEditorSchema(schema,id,pageTitle){
 const key=id.startsWith('catalog-')||['news-articles','knowledge-articles','custom-cases'].includes(id)?'items':({'data-kitchenStyles':'KITCHEN_STYLES','data-kitchenSeries':'KITCHEN_SERIES_PAGES','data-storeCases':'storeCases'})[id]
 if(!key||!schema.fields?.[key]||!pageTitle)return schema
 return{...schema,fields:{...schema.fields,[key]:{...schema.fields[key],label:pageTitle}}}
}
