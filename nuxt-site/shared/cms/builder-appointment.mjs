export const builderAppointmentDocument = 'view-pages-builders-index'

export const builderAppointmentHeadingFields = {
  appointmentEyebrow: { label: '主標題前置英文', fallback: 'Explore Our' },
  appointmentChineseTitle: { label: '區塊中文主標題', fallback: '櫻花集團品牌館' },
  appointmentEnglishTitleFirst: { label: '區塊英文主標題（第一段）', fallback: 'The Art Of' },
  appointmentEnglishTitleSecond: { label: '區塊英文主標題（第二段）', fallback: 'Kitchen Showrooms' },
}

export const isBuilderAppointmentHeading = path => path.startsWith('copy.') && Object.hasOwn(builderAppointmentHeadingFields, path.slice(5))
export const isBuilderAppointmentCopy = path => isBuilderAppointmentHeading(path) || /^copy\.text(?:33|3[89]|4[012])$/.test(path)

export function builderAppointmentHeadingValue(copy, key) {
  return copy?.[key]?.trim() || builderAppointmentHeadingFields[key].fallback
}

export function builderAppointmentHeading(copy) {
  const first = builderAppointmentHeadingValue(copy, 'appointmentEnglishTitleFirst')
  const second = builderAppointmentHeadingValue(copy, 'appointmentEnglishTitleSecond')
  const [firstText, firstAccent] = first.match(/^(.*\s)(\S+)$/)?.slice(1) || [first, '']
  const [secondAccent, secondText] = second.match(/^(\S+)(\s.*)$/)?.slice(1) || [second, '']
  return {
    eyebrow: builderAppointmentHeadingValue(copy, 'appointmentEyebrow'),
    chinese: builderAppointmentHeadingValue(copy, 'appointmentChineseTitle'),
    firstText, firstAccent, secondAccent, secondText,
  }
}

export function builderAppointmentSchema(id, schema) {
  if (id !== builderAppointmentDocument) return schema
  const copy = schema.fields.copy
  const headings = Object.entries(builderAppointmentHeadingFields).map(([key, { label }]) => [
    key, { type: 'string', label, singleLine: true },
  ])
  const fields = Object.fromEntries(Object.entries(copy.fields).flatMap(([key, value]) =>
    key === 'text33' ? [[key, value], ...headings] : [[key, value]],
  ))
  return { ...schema, fields: { ...schema.fields, copy: { ...copy, fields } } }
}
