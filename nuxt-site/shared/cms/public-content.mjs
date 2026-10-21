export const contentAliases={'data-kitchenGuides':'knowledge-articles','data-kitchenGuideDetails':'knowledge-articles','data-news':'news-articles','data-latestArticles':'news-articles','data-activityArticles':'news-articles','data-mediaVideos':'news-articles'}
// Keep saved, published and unsaved previews on the same data projection.
export function publicContent(id,input){
 const body=JSON.parse(JSON.stringify(input))
 if(contentAliases[id]){
  const all=body.items.filter(i=>i.enabled)
  if(id==='data-kitchenGuides')return{KITCHEN_GUIDE_ARTICLES:all.map(i=>({...i.summary,id:i.id,detailRoute:`/knowledge/design/${i.slug}`,legacyUrl:`https://www.sakura-kitchenlife.com.tw/knowledge/design/${i.slug}`}))}
  if(id==='data-kitchenGuideDetails')return{KITCHEN_GUIDE_DETAILS:all.filter(i=>i.slug!=='systemcabinet').map(i=>({...i.detail,articleId:i.id,slug:i.slug}))}
  const newsArticles=all.map(i=>({...i.summary,id:i.id,legacyPath:`/news/${i.summary.category}/${i.slug}`})).sort((a,b)=>b.publishedAt.localeCompare(a.publishedAt))
  if(id==='data-news')return{newsArticles,recentNewsArticles:newsArticles.filter(i=>i.recentRank!==undefined).sort((a,b)=>(a.recentRank??99)-(b.recentRank??99))}
  const types={'data-latestArticles':['latest','latestArticleDetails'],'data-activityArticles':['activities','activityArticleDetails'],'data-mediaVideos':['video','mediaVideoDetails']},[category,key]=types[id]
  return{[key]:all.filter(i=>i.summary.category===category).map(i=>({...i.detail,id:i.id,slug:i.slug,cover:i.detail.cover||{src:i.summary.cover,alt:i.summary.title},sections:i.detail.sections||[],paragraphs:i.detail.paragraphs||[]}))}
 }
 if(id==='data-storeCases')body.storeCaseSummaries=body.storeCases.map(({images,meta,contact,article,...summary})=>summary)
 if(id==='data-aboutUs')body.brandHistoryHighlights=body.brandHistory.filter(i=>['1978','1992','2016','2020'].includes(i.year))
 if(id==='data-kitchenSeries')body.AI_KITCHEN_PAGE=body.KITCHEN_SERIES_PAGES.find(i=>i.slug===body.AI_KITCHEN_PAGE.slug)||body.KITCHEN_SERIES_PAGES[0]
 return body
}
