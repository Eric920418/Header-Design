import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import {createHash} from 'node:crypto'
import {database,query,transaction} from '../server/cms/database.mjs'
import {getDocument,changeDocument,validate,normalizeVideos} from '../server/cms/content.mjs'

const visualsId='site-visuals',pageId='view-pages-about-exhibition',videoId='ovXezqQdFYo'
const field={type:'string',format:'youtube',label:'集團品牌館 YouTube 影片 ID'}
const changes={
  field5:['/section-5/brand-pavilion/interior-main.jpg','/section-5/brand-pavilion/exhibition-1-20261030.webp'],
  field6:['集團品牌館客廳與廚房展示空間','集團品牌館白色中島與展示櫥櫃'],
  field7:['/section-5/brand-pavilion/interior-gallery.png','/section-5/brand-pavilion/exhibition-2-20261030.webp'],
  field8:['集團品牌館多元空間展示','集團品牌館紅色廚房與客餐廳展示空間'],
}
function update(id,original,originalSchema){
  const body=structuredClone(original),schema=structuredClone(originalSchema)
  if(id===visualsId){
    assert(!Object.hasOwn(body,'pavilionVideoId')||body.pavilionVideoId===videoId,'品牌館影片已另行設定，停止以免覆蓋')
    if(schema.fields.pavilionVideoId)assert.deepEqual(schema.fields.pavilionVideoId,field,'品牌館影片欄位已自訂，停止以免覆蓋')
    body.pavilionVideoId=videoId;schema.fields.pavilionVideoId=field
    const preserved=structuredClone(body),preservedSchema=structuredClone(schema)
    if(Object.hasOwn(original,'pavilionVideoId'))preserved.pavilionVideoId=original.pavilionVideoId
    else delete preserved.pavilionVideoId
    if(originalSchema.fields.pavilionVideoId)preservedSchema.fields.pavilionVideoId=originalSchema.fields.pavilionVideoId
    else delete preservedSchema.fields.pavilionVideoId
    assert.deepEqual(preserved,original);assert.deepEqual(preservedSchema,originalSchema)
  }else{
    assert.equal(id,pageId)
    for(const [key,[oldValue,newValue]]of Object.entries(changes)){
      assert([oldValue,newValue].includes(body.copy[key]),`${key} 已另行設定，停止以免覆蓋`)
      body.copy[key]=newValue
    }
    const preserved=structuredClone(body)
    for(const key of Object.keys(changes))preserved.copy[key]=original.copy[key]
    assert.deepEqual(preserved,original);assert.deepEqual(schema,originalSchema)
  }
  validate(body,schema)
  return {body,schema}
}
const args=process.argv.slice(2)
assert(args.every(a=>['--self-check','--apply'].includes(a)))
for(const [name,hash]of [['exhibition-1-20261030.webp','a44a378c53e0ac8e8444ed8230fc1b3a18922daa08bc17d47bc6fe3dcf1ba456'],['exhibition-2-20261030.webp','eb714a434aabfa3671a2c9a0e2e94a0b99e742582461ea9b8fac362a0c10cb56']]){
  assert.equal(createHash('sha256').update(readFileSync(new URL('../../public/section-5/brand-pavilion/'+name,import.meta.url))).digest('hex'),hash,'圖片與驗證版本不同')
}
if(args.includes('--self-check')){
  const seed=JSON.parse(readFileSync(new URL('../shared/cms/seed.json',import.meta.url),'utf8'))
  for(const id of [visualsId,pageId]){
    const expected=seed.find(d=>d.id===id),original=structuredClone(expected.data),schema=structuredClone(expected.schema)
    if(id===visualsId){delete original.pavilionVideoId;delete schema.fields.pavilionVideoId}
    else for(const [key,[oldValue]]of Object.entries(changes))original.copy[key]=oldValue
    const before=structuredClone({original,schema}),result=update(id,original,schema)
    assert.deepEqual(result,{body:expected.data,schema:expected.schema});assert.deepEqual({original,schema},before)
    assert.deepEqual(update(id,result.body,result.schema),result)
    if(id===visualsId){
      assert.throws(()=>update(id,{...original,pavilionVideoId:'custom-id'},schema),/另行設定/)
      assert.throws(()=>update(id,original,{...schema,fields:{...schema.fields,pavilionVideoId:{type:'string'}}}),/欄位已自訂/)
    }else for(const key of Object.keys(changes))assert.throws(()=>update(id,{...original,copy:{...original.copy,[key]:'自訂內容'}},schema),/另行設定/)
  }
  assert.equal(normalizeVideos('https://youtu.be/ovXezqQdFYo?si=i8-OFSuxvoJ58f-c',field),videoId)
  console.log('PASS 圖片 SHA256、指定影片識別碼、僅改指定欄位、保留輸入／其他內容、重跑及自訂內容保護')
}else{
  const env=new URL('../../.env.azure-runtime.local',import.meta.url);process.loadEnvFile(env)
  const server=readFileSync(env,'utf8').match(/^NUXT_DESIGN_DB_SERVER=(.+)$/m)?.[1].trim()
  assert(server?.endsWith('.database.windows.net'));assert.equal(process.env.NUXT_DESIGN_DB_SERVER,server)
  assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE,'SakuraWebsiteTest')
  assert.equal(process.env.CMS_DB_USER,'sakura_website_cms');assert.notEqual(process.env.NUXT_DESIGN_DB_TRUST_SERVER_CERTIFICATE,'true')
  try{await transaction(async tx=>{
    const documents=[]
    for(const id of [visualsId,pageId]){
      const doc=await getDocument(id,tx)
      assert(doc.publishedId&&doc.draftId===doc.publishedId,'有未發布草稿，停止以免覆蓋')
      const original=JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body)
      documents.push({doc,original,...update(id,original,JSON.parse(doc.schemaJson))})
      console.log('CHECK',id,'revision',doc.revision)
    }
    if(!args.includes('--apply'))return
    const others=(await query('SELECT * FROM cms.Documents WHERE id NOT IN (@visuals,@page) ORDER BY id',{visuals:visualsId,page:pageId},tx)).recordset
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
    assert.deepEqual((await query('SELECT * FROM cms.Documents WHERE id NOT IN (@visuals,@page) ORDER BY id',{visuals:visualsId,page:pageId},tx)).recordset,others)
    assert.deepEqual((await query('SELECT id,documentId,body FROM cms.Versions ORDER BY id',{},tx)).recordset.filter(v=>!added.includes(v.id)),history)
  })}finally{await(await database()).close()}
}
