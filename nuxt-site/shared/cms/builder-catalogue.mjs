export const builderCatalogueDocument = 'view-pages-builders-catalogues'
export const builderCatalogueNoticeAnchor = 'builder-catalogue-notice'

export const builderCatalogueNoticeFields = {
  noticeFirst: { label: '說明第一段', fallback: '本專區型錄僅供建設公司、工程專案及設計師等大宗採購參考。' },
  noticeSecond: { label: '說明第二段', fallback: '若有個人家用需求，歡迎至櫻花整體廚房門市選購。' },
}

export const isBuilderCatalogueNotice = path =>
  path.startsWith('copy.') && Object.hasOwn(builderCatalogueNoticeFields, path.slice(5))

export function builderCatalogueNotice(copy, key) {
  return copy?.[key]?.trim() || builderCatalogueNoticeFields[key].fallback
}

export function builderCatalogueSchema(id, schema) {
  if (id !== builderCatalogueDocument) return schema
  const copy = schema.fields.copy
  const notices = Object.fromEntries(Object.entries(builderCatalogueNoticeFields).map(([key, { label }]) => [
    key, { type: 'string', label, help: '留空時沿用原有說明。' },
  ]))
  return { ...schema, fields: { ...schema.fields, copy: { ...copy, fields: { ...copy.fields, ...notices } } } }
}
