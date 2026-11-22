export const builderHomeOneDocument = 'view-pages-builders-index'

export const builderHomeOneImages = [
  {
    imageKey: 'homeOneBanner',
    altKey: 'homeOneBannerAlt',
    label: 'HOME IN ONE 橫幅',
    anchor: 'builders-home-one',
    originalImage: '/section-6/builders/proposal-20261002/home-in-one.webp',
    originalAlt: 'HOME IN O.N.E：ONE-STOP 一站式服務、NUMEROUS 多樣產品選擇、EFFICIENT 輕鬆擁有',
  },
  {
    imageKey: 'homeOneServicesImage',
    altKey: 'homeOneServicesAlt',
    label: '三項服務合圖',
    anchor: 'builder-dedicated-services',
    originalImage: '/section-6/builders/proposal-20261002/dedicated-services.webp',
    originalAlt: '專業銷講選材、專屬監工規劃與專人驗收',
  },
]

const fields = Object.fromEntries(builderHomeOneImages.flatMap(image => [
  ['copy.' + image.imageKey, { label: image.label, format: 'media', image }],
  ['copy.' + image.altKey, { label: image.label + '朗讀文字', image }],
]))

export const builderHomeOneField = path => Object.hasOwn(fields, path) ? fields[path] : undefined

export function builderHomeOneImage(copy, image) {
  const src = copy?.[image.imageKey] || image.originalImage
  return { src, alt: copy?.[image.altKey] ?? (src === image.originalImage ? image.originalAlt : image.label) }
}

export function builderHomeOneSchema(id, schema) {
  if (id !== builderHomeOneDocument) return schema
  const copy = schema.fields.copy
  const imageFields = Object.fromEntries(Object.entries(fields).map(([path, { label, format }]) => [
    path.slice(5), { type: 'string', label, ...(format ? { format } : { advanced: true, readingGroup: '圖片', imageReading: true }) },
  ]))
  return { ...schema, fields: { ...schema.fields, copy: { ...copy, fields: { ...copy.fields, ...imageFields } } } }
}
