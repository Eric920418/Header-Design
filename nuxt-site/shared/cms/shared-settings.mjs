// Presentation only: preserve original values, document paths, defaults and destinations.
const places={
 'home:品牌系列':'首頁品牌系列卡片上方','home:廚房產品':'首頁廚電品牌卡片上方','home:設計案例':'首頁案例輪播旁','home:全台門市據點':'首頁門市地圖上方','home:主視覺輪播':'首頁主視覺輪播','news:最新文章':'文章右側的最新文章清單',
 'inspiration:頁面共用設定':'設計靈感列表與案例內頁','knowledge:頁面共用設定':'廚房知識文章內頁','series-catalogue:型錄管理':'品牌系列型錄卡片','product-catalogue:型錄管理':'廚房商品型錄卡片','product-catalogue:清潔與保養問答':'清潔與保養分類上方','service:服務流程':'服務步驟上方',
 'store-cases:頁面共用設定':'門市案例內頁','news:頁面共用設定':'優惠消息總覽的文章右側','news-latest:頁面共用設定':'最新消息文章內頁','about:專屬品牌識別':'品牌標誌清單上方','advantage:家庭情境':'家庭情境圖片上方','pavilions:品牌館地址與時間':'品牌館照片下方的聯絡資訊','pavilions:參觀注意事項':'品牌館參觀注意事項上方',
 'franchise:加盟夥伴真實分享':'加盟夥伴分享影片','franchise:專業品牌實力':'加盟介紹的品牌實力圖文','franchise:品牌信賴':'加盟介紹的品牌信賴圖文','franchise:加盟資格與條件':'加盟流程下方的資格條件','franchise:總部支援':'加盟流程下方的總部支援','franchise:最新加盟資訊':'加盟介紹下方的消息卡片','franchise-download:型錄管理':'加盟型錄預覽與下載','franchise-download:區塊共用設定':'加盟下載頁的型錄簡介',
 'builders:智能整合':'建商智能整合圖文上方','builders:HOME IN ONE':'建商三項服務區','builders:品牌館資訊與預約':'建商品牌館資訊與預約區','builder-series:品牌系列':'建商品牌系列圖片上方','builder-catalogues:型錄管理':'建商型錄卡片','menu:左側主導覽':'桌機展開選單','footer:網站地圖與隱私權入口':'官網頁尾','visuals:共用主視覺背景':'消息、案例、知識與型錄頁首',
}
const specific={
 'view-pages-news-index:copy.text4':'文章右側最新文章清單的標題',
 'view-pages-gallery-slug-:copy.text2':'兩處到店預約按鈕共用的文字','view-pages-gallery-slug-:copy.text3':'案例右側規格表的標題','view-pages-gallery-slug-:copy.text4':'案例下方門市聯絡資訊的標題','view-pages-gallery-slug-:copy.text5':'門市資訊的 LINE 按鈕文字','view-pages-gallery-slug-:copy.text6':'門市資訊的 Google Map 按鈕文字','view-pages-gallery-slug-:copy.text9':'案例下方顧客評論區標題',
 'view-pages-franchising-download:copy.text5':'型錄簡介標題（第一行）','view-pages-franchising-download:copy.text6':'型錄簡介標題（第二行）','view-pages-franchising-download:copy.text10':'檔案資訊的格式欄位名稱','view-pages-franchising-download:copy.text11':'檔案資訊的格式文字','view-pages-franchising-download:copy.text12':'檔案資訊的頁數欄位名稱','view-pages-franchising-download:copy.text13':'檔案資訊的頁數文字','view-pages-franchising-download:copy.text14':'檔案資訊的大小欄位名稱','view-pages-franchising-download:copy.text15':'檔案資訊的大小文字','view-pages-franchising-download:copy.text16':'型錄簡介旁的線上預覽按鈕文字','view-pages-franchising-download:copy.text17':'型錄簡介旁的下載 PDF 按鈕文字','view-pages-franchising-download:copy.text18':'PDF 確認中顯示的提示文字','view-pages-franchising-download:copy.text19':'PDF 載入失敗顯示的標題','view-pages-franchising-download:copy.text20':'PDF 載入失敗的重試按鈕文字','view-pages-franchising-download:copy.text21':'型錄預覽圖片下方的頁碼前綴',
 'view-components-SiteFooter:copy.text1':'頁尾網站地圖展開按鈕文字','view-components-SiteFooter:copy.text3':'頁尾隱私權政策連結文字',
 'view-pages-franchising-intro:copy.text47':'加盟流程下方的資格條件標題','view-pages-franchising-intro:copy.text31':'品牌實力數字旁的裝飾文字',
}
const at=(body,path)=>String(path||'').split('.').reduce((v,k)=>v?.[k],body)
export function sharedFields(block){
 const candidates=(block?.fields||[]).filter(f=>f.schema.type!=='array'&&!(f.schema.type==='object'&&Object.values(f.schema.fields||{}).every(s=>s.type==='array'))&&!f.schema.advanced&&!f.schema.hidden&&!Object.hasOwn(f.schema,'fixed'))
 return (block?.fields?.some(f=>f.schema.type==='array')||/共用/.test(block?.name||''))&&!block?.secondary?candidates:[]
}
export function previewFieldRole(field){
 const label=field.schema?.sharedSetting?.sourceLabel||field.label||''
 if(field.schema?.format)return field.schema.format
 if(/英文標籤|英文小標/.test(label))return'eyebrow'
 if(/標題|品牌名稱/.test(label))return'heading'
 if(field.schema?.linkCaption||/按鈕|連結文字|返回文字/.test(label)&&!/介紹|說明|標題/.test(label))return'button'
 return'text'
}
function clarifiedLabel(field,place){
 const old=field.label||''
 if(specific[field.documentId+':'+field.path])return specific[field.documentId+':'+field.path]
 if(field.schema.destination||field.schema.linkCaption)return old
 if(/^區塊/.test(old))return place+'的'+old.replace(/^區塊/,'')
 if(/^主標題前置/.test(old))return place+'的'+old
 if(/^介紹文字|^段落標題|^影片名稱|^品牌名稱|^提示標題|^提示說明|^圖文區預設說明/.test(old))return place+'的'+old
 if(/^(?:預覽|下載)按鈕文字$/.test(old))return place+'的'+old
 return old
}
export function clarifySharedBlock(page,block){
 const candidates=sharedFields(block);if(!candidates.length)return block
 const place=places[block.id]||block.name
 const fields=block.fields.map(field=>{
  if(!candidates.includes(field)||field.schema.sharedSetting)return field
  const context=field.formGroup&&/^(?:inspiration|knowledge|store-cases|news-latest)$/.test(page)?field.formGroup:place
  const system=field.documentId==='view-pages-knowledge-design-systemcabinet'||field.documentId==='data-kitchenSystemCabinet'
  const hardware=page==='product-catalogue'&&field.path==='copy.kitchenwareTitle'
  const scope=hardware?'僅廚房配備型錄卡片使用':page==='footer'?'全站頁尾共用':page==='menu'?'全站導覽列共用':page==='visuals'?'使用此背景的所有頁面共用':system?'系統櫃專題的這個段落使用':page==='store-cases'?'所有門市案例內頁共用':page==='knowledge'?'一般廚房知識文章共用':page==='news-latest'?'最新消息文章內頁共用':'此區塊的所有項目共用'
  const location=page==='knowledge'&&system?'系統櫃文章 → '+context:page==='knowledge'?'廚房知識文章 → '+context:context
  const label=clarifiedLabel(field,context)
  const href=page==='visuals'&&field.path==='images.asset_7692def0'?'/news#news-page-title':field.documentId==='view-pages-builders-index'&&field.path==='copy.homeOneServicesImage'?'/builders#builder-dedicated-services':field.documentId==='view-pages-franchising-intro'&&field.path==='copy.text47'?'/franchising/intro#franchise-qualification-title':undefined
  const sharedSetting={href,sourceLabel:field.label,location,scope,retainSelection:system||page==='menu'||hardware,role:previewFieldRole(field)}
  const help=[field.schema.help,'官網位置：'+location+'。'+scope+'。'].filter(Boolean).join(' ')
  return {...field,label,searchTerms:(field.searchTerms||'')+' '+field.label,schema:{...field.schema,label,help,sharedSetting}}
 })
 return {...block,fields,sharedSettingsTitle:place+'的共用文字與按鈕'}
}
export function focusedSharedSetting(block,bodies,path='',documentId=''){
 const fields=(block?.fields||[]).filter(f=>f.schema.sharedSetting)
 const field=fields.find(f=>(!documentId||f.documentId===documentId)&&(path===f.path||path.startsWith(f.path+'.')))||(!path&&/共用/.test(block?.id||'')?fields[0]:undefined)
 if(!field)return
 let schema=field.schema
 const suffix=path.slice(field.path.length+1)
 if(path&&path!==field.path)for(const key of suffix.split('.'))schema=schema?.fields?.[key]||schema?.item
 if(!schema||schema.advanced||schema.imageReading)return
 const label=path&&path!==field.path?field.schema.sharedSetting.location+'的'+schema.label:field.label
 const inactive=field.documentId==='view-pages-gallery-slug-'&&path.startsWith('metaLabels.')&&!(bodies['data-storeCases']?.storeCases||[]).some(row=>row.meta?.[path.slice(11)])
 const note=inactive?'目前刊登的案例都沒有填寫這項規格，因此官網暫不顯示此列。右側顯示規格表所在位置；有案例填寫後，才會使用這個欄位名稱。':''
 return {...field.schema.sharedSetting,inactive,note,label,path:path||field.path,documentId:field.documentId,field,href:field.schema.sharedSetting.href||block.previewPage||block.href,value:at(bodies[field.documentId],path||field.path)}
}
