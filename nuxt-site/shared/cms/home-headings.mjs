import {headingLabels} from './heading-labels.mjs'

export const HOME_PROJECT_ID = 'view-components-home-HomeProject'
export const HOME_SERVICES_ID = 'view-components-home-HomeServices'
export const HOME_PROMISE_ID = 'view-components-home-HomeWhatWeDo'

const projectDefaults = {
  englishLabel: 'BRAND SERIES',
  englishLead: 'Explore Our',
  englishTitleFirst: 'Creative Projects',
  englishTitleSecond: 'That Define Our Style',
}
const servicesDefaults = {
  englishLabel: 'KITCHEN PRODUCTS',
  englishLead: 'Explore Our',
  englishTitleFirst: 'Smart Appliances',
  englishTitleSecond: 'Designed For Better Living',
}

export function homeChineseTitle(id, copy = {}) {
  if (copy.chineseTitle !== undefined) return copy.chineseTitle
  if (id === HOME_PROMISE_ID) return '品牌承諾'
  if (typeof copy.text1 === 'string' && typeof copy.text2 === 'string') return copy.text1 + copy.text2
  return id === HOME_PROJECT_ID ? '品牌系列' : '廚房產品'
}

export function homeProjectHeading(copy = {}) {
  return {
    englishLabel: copy.englishLabel ?? projectDefaults.englishLabel,
    englishLead: copy.englishLead ?? projectDefaults.englishLead,
    chineseTitle: homeChineseTitle(HOME_PROJECT_ID, copy),
    englishTitleFirst: copy.englishTitleFirst ?? projectDefaults.englishTitleFirst,
    englishTitleSecond: copy.englishTitleSecond ?? projectDefaults.englishTitleSecond,
  }
}

export function homeServicesHeading(copy = {}) {
  return {
    englishLabel: copy.englishLabel ?? servicesDefaults.englishLabel,
    englishLead: copy.englishLead ?? servicesDefaults.englishLead,
    chineseTitle: homeChineseTitle(HOME_SERVICES_ID, copy),
    englishTitleFirst: copy.englishTitleFirst ?? servicesDefaults.englishTitleFirst,
    englishTitleSecond: copy.englishTitleSecond ?? servicesDefaults.englishTitleSecond,
  }
}

export function homeHeadingSchema(id, schema) {
  if (id === HOME_PROMISE_ID) {
    const copy = schema.fields.copy
    const fields = Object.fromEntries(Object.entries(copy.fields).flatMap(([key, field]) =>
      key === 'text3' ? [[key, field], ['chineseTitle', {type:'string',label:headingLabels.chineseTitle,singleLine:true}]] : [[key, field]],
    ))
    return {...schema, fields:{...schema.fields, copy:{...copy, fields}}}
  }
  if (id !== HOME_PROJECT_ID && id !== HOME_SERVICES_ID) return schema
  const copy = schema.fields.copy
  const fields = Object.fromEntries(Object.entries(headingLabels).map(([key,label]) => [key, { type: 'string', label, singleLine:true }]))
  // Archived versions still contain the two original title strings.
  return { ...schema, fields: { ...schema.fields, copy: { ...copy, fields: { ...fields, ...copy.fields } } } }
}

export function effectiveHomeHeadingBody(id, body) {
  if (id === HOME_PROMISE_ID && body?.copy) return {...body,copy:{...body.copy,chineseTitle:homeChineseTitle(id,body.copy)}}
  if (!body?.copy || (id !== HOME_PROJECT_ID && id !== HOME_SERVICES_ID)) return body
  const heading = id === HOME_PROJECT_ID ? homeProjectHeading(body.copy) : homeServicesHeading(body.copy)
  const { text1, text2, ...copy } = body.copy
  return { ...body, copy: { ...copy, ...heading } }
}
