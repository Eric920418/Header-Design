import assert from 'node:assert/strict'
import {readFile} from 'node:fs/promises'
import {HOME_HERO_ID,homeHeroSchema,heroImageSource,heroPosition} from '../shared/cms/hero-media.mjs'
import {validate} from '../server/cms/content.mjs'
import {editingSchema} from '../shared/cms/presentation.mjs'

const seed=JSON.parse(await readFile(new URL('../shared/cms/seed.json',import.meta.url),'utf8'))
const original=seed.find(d=>d.id===HOME_HERO_ID),fingerprint=JSON.stringify(original)
const schema=homeHeroSchema(HOME_HERO_ID,original.schema)
validate(original.data,schema)
assert.equal(JSON.stringify(original),fingerprint,'Old content/schema must not be mutated')
assert.deepEqual(homeHeroSchema(HOME_HERO_ID,schema),schema,'Schema upgrade is idempotent')
assert.equal(homeHeroSchema('another-resource',original.schema),original.schema)
assert.equal(heroImageSource(original.data.slides[0],'mobile'),original.data.slides[0].image)
assert.equal(heroPosition(original.data.slides[0],'desktop'),'50% 50%')
assert.equal(heroPosition(original.data.slides[0],'mobile'),'50% 50%')
const body=structuredClone(original.data),slide=body.slides[0]
Object.assign(slide,{mobileImage:'/home-2026/hero/10bn/clever.webp',desktopFocusX:0,desktopFocusY:100,mobileFocusX:70,mobileFocusY:25})
validate(body,schema)
assert.equal(heroImageSource(slide,'desktop'),slide.image)
assert.equal(heroImageSource(slide,'mobile'),slide.mobileImage)
assert.equal(heroPosition(slide,'desktop'),'0% 100%')
assert.equal(heroPosition(slide,'mobile'),'70% 25%')
assert.equal(heroPosition({desktopFocusX:NaN,desktopFocusY:-100},'desktop'),'50% 0%')
for(const key of ['desktopFocusX','desktopFocusY','mobileFocusX','mobileFocusY']){
 const valid=slide[key]
 for(const invalid of [-1,101,NaN,Infinity,'50',null]){
  slide[key]=invalid
  assert.throws(()=>validate(body,schema),error=>error.statusCode===400,`${key} rejects ${invalid}`)
 }
 slide[key]=valid
}
for(const invalid of ['javascript:alert(1)','//evil.test/x.jpg','/../private.jpg','/%2e%2e/private.jpg']){
 slide.mobileImage=invalid
 assert.throws(()=>validate(body,schema),error=>error.statusCode===400)
}
slide.mobileImage=''
validate(body,schema)
assert.equal(heroImageSource(slide,'mobile'),slide.image)
assert.equal(editingSchema(original.schema,HOME_HERO_ID).fields.slides.item.editor,'hero-images')
const api=await readFile(new URL('../server/api/admin/[...path].ts',import.meta.url),'utf8')
const mutations=await readFile(new URL('../server/cms/content.mjs',import.meta.url),'utf8')
assert(api.includes('homeHeroSchema(d.id,JSON.parse(d.schemaJson))'))
assert(mutations.includes('homeHeroSchema(d.id,JSON.parse(d.schemaJson))')&&mutations.includes('await publicationMedia(body,schema)'),'Save/restore/publish must all use the effective schema and check mobile media')
const hero=await readFile(new URL('../components/home/HomeHero.vue',import.meta.url),'utf8')
assert.equal((hero.match(/<HomeHeroImage/g)||[]).length,4,'Both animation layers, previous slide and preload use responsive images')
const globals=await readFile(new URL('../../src/styles/globals.css',import.meta.url),'utf8')
assert.equal((globals.match(/translate3d\(var\(--hero-pan-x, -4%\), 0, 0\)/g)||[]).length,2,'Active keyframe and settled image must share a direction, defaulting left for other heroes')
const panBindings=[...hero.matchAll(/:style="\{ '--hero-pan-x': ([^"]+) \}"/g)].map(m=>m[1])
assert.equal(panBindings.length,2,'Active layers and previous image need independent directions')
for(const active of [0,1,2,3,8,9,0]){
 const previous=(active+9)%10
 const values=panBindings.map(expression=>new Function('activeSlide','previousSlide','return '+expression)(active,previous))
 assert.deepEqual(values,[active%2===0?'-4%':'4%',previous%2===0?'-4%':'4%'],'First/third images left, second/fourth right; 10→1 keeps outgoing direction')
}
const fields=await readFile(new URL('../components/admin/AdminFields.vue',import.meta.url),'utf8')
assert(fields.includes("'--hero-pan-x': Number(path?.split('.').at(-1)) % 2 === 1 ? '4%' : '-4%'"),'CMS end-frame crop preview must follow the same row direction')
for(const t of [0,.25,.5,.75,1]){
 const scale=1.06+.1*t,pan=.04*t*scale
 assert(pan<=(scale-1)/2,'Both directions must retain enough scaled overscan to cover image edges')
}
assert(globals.includes('.hero-page1-image-settled { transform: none !important; animation: none !important; }'),'Reduced motion must still disable scale and panning')
console.log('PASS homepage alternating pan, outgoing direction at wrap, CMS crop parity, overscan and reduced-motion guards')
console.log('PASS: old versions, optional mobile fallback, independent crop positions, range/media rejection, immutable schema and save/restore/publish integration (no database writes)')

if(process.env.CMS_HERO_DB_CHECK==='1'){
 assert(['127.0.0.1','localhost'].includes(process.env.NUXT_DESIGN_DB_SERVER||'127.0.0.1'))
 assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE||'SakuraWebsiteDev','SakuraWebsiteDev','Local acceptance database only')
 const {database,query,sql,digest}=await import('../server/cms/database.mjs')
 const {changeDocument,getDocument}=await import('../server/cms/content.mjs')
 const db=await database(),tx=new sql.Transaction(db)
 const snapshot=async()=>digest(JSON.stringify({documents:(await query('SELECT * FROM cms.Documents ORDER BY id')).recordset,versions:(await query('SELECT * FROM cms.Versions ORDER BY id')).recordset,refs:(await query('SELECT * FROM cms.MediaRefs ORDER BY mediaId,versionId')).recordset}))
 try{
  const before=await snapshot()
  await tx.begin(sql.ISOLATION_LEVEL.SERIALIZABLE)
  try{
   const d=await getDocument(HOME_HERO_ID,tx),user=(await query("SELECT TOP(1) id,role FROM cms.Users WHERE role='admin' AND disabled=0",{},tx)).recordset[0]
   assert(user,'Local administrator needed for transaction test')
   const old=JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:d.draftId},tx)).recordset[0].body)
   const next=structuredClone(old)
   Object.assign(next.slides[0],{mobileImage:'/home-2026/hero/10bn/clever.webp',desktopFocusX:20,desktopFocusY:40,mobileFocusX:80,mobileFocusY:10})
   let r=await changeDocument(d.id,{action:'save',revision:d.revision,body:next},user,tx)
   assert.deepEqual(JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:r.draftId},tx)).recordset[0].body),next)
   assert.equal(r.publishedId,d.publishedId,'Saving a draft must not change the website')
   await assert.rejects(()=>changeDocument(d.id,{action:'save',revision:d.revision,body:old},user,tx),e=>e.statusCode===409)
   r=await changeDocument(d.id,{action:'publish',revision:r.revision},user,tx)
   assert.equal(r.publishedId,r.draftId)
   r=await changeDocument(d.id,{action:'restore',revision:r.revision,version:d.draftId},user,tx)
   assert.deepEqual(JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:r.draftId},tx)).recordset[0].body),old)
   next.slides[0].mobileImage='/missing-mobile-hero-acceptance.webp'
   r=await changeDocument(d.id,{action:'save',revision:r.revision,body:next},user,tx)
   await assert.rejects(()=>changeDocument(d.id,{action:'publish',revision:r.revision},user,tx),e=>e.statusCode===400&&/mobileImage/.test(e.message))
  }finally{await tx.rollback()}
  assert.equal(await snapshot(),before,'All documents, versions and media references must be unchanged after rollback')
  console.log('PASS local SQL transaction: save persists fields, draft isolation, publish, historical restore, 409, missing mobile media rejected; ROLLBACK verified, no content changes retained')
 }finally{await db.close()}
}
