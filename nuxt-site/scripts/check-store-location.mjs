import assert from 'node:assert/strict'
import {readFile} from 'node:fs/promises'
import {HOME_STORES_ID,storeRegionCities,newStoreId,storeLocationIssue} from '../shared/cms/store-location.mjs'
import {validate} from '../server/cms/content.mjs'
const seed=JSON.parse(await readFile(new URL('../shared/cms/seed.json',import.meta.url),'utf8'))
const original=seed.find(d=>d.id===HOME_STORES_ID),before=JSON.stringify(original)
assert.deepEqual(storeRegionCities,original.data.regions)
assert.deepEqual(storeRegionCities,seed.find(d=>d.id==='data-storeCases').data.regionCities)
assert.equal(storeLocationIssue(original.data,true),'')
const stores=structuredClone(original.data.stores),oldIds=stores.map(s=>s.id)
for(let i=0;i<1000;i++){const id=newStoreId(stores);assert(Number.isSafeInteger(id)&&id>=0);assert(!stores.some(s=>s.id===id));stores.push({id})}
assert.deepEqual(stores.slice(0,oldIds.length).map(s=>s.id),oldIds)
const body=structuredClone(original.data),store=body.stores[0],oldId=store.id
for(const id of [-1,0.5,Number.MAX_SAFE_INTEGER+1,NaN,Infinity]){store.id=id;assert.match(storeLocationIssue(body),/識別碼/)}
store.id=body.stores[1].id;assert.match(storeLocationIssue(body),/重複/);store.id=oldId
store.region='東部';assert.match(storeLocationIssue(body),/縣市不屬於東部/)
store.city='';assert.equal(storeLocationIssue(body),'');assert.match(storeLocationIssue(body,true),/縣市/)
store.city='花蓮縣';validate(body,original.schema);assert.equal(storeLocationIssue(body,true),'')
body.regions['東部']=['臺東縣'];assert.match(storeLocationIssue(body,true),/尚未啟用/)
store.region='其他';assert.match(storeLocationIssue(body),/區域無效/)
assert.equal(JSON.stringify(original),before)
console.log('PASS 1000 generated safe/unique IDs, legacy ID 0, unchanged classification, duplicate/range/region/city validation and draft/publish rules (no database writes)')

if(process.env.CMS_STORE_DB_CHECK==='1'){
 assert(['127.0.0.1','localhost'].includes(process.env.NUXT_DESIGN_DB_SERVER||'127.0.0.1'))
 assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE||'SakuraWebsiteDev','SakuraWebsiteDev')
 const {database,query,sql,digest}=await import('../server/cms/database.mjs')
 const {changeDocument,getDocument}=await import('../server/cms/content.mjs')
 const db=await database(),tx=new sql.Transaction(db)
 const fingerprint=async()=>digest(JSON.stringify({d:(await query('SELECT * FROM cms.Documents ORDER BY id')).recordset,v:(await query('SELECT * FROM cms.Versions ORDER BY id')).recordset,m:(await query('SELECT * FROM cms.MediaRefs ORDER BY mediaId,versionId')).recordset}))
 try{
  const before=await fingerprint();await tx.begin(sql.ISOLATION_LEVEL.SERIALIZABLE)
  try{
   const doc=await getDocument(HOME_STORES_ID,tx),user=(await query("SELECT TOP(1) id,role FROM cms.Users WHERE role='admin' AND disabled=0",{},tx)).recordset[0]
   assert(user)
   const old=JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.draftId},tx)).recordset[0].body),next=structuredClone(old)
   const added={id:newStoreId(next.stores),region:'中部',city:'',name:'本機交易驗收門市',address:'僅交易測試地址',phone:'04-00000000'};next.stores.push(added)
   let result=await changeDocument(doc.id,{action:'save',revision:doc.revision,body:next},user,tx)
   assert.equal(result.publishedId,doc.publishedId)
   await assert.rejects(()=>changeDocument(doc.id,{action:'publish',revision:result.revision},user,tx),e=>e.statusCode===400&&/縣市/.test(e.message))
   added.city='臺中市';result=await changeDocument(doc.id,{action:'save',revision:result.revision,body:next},user,tx)
   const saved=JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:result.draftId},tx)).recordset[0].body)
   assert.deepEqual(saved,next);assert.deepEqual(saved.stores.slice(0,-1).map(s=>s.id),old.stores.map(s=>s.id))
   await assert.rejects(()=>changeDocument(doc.id,{action:'save',revision:doc.revision,body:next},user,tx),e=>e.statusCode===409)
   result=await changeDocument(doc.id,{action:'publish',revision:result.revision},user,tx);assert.equal(result.publishedId,result.draftId)
   const bad=structuredClone(next);bad.stores.at(-1).city='臺北市'
   await assert.rejects(()=>changeDocument(doc.id,{action:'save',revision:result.revision,body:bad},user,tx),e=>e.statusCode===400&&/縣市/.test(e.message))
   bad.stores.at(-1).city='臺中市';bad.stores.at(-1).id=old.stores[0].id
   await assert.rejects(()=>changeDocument(doc.id,{action:'save',revision:result.revision,body:bad},user,tx),e=>e.statusCode===400&&/重複/.test(e.message))
   result=await changeDocument(doc.id,{action:'restore',revision:result.revision,version:doc.draftId},user,tx)
   assert.deepEqual(JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:result.draftId},tx)).recordset[0].body),old)
  }finally{await tx.rollback()}
  assert.equal(await fingerprint(),before)
  console.log('PASS local SQL save, stable IDs, draft isolation, publication rules, invalid location/duplicate refusal, 409 and restore; all documents/versions/media references unchanged after ROLLBACK')
 }finally{await db.close()}
}
