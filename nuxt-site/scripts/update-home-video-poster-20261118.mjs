import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import {createHash} from 'node:crypto'
import {database,query,transaction} from '../server/cms/database.mjs'
import {getDocument,changeDocument,validate} from '../server/cms/content.mjs'

const visualsId='site-visuals',homeId='view-components-home-HomeWhatWeDo'
const poster='/home-2026/brand-commitment-family-20261118.webp'
const changes={
  [visualsId]:['images','asset_10b5a86c','/section-3/service-process/video/service-guide-2027-20261027-poster.webp',poster],
  [homeId]:['copy','field10','SAKURA 整體廚房導購影片：服務人員協助顧客挑選理想廚房','SAKURA 整體廚房導購影片：一家人在白色廚房中料理'],
}
function update(id,original,schema){
  const change=changes[id];assert(change,'僅允許更新首頁封面及圖片說明')
  const [section,key,oldValue,newValue]=change,body=structuredClone(original)
  assert([oldValue,newValue].includes(body[section][key]),`${id}.${key} 已另行設定，停止以免覆蓋`)
  body[section][key]=newValue
  const preserved=structuredClone(body);preserved[section][key]=original[section][key]
  assert.deepEqual(preserved,original);validate(body,schema)
  return body
}
const args=process.argv.slice(2);assert(args.every(a=>['--self-check','--apply'].includes(a)))
for(const [path,hash]of [
  [poster,'7f285b8b7d97d46ff04006aaf9f11860e135595c3c368b433db9c96515af86ca'],
  ['/section-3/service-process/video/service-guide-2027-20261027-poster.webp','283328a07f30af0fca7e32a2eb6aa998a316f8419c313ae37bf70b99eed67a38'],
  ['/section-3/service-process/video/service-guide-2027-20261027.mp4','d2e9af6351decb2cf3e7ba36b8f86874cb93237caffe6b734bab9b2502b0f789'],
])assert.equal(createHash('sha256').update(readFileSync(new URL('../../public'+path,import.meta.url))).digest('hex'),hash,'首頁封面／保留的服務封面或影片與核對版本不同')
if(args.includes('--self-check')){
  const seed=JSON.parse(readFileSync(new URL('../shared/cms/seed.json',import.meta.url),'utf8'))
  for(const [id,[section,key,oldValue]]of Object.entries(changes)){
    const expected=seed.find(d=>d.id===id),original=structuredClone(expected.data),schema=structuredClone(expected.schema)
    original[section][key]=oldValue
    const before=structuredClone({original,schema}),result=update(id,original,schema)
    assert.deepEqual(result,expected.data);assert.deepEqual({original,schema},before)
    assert.deepEqual(update(id,result,schema),result)
    const custom=structuredClone(original);custom[section][key]='自訂內容'
    assert.throws(()=>update(id,custom,schema),/另行設定/)
    if(id===visualsId)for(const field of ['serviceVideoCover','serviceVideoSrc','brandVideoSrc','pavilionVideoId'])assert.equal(result[field],original[field])
  }
  assert.throws(()=>update('view-pages-service-process',{},{}),/僅允許/)
  console.log('PASS 首頁新封面及服務舊封面／影片 SHA256、兩欄位限定、輸入及其他內容不變、重跑與自訂內容保護')
}else{
  const env=new URL('../../.env.azure-runtime.local',import.meta.url);process.loadEnvFile(env)
  const server=readFileSync(env,'utf8').match(/^NUXT_DESIGN_DB_SERVER=(.+)$/m)?.[1].trim()
  assert(server?.endsWith('.database.windows.net'));assert.equal(process.env.NUXT_DESIGN_DB_SERVER,server)
  assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE,'SakuraWebsiteTest')
  assert.equal(process.env.CMS_DB_USER,'sakura_website_cms');assert.notEqual(process.env.NUXT_DESIGN_DB_TRUST_SERVER_CERTIFICATE,'true')
  try{await transaction(async tx=>{
    const documents=[]
    for(const id of Object.keys(changes)){
      const doc=await getDocument(id,tx);assert(doc.publishedId&&doc.draftId===doc.publishedId,'有未發布草稿，停止以免覆蓋')
      const original=JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body)
      documents.push({doc,original,body:update(id,original,JSON.parse(doc.schemaJson))})
      console.log('CHECK',id,'revision',doc.revision)
    }
    if(!args.includes('--apply'))return
    const params={visuals:visualsId,home:homeId}
    const others=(await query('SELECT * FROM cms.Documents WHERE id NOT IN (@visuals,@home) ORDER BY id',params,tx)).recordset
    const history=(await query('SELECT id,documentId,body FROM cms.Versions ORDER BY id',{},tx)).recordset
    const actor=(await query("SELECT id,role FROM cms.Users WHERE email='admin@sakura.local' AND role='admin' AND disabled=0",{},tx)).recordset[0];assert(actor)
    const added=[]
    for(const {doc,original,body}of documents){
      if(JSON.stringify(body)===JSON.stringify(original))continue
      const saved=await changeDocument(doc.id,{action:'save',revision:doc.revision,body},actor,tx)
      const published=await changeDocument(doc.id,{action:'publish',revision:saved.revision},actor,tx)
      assert.equal(published.draftId,published.publishedId);added.push(published.publishedId)
      assert.deepEqual(JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:published.publishedId},tx)).recordset[0].body),body)
      const after=await getDocument(doc.id,tx);assert.equal(after.schemaJson,doc.schemaJson)
      console.log('UPDATED',doc.id,'revision',published.revision,'published',published.publishedId,'retained',doc.publishedId)
    }
    assert.deepEqual((await query('SELECT * FROM cms.Documents WHERE id NOT IN (@visuals,@home) ORDER BY id',params,tx)).recordset,others)
    assert.deepEqual((await query('SELECT id,documentId,body FROM cms.Versions ORDER BY id',{},tx)).recordset.filter(v=>!added.includes(v.id)),history)
  })}finally{await(await database()).close()}
}
