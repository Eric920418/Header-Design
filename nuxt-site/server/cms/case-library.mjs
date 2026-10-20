import {query,fail} from './database.mjs'
import {galleryCaseRoute} from '../../shared/cms/gallery-cases.mjs'

// Published versions only; a draft must never become a selectable public destination.
export async function caseLibrary(connection) {
 const docs=(await query("SELECT d.id,v.body FROM cms.Documents d JOIN cms.Versions v ON v.id=d.publishedId WHERE d.id IN (N'data-storeCases',N'custom-cases',N'catalog-cases')",{},connection)).recordset
 const content=id=>{const d=docs.find(d=>d.id===id);return d?JSON.parse(d.body):null}
 const stores=(content('data-storeCases')?.storeCases||[]).map(i=>({slug:i.slug,store:i.storeName,title:i.title,image:i.images[0]||i.cover,route:`/gallery/${encodeURIComponent(i.slug)}`,source:'門市案例'}))
 const custom=(content('custom-cases')?.items||[]).map(i=>({slug:i.id,store:'',title:i.title,image:i.cover||i.images[0]||'',route:`/design-inspiration/${i.id}`,source:'自建案例'}))
 const policy=content('catalog-cases')
 const disabled=new Set((policy?.items||[]).filter(i=>!i.enabled).map(i=>i.id.toLowerCase()))
 const source=policy?(await query("SELECT c.id,c.name AS title,(SELECT TOP(1) url FROM sync.DesignCloudFiles WHERE caseId=c.id AND type='Image' ORDER BY mainImage DESC,CASE WHEN sort IS NULL THEN 1 ELSE 0 END,sort,url) AS image FROM sync.DesignCloudCases c WHERE c.isWebsite=1 ORDER BY c.name,c.id",{},connection)).recordset.filter(i=>!disabled.has(i.id.toLowerCase())).map(i=>({slug:i.id,store:'',title:i.title,image:i.image||'',route:`/design-inspiration/${i.id}`,source:'來源案例'})):[]
 return [...stores,...custom,...source]
}

export function validateGalleryCases(cases, library) {
 const available=new Map(library.map(i=>[i.slug,i]))
 for(const item of cases){
  const source=available.get(item.slug)
  if(!source)fail(400,`案例「${item.store||item.title||item.slug}」不存在、尚未發布或已下架，請重新選擇`)
  if(galleryCaseRoute(item)!==source.route)fail(400,`案例「${item.slug}」連結與案例庫不符，請重新選擇`)
  if(!item.image.trim())fail(400,`案例「${item.slug}」需要圖片`)
 }
}
