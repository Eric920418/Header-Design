export const HOME_GALLERY_ID = 'view-components-home-HomeGallery'

export function customCasesSchema(id, schema) {
 if(id!=='custom-cases')return schema
 const items=schema.fields.items
 return{...schema,fields:{...schema.fields,items:{...items,template:{...items.template,enabled:true},item:{...items.item,fields:{...items.item.fields,enabled:{type:'boolean',label:'在官網顯示',help:'儲存草稿後，更新官網才會生效。'}}}}}}
}

export function homeGallerySchema(id, schema) {
 if (id !== HOME_GALLERY_ID) return schema
 const cases = schema.fields.cases
 return {...schema,fields:{...schema.fields,cases:{...cases,item:{...cases.item,fields:{
  ...cases.item.fields,title:{type:'string'},route:{type:'string',format:'url'},
 }}}}}
}

export function galleryCaseRoute(item) {
 return item.route || (/^[a-f\d]{8}(-[a-f\d]{4}){3}-[a-f\d]{12}$/i.test(item.slug) ? '/design-inspiration/' : '/gallery/') + encodeURIComponent(item.slug)
}

export function galleryCaseLabel(item) { return item.store?.trim() || item.title?.trim() || item.slug }

export function galleryCaseEntry(option) {
 return {slug:option.slug,store:option.store,image:option.image,title:option.title,route:option.route}
}
