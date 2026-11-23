export const productCatalogueDocument = 'view-pages-catalogues-catalog'
export const seriesCatalogueDocument = 'view-pages-catalogues-kitchenware-catalog'

export function cataloguePreviewHref(url) {
  return /^\/media\/[a-f0-9-]{36}$/i.test(url) ? url + '?preview=1' : url
}

export const productCareFields = {
  careEyebrow: { label: '選購指南英文標籤', fallback: 'Popular Queries' },
  careChineseTitle: { label: '選購指南中文標題', fallback: '廚房選購指南' },
  careEnglishStart: { label: '英文標題第一段', fallback: 'Clear' },
  careEnglishAccent: { label: '英文標題第二段（金色）', fallback: 'Answers' },
  careEnglishMiddle: { label: '英文標題第三段', fallback: 'To Your' },
  careEnglishEnd: { label: '英文標題第四段（金色）', fallback: 'Questions' },
}
export const productCatalogueFields = {
  ...productCareFields,
  careFallback: { label: '圖文區預設說明', fallback: '查看本題的產品保養重點與使用注意事項。', help: '問答沒有介紹、說明、步驟或小提醒時，顯示在右側圖片下方。' },
  kitchenwareTitle: { label: '廚房配備型錄的顯示名稱', fallback: '櫻花整廚廚房配備型錄', help: '顯示在廚房商品型錄頁的廚房配備卡片封面下方。' },
}

export function productCatalogueText(copy, key) {
  return copy?.[key]?.trim() || productCatalogueFields[key].fallback
}

export function productCareDescription(question, copy) {
  return question?.intro || question?.details?.[0]?.body || question?.steps?.[0] || question?.tip || productCatalogueText(copy, 'careFallback')
}

export function productCatalogueTitle(item, copy) {
  return item.id === 'kitchenware-2026' ? productCatalogueText(copy, 'kitchenwareTitle') : item.title
}

export function productCatalogueSchema(id, schema) {
  if (id !== productCatalogueDocument) return schema
  const copy = schema.fields.copy
  const fields = Object.fromEntries(Object.entries(productCatalogueFields).map(([key, { label, help }]) => [
    key, { type: 'string', label, singleLine: key !== 'careFallback', help: help ? help + '留空時沿用原文。' : '留空時沿用原文。' },
  ]))
  return { ...schema, fields: { ...schema.fields, copy: { ...copy, fields: { ...copy.fields, ...fields } } } }
}
