export const BUILDER_SERIES_ID = 'view-pages-builders-sakura-kitchen'

// Optional additions keep existing published versions and restored single-image cards valid.
export function builderSeriesSchema(id, schema) {
  if (id !== BUILDER_SERIES_ID) return schema
  const series = schema.fields.series
  return {...schema,fields:{...schema.fields,series:{...series,item:{...series.item,fields:{
    ...series.item.fields,
    subtitle:{type:'string',label:'英文系列名稱'},
    images:{type:'array',min:0,item:{type:'string',format:'media'},template:'',label:'系列相簿圖片'},
  }}}}}
}

export function builderSeriesImages(item) {
  return item?.images?.length ? item.images : item?.image ? [item.image] : []
}
