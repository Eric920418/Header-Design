export const knowledgeListSearchDefaults={
 title:'廚房裝修指南｜SAKURA 整體廚房',
 description:'從系統櫃材質、廚房插座到中島餐桌規劃，閱讀 SAKURA 整體廚房精選裝修指南。',
}
export function knowledgeSearchExample(id,bodies,settings={}){
 if(!['view-pages-knowledge-index','view-pages-knowledge-design-systemcabinet','view-pages-knowledge-design-slug-'].includes(id))return undefined
 const system=id==='view-pages-knowledge-design-systemcabinet',list=id==='view-pages-knowledge-index'
 const article=(bodies['knowledge-articles']?.items||[]).find(row=>row.enabled!==false&&(system?row.slug==='systemcabinet':row.slug!=='systemcabinet'))
 const defaults=list?knowledgeListSearchDefaults:{title:article?article.summary.title+'｜SAKURA 整體廚房':'各文章原本的標題',description:article?article.summary.excerpt:'各文章原本的摘要'}
 return{title:settings.seoTitle||defaults.title,description:settings.seoDescription||defaults.description,
  href:list?'/knowledge':article?'/knowledge/design/'+encodeURIComponent(article.slug):'',
  note:!list&&article?'以「'+article.summary.title+'」為例':''}
}
