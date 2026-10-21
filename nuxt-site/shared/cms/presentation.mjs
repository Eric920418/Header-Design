import copyFields from './presentation-copy.json' with {type:'json'}
import { homeHeroSchema, HOME_HERO_ID } from './hero-media.mjs'
import { homeGallerySchema, HOME_GALLERY_ID } from './gallery-cases.mjs'

// Presentation only: resource IDs, stored schemas and website content stay intact.
const target=(label,href)=>({label,href})
const guides={
 'data-kitchenStyles':{title:'設計系列導覽',location:['首頁','品牌系列','卡片圖片與文字'],href:'/#kitchen-series',visual:'cards',summary:'修改系列卡片的名稱、圖片、介紹及連結；同一份系列資料也供選單使用。',impacts:[target('首頁 → 品牌系列卡片','/#kitchen-series'),target('首頁 → 主視覺展開的系列選單','/#hero-title'),target('全站主選單 → 品牌系列（所有頁面）','/#top'),target('十個廚房系列內頁 → 系列切換選單','/home-style/aikitchen'),target('品牌系列型錄 → 來源系列名稱','/catalogues/kitchenware-catalog')],related:['view-components-home-HomeProject','view-components-home-HomeHero','data-kitchenSeries']},
 'data-kitchenSeries':{title:'廚房系列內頁內容',location:['品牌系列','十個系列內頁','主視覺、組合與圖片'],href:'/home-style/aikitchen',visual:'page',summary:'修改每個系列的輪播圖片、介紹、系列組合、板材、廚電及推薦案例。首頁卡片請使用「設計系列導覽」。',impacts:[target('十個系列內頁：AI、Basic+、Clever、Loft Chic、Joyful、Premium、Elegant、Chef、Country、Harmony','/home-style/aikitchen')],related:['data-kitchenStyles']},
 'data-storeCases':{title:'案例門市資料與案例文章',location:['門市與服務','案例門市','門市資料與案例內文'],href:'/gallery',visual:'store',summary:'修改門市資訊、地區分類與各門市案例文章；設計靈感列表也會使用這些案例；首頁門市地圖及首頁精選圖片各有獨立資料。',impacts:[target('案例門市 → 地區篩選與列表','/gallery'),target('案例門市 → 所有門市案例內頁','/gallery/case10'),target('設計靈感 → 門市案例卡片、搜尋與型式／風格篩選','/design-inspiration')],related:['view-components-home-HomeStoreLocation','view-components-home-HomeGallery','view-pages-gallery-index','view-pages-gallery-slug-']},
 'data-brandPavilions':{title:'集團品牌館資訊',location:['品牌承諾','集團品牌館','地址、時間與圖片'],href:'/about/exhibition',visual:'store',summary:'修改各品牌館的地址、營業時間、展示圖片及注意事項。建商預約區使用相同品牌館資料。',impacts:[target('集團品牌館 → 館別介紹與聯絡資訊','/about/exhibition'),target('建商專區 → 預約區品牌館資訊','/builders#appointment')],related:['view-pages-about-exhibition','view-pages-builders-index']},
 'data-aboutUs':{title:'品牌沿革、承諾與識別',location:['品牌承諾','關於我們','品牌故事與識別圖片'],href:'/about/introduce',visual:'page',summary:'修改品牌年份、沿革照片、品牌承諾與識別圖示。',impacts:[target('關於我們 → 品牌紀事、品牌承諾與識別','/about/introduce')],related:['view-pages-about-introduce']},
 'data-brandAdvantage':{title:'品牌優勢圖文與問答',location:['品牌承諾','品牌優勢','優勢內容與問答'],href:'/about/advantage',visual:'cards',summary:'修改家庭情境圖片、品牌優勢說明與常見問答。',impacts:[target('品牌優勢 → 家庭情境、優勢與問答','/about/advantage')],related:['view-pages-about-advantage']},
 'data-service':{title:'服務步驟與常見問題',location:['門市與服務','服務流程','步驟內容與問答'],href:'/service-process',visual:'faq',summary:'修改服務步驟、問題分類、問題與解答。',impacts:[target('服務流程 → 步驟與常見問題','/service-process')],related:['view-pages-service-process']},
 'data-franchise':{title:'加盟內容與申請、下載連結',location:['我要加盟','加盟介紹','優勢、資格與申請連結'],href:'/franchising/intro',visual:'page',summary:'修改加盟優勢、夥伴分享、行銷案例、資格、問答與申請／型錄連結；各頁標題及加盟流程圖另在頁面版面內容編輯。',impacts:[target('加盟介紹 → 優勢、分享、資格、問答及申請入口','/franchising/intro'),target('加盟申請 → 表單相關入口','/franchising/form'),target('加盟資料下載 → PDF 來源連結','/franchising/download')],related:['view-pages-franchising-intro','view-pages-franchising-form','view-pages-franchising-download']},
 'data-builders':{title:'建商合作夥伴與預約連結',location:['建商專區','建商首頁','合作夥伴與預約入口'],href:'/builders',visual:'cards',summary:'修改合作夥伴與預約區連結。實力介紹與三大服務圖文請使用建商首頁的版面內容。',impacts:[target('建商專區首頁 → 合作夥伴','/builders'),target('建商專區首頁 → 預約區入口','/builders#appointment')],related:['view-pages-builders-index']},
 'data-catalogues':{title:'品牌系列型錄檔案',location:['設計案例','品牌系列型錄','封面與 PDF 下載'],href:'/catalogues/kitchenware-catalog',visual:'cards',summary:'修改系列型錄的名稱、封面、說明與 PDF 檔案。',impacts:[target('品牌系列型錄 → 型錄卡片與下載','/catalogues/kitchenware-catalog'),target('品牌系列型錄 → 各型錄下載檔案','/catalogues/kitchenware-catalog')],related:['view-pages-catalogues-kitchenware-catalog']},
 'data-productCatalogues':{title:'廚房商品型錄與保養問答',location:['廚房產品','商品型錄','型錄檔案與保養問答'],href:'/catalogues/catalog',visual:'faq',summary:'修改商品型錄封面、PDF 來源與產品清潔保養問題；保養問答也會顯示在商品頁。',impacts:[target('廚房商品型錄 → 型錄卡片及保養問答','/catalogues/catalog'),target('三品牌商品列表 → 保養問答','/products/sakura/all'),target('三品牌商品內頁 → 保養問答','/products/sakura')],related:['view-pages-catalogues-catalog']},
 'data-kitchenSystemCabinet':{title:'系統櫃專題文章內容',location:['廚房裝修指南','系統櫃文章','材質、比較與案例'],href:'/knowledge/design/systemcabinet',visual:'article',summary:'修改系統櫃的重點說明、材質比較、挑選步驟與案例內容。',impacts:[target('系統櫃專題 → 文章內文、比較表與案例','/knowledge/design/systemcabinet')],related:['knowledge-articles','view-pages-knowledge-design-systemcabinet']},
 'data-productBrands':{title:'廚電品牌介紹',location:['廚房產品','三品牌商品頁','品牌名稱、圖片與介紹'],href:'/products/sakura',visual:'cards',summary:'修改櫻花、SVAGO、TEKA 的品牌介紹；不修改來源商品規格。',impacts:[target('三品牌首頁 → 品牌介紹與圖片','/products/sakura'),target('三品牌商品列表 → 品牌資訊','/products/sakura/all'),target('三品牌商品內頁 → 品牌資訊','/products/sakura')],related:['catalog-sakura','catalog-svago','catalog-teka']},
 'news-articles':{title:'消息、活動與影音文章',location:['優惠消息','文章列表與內頁','標題、封面與內文'],href:'/news',visual:'article',summary:'同一篇文章的列表資訊與內文在此一起管理。加盟頁只引用指定的加盟文章。',impacts:[target('優惠消息總覽 → 文章列表','/news'),target('最新消息 → 列表及全部文章內頁','/news/latest'),target('優惠活動 → 列表及全部活動內頁','/news/activities'),target('媒體影音 → 列表及全部影片內頁','/news/video'),target('加盟介紹 → 指定的最新加盟消息','/franchising/intro#franchise-news')],related:['view-pages-news-index','view-pages-news-latest-index','view-pages-news-activities-index','view-pages-news-video-index']},
 'knowledge-articles':{title:'廚房知識文章',location:['廚房裝修指南','文章列表與內頁','標題、封面與內文'],href:'/knowledge',visual:'article',summary:'管理知識文章列表資訊與一般文章內文。系統櫃的詳細內文使用專題編輯入口。',impacts:[target('廚房裝修指南 → 全部文章卡片','/knowledge'),target('知識文章內頁 → 文章資訊、內文與相關文章','/knowledge/design/kitchen-outlet-planning'),target('系統櫃專題 → 文章標題、摘要與相關文章','/knowledge/design/systemcabinet')],related:['data-kitchenSystemCabinet','view-pages-knowledge-index','view-pages-knowledge-design-slug-']},
 'custom-cases':{title:'自建設計案例',location:['設計案例','設計靈感','新增案例與內文'],href:'/design-inspiration',visual:'article',summary:'新增獨立設計案例，管理圖片、說明、型式與風格；會與來源案例一起出現在搜尋結果。',impacts:[target('設計靈感 → 案例列表、篩選與搜尋','/design-inspiration'),target('設計靈感 → 自建案例內頁','/design-inspiration')],related:['catalog-cases','view-pages-design-inspiration-index','view-pages-design-inspiration-id-']},
 'site-visuals':{title:'全站共用背景與影片',location:['全站設定','共用視覺素材','背景圖片與影片'],href:'/#brand-promise',visual:'page',summary:'共用背景可能被多個頁面使用，替換前請確認下列範圍；各頁獨立圖片仍在對應項目中編輯。',impacts:[target('首頁 → 品牌承諾影片封面與影片','/#brand-promise'),target('服務流程 → 品牌影片','/service-process'),target('集團品牌館 → 主視覺品牌影片','/about/exhibition'),target('加盟介紹 → 加盟影片與背景裝飾','/franchising/intro'),target('消息、案例、知識、型錄及商品頁 → 共用主視覺背景','/news'),target('建商、加盟及品牌優勢頁 → 共用背景圖片','/builders')],related:['view-components-home-HomeWhatWeDo','view-pages-service-process','view-pages-franchising-intro']},
}

const home=[
 ['HomeHero','主視覺輪播','輪播圖片、標題與按鈕','/#hero-title','hero',[]],
 ['HomeProject','品牌系列','區塊標題與介紹文字','/#kitchen-series','cards',['data-kitchenStyles','data-kitchenSeries']],
 ['HomeServices','廚房產品','品牌卡片圖片、文字與連結','/#services-heading','cards',['data-productBrands','catalog-sakura','catalog-svago','catalog-teka']],
 ['HomeGallery','設計案例','輪播圖片、門市與按鈕','/#gallery-heading','hero',['data-storeCases','custom-cases','catalog-cases']],
 ['HomeWhatWeDo','品牌承諾','標題、介紹文字與按鈕','/#brand-promise','hero',['site-visuals','data-brandAdvantage']],
 ['HomeStoreLocation','全台門市據點','地圖門市資訊與地區篩選','/#contact','store',['data-storeCases']],
 ['HomeStyleMarquee','設計風格','風格名稱、圖示與預覽圖片','/#home-styles','cards',[]],
 ['LogoMarquee','集團品牌標誌','標誌圖片與連結','/#brand-logos','cards',[]],
]
for(const[name,title,contents,href,visual,related]of home)guides['view-components-home-'+name]={title: title+'・'+contents,tabTitle:title,location:['首頁',title,contents],href,visual,summary:`修改首頁「${title}」的${contents}。`,impacts:[target('首頁 → '+title,href)],related}

const views=[
 ['about-advantage','品牌優勢','區塊標題與介紹','/about/advantage','data-brandAdvantage'],
 ['about-exhibition','集團品牌館','區塊標題與介紹','/about/exhibition','data-brandPavilions'],
 ['about-introduce','關於我們','區塊標題與介紹','/about/introduce','data-aboutUs'],
 ['builders-catalogues','建商型錄','型錄卡片與下載按鈕','/builders/catalogues'],
 ['builders-index','建商專區首頁','主視覺、實力介紹與服務圖文','/builders','data-builders','data-brandPavilions'],
 ['builders-sakura-kitchen','建商櫻花廚房','主視覺、優勢與系列卡片','/builders/sakura-kitchen'],
 ['catalogues-catalog','廚房商品型錄','區塊標題與操作文字','/catalogues/catalog','data-productCatalogues'],
 ['catalogues-kitchenware-catalog','品牌系列型錄','區塊標題與操作文字','/catalogues/kitchenware-catalog','data-catalogues','data-kitchenStyles'],
 ['design-inspiration-index','設計靈感列表','篩選與列表提示文字','/design-inspiration','custom-cases','catalog-cases'],
 ['design-inspiration-id-','設計靈感內頁','規格標題與返回按鈕','/design-inspiration/01cd4a16-6c56-4af9-b8bf-f60a45b7296c','custom-cases','catalog-cases'],
 ['franchising-download','加盟資料下載','主視覺、檔案介紹與預覽圖片','/franchising/download','data-franchise'],
 ['franchising-form','加盟申請表單','標題、說明與下載入口','/franchising/form','data-franchise'],
 ['franchising-intro','加盟介紹','各區塊標題、圖片與按鈕','/franchising/intro','data-franchise','news-articles'],
 ['gallery-index','案例門市列表','標題與篩選提示文字','/gallery','data-storeCases'],
 ['gallery-slug-','門市案例內頁','資訊標題、預約與導覽按鈕','/gallery/case10','data-storeCases'],
 ['knowledge-index','廚房裝修指南列表','區塊標題','/knowledge','knowledge-articles'],
 ['knowledge-design-slug-','知識文章內頁','返回列表按鈕','/knowledge/design/kitchen-outlet-planning','knowledge-articles'],
 ['knowledge-design-systemcabinet','系統櫃專題','段落標題、說明與推薦連結','/knowledge/design/systemcabinet','data-kitchenSystemCabinet','knowledge-articles'],
 ['news-index','優惠消息總覽','分類導覽與列表標題','/news','news-articles'],
 ['news-latest-index','最新消息列表','主視覺與列表標題','/news/latest','news-articles'],
 ['news-latest-slug-','最新消息內頁','分類導覽與提示文字','/news/latest/kaohsiung_opening','news-articles'],
 ['news-activities-index','優惠活動列表','主視覺與列表標題','/news/activities','news-articles'],
 ['news-activities-slug-','優惠活動內頁','分類導覽與提示文字','/news/activities/2025_ro_water_sp','news-articles'],
 ['news-video-index','媒體影音列表','主視覺與列表標題','/news/video','news-articles'],
 ['news-video-slug-','媒體影音內頁','分類導覽與提示文字','/news/video/american_urban','news-articles'],
 ['privacy','隱私權政策','條款段落與修訂日期','/privacy'],
 ['service-process','服務流程','主視覺、介紹與影片說明','/service-process','data-service','site-visuals'],
]
for(const[key,title,contents,href,...related]of views){const shared=key.endsWith('-slug-')||key==='design-inspiration-id-';guides['view-pages-'+key]={title:title+'・'+contents,location:[title,shared?'所有同類內頁共用版面':'頁面版面',contents],href,visual:shared?'article':'page',summary:shared?'此處修改所有同類內頁共用的版面文字；單篇文章或案例內容請使用下方入口。':'此處修改頁面版面文字與顯示設定；資料清單可從下方對應入口編輯。',impacts:[target(shared?title+' → 所有同類內頁（查看代表頁）':title+' → 此頁版面',href)],related}}
for(const[key,title,contents,href,visual]of [
 ['SiteHeader','主選單','選單名稱、子選單與連結','/#top','navigation'],
 ['SiteFooter','頁尾','網站地圖、版權文字與社群連結','/#footer-navigation','footer'],
 ['FloatingButtons','浮動服務入口','側邊按鈕、圖示與連結','/','navigation'],
])guides['view-components-'+key]={title:title+'・'+contents,location:['全站設定',title,contents],href,visual,summary:'共用元件：發布後會同步影響所有使用此元件的官網頁面。',impacts:[target('所有官網頁面 → '+title,href)],related:key==='SiteHeader'?['data-kitchenStyles']:[]}
for(const[key,name]of [['sakura','櫻花'],['svago','SVAGO'],['teka','TEKA'],['cases','來源設計案例']]){const cases=key==='cases',href=cases?'/design-inspiration':'/products/'+key+'/all';guides['catalog-'+key]={title:name+'・上架、推薦與排序',location:[cases?'設計案例':'廚房產品',cases?name:name+'商品','上架狀態與順序'],href,visual:'cards',summary:'僅調整上架、推薦及顯示順序。來源名稱、價格、規格與圖片由原系統提供。',impacts:[target(name+' → 分類、列表與搜尋結果',href),target(name+' → 內容內頁的公開狀態',href)],related:cases?['custom-cases']:['data-productBrands']}}

guides['view-components-home-HomeProject'].summary='修改首頁品牌系列的標題、介紹與系列卡片。'
guides['view-components-home-HomeProject'].relatedLabels={'data-kitchenStyles':'修改卡片圖片與文字','data-kitchenSeries':'修改系列內頁內容'}
guides['view-components-home-HomeGallery'].summary='從案例庫新增或更換已發布案例，自動帶入圖片、門市與連結；此處的精選順序與圖片只影響首頁。'
guides['view-components-home-HomeGallery'].relatedLabels={'data-storeCases':'編輯門市案例','custom-cases':'新增自建案例','catalog-cases':'管理來源案例上架'}

export const homeResources=home.map(([name])=>'view-components-home-'+name)
export function resourceGuide(id){return guides[id]}
export const resourceGuides=guides
export function resourceSearchText(doc){const g=resourceGuide(doc.id);return [g?.title,g?.location.join(' '),g?.summary,...(g?.impacts||[]).map(i=>i.label),doc.title,doc.category].filter(Boolean).join(' ').toLowerCase()}

const labels={
 title:'區塊標題',name:'名稱',shortTitle:'簡短標題',englishTitle:'英文標題',description:'介紹文字',desc:'介紹文字',descriptions:'介紹段落',excerpt:'摘要文字',expandedDescription:'展開後介紹文字',intro:'簡介',introduction:'介紹文字',closing:'結語',conclusion:'結語',subtitle:'副標題',subheading:'副標題',eyebrow:'區塊小標',heading:'段落標題',headlines:'標題文字',body:'段落文字',text:'文字內容',copy:'標題、圖片與按鈕',summary:'文章列表資訊',detail:'文章內文',sections:'內容段落',paragraphs:'段落文字',bullets:'條列說明',points:'重點項目',items:'內容項目',lines:'說明文字',highlights:'重點說明',features:'特色說明',details:'詳細說明',tip:'使用提醒',note:'補充說明',quote:'分享內容',question:'問題文字',templateQuestion:'問題範本',questions:'問題清單',answer:'解答文字',steps:'步驟內容',
 image:'圖片',images:'圖片集',img:'卡片圖片',src:'圖片檔案',cover:'封面圖片',alt:'圖片替代文字',imageAlt:'圖片替代文字',background:'背景圖片',logo:'品牌標誌圖片',portrait:'人物照片',heroSlides:'主視覺輪播圖片',slides:'輪播內容',gallery:'展示圖片',captionTop:'文字顯示於圖片上方',emphasized:'強調顯示',logoClass:'標誌顯示樣式',imageLayout:'圖片排版方式',
 label:'按鈕文字',actionLabel:'按鈕文字',href:'按鈕連結',to:'按鈕連結',url:'連結網址',route:'前往頁面連結',links:'相關連結',children:'子選單項目',external:'使用外部連結',newTab:'另開新分頁',leftNav:'左側主選單',rightNav:'右側主選單',mega:'品牌圖文選單',seriesMega:'顯示系列圖文選單',sitemapGroups:'頁尾網站地圖',primaryItem:'主要服務按鈕',serviceItems:'其他服務按鈕',
 id:'內容識別碼',slug:'固定網址識別碼',articleId:'對應文章識別碼',code:'項目代號',n:'顯示編號',number:'顯示編號',numbers:'條款編號',value:'顯示內容',values:'比較內容',year:'年份',date:'日期',publishedAt:'發布日期',displayDate:'日期顯示文字',category:'文章分類',categoryLabel:'分類顯示名稱',recentRank:'最新文章顯示順序',legacyUrl:'原官網文章網址',legacyPath:'原官網文章連結',detailRoute:'文章內頁連結',source:'資料來源',
 enabled:'上架此項目',available:'開放此系列連結',featured:'優先推薦',sort:'顯示順序',cmsSettings:'區塊顯示與搜尋設定',visible:'顯示此區塊',seo:'搜尋設定',seoTitle:'搜尋結果標題',seoDescription:'搜尋結果摘要',
 zh:'中文名稱',en:'英文名稱',style:'設計風格',styles:'風格項目',color:'設計顏色',size:'設計尺寸',form:'廚房型式',model:'商品型號',type:'內容類型',badge:'標籤文字',budget:'預算',countertop:'檯面材質',kitchenArea:'廚房坪數',household:'家庭成員',designer:'設計師',role:'職稱',tenure:'加盟年資',
 phone:'聯絡電話',email:'電子郵件',address:'地址',hours:'營業時間',city:'所在縣市',region:'所在地區',regionCities:'地區與縣市對照',regions:'門市地區與縣市',mapUrl:'地圖連結',lineUrl:'LINE 諮詢連結',reservationUrl:'預約連結',contact:'門市聯絡資訊',specs:'案例規格',meta:'案例規格',metaLabels:'規格欄位名稱',store:'門市名稱',storeName:'門市名稱',stores:'地圖門市資料',storeCases:'門市資料與案例文章',cases:'推薦案例',article:'案例文章內文',reviews:'顧客分享',
 services:'服務項目',strengths:'建商實力圖文',series:'系列卡片',suites:'系列組合',finishes:'板材與顏色',equipment:'推薦廚電',hero:'系列主視覺',logos:'品牌標誌清單',newsCategories:'消息分類導覽',designStyleLinks:'設計風格推薦連結',kitchenSeriesLinks:'廚房系列推薦文字',columns:'比較表欄位',rows:'比較表項目',catalogues:'型錄卡片',pdfUrl:'型錄 PDF 檔案',downloadFilename:'下載檔案名稱',brochurePages:'加盟型錄預覽頁',video:'影片設定',videoId:'YouTube 影片連結或識別碼',brandVideoId:'品牌承諾影片連結或識別碼',franchiseVideoId:'加盟介紹影片連結或識別碼',caseLink:'相關案例連結',position:'顯示位置',icon:'圖示圖片',
 KITCHEN_STYLES:'系列卡片圖片與文字',KITCHEN_SERIES_PAGES:'十個系列的內頁內容',KITCHEN_CATALOGUES:'品牌系列型錄',PRODUCT_CATALOGUES:'廚房商品型錄',PRODUCT_CARE_CATEGORIES:'保養問題分類',PRODUCT_BRANDS:'三品牌介紹',KITCHEN_GUIDE_ARTICLES:'知識文章列表資訊',KITCHEN_GUIDE_DETAILS:'知識文章內文',
 FRANCHISE_FORM_URL:'站內加盟申請連結',FRANCHISE_OFFICIAL_FORM_URL:'原官網加盟申請連結',FRANCHISE_BROCHURE_URL:'加盟型錄 PDF 連結',BUILDER_APPOINTMENT_HASH:'建商預約區連結',brandHistory:'品牌沿革',brandValues:'品牌承諾內容',brandIdentities:'品牌識別圖片',brandFamilies:'家庭情境圖文',brandBenefits:'品牌優勢圖文',brandAdvantageFaqGroups:'品牌優勢常見問題',brandPavilions:'品牌館資料',pavilionNotice:'品牌館注意事項',serviceSteps:'服務步驟',faqGroups:'常見問題分類',franchiseAdvantages:'加盟優勢圖文',franchiseTestimonials:'加盟夥伴分享',franchiseMarketingStories:'品牌行銷案例',franchiseProcessSteps:'加盟流程',franchiseQualifications:'加盟資格與條件',franchiseSupportHighlights:'總部支援內容',franchiseFaqItems:'加盟常見問題',builderPartners:'合作夥伴標誌',builderProjectCards:'建商合作案例',systemCabinetImportance:'系統櫃材質重點',systemCabinetMaterials:'材質比較表',systemCabinetSelectionSteps:'材質挑選步驟',systemCabinetCaseStudies:'系統櫃推薦案例',sakura:'櫻花品牌介紹',svago:'義大利 SVAGO 品牌介紹',teka:'德國 TEKA 品牌介紹',
 北部:'北部縣市',中部:'中部縣市',南部:'南部縣市',東部:'東部縣市',離島:'離島縣市',
}
const assetLabels={asset_7692def0:'多頁共用・松竹門市主視覺背景',asset_7a7fece6:'加盟／建商・建築裝飾背景',asset_39582b0b:'加盟／建商・圖文區裝飾背景',asset_18ed1982:'建商・實力區裝飾背景',asset_52e702e4:'加盟／建商・服務區裝飾背景',asset_d0922f9d:'加盟／建商・聯繫區裝飾背景',asset_82b9dd3e:'加盟・介紹與申請區背景',asset_38bb39f2:'品牌承諾・設計線稿背景',asset_b3dcb152:'加盟・轉換區廚房背景',asset_1795db00:'加盟・總部支援區背景',asset_98d304fd:'知識文章・麵包屑背景',asset_44761f00:'服務流程・品牌館主視覺背景',asset_9b0c0f62:'全站・廚房裝飾背景',asset_73c853de:'廚電品牌・區塊背景',asset_809f4bbe:'品牌優勢・情境背景',asset_daa09d8d:'品牌館・影片封面背景',asset_10b5a86c:'首頁品牌承諾・影片封面'}

export function fieldPresentation(resourceId,path,schema={}){
 const normalized=path.replace(/^\./,'').replace(/\.\d+(?=\.|$)/g,'.*'),key=normalized.split('.').at(-1)
 if(resourceId==='view-components-home-HomeStyleMarquee'&&normalized==='styles')return{label:'設計風格',rowLabel:'zh',rowImage:'images'}
 if(resourceId==='view-components-home-HomeStoreLocation'&&normalized==='regions')return{label:'地區與縣市設定',editor:'store-regions'}
 if(resourceId==='view-components-home-HomeStoreLocation'&&normalized==='stores')return{label:'門市',idGenerator:'store',newItemLabel:'新增門市',template:{id:0,region:'北部',city:'',name:'',address:'',phone:''}}
 if(resourceId==='view-components-home-HomeStoreLocation'&&normalized==='stores.*')return{label:'門市資料',editor:'store-location'}
 if(resourceId==='view-components-home-HomeStoreLocation'&&['stores.*.id','stores.*.region','stores.*.city'].includes(normalized))return{label:normalized.endsWith('.id')?'識別碼':normalized.endsWith('.region')?'區域':'縣市',hidden:true,readOnly:normalized.endsWith('.id')}
 if(resourceId==='view-components-home-HomeServices'&&normalized==='services')return{label:'廚電品牌',rowLabel:'alt'}
 if(resourceId==='view-components-home-HomeServices'&&normalized==='services.*.img')return{label:'產品圖片'}
 if(resourceId==='view-components-home-HomeServices'&&normalized==='services.*.logo')return{label:'品牌標誌',previewTone:'dark'}
 if(resourceId==='view-components-home-HomeServices'&&normalized==='services.*.logoClass')return{label:'標誌尺寸',enum:['h-[24px] sm:h-[26px] antra:h-[28px]','h-[31px] sm:h-[35px] antra:h-[38px]','h-[32px] sm:h-[36px] antra:h-[39px]'],optionLabels:['小（24–28px）','中（31–38px）','大（32–39px）'],help:'尺寸為標誌高度，會依螢幕寬度自動調整。'}
 if(resourceId==='view-components-home-HomeServices'&&normalized==='services.*.captionTop')return{label:'品牌標誌與介紹置於圖片上方',help:'螢幕寬度達 569px 時生效；較窄螢幕固定顯示於圖片下方。'}
 if(resourceId===HOME_GALLERY_ID){
  if(normalized==='copy')return{label:'標題與按鈕設定'}
  if(normalized==='cases')return{label:'輪播案例'}
  if(normalized==='cases.*.title')return{label:'案例標題'}
  if(normalized==='cases.*.route')return{label:'案例連結'}
 }
 if(resourceId===HOME_HERO_ID&&normalized.startsWith('slides.*.')){
  if(key==='image')return{label:'桌機圖片'}
  if(schema.label)return{label:schema.label}
 }
 const contextual={'KITCHEN_STYLES.*.image':'卡片圖片','KITCHEN_STYLES.*.zh':'系列中文名稱','KITCHEN_STYLES.*.en':'系列英文名稱','KITCHEN_STYLES.*.desc':'卡片介紹文字','KITCHEN_STYLES.*.route':'卡片連結','services.*.copy':'卡片介紹文字','slides.*.title':'輪播標題','slides.*.description':'輪播介紹文字','slides.*.route':'輪播連結','slides.*.image':'輪播圖片','items.*.summary.title':'文章標題','items.*.summary.excerpt':'文章摘要','items.*.summary.cover':'文章封面圖片','storeCases.*.title':'案例文章標題','brandPavilions.*.name':'品牌館名稱','stores.*.name':'門市名稱','services.*.excerpt':'卡片介紹文字','copy.*':'段落文字'}
 if(contextual[normalized])return{label:contextual[normalized]}
 if(key==='id'&&schema.format==='youtube')return{label:'YouTube 影片連結或識別碼'}
 if(resourceId==='view-components-home-HomeServices'&&normalized==='services.*.alt')return{label:'品牌名稱（決定商品頁連結）',help:'使用 SAKURA、SVAGO 或 TEKA；此名稱也決定卡片點擊後前往的品牌商品頁。'}
 if(resourceId==='data-storeCases'&&normalized==='storeCases.*.cover')return{label:'案例門市列表封面',help:'用於案例門市列表；設計靈感列表使用下方圖片集中的第一張圖片。'}
 if(resourceId==='data-storeCases'&&normalized==='storeCases.*.images')return{label:'案例內頁圖片集',help:'第一張圖片也用於設計靈感列表的門市案例卡片。'}
 const copy=copyFields[resourceId]?.[normalized]
 if(copy)return copy
 if(assetLabels[key])return{label:assetLabels[key]}
 if(labels[key])return{label:labels[key]}
 if(key==='*')return{label:schema.type==='object'?'項目內容':schema.format==='media'?'圖片檔案':'文字內容'}
 return{label:'內容欄位',help:'此欄位尚未提供位置說明，請先確認對應範圍。',unmapped:true}
}
export function editingSchema(schema,resourceId,path=''){
 if(!path)schema=homeGallerySchema(resourceId,homeHeroSchema(resourceId,schema))
 const result={...schema},info=fieldPresentation(resourceId,path,schema)
 if(path)Object.assign(result,info)
 if(schema.fields)result.fields=Object.fromEntries(Object.entries(schema.fields).map(([key,value])=>[key,editingSchema(value,resourceId,path?path+'.'+key:key)]))
 if(schema.item)result.item=editingSchema(schema.item,resourceId,path?path+'.*':'*')
 if(resourceId===HOME_GALLERY_ID&&path==='cases')result.editor='home-cases'
 if(resourceId===HOME_HERO_ID&&path==='slides.*'){
  result.editor='hero-images'
  for(const key of ['image','mobileImage','desktopFocusX','desktopFocusY','mobileFocusX','mobileFocusY'])result.fields[key]={...result.fields[key],hidden:true}
 }
 if(path==='items'&&['news-articles','knowledge-articles','custom-cases'].includes(resourceId)){result.label=resourceId==='news-articles'?'消息、活動與影片':resourceId==='knowledge-articles'?'廚房知識文章':'設計案例';result.newItemLabel=resourceId==='news-articles'?'消息或活動':resourceId==='knowledge-articles'?'文章':'案例'}
 if(resourceId==='data-builders'&&path==='builderProjectCards'||resourceId==='data-franchise'&&path==='franchiseProcessSteps')result.hidden=true
 if(path==='sitemapGroups.*.links.*')result.itemLabels=['連結文字','連結網址']
 if(path.split('.').at(-1)==='imageLayout'||path.split('.').at(-1)==='logoClass'&&!(resourceId==='view-components-home-HomeServices'&&path==='services.*.logoClass'))result.hidden=true
 if(['id','articleId','slug','code'].includes(path.split('.').at(-1))&&schema.format!=='youtube')result.hidden=true
 if(['alt','imageAlt'].includes(path.split('.').at(-1)))result.label='圖片說明'
 if(schema.format==='youtube')result.label='YouTube 影片連結'
 if(path==='copy')result.hidden=Object.values(result.fields||{}).every(f=>f.hidden)
 return result
}
