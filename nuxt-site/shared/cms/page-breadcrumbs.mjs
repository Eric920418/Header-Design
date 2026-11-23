const inspirationLabels = {
  breadcrumbHome: { fallback: '首頁', label: '首頁連結文字' },
  breadcrumbList: { fallback: '設計靈感', label: '設計靈感連結文字' },
  breadcrumbDetail: { fallback: '設計案例', label: '案例內頁目前位置文字' },
}

const knowledgeLabels = {
  breadcrumbHome: inspirationLabels.breadcrumbHome,
  breadcrumbList: { fallback: '廚房裝修指南', label: '廚房裝修指南連結文字' },
}

const seriesCatalogueLabels = {
  breadcrumbHome: inspirationLabels.breadcrumbHome,
  breadcrumbList: { fallback: '品牌系列型錄', label: '型錄頁目前位置文字' },
}
const productCatalogueLabels = {
  breadcrumbHome: inspirationLabels.breadcrumbHome,
  breadcrumbParent: { fallback: 'SAKURA 廚電', label: 'SAKURA 廚電連結文字' },
  breadcrumbList: { fallback: '廚房商品型錄', label: '型錄頁目前位置文字' },
}

const latestNewsLabels = {
  breadcrumbHome: inspirationLabels.breadcrumbHome,
  breadcrumbParent: { fallback: '優惠消息', label: '優惠消息連結文字' },
  breadcrumbList: { fallback: '最新消息', label: '最新消息分類名稱' },
}
const franchiseDownloadLabels = {
  breadcrumbHome: inspirationLabels.breadcrumbHome,
  breadcrumbParent: { fallback: '我要加盟', label: '我要加盟連結文字' },
  breadcrumbList: { fallback: '加盟資料下載', label: '下載頁目前位置文字' },
}
const builderCatalogueLabels = {
  breadcrumbHome: inspirationLabels.breadcrumbHome,
  breadcrumbParent: { fallback: '建商專區', label: '建商專區連結文字' },
  breadcrumbList: { fallback: '建商專區型錄', label: '型錄頁目前位置文字' },
}

function breadcrumb(copy, labels) {
  return Object.fromEntries(Object.entries(labels).map(([key, { fallback }]) => [
    key, copy[key]?.trim() || fallback,
  ]))
}

export const inspirationBreadcrumb = (copy = {}) => breadcrumb(copy, inspirationLabels)
export const knowledgeBreadcrumb = (copy = {}) => breadcrumb(copy, knowledgeLabels)
export const seriesCatalogueBreadcrumb = (copy = {}) => breadcrumb(copy, seriesCatalogueLabels)
export const productCatalogueBreadcrumb = (copy = {}) => breadcrumb(copy, productCatalogueLabels)
export const latestNewsBreadcrumb = (copy = {}) => breadcrumb(copy, latestNewsLabels)
export const franchiseDownloadBreadcrumb = (copy = {}) => breadcrumb(copy, franchiseDownloadLabels)
export const builderCatalogueBreadcrumb = (copy = {}) => breadcrumb(copy, builderCatalogueLabels)

export function breadcrumbSchema(id, schema) {
  const labels = id === 'view-pages-design-inspiration-index' ? inspirationLabels
    : id === 'view-pages-knowledge-index' ? knowledgeLabels
    : id === 'view-pages-catalogues-kitchenware-catalog' ? seriesCatalogueLabels
    : id === 'view-pages-catalogues-catalog' ? productCatalogueLabels
    : id === 'view-pages-news-latest-index' ? latestNewsLabels
    : id === 'view-pages-franchising-download' ? franchiseDownloadLabels
    : id === 'view-pages-builders-catalogues' ? builderCatalogueLabels : null
  if (!labels) return schema
  const copy = schema.fields.copy
  const fields = Object.fromEntries(Object.entries(labels).map(([key, { label, fallback }]) => [
    key, { type: 'string', label, singleLine: true, help: `留空會顯示「${fallback}」。` },
  ]))
  return { ...schema, fields: { ...schema.fields, copy: { ...copy, fields: { ...copy.fields, ...fields } } } }
}
