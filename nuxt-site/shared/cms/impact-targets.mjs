import { resourceGuide } from './presentation.mjs'
import { HOME_HERO_ID, heroSeriesTitle } from './hero-media.mjs'

const target = (label, href) => ({ label, href })
const homePromise = target('首頁 → 品牌承諾', '/#brand-promise')
const serviceVideo = target('服務流程 → 品牌影片', '/service-process')
const pavilion = target('集團品牌館 → 主視覺', '/about/exhibition')
const franchise = target('加盟介紹', '/franchising/intro')
const builders = target('建商專區首頁', '/builders')
const visuals = {
 brandVideoSrc: [homePromise],
 serviceVideoSrc: [serviceVideo],
 serviceVideoCover: [serviceVideo],
 pavilionVideoId: [pavilion],
 franchiseVideoId: [target('加盟介紹 → 加盟夥伴影片', '/franchising/intro#franchise-story-title')],
 brandVideoId: [],
 'images.asset_10b5a86c': [homePromise],
 'images.asset_7692def0': [
  target('優惠消息、案例、知識、型錄及廚電頁 → 共用主視覺背景', '/news'),
 ],
 'images.asset_7a7fece6': [franchise, builders],
 'images.asset_39582b0b': [franchise, builders],
 'images.asset_18ed1982': [],
 'images.asset_52e702e4': [franchise],
 'images.asset_d0922f9d': [franchise, builders],
 'images.asset_82b9dd3e': [franchise, target('加盟申請', '/franchising/form'), target('加盟資料下載', '/franchising/download')],
 'images.asset_38bb39f2': [franchise],
 'images.asset_b3dcb152': [franchise],
 'images.asset_1795db00': [franchise],
 'images.asset_98d304fd': [target('一般廚房知識文章 → 頁首背景', '/knowledge/design/kitchen-outlet-planning')],
 'images.asset_44761f00': [target('服務流程 → 頁首背景', '/service-process'), target('最新消息內頁 → 頁首背景', '/news/latest')],
 'images.asset_9b0c0f62': [target('所有官網頁面 → 頁尾背景', '/#footer-navigation')],
 'images.asset_73c853de': [target('首頁 → 廚房產品背景', '/#services-heading')],
 'images.asset_809f4bbe': [target('品牌優勢 → 頁首背景', '/about/advantage')],
 'images.asset_daa09d8d': [pavilion],
}

export function fieldImpacts({ documentId, path = '', category, slug, rowId, blockHref }, context = {}, previous, next) {
 const targets = resourceGuide(documentId)?.impacts || []
 const [key, index, property] = path.split('.')
 if (documentId === HOME_HERO_ID && (!path || /^slides(?:\.\d+(?:\.(?:title|route))?)?$/.test(path))) {
  const pages = context.heroTitlePages
  if (previous && next && pages) {
   return [...targets, ...pages.filter(page=>
    (heroSeriesTitle(previous.slides,page.href)||page.fallbackTitle)!==(heroSeriesTitle(next.slides,page.href)||page.fallbackTitle),
   ).map(page=>target(page.title+' → 主視覺預設標題',page.href))]
  }
  if (!pages || pages.length) return [...targets,target('對應品牌系列內頁 → 主視覺預設標題（適用於沒有專屬標題的圖片）',pages?.[0]?.href||'/home-style/aikitchen')]
 }
 if (documentId === 'site-visuals') {
  if (!path) return Object.values(visuals).flat()
  return visuals[path] ?? targets
 }
 if (documentId === 'data-kitchenStyles' && path.startsWith('KITCHEN_STYLES.')) {
  if (property === 'desc') return targets.slice(0,1)
  if (property === 'image') return [targets[0],targets[2]]
  if (property === 'en' || property === 'available') return targets.slice(0,3)
 }
 if (documentId === 'data-kitchenSeries' && key === 'KITCHEN_SERIES_PAGES' && slug)
  return [target('品牌系列 → '+slug,'/home-style/'+encodeURIComponent(slug))]
 if (documentId === 'data-brandPavilions' && key === 'pavilionNotice') return targets.slice(0,1)
 if (documentId === 'data-builders') {
  const projects=target('建商專區首頁 → 廚房品牌介紹圖文','/builders#builders-team-title')
  if (!path) return [projects,targets[1]]
  if (key === 'builderPartners') return []
  return key === 'BUILDER_APPOINTMENT_HASH' ? targets.slice(1) : [projects]
 }
 if (documentId === 'data-franchise' && path) {
  if (key === 'franchiseProcessSteps') return []
  if (key === 'FRANCHISE_BROCHURE_URL') return targets.slice(2)
  if (key === 'FRANCHISE_OFFICIAL_FORM_URL') return [target('加盟申請 → 送出失敗時的備用表單', '/franchising/form')]
  return targets.slice(0,1)
 }
 if (documentId === 'data-productCatalogues' && path) {
  if (key === 'PRODUCT_CARE_CATEGORIES') return [target('廚房商品型錄 → 清潔與保養問答', '/catalogues/catalog')]
  if (key === 'PRODUCT_CATALOGUES' && rowId && (
   !['sakura-kitchen-2026','kitchenware-2026'].includes(rowId) ||
   !['title','cover',undefined].includes(property) ||
   rowId==='kitchenware-2026'&&property==='title'
  )) return targets.slice(0,1)
  return [targets[0],target('三品牌商品列表與內頁 → 推薦型錄卡片', '/products/sakura/all#near-suction-catalogue-title')]
 }
 if (documentId === 'data-productBrands' && path && key === 'PRODUCT_BRANDS' && index) {
  const root='/products/'+index, brand=index.toUpperCase()
  const products=target(brand+' → 商品列表與內頁',root+'/all')
  if(property==='catalogueDestination')return [target(brand+' → 商品列表與內頁的型錄按鈕及卡片',root+'/all#near-suction-catalogue-title')]
  if(property==='image')return [target(brand+' → 品牌首頁',root)]
  return [target(brand+' → 品牌首頁',root),products]
 }
 if (documentId === 'news-articles' && category) {
  const list='/news/'+category, detail=slug&&target('文章內頁',list+'/'+encodeURIComponent(slug))
  if (property==='detail' && detail) return [detail]
  return targets.filter(i=>i.href==='/news'||i.href===list||i.href.startsWith('/franchising/')&&(!rowId||['franchise-seminar-2026','kaohsiung-brand-hall','franchise-expo-2025'].includes(rowId)))
 }
 if (documentId === 'knowledge-articles' && property === 'detail' && slug)
  return [target('廚房知識文章內頁','/knowledge/design/'+encodeURIComponent(slug))]
 if (documentId === 'data-storeCases') {
  if (key === 'regionCities' || property==='region' || property==='address') return targets.slice(0,1)
  if (/^storeCases\.\d+\.contact\.reservationUrl$/.test(path)) return []
  if (path.endsWith('.contact.lineUrl')) return targets.slice(1,2)
  if (property==='reviews' || property==='contact'||property==='meta'&&!/\.meta(?:\.(?:form|style))?$/.test(path))
   return slug?[target('該門市案例內頁','/gallery/'+encodeURIComponent(slug))]:targets.slice(1,2)
  if (['city','storeName'].includes(property)) return targets.slice(0,2)
  if (['title','article','images','meta'].includes(property)) return targets.slice(1)
  if (['reservationUrl','designer'].includes(property)) return targets.slice(1,2)
 }
 if (documentId === 'view-pages-knowledge-design-slug-' && key === 'copy' && index === 'moreDestination')
  return [target('系統櫃與指定知識文章 → 延伸文章按鈕','/knowledge/design/systemcabinet#knowledge-related-heading')]
 if (documentId === 'view-pages-gallery-slug-' && (!path || path==='copy.field1' || path==='copy.text2'))
  return [...targets,target('設計靈感案例內頁 → 到店預約','/design-inspiration')]
 if (blockHref && targets.length===1 && !targets[0].label.startsWith('所有官網頁面') && blockHref.split('#')[0]===targets[0].href.split('#')[0])
  return [{...targets[0],href:blockHref}]
 return targets
}
