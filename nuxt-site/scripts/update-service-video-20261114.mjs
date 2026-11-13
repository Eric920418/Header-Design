import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import {createHash} from 'node:crypto'
import {database,query,transaction} from '../server/cms/database.mjs'
import {getDocument,changeDocument,validate} from '../server/cms/content.mjs'

const src='/section-3/service-process/video/service-guide-2027-20261027.mp4'
const field={type:'string',format:'url',label:'服務流程影片網址（MP4）'}
function update(original,originalSchema){
  assert(!Object.hasOwn(original,'serviceVideoSrc')||original.serviceVideoSrc===src,'服務影片已另行設定，停止以免覆蓋')
  if(originalSchema.fields.serviceVideoSrc)assert.deepEqual(originalSchema.fields.serviceVideoSrc,field,'影片欄位已自訂，停止以免覆蓋')
  const body={...structuredClone(original),serviceVideoSrc:src},schema=structuredClone(originalSchema)
  schema.fields.serviceVideoSrc=field
  const preservedBody=structuredClone(body),preservedSchema=structuredClone(schema)
  if(Object.hasOwn(original,'serviceVideoSrc'))preservedBody.serviceVideoSrc=original.serviceVideoSrc
  else delete preservedBody.serviceVideoSrc
  if(originalSchema.fields.serviceVideoSrc)preservedSchema.fields.serviceVideoSrc=originalSchema.fields.serviceVideoSrc
  else delete preservedSchema.fields.serviceVideoSrc
  assert.deepEqual(preservedBody,original);assert.deepEqual(preservedSchema,originalSchema)
  validate(body,schema)
  return {body,schema}
}
const args=process.argv.slice(2)
assert(args.every(arg=>['--apply','--self-check'].includes(arg)))
assert.equal(createHash('sha256').update(readFileSync(new URL('../../public'+src,import.meta.url))).digest('hex'),'d2e9af6351decb2cf3e7ba36b8f86874cb93237caffe6b734bab9b2502b0f789','影片檔案與已驗證版本不同')
if(args.includes('--self-check')){
  const seed=JSON.parse(readFileSync(new URL('../shared/cms/seed.json',import.meta.url),'utf8')).find(d=>d.id==='site-visuals')
  const original=structuredClone(seed.data),schema=structuredClone(seed.schema)
  delete original.serviceVideoSrc;delete schema.fields.serviceVideoSrc
  const before=structuredClone({original,schema}),result=update(original,schema)
  assert.deepEqual({original,schema},before);assert.deepEqual(result,{body:seed.data,schema:seed.schema})
  assert.deepEqual(update(result.body,result.schema),result)
  assert.throws(()=>update({...original,serviceVideoSrc:'https://example.com/custom.mp4'},schema),/已另行設定/)
  assert.throws(()=>update(original,{...schema,fields:{...schema.fields,serviceVideoSrc:{type:'string'}}}),/欄位已自訂/)
  console.log('PASS 影片 SHA256、僅新增來源與欄位、原資料不變、重跑及自訂內容衝突保護')
}else{
  const env=new URL('../../.env.azure-runtime.local',import.meta.url)
  process.loadEnvFile(env)
  const server=readFileSync(env,'utf8').match(/^NUXT_DESIGN_DB_SERVER=(.+)$/m)?.[1].trim()
  assert(server?.endsWith('.database.windows.net'));assert.equal(process.env.NUXT_DESIGN_DB_SERVER,server)
  assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE,'SakuraWebsiteTest')
  assert.equal(process.env.CMS_DB_USER,'sakura_website_cms');assert.notEqual(process.env.NUXT_DESIGN_DB_TRUST_SERVER_CERTIFICATE,'true')
  try{await transaction(async tx=>{
    const doc=await getDocument('site-visuals',tx)
    assert(doc.publishedId&&doc.draftId===doc.publishedId,'有未發布草稿，停止以免覆蓋')
    const original=JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body)
    const {body,schema}=update(original,JSON.parse(doc.schemaJson))
    console.log('CHECK production service video revision',doc.revision)
    if(!args.includes('--apply')||JSON.stringify(body)===JSON.stringify(original)&&JSON.stringify(schema)===doc.schemaJson)return
    const others=(await query('SELECT * FROM cms.Documents WHERE id<>@id ORDER BY id',{id:doc.id},tx)).recordset
    const history=(await query('SELECT id,documentId,body FROM cms.Versions ORDER BY id',{},tx)).recordset
    const actor=(await query("SELECT id,role FROM cms.Users WHERE email='admin@sakura.local' AND role='admin' AND disabled=0",{},tx)).recordset[0];assert(actor)
    const updated=await query('UPDATE cms.Documents SET schemaJson=@schema WHERE id=@id AND revision=@revision',{id:doc.id,revision:doc.revision,schema:JSON.stringify(schema)},tx);assert.equal(updated.rowsAffected[0],1)
    const saved=await changeDocument(doc.id,{action:'save',revision:doc.revision,body},actor,tx)
    const published=await changeDocument(doc.id,{action:'publish',revision:saved.revision},actor,tx)
    assert.equal(published.draftId,published.publishedId)
    assert.deepEqual(JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:published.publishedId},tx)).recordset[0].body),body)
    assert.deepEqual((await query('SELECT * FROM cms.Documents WHERE id<>@id ORDER BY id',{id:doc.id},tx)).recordset,others)
    assert.deepEqual((await query('SELECT id,documentId,body FROM cms.Versions WHERE id<>@id ORDER BY id',{id:published.publishedId},tx)).recordset,history)
    console.log('UPDATED production service video revision',published.revision,'published',published.publishedId,'retained',doc.publishedId)
  })}finally{await(await database()).close()}
}
