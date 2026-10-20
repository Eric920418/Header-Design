import regions from './store-regions.json' with {type:'json'}
export const HOME_STORES_ID='view-components-home-HomeStoreLocation'
export const storeRegionCities=regions

export function newStoreId(stores){
 const used=new Set(stores.map(store=>store.id))
 let id
 do{const words=crypto.getRandomValues(new Uint32Array(2));id=(words[0]&0x1fffff)*0x100000000+words[1]}while(used.has(id))
 return id
}

export function storeLocationIssue(body,publishing=false){
 const ids=new Set()
 for(const store of body.stores){
  const label=`門市「${store.name||'未命名門市'}」`
  if(!Number.isSafeInteger(store.id)||store.id<0)return `${label}的識別碼必須是有效的非負整數。`
  if(ids.has(store.id))return `${label}的識別碼重複，請重新載入後再新增門市。`
  ids.add(store.id)
  if(!Object.hasOwn(regions,store.region))return `${label}的區域無效，請重新選擇區域。`
  if(!store.city&&!publishing)continue
  if(!regions[store.region].includes(store.city))return `${label}的縣市不屬於${store.region}，請重新選擇縣市。`
  if(publishing&&!body.regions[store.region]?.includes(store.city))return `${label}的${store.city}尚未啟用，請先在「地區與縣市設定」加入此縣市。`
 }
 return ''
}
