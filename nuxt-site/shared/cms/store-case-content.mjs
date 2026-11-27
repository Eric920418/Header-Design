export function storeCaseContentPosition(block,selected,field=''){
 if(block?.id!=='store-cases:案例管理'||selected?.documentId!=='data-storeCases'||selected.path!=='storeCases')return block
 const prefix='storeCases.'+selected.index,relative=field.startsWith(prefix+'.')?field.slice(prefix.length+1):''
 const story=relative.match(/^article(?:\.(\d+))?(?:\.|$)/),carousel=/^images(?:\.|$)/.test(relative)
 if(!story&&!carousel)return block
 const item=selected.value,sectionIndex=story?Number(story[1]??Math.max(0,(item.article||[]).findIndex(section=>section.images?.length))):0
 const section=item.article?.[sectionIndex],photo=relative.match(/(?:^|\.)images\.(\d+)(?:\.|$)/),photoIndex=Number(photo?.[1]||0)
 const images=story?section?.images:item.images
 const imageIndex=photoIndex<(images?.length||0)?photoIndex:0
 const anchor=story?(relative.includes('.images')&&section?.images?.length?'case-article-images-':'case-article-')+(sectionIndex+1):'case-carousel'
 return {...block,name:story?'文章段落圖片':'頁首輪播圖片',kind:story?'store-case-story':'store-case-carousel',sectionIndex,photoIndex:imageIndex,previewPage:'/gallery/'+encodeURIComponent(item.slug)+'#'+anchor}
}
