// Fixed, human-approved content sync; never a database restore or seed.
import assert from 'node:assert/strict'
import {readFile} from 'node:fs/promises'
import {join,extname} from 'node:path'
import {homedir} from 'node:os'
import {parseEnv} from 'node:util'
import sql from 'mssql'
import {query,digest} from '../server/cms/database.mjs'
import {changeDocument,validate,mediaIds} from '../server/cms/content.mjs'
import {normalizeMedia,saveMedia} from '../server/cms/media.mjs'

const ids=['data-brandPavilions','data-kitchenSeries','data-kitchenStyles','data-productCatalogues','view-components-home-HomeWhatWeDo','view-pages-about-advantage','view-pages-about-exhibition','view-pages-about-introduce','view-pages-builders-index','view-pages-franchising-intro']
const mode=process.argv.includes('--apply')?'apply':process.argv.includes('--rollback')?'rollback':'check'
assert(!process.argv.includes('--apply')||!process.argv.includes('--rollback'),'不可同時 apply 與 rollback')
assert(process.argv.slice(2).every(a=>['--apply','--rollback'].includes(a)||/^--expect=[a-f0-9]{64}$/.test(a)),'不支援的參數')
const expected=process.argv.find(a=>a.startsWith('--expect='))?.slice(9)
const localEnv=parseEnv(await readFile(new URL('../.env',import.meta.url),'utf8'))
const cloudEnv=parseEnv(await readFile(new URL('../../.env.azure-runtime.local',import.meta.url),'utf8'))
assert.equal(localEnv.NUXT_DESIGN_DB_SERVER,'127.0.0.1')
assert.equal(localEnv.CMS_DB_DATABASE||localEnv.NUXT_DESIGN_DB_DATABASE,'SakuraWebsiteDev')
assert.equal(cloudEnv.NUXT_DESIGN_DB_SERVER,'sakura-website-test-20260929.database.windows.net')
assert.equal(cloudEnv.CMS_DB_DATABASE,'SakuraWebsiteTest')
assert.equal(cloudEnv.CMS_MEDIA_STORAGE,'sql')
assert.equal(cloudEnv.NUXT_DESIGN_DB_TRUST_SERVER_CERTIFICATE,'false')
const config=e=>({server:e.NUXT_DESIGN_DB_SERVER,port:Number(e.NUXT_DESIGN_DB_PORT),database:e.CMS_DB_DATABASE||e.NUXT_DESIGN_DB_DATABASE,user:e.CMS_DB_USER,password:e.CMS_DB_PASSWORD,options:{encrypt:true,trustServerCertificate:e.NUXT_DESIGN_DB_TRUST_SERVER_CERTIFICATE==='true'},connectionTimeout:60000,requestTimeout:120000})
const documents=async pool=>(await query('SELECT d.*,v.body FROM cms.Documents d JOIN cms.Versions v ON v.id=d.publishedId ORDER BY d.id',{},pool)).recordset
const fingerprint=rows=>digest(JSON.stringify(rows.map(r=>JSON.stringify(r)).sort()))
let local,cloud,tx
try{
 local=await new sql.ConnectionPool(config(localEnv)).connect()
 cloud=await new sql.ConnectionPool(config(cloudEnv)).connect()
 assert.equal((await query('SELECT DB_NAME() name',{},cloud)).recordset[0].name,'SakuraWebsiteTest')
 const source=await documents(local),target=await documents(cloud),planned=[],media=new Map()
 assert.equal(source.length,65);assert.equal(target.length,65)
 for(const id of ids){
  const s=source.find(d=>d.id===id),d=target.find(d=>d.id===id)
  assert(s&&d,id+' 不存在')
  assert.equal(s.draftId,s.publishedId,id+' 本機有未發布草稿')
  assert.equal(d.draftId,d.publishedId,id+' 正式有未發布草稿')
  assert.equal(s.schemaJson,d.schemaJson,id+' schema 不同')
  const body=JSON.parse(s.body);validate(body,JSON.parse(d.schemaJson))
  for(const mid of mediaIds(body))if(!media.has(mid)){
   const m=(await query('SELECT * FROM cms.Media WHERE id=@id',{id:mid},local)).recordset[0]
   assert(m&&!m.archived,'本機素材不存在／已封存')
   assert(/^[a-f0-9-]+\.(pdf|webp)$/i.test(m.filename),'素材檔名不安全')
   const bytes=await readFile(join(localEnv.CMS_MEDIA_DIR||join(homedir(),'.sakura-cms/media'),m.filename))
   assert.equal(bytes.length,m.size);assert.equal(digest(bytes),m.hash)
   await normalizeMedia(bytes,m.mime)
   const existing=(await query('SELECT m.id,m.archived,m.hash,m.size,m.mime,LOWER(CONVERT(varchar(64),HASHBYTES(\'SHA2_256\',b.bytes),2)) actualHash,DATALENGTH(b.bytes) byteSize FROM cms.Media m LEFT JOIN cms.MediaBytes b ON b.id=m.id WHERE m.hash=@hash AND m.archived=0',{hash:m.hash},cloud)).recordset[0]
   if(existing){assert.equal(existing.actualHash,m.hash);assert.equal(Number(existing.byteSize),m.size);assert.equal(existing.mime,m.mime)}
   media.set(mid,{source:m,file:{bytes,mime:m.mime,ext:extname(m.filename).slice(1)},existing:existing?.id})
  }
  planned.push({s,d,body})
 }
 assert.equal(media.size,2,'本次只允許兩份型錄素材')
 const replacements=Object.fromEntries([...media].filter(([,m])=>m.existing).map(([id,m])=>[id,m.existing]))
 const mapped=body=>JSON.parse(JSON.stringify(body).replace(/\/media\/([a-f0-9-]{36})/gi,(v,id)=>replacements[id]?'/media/'+replacements[id]:v))
 const pending=planned.filter(p=>JSON.stringify(mapped(p.body))!==p.d.body)
 for(const {s,d} of pending){
  const old=(await query('SELECT body FROM cms.Versions WHERE id=@id AND documentId=@documentId',{id:d.publishedId,documentId:d.id},local)).recordset[0]
  assert(old&&old.body===d.body,d.id+' 正式內容已獨立修改，停止避免覆蓋')
 }
 const planHash=digest(JSON.stringify({source:planned.map(p=>[p.s.id,p.s.revision,p.s.body]),target:planned.map(p=>[p.d.id,p.d.revision,p.d.draftId,p.d.publishedId,p.d.body]),media:[...media].map(([id,m])=>[id,m.source.hash,m.existing])}))
 console.log(JSON.stringify({mode,planHash,pending:pending.map(p=>p.s.id),newMedia:[...media.values()].filter(m=>!m.existing).map(m=>({name:m.source.name,size:m.source.size,hash:m.source.hash})),sourceOfTruth:'本機已發布內容'},null,2))
 if(mode==='check')process.exitCode=0
 else if(!pending.length){assert.equal([...media.values()].filter(m=>!m.existing).length,0);console.log('PASS 已一致，沒有新增版本或素材')}
 else{
  assert.equal(expected,planHash,'請先核對 check 的 planHash；資料變動時必須重新檢查')
  // Only these tables are fingerprinted; credentials stay in memory and are never printed.
  const names=(await query("SELECT 'sync.'+t.name name FROM sys.tables t JOIN sys.schemas s ON s.schema_id=t.schema_id WHERE s.name='sync' ORDER BY t.name",{},cloud)).recordset.map(t=>t.name)
  names.push('cms.Users','cms.Sessions','cms.Submissions','cms.Comments')
  const protectedState=async()=>{const state={};for(const name of names)state[name]=fingerprint((await query(`SELECT * FROM ${name}`,{},cloud)).recordset);state.documents=fingerprint((await documents(cloud)).filter(d=>!ids.includes(d.id)));return state}
  const before=await protectedState()
  const trackedState=async()=>{const state={};for(const name of ['Documents','Versions','Media','MediaRefs','Audit'])state[name]=fingerprint((await query(`SELECT * FROM cms.${name}`,{},cloud)).recordset);state.bytes=fingerprint((await query("SELECT id,LOWER(CONVERT(varchar(64),HASHBYTES('SHA2_256',bytes),2)) hash FROM cms.MediaBytes",{},cloud)).recordset);return state}
  const rollbackBefore=mode==='rollback'?await trackedState():undefined
  Object.assign(process.env,cloudEnv)
  tx=new sql.Transaction(cloud);await tx.begin(sql.ISOLATION_LEVEL.SERIALIZABLE)
  const actor=(await query("SELECT TOP(1) id,role FROM cms.Users WHERE role='admin' AND disabled=0 ORDER BY email",{},tx)).recordset[0]
  assert(actor,'正式端沒有有效管理員')
  for(const {d} of planned){const current=(await query('SELECT * FROM cms.Documents WITH(UPDLOCK,HOLDLOCK) WHERE id=@id',{id:d.id},tx)).recordset[0];assert.equal(current.revision,d.revision,d.id+' 已被修改');assert.equal(current.draftId,d.draftId);assert.equal(current.publishedId,d.publishedId)}
  for(const [id,m]of media){
   if(!m.existing){const saved=await saveMedia(m.file,m.source.name,actor.id,tx);replacements[id]=saved.id;await query('UPDATE cms.Media SET alt=@alt,category=@category WHERE id=@id',{id:saved.id,alt:m.source.alt,category:m.source.category},tx)}
   const mid=replacements[id]||m.existing
   const stored=(await query("SELECT m.hash,m.size,m.archived,LOWER(CONVERT(varchar(64),HASHBYTES('SHA2_256',b.bytes),2)) actualHash,DATALENGTH(b.bytes) byteSize FROM cms.Media m JOIN cms.MediaBytes b ON b.id=m.id WHERE m.id=@id",{id:mid},tx)).recordset[0]
   assert(stored&&!stored.archived);assert.equal(stored.actualHash,m.source.hash);assert.equal(Number(stored.byteSize),m.source.size)
  }
  for(const {d,body}of pending){
   const next=mapped(body)
   const saved=await changeDocument(d.id,{action:'save',revision:d.revision,body:next},actor,tx)
   await changeDocument(d.id,{action:'publish',revision:saved.revision},actor,tx)
   const result=(await query('SELECT d.draftId,d.publishedId,v.body FROM cms.Documents d JOIN cms.Versions v ON v.id=d.publishedId WHERE d.id=@id',{id:d.id},tx)).recordset[0]
   assert.equal(result.body,JSON.stringify(next));assert.equal(result.draftId,result.publishedId)
   assert.equal((await query('SELECT COUNT(*) n FROM cms.Versions WHERE id=@id AND documentId=@documentId',{id:d.publishedId,documentId:d.id},tx)).recordset[0].n,1,'舊版本必須保留')
   console.log('STAGED '+d.id)
  }
  if(mode==='rollback'){
   await tx.rollback();tx=undefined
   assert.deepEqual(await trackedState(),rollbackBefore,'回滾後資料必須完全一致')
   assert.deepEqual(await protectedState(),before)
   console.log('PASS 兩份素材與所有內容／稽核交易回滾，正式資料未變')
  }else{
   await tx.commit();tx=undefined
   assert.deepEqual(await protectedState(),before,'不相關資料發生變動，請檢查是否有同時操作')
   console.log('PASS 已發布 '+pending.length+' 份最新本機內容；正式舊版本保留；帳號、工作階段、收件、留言、來源表與其他頁面未改')
  }
 }
}catch(error){if(tx)await tx.rollback().catch(()=>{});let message=error.message;for(const e of[localEnv,cloudEnv])for(const[k,v]of Object.entries(e))if(/PASSWORD|SECRET|TOKEN/.test(k)&&v)message=message.replaceAll(v,'[REDACTED]');console.error(message);process.exitCode=1}
finally{await local?.close();await cloud?.close()}
