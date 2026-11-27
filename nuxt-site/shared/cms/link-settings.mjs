// Presentation only: never write a destination or its fallback into stored content.
import {galleryCaseRoute} from './gallery-cases.mjs'
const link=(label,anchor='',caption='',extra={})=>({label,anchor,caption,...extra})
const copy=(fields)=>Object.fromEntries(Object.entries(fields).map(([key,setting])=>['copy.'+key,setting]))
export const linkSettings={
 'view-components-home-HomeHero':{...copy({field5:link('主視覺圓形探索按鈕連結','hero-title','copy.text9')}),'slides.*.route':link('首頁輪播圖片連結','hero-title','slides.*.title')},
 'data-kitchenStyles':{'KITCHEN_STYLES.*.route':link('品牌系列卡片連結','kitchen-series','KITCHEN_STYLES.*.zh',{conditional:'available-series'})},
 'view-components-home-HomeServices':{'services.*.route':link('廚電品牌卡片連結','services-heading','services.*.alt',{automatic:'brand'})},
 'view-components-home-HomeStyleMarquee':{'styles.*.route':link('設計風格選項連結','home-styles','styles.*.zh',{automatic:'style'})},
 'view-components-home-LogoMarquee':{'logos.*.to':link('集團品牌標誌連結','brand-logos','logos.*.name')},
 'view-components-home-HomeGallery':{...copy({field4:link('設計案例區查看更多按鈕連結','gallery-heading','copy.text5')}),'cases.*.route':link('首頁案例卡片連結','gallery-heading','cases.*.title',{automatic:'home-case'})},
 'view-components-home-HomeWhatWeDo':copy({field8:link('品牌承諾介紹按鈕連結','brand-promise','copy.text9')}),
 'data-kitchenSeries':{
  'KITCHEN_SERIES_PAGES.*.suites.*.links.*.url':link('套系特色文字連結','series-suites','KITCHEN_SERIES_PAGES.*.suites.*.links.*.label'),
  'KITCHEN_SERIES_PAGES.*.equipment.*.route':link('推薦廚房電器卡片連結','equipment-heading','KITCHEN_SERIES_PAGES.*.equipment.*.name'),
  'KITCHEN_SERIES_PAGES.*.cases.*.url':link('風格廚房實例卡片連結','cases-heading','KITCHEN_SERIES_PAGES.*.cases.*.title'),
  'KITCHEN_SERIES_PAGES.*.buttonDestinations.catalogue':link('主視覺「品牌系列型錄」按鈕連結','ai-kitchen-hero-title','',{button:'品牌系列型錄',automatic:'series-catalogue'}),
  'KITCHEN_SERIES_PAGES.*.buttonDestinations.explore':link('主視覺「探索設計案例」按鈕連結','ai-kitchen-hero-title','',{button:'探索設計案例',fallback:'/design-inspiration'}),
  'KITCHEN_SERIES_PAGES.*.buttonDestinations.booking':link('板材顏色區「立即預約」按鈕連結','finish-heading','',{button:'立即預約',fallback:'https://pse.is/9kq37z'}),
  'KITCHEN_SERIES_PAGES.*.buttonDestinations.moreCases':link('無推薦案例時「探索設計靈感」連結','cases-heading','',{button:'探索設計靈感',fallback:'/design-inspiration',conditional:'no-series-cases'}),
 },
 'view-pages-knowledge-design-systemcabinet':{...copy({field1:link('系統櫃文章上方返回連結','system-cabinet-return','copy.text2'),field14:link('挑選步驟的門板系列推薦連結','system-cabinet-steps','',{button:'門板系列推薦'}),field18:link('文章結語的系列型錄連結','system-cabinet-closing','copy.text19')}),'designStyleLinks.*.to':link('挑選步驟的設計風格連結','system-cabinet-steps','designStyleLinks.*.label')},
 'data-kitchenSystemCabinet':{'systemCabinetCaseStudies.*.url':link('系統櫃文章推薦案例連結','system-cabinet-cases','systemCabinetCaseStudies.*.title')},
 'view-pages-knowledge-design-slug-':copy({field1:link('一般文章上方返回連結','knowledge-return-link','copy.text2'),moreDestination:link('延伸文章「更多廚房知識」按鈕連結','knowledge-related-heading','',{button:'更多廚房知識',automatic:'knowledge-more'})}),
 'knowledge-articles':{
  'items.*.detail.sections.*.points.*.url':link('文章重點標題連結','','items.*.detail.sections.*.points.*.title',{articleSection:true}),
  'items.*.detail.links.*.url':link('文章結語文字連結','knowledge-closing-links','items.*.detail.links.*.label'),
 },
 'news-articles':{
  'items.*.detail.sections.*.links.*.url':link('消息文章段落文字連結','','items.*.detail.sections.*.links.*.label',{articleSection:true}),
  'items.*.detail.caseLink.url':link('影音文章下方案例連結','video-case-link','items.*.detail.caseLink.label',{conditional:'video-article'}),
 },
 'view-pages-news-index':{'newsCategories.*.to':link('側欄分類按鈕連結','news-tags-title','newsCategories.*.label')},
 'view-pages-about-exhibition':copy({bookingDestination:link('品牌館資訊「立即預約」按鈕連結','pavilion-booking-notice','',{button:'立即預約',fallback:'/builders#appointment'})}),
 'data-franchise':{
  FRANCHISE_FORM_URL:link('加盟申請按鈕共用連結','franchise-page-title','',{button:'申請加盟',shared:true,note:'同時用於主視覺、加盟邀請；總部支援未另設連結時也沿用此網址。'}),
  FRANCHISE_OFFICIAL_FORM_URL:link('舊版加盟申請網址（官網未使用）','','',{unused:true}),
  FRANCHISE_BROCHURE_URL:link('加盟型錄預覽與下載 PDF 檔案','franchise-pdf-actions','',{file:true,sourcePage:'/franchising/download'}),
 },
 'view-pages-franchising-intro':copy({field12:link('主視覺加盟說明會按鈕連結','franchise-page-title','copy.text13'),supportDestination:link('總部支援申請按鈕連結','franchise-support','copy.text46',{automatic:'franchise-apply'}),field52:link('加盟資料卡片封面連結','franchise-faq-title','copy.text56',{note:'原本封面與標題使用同一個網址時，編輯封面連結會維持兩處同步。'}),field55:link('加盟資料卡片標題連結','franchise-faq-title','copy.text56'),field62:link('最新加盟資訊查看更多按鈕連結','franchise-news-title','copy.text63')}),
 'view-pages-franchising-form':copy({field4:link('加盟申請表單的資料下載按鈕連結','franchise-application-title','copy.text5')}),
 'view-pages-franchising-download':copy({field22:link('加盟資料頁底部返回按鈕連結','franchise-download-back','copy.text23')}),
 'data-builders':{BUILDER_APPOINTMENT_HASH:link('建商主視覺預約按鈕連結','builders-title','',{button:'立即預約'})},
 'view-pages-builders-sakura-kitchen':copy({field9:link('品牌主視覺預約按鈕連結','builder-sakura-hero','copy.text11'),field12:link('品牌承諾入口卡片連結','builder-sakura-hero','copy.text16'),field24:link('品牌優勢區預約按鈕連結','sakura-kitchen-advantage-title','copy.text25'),field30:link('品牌系列區預約按鈕連結','sakura-kitchen-series-title','copy.text31')}),
 'view-components-SiteHeader':{
  ...copy({field1:link('桌機展開選單的型錄按鈕連結','site-header','copy.text2',{note:'展開含型錄入口的桌機選單後顯示。'}),field9:link('桌機頁首品牌標誌連結','site-header','',{button:'SAKURA KITCHEN 品牌標誌'}),field12:link('手機頁首品牌標誌連結','site-header','',{button:'手機品牌標誌',note:'手機版頁首顯示。'}),field19:link('手機選單的型錄連結','site-header','copy.text20',{note:'開啟手機選單後顯示。'})}),
  ...Object.fromEntries(['leftNav.*.to','leftNav.*.children.*.to','leftNav.*.mega.*.to','rightNav.*.to','rightNav.*.children.*.to'].map(path=>[path,link((path.startsWith('left')?'左側':'右側')+(path.includes('children')?'子選單項目':path.includes('mega')?'展開選單卡片':'主選單項目')+'連結','site-header',path.replace(/\.to$/,'.label'),{note:'含子項目時，需展開官網對應選單查看。'})])),
 },
 'view-components-SiteFooter':{...copy({field2:link('頁尾隱私權政策連結','footer-navigation','copy.text3'),field4:link('頁尾數位展板連結','footer-navigation','',{button:'數位展板'}),field7:link('頁尾 YouTube 社群連結','footer-navigation','',{button:'YouTube'})}),'sitemapGroups.*.links.*.1':link('頁尾網站地圖項目連結','footer-sitemap','sitemapGroups.*.links.*.0',{note:'點開頁尾「網站地圖」後顯示。'})},
 'view-pages-gallery-slug-':copy({field1:link('案例上方「到店預約」按鈕連結','case-booking','copy.text2'),storeBookingDestination:link('門市資訊旁「到店預約」按鈕連結','case-store-booking','copy.text2',{fallback:'https://www.sakura-kitchenlife.com.tw/measuring'})}),
 'data-storeCases':{
  'storeCases.*.reservationUrl':link('推薦案例「預約門市」備用網址','related-cases-title','',{button:'預約門市',conditional:'store-backup'}),
  'storeCases.*.contact.lineUrl':link('LINE 諮詢／推薦案例「預約門市」網址','case-line-link','',{button:'LINE 諮詢'}),
  'storeCases.*.contact.mapUrl':link('Google Map 按鈕網址','case-map-link','',{button:'Google Map'}),
  'storeCases.*.contact.reservationUrl':link('舊版門市預約網址（官網未使用）','','',{unused:true}),
  'storeCases.*.article.*.links.*.url':link('案例文章段落文字連結','','storeCases.*.article.*.links.*.label',{storeSection:true}),
 },
 'site-visuals':{brandVideoSrc:link('首頁品牌承諾影片網址（MP4）','brand-promise','',{file:true,sourcePage:'/'}),serviceVideoSrc:link('服務流程影片網址（MP4）','service-brand-video','',{file:true,sourcePage:'/service-process'})},
}
for(const category of ['latest','activities','video']){
 const latest=category==='latest',name={latest:'最新消息',activities:'優惠活動',video:'媒體影音'}[category]
 const fields={field2:link('文章上方「優惠消息」連結'+(latest?'':'（官網未使用）'),'article-header-categories','copy.text3',{unused:!latest}),field4:link('文章上方「'+name+'」連結'+(latest?'':'（官網未使用）'),'article-header-categories','copy.text5',{unused:!latest})}
 for(const [index,label]of (latest?[[7,'優惠活動'],[9,'最新消息'],[11,'媒體影音']]:[[6,'優惠活動'],[8,'最新消息'],[10,'媒體影音']]))fields['field'+index]=link('文章分類選單「'+label+'」連結','article-categories','copy.text'+(index+1))
 linkSettings['view-pages-news-'+category+'-slug-']=copy(fields)
}
const normalized=path=>String(path||'').replace(/\.\d+(?=\.|$)/g,'.*')
export function linkSetting(id,path){
 const defs=linkSettings[id]||{},key=normalized(path)
 // Sitemap rows are stored as [text, URL], so only the URL cell is a destination.
 if(id==='view-components-SiteFooter'&&/^sitemapGroups\.\d+\.links\.\d+\.1$/.test(path))return defs['sitemapGroups.*.links.*.1']
 if(defs[key])return defs[key]
 if(id==='data-productBrands'&&/^PRODUCT_BRANDS\.(sakura|svago|teka)\.catalogueDestination$/.test(key))return link('商品列表與內頁的型錄共用連結','near-suction-catalogue-title','',{button:'廚房商品型錄下載',fallback:'/catalogues/catalog',shared:true})
 if(/(?:^|\.)(?:pdfUrl|brochureUrl)$/.test(key))return link('型錄預覽與下載 PDF 檔案','','',{file:true})
}
export function linkFieldPresentation(id,path){
 const setting=linkSetting(id,path)
 return setting?{label:setting.label,...(setting.unused?{advanced:true,readOnly:true,disclosureTitle:setting.label,help:'此舊欄位目前未被官網按鈕使用，原值保留供查閱。'}:{})}:undefined
}
export function linkCaptionPresentation(id,path,label){
 const explicit={
  'view-pages-builders-index:copy.text5':'建商主視覺預約按鈕文字',
  'view-pages-franchising-intro:copy.text36':'加盟邀請申請按鈕文字',
  'view-pages-builders-sakura-kitchen:copy.text10':'品牌主視覺預約按鈕文字（第一行）',
 }
 if(explicit[id+':'+path])return{label:explicit[id+':'+path],linkCaption:true}
 const setting=Object.values(linkSettings[id]||{}).find(s=>s.caption===path)
 if(setting?.unused)return{label:setting.label.replace('（官網未使用）','')+'文字（官網未使用）',linkCaption:true,advanced:true,readOnly:true,help:'官網位置導覽依實際瀏覽路徑產生；這份舊文字保留供查閱。'}
 if(setting&&/^(?:按鈕|預約按鈕|下載按鈕|返回按鈕|型錄按鈕|更多消息按鈕)/.test(label||'')){const line=label.match(/第[一二三]行/)?.[0];return{label:setting.label.replace(/連結$/,'文字')+(line?'（'+line+'）':''),linkCaption:true}}
}
const at=(body,path)=>path?path.split('.').reduce((v,k)=>v?.[k],body):undefined
const concrete=(pattern,path)=>{const indexes=path.split('.').filter(k=>/^\d+$/.test(k));let i=0;return pattern.replace(/\*/g,()=>indexes[i++]??'0')}
const schemaAt=(schema,path)=>path.split('.').reduce((s,key)=>s?.fields?.[key]||(/^\d+$/.test(key)?s?.item:undefined),schema)
export function focusedLinkSetting(block,bodies,selected,path='',documentId=''){
 const root=(block?.fields||[]).find(f=>(!documentId||f.documentId===documentId)&&(path===f.path||path.startsWith(f.path+'.')))
 if(!root)return
 const schema=schemaAt(root.schema,path.slice(root.path.length+1))||root.schema
 let targetDocument=root.documentId,targetPath=path,setting=linkSetting(root.documentId,path)
 if(!setting&&!schema.destination){
  const paired=(block?.fields||[]).find(f=>f.schema.destinationAfter===root.documentId+':'+path)
  if(paired){targetDocument=paired.documentId;targetPath=paired.path;setting=linkSetting(paired.documentId,paired.path)}
  else if(root.documentId==='view-pages-franchising-intro'&&path==='copy.text36'){targetDocument='data-franchise';targetPath='FRANCHISE_FORM_URL';setting={...linkSetting(targetDocument,targetPath),anchor:'franchise-conversion-title'}}
  else{
   const entry=Object.entries(linkSettings[root.documentId]||{}).find(([key,s])=>s.caption&&normalized(s.caption)===normalized(path)&&(block.fields||[]).some(f=>f.documentId===root.documentId&&(concrete(key,path)===f.path||concrete(key,path).startsWith(f.path+'.'))))
   if(!entry)return
   targetPath=concrete(entry[0],path);setting=entry[1]
  }
 }
 if(!setting)return
 const body=bodies[targetDocument],editedCaption=targetDocument!==root.documentId?at(bodies[root.documentId],path):''
 const raw=at(body,targetPath),prefix=targetPath.match(/^[^.]+\.\d+/)?.[0],item=prefix?at(body,prefix):undefined
 let effective=raw||setting.fallback||'',state=raw?'目前設定':'沿用官網原本連結',note=setting.note||''
 if(setting.automatic==='series-catalogue')effective||='/catalogues/kitchenware-catalog?series='+item?.slug
 if(setting.automatic==='brand')effective||=at(body,targetPath.replace(/\.route$/,'.alt'))?'/products/'+String(at(body,targetPath.replace(/\.route$/,'.alt'))).toLowerCase():''
 if(setting.automatic==='style')effective||='/design-inspiration?style='+encodeURIComponent(at(body,targetPath.replace(/\.route$/,'.zh'))||'')
 if(setting.automatic==='franchise-apply')effective||=bodies['data-franchise']?.FRANCHISE_FORM_URL||''
 if(setting.automatic==='home-case'&&item?.slug)effective||=galleryCaseRoute(item)
 if(setting.automatic==='knowledge-more'){
  effective||='/knowledge'
  note='只在含延伸文章圖文的文章中顯示；未另設連結時沿用廚房裝修指南列表。'
 }
 if(!raw&&!effective)state='尚未設定連結'
 if(setting.unused){state='官網未使用';effective='';note='原資料保留供查閱，沒有對應的官網按鈕。'}
 if(setting.conditional==='store-backup'&&item?.contact?.lineUrl){state='備用網址目前未使用';effective=item.contact.lineUrl;note='官網目前使用 LINE；此欄只在未設定 LINE 時生效。'}
 if(setting.conditional==='no-series-cases'&&item?.cases?.length){state='目前不顯示此按鈕';note='此系列已有案例卡片，只有沒有案例時才顯示這個按鈕。'}
 if(setting.conditional==='video-article'&&item?.summary?.category!=='video'){state='本篇未使用此連結';effective='';note='只用於媒體影音文章下方的案例連結。'}
 if(setting.conditional==='available-series'&&item?.available===false){state='此系列尚未開放';effective='';note='原連結保留；官網目前顯示尚未開放的系列卡片。'}
 let anchor=setting.anchor
 const suiteIndex=targetPath.match(/^KITCHEN_SERIES_PAGES\.\d+\.suites\.(\d+)\./)?.[1],suite=suiteIndex!==undefined?item?.suites?.[Number(suiteIndex)]:undefined
 if(suite?.id){anchor='suite-tab-'+suite.id;note='官網會開啟「'+(suite.name||suite.title||suite.id)+'」套系分頁。'}
 if(setting.articleSection){const index=targetPath.match(/\.sections\.(\d+)\./)?.[1];anchor=(root.documentId==='news-articles'?'cms-article-links-':'cms-article-section-')+(Number(index)+1)}
 if(setting.storeSection){const index=targetPath.match(/\.article\.(\d+)\./)?.[1];anchor='case-article-'+(Number(index)+1)}
 const label=editedCaption||(setting.caption&&at(body,concrete(setting.caption,targetPath)))||setting.button||setting.label.replace(/連結|網址$/,'')
 const caption=targetDocument==='data-builders'&&label==='專人聯繫'?'立即預約':label
 return {...setting,shared:setting.shared||targetDocument.endsWith('-slug-')||['view-components-SiteHeader','view-components-SiteFooter'].includes(targetDocument),path:targetPath,documentId:targetDocument,caption,raw:typeof raw==='string'?raw:'',effective,state,note,anchor,item}
}
export function linkSettingLocation(target,block,bodies,base='/'){
 if(!target||target.unused||target.state==='本篇未使用此連結')return base
 let path=target.sourcePage||base.split('#')[0]
 if(target.documentId==='data-kitchenSeries'&&target.item?.slug)path='/home-style/'+encodeURIComponent(target.item.slug)
 if(target.documentId==='news-articles'&&target.item?.slug)path='/news/'+target.item.summary.category+'/'+encodeURIComponent(target.item.slug)
 if(target.documentId==='knowledge-articles'&&target.item?.slug)path='/knowledge/design/'+encodeURIComponent(target.item.slug)
 if(target.documentId==='data-productBrands')path='/products/'+target.path.split('.')[1]+'/all'
 if(['view-components-SiteHeader','view-components-SiteFooter'].includes(target.documentId))path='/'
 if(target.documentId==='view-pages-knowledge-design-systemcabinet'||target.documentId==='data-kitchenSystemCabinet')path='/knowledge/design/systemcabinet'
 const anchor=target.anchor||block?.anchor
 return path+(anchor?'#'+anchor:'')
}
