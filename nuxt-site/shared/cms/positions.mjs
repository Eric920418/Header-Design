// Interface locations only. Stored document names, values and public URLs stay unchanged.
import {builderStrengthsDocument,isBuilderStrengthsCopy} from './builder-strengths.mjs'
import {builderHomeOneDocument,builderHomeOneField,builderHomeOneImages} from './builder-home-one.mjs'
import {builderAppointmentDocument,isBuilderAppointmentHeading} from './builder-appointment.mjs'
import {builderCatalogueDocument,isBuilderCatalogueNotice} from './builder-catalogue.mjs'
import {productCatalogueDocument,productCatalogueFields} from './product-catalogue.mjs'
import {headingFieldLabel} from './heading-labels.mjs'

const view=id=>'view-pages-'+id
export const readingField=(readingGroup,label=readingGroup+'名稱')=>({readingGroup,label,advanced:true,help:''})
export const franchiseMarqueeDocument=view('franchising-intro')
export const franchiseDownloadDocument=view('franchising-download')
export const franchiseDownloadActions=['copy.text16','copy.text17']
export const franchiseDownloadSettings=[
 {name:'型錄載入提示',help:'檔案載入或失敗時的說明',fields:['copy.text18','copy.text19','copy.text20'],anchor:'franchise-pdf-actions'},
 {name:'型錄預覽頁碼',help:'顯示在型錄圖片下方',fields:['copy.text21'],anchor:'franchise-catalogue-preview'},
 {name:'頁面底部返回按鈕',help:'頁面最下方的返回按鈕文字與去向',fields:['copy.text23','copy.field22'],anchor:'franchise-download-back'},
]
export const franchiseSupportImagePath='images.asset_1795db00'
export const franchiseSupportImageFallback='/section-6/franchise/hero-store.jpg'
export const franchiseMarqueeRows=[
 {label:'上排輪播圖片',image:'copy.field18',alt:'copy.field19',loop:'copy.field20'},
 {label:'下排輪播圖片',image:'copy.field22',alt:'copy.field23',loop:'copy.field24'},
]
const copyGroups={
 'about-introduce':[
  ['品牌承諾',{text5:readingField('品牌承諾','區塊名稱')}],['專屬品牌識別',{text9:'介紹文字',field10:'圖片放大視窗'}],
 ],
 'about-advantage':[
  ['家庭情境',{text1:'區塊英文主標題',text2:'區塊中文主標題',text3:'介紹文字'}],
 ],
 'about-exhibition':[
  ['品牌館空間介紹',{text1:'開場介紹文字',text2:'區塊英文主標題',text3:'區塊中文主標題',text4:'介紹文字',field5:'左側空間圖片',field6:'左圖圖片說明',field7:'右側空間圖片',field8:'右圖圖片說明'}],
  ['品牌館地址與時間',{text12:'地址欄位名稱',text13:'營業時間欄位名稱',bookingDestination:'前往頁面'}],['參觀注意事項',{text14:'區塊英文主標題',text15:'區塊中文主標題'}],
 ],
 'builders-index':[
  ['主視覺標題',{text1:'區塊英文標籤',text2:'區塊中文主標題（第一段）',text3:'區塊中文主標題（第二段）',text5:'預約按鈕文字',field6:'主圖片',field7:'圖片說明'}],
  ['廚房品牌介紹',{text9:'區塊中文主標題',text11:'介紹文字',field12:'品牌空間圖片說明',field13:'品牌標誌說明',field14:'即將推出圖片說明',text15:'即將推出文字第一行',text16:'即將推出文字第二行'}],
  ['SAKURA iCare',{text24:readingField('iCare 區塊','區塊朗讀名稱'),field28:'iCare 服務說明圖片',field29:'iCare 圖片說明'}],
  ['品牌館資訊與預約',{text33:'區塊英文標籤',text38:'品牌館資訊標題',text39:'預約方式說明',text40:'表單介紹文字',text41:'地址欄位名稱',text42:'營業時間欄位名稱'}],
 ],
 'builders-sakura-kitchen':[
  ['主視覺標題',{field1:'主圖片',field2:'主圖片說明',text3:readingField('頁首','頁面名稱'),field4:'英文品牌標誌',field5:'英文標誌說明',field6:'中文品牌標誌',field7:'中文標誌說明',text8:'介紹文字',field9:'預約按鈕前往頁面',text10:'預約按鈕第一行',text11:'預約按鈕第二行'}],
  ['品牌承諾入口',{field12:'前往頁面',field13:'入口圖片',field14:'圖片說明',text15:'按鈕英文文字',text16:'按鈕介紹文字',text17:'區塊英文標籤'}],
  ['品牌優勢',{text18:'區塊中文主標題（第一段）',text19:'區塊中文主標題（第二段）',text20:'介紹文字第一段',text21:'介紹文字第二段',field22:'區塊圖片',field23:'圖片說明',field24:'預約按鈕前往頁面',text25:'預約按鈕文字'}],
  ['品牌系列',{text26:'區塊英文標籤',text29:'介紹文字',field30:'預約按鈕前往頁面',text31:'預約按鈕文字'}],
 ],
 'builders-catalogues':[['主視覺標題',{text1:'主視覺標題'}],['型錄管理',{text2:readingField('型錄區塊','型錄區塊名稱（僅供朗讀）'),text3:'下載按鈕文字'}]],
 'catalogues-catalog':[
  ['主視覺標題',{text1:'主視覺標題'}],['型錄管理',{text2:readingField('型錄區塊','型錄區塊名稱（僅供朗讀）'),text3:'預覽按鈕文字',text4:'下載按鈕文字'}],
  ['清潔與保養問答',{text9:'保養步驟編號前的文字',text10:'小提醒標題'}],
 ],
 'catalogues-kitchenware-catalog':[['主視覺標題',{text1:'主視覺標題'}],['型錄管理',{text2:readingField('型錄區塊','型錄區塊名稱（僅供朗讀）'),text3:'預覽按鈕文字',text4:'下載按鈕文字'}]],
 'franchising-intro':[
  ['主視覺標題',{field1:'背景圖片',field2:'背景圖片說明',text3:'區塊英文標籤',text4:'區塊中文主標題（第一段）',text5:'區塊中文主標題（第二段）',text7:'介紹文字第一段',text8:'介紹文字第二段',text9:'申請加盟按鈕文字',field10:'門市大圖',field11:'門市圖片說明',field12:'說明會前往頁面',text13:'說明會按鈕文字'}],
  ['加盟夥伴真實分享',{field17:'影片名稱'}],['加盟介紹輪播圖',{field18:franchiseMarqueeRows[0].label,field19:'上排圖片朗讀文字',field20:'上排接續圖片（桌機）',field22:franchiseMarqueeRows[1].label,field23:'下排圖片朗讀文字',field24:'下排接續圖片（桌機）'}],
  ['專業品牌實力',{text26:'區塊英文標籤',text30:'介紹文字',text31:'圖片上的裝飾文字'}],
  ['加盟邀請',{text32:'區塊英文標籤',text33:'區塊英文主標題（第一段）',text34:'區塊英文主標題（第二段）',text35:'介紹文字',text36:'按鈕文字'}],
  ['品牌信賴',{text42:'介紹文字'}],['加盟流程與辦法',{text43:'區塊中文主標題',field44:'流程圖',field45:'流程圖圖片說明'}],
  ['加盟資格與條件',{text47:'區塊中文主標題'}],['總部支援',{text46:'按鈕文字',supportDestination:'前往頁面'}],
  ['加盟資料下載入口',{field52:'封面前往頁面',field53:'下載封面圖片',field54:'封面圖片說明',field55:'標題前往頁面',text56:'卡片標題',text57:'卡片介紹文字'}],
  ['最新加盟資訊',{text58:'區塊英文標籤',field62:'更多消息前往頁面',text63:'更多消息按鈕文字'}],
 ],
 'franchising-form':[['加盟申請表單',{text1:'區塊英文標籤',text2:'區塊中文主標題',text3:'表單介紹文字',field4:'下載按鈕前往頁面',text5:'下載按鈕文字'}]],
 'franchising-download':[
  ['主視覺標題',{field1:'主視覺背景圖片',field2:'圖片說明',text3:'區塊英文標籤',text4:'區塊英文主標題'}],
  ['區塊共用設定',{text5:'區塊中文主標題（第一行）',text6:'區塊中文主標題（第二行）',field7:'品牌標誌',field8:'標誌圖片說明',text9:'檔案介紹文字',text10:'格式欄位名稱',text11:'檔案格式文字',text12:'頁數欄位名稱',text13:'頁數文字',text14:'大小欄位名稱',text15:'檔案大小文字',text16:'線上預覽按鈕文字',text17:'下載按鈕文字',text18:'載入中的提示文字',text19:'載入失敗的提示文字',text20:'重試按鈕文字',text21:'頁碼前的文字',field22:'返回按鈕前往頁面',text23:'返回按鈕文字'}],
 ],
 'gallery-index':[
  ['主視覺標題',{text1:'主視覺標題'}],['地區篩選列',{text2:readingField('門市篩選列','篩選區塊名稱'),text3:'區域標籤文字',text4:'全部區域按鈕文字',text5:'縣市標籤文字'}],
  ['搜尋結果提示',{text6:'門市筆數後的文字'}],['無符合門市提示',{text7:'提示標題',text8:'提示說明',text9:'查看全部按鈕文字'}],
 ],
 'gallery-slug-':[
  ['門市內頁預約按鈕',{field1:'前往頁面',text2:'按鈕文字'}],['門市內頁規格與資訊',{text3:'案例規格標題',text4:'門市資訊標題',text5:'LINE 按鈕文字',text6:'地圖按鈕文字',storeBookingDestination:'前往頁面'}],
  ['門市內頁上一篇與下一篇',{text7:'上一篇按鈕文字',text8:'下一篇按鈕文字'}],['門市內頁顧客評論',{text9:'留言區標題'}],
 ],
 'knowledge-index':[['主視覺標題',{text1:'主視覺標題'}]],
 'knowledge-design-slug-':[['文章底部返回按鈕',{field1:'前往頁面',text2:'按鈕文字'}],['延伸文章按鈕',{moreDestination:'前往頁面'}]],
 'knowledge-design-systemcabinet':[
  ['系統櫃文章返回按鈕',{field1:'前往頁面',text2:'按鈕文字'}],['系統櫃材質重點',{text3:'段落標題'}],
  ['系統櫃板材比較',{text4:'段落標題',text5:readingField('板材比較表','表格說明'),text6:'材質欄位名稱',text7:'手機滑動提示文字'}],
  ['系統櫃挑選步驟',{text8:'段落標題',text9:'介紹文字',text10:'色彩建議連結前文字',text11:'色彩建議連結後文字',text12:'門板造型說明',text13:'系列推薦前的文字',field14:'系列推薦前往頁面'}],
  ['系統櫃推薦案例',{text15:'段落標題'}],['系統櫃文章結語',{text16:'品牌名稱',text17:'介紹文字',field18:'型錄前往頁面',text19:'型錄連結文字',text20:'連結後的文字'}],
 ],
 'news-index':[
  ['主視覺標題',{text1:'主視覺標題'}],
  ['最新消息列表',{text2:readingField('總覽頁文章列表','清單名稱')}],
  ['最新消息分類標籤',{text3:'分類標籤區標題'}],
  ['最新文章',{text4:'最新文章區標題'}],
 ],
 'news-latest-index':[['主視覺標題',{text1:'主視覺標題'}],['消息文章管理',{text2:readingField('最新消息清單','清單名稱')}]],
 'news-activities-index':[['主視覺標題',{text1:'主視覺標題'}],['活動管理',{text2:readingField('優惠活動清單','清單名稱')}]],
 'news-video-index':[['主視覺標題',{text1:'主視覺標題'}],['影音管理',{text2:readingField('媒體影音清單','清單名稱')}]],
 'news-latest-slug-':[
  ['麵包屑編輯設定',{text1:'文章頁首英文標題'}],
  ['頁面共用設定',{field2:'優惠消息前往頁面',text3:'優惠消息連結文字',field4:'最新消息前往頁面',text5:'最新消息連結文字',field7:'優惠活動前往頁面',text8:'優惠活動連結文字',field9:'最新消息前往頁面',text10:'最新消息連結文字',field11:'媒體影音前往頁面',text12:'媒體影音連結文字'}],
 ],
 'news-activities-slug-':[
  ['麵包屑導覽設定',{text1:'內頁英文標題',field2:'優惠消息前往頁面',text3:'優惠消息連結文字',field4:'優惠活動前往頁面',text5:'優惠活動連結文字'}],
  ['文章旁的分類選單',{field6:'優惠活動前往頁面',text7:'優惠活動連結文字',field8:'最新消息前往頁面',text9:'最新消息連結文字',field10:'媒體影音前往頁面',text11:'媒體影音連結文字'}],
 ],
 'news-video-slug-':[
  ['麵包屑導覽設定',{text1:'內頁英文標題',field2:'優惠消息前往頁面',text3:'優惠消息連結文字',field4:'媒體影音前往頁面',text5:'媒體影音連結文字'}],
  ['文章旁的分類選單',{field6:'優惠活動前往頁面',text7:'優惠活動連結文字',field8:'最新消息前往頁面',text9:'最新消息連結文字',field10:'媒體影音前往頁面',text11:'媒體影音連結文字'}],
 ],
 privacy:[['頁面標題與修訂日期',{field1:'頁面英文標題',text2:'條款介紹文字',text3:'最後修訂日期',text4:'公司名稱'}]],
 'service-process':[
  ['主視覺標題',{text1:'主視覺標題'}],['服務流程',{text2:'區塊中文主標題',text3:'區塊英文主標題（第一段）',text4:'區塊英文主標題（第二段）',text5:'區塊英文主標題（第三段）',text6:'介紹文字'}],['品牌影片',{field7:'影片圖片說明'}],
 ],
}
const componentCopyGroups={
 'view-components-SiteHeader':[
  ['左側主導覽',{field1:'前往頁面',text2:'型錄按鈕文字'}],['品牌系列選單設定',{text3:'區塊英文標籤',text4:'第一組系列標題',text5:'系列英文標籤',text6:'第二組系列標題',text7:'開放系列提示',text8:'尚未開放提示'}],
  ['桌機品牌標誌',{field9:'標誌前往頁面',field10:'品牌標誌圖片',field11:'圖片說明'}],['手機品牌標誌',{field12:'標誌前往頁面',field13:'品牌標誌圖片',field14:'圖片說明'}],
  ['手機選單文字',{text15:'總覽連結文字',text16:'系列分類名稱',text17:'未開放提示',text18:'未開放項目後的文字',field19:'型錄前往頁面',text20:'型錄連結文字',text21:'搜尋按鈕名稱'}],
 ],
 'view-components-SiteFooter':[
  ['網站地圖與隱私權入口',{text1:'網站地圖按鈕文字',field2:'隱私權前往頁面',text3:'隱私權連結文字'}],['數位展板與社群連結',{field4:'數位展板前往頁面',field5:'數位展板圖示',field7:'YouTube 前往頁面',field8:'YouTube 圖示'}],
  ['版權與品牌標誌',{text10:'版權文字第一段',text11:'公司名稱',text12:'版權文字最後一段',field13:'品牌標誌圖片',field14:'圖片說明'}],
 ],
}
const fields=new Map()
for(const [id,groups]of [...Object.entries(copyGroups).map(([id,g])=>[view(id),g]),...Object.entries(componentCopyGroups)])for(const[name,items]of groups)for(const[key,item]of Object.entries(items)){
 const field=typeof item==='string'?{label:item}:item
 fields.set(id+':copy.'+key,{name,...field,label:headingFieldLabel(field.label),singleLine:!/(介紹|說明|文字第一段|文字第二段|連結前|連結後|結語)/.test(field.label)})
}
export const positionField=(id,path)=>fields.get(id+':'+path)

const section=(name,hint,kind='text',anchor='',image)=>({name,hint,kind,anchor,image})
const commonHero=['site-visuals','images.asset_7692def0']
const taichungHero=['site-visuals','images.asset_44761f00']
export const pagePositions={
 home:{hero:['view-components-home-HomeHero','slides.0.image'],sections:[section('首頁輪播圖片','首頁圖片、標題與連結','hero','hero-title'),section('品牌系列','首頁系列卡片與區塊介紹','cards','kitchen-series'),section('設計風格圖片','風格圖示、廚房圖片與連結','cards','home-styles'),section('廚房產品','品牌產品圖片與介紹','cards','services-heading'),section('集團品牌標誌','品牌標誌與前往頁面','logos','brand-logos'),section('設計案例','首頁輪播案例與更多按鈕','cards','gallery-heading'),section('品牌承諾','品牌介紹、影片封面與連結','video','brand-promise',['site-visuals','images.asset_10b5a86c']),section('全台門市據點','門市地圖、聯絡資料與查詢','map','contact')]},
 series:{hero:['data-kitchenSeries','KITCHEN_SERIES_PAGES.0.heroSlides'],sections:[
  {...section('品牌系列內頁','選擇系列，修改介紹、圖片與組合','cards'),aliases:['series:系列內頁']},
 ]},
 inspiration:{sections:[]},
 knowledge:{hero:commonHero,sections:[
  section('主視覺標題','列表最上方的大標題','hero','kitchen-guide-page-title'),
  section('麵包屑編輯設定','列表與內頁上方的位置導覽文字','page-breadcrumb','knowledge-breadcrumb'),
  section('文章管理','文章封面、摘要與內文，含系統櫃專題','cards','kitchen-guide-heading'),
  section('頁面共用設定','文章返回、延伸閱讀及顯示設定','article'),
 ]},
 'series-catalogue':{hero:commonHero,sections:[
  {...section('主視覺標題','型錄頁最上方的大標題','hero','catalogue-page-title'),aliases:['series-catalogue:頁面最上方']},
  section('麵包屑編輯設定','型錄頁上方的位置導覽文字','page-breadcrumb','series-catalogue-breadcrumb'),
  {...section('型錄管理','管理型錄封面、預覽與下載檔案','download-catalogue','brand-series-catalogues'),aliases:['series-catalogue:型錄封面與下載']},
 ]},
 ...Object.fromEntries(['sakura','svago','teka'].map(brand=>['products-'+brand,{hero:['data-productBrands','PRODUCT_BRANDS.'+brand+'.image'],sections:[section('品牌介紹','品牌名稱、介紹文字與圖片','cards'),{...section('商品頁型錄按鈕','品牌商品列表與內頁的共用連結','catalogue'),previewPage:'/products/'+brand+'/all#near-suction-catalogue-title',fixedAction:'廚房商品型錄下載'},section('商品顯示與排序','選擇商品，調整顯示與順序','products')]}])),
 'product-catalogue':{hero:commonHero,sections:[
  {...section('主視覺標題','商品型錄頁最上方的大標題','hero','product-catalogue-title'),aliases:['product-catalogue:頁面最上方']},
  section('麵包屑編輯設定','商品型錄頁上方的位置導覽文字','page-breadcrumb','product-catalogue-breadcrumb'),
  {...section('型錄管理','管理型錄封面、預覽與下載檔案','download-catalogue','product-catalogue-list'),aliases:['product-catalogue:型錄封面與下載']},
  section('清潔與保養問答','選購指南標題、商品分類、保養問答及右側圖文','product-care','product-care-title'),
 ]},
 stores:{hero:commonHero,sections:[
  section('主視覺標題','門市列表最上方的大標題','hero','gallery-page-title'),
  section('地區篩選列','區域與縣市的篩選名稱','filter','gallery-filter-title'),
  section('搜尋結果提示','篩選後的門市筆數說明','results','gallery-filter-title'),
  section('無符合門市提示','沒有符合條件門市時的訊息','empty','gallery-filter-title'),
  section('區域與縣市','調整官網地區篩選的縣市選項與順序','filter','gallery-filter-title'),
 ]},
 'store-cases':{hero:commonHero,sections:[
  section('門市管理','選擇門市，修改文章、照片及門市資料','stores'),
  section('門市內頁預約按鈕','所有門市案例共用的預約按鈕','store-booking','case-booking'),
  section('門市內頁規格與資訊','所有門市案例共用的規格標題、聯絡按鈕與地圖文字','store-info','case-spec-title'),
  section('門市內頁上一篇與下一篇','所有門市案例共用的前後篇按鈕文字','store-navigation','case-navigation'),
  section('門市內頁顧客評論','所有門市案例共用的評論區標題','store-reviews','case-reviews-title'),
 ]},
 service:{hero:taichungHero,sections:[
  section('主視覺標題','頁面最上方的大標題','hero','service-page-title'),
  {...section('服務流程','流程介紹與每一步的內容','steps','service-intro-title'),aliases:['service:服務流程與介紹']},
  {...section('品牌影片','影片、封面與圖片說明','video','service-brand-video',['site-visuals','serviceVideoCover']),aliases:['service:服務介紹影片']},
  {...section('服務指南','頁面下方的常見問題','faq','service-guide'),aliases:['service:服務指南問答']},
 ]},
 news:{hero:commonHero,sections:[
  section('主視覺標題','消息總覽最上方的大標題','hero','news-page-title'),
  {...section('最新消息列表','找到文章後按「編輯文章」，可修改封面、標題、摘要與內文。','news-overview','news-list-title'),aliases:['news:全部消息列表']},
  {...section('最新消息分類標籤','列表旁的分類名稱與連結','navigation','news-tags-title'),aliases:['news:消息分類選單']},
  {...section('最新文章','官網右側顯示的文章與側欄標題','news-recent','sidebar-recent-title'),aliases:['news:最近文章推薦'],help:'文章與「最新消息列表」共用。修改封面、標題、摘要或內文，會同步更新該篇文章。'},
 ]},
 'news-latest':{hero:commonHero,sections:[
  section('主視覺標題','列表最上方的大標題','hero','latest-page-title'),
  {...section('麵包屑編輯設定','列表與文章頁首的位置導覽','breadcrumb'),aliases:['news-latest:文章最上方與返回導覽','news-latest:麵包屑導覽設定']},
  {...section('消息文章管理','封面、標題、日期與完整內文','news-overview','latest-list-title'),aliases:['news-latest:消息管理','news-latest:文章報名圖片提示']},
  {...section('頁面共用設定','每篇文章共用的分類連結','news-shared'),aliases:['news-latest:文章旁的分類選單']},
 ]},
 ...Object.fromEntries(['activities','video'].map((category,i)=>['news-'+category,{hero:commonHero,sections:[section('主視覺標題','列表最上方的大標題','hero',['activity','video'][i]+'-page-title'),{...section('麵包屑導覽設定','文章頁首的英文標題與分類連結','breadcrumb'),aliases:['news-'+category+':文章最上方與返回導覽']},section(['活動管理','影音管理'][i],'封面、標題、日期與完整內文','cards'),section('文章旁的分類選單','文章末段的優惠活動、最新消息與媒體影音連結','navigation')]}])),
 about:{hero:'/section-5/brand-pavilion/pavilion-taichung.jpg',sections:[section('品牌歷程','年份、沿革照片與品牌故事','timeline','about-services-title'),section('品牌承諾','介紹內容與情境圖片','cards','about-values-title'),section('專屬品牌識別','品牌銘板與識別圖片','logos','about-identity-title')]},
 advantage:{hero:'/section-5/brand-advantage/banner.jpg',sections:[section('家庭情境','家庭情境照片、標題與介紹','cards','brand-family-title'),section('品牌優勢','優勢內容與對應圖片','cards'),section('品牌優勢問答','頁面下方的品牌常見問題','faq','brand-advantage-faq-title')]},
 pavilions:{hero:'/section-5/brand-pavilion/banner.jpg',sections:[section('品牌館影片','頁面最上方的品牌影片','video','pavilion-hero-title'),section('品牌館空間介紹','空間介紹與左右兩張照片','cards','pavilion-fundamentals-title'),section('品牌館地址與時間','館別照片、聯絡資訊與預約按鈕','stores','pavilion-gallery-title'),section('參觀注意事項','頁面下方的注意事項','article','pavilion-styles-title')]},
 franchise:{hero:[franchiseMarqueeDocument,'copy.field1'],sections:[
  {...section('主視覺標題','加盟介紹、門市大圖與申請入口','hero','franchise-page-title'),aliases:['franchise:頁面最上方']},
  section('加盟夥伴真實分享','加盟故事、影片與夥伴分享','video','franchise-story-title'),
  {...section('加盟介紹輪播圖','更換官網上下兩排的循環照片','franchise-marquee','franchise-intro-marquee'),aliases:['franchise:品牌成果圖片']},
  section('專業品牌實力','加盟優勢的介紹與圖文','cards','franchise-advantage-title'),section('加盟邀請','邀請文案與加盟按鈕','text','franchise-conversion-title',['site-visuals','images.asset_b3dcb152']),
  {...section('品牌信賴','介紹文字與品牌案例','cards','franchise-marketing-title'),aliases:['franchise:品牌信賴與行銷']},
  section('加盟流程與辦法','七步驟流程圖與圖片說明','steps','franchise-process-title'),section('加盟資格與條件','資格條件與申請準備','text'),section('總部支援','支援項目、背景圖片與申請按鈕','franchise-support','franchise-support',['site-visuals',franchiseSupportImagePath]),{...section('了解加盟資訊','加盟問答與旁邊的資料封面','franchise-faq','franchise-faq-title',[franchiseMarqueeDocument,'copy.field53']),aliases:['franchise:加盟常見問題']},{...section('加盟資料下載入口','加盟介紹問答旁的封面、標題與連結','catalogue','franchise-faq-title'),aliases:['franchise:加盟資料下載']},section('最新加盟資訊','編輯官網此區的文章、小標及查看更多按鈕','franchise-news','franchise-news-title')]},
 'franchise-form':{hero:['site-visuals','images.asset_82b9dd3e'],sections:[
  {...section('加盟申請表單','表單上方的標題、填寫說明與下載按鈕','franchise-application','franchise-application-title'),aliases:['franchise-form:申請表單上方']},
 ]},
 'franchise-download':{hero:[franchiseDownloadDocument,'copy.field1'],sections:[
  {...section('主視覺標題','下載頁最上方的大圖、英文標籤與英文主標題','hero','franchise-download-title'),aliases:['franchise-download:頁面最上方']},
  section('麵包屑編輯設定','主視覺下方的頁面導覽文字','franchise-download-breadcrumb','franchise-download-breadcrumb'),
  {...section('型錄管理','管理型錄封面、預覽與下載檔案','franchise-download-catalogue','franchise-catalogue-preview',[franchiseDownloadDocument,'brochurePages.0.image']),aliases:['franchise-download:型錄預覽圖片']},
  {...section('區塊共用設定','加盟簡介、按鈕、頁碼與載入提示文字','franchise-download-document','franchise-document-title'),aliases:['加盟簡介與檔案','加盟簡介與下載按鈕',...franchiseDownloadSettings.map(group=>group.name)].map(name=>'franchise-download:'+name)},
 ]},
 builders:{hero:[view('builders-index'),'copy.field6'],sections:[
  {...section('主視覺標題','主標題、預約按鈕與廚房大圖','hero','builders-title'),aliases:['builders:頁面最上方']},
  section('廚房品牌介紹','品牌卡片上方的中文主標題、介紹文字與即將推出卡片文字','builders-brand-intro','builders-team-title',['data-builders','builderProjectCards.0.image']),
  section('智能整合','區塊共用標題、介紹與三張統計圖文','builders-strengths','builders-capability-title'),
  section('HOME IN ONE','更換橫幅、服務合圖與編輯下方說明','builders-home-one',builderHomeOneImages[0].anchor,[builderHomeOneDocument,'copy.homeOneBanner']),
  {...section('SAKURA iCare','更換官網的 iCare 服務說明圖片','builders-icare','builders-icare',[view('builders-index'),'copy.field28']),aliases:['builders:售後服務']},
  {...section('品牌館資訊與預約','中英文標題、館別照片與預約說明','builders-appointment','appointment'),aliases:['builders:聯繫與參觀預約']},
 ]},
 'builder-series':{hero:[view('builders-sakura-kitchen'),'copy.field1'],sections:[
  {...section('主視覺標題','主圖片、品牌標誌與介紹','builder-series-hero','builder-sakura-hero'),aliases:['builder-series:頁面最上方']},
  section('品牌承諾入口','主圖片下方的介紹入口','cards','brand-advantage'),
  section('品牌優勢','品牌優勢介紹與圖片','cards','sakura-kitchen-advantage-title'),
  section('品牌系列','系列圖片、介紹與預約按鈕','cards','sakura-kitchen-series-title'),
 ]},
 'builder-catalogues':{hero:commonHero,sections:[
  {...section('主視覺標題','建商型錄頁最上方的大標題','hero','builder-catalogue-title'),aliases:['builder-catalogues:頁面最上方']},
  section('麵包屑編輯設定','建商專區型錄頁上方的位置導覽文字','page-breadcrumb','builder-catalogue-breadcrumb'),
  {...section('型錄管理','管理型錄封面、預覽與下載檔案','builder-catalogue-cards','builder-catalogue-list'),aliases:['builder-catalogues:型錄封面與下載']},
 ]},
 menu:{sections:[
  {...section('左側主導覽','官網左側分類與連結，含廚房產品型錄按鈕','navigation'),aliases:['menu:左側主選單','menu:展開選單中的型錄入口']},
  {...section('右側主導覽','官網右側分類與連結','navigation'),aliases:['menu:右側主選單']},
  {...section('品牌系列選單設定','展開品牌系列後的標題與提示','navigation'),aliases:['menu:展開選單中的系列文字']},
  section('桌機品牌標誌','桌機導覽中央的品牌標誌','logos'),
  section('手機品牌標誌','手機頁首的品牌標誌','logos'),
  section('手機選單文字','手機選單的分類與提示','navigation'),
 ]},
 footer:{sections:[section('網站地圖與隱私權入口','頁尾網站地圖與隱私權連結','footer'),section('數位展板與社群連結','頁尾右側的外部連結與圖示','footer'),section('版權與品牌標誌','頁尾底部版權與品牌標誌','footer')]},
 visuals:{sections:[section('共用主視覺背景','多個列表頁使用的背景圖片','hero'),section('加盟與建商背景','加盟與建商頁的裝飾背景','cards'),section('品牌與服務背景','品牌介紹、服務與知識頁背景','cards'),section('首頁品牌影片','首頁品牌承諾的影片與封面','video'),section('加盟夥伴影片','加盟頁分享影片','video'),section('品牌館影片','集團品牌館的影片','video'),section('服務介紹影片','服務流程的影片與封面','video')]},
 privacy:{sections:[section('頁面標題與修訂日期','隱私權頁的標題與修訂資訊','article'),section('隱私權條款','條款編號與各段完整內容','article','privacy-0')]},
}

const dataGroups={
 'data-kitchenSeries':{KITCHEN_SERIES_PAGES:'品牌系列內頁'},
 'data-aboutUs':{brandHistory:'品牌歷程',brandValues:'品牌承諾',brandIdentities:'專屬品牌識別'},
 'data-brandAdvantage':{brandFamilies:'家庭情境',brandBenefits:'品牌優勢',brandAdvantageFaqGroups:'品牌優勢問答'},
 'data-service':{serviceSteps:'服務流程',faqGroups:'服務指南'},
 'data-brandPavilions':{brandPavilions:'品牌館地址與時間',pavilionNotice:'參觀注意事項'},
 'data-franchise':{FRANCHISE_FORM_URL:'主視覺標題',FRANCHISE_OFFICIAL_FORM_URL:'主視覺標題',FRANCHISE_BROCHURE_URL:'加盟簡介與下載按鈕',franchiseAdvantages:'專業品牌實力',franchiseTestimonials:'加盟夥伴真實分享',franchiseMarketingStories:'品牌信賴',franchiseQualifications:'加盟資格與條件',franchiseSupportHighlights:'總部支援',franchiseFaqItems:'了解加盟資訊'},
 'data-builders':{BUILDER_APPOINTMENT_HASH:'主視覺標題'},
 'data-storeCases':{storeCases:'門市管理',regionCities:'區域與縣市'},
 'data-productCatalogues':{PRODUCT_CATALOGUES:'型錄管理',PRODUCT_CARE_CATEGORIES:'清潔與保養問答'},
 'data-kitchenSystemCabinet':{systemCabinetImportance:'系統櫃材質重點',systemCabinetMaterials:'系統櫃板材比較',systemCabinetSelectionSteps:'系統櫃挑選步驟',systemCabinetCaseStudies:'系統櫃推薦案例'},
}
export function positionGroup(page,id,path){
 if(page==='home'||page==='inspiration')return
 if(path==='cmsSettings'||path==='seo')return
 if(page==='series-catalogue'&&id===view('catalogues-kitchenware-catalog')&&path.startsWith('copy.breadcrumb'))return '麵包屑編輯設定'
 if(page==='series-catalogue'&&id==='data-catalogues'&&path==='KITCHEN_CATALOGUES')return '型錄管理'
 if(page==='product-catalogue'&&id===productCatalogueDocument){
  if(path.startsWith('copy.breadcrumb'))return '麵包屑編輯設定'
  if(path==='copy.kitchenwareTitle')return '型錄管理'
  if(path.startsWith('copy.')&&Object.hasOwn(productCatalogueFields,path.slice(5)))return '清潔與保養問答'
 }
 if(id==='site-visuals'){
  if(page==='service')return '品牌影片'
  if(page==='pavilions')return '品牌館影片'
  if(page==='franchise')return path===franchiseSupportImagePath?'總部支援':'加盟夥伴真實分享'
  if(page==='visuals')return path.startsWith('images.')?(/asset_(?:7a7fece6|39582b0b|18ed1982|52e702e4|d0922f9d|82b9dd3e|b3dcb152|1795db00|38bb39f2)$/.test(path)?'加盟與建商背景':path.endsWith('asset_7692def0')?'共用主視覺背景':path.endsWith('asset_10b5a86c')?'首頁品牌影片':'品牌與服務背景'):({brandVideoId:'首頁品牌影片',brandVideoSrc:'首頁品牌影片',franchiseVideoId:'加盟夥伴影片',pavilionVideoId:'品牌館影片',serviceVideoSrc:'服務介紹影片',serviceVideoCover:'服務介紹影片'})[path]
 }
 if(page==='builders'&&(id==='data-brandPavilions'||id===builderAppointmentDocument&&isBuilderAppointmentHeading(path)))return '品牌館資訊與預約'
 if(page==='builders'&&id===builderStrengthsDocument&&(path==='strengths'||isBuilderStrengthsCopy(path)))return '智能整合'
 if(page==='builders'&&id===builderHomeOneDocument&&(path==='services'||builderHomeOneField(path)))return 'HOME IN ONE'
 if(page==='franchise'&&path==='FRANCHISE_BROCHURE_URL')return '加盟資料下載入口'
 if(id==='knowledge-articles')return '文章管理'
 if(page==='news-latest'&&id===view('news-latest-index')&&path.startsWith('copy.breadcrumb'))return '麵包屑編輯設定'
 if(id==='news-articles')return page==='franchise'?'最新加盟資訊':page==='news'?'最新消息列表':page==='news-latest'?'消息文章管理':page==='news-activities'?'活動管理':'影音管理'
 if(id.startsWith('catalog-'))return '商品顯示與排序'
 if(path==='metaLabels')return '門市內頁規格與資訊'
 if(id===view('news-index')&&path==='newsCategories')return '最新消息分類標籤'
 if(page==='privacy'&&['sections','numbers'].includes(path))return '隱私權條款'
 if(path==='sitemapGroups')return '網站地圖與隱私權入口'
 if(page==='builder-catalogues'&&id===builderCatalogueDocument){
  if(path==='catalogues'||isBuilderCatalogueNotice(path))return '型錄管理'
  if(path.startsWith('copy.breadcrumb'))return '麵包屑編輯設定'
 }
 if(page==='franchise-download'){
  if(id===franchiseDownloadDocument&&path.startsWith('copy.breadcrumb'))return '麵包屑編輯設定'
  if(path==='brochurePages'||path==='FRANCHISE_BROCHURE_URL')return '型錄管理'
 }
 if(id===view('knowledge-design-systemcabinet')&&['designStyleLinks','kitchenSeriesLinks'].includes(path))return '系統櫃挑選步驟'
 return positionField(id,path)?.name||dataGroups[id]?.[path]
}
export function decoratePosition(page,block){
 const sections=pagePositions[page]?.sections||[],position=sections.find(s=>s.name===block.name)
 return position?{...position,...block,...(position.aliases?{aliases:[...new Set([...(block.aliases||[]),...position.aliases])]}:{}),...(position.href?{href:position.href}:{}),hint:position.hint,kind:position.kind,anchor:position.anchor,image:position.image,positionIndex:sections.indexOf(position)+1,positionTotal:sections.length}:block
}
export function positionImage(reference,bodies){
 return Array.isArray(reference)?reference[1].split('.').reduce((value,key)=>value?.[key],bodies[reference[0]]):reference||''
}
