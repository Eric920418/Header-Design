import {access} from 'node:fs/promises'
import {resolve,sep} from 'node:path'
import { query, transaction, randomUUID, fail, audit } from './database.mjs'
export const contentAliases = {'data-kitchenGuides':'knowledge-articles','data-kitchenGuideDetails':'knowledge-articles','data-news':'news-articles','data-latestArticles':'news-articles','data-activityArticles':'news-articles','data-mediaVideos':'news-articles'}
export function safeLink(value) {
 if(typeof value!=='string'||value.length>2000||/[\u0000-\u001f\\]/.test(value)) return false
 if(value==='')return true
 if(value.startsWith('/')&&!value.startsWith('//')){try{const decoded=decodeURIComponent(value.split(/[?#]/)[0]);return !decoded.startsWith('//')&&!/[\\\u0000-\u001f]/.test(decoded)&&!decoded.split('/').includes('..')}catch{return false}}
 if(value.startsWith('#'))return true
 try{const u=new URL(value);return ['https:','http:','mailto:','tel:'].includes(u.protocol)&&!u.username&&!u.password}catch{return false}
}
export function normalizeVideos(value,schema){
 if(value===undefined||value===null)return value
 if(schema.type==='object'){for(const[k,s]of Object.entries(schema.fields))if(Object.hasOwn(value,k))value[k]=normalizeVideos(value[k],s)}
 else if(schema.type==='array'&&Array.isArray(value))return value.map(v=>normalizeVideos(v,schema.item))
 else if(schema.format==='youtube'&&typeof value==='string'&&!/^[A-Za-z0-9_-]{11}$/.test(value)){
  try{const u=new URL(value);if(u.protocol!=='https:'||u.username||u.password)throw Error();let id;if(['youtu.be','www.youtu.be'].includes(u.hostname))id=u.pathname.slice(1);else if(['youtube.com','www.youtube.com','m.youtube.com','www.youtube-nocookie.com'].includes(u.hostname)){if(u.pathname==='/watch')id=u.searchParams.get('v');else if(/^\/(embed|shorts)\//.test(u.pathname))id=u.pathname.split('/')[2]}if(!/^[A-Za-z0-9_-]{11}$/.test(id||''))throw Error();return id}catch{fail(400,'請輸入有效的 HTTPS YouTube 連結或 11 字元影片 ID')}
 }return value
}
export function validate(value,schema,path='內容') {
 if(schema.type==='nullable'){if(value!==null&&typeof value!=='string')fail(400,`${path} 格式錯誤`);return}
 if(schema.type==='array'){
  if(!Array.isArray(value)||value.length<(schema.min||0)||value.length>2000)fail(400,`${path} 項目數不符（至少 ${schema.min||0} 項）`)
  const ids=new Set();for(const [i,v] of value.entries()){validate(v,schema.item,`${path}[${i+1}]`);const id=v?.id??v?.slug;if(id!==undefined){if(ids.has(String(id)))fail(400,`${path} 識別碼重複`);ids.add(String(id))}}return
 }
 if(schema.type==='object'){
  if(!value||typeof value!=='object'||Array.isArray(value))fail(400,`${path} 必須是物件`)
  for(const key of Object.keys(value)){if(!Object.hasOwn(schema.fields,key))fail(400,`${path}.${key} 不支援`);validate(value[key],schema.fields[key],`${path}.${key}`)}
  for(const key of schema.required||[])if(!Object.hasOwn(value,key))fail(400,`${path}.${key} 為必填`);return
 }
 if(value===undefined)return
 if(schema.enum&&!schema.enum.includes(value))fail(400,`${path} 選項無效`)
 if(typeof value!==schema.type)fail(400,`${path} 格式錯誤`)
 if(typeof value==='number'&&!Number.isFinite(value))fail(400,`${path} 必須是有限數字`)
 if(typeof value==='string'){
  if(value.length>30000)fail(400,`${path} 最多 30000 字`)
  if(['url','media'].includes(schema.format)&&!safeLink(value))fail(400,`${path} 網址不安全或格式錯誤`)
  if(schema.format==='youtube'&&!/^[A-Za-z0-9_-]{11}$/.test(value))fail(400,`${path} 必須是有效 YouTube 影片 ID`)
  if(schema.format==='media'&&value&&!value.startsWith('/')&&!/^https?:\/\//.test(value))fail(400,`${path} 素材需使用網站路徑或 HTTPS 網址`)
  if(schema.identity&&(!value.trim()||value.length>160||/[\/\\<>]/.test(value)))fail(400,`${path} 識別碼格式錯誤`)
 }
 if(Object.hasOwn(schema,'fixed')&&value!==schema.fixed)fail(400,`${path} 為固定版型設定`)
}
async function publicationMedia(value,schema,path='內容'){
 if(value===undefined||value===null)return
 if(schema.type==='object'){for(const[k,s]of Object.entries(schema.fields))await publicationMedia(value[k],s,`${path}.${k}`);return}
 if(schema.type==='array'){for(const v of value)await publicationMedia(v,schema.item,path);return}
 if(schema.format!=='media'||!value)return
 if(value.startsWith('/media/'))return
 if(value.startsWith('/')){
  const relative=decodeURIComponent(value.split(/[?#]/)[0]).slice(1),roots=[resolve(process.cwd(),'../public'),resolve(process.cwd(),'.output/public'),resolve(process.cwd(),'public')]
  let found=false;for(const root of roots){const file=resolve(root,relative);if(file.startsWith(root+sep)){try{await access(file);found=true;break}catch{}}}
  if(!found)fail(400,`${path}：找不到網站素材 ${value}`)
 }
}
export function mediaIds(body){return [...new Set([...JSON.stringify(body).matchAll(/\/media\/([a-f0-9-]{36})/gi)].map(m=>m[1]))]}
async function version(tx,doc,body,actor){
 const id=randomUUID();await query('INSERT cms.Versions(id,documentId,body,actor) VALUES(@id,@documentId,@body,@actor)',{id,documentId:doc.id,body:JSON.stringify(body),actor},tx)
 const ids=mediaIds(body);const existing=(await query('SELECT id,originUrl FROM cms.Media WHERE originUrl IS NOT NULL',{},tx)).recordset;for(const m of existing)if(JSON.stringify(body).includes(JSON.stringify(m.originUrl)))ids.push(m.id)
 for(const mediaId of new Set(ids)){
 const m=(await query('SELECT archived FROM cms.Media WHERE id=@id',{id:mediaId},tx)).recordset[0];if(!m||m.archived)fail(400,'內容引用不存在或已封存的素材')
 await query('INSERT cms.MediaRefs(mediaId,versionId) VALUES(@mediaId,@id)',{mediaId,id},tx)
 }return id
}
export async function sourceItems(id,tx){
 const brands={'catalog-sakura':'櫻花','catalog-svago':'SVAGO','catalog-teka':'TEKA'}
 if(id==='catalog-cases')return(await query("SELECT id,name FROM sync.DesignCloudCases WHERE isWebsite=1 ORDER BY name,id",{},tx)).recordset
 if(!brands[id])fail(400,'未知來源')
 return(await query("SELECT CONVERT(nvarchar(80),id) AS id,name FROM sync.BuyKitchenProducts WHERE channel=N'展板' AND Brand=@brand ORDER BY name,id",{brand:brands[id]},tx)).recordset
}
export async function alignSource(id,body,tx){const live=await sourceItems(id,tx),settings=new Map(body.items.map(i=>[i.id,i]));return{items:live.map((i,index)=>({...i,enabled:true,featured:false,sort:index,...settings.get(i.id),id:i.id,name:i.name})).sort((a,b)=>a.sort-b.sort)}}
export async function getDocument(id,tx){const d=(await query('SELECT * FROM cms.Documents WHERE id=@id',{id},tx)).recordset[0];if(!d)fail(404,'找不到內容');return d}
export async function readContent(id,preview=false){
 if(contentAliases[id]){
  const all=(await readContent(contentAliases[id],preview)).items.filter(i=>i.enabled)
  if(id==='data-kitchenGuides')return{KITCHEN_GUIDE_ARTICLES:all.map(i=>({...i.summary,id:i.id,detailRoute:`/knowledge/design/${i.slug}`,legacyUrl:`https://www.sakura-kitchenlife.com.tw/knowledge/design/${i.slug}`}))}
  if(id==='data-kitchenGuideDetails')return{KITCHEN_GUIDE_DETAILS:all.filter(i=>i.slug!=='systemcabinet').map(i=>({...i.detail,articleId:i.id,slug:i.slug}))}
  const newsArticles=all.map(i=>({...i.summary,id:i.id,legacyPath:`/news/${i.summary.category}/${i.slug}`})).sort((a,b)=>b.publishedAt.localeCompare(a.publishedAt))
  if(id==='data-news')return{newsArticles,recentNewsArticles:newsArticles.filter(i=>i.recentRank!==undefined).sort((a,b)=>(a.recentRank??99)-(b.recentRank??99))}
  const types={'data-latestArticles':['latest','latestArticleDetails'],'data-activityArticles':['activities','activityArticleDetails'],'data-mediaVideos':['video','mediaVideoDetails']},[category,key]=types[id]
  return{[key]:all.filter(i=>i.summary.category===category).map(i=>({...i.detail,id:i.id,slug:i.slug,cover:i.detail.cover||{src:i.summary.cover,alt:i.summary.title},sections:i.detail.sections||[],paragraphs:i.detail.paragraphs||[]}))}
 }

 const d=await getDocument(id);const vid=preview?d.draftId:d.publishedId;if(!vid)fail(404,'內容未發布')
 const v=(await query('SELECT body FROM cms.Versions WHERE id=@id',{id:vid})).recordset[0];const body=JSON.parse(v.body)
 if(id==='data-storeCases')body.storeCaseSummaries=body.storeCases.map(({images,meta,contact,article,...summary})=>summary)
 if(id==='data-aboutUs')body.brandHistoryHighlights=body.brandHistory.filter(i=>['1978','1992','2016','2020'].includes(i.year))
 if(id==='data-kitchenSeries')body.AI_KITCHEN_PAGE=body.KITCHEN_SERIES_PAGES.find(i=>i.slug===body.AI_KITCHEN_PAGE.slug)||body.KITCHEN_SERIES_PAGES[0]
 return body
}
function checkIdentities(previous,next,schema,path='內容'){
 if(schema.type==='object'){for(const [key,field] of Object.entries(schema.fields)){if(field.identity&&previous?.[key]!==undefined&&next?.[key]!==previous[key])fail(400,`${path}.${key} 已發布，不可更改`);if(next?.[key]!==undefined)checkIdentities(previous?.[key],next[key],field,`${path}.${key}`)}}
 else if(schema.type==='array'&&schema.item.type==='object')for(const n of next){const identity=Object.keys(schema.item.fields).find(k=>schema.item.fields[k].identity);const p=identity?previous?.find(x=>x[identity]===n[identity]):undefined;if(p)checkIdentities(p,n,schema.item,path)}
}
export async function changeDocument(id,input,user){
 if(!['save','publish','unpublish','restore'].includes(input.action))fail(400,'未知內容操作')
 if(input.action!=='save'&&user.role!=='admin')fail(403,'僅管理員可發布、下架或還原')
 return transaction(async tx=>{
 const d=(await query('SELECT * FROM cms.Documents WITH(UPDLOCK,HOLDLOCK) WHERE id=@id',{id},tx)).recordset[0];if(!d)fail(404,'找不到內容')
 if(input.revision!==d.revision)fail(409,'內容已被其他人修改，請先重新載入；本次輸入尚未覆蓋')
 let draft=d.draftId,published=d.publishedId
 if(input.action==='save'||input.action==='restore'){
 let body=input.body
 if(input.action==='restore'){const v=(await query('SELECT body FROM cms.Versions WHERE id=@version AND documentId=@id',{version:input.version,id},tx)).recordset[0];if(!v)fail(404,'版本不存在');body=JSON.parse(v.body)}
 const schema=JSON.parse(d.schemaJson);body=normalizeVideos(body,schema);validate(body,schema)
 if(d.id.startsWith('catalog-')){
  if(input.action==='restore')body=await alignSource(id,body,tx)
  const live=await sourceItems(id,tx)
  if(body.items.length!==live.length||body.items.some(i=>!live.some(o=>o.id===i.id&&o.name===i.name)))fail(400,'來源商品／案例已變更或識別碼與名稱遭修改，請重新載入；僅允許調整上架、排序與推薦')
 }

 if(published){const previous=JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:published},tx)).recordset[0].body);checkIdentities(previous,body,schema)}
 draft=await version(tx,d,body,user.id)
 }else if(input.action==='publish'){
 if(!draft)fail(400,'請先儲存草稿');const body=JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:draft},tx)).recordset[0].body);validate(body,JSON.parse(d.schemaJson))
 if(d.id==='custom-cases')for(const i of body.items){if(!/^[a-f0-9]{8}(-[a-f0-9]{4}){3}-[a-f0-9]{12}$/i.test(i.id)||!i.title.trim()||!i.cover||!i.images.length||i.images.some(x=>!safeLink(x)||!x)||!i.form.trim()||!i.style.trim())fail(400,'案例需要有效識別碼、標題、封面、圖片、型式與風格')}
 if(d.id==='knowledge-articles')for(const i of body.items){if(!i.summary.title.trim()||!i.summary.cover||!i.summary.publishedAt|| (i.slug!=='systemcabinet'&&(!i.detail.cover?.src||!i.detail.sections?.length)))fail(400,'知識文章需要標題、封面、發布日期與內文')}
 if(d.id==='news-articles')for(const i of body.items){if(!i.summary.title.trim()||!i.summary.cover||(!i.detail.sections?.length&&!i.detail.paragraphs?.length&&i.summary.category!=='video')||!/^\d{4}-\d{2}-\d{2}/.test(i.summary.publishedAt))fail(400,'文章需要標題、封面與有效日期');if(i.summary.category==='video'&&!/^[A-Za-z0-9_-]{11}$/.test(i.detail.videoId||''))fail(400,'影音文章需要 YouTube 影片 ID')}
 await publicationMedia(body,JSON.parse(d.schemaJson))
 // Validate every local media reference again at publication time.
 for(const mid of mediaIds(body)){const m=(await query('SELECT archived FROM cms.Media WHERE id=@id',{id:mid},tx)).recordset[0];if(!m||m.archived)fail(400,'發布內容包含不存在或封存素材')}
 published=draft
 }else published=null
 await query('UPDATE cms.Documents SET draftId=@draft,publishedId=@published,revision=revision+1,updatedAt=SYSUTCDATETIME() WHERE id=@id',{id,draft,published},tx)
 await audit(user.id,input.action,id,tx);return{revision:d.revision+1,draftId:draft,publishedId:published}
 })
}
