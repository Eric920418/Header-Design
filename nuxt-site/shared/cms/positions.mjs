// Interface locations only. Stored document names, values and public URLs stay unchanged.
const view=id=>'view-pages-'+id
const copyGroups={
 'about-introduce':[
  ['品牌承諾',{text5:'區塊標題'}],['專屬品牌識別',{text9:'介紹文字',field10:'圖片放大視窗'}],
 ],
 'about-advantage':[
  ['家庭情境',{text1:'區塊英文標題',text2:'區塊標題',text3:'介紹文字'}],
 ],
 'about-exhibition':[
  ['品牌館空間介紹',{text1:'開場介紹文字',text2:'區塊英文標題',text3:'區塊標題',text4:'介紹文字',field5:'左側空間圖片',field6:'左圖圖片說明',field7:'右側空間圖片',field8:'右圖圖片說明'}],
  ['品牌館地址與時間',{text12:'地址欄位名稱',text13:'營業時間欄位名稱'}],['參觀注意事項',{text14:'區塊英文標題',text15:'區塊標題'}],
 ],
 'builders-index':[
  ['頁面最上方',{text1:'區塊英文小標',text2:'主標題第一行',text3:'主標題第二行',text5:'預約按鈕文字',field6:'主圖片',field7:'圖片說明'}],
  ['廚房品牌介紹',{text9:'區塊標題',text11:'介紹文字',field12:'品牌空間圖片說明',field13:'品牌標誌說明',field14:'即將推出圖片說明',text15:'即將推出文字第一行',text16:'即將推出文字第二行'}],
  ['售後服務',{text24:'影片區塊名稱',field28:'服務說明圖片',field29:'圖片說明'}],
  ['聯繫與參觀預約',{text33:'區塊英文小標',text38:'品牌館名稱',text39:'預約方式說明',text40:'表單介紹文字',text41:'地址欄位名稱',text42:'營業時間欄位名稱'}],
 ],
 'builders-sakura-kitchen':[
  ['頁面最上方',{field1:'主圖片',field2:'主圖片說明',text3:'主標題（供語音朗讀）',field4:'英文品牌標誌',field5:'英文標誌說明',field6:'中文品牌標誌',field7:'中文標誌說明',text8:'介紹文字',field9:'預約按鈕前往頁面',text10:'預約按鈕第一行',text11:'預約按鈕第二行'}],
  ['品牌承諾入口',{field12:'前往頁面',field13:'入口圖片',field14:'圖片說明',text15:'按鈕英文文字',text16:'按鈕介紹文字',text17:'區塊英文小標'}],
  ['品牌優勢',{text18:'區塊標題第一行',text19:'區塊標題第二行',text20:'介紹文字第一段',text21:'介紹文字第二段',field22:'區塊圖片',field23:'圖片說明',field24:'預約按鈕前往頁面',text25:'預約按鈕文字'}],
  ['品牌系列',{text26:'區塊英文小標',text29:'介紹文字',field30:'預約按鈕前往頁面',text31:'預約按鈕文字'}],
 ],
 'builders-catalogues':[['頁面最上方',{text1:'主視覺標題'}],['型錄封面與下載',{text2:'型錄清單名稱（供語音朗讀）',text3:'下載按鈕文字'}]],
 'catalogues-catalog':[
  ['頁面最上方',{text1:'主視覺標題'}],['型錄封面與下載',{text2:'型錄清單名稱（供語音朗讀）',text3:'預覽按鈕文字',text4:'下載按鈕文字'}],
  ['清潔與保養問答',{text9:'保養步驟編號前的文字',text10:'小提醒標題'}],
 ],
 'catalogues-kitchenware-catalog':[['頁面最上方',{text1:'主視覺標題'}],['型錄封面與下載',{text2:'型錄清單名稱（供語音朗讀）',text3:'預覽按鈕文字',text4:'下載按鈕文字'}]],
 'franchising-intro':[
  ['頁面最上方',{field1:'背景圖片',field2:'背景圖片說明',text3:'區塊英文小標',text4:'主標題第一行',text5:'主標題第二行',text7:'介紹文字第一段',text8:'介紹文字第二段',text9:'申請加盟按鈕文字',field10:'門市大圖',field11:'門市圖片說明',field12:'說明會前往頁面',text13:'說明會按鈕文字'}],
  ['加盟夥伴真實分享',{field17:'影片名稱'}],['品牌成果圖片',{field18:'第一張圖片',field19:'第一張圖片說明',field20:'第一張循環圖片',field22:'第二張圖片',field23:'第二張圖片說明',field24:'第二張循環圖片'}],
  ['專業品牌實力',{text26:'區塊英文小標',text30:'介紹文字',text31:'圖片上的裝飾文字'}],
  ['加盟邀請',{text32:'區塊英文小標',text33:'區塊標題第一行',text34:'區塊標題第二行',text35:'介紹文字',text36:'按鈕文字'}],
  ['品牌信賴與行銷',{text42:'介紹文字'}],['加盟流程與辦法',{text43:'區塊標題',field44:'流程圖',field45:'流程圖圖片說明'}],
  ['加盟資格與條件',{text47:'區塊標題'}],['總部支援',{text46:'申請加盟按鈕文字'}],
  ['加盟資料下載',{field52:'封面前往頁面',field53:'下載封面圖片',field54:'封面圖片說明',field55:'標題前往頁面',text56:'下載區標題',text57:'下載區介紹文字'}],
  ['最新加盟資訊',{text58:'區塊英文小標',field62:'更多消息前往頁面',text63:'更多消息按鈕文字'}],
 ],
 'franchising-form':[['申請表單上方',{text1:'區塊英文小標',text2:'頁面標題',text3:'表單介紹文字',field4:'下載按鈕前往頁面',text5:'下載按鈕文字'}]],
 'franchising-download':[
  ['頁面最上方',{field1:'背景圖片',field2:'圖片說明',text3:'區塊英文小標',text4:'主視覺標題'}],
  ['加盟簡介與檔案',{text5:'標題第一行',text6:'標題第二行',field7:'品牌標誌',field8:'標誌圖片說明',text9:'檔案介紹文字',text10:'格式欄位名稱',text11:'檔案格式文字',text12:'頁數欄位名稱',text13:'頁數文字',text14:'大小欄位名稱',text15:'檔案大小文字',text16:'線上預覽按鈕文字',text17:'下載按鈕文字'}],
  ['型錄載入提示',{text18:'載入中的提示文字',text19:'載入失敗的提示文字',text20:'重試按鈕文字'}],
  ['型錄預覽圖片',{text21:'頁碼前的文字'}],['頁面底部返回按鈕',{field22:'前往頁面',text23:'按鈕文字'}],
 ],
 'gallery-index':[
  ['主視覺標題',{text1:'主視覺標題'}],['地區篩選列',{text2:'篩選區塊名稱（供語音朗讀）',text3:'區域標籤文字',text4:'全部區域按鈕文字',text5:'縣市標籤文字'}],
  ['搜尋結果提示',{text6:'門市筆數後的文字'}],['無符合門市提示',{text7:'提示標題',text8:'提示說明',text9:'查看全部按鈕文字'}],
 ],
 'gallery-slug-':[
  ['門市內頁預約按鈕',{field1:'前往頁面',text2:'按鈕文字'}],['門市內頁規格與資訊',{text3:'案例規格標題',text4:'門市資訊標題',text5:'LINE 按鈕文字',text6:'地圖按鈕文字'}],
  ['門市內頁上一篇與下一篇',{text7:'上一篇按鈕文字',text8:'下一篇按鈕文字'}],['門市內頁顧客評論',{text9:'留言區標題'}],
 ],
 'knowledge-index':[['主視覺標題',{text1:'主視覺標題'}]],
 'knowledge-design-slug-':[['文章底部返回按鈕',{field1:'前往頁面',text2:'按鈕文字'}]],
 'knowledge-design-systemcabinet':[
  ['系統櫃文章返回按鈕',{field1:'前往頁面',text2:'按鈕文字'}],['系統櫃材質重點',{text3:'段落標題'}],
  ['系統櫃板材比較',{text4:'段落標題',text5:'比較表說明（供語音朗讀）',text6:'材質欄位名稱',text7:'手機滑動提示文字'}],
  ['系統櫃挑選步驟',{text8:'段落標題',text9:'介紹文字',text10:'色彩建議連結前文字',text11:'色彩建議連結後文字',text12:'門板造型說明',text13:'系列推薦前的文字',field14:'系列推薦前往頁面'}],
  ['系統櫃推薦案例',{text15:'段落標題'}],['系統櫃文章結語',{text16:'品牌名稱',text17:'介紹文字',field18:'型錄前往頁面',text19:'型錄連結文字',text20:'連結後的文字'}],
 ],
 'news-index':[['主視覺標題',{text1:'主視覺標題'}],['全部消息列表',{text2:'清單名稱（供語音朗讀）'}],['消息分類選單',{text3:'分類選單標題'}],['最近文章推薦',{text4:'推薦區標題'}]],
 'news-latest-index':[['主視覺標題',{text1:'主視覺標題'}],['消息管理',{text2:'清單名稱（供語音朗讀）'}]],
 'news-activities-index':[['主視覺標題',{text1:'主視覺標題'}],['活動管理',{text2:'清單名稱（供語音朗讀）'}]],
 'news-video-index':[['主視覺標題',{text1:'主視覺標題'}],['影音管理',{text2:'清單名稱（供語音朗讀）'}]],
 'news-latest-slug-':[
  ['文章最上方與返回導覽',{text1:'內頁英文標題',field2:'優惠消息前往頁面',text3:'優惠消息連結文字',field4:'最新消息前往頁面',text5:'最新消息連結文字'}],
  ['文章報名圖片提示',{text6:'報名 QR Code 圖片說明'}],['文章旁的分類選單',{field7:'優惠活動前往頁面',text8:'優惠活動連結文字',field9:'最新消息前往頁面',text10:'最新消息連結文字',field11:'媒體影音前往頁面',text12:'媒體影音連結文字'}],
 ],
 'news-activities-slug-':[
  ['文章最上方與返回導覽',{text1:'內頁英文標題',field2:'優惠消息前往頁面',text3:'優惠消息連結文字',field4:'優惠活動前往頁面',text5:'優惠活動連結文字'}],
  ['文章旁的分類選單',{field6:'優惠活動前往頁面',text7:'優惠活動連結文字',field8:'最新消息前往頁面',text9:'最新消息連結文字',field10:'媒體影音前往頁面',text11:'媒體影音連結文字'}],
 ],
 'news-video-slug-':[
  ['文章最上方與返回導覽',{text1:'內頁英文標題',field2:'優惠消息前往頁面',text3:'優惠消息連結文字',field4:'媒體影音前往頁面',text5:'媒體影音連結文字'}],
  ['文章旁的分類選單',{field6:'優惠活動前往頁面',text7:'優惠活動連結文字',field8:'最新消息前往頁面',text9:'最新消息連結文字',field10:'媒體影音前往頁面',text11:'媒體影音連結文字'}],
 ],
 privacy:[['頁面標題與修訂日期',{field1:'頁面英文標題',text2:'條款介紹文字',text3:'最後修訂日期',text4:'公司名稱'}]],
 'service-process':[
  ['主視覺標題',{text1:'主視覺標題'}],['服務流程與介紹',{text2:'區塊標題',text3:'英文標題第一段',text4:'英文標題第二段',text5:'英文標題第三段',text6:'介紹文字'}],['服務介紹影片',{field7:'影片圖片說明'}],
 ],
}
const componentCopyGroups={
 'view-components-SiteHeader':[
  ['展開選單中的型錄入口',{field1:'前往頁面',text2:'按鈕文字'}],['展開選單中的系列文字',{text3:'英文小標',text4:'第一組系列標題',text5:'系列英文小標',text6:'第二組系列標題',text7:'開放系列提示',text8:'尚未開放提示'}],
  ['桌機品牌標誌',{field9:'標誌前往頁面',field10:'品牌標誌圖片',field11:'圖片說明'}],['手機品牌標誌',{field12:'標誌前往頁面',field13:'品牌標誌圖片',field14:'圖片說明'}],
  ['手機選單文字',{text15:'總覽連結文字',text16:'系列分類名稱',text17:'未開放提示',text18:'未開放項目後的文字',field19:'型錄前往頁面',text20:'型錄連結文字',text21:'搜尋按鈕名稱'}],
 ],
 'view-components-SiteFooter':[
  ['網站地圖與隱私權入口',{text1:'網站地圖按鈕文字',field2:'隱私權前往頁面',text3:'隱私權連結文字'}],['數位展板與社群連結',{field4:'數位展板前往頁面',field5:'數位展板圖示',field7:'YouTube 前往頁面',field8:'YouTube 圖示'}],
  ['版權與品牌標誌',{text10:'版權文字第一段',text11:'公司名稱',text12:'版權文字最後一段',field13:'品牌標誌圖片',field14:'圖片說明'}],
 ],
}
const fields=new Map()
for(const [id,groups]of [...Object.entries(copyGroups).map(([id,g])=>[view(id),g]),...Object.entries(componentCopyGroups)])for(const[name,items]of groups)for(const[key,label]of Object.entries(items))fields.set(id+':copy.'+key,{name,label,singleLine:!/(介紹|說明|文字第一段|文字第二段|連結前|連結後|結語)/.test(label)})
export const positionField=(id,path)=>fields.get(id+':'+path)

const section=(name,hint,kind='text',anchor='',image)=>({name,hint,kind,anchor,image})
const commonHero=['site-visuals','images.asset_7692def0']
export const pagePositions={
 home:{hero:['view-components-home-HomeHero','slides.0.image'],sections:[section('首頁輪播圖片','首頁圖片、標題與連結','hero','hero-title'),section('品牌系列','首頁系列卡片與區塊介紹','cards','kitchen-series'),section('設計風格圖片','風格圖示、廚房圖片與連結','cards','home-styles'),section('廚房產品','品牌產品圖片與介紹','cards','services-heading'),section('集團品牌標誌','品牌標誌與前往頁面','logos','brand-logos'),section('設計案例','首頁輪播案例與更多按鈕','cards','gallery-heading'),section('品牌承諾','品牌介紹、影片封面與連結','video','brand-promise',['site-visuals','images.asset_10b5a86c']),section('全台門市據點','門市地圖、聯絡資料與查詢','map','contact')]},
 series:{hero:['data-kitchenSeries','KITCHEN_SERIES_PAGES.0.heroSlides'],sections:[section('系列內頁','選擇系列，修改介紹、圖片與組合','cards'),{...section('首頁與選單系列卡片','系列名稱、封面與前往頁面','cards'),href:'/#kitchen-series',previewPage:'/#kitchen-series'}]},
 inspiration:{sections:[]},
 knowledge:{hero:commonHero,sections:[section('主視覺標題','列表最上方的大標題','hero','kitchen-guide-page-title'),section('文章管理','文章封面、摘要與內文','cards','kitchen-guide-heading'),section('系統櫃文章返回按鈕','專題最上方的返回連結','article'),section('系統櫃材質重點','系統櫃文章的第一個段落','article'),section('系統櫃板材比較','材質比較表與手機提示','table'),section('系統櫃挑選步驟','文章中的步驟與推薦連結','steps'),section('系統櫃推薦案例','文章中的推薦案例與圖片','cards'),section('系統櫃文章結語','文末介紹與型錄連結','article'),section('文章底部返回按鈕','所有一般知識文章的返回連結','article')]},
 'series-catalogue':{hero:commonHero,sections:[section('頁面最上方','型錄頁最上方的大標題','hero','catalogue-page-title'),section('型錄封面與下載','系列型錄、預覽與下載按鈕','catalogue','catalogue-list-title')]},
 ...Object.fromEntries(['sakura','svago','teka'].map(brand=>['products-'+brand,{hero:['data-productBrands','PRODUCT_BRANDS.'+brand+'.image'],sections:[section('品牌介紹','品牌名稱、介紹文字與圖片','cards'),section('商品顯示與排序','選擇商品，調整顯示與順序','products')]}])),
 'product-catalogue':{hero:commonHero,sections:[section('頁面最上方','商品型錄頁最上方的大標題','hero','product-catalogue-title'),section('型錄封面與下載','型錄封面、預覽與下載按鈕','catalogue','product-catalogue-list-title'),section('清潔與保養問答','依商品分類的保養問題與圖文','faq','product-care-title')]},
 stores:{hero:commonHero,sections:[section('主視覺標題','門市列表最上方的大標題','hero','gallery-page-title'),section('地區篩選列','區域與縣市的篩選名稱','filter','gallery-filter-title'),section('門市管理','選擇門市，修改資料與案例','stores','gallery-filter-title'),section('搜尋結果提示','篩選後的門市筆數說明','results','gallery-filter-title'),section('無符合門市提示','沒有符合條件門市時的訊息','empty','gallery-filter-title'),section('區域與縣市','門市篩選的縣市分類','map','gallery-filter-title'),section('門市內頁預約按鈕','每個門市案例內頁的預約入口','article'),section('門市內頁規格與資訊','規格、聯絡資訊與地圖按鈕','stores'),section('門市內頁上一篇與下一篇','內頁下方的案例切換','article'),section('門市內頁顧客評論','內頁顧客留言區標題','comments')]},
 service:{hero:commonHero,sections:[section('主視覺標題','頁面最上方的大標題','hero','service-page-title'),section('服務流程與介紹','服務介紹與每一步的內容','steps','service-intro-title'),section('服務介紹影片','服務影片、封面與圖片說明','video','', ['site-visuals','serviceVideoCover']),section('服務指南問答','頁面下方的常見問題','faq')]},
 news:{hero:commonHero,sections:[section('主視覺標題','消息總覽最上方的大標題','hero','news-page-title'),section('全部消息列表','消息列表的輔助閱讀名稱','cards','news-list-title'),section('消息分類選單','列表旁的消息分類與連結','navigation','news-tags-title'),section('最近文章推薦','列表旁的最近文章標題','cards','sidebar-recent-title')]},
 ...Object.fromEntries(['latest','activities','video'].map((category,i)=>['news-'+category,{hero:commonHero,sections:[section('主視覺標題','列表最上方的大標題','hero'),section(['消息管理','活動管理','影音管理'][i],'封面、標題、日期與完整內文','cards'),section('文章最上方與返回導覽','所有同類內頁的標題與返回連結','article'),...(category==='latest'?[section('文章報名圖片提示','報名圖片的語音朗讀說明','article')]:[]),section('文章旁的分類選單','文章旁的分類連結文字','navigation')]}])),
 about:{hero:'/section-5/brand-pavilion/pavilion-taichung.jpg',sections:[section('品牌歷程','年份、沿革照片與品牌故事','timeline','about-services-title'),section('品牌承諾','介紹內容與情境圖片','cards','about-values-title'),section('專屬品牌識別','品牌銘板與識別圖片','logos','about-identity-title')]},
 advantage:{hero:'/section-5/brand-advantage/banner.jpg',sections:[section('家庭情境','家庭情境照片、標題與介紹','cards','brand-family-title'),section('品牌優勢','優勢內容與對應圖片','cards'),section('品牌優勢問答','頁面下方的品牌常見問題','faq','brand-advantage-faq-title')]},
 pavilions:{hero:'/section-5/brand-pavilion/banner.jpg',sections:[section('品牌館影片','頁面最上方的品牌影片','video','pavilion-hero-title'),section('品牌館空間介紹','空間介紹與左右兩張照片','cards','pavilion-fundamentals-title'),section('品牌館地址與時間','選擇館別，修改照片與聯絡資訊','stores','pavilion-gallery-title'),section('參觀注意事項','頁面下方的注意事項','article','pavilion-styles-title')]},
 franchise:{hero:[view('franchising-intro'),'copy.field1'],sections:[section('頁面最上方','加盟介紹、門市大圖與申請入口','hero','franchise-page-title'),section('加盟夥伴真實分享','加盟故事、影片與夥伴分享','video','franchise-story-title'),section('品牌成果圖片','循環展示的品牌與活動照片','cards'),section('專業品牌實力','加盟優勢的介紹與圖文','cards','franchise-advantage-title'),section('加盟邀請','邀請文案與加盟按鈕','text','franchise-conversion-title',['site-visuals','images.asset_b3dcb152']),section('品牌信賴與行銷','行銷介紹與品牌案例','cards','franchise-marketing-title'),section('加盟流程與辦法','七步驟流程圖與圖片說明','steps','franchise-process-title'),section('加盟資格與條件','資格條件與申請準備','text'),section('總部支援','總部提供的支援與申請按鈕','cards'),section('加盟常見問題','加盟問答內容','faq','franchise-faq-title'),section('加盟資料下載','問答旁的型錄封面與下載連結','catalogue','franchise-faq-title'),section('最新加盟資訊','最新加盟消息的更多入口','cards','franchise-news-title')]},
 'franchise-form':{hero:['site-visuals','images.asset_82b9dd3e'],sections:[section('申請表單上方','標題、填寫說明與下載按鈕','form','franchise-application-title')]},
 'franchise-download':{hero:[view('franchising-download'),'copy.field1'],sections:[section('頁面最上方','下載頁最上方的圖片與標題','hero','franchise-download-title'),section('加盟簡介與檔案','檔案介紹、大小與下載連結','catalogue','franchise-document-title'),section('型錄預覽圖片','線上預覽時的逐頁圖片','catalogue'),section('型錄載入提示','檔案載入或失敗時的說明','download'),section('頁面底部返回按鈕','回到加盟介紹的按鈕','article')]},
 builders:{hero:[view('builders-index'),'copy.field6'],sections:[section('頁面最上方','主標題、預約按鈕與廚房大圖','hero','builders-title'),section('廚房品牌介紹','品牌介紹與即將推出文字','cards','builders-team-title',['data-builders','builderProjectCards.0.image']),section('建商實力','智能整合與建商實力圖文','cards','builders-capability-title'),section('三大服務','頁面中段的三項服務','cards','', '/section-6/builders/proposal-20261002/dedicated-services.webp'),section('售後服務','iCare 服務說明圖片','cards','builders-lifetime-title'),section('合作夥伴','合作夥伴品牌標誌','logos'),section('聯繫與參觀預約','品牌館照片、地址與預約說明','form','appointment')]},
 'builder-series':{hero:[view('builders-sakura-kitchen'),'copy.field1'],sections:[section('頁面最上方','主圖片、品牌標誌與介紹','hero','sakura-kitchen-title'),section('品牌承諾入口','主圖片下方的介紹入口','cards','brand-advantage'),section('品牌優勢','品牌優勢介紹與圖片','cards','sakura-kitchen-advantage-title'),section('品牌系列','系列圖片、介紹與預約按鈕','cards','sakura-kitchen-series-title')]},
 'builder-catalogues':{hero:commonHero,sections:[section('頁面最上方','建商型錄頁最上方的大標題','hero','builder-catalogue-title'),section('型錄封面與下載','型錄卡片、封面與下載按鈕','catalogue','builder-catalogue-list-title')]},
 menu:{sections:[section('左側主選單','桌機官網左側分類與連結','navigation'),section('右側主選單','桌機官網右側分類與連結','navigation'),section('展開選單中的系列文字','展開品牌系列選單後的標題','navigation'),section('展開選單中的型錄入口','展開產品選單後的型錄按鈕','navigation'),section('桌機品牌標誌','桌機導覽中央的品牌標誌','logos'),section('手機品牌標誌','手機頁首的品牌標誌','logos'),section('手機選單文字','手機選單的分類與提示','navigation')]},
 footer:{sections:[section('網站地圖與隱私權入口','頁尾網站地圖與隱私權連結','footer'),section('數位展板與社群連結','頁尾右側的外部連結與圖示','footer'),section('版權與品牌標誌','頁尾底部版權與品牌標誌','footer')]},
 visuals:{sections:[section('共用主視覺背景','多個列表頁使用的背景圖片','hero'),section('加盟與建商背景','加盟與建商頁的裝飾背景','cards'),section('品牌與服務背景','品牌介紹、服務與知識頁背景','cards'),section('首頁品牌影片','首頁品牌承諾的影片與封面','video'),section('加盟夥伴影片','加盟頁分享影片','video'),section('品牌館影片','集團品牌館的影片','video'),section('服務介紹影片','服務流程的影片與封面','video')]},
 privacy:{sections:[section('頁面標題與修訂日期','隱私權頁的標題與修訂資訊','article'),section('隱私權條款','條款編號與各段完整內容','article')]},
}

const dataGroups={
 'data-kitchenSeries':{KITCHEN_SERIES_PAGES:'系列內頁'},'data-kitchenStyles':{KITCHEN_STYLES:'首頁與選單系列卡片'},
 'data-aboutUs':{brandHistory:'品牌歷程',brandValues:'品牌承諾',brandIdentities:'專屬品牌識別'},
 'data-brandAdvantage':{brandFamilies:'家庭情境',brandBenefits:'品牌優勢',brandAdvantageFaqGroups:'品牌優勢問答'},
 'data-service':{serviceSteps:'服務流程與介紹',faqGroups:'服務指南問答'},
 'data-brandPavilions':{brandPavilions:'品牌館地址與時間',pavilionNotice:'參觀注意事項'},
 'data-franchise':{FRANCHISE_FORM_URL:'頁面最上方',FRANCHISE_OFFICIAL_FORM_URL:'頁面最上方',FRANCHISE_BROCHURE_URL:'加盟簡介與檔案',franchiseAdvantages:'專業品牌實力',franchiseTestimonials:'加盟夥伴真實分享',franchiseMarketingStories:'品牌信賴與行銷',franchiseQualifications:'加盟資格與條件',franchiseSupportHighlights:'總部支援',franchiseFaqItems:'加盟常見問題'},
 'data-builders':{BUILDER_APPOINTMENT_HASH:'頁面最上方',builderPartners:'合作夥伴'},
 'data-storeCases':{storeCases:'門市管理',regionCities:'區域與縣市'},
 'data-productCatalogues':{PRODUCT_CARE_CATEGORIES:'清潔與保養問答'},
 'data-kitchenSystemCabinet':{systemCabinetImportance:'系統櫃材質重點',systemCabinetMaterials:'系統櫃板材比較',systemCabinetSelectionSteps:'系統櫃挑選步驟',systemCabinetCaseStudies:'系統櫃推薦案例'},
}
export function positionGroup(page,id,path){
 if(page==='home'||page==='inspiration')return
 if(path==='cmsSettings'||path==='seo')return
 if(id==='site-visuals'){
  if(page==='service')return '服務介紹影片'
  if(page==='pavilions')return '品牌館影片'
  if(page==='franchise')return '加盟夥伴真實分享'
  if(page==='visuals')return path.startsWith('images.')?(/asset_(?:7a7fece6|39582b0b|18ed1982|52e702e4|d0922f9d|82b9dd3e|b3dcb152|1795db00|38bb39f2)$/.test(path)?'加盟與建商背景':path.endsWith('asset_7692def0')?'共用主視覺背景':path.endsWith('asset_10b5a86c')?'首頁品牌影片':'品牌與服務背景'):({brandVideoId:'首頁品牌影片',brandVideoSrc:'首頁品牌影片',franchiseVideoId:'加盟夥伴影片',pavilionVideoId:'品牌館影片',serviceVideoSrc:'服務介紹影片',serviceVideoCover:'服務介紹影片'})[path]
 }
 if(page==='builders'&&id==='data-brandPavilions')return '聯繫與參觀預約'
 if(page==='franchise'&&path==='FRANCHISE_BROCHURE_URL')return '加盟資料下載'
 if(id==='knowledge-articles')return '文章管理'
 if(id==='news-articles')return page==='news-latest'?'消息管理':page==='news-activities'?'活動管理':'影音管理'
 if(id.startsWith('catalog-'))return '商品顯示與排序'
 if(path==='metaLabels')return '門市內頁規格與資訊'
 if(path==='newsCategories')return '消息分類選單'
 if(page==='privacy'&&['sections','numbers'].includes(path))return '隱私權條款'
 if(path==='sitemapGroups')return '網站地圖與隱私權入口'
 if(page==='builder-catalogues'&&path==='catalogues')return '型錄封面與下載'
 if(page==='franchise-download'&&path==='brochurePages')return '型錄預覽圖片'
 if(id===view('knowledge-design-systemcabinet')&&['designStyleLinks','kitchenSeriesLinks'].includes(path))return '系統櫃挑選步驟'
 return positionField(id,path)?.name||dataGroups[id]?.[path]
}
export function decoratePosition(page,block){
 const sections=pagePositions[page]?.sections||[],position=sections.find(s=>s.name===block.name)
 return position?{...position,...block,...(position.href?{href:position.href}:{}),hint:position.hint,kind:position.kind,anchor:position.anchor,image:position.image,positionIndex:sections.indexOf(position)+1,positionTotal:sections.length}:block
}
export function positionImage(reference,bodies){
 return Array.isArray(reference)?reference[1].split('.').reduce((value,key)=>value?.[key],bodies[reference[0]]):reference||''
}
