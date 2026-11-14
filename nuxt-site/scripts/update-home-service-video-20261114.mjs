import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import {createHash} from 'node:crypto'
import {database,query,transaction} from '../server/cms/database.mjs'
import {getDocument,changeDocument,validate} from '../server/cms/content.mjs'

const visualsId='site-visuals',homeId='view-components-home-HomeWhatWeDo',serviceId='view-pages-service-process'
const ids=[visualsId,homeId,serviceId]
const video='/section-3/service-process/video/service-guide-2027-20261027.mp4'
const poster='/section-3/service-process/video/service-guide-2027-20261027-poster.webp'
const alt='SAKURA 整體廚房導購影片：服務人員協助顧客挑選理想廚房'
const fields={
  brandVideoSrc:{type:'string',format:'url',label:'首頁品牌承諾影片網址（MP4）'},
  serviceVideoCover:{type:'string',format:'media',label:'服務流程影片封面'},
}
const changes={
  [homeId]:{field10:['SAKURA 品牌承諾影片開場畫面：兩位女性手持食材紙袋',alt]},
  [serviceId]:{field7:['SAKURA 整體廚房品牌影片封面',alt]},
}
function update(id,original,originalSchema){
  const body=structuredClone(original),schema=structuredClone(originalSchema)
  if(id===visualsId){
    for(const [key,value]of Object.entries({brandVideoSrc:video,serviceVideoCover:poster})){
      assert(!Object.hasOwn(body,key)||body[key]===value,`${key} 已另行設定，停止以免覆蓋`)
      if(schema.fields[key])assert.deepEqual(schema.fields[key],fields[key],'影片欄位已自訂，停止以免覆蓋')
      body[key]=value;schema.fields[key]=fields[key]
    }
    assert(['/home-2026/brand-commitment-opening-frame.webp',poster].includes(body.images.asset_10b5a86c),'首頁封面已另行設定，停止以免覆蓋')
    body.images.asset_10b5a86c=poster
    const preserved=structuredClone(body),preservedSchema=structuredClone(schema)
    for(const key of Object.keys(fields)){
      if(Object.hasOwn(original,key))preserved[key]=original[key];else delete preserved[key]
      if(originalSchema.fields[key])preservedSchema.fields[key]=originalSchema.fields[key];else delete preservedSchema.fields[key]
    }
    preserved.images.asset_10b5a86c=original.images.asset_10b5a86c
    assert.deepEqual(preserved,original);assert.deepEqual(preservedSchema,originalSchema)
  }else{
    assert(changes[id])
    for(const [key,[oldValue,newValue]]of Object.entries(changes[id])){
      assert([oldValue,newValue].includes(body.copy[key]),`${key} 已另行設定，停止以免覆蓋`)
      body.copy[key]=newValue
    }
    const preserved=structuredClone(body)
    for(const key of Object.keys(changes[id]))preserved.copy[key]=original.copy[key]
    assert.deepEqual(preserved,original);assert.deepEqual(schema,originalSchema)
  }
  validate(body,schema)
  return {body,schema}
}
const args=process.argv.slice(2)
assert(args.every(a=>['--self-check','--apply'].includes(a)))
assert.equal(createHash('sha256').update(readFileSync(new URL('../../public'+video,import.meta.url))).digest('hex'),'d2e9af6351decb2cf3e7ba36b8f86874cb93237caffe6b734bab9b2502b0f789','影片必須為已核對的指定新片')
assert.equal(createHash('sha256').update(readFileSync(new URL('../../public'+poster,import.meta.url))).digest('hex'),'283328a07f30af0fca7e32a2eb6aa998a316f8419c313ae37bf70b99eed67a38','影片封面與驗證版本不同')
if(args.includes('--self-check')){
  const seed=JSON.parse(readFileSync(new URL('../shared/cms/seed.json',import.meta.url),'utf8'))
  for(const id of ids){
    const expected=seed.find(d=>d.id===id),original=structuredClone(expected.data),schema=structuredClone(expected.schema)
    if(id===visualsId){
      for(const key of Object.keys(fields)){delete original[key];delete schema.fields[key]}
      original.images.asset_10b5a86c='/home-2026/brand-commitment-opening-frame.webp'
    }else for(const [key,[oldValue]]of Object.entries(changes[id]))original.copy[key]=oldValue
    const before=structuredClone({original,schema}),result=update(id,original,schema)
    assert.deepEqual(result,{body:expected.data,schema:expected.schema});assert.deepEqual({original,schema},before)
    assert.deepEqual(update(id,result.body,result.schema),result)
    if(id===visualsId){
      for(const key of Object.keys(fields)){
        assert.throws(()=>update(id,{...original,[key]:'custom-value'},schema),/另行設定/)
        assert.throws(()=>update(id,original,{...schema,fields:{...schema.fields,[key]:{type:'string'}}}),/欄位已自訂/)
      }
      assert.throws(()=>update(id,{...original,images:{...original.images,asset_10b5a86c:'/custom.webp'}},schema),/另行設定/)
      assert.equal(result.body.serviceVideoSrc,original.serviceVideoSrc)
      assert.equal(result.body.pavilionVideoId,original.pavilionVideoId)
      assert.equal(result.body.images.asset_7692def0,original.images.asset_7692def0)
    }else for(const key of Object.keys(changes[id]))assert.throws(()=>update(id,{...original,copy:{...original.copy,[key]:'自訂內容'}},schema),/另行設定/)
  }
  console.log('PASS 影片／封面 SHA256、三文件精準更新、共用門市圖及獨立品牌館影片不變、輸入／歷史保留、重跑與自訂內容保護')
}else{
  const env=new URL('../../.env.azure-runtime.local',import.meta.url);process.loadEnvFile(env)
  const server=readFileSync(env,'utf8').match(/^NUXT_DESIGN_DB_SERVER=(.+)$/m)?.[1].trim()
  assert(server?.endsWith('.database.windows.net'));assert.equal(process.env.NUXT_DESIGN_DB_SERVER,server)
  assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE,'SakuraWebsiteTest')
  assert.equal(process.env.CMS_DB_USER,'sakura_website_cms');assert.notEqual(process.env.NUXT_DESIGN_DB_TRUST_SERVER_CERTIFICATE,'true')
  try{await transaction(async tx=>{
    const documents=[]
    for(const id of ids){
      const doc=await getDocument(id,tx)
      assert(doc.publishedId&&doc.draftId===doc.publishedId,'有未發布草稿，停止以免覆蓋')
      const original=JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body)
      documents.push({doc,original,...update(id,original,JSON.parse(doc.schemaJson))})
      console.log('CHECK',id,'revision',doc.revision)
    }
    if(!args.includes('--apply'))return
    const others=(await query('SELECT * FROM cms.Documents WHERE id NOT IN (@visuals,@home,@service) ORDER BY id',{visuals:visualsId,home:homeId,service:serviceId},tx)).recordset
    const history=(await query('SELECT id,documentId,body FROM cms.Versions ORDER BY id',{},tx)).recordset
    const actor=(await query("SELECT id,role FROM cms.Users WHERE email='admin@sakura.local' AND role='admin' AND disabled=0",{},tx)).recordset[0];assert(actor)
    const added=[]
    for(const {doc,original,body,schema}of documents){
      if(JSON.stringify(body)===JSON.stringify(original)&&JSON.stringify(schema)===doc.schemaJson)continue
      const result=await query('UPDATE cms.Documents SET schemaJson=@schema WHERE id=@id AND revision=@revision',{id:doc.id,revision:doc.revision,schema:JSON.stringify(schema)},tx);assert.equal(result.rowsAffected[0],1)
      const saved=await changeDocument(doc.id,{action:'save',revision:doc.revision,body},actor,tx)
      const published=await changeDocument(doc.id,{action:'publish',revision:saved.revision},actor,tx)
      assert.equal(published.draftId,published.publishedId);added.push(published.publishedId)
      assert.deepEqual(JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:published.publishedId},tx)).recordset[0].body),body)
      console.log('UPDATED',doc.id,'revision',published.revision,'published',published.publishedId,'retained',doc.publishedId)
    }
    assert.deepEqual((await query('SELECT * FROM cms.Documents WHERE id NOT IN (@visuals,@home,@service) ORDER BY id',{visuals:visualsId,home:homeId,service:serviceId},tx)).recordset,others)
    assert.deepEqual((await query('SELECT id,documentId,body FROM cms.Versions ORDER BY id',{},tx)).recordset.filter(v=>!added.includes(v.id)),history)
  })}finally{await(await database()).close()}
}
