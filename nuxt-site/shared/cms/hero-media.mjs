export const HOME_HERO_ID = 'view-components-home-HomeHero'

// Add optional fields at the schema boundary; existing documents and versions stay intact.
export function homeHeroSchema(id, schema) {
 if (id !== HOME_HERO_ID) return schema
 const slides = schema.fields.slides
 const fields = {
  ...slides.item.fields,
  mobileImage: {type:'string',format:'media',label:'手機圖片'},
 }
 for (const [device,label] of [['desktop','桌機'],['mobile','手機']]) {
  for (const [axis,direction] of [['X','水平'],['Y','垂直']]) {
   fields[`${device}Focus${axis}`] = {type:'number',min:0,max:100,label:`${label}${direction}焦點`}
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
