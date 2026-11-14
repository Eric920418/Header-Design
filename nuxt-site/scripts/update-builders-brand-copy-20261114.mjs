import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import {database,query,transaction} from '../server/cms/database.mjs'
import {getDocument,changeDocument,validate} from '../server/cms/content.mjs'

const id='view-pages-builders-index'
const changes=[
  ['text11',"打造不同定位與多元風格的理想家居空間","一站式供應，多樣產品選擇，打造不同定位與多元風格的理想家居空間",'Kitchen Designers','品牌選品說明'],
]
function update(original,originalSchema){
  const body=structuredClone(original),schema=structuredClone(originalSchema)
  for(const [key,from,to,oldLabel,label]of changes){
    assert([from,to].includes(body.copy[key]),`${key} 已另行修改，停止以免覆蓋`)
    assert([oldLabel,label].includes(schema.fields.copy.fields[key].label),`${key} 欄位已另行修改`)
    body.copy[key]=to;schema.fields.copy.fields[key].label=label
  }
  const preserved=structuredClone(body),preservedSchema=structuredClone(schema)
  for(const [key]of changes){preserved.copy[key]=original.copy[key];preservedSchema.fields.copy.fields[key].label=originalSchema.fields.copy.fields[key].label}
  assert.deepEqual(preserved,original);assert.deepEqual(preservedSchema,originalSchema);validate(body,schema)
  return {body,schema}
}
const args=process.argv.slice(2);assert(args.every(a=>['--apply','--self-check'].includes(a)))
if(args.includes('--self-check')){
  const seed=JSON.parse(readFileSync(new URL('../shared/cms/seed.json',import.meta.url),'utf8')).find(d=>d.id===id)
  const original=structuredClone(seed.data),schema=structuredClone(seed.schema)
  for(const [key,from,,oldLabel]of changes){original.copy[key]=from;schema.fields.copy.fields[key].label=oldLabel}
  const before=structuredClone({original,schema}),result=update(original,schema)
  assert.deepEqual(result,{body:seed.data,schema:seed.schema});assert.deepEqual({original,schema},before)
  assert.deepEqual(update(result.body,result.schema),result)
  for(const [key]of changes){
    assert.throws(()=>update({...original,copy:{...original.copy,[key]:'自訂內容'}},schema),/另行修改/)
    const custom=structuredClone(schema);custom.fields.copy.fields[key].label='自訂欄位';assert.throws(()=>update(original,custom),/欄位已另行修改/)
  }
  console.log('PASS 僅改品牌選品說明與欄位名稱，主標題／其他內容／輸入不變、重跑及衝突保護')
}else{
  const env=new URL('../../.env.azure-runtime.local',import.meta.url);process.loadEnvFile(env)
  const server=readFileSync(env,'utf8').match(/^NUXT_DESIGN_DB_SERVER=(.+)$/m)?.[1].trim()
  assert(server?.endsWith('.database.windows.net'));assert.equal(process.env.NUXT_DESIGN_DB_SERVER,server)
  assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE,'SakuraWebsiteTest')
  assert.equal(process.env.CMS_DB_USER,'sakura_website_cms');assert.notEqual(process.env.NUXT_DESIGN_DB_TRUST_SERVER_CERTIFICATE,'true')
  try{await transaction(async tx=>{
    const doc=await getDocument(id,tx);assert(doc.publishedId&&doc.draftId===doc.publishedId,'有未發布草稿，停止以免覆蓋')
    const original=JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body)
    const {body,schema}=update(original,JSON.parse(doc.schemaJson));console.log('CHECK',id,'revision',doc.revision)
    if(!args.includes('--apply')||JSON.stringify(body)===JSON.stringify(original)&&JSON.stringify(schema)===doc.schemaJson)return
    const others=(await query('SELECT * FROM cms.Documents WHERE id<>@id ORDER BY id',{id},tx)).recordset
    const history=(await query('SELECT id,documentId,body FROM cms.Versions ORDER BY id',{},tx)).recordset
    const actor=(await query("SELECT id,role FROM cms.Users WHERE email='admin@sakura.local' AND role='admin' AND disabled=0",{},tx)).recordset[0];assert(actor)
    const updated=await query('UPDATE cms.Documents SET schemaJson=@schema WHERE id=@id AND revision=@revision',{id,revision:doc.revision,schema:JSON.stringify(schema)},tx);assert.equal(updated.rowsAffected[0],1)
    const saved=await changeDocument(id,{action:'save',revision:doc.revision,body},actor,tx)
    const published=await changeDocument(id,{action:'publish',revision:saved.revision},actor,tx)
    assert.equal(published.draftId,published.publishedId)
    assert.deepEqual(JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:published.publishedId},tx)).recordset[0].body),body)
    assert.deepEqual((await query('SELECT * FROM cms.Documents WHERE id<>@id ORDER BY id',{id},tx)).recordset,others)
    assert.deepEqual((await query('SELECT id,documentId,body FROM cms.Versions WHERE id<>@id ORDER BY id',{id:published.publishedId},tx)).recordset,history)
    console.log('UPDATED revision',published.revision,'published',published.publishedId,'retained',doc.publishedId)
  })}finally{await(await database()).close()}
}
