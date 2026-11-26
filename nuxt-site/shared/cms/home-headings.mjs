import {headingLabels} from './heading-labels.mjs'

export const HOME_PROJECT_ID = 'view-components-home-HomeProject'
export const HOME_SERVICES_ID = 'view-components-home-HomeServices'
export const HOME_GALLERY_ID = 'view-components-home-HomeGallery'
export const HOME_STORES_ID = 'view-components-home-HomeStoreLocation'

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

export const remainingHomeHeadings = {
  [HOME_GALLERY_ID]: {
    englishTitleFirst: {label:headingLabels.englishTitleFirst, value:'Kitchen'},
    englishTitleSecond: {label:headingLabels.englishTitleSecond, value:'Design'},
  },
  [HOME_STORES_ID]: {
    englishLead: {label:headingLabels.englishLead, value:'Explore Our'},
    englishTitleFirst: {label:headingLabels.englishTitleFirst, value:'Find Us '},
    englishTitleSecond: {label:headingLabels.englishTitleSecond, value:'Stores At'},
    englishTitleThird: {label:'區塊英文主標題（第三段）', value:'SAKURA KITCHEN'},
  },
}

export function homeRemainingHeading(id, copy = {}) {
  return Object.fromEntries(Object.entries(remainingHomeHeadings[id] || {}).map(([key, field]) => [key, copy[key] ?? field.value]))
}

export function homeHeadingSchema(id, schema) {
  if (remainingHomeHeadings[id]) {
    const copy = schema.fields.copy
    const added = Object.fromEntries(Object.entries(remainingHomeHeadings[id]).map(([key, field]) => [key, {type:'string', label:field.label, singleLine:true}]))
    const fields = {...copy.fields, ...added}
    const order = id === HOME_GALLERY_ID
      ? ['text2','text3','englishTitleFirst','englishTitleSecond']
      : ['text1','englishLead','text2','englishTitleFirst','englishTitleSecond','text3','englishTitleThird']
    return {...schema, fields:{...schema.fields, copy:{...copy, fields:{...Object.fromEntries(order.map(key=>[key,fields[key]])), ...fields}}}}
  }
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
  if (remainingHomeHeadings[id] && body?.copy) return {...body, copy:{...body.copy, ...homeRemainingHeading(id, body.copy)}}
  if (id === HOME_PROMISE_ID && body?.copy) return {...body,copy:{...body.copy,chineseTitle:homeChineseTitle(id,body.copy)}}
  if (!body?.copy || (id !== HOME_PROJECT_ID && id !== HOME_SERVICES_ID)) return body
  const heading = id === HOME_PROJECT_ID ? homeProjectHeading(body.copy) : homeServicesHeading(body.copy)
  const { text1, text2, ...copy } = body.copy
  return { ...body, copy: { ...copy, ...heading } }
}
