export const seriesEditorSections = [
  { id: 'hero', name: '主視覺輪播', hint: '頁首大圖、輪播文字與按鈕', anchor: 'ai-kitchen-hero-title', fields: ['name', 'heroSlides', 'heroStories', 'source'], buttons: ['catalogue', 'explore'] },
  { id: 'intro', name: '探索廚房美學', hint: '主視覺下方的系列介紹', anchor: 'ai-kitchen-intro', fields: ['intro'], buttons: [] },
  { id: 'suites', name: '套系與特色', hint: '可切換的套系照片、特色與配備', anchor: 'series-suites', fields: ['suites'], buttons: [] },
  { id: 'finishes', name: '板材顏色選擇', hint: '門板色卡與立即預約按鈕', anchor: 'finish-heading', fields: ['finishes'], buttons: ['booking'] },
  { id: 'equipment', name: '廚房電器推薦', hint: '電器圖片、型號與連結', anchor: 'equipment-heading', fields: ['equipment'], buttons: [] },
  { id: 'cases', name: '風格廚房實例', hint: '案例圖片、介紹與連結', anchor: 'cases-heading', fields: ['cases'], buttons: ['moreCases'] },
]

export function seriesEditorSection(id) {
  return seriesEditorSections.find(section => section.id === id) || seriesEditorSections[0]
}

export function seriesEditorSchema(schema, id) {
  const section = seriesEditorSection(id)
  const fields = Object.fromEntries(Object.entries(schema.fields).filter(([key]) => section.fields.includes(key)))
  const buttons = schema.fields.buttonDestinations
  if (buttons && section.buttons.length) {
    fields.buttonDestinations = {
      ...buttons,
      label: '按鈕前往頁面',
      fields: Object.fromEntries(Object.entries(buttons.fields).filter(([key]) => section.buttons.includes(key))),
    }
  }
  return { ...schema, fields }
}

export function sectionForSeriesField(path) {
  const match = /^KITCHEN_SERIES_PAGES\.\d+\.([^.]+)(?:\.([^.]+))?/.exec(path)
  if (!match) return
  const [, key, button] = match
  return seriesEditorSections.find(section => section.fields.includes(key) || key === 'buttonDestinations' && section.buttons.includes(button))
}
