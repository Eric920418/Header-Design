import assert from 'node:assert/strict'
import {readFile} from 'node:fs/promises'
import {workspaces,workspaceFor,changedItems,firstImage} from '../shared/cms/workflow.mjs'
import {editingSchema} from '../shared/cms/presentation.mjs'
import {publicContent,contentAliases} from '../shared/cms/public-content.mjs'
import {createDraftPreview,readDraftPreview} from '../server/cms/previews.mjs'
import {workspaceInput} from '../server/cms/workspaces.mjs'
import {pageEditors,pageEditor,pageBlocks,legacyPage,pageEditorLink,searchPages,pageSummary,valueAt,withValue} from '../shared/cms/page-editors.mjs'
import {checkPageBody,pageEditorInput,editorSchema,changePageEditor} from '../server/cms/page-editors.mjs'
const seed=JSON.parse(await readFile(new URL('../shared/cms/seed.json',import.meta.url)))
const pageDocuments=seed.map(d=>({...d,body:d.data,schema:editorSchema({...d,schemaJson:JSON.stringify(d.schema)})}))
for(const w of workspaces)assert(legacyPage(w.id),'Missing page: '+w.id)
assert.equal(legacyPage('site-visuals').id,'visuals');assert.equal(legacyPage('data-brandPavilions').id,'pavilions');assert.equal(legacyPage('data-kitchenStyles').id,'home')
assert.deepEqual(pageEditors.filter(p=>p.section==='design').map(p=>p.name),['品牌系列','設計靈感','廚房裝修指南','品牌系列型錄'])
for(const p of pageEditors){
 const documents=pageDocuments.filter(d=>p.ids.includes(d.id)),blocks=pageBlocks(p,documents),positions=blocks.flatMap(b=>b.fields.map(f=>f.documentId+':'+f.path))
 assert.deepEqual(pageBlocks(p,[...documents].reverse()).map(b=>({id:b.id,fields:b.fields.map(f=>f.documentId+':'+f.path)})),blocks.map(b=>({id:b.id,fields:b.fields.map(f=>f.documentId+':'+f.path)})),'Database row order must not change page positions')
 assert(blocks.length>0);assert.equal(new Set(positions).size,positions.length,'No duplicated fields inside '+p.id)
 for(const d of documents){
  checkPageBody(p,d.id,d.body,structuredClone(d.body),d.schema)
  const allowed=blocks.flatMap(b=>b.fields.filter(f=>f.documentId===d.id))
  for(const f of allowed){assert(f.label&&!f.label.includes('copy.'));assert.notEqual(f.label,'內容欄位',p.id+':'+f.path)}
 }
 const input={action:'save',documents:documents.map(d=>({id:d.id,revision:1,body:d.body}))};assert.equal(pageEditorInput(p.id,input),p)
 assert.throws(()=>pageEditorInput(p.id,{...input,documents:input.documents.slice(1)}))
}
const testPage=pageEditor('news-latest'),newsDoc=pageDocuments.find(d=>d.id==='news-articles'),newsNext=structuredClone(newsDoc.body)
newsNext.items.find(i=>i.summary.category==='latest').summary.title='僅修改最新消息'
checkPageBody(testPage,newsDoc.id,newsDoc.body,newsNext,newsDoc.schema)
newsNext.items.find(i=>i.summary.category==='activities').summary.title='不允許修改另一分類'
assert.throws(()=>checkPageBody(testPage,newsDoc.id,newsDoc.body,newsNext,newsDoc.schema),e=>e.statusCode===400)
const brandDoc=pageDocuments.find(d=>d.id==='data-productBrands'),brandNext=structuredClone(brandDoc.body)
brandNext.PRODUCT_BRANDS.teka.name='其他品牌不可改'
assert.throws(()=>checkPageBody(pageEditor('products-sakura'),brandDoc.id,brandDoc.body,brandNext,brandDoc.schema))
const seriesDoc=pageDocuments.find(d=>d.id==='data-kitchenSeries'),fixedNext=structuredClone(seriesDoc.body)
fixedNext.AI_KITCHEN_PAGE.name='不可改隱藏副本'
assert.throws(()=>checkPageBody(pageEditor('series'),seriesDoc.id,seriesDoc.body,fixedNext,seriesDoc.schema))
const heroDoc=pageDocuments.find(d=>d.id==='view-components-home-HomeHero'),heroNext=structuredClone(heroDoc.body)
heroNext.slides[0].image='/kitchen-styles/basic-plus.jpg';heroNext.slides[0].mobileImage='/kitchen-styles/basic-plus.jpg'
checkPageBody(pageEditor('home'),heroDoc.id,heroDoc.body,heroNext,heroDoc.schema)
const locationDoc=pageDocuments.find(d=>d.id==='view-components-home-HomeStoreLocation'),locationNext=structuredClone(locationDoc.body)
locationNext.stores[0].region='中部';locationNext.stores[0].city='臺中市';checkPageBody(pageEditor('home'),locationDoc.id,locationDoc.body,locationNext,locationDoc.schema)
const serviceDoc=pageDocuments.find(d=>d.id==='view-components-home-HomeServices'),serviceNext=structuredClone(serviceDoc.body);serviceNext.services[0].imageLayout='arbitrary-style'
assert.throws(()=>checkPageBody(pageEditor('home'),serviceDoc.id,serviceDoc.body,serviceNext,serviceDoc.schema))
const summaries=pageEditors.map(p=>pageSummary(p,[],pageDocuments)),found=searchPages(summaries,'品牌系列 圖片')
assert(found.some(r=>r.page.id==='series'&&r.block));assert(!searchPages(summaries,'完全不存在的修改位置').length)
const oldQuery={q:'案例',page:'2',group:'設計靈感'},newLink=pageEditorLink('inspiration',oldQuery,'inspiration:案例內容');assert.equal(newLink.query.q,'案例');assert.equal(newLink.query.page,'2');assert.equal(newLink.query.block,'inspiration:案例內容')
const allLink=pageEditorLink('inspiration',{section:'all',page:'2',q:'案例'});assert.equal(allLink.query.section,'design');assert.equal(allLink.query.returnSection,'all');assert.equal(allLink.query.page,'2')
const raw={copy:{text:'保留',other:'不變'}},patched=withValue(raw,'copy.text','新文字');assert.equal(valueAt(patched,'copy.text'),'新文字');assert.equal(raw.copy.text,'保留');assert.equal(patched.copy.other,'不變');assert.throws(()=>withValue(raw,'__proto__.bad','x'))
console.log(`PASS: ${pageEditors.length} page entries cover all 48 previous entries; design order, scoped fields, filtered articles, fixed data, search, immutable edits and old list conditions`)
const ignored=new Set([...Object.keys(contentAliases),'view-components-FloatingButtons'])
for(const d of seed.filter(d=>!ignored.has(d.id))){assert(workspaceFor(d.id),`Missing task: ${d.id}`);assert.equal(workspaces.filter(w=>w.ids.includes(d.id)).length,1);assert.match(workspaceFor(d.id).title,/[\u4e00-\u9fffA-Z]/)}
const project=workspaceFor('data-kitchenStyles');assert(project.ids.includes('view-components-home-HomeProject'));assert.equal(project.area,'home')
const input={action:'preview',documents:project.ids.map(id=>({id,revision:1,body:{}}))};assert.equal(workspaceInput(project.id,input),project)
for(const mutation of [{...input,action:'delete'},{...input,documents:[input.documents[0],input.documents[0]]},{...input,documents:input.documents.slice(1)},{...input,documents:input.documents.map(d=>({...d,revision:'1'}))}])assert.throws(()=>workspaceInput(project.id,mutation))
const sample=seed.find(d=>d.id==='data-kitchenStyles'),before=structuredClone(sample.data),next=structuredClone(before);next.KITCHEN_STYLES[0].zh='變更卡片名稱';next.KITCHEN_STYLES[1].desc='另一筆先前的修改'
const changes=changedItems(before,next,editingSchema(sample.schema,sample.id));assert(changes.some(c=>c.includes('變更卡片名稱')));assert(changes.length>=2);assert(firstImage(before))
for(const d of seed.filter(d=>!contentAliases[d.id])){const original=JSON.stringify(d.data);publicContent(d.id,d.data);assert.equal(JSON.stringify(d.data),original,'Projection must not mutate inputs')}
await assert.rejects(()=>readDraftPreview('invalid','author',sample.id),e=>e.statusCode===404&&e.data.cmsPreviewExpired===true)
await assert.rejects(()=>createDraftPreview('author',[{id:'too-large',body:{text:'字'.repeat(1024*1024)}}]),e=>e.statusCode===413)
console.log(`PASS: ${workspaces.length} tasks cover every managed resource once; grouped sections, validation, complete pending-change summaries and immutable public projections.`)
if(process.env.CMS_PAGE_HTTP){
 const base=process.env.CMS_PAGE_HTTP;assert(['localhost','127.0.0.1'].includes(new URL(base).hostname))
 for(const name of ['PREVIEW_PASSWORD','CMS_TEST_EMAIL','CMS_TEST_PASSWORD','CMS_EDITOR_EMAIL'])assert(process.env[name],`Missing ${name}`)
 const jars={admin:{},editor:{},guest:{}}
 async function call(path,role='admin',body,csrf=true){
  const headers={Origin:base,Cookie:Object.entries(jars[role]).map(([k,v])=>k+'='+v).join('; ')}
  if(body){headers['Content-Type']='application/json';if(csrf&&jars[role].csrf)headers['X-CSRF-Token']=jars[role].csrf}
  const r=await fetch(base+path,{method:body?'POST':'GET',headers,...(body?{body:JSON.stringify(body)}:{})})
  for(const value of r.headers.getSetCookie()){const pair=value.split(';')[0],i=pair.indexOf('=');jars[role][pair.slice(0,i)]=pair.slice(i+1)}
  return{status:r.status,body:await r.json(),cache:r.headers.get('cache-control')}
 }
 for(const role of ['admin','editor','guest']){assert.equal((await call('/api/preview-access',role,{password:process.env.PREVIEW_PASSWORD})).status,200);if(role!=='guest'){assert.equal((await call('/api/admin/login',role,{email:role==='admin'?process.env.CMS_TEST_EMAIL:process.env.CMS_EDITOR_EMAIL,password:process.env.CMS_TEST_PASSWORD})).status,200);jars[role].csrf=(await call('/api/admin/session',role)).body.csrf}}
 assert.equal((await call('/api/admin/page-editors','guest')).status,401)
 const before=(await call('/api/admin/documents')).body,home=(await call('/api/admin/page-editors/home')).body
 const allPages=(await call('/api/admin/page-editors')).body;assert.equal(allPages.length,28)
 for(const p of allPages){const r=await call('/api/admin/page-editors/'+p.id);assert.equal(r.status,200,p.id);assert(r.body.blocks.length);const snapshot=await call('/api/admin/page-editors/'+p.id,'admin',{action:'preview',documents:r.body.documents.map(d=>({id:d.id,revision:d.revision,body:d.body}))});assert.equal(snapshot.status,200,p.id+':'+JSON.stringify(snapshot.body));assert(snapshot.body.previewToken)}
 const input={action:'preview',documents:home.documents.map(d=>({id:d.id,revision:d.revision,body:d.body}))}
 input.documents.find(d=>d.id==='view-components-home-HomeProject').body.copy.text1='HTTP未儲存驗收'
 assert.equal((await call('/api/admin/page-editors/home','admin',input,false)).status,403)
 const preview=await call('/api/admin/page-editors/home','admin',input);assert.equal(preview.status,200);assert.match(preview.cache,/no-store/)
 const path='/api/content/view-components-home-HomeProject?preview=page:home&cmsDraft='+preview.body.previewToken
 assert.equal((await call(path)).body.copy.text1,'HTTP未儲存驗收');assert.equal((await call(path,'guest')).status,401);assert.equal((await call(path,'editor')).status,404)
 assert.equal((await call('/api/admin/page-editors/home','editor',{...input,action:'publish'})).status,403)
 const stale=structuredClone(input);stale.documents[0].revision--;assert.equal((await call('/api/admin/page-editors/home','admin',stale)).status,409)
 const invalid=structuredClone(input);invalid.documents.find(d=>d.id==='view-components-home-HomeProject').body.copy.text1=42;const issue=await call('/api/admin/page-editors/home','admin',invalid);assert.equal(issue.status,400);assert(issue.body.data.fieldErrors?.length)
 assert.deepEqual((await call('/api/admin/documents')).body,before)
 console.log('PASS: all 28 page reads/previews, real HTTP login, private page APIs, CSRF, unsaved snapshot, preview ownership, editor publish denied, 409 and readable field errors; website documents unchanged')
}
if(process.env.CMS_WORKFLOW_DB==='1'){
 assert.equal(process.env.NUXT_DESIGN_DB_SERVER||'127.0.0.1','127.0.0.1','Write checks require the local database')
 assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE||'SakuraWebsiteDev','SakuraWebsiteDev')
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
  // Only the temporary snapshot is written; content versions remain unchanged.
  await changeWorkspace(project.id,body,user,tx)
  assert.equal((await query('SELECT COUNT(*) n FROM cms.Versions',{},tx)).recordset[0].n,counts.recordset[0].n)
  documents.find(d=>d.id==='data-kitchenStyles').body.KITCHEN_STYLES[0].desc+='（僅限回滾交易驗證）'
  const saved=await changeWorkspace(project.id,{...body,action:'save'},user,tx);assert(saved.documents.some(d=>d.draftId!==d.publishedId))
  const savedInput={action:'publish',documents:saved.documents.map(d=>({id:d.id,revision:d.revision,body:d.body}))}
  await assert.rejects(()=>changeWorkspace(project.id,savedInput,{...user,role:'editor'},tx),e=>e.statusCode===403)
  const published=await changeWorkspace(project.id,savedInput,user,tx);assert(published.documents.every(d=>d.draftId===d.publishedId))
  const current={action:'unpublish',documents:published.documents.map(d=>({id:d.id,revision:d.revision,body:d.body}))}
  const hidden=await changeWorkspace(project.id,current,user,tx);assert(hidden.documents.every(d=>d.publishedId===null))
  await assert.rejects(()=>changeWorkspace(project.id,{...body,action:'save'},user,tx),e=>e.statusCode===409)
  const homepage=pageEditor('home'),homeDocs=[]
  for(const id of homepage.ids){const d=(await query('SELECT d.*,v.body FROM cms.Documents d JOIN cms.Versions v ON v.id=d.draftId WHERE d.id=@id',{id},tx)).recordset[0];homeDocs.push({id,revision:d.revision,body:JSON.parse(d.body)})}
  homeDocs.find(d=>d.id==='view-components-home-HomeHero').body.slides[0].title+='回滾預覽測試'
  homeDocs.find(d=>d.id==='view-components-home-HomeProject').body.copy.text1+='整頁一起儲存'
  const homeInput={action:'preview',documents:homeDocs},versionCount=(await query('SELECT COUNT(*) n FROM cms.Versions',{},tx)).recordset[0].n
  const preview=await changePageEditor('home',homeInput,user,tx);assert(preview.previewToken);assert.equal((await query('SELECT COUNT(*) n FROM cms.Versions',{},tx)).recordset[0].n,versionCount)
  const homeSaved=await changePageEditor('home',{...homeInput,action:'save'},user,tx);assert.equal((await query('SELECT COUNT(*) n FROM cms.Versions',{},tx)).recordset[0].n,versionCount+2,'Only changed documents get new versions')
  const publishHome={action:'publish',documents:homeSaved.documents.map(d=>({id:d.id,revision:d.revision,body:d.body}))}
  await assert.rejects(()=>changePageEditor('home',publishHome,{...user,role:'editor'},tx),e=>e.statusCode===403)
  const homePublished=await changePageEditor('home',publishHome,user,tx);assert(homePublished.documents.every(d=>d.draftId===d.publishedId))
  await assert.rejects(()=>changePageEditor('home',{...homeInput,action:'save'},user,tx),e=>e.statusCode===409)
  console.log('PASS: whole-page preview creates no versions, two modified blocks save atomically, unchanged documents create no versions, editor publish denied and stale page returns 409')
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
 const homeInput=[]
 for(const id of pageEditor('home').ids){const d=(await query('SELECT d.*,v.body FROM cms.Documents d JOIN cms.Versions v ON v.id=d.draftId WHERE d.id=@id',{id})).recordset[0];homeInput.push({id,revision:d.revision,body:JSON.parse(d.body)})}
 const homeOrdered=[...homeInput].sort((a,b)=>a.id.localeCompare(b.id));homeOrdered.find(d=>d.id==='view-components-home-HomeHero').body.slides[0].title+='必須回滾';homeOrdered.at(-1).revision--
 await assert.rejects(()=>changePageEditor('home',{action:'save',documents:homeInput},{id:userId,role:'admin'}),e=>e.statusCode===409)
 assert.equal(await fingerprint(),original,'A later page conflict must undo every earlier page save')
 console.log('PASS: whole-page conflict after earlier writes rolls back all documents and versions')
 await(await database()).close()
}
