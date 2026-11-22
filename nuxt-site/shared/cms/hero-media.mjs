export const HOME_HERO_ID = 'view-components-home-HomeHero'

export function heroSeriesTitle(slides, path) {
 return slides?.find(slide=>slide.route?.split(/[?#]/)[0]===path)?.title.trim() || ''
}

// Add optional fields at the schema boundary; existing documents and versions stay intact.
export function homeHeroSchema(id, schema) {
 if (id !== HOME_HERO_ID) return schema
 const slides = schema.fields.slides
 const fields = {
  ...slides.item.fields,
  mobileImage: {type:'string',format:'media',label:'手機圖片'},
 }
 for (const [device,label] of [['desktop','桌機'],['mobile','手機']]) {
  for (const [axis,direction] of [['X','左右'],['Y','上下']]) {
   fields[`${device}Focus${axis}`] = {type:'number',min:0,max:100,label:`${label}圖片${direction}位置`}
  }
 }
 return {...schema,fields:{...schema.fields,slides:{...slides,item:{...slides.item,fields}}}}
}

export function heroImageSource(slide, viewport) {
 return viewport === 'mobile' ? slide.mobileImage || slide.image : slide.image
}

export function heroPosition(slide, viewport) {
 const percent = value => typeof value === 'number' && Number.isFinite(value) ? Math.min(100,Math.max(0,value)) : 50
 return `${percent(slide[`${viewport}FocusX`])}% ${percent(slide[`${viewport}FocusY`])}%`
}

// Preview access is checked by the content API; this only selects the picture being reviewed.
export function heroPreviewSlide(query, count) {
 if(query?.cmsPreview!=='page:home'||typeof query.cmsDraft!=='string'||!query.cmsDraft||typeof query.cmsSlide!=='string'||!/^\d+$/.test(query.cmsSlide))return null
 const index=Number(query.cmsSlide)
 return Number.isSafeInteger(index)&&index<count?index:null
}
