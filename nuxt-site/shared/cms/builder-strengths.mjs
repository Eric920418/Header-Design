export const builderStrengthsDocument = 'view-pages-builders-index'

export const builderStrengthsFields = {
  strengthsLabel: { label: '區塊英文標籤', fallback: 'OUR STRENGTHS' },
  strengthsChineseTitle: { label: '區塊中文主標題', fallback: '智能整合，打造建築新價值' },
  strengthsEnglishTitleFirst: { label: '區塊英文主標題（第一段）', fallback: 'Smart Solutions For' },
  strengthsEnglishTitleSecond: { label: '區塊英文主標題（第二段）', fallback: 'Better Living' },
  strengthsIntro: { label: '介紹文字', fallback: 'SAKURA深耕台灣居家生活\n透過「HOME IN O.N.E」全方位整合\n將AI智能串聯「產品、生產與售後服務」\n提供更精準、高效的空間解決方案' },
}

export const isBuilderStrengthsCopy = path => path.startsWith('copy.') && Object.hasOwn(builderStrengthsFields, path.slice(5))

export function builderStrengthsCopy(copy = {}) {
  return Object.fromEntries(Object.entries(builderStrengthsFields).map(([key, { fallback }]) => [
    key, copy[key]?.trim() || fallback,
  ]))
}

export function builderStrengthsSchema(id, schema) {
  if (id !== builderStrengthsDocument) return schema
  const copy = schema.fields.copy
  const fields = Object.fromEntries(Object.entries(builderStrengthsFields).map(([key, { label }]) => [
    key, { type: 'string', label, singleLine: key !== 'strengthsIntro' },
  ]))
  return { ...schema, fields: { ...schema.fields, copy: { ...copy, fields: { ...copy.fields, ...fields } } } }
}

export function builderStrengthImageAlt(index) {
  if (index === 0) return '建案搭配現代風、輕奢風及簡約風廚房設計模組'
  if (index === 1) return 'AI 智能廚衛工廠：人員監控產線生產率與即時數據'
  return '智能案件管理平台串接需求確認、合作洽談、簽約、下單、製作、安裝、驗收及售後服務'
}
