const labels = {
  breadcrumbHome: { fallback: '首頁', label: '首頁連結文字' },
  breadcrumbList: { fallback: '設計靈感', label: '設計靈感連結文字' },
  breadcrumbDetail: { fallback: '設計案例', label: '案例內頁目前位置文字' },
}

export function inspirationBreadcrumb(copy = {}) {
  return Object.fromEntries(Object.entries(labels).map(([key, { fallback }]) => [
    key, copy[key]?.trim() || fallback,
  ]))
}

export function inspirationBreadcrumbSchema(id, schema) {
  if (id !== 'view-pages-design-inspiration-index') return schema
  const copy = schema.fields.copy
  const fields = Object.fromEntries(Object.entries(labels).map(([key, { label, fallback }]) => [
    key, { type: 'string', label, singleLine: true, help: `留空會顯示「${fallback}」。` },
  ]))
  return { ...schema, fields: { ...schema.fields, copy: { ...copy, fields: { ...copy.fields, ...fields } } } }
}
