import assert from 'node:assert/strict'
import {readFile} from 'node:fs/promises'
import {HOME_GALLERY_ID,homeGallerySchema,customCasesSchema,galleryCaseRoute,galleryCaseLabel,galleryCaseEntry} from '../shared/cms/gallery-cases.mjs'
import {publicContent} from '../shared/cms/public-content.mjs'
import {changeDocument,validate} from '../server/cms/content.mjs'
import {validateGalleryCases} from '../server/cms/case-library.mjs'
import {editingSchema} from '../shared/cms/presentation.mjs'
const seed=JSON.parse(await readFile(new URL('../shared/cms/seed.json',import.meta.url),'utf8'))
const original=seed.find(d=>d.id===HOME_GALLERY_ID),before=JSON.stringify(original)
const schema=homeGallerySchema(HOME_GALLERY_ID,original.schema)
validate(original.data,schema)
assert.equal(JSON.stringify(original),before)
assert.deepEqual(homeGallerySchema(HOME_GALLERY_ID,schema),schema)
assert.equal(homeGallerySchema('other',original.schema),original.schema)
assert.equal(editingSchema(original.schema,HOME_GALLERY_ID).fields.cases.editor,'home-cases')
assert.equal(editingSchema(original.schema,HOME_GALLERY_ID).fields.cases.label,'輪播案例')
const library=original.data.cases.map(i=>({...i,title:'門市案例',route:galleryCaseRoute(i),source:'門市案例'}))
validateGalleryCases(original.data.cases,library)
assert.equal(galleryCaseLabel(library[0]),'安康店')
assert.equal(galleryCaseRoute(original.data.cases[0]),'/gallery/case10')
const option={slug:'11111111-1111-1111-1111-111111111111',store:'',title:'來源案例',image:'/image.webp',route:'/design-inspiration/11111111-1111-1111-1111-111111111111',source:'來源案例'}
const entry=galleryCaseEntry(option),body=structuredClone(original.data)
assert(!Object.hasOwn(entry,'source'))
assert.equal(galleryCaseLabel(entry),'來源案例')
assert.equal(galleryCaseLabel({store:'  安康店  ',title:'案例名稱',slug:'case10'}),'安康店')
assert.equal(galleryCaseLabel({store:'   ',title:'  案例名稱  ',slug:'case10'}),'案例名稱')
assert.equal(galleryCaseLabel({store:'',title:'  ',slug:'case10'}),'case10')
assert.equal(galleryCaseRoute({slug:entry.slug}),entry.route)
body.cases.push(entry);validate(body,schema);validateGalleryCases(body.cases,[...library,option])
assert.throws(()=>validate({...body,cases:[...body.cases,entry]},schema),e=>e.statusCode===400)
assert.throws(()=>validateGalleryCases([entry],library),e=>e.statusCode===400)
assert.throws(()=>validateGalleryCases([{...entry,route:'/builders'}],[option]),e=>e.statusCode===400)
assert.throws(()=>validateGalleryCases([{...entry,image:''}],[option]),e=>e.statusCode===400)
assert.throws(()=>validate({...body,cases:[{...entry,route:'javascript:alert(1)'}]},schema),e=>e.statusCode===400)
const customSeed=seed.find(d=>d.id==='custom-cases'),customBefore=JSON.stringify(customSeed),customSchema=customCasesSchema(customSeed.id,customSeed.schema)
assert.equal(JSON.stringify(customSeed),customBefore);assert.equal(customCasesSchema('other',customSeed.schema),customSeed.schema);assert.deepEqual(customCasesSchema(customSeed.id,customSchema),customSchema)
assert.equal(editingSchema(customSchema,'custom-cases').fields.items.item.fields.title.label,'案例標題')
const oldCase={...customSeed.schema.fields.items.template,id:'11111111-1111-4111-8111-111111111111'},caseBody={items:[oldCase,{...oldCase,id:'22222222-2222-4222-8222-222222222222',enabled:false},{...oldCase,id:'33333333-3333-4333-8333-333333333333',enabled:true}]},caseSnapshot=JSON.stringify(caseBody)
validate(caseBody,customSchema);assert.deepEqual(publicContent('custom-cases',caseBody).items.map(i=>i.id),[oldCase.id,caseBody.items[2].id]);assert.equal(JSON.stringify(caseBody),caseSnapshot)
assert.throws(()=>validate({items:[{...oldCase,enabled:'false'}]},customSchema),e=>e.statusCode===400)
for(const action of ['save','publish','unpublish','restore'])await assert.rejects(
 ()=>changeDocument(' CATALOG-CASES ',{action},{role:'admin'}),
 e=>e.statusCode===403&&/原系統/.test(e.message),
)
console.log('PASS legacy cases, schema compatibility, automatic fields, case labels/routes, duplicate/missing/unpublished/wrong-link/media validation (no database writes)')

if(process.env.CMS_GALLERY_DB_CHECK==='1'){
 assert(['127.0.0.1','localhost'].includes(process.env.NUXT_DESIGN_DB_SERVER||'127.0.0.1'))
 assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE||'SakuraWebsiteDev','SakuraWebsiteDev')
 const {database,query,sql,digest,randomUUID}=await import('../server/cms/database.mjs')
 const {getDocument}=await import('../server/cms/content.mjs')
 const {caseLibrary}=await import('../server/cms/case-library.mjs')
 const db=await database(),tx=new sql.Transaction(db)
 const snapshot=async()=>digest(JSON.stringify({docs:(await query('SELECT * FROM cms.Documents ORDER BY id')).recordset,versions:(await query('SELECT * FROM cms.Versions ORDER BY id')).recordset,refs:(await query('SELECT * FROM cms.MediaRefs ORDER BY mediaId,versionId')).recordset,source:(await query('SELECT * FROM sync.DesignCloudCases ORDER BY id')).recordset}))
 try{
  const fingerprint=await snapshot();await tx.begin(sql.ISOLATION_LEVEL.SERIALIZABLE)
  try{
   const user=(await query("SELECT TOP(1) id,role FROM cms.Users WHERE role='admin' AND disabled=0",{},tx)).recordset[0]
   assert(user)
   const custom=await getDocument('custom-cases',tx),gallery=await getDocument(HOME_GALLERY_ID,tx)
   const versionBody=async id=>JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id},tx)).recordset[0].body)
   const customBody=await versionBody(custom.draftId),oldGallery=await versionBody(gallery.draftId)
   const sample={id:randomUUID(),title:'案例選取驗收',description:'交易回滾測試',cover:'/home-2026/hero/10bn/aikitchen.webp',images:['/home-2026/hero/10bn/aikitchen.webp'],form:'一字型',style:'現代風',specs:[]}
   customBody.items.push(sample)
   let c=await changeDocument(custom.id,{action:'save',revision:custom.revision,body:customBody},user,tx)
   assert(!(await caseLibrary(tx)).some(i=>i.slug===sample.id),'Draft cases must not be available')
   c=await changeDocument(custom.id,{action:'publish',revision:c.revision},user,tx)
   const available=await caseLibrary(tx),selected=available.find(i=>i.slug===sample.id)
   assert(selected);assert.equal(selected.store,'','Do not invent a store name')
   assert(available.some(i=>i.slug==='case10'&&i.store.includes('安康')))
   const next=structuredClone(oldGallery);next.cases.push(galleryCaseEntry(selected))
   let g=await changeDocument(gallery.id,{action:'save',revision:gallery.revision,body:next},user,tx)
   assert.equal(g.publishedId,gallery.publishedId)
   assert.deepEqual(await versionBody(g.draftId),next)
   await assert.rejects(()=>changeDocument(gallery.id,{action:'save',revision:gallery.revision,body:next},user,tx),e=>e.statusCode===409)
   g=await changeDocument(gallery.id,{action:'publish',revision:g.revision},user,tx)
   assert.equal(g.publishedId,g.draftId)
   next.cases.at(-1).route='/builders'
   g=await changeDocument(gallery.id,{action:'save',revision:g.revision,body:next},user,tx)
   await assert.rejects(()=>changeDocument(gallery.id,{action:'publish',revision:g.revision},user,tx),e=>e.statusCode===400&&/連結/.test(e.message))
   g=await changeDocument(gallery.id,{action:'restore',revision:g.revision,version:gallery.draftId},user,tx)
   assert.deepEqual(await versionBody(g.draftId),oldGallery)
   customBody.items.find(i=>i.id===sample.id).enabled=false
   c=await changeDocument(custom.id,{action:'save',revision:c.revision,body:customBody},user,tx)
   assert((await caseLibrary(tx)).some(i=>i.slug===sample.id),'A visibility draft must not change the published library')
   c=await changeDocument(custom.id,{action:'publish',revision:c.revision},user,tx)
   assert(!(await caseLibrary(tx)).some(i=>i.slug===sample.id),'An individually hidden case must leave the published library')
   assert(!publicContent(custom.id,await versionBody(c.publishedId)).items.some(i=>i.id===sample.id))
   customBody.items.find(i=>i.id===sample.id).enabled=true
   c=await changeDocument(custom.id,{action:'save',revision:c.revision,body:customBody},user,tx)
   c=await changeDocument(custom.id,{action:'publish',revision:c.revision},user,tx)
   assert((await caseLibrary(tx)).some(i=>i.slug===sample.id),'A case can return without changing its identity')
   await changeDocument(custom.id,{action:'unpublish',revision:c.revision},user,tx)
   assert(!(await caseLibrary(tx)).some(i=>i.slug===sample.id))
   assert.throws(()=>validateGalleryCases([galleryCaseEntry(selected)],[]),e=>e.statusCode===400)
   const policy=await getDocument('catalog-cases',tx)
   const publishedPolicy=await versionBody(policy.publishedId)
   assert(available.some(i=>i.source==='來源案例'),'Previously published source cases remain available to the home picker')
   for(const item of publishedPolicy.items.filter(i=>!i.enabled))assert(!available.some(i=>i.slug===item.id),'Previously disabled source cases must remain hidden')
  }finally{await tx.rollback()}
  assert.equal(await snapshot(),fingerprint)
  console.log('PASS local SQL: published-only library, source policy, real auto-fill, save/publish, 409, invalid-link rejection and historical restore; all documents/versions/references/source rows unchanged after ROLLBACK')
 }finally{await db.close()}
}
