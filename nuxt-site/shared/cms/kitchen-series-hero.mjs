export const KITCHEN_SERIES_ID = 'data-kitchenSeries'

// Optional additions preserve old versions and the other nine series.
export function kitchenSeriesHeroSchema(id, schema) {
  if (id !== KITCHEN_SERIES_ID) return schema
  const story = {type:'object',required:['image','title','subtitle','paragraphs'],fields:{
    image:{type:'string',format:'media',label:'對應輪播圖片'},
    title:{type:'string',label:'英文標題'},
    subtitle:{type:'string',label:'中文標題'},
    paragraphs:{type:'array',min:1,item:{type:'string'},template:'',label:'說明段落'},
  }}
  const extend = page => ({...page,fields:{...page.fields,heroStories:{type:'array',min:0,item:story,template:{image:'',title:'',subtitle:'',paragraphs:['']},label:'輪播圖文配對'}}})
  const pages = schema.fields.KITCHEN_SERIES_PAGES
  return {...schema,fields:{...schema.fields,
    AI_KITCHEN_PAGE:extend(schema.fields.AI_KITCHEN_PAGE),
    KITCHEN_SERIES_PAGES:{...pages,item:extend(pages.item)},
  }}
}

export function kitchenHeroStory(page, image) {
  return page.heroStories?.find(story => story.image === image)
}
