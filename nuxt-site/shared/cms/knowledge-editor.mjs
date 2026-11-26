export const knowledgeArticlePath = '/knowledge/design/systemcabinet'
export const knowledgeArticleSections = {
  '系統櫃文章返回按鈕': { title: '文章上方的返回連結', kind: 'article', anchor: 'system-cabinet-return' },
  '系統櫃材質重點': { title: '材質重點', kind: 'article', anchor: 'system-cabinet-importance' },
  '系統櫃板材比較': { title: '板材比較表', kind: 'table', anchor: 'system-cabinet-materials' },
  '系統櫃挑選步驟': { title: '挑選步驟與推薦連結', kind: 'steps', anchor: 'system-cabinet-steps' },
  '系統櫃推薦案例': { title: '推薦案例', kind: 'cards', anchor: 'system-cabinet-cases' },
  '系統櫃文章結語': { title: '文章結語與型錄連結', kind: 'article', anchor: 'system-cabinet-closing' },
}

export function isSystemCabinetDocument(id) {
  return id === 'view-pages-knowledge-design-systemcabinet' || id === 'data-kitchenSystemCabinet'
}

export const knowledgeSharedSections = {
  '文章底部返回按鈕': { title: '一般文章上方的返回連結', kind: 'article', anchor: 'knowledge-return-link' },
  '延伸文章按鈕': { title: '更多廚房知識按鈕', kind: 'article', anchor: 'knowledge-related-heading', fixedAction: '更多廚房知識' },
}

export function legacyKnowledgeSection(block) {
  if (typeof block !== 'string' || !block.startsWith('knowledge:')) return ''
  const name = block.slice('knowledge:'.length)
  if (name === '系統櫃介紹') return '系統櫃材質重點'
  if (name === '系統櫃材質') return '系統櫃板材比較'
  if (name === '文章結語') return '系統櫃文章結語'
  return Object.hasOwn(knowledgeArticleSections, name) ? name : ''
}
