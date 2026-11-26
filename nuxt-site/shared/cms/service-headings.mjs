export const serviceHeadingDocument = 'view-pages-service-process'
export const serviceHeadingFields = {
 englishLabel: {label:'區塊英文標籤',fallback:'Service Process'},
 englishTitle: {label:'區塊英文主標題'},
}
export function serviceHeading(copy = {}) {
 return {
  englishLabel: copy.englishLabel ?? serviceHeadingFields.englishLabel.fallback,
  englishTitle: copy.englishTitle ?? [copy.text3 ?? ' Bringing Your ',copy.text4 ?? 'Dream Kitchen',copy.text5 ?? ' To Life '].join(''),
 }
}
export function serviceHeadingSchema(id,schema) {
 if(id!==serviceHeadingDocument)return schema
 const copy=schema.fields.copy,fields={...copy.fields}
 for(const key of ['text3','text4','text5'])fields[key]={...fields[key],hidden:true}
 for(const [key,{label}]of Object.entries(serviceHeadingFields))fields[key]={type:'string',label,singleLine:true}
 const order=['text1','englishLabel','text2','englishTitle']
 return {...schema,fields:{...schema.fields,copy:{...copy,fields:{...Object.fromEntries(order.map(key=>[key,fields[key]])),...fields}}}}
}
export function effectiveServiceHeadingBody(id,body) {
 return id===serviceHeadingDocument&&body?.copy?{...body,copy:{...body.copy,...serviceHeading(body.copy)}}:body
}
