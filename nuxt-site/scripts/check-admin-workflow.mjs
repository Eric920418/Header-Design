import assert from 'node:assert/strict'
import {readFile} from 'node:fs/promises'
import {workspaces,workspaceFor,changedItems,firstImage} from '../shared/cms/workflow.mjs'
import {editingSchema} from '../shared/cms/presentation.mjs'
import {publicContent,contentAliases} from '../shared/cms/public-content.mjs'
import {createDraftPreview,readDraftPreview} from '../server/cms/previews.mjs'
import {workspaceInput} from '../server/cms/workspaces.mjs'
const seed=JSON.parse(await readFile(new URL('../shared/cms/seed.json',import.meta.url)))
const ignored=new Set([...Object.keys(contentAliases),'view-components-FloatingButtons'])
for(const d of seed.filter(d=>!ignored.has(d.id))){assert(workspaceFor(d.id),`Missing task: ${d.id}`);assert.equal(workspaces.filter(w=>w.ids.includes(d.id)).length,1);assert.match(workspaceFor(d.id).title,/[\u4e00-\u9fffA-Z]/)}
const project=workspaceFor('data-kitchenStyles');assert(project.ids.includes('view-components-home-HomeProject'));assert.equal(project.area,'home')
const input={action:'preview',documents:project.ids.map(id=>({id,revision:1,body:{}}))};assert.equal(workspaceInput(project.id,input),project)
for(const mutation of [{...input,action:'delete'},{...input,documents:[input.documents[0],input.documents[0]]},{...input,documents:input.documents.slice(1)},{...input,documents:input.documents.map(d=>({...d,revision:'1'}))}])assert.throws(()=>workspaceInput(project.id,mutation))
const sample=seed.find(d=>d.id==='data-kitchenStyles'),before=structuredClone(sample.data),next=structuredClone(before);next.KITCHEN_STYLES[0].zh='變更卡片名稱';next.KITCHEN_STYLES[1].desc='另一筆先前的修改'
const changes=changedItems(before,next,editingSchema(sample.schema,sample.id));assert(changes.some(c=>c.includes('變更卡片名稱')));assert(changes.length>=2);assert(firstImage(before))
for(const d of seed.filter(d=>!contentAliases[d.id])){const original=JSON.stringify(d.data);publicContent(d.id,d.data);assert.equal(JSON.stringify(d.data),original,'Projection must not mutate inputs')}
const token=createDraftPreview('author',[{id:sample.id,body:before}])
assert.deepEqual(readDraftPreview(token,'author',sample.id),publicContent(sample.id,before))
assert.throws(()=>readDraftPreview(token,'other',sample.id),e=>e.statusCode===404)
assert.throws(()=>readDraftPreview('invalid','author',sample.id),e=>e.statusCode===404)
const time=Date.now;try{Date.now=()=>time()+6*60*1000;assert.throws(()=>readDraftPreview(token,'author',sample.id),e=>e.statusCode===404)}finally{Date.now=time}
console.log(`PASS: ${workspaces.length} tasks cover every managed resource once; grouped sections, validation, complete pending-change summaries and immutable public projections.`)
if(process.env.CMS_WORKFLOW_DB==='1'){
 const {query,database,sql,passwordHash,randomUUID}=await import('../server/cms/database.mjs')
 const {changeWorkspace}=await import('../server/cms/workspaces.mjs')
 const {digest}=await import('../server/cms/database.mjs')
 const fingerprint=async()=>digest(JSON.stringify((await query('SELECT id,revision,draftId,publishedId FROM cms.Documents ORDER BY id')).recordset)+JSON.stringify((await query('SELECT id,documentId,body FROM cms.Versions ORDER BY id')).recordset))
 const original=await fingerprint(),tx=new sql.Transaction(await database());await tx.begin(sql.ISOLATION_LEVEL.SERIALIZABLE)
 try{
  const user={id:randomUUID(),role:'admin'},email=`workflow-${user.id}@example.invalid`
  await query('INSERT cms.Users(id,email,name,role,password,mustChange) VALUES(@id,@email,N\'流程交易測試\',N\'admin\',@password,0)',{...user,email,password:passwordHash(randomUUID())},tx)
  const documents=[]
  for(const id of project.ids){const d=(await query('SELECT d.*,v.body FROM cms.Documents d JOIN cms.Versions v ON v.id=d.draftId WHERE d.id=@id',{id},tx)).recordset[0];documents.push({id,revision:d.revision,body:JSON.parse(d.body)})}
  const body={action:'preview',documents},counts=await query('SELECT COUNT(*) n FROM cms.Versions',{},tx)
  // Preview's read path intentionally has no write transaction.
  await changeWorkspace(project.id,body,user)
  assert.equal((await query('SELECT COUNT(*) n FROM cms.Versions',{},tx)).recordset[0].n,counts.recordset[0].n)
  documents.find(d=>d.id==='data-kitchenStyles').body.KITCHEN_STYLES[0].desc+='（僅限回滾交易驗證）'
  const saved=await changeWorkspace(project.id,{...body,action:'save'},user,tx);assert(saved.documents.some(d=>d.draftId!==d.publishedId))
  const savedInput={action:'publish',documents:saved.documents.map(d=>({id:d.id,revision:d.revision,body:d.body}))}
  await assert.rejects(()=>changeWorkspace(project.id,savedInput,{...user,role:'editor'},tx),e=>e.statusCode===403)
  const published=await changeWorkspace(project.id,savedInput,user,tx);assert(published.documents.every(d=>d.draftId===d.publishedId))
  const current={action:'unpublish',documents:published.documents.map(d=>({id:d.id,revision:d.revision,body:d.body}))}
  const hidden=await changeWorkspace(project.id,current,user,tx);assert(hidden.documents.every(d=>d.publishedId===null))
  await assert.rejects(()=>changeWorkspace(project.id,{...body,action:'save'},user,tx),e=>e.statusCode===409)
  console.log('PASS: read-only preview, draft save, admin-only publish, unpublish and stale-edit conflict against real SQL inside a rollback-only transaction.')
 }finally{await tx.rollback()}
 assert.equal(await fingerprint(),original,'No original content or versions may change')
 // A failure in the last document must roll back any earlier saves.
 const userId=(await query("SELECT TOP(1) id FROM cms.Users WHERE role=N'admin' AND disabled=0")).recordset[0]?.id;assert(userId)
 const documents=[];for(const id of project.ids){const d=(await query('SELECT d.*,v.body FROM cms.Documents d JOIN cms.Versions v ON v.id=d.draftId WHERE d.id=@id',{id})).recordset[0];documents.push({id,revision:d.revision,body:JSON.parse(d.body)})}
 const sorted=[...documents].sort((a,b)=>a.id.localeCompare(b.id));sorted[0].body.KITCHEN_STYLES[0].desc+='（必須自動回滾）';sorted[1].revision--
 await assert.rejects(()=>changeWorkspace(project.id,{action:'save',documents}, {id:userId,role:'admin'}),e=>e.statusCode===409)
 assert.equal(await fingerprint(),original,'Transaction must undo the earlier document when a later document conflicts')
 console.log('PASS: failed multi-document operation rolls back completely; original document and version fingerprints unchanged.')
 await(await database()).close()
}
