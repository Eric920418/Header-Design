import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import {database,query,transaction} from '../server/cms/database.mjs'
import {getDocument,changeDocument,validate} from '../server/cms/content.mjs'

const ids=['basic-plus','clever','ipremium','joyful','premium','harmony','loft-chic','elegant']
function update(original){
  assert.deepEqual(original.KITCHEN_CATALOGUES.map(item=>item.id).sort(),[...ids].sort(),'型錄清單已另行修改，停止以免覆蓋')
  const body=structuredClone(original)
  for(const item of body.KITCHEN_CATALOGUES){
    assert(['系列產品型錄','品牌系列型錄'].includes(item.description),'描述已自訂，停止以免覆蓋')
    item.description='品牌系列型錄'
  }
  const preserved=structuredClone(body)
  preserved.KITCHEN_CATALOGUES.forEach((item,i)=>{item.description=original.KITCHEN_CATALOGUES[i].description})
  assert.deepEqual(preserved,original,'只能更新八個description欄位')
  return body
}
const args=process.argv.slice(2)
assert(args.every(arg=>['--apply','--self-check'].includes(arg)))
if(args.includes('--self-check')){
  const seed=JSON.parse(readFileSync(new URL('../shared/cms/seed.json',import.meta.url),'utf8')).find(item=>item.id==='data-catalogues').data
  const original=structuredClone(seed)
  original.KITCHEN_CATALOGUES.forEach(item=>{item.description='系列產品型錄'})
  const before=structuredClone(original),body=update(original)
  assert.deepEqual(original,before);assert.deepEqual(body,seed);assert.deepEqual(update(body),body)
  const custom=structuredClone(original);custom.KITCHEN_CATALOGUES[0].description='後台自訂描述'
  assert.throws(()=>update(custom),/已自訂/)
  assert.throws(()=>update({KITCHEN_CATALOGUES:original.KITCHEN_CATALOGUES.slice(1)}),/清單已另行修改/)
  console.log('PASS 八筆限定替換、其餘資料保留、原輸入不變、可重跑及衝突保護')
}else{
  const env=new URL('../../.env.azure-runtime.local',import.meta.url)
  process.loadEnvFile(env)
  const server=readFileSync(env,'utf8').match(/^NUXT_DESIGN_DB_SERVER=(.+)$/m)?.[1].trim()
  assert(server?.endsWith('.database.windows.net'));assert.equal(process.env.NUXT_DESIGN_DB_SERVER,server)
  assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE,'SakuraWebsiteTest')
  assert.equal(process.env.CMS_DB_USER,'sakura_website_cms');assert.notEqual(process.env.NUXT_DESIGN_DB_TRUST_SERVER_CERTIFICATE,'true')
  try{await transaction(async tx=>{
    const doc=await getDocument('data-catalogues',tx)
    assert(doc.publishedId&&doc.draftId===doc.publishedId,'有未發布草稿，停止以免覆蓋')
    const original=JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body)
    const body=update(original);validate(body,JSON.parse(doc.schemaJson))
    console.log('CHECK production catalogue descriptions revision',doc.revision,'items',body.KITCHEN_CATALOGUES.length)
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
    console.log('UPDATED production catalogue descriptions revision',published.revision,'published',published.publishedId,'retained',doc.publishedId)
  })}finally{await(await database()).close()}
}
