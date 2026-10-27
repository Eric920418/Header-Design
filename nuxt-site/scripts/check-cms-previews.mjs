import assert from 'node:assert/strict'
import {execFileSync} from 'node:child_process'
import {query,transaction,database,digest,randomUUID,passwordHash} from '../server/cms/database.mjs'
import {createDraftPreview,readDraftPreview} from '../server/cms/previews.mjs'
import {changeWorkspace} from '../server/cms/workspaces.mjs'
import {workspaces} from '../shared/cms/workflow.mjs'
import {publicContent} from '../shared/cms/public-content.mjs'

const production=process.env.CMS_PREVIEW_TEST_TARGET==='production'
if(production){assert.equal(process.env.NUXT_DESIGN_DB_SERVER,'sakura-website-test-20260929.database.windows.net');assert.equal(process.env.CMS_DB_DATABASE,'SakuraWebsiteTest')}
else{assert(['127.0.0.1','localhost'].includes(process.env.NUXT_DESIGN_DB_SERVER||'127.0.0.1'),'Only run against the local test database');assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE||'SakuraWebsiteDev','SakuraWebsiteDev')}
const user={id:randomUUID(),role:'editor'},sampleId='data-kitchenStyles'
const fingerprint=async()=>digest(JSON.stringify((await query('SELECT id,revision,draftId,publishedId,schemaJson FROM cms.Documents ORDER BY id')).recordset)+JSON.stringify((await query("SELECT id,documentId,CONVERT(varchar(64),HASHBYTES('SHA2_256',body),2) bodyHash FROM cms.Versions ORDER BY id")).recordset))
const moduleUrl=new URL('../server/cms/previews.mjs',import.meta.url).href,dbUrl=new URL('../server/cms/database.mjs',import.meta.url).href
function worker(action,input){
 const source=`import {${action}} from ${JSON.stringify(moduleUrl)};import {database} from ${JSON.stringify(dbUrl)};import {readFileSync} from 'node:fs';try{const args=JSON.parse(readFileSync(0,'utf8'));process.stdout.write(JSON.stringify(await ${action}(...args)))}finally{await(await database()).close()}`
 return JSON.parse(execFileSync(process.execPath,['--input-type=module','-e',source],{input:JSON.stringify(input),encoding:'utf8',maxBuffer:4*1024*1024,stdio:['pipe','pipe','pipe']}))
}
const pool=await database()
let original,created=false
try{
 assert((await query("SELECT OBJECT_ID('cms.PreviewSessions') AS id")).recordset[0].id,'Run pnpm cms:init to add the preview table first')
 original=await fingerprint()
 const rows=(await query('SELECT d.id,d.revision,v.body FROM cms.Documents d JOIN cms.Versions v ON v.id=d.draftId')).recordset
 const sample=JSON.parse(rows.find(d=>d.id===sampleId).body),input=[{id:sampleId,body:sample}]
 await query('INSERT cms.Users(id,email,name,password,role,mustChange) VALUES(@id,@email,@name,@password,@role,0)',{...user,email:`preview-check-${user.id}@example.invalid`,name:'跨程序預覽測試',password:passwordHash(randomUUID())})
 created=true
 const token=worker('createDraftPreview',[user.id,input])
 assert.deepEqual(await readDraftPreview(token,user.id,sampleId),publicContent(sampleId,sample))
 const secondToken=await createDraftPreview(user.id,input)
 assert.deepEqual(worker('readDraftPreview',[secondToken,user.id,sampleId]),publicContent(sampleId,sample))
 assert.deepEqual(worker('readDraftPreview',[token,user.id,sampleId]),publicContent(sampleId,sample))
 console.log('PASS: creator process exits; independent readers and a second creator can still use the snapshots')
 const expired=e=>e.statusCode===404&&e.data.cmsPreviewExpired===true
 await assert.rejects(()=>readDraftPreview(token,randomUUID(),sampleId),expired)
 await assert.rejects(()=>readDraftPreview('invalid',user.id,sampleId),expired)
 await assert.rejects(()=>readDraftPreview(randomUUID(),user.id,sampleId),expired)
 assert.equal(await readDraftPreview(token,user.id,'not-in-this-snapshot'),undefined)
 sample.KITCHEN_STYLES[0].zh+='（只改呼叫端）'
 assert.notDeepEqual(await readDraftPreview(token,user.id,sampleId),publicContent(sampleId,sample))
 await query('UPDATE cms.PreviewSessions SET expiresAt=DATEADD(second,-1,SYSUTCDATETIME()) WHERE id=@id',{id:digest(token)})
 await assert.rejects(()=>readDraftPreview(token,user.id,sampleId),expired)
 for(let i=0;i<40;i++)await createDraftPreview(user.id,input)
 await assert.rejects(()=>readDraftPreview(secondToken,user.id,sampleId),expired)
 assert.equal((await query('SELECT COUNT(*) n FROM cms.PreviewSessions WHERE userId=@userId',{userId:user.id})).recordset[0].n,40)
 console.log('PASS: author isolation, immutable snapshots, expiry, invalid tokens and the per-user limit')
 for(const w of workspaces){
  const documents=w.ids.map(id=>{const row=rows.find(d=>d.id===id);assert(row,`Missing document ${id}`);return{id,revision:row.revision,body:JSON.parse(row.body)}})
  const result=await changeWorkspace(w.id,{action:'preview',documents},user)
  assert.equal(typeof result.previewToken,'string')
  for(const d of result.documents)assert.deepEqual(await readDraftPreview(result.previewToken,user.id,d.id),publicContent(d.id,d.body),w.title)
 }
 assert.equal(await fingerprint(),original)
 console.log(`PASS: all ${workspaces.length} editing workspaces validate and read shared previews; original content and every version unchanged`)
}finally{
 try{
  if(created)await transaction(async tx=>{await query('DELETE cms.PreviewSessions WHERE userId=@id',{id:user.id},tx);await query('DELETE cms.Users WHERE id=@id',{id:user.id},tx)})
  if(original)assert.equal(await fingerprint(),original)
 }finally{await pool.close()}
}
