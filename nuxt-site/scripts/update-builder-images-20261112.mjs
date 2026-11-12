import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import {database,query,transaction} from '../server/cms/database.mjs'
import {getDocument,changeDocument,validate} from '../server/cms/content.mjs'

const names=['design-modules.webp','ai-factory.webp','project-platform.webp']
const prefix='/section-6/builders/'
function update(original){
  assert.equal(original.strengths.length,3)
  const body=structuredClone(original)
  body.strengths.forEach((item,i)=>{
    assert([prefix+'proposal-20261002/'+names[i],prefix+'revision-20261030/'+names[i]].includes(item.background),'圖片已由他人修改，停止以免覆蓋')
    item.background=prefix+'revision-20261030/'+names[i]
  })
  const preserved=structuredClone(body)
  preserved.strengths.forEach((item,i)=>{item.background=original.strengths[i].background})
  assert.deepEqual(preserved,original,'只能更新三個圖片連結')
  return body
}
const args=process.argv.slice(2)
assert(args.every(arg=>['--apply','--self-check'].includes(arg)))
if(args.includes('--self-check')){
  const original={strengths:names.map(name=>({background:prefix+'proposal-20261002/'+name,value:['45','萬']})),copy:{unchanged:true}}
  const snapshot=structuredClone(original),body=update(original)
  assert.deepEqual(original,snapshot);assert.deepEqual(update(body),body)
  assert.throws(()=>update({...original,strengths:[...original.strengths.slice(0,2),{background:'/custom.jpg'}]}))
  console.log('PASS 三圖精準替換、保留其他欄位、不修改原物件、重跑無變更、自訂來源拒絕')
}else{
  const env=new URL('../../.env.azure-runtime.local',import.meta.url)
  process.loadEnvFile(env)
  const server=readFileSync(env,'utf8').match(/^NUXT_DESIGN_DB_SERVER=(.+)$/m)?.[1].trim()
  assert(server?.endsWith('.database.windows.net'));assert.equal(process.env.NUXT_DESIGN_DB_SERVER,server)
  assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE,'SakuraWebsiteTest')
  assert.equal(process.env.CMS_DB_USER,'sakura_website_cms');assert.notEqual(process.env.NUXT_DESIGN_DB_TRUST_SERVER_CERTIFICATE,'true')
  try{await transaction(async tx=>{
    const doc=await getDocument('view-pages-builders-index',tx)
    assert(doc.publishedId&&doc.draftId===doc.publishedId,'有未發布草稿，停止')
    const original=JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body)
    const body=update(original);validate(body,JSON.parse(doc.schemaJson))
    console.log('CHECK production builders images revision',doc.revision)
    if(!args.includes('--apply')||JSON.stringify(original)===JSON.stringify(body))return
    const others=(await query('SELECT * FROM cms.Documents WHERE id<>@id ORDER BY id',{id:doc.id},tx)).recordset
    const history=(await query('SELECT id,documentId,body FROM cms.Versions ORDER BY id',{},tx)).recordset
    const actor=(await query("SELECT id,role FROM cms.Users WHERE email='admin@sakura.local' AND role='admin' AND disabled=0",{},tx)).recordset[0];assert(actor)
    const saved=await changeDocument(doc.id,{action:'save',revision:doc.revision,body},actor,tx)
    const published=await changeDocument(doc.id,{action:'publish',revision:saved.revision},actor,tx)
    assert.equal(published.draftId,published.publishedId)
    assert.deepEqual(JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:published.publishedId},tx)).recordset[0].body),body)
    assert.deepEqual((await query('SELECT * FROM cms.Documents WHERE id<>@id ORDER BY id',{id:doc.id},tx)).recordset,others)
    assert.deepEqual((await query('SELECT id,documentId,body FROM cms.Versions WHERE id<>@id ORDER BY id',{id:published.publishedId},tx)).recordset,history)
    console.log('UPDATED production builders images revision',published.revision,'published',published.publishedId,'retained',doc.publishedId)
  })}finally{await(await database()).close()}
}
