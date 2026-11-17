import {workspaceFor,firstImage} from './workflow.mjs'
import {editingSchema,resourceGuide,homeResources} from './presentation.mjs'
import {positionGroup,positionField,pagePositions,decoratePosition} from './positions.mjs'

const view=id=>'view-pages-'+id
const page=(id,section,name,ids,extra={})=>({id,section,name,ids:[...new Set(ids.flatMap(id=>workspaceFor(id)?.ids||[id]))],...extra})
export const pageEditors=[
 page('home','home','首頁',homeResources,{href:'/',extra:['site-visuals'],scopes:{'site-visuals':['brandVideoSrc','images.asset_10b5a86c']}}),
 page('series','design','品牌系列',['data-kitchenSeries'],{href:'/home-style/aikitchen',extra:['data-kitchenStyles']}),
 page('inspiration','design','設計靈感',['custom-cases','catalog-cases',view('design-inspiration-index'),view('design-inspiration-id-')],{href:'/design-inspiration'}),
 page('knowledge','design','廚房裝修指南',['knowledge-articles',view('knowledge-design-systemcabinet'),view('knowledge-index'),view('knowledge-design-slug-')],{href:'/knowledge'}),
 page('series-catalogue','design','品牌系列型錄',[view('catalogues-kitchenware-catalog')],{href:'/catalogues/kitchenware-catalog'}),
 ...['sakura','svago','teka'].map((brand,i)=>page('products-'+brand,'products',['SAKURA 廚電','SVAGO','TEKA'][i],['catalog-'+brand],{href:'/products/'+brand,extra:['data-productBrands'],brand})),
 page('product-catalogue','products','廚房商品型錄',[view('catalogues-catalog')],{href:'/catalogues/catalog'}),
 page('stores','service','案例門市',['data-storeCases',view('gallery-index'),view('gallery-slug-')],{href:'/gallery'}),
 page('service','service','服務流程',[view('service-process')],{href:'/service-process',extra:['site-visuals'],scopes:{'site-visuals':['serviceVideoSrc','serviceVideoCover']}}),
 page('news','news','優惠消息',[view('news-index')],{href:'/news'}),
 ...['latest','activities','video'].map((category,i)=>page('news-'+category,'news',['最新消息','優惠活動','媒體影音'][i],[view('news-'+category+'-index'),view('news-'+category+'-slug-')],{href:'/news/'+category,extra:['news-articles'],category})),
 page('about','brand','關於我們',[view('about-introduce')],{href:'/about/introduce'}),
 page('advantage','brand','品牌優勢',[view('about-advantage')],{href:'/about/advantage'}),
 page('pavilions','brand','櫻花集團品牌館',[view('about-exhibition')],{href:'/about/exhibition',extra:['site-visuals'],scopes:{'site-visuals':['pavilionVideoId']}}),
 page('franchise','franchise','加盟介紹',[view('franchising-intro')],{href:'/franchising/intro',extra:['site-visuals'],scopes:{'site-visuals':['franchiseVideoId']}}),
 page('franchise-form','franchise','加盟申請表單',[view('franchising-form')],{href:'/franchising/form'}),
 page('franchise-download','franchise','加盟資料下載',[view('franchising-download')],{href:'/franchising/download',extra:['data-franchise'],scopes:{'data-franchise':['FRANCHISE_BROCHURE_URL']}}),
 page('builders','builders','建商專區首頁',[view('builders-index')],{href:'/builders',extra:['data-brandPavilions'],scopes:{'data-brandPavilions':['brandPavilions']}}),
 page('builder-series','builders','SAKURA KITCHEN',[view('builders-sakura-kitchen')],{href:'/builders/sakura-kitchen'}),
 page('builder-catalogues','builders','建商專區型錄',[view('builders-catalogues')],{href:'/builders/catalogues'}),
 page('menu','shared','網站選單',['view-components-SiteHeader'],{href:'/'}),
 page('footer','shared','網站頁尾',['view-components-SiteFooter'],{href:'/#footer-navigation'}),
 page('visuals','shared','共用背景與影片',['site-visuals'],{href:'/'}),
 page('privacy','shared','隱私權政策',[view('privacy')],{href:'/privacy'}),
].map(p=>({...p,ids:[...new Set([...p.ids,...p.extra||[]])]}))

export const pageEditor=id=>pageEditors.find(p=>p.id===id)
export function legacyPage(id){
 const w=workspaceFor(id)
 if(w?.id==='news-articles')return pageEditor('news-latest')
 return pageEditors.find(p=>p.ids.includes(w?.id||id)&&!p.extra?.includes(w?.id||id))||pageEditors.find(p=>p.ids.includes(w?.id||id))
}
export function pageEditorLink(id,query={},block){
 const p=pageEditor(id),{edit,part,area,sitePage,block:oldBlock,field,item,list,returnPath,...rest}=query
 const originalSection=rest.returnSection||rest.section
 return{path:p?.section==='home'?'/admin/home':'/admin/content',query:{...rest,...(p?.section!=='home'?{section:p?.section||'all',...(originalSection&&originalSection!==p?.section?{returnSection:originalSection}:{})}:rest.section?{returnPath:'/admin/content'}:{}),sitePage:id,...(block?{block}:{})}}
}
export function legacyPageLink(id,query={}){
 const p=legacyPage(id),link=pageEditorLink(p?.id||id,query)
 return{...link,query:{...link.query,legacy:query.part||id,...(query.returnPath?{returnPath:query.returnPath}:{})}}
}
export function searchResultLink(result,query={}){
 const link=pageEditorLink(result.page.id,query,result.block?.id)
 return {...link,query:{...link.query,...(result.item?{list:result.item.scope,item:result.item.key}:{})}}
}
export const valueAt=(body,path)=>path.split('.').reduce((v,key)=>v?.[key],body)
export function withValue(body,path,value){
 const keys=path.split('.');if(keys.some(k=>['__proto__','constructor','prototype'].includes(k)))throw Error('不支援的修改位置')
 const next={...body};let cursor=next,previous=body
 keys.forEach((key,i)=>{if(i===keys.length-1)cursor[key]=value;else{cursor[key]=Array.isArray(previous?.[key])?[...previous[key]]:{...previous?.[key]};cursor=cursor[key];previous=previous?.[key]}})
 return next
}
const groups={
 'data-franchise':{FRANCHISE_FORM_URL:'主視覺',FRANCHISE_OFFICIAL_FORM_URL:'主視覺',FRANCHISE_BROCHURE_URL:'加盟資料下載',franchiseAdvantages:'品牌優勢',franchiseTestimonials:'加盟夥伴分享',franchiseMarketingStories:'品牌行銷',franchiseQualifications:'加盟資格',franchiseSupportHighlights:'總部支援',franchiseFaqItems:'常見問題'},
 'data-builders':{BUILDER_APPOINTMENT_HASH:'聯繫預約',builderPartners:'合作夥伴'},
 'data-aboutUs':{brandHistory:'品牌沿革',brandValues:'品牌理念',brandIdentities:'品牌識別'},
 'data-brandAdvantage':{brandFamilies:'家庭情境',brandBenefits:'品牌優勢',brandAdvantageFaqGroups:'常見問題'},
 'data-service':{serviceSteps:'服務流程',faqGroups:'常見問題'},
 'data-brandPavilions':{brandPavilions:'品牌館資料',pavilionNotice:'參觀提醒'},
 'data-storeCases':{storeCases:'門市與案例',regionCities:'區域與縣市'},
 'data-kitchenSeries':{KITCHEN_SERIES_PAGES:'系列內容'},
 'data-kitchenStyles':{KITCHEN_STYLES:'系列卡片'},
 'data-catalogues':{KITCHEN_CATALOGUES:'型錄封面與下載'},
 'data-productCatalogues':{PRODUCT_CATALOGUES:'型錄封面與下載',PRODUCT_CARE_CATEGORIES:'保養問答'},
 'data-kitchenSystemCabinet':{systemCabinetImportance:'系統櫃介紹',systemCabinetMaterials:'系統櫃材質',systemCabinetSelectionSteps:'系統櫃挑選步驟',systemCabinetCaseStudies:'系統櫃推薦案例'},
 'custom-cases':{items:'案例內容'},'catalog-cases':{items:'案例顯示與順序'},'knowledge-articles':{items:'文章內容'},'news-articles':{items:'文章內容'},
}
const order={
 home:homeResources.map(id=>resourceGuide(id).tabTitle),
 builders:['主視覺','品牌介紹','建商實力','三大服務','售後服務','合作夥伴','聯繫預約'],
 franchise:['主視覺','加盟夥伴分享','品牌介紹','品牌優勢','加盟邀請','品牌行銷','流程說明','加盟資格','總部支援','常見問題','加盟資料下載','最新消息'],
 about:['品牌沿革','品牌理念','品牌識別'],
 inspiration:['主視覺標題','案例管理與顯示排序','案例篩選列','搜尋結果提示','案例卡片按鈕','無符合案例提示','案例內頁文字'],
 series:['系列內容','系列卡片'],
 'builder-series':['主視覺','品牌優勢','品牌系列'],
 knowledge:['文章內容','系統櫃介紹','系統櫃材質','系統櫃挑選步驟','系統櫃推薦案例','文章結語','列表標題與按鈕','整頁共用文字'],
}
const inspirationSections={
 '主視覺標題':{hint:'頁面最上方的大標題',icon:'hero',preview:'inspiration-hero',aliases:['inspiration:列表標題與按鈕'],href:'/design-inspiration#design-projects-title'},
 '案例管理與顯示排序':{hint:'自行建置案例、上架與排序',icon:'list',preview:'inspiration-cases',aliases:['inspiration:案例內容','inspiration:案例顯示與順序','inspiration:案例列表'],href:'/design-inspiration#design-projects-grid'},
 '案例篩選列':{hint:'選單名稱與篩選按鈕',icon:'filter',preview:'inspiration-filters',help:'選單選項依案例的型式與風格產生；此處修改名稱與按鈕文字。',href:'/design-inspiration#design-projects-filter-title'},
 '搜尋結果提示':{hint:'符合條件的筆數說明',icon:'search',preview:'inspiration-results',help:'這段文字供語音朗讀使用，筆數依實際篩選結果產生。',href:'/design-inspiration#design-projects-result'},
 '案例卡片按鈕':{hint:'案例圖片上的按鈕文字',icon:'card',preview:'inspiration-card-button',href:'/design-inspiration#design-projects-grid'},
 '無符合案例提示':{hint:'沒有搜尋結果時的說明',icon:'empty',preview:'inspiration-empty',help:'沒有符合篩選條件的案例時，才會顯示這些文字。',href:'/design-inspiration#design-projects-filter-title'},
 '案例內頁文字':{hint:'規格標題與返回按鈕',icon:'article',preview:'inspiration-detail',aliases:['inspiration:整頁共用文字'],help:'這些文字會套用到設計靈感的案例內頁；門市案例請至「案例門市」修改。'},
}
function fieldGroup(p,id,path,schema){
 if(path==='cmsSettings'||path==='seo')return '顯示與搜尋設定'
 if(p.id==='inspiration'){
  if(['custom-cases','catalog-cases'].includes(id))return '案例管理與顯示排序'
  if(id===view('design-inspiration-id-'))return '案例內頁文字'
  if(id===view('design-inspiration-index'))return path==='copy.text1'?'主視覺標題':/^copy\.text[2-5]$/.test(path)?'案例篩選列':/^copy\.text[67]$/.test(path)?'搜尋結果提示':path==='copy.text8'?'案例卡片按鈕':'無符合案例提示'
 }
 if(id==='site-visuals'&&p.id!=='visuals')return p.id==='home'?'品牌承諾':p.id==='franchise'?'加盟夥伴分享':'品牌影片'
 if(id==='data-brandPavilions'&&p.id==='builders')return '聯繫預約'
 if(id===view('knowledge-design-systemcabinet')){
  if(['designStyleLinks','kitchenSeriesLinks'].includes(path))return '系統櫃挑選步驟'
  const number=Number(path.match(/\d+$/)?.[0]);if(number<=2)return '整頁共用文字';if(number===3)return '系統櫃介紹';if(number<=7)return '系統櫃材質';if(number<=14)return '系統櫃挑選步驟';if(number===15)return '系統櫃推薦案例';if(number>=16)return '文章結語'
 }
 if(p.id==='home')return resourceGuide(workspaceFor(id)?.id)?.tabTitle||'整頁共用文字'
 if(id==='data-productBrands')return '品牌介紹'
 if(id.startsWith('catalog-'))return groups[id]?.[path]||'商品顯示與順序'
 if(id===view('design-inspiration-id-')||/-slug-$/.test(id))return '整頁共用文字'
 if(id===view('design-inspiration-index')||id===view('knowledge-index')||id===view('gallery-index')||/^view-pages-news-(latest|activities|video)-index$/.test(id))return '列表標題與按鈕'
 if(groups[id]?.[path])return groups[id][path]
 if(path.startsWith('copy.')){
  const context=(schema.positionLegacyLabel||schema.label)?.split('・')
  if(context?.length>1){
   if(context[0]==='案例介紹'&&/catalogue/.test(p.id))return '型錄封面與下載'
   if(context[0]==='流程說明'&&p.id==='about')return '品牌理念'
   return p.id==='franchise'&&context[0]==='案例介紹'?'品牌行銷':context[0]
  }
  if(id===view('builders-index'))return '品牌介紹'
  if(id===view('franchising-intro'))return '主視覺'
  return '標題與說明'
 }
 if(path==='strengths')return '建商實力'
 if(path==='services'&&p.id==='builders')return '三大服務'
 if(path==='series')return '品牌系列'
 return schema.label||'整頁共用文字'
}
export function pageBlocks(p,documents){
 const blocks=[]
 for(const documentId of p.ids){
  const d=documents.find(d=>d.id===documentId);if(!d)continue
  const schema=editingSchema(d.schema,d.id)
  const add=(path,s)=>{
   if(s.hidden||Object.hasOwn(s,'fixed'))return
   if(d.id==='data-productBrands'&&!path.startsWith('PRODUCT_BRANDS.'+p.brand))return
   const previous=fieldGroup(p,d.id,path,s),name=positionGroup(p.id,d.id,path)||previous,id=p.id+':'+name,location=positionField(d.id,path)
   let block=blocks.find(b=>b.id===id)
   if(!block){block={id,name,secondary:name==='顯示與搜尋設定',href:p.id==='home'?resourceGuide(workspaceFor(d.id).id).href:p.href,...(p.id==='inspiration'?inspirationSections[name]:{}),fields:[]};blocks.push(block)}
   if(previous!==name)block.aliases=[...new Set([...(block.aliases||[]),p.id+':'+previous])]
   if(p.id==='visuals'&&path.startsWith('images.'))block.aliases=[...new Set([...(block.aliases||[]),'visuals:圖片集'])]
   const cleanLabel=location?.label||(name==='顯示與搜尋設定'?(resourceGuide(d.id)?.tabTitle||resourceGuide(d.id)?.location[0]||p.name)+'的顯示與搜尋設定':(s.label||'內容').replace(/^.*?・/,'').replace('圖片替代文字','圖片說明').replace('按鈕連結','前往頁面'))
   const labels=s=>[s.label||'',...Object.values(s.fields||{}).flatMap(labels),...(s.item?labels(s.item):[])]
   block.fields.push({documentId:d.id,path,label:cleanLabel,searchTerms:labels(s).join(' '),schema:{...s,label:cleanLabel,...(location?{singleLine:location.singleLine}:{}),...(/供語音朗讀/.test(cleanLabel)?{advanced:true,help:'供語音朗讀辨識此位置，不顯示於一般官網畫面。'}:{}),...(d.id==='news-articles'?{rowFilter:{path:'summary.category',value:p.category},newCategory:p.category}:{})}})
  }
  if(p.scopes?.[d.id]){for(const path of p.scopes[d.id]){const s=path.split('.').reduce((s,key)=>s?.fields?.[key],schema);if(s)add(path,s)}continue}
  for(const[key,s]of Object.entries(schema.fields||{})){
   if(key==='copy')for(const[k,v]of Object.entries(s.fields||{}))add('copy.'+k,v)
   else if(p.id==='visuals'&&key==='images')for(const[k,v]of Object.entries(s.fields||{}))add('images.'+k,v)
   else if(d.id==='data-productBrands')for(const[k,v]of Object.entries(s.fields||{}))add(key+'.'+k,v)
   else add(key,s)
  }
 }
 const sorted=pagePositions[p.id]?.sections.length?pagePositions[p.id].sections.map(s=>s.name):order[p.id]||[]
 return blocks.map(b=>{const positioned=decoratePosition(p.id,b);return positioned.anchor?{...positioned,href:p.href.split('#')[0]+'#'+positioned.anchor}:positioned}).sort((a,b)=>Number(a.secondary)-Number(b.secondary)||(sorted.includes(a.name)?sorted.indexOf(a.name):99)-(sorted.includes(b.name)?sorted.indexOf(b.name):99))
}
export function pageSummary(p,rows,documents=[]){
 const summaries=rows.filter(w=>w.ids.some(id=>p.ids.includes(id)))
 const primary=rows.find(w=>w.id===p.ids[0]),title=p.id==='home'?p.name:primary?.pageTitle||p.name
 const blocks=pageBlocks(p,documents)
 if(p.id==='home')for(const b of blocks){if(!b.secondary)b.name=rows.find(w=>w.ids.includes(b.fields[0].documentId))?.pageTitle||b.name}
 const bodies=Object.fromEntries(documents.map(d=>[d.id,d.body||d.data])),thumbnail=blocks.map(b=>blockThumbnail(b,bodies)).find(Boolean)||(p.id==='inspiration'?firstImage(bodies['data-storeCases']?.storeCases?.[0]):'')
 return{...p,title,sectionTitle:primary?.sectionTitle||p.name,thumbnail:thumbnail||summaries.map(w=>w.thumbnail).find(Boolean)||'',pending:summaries.some(w=>w.pending),updatedAt:summaries.map(w=>w.updatedAt).filter(Boolean).sort((a,b)=>new Date(b)-new Date(a))[0],blocks,searchTerms:[p.name,title,...summaries.map(w=>w.searchTerms),...blocks.flatMap(b=>[b.name,...b.fields.map(f=>f.label)])].join(' ')}
}
export function blockThumbnail(block,bodies){
 const images=block.fields.filter(f=>!/(?:pdf|brochure)Url$|FRANCHISE_BROCHURE_URL$/i.test(f.path)&&!/(?:PDF|型錄|下載)檔案/.test(f.label)).map(f=>{let value=valueAt(bodies[f.documentId],f.path);if(Array.isArray(value)&&f.schema.rowFilter)value=value.filter(v=>valueAt(v,f.schema.rowFilter.path)===f.schema.rowFilter.value);const image=firstImage(value);return{image,priority:/封面|主視覺/.test(f.label)?0:/裝飾|線稿|標誌|logo|\/decor\//i.test(f.label+' '+image)?2:1}}).filter(i=>i.image)
 return images.sort((a,b)=>a.priority-b.priority)[0]?.image||''
}
export function searchPages(pages,search){
 const words=String(search).trim().toLocaleLowerCase().split(/\s+/).filter(Boolean)
 return pages.flatMap(p=>{
  if(!words.length)return[{page:p}]
  const match=text=>words.every(w=>text.toLocaleLowerCase().includes(w))
  const items=p.blocks.flatMap(block=>(block.items||[]).filter(item=>words.some(w=>item.caption.toLocaleLowerCase().includes(w))&&match(p.title+' '+block.name+' '+item.caption+' '+block.fields.map(f=>f.searchTerms||'').join(' '))).map(item=>({page:p,block,item})))
  const found=p.blocks.filter(b=>match(p.title+' '+b.name+' '+(b.aliases||[]).map(a=>a.split(':').at(-1)).join(' ')+' '+b.fields.map(f=>f.label+' '+(f.searchTerms||'')).join(' ')))
  return [...items,...(found.length?found.map(block=>({page:p,block})):!items.length&&match(p.searchTerms||p.title)?[{page:p}]:[])]
 }).sort((a,b)=>Number(!!b.item)-Number(!!a.item)||Number(b.item?.caption.toLocaleLowerCase()===String(search).trim().toLocaleLowerCase())-Number(a.item?.caption.toLocaleLowerCase()===String(search).trim().toLocaleLowerCase()))
}
