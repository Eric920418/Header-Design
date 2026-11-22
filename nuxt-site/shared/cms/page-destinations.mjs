const destination = help => ({ type: 'string', format: 'url', label: '前往頁面', autoDestination: true, help })
const addFields = (object, fields) => ({ ...object, fields: { ...object.fields, ...fields } })

const homeCards = {
  'view-components-home-HomeStyleMarquee': ['styles', '沿用既有連結時，依中文風格名稱前往設計靈感的篩選結果。'],
  'view-components-home-HomeServices': ['services', '沿用既有連結時，依品牌名稱前往對應的廚房產品頁。'],
}
const pageButtons = {
  'view-pages-about-exhibition': { bookingDestination: destination('品牌館的「立即預約」按鈕。') },
  'view-pages-gallery-slug-': { storeBookingDestination: destination('門市資訊右側的「到店預約」按鈕。') },
  'view-pages-knowledge-design-slug-': { moreDestination: destination('有延伸文章圖文區的知識文章，共用「更多廚房知識」按鈕。') },
  'view-pages-franchising-intro': { supportDestination: { ...destination('選擇「沿用既有連結」會繼續使用加盟介紹的申請連結。'), destinationAfter: 'view-pages-franchising-intro:copy.text46' } },
}
const seriesButtons = {
  type: 'object',
  label: '系列內頁按鈕',
  optional: true,
  fields: {
    catalogue: destination('主視覺的「品牌系列型錄」按鈕。'),
    explore: destination('主視覺的「探索設計案例」按鈕。'),
    booking: destination('板材與顏色下方的「立即預約」按鈕。'),
    moreCases: destination('尚無推薦案例時的「探索設計靈感」按鈕。'),
  },
}

// Extend validation in memory so existing drafts and published versions retain their current links.
export function pageDestinationSchema(id, schema) {
  if (Object.hasOwn(homeCards, id)) {
    const [key, help] = homeCards[id]
    const rows = schema.fields[key]
    return addFields(schema, { [key]: { ...rows, item: addFields(rows.item, { route: destination(help) }) } })
  }
  if (Object.hasOwn(pageButtons, id)) return addFields(schema, { copy: addFields(schema.fields.copy, pageButtons[id]) })
  if (id === 'data-kitchenSeries') {
    const pages = schema.fields.KITCHEN_SERIES_PAGES
    return addFields(schema, { KITCHEN_SERIES_PAGES: { ...pages, item: addFields(pages.item, { buttonDestinations: seriesButtons }) } })
  }
  if (id === 'data-productBrands') {
    const brands = schema.fields.PRODUCT_BRANDS
    const fields = Object.fromEntries(Object.entries(brands.fields).map(([brand, field]) => [
      brand, addFields(field, { catalogueDestination: destination('本品牌商品列表與內頁的型錄按鈕和型錄卡片共用。') }),
    ]))
    return addFields(schema, { PRODUCT_BRANDS: addFields(brands, fields) })
  }
  return schema
}
