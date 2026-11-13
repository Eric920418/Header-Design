import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import {createHash} from 'node:crypto'
import {database,query,transaction} from '../server/cms/database.mjs'
import {getDocument,changeDocument,validate} from '../server/cms/content.mjs'

const ids=['data-franchise','view-pages-franchising-download','view-pages-franchising-intro']
const prefix='/section-6/franchise/'
const changes={
 'data-franchise':[[['FRANCHISE_BROCHURE_URL'],prefix+'franchising_info.pdf',prefix+'franchising-info-20261030.pdf']],
 'view-pages-franchising-download':[
  [['brochurePages',0,'image'],prefix+'franchising-info-outside.webp',prefix+'franchising-info-outside-20261030.webp'],
  [['brochurePages',1,'image'],prefix+'franchising-info-inside.webp',prefix+'franchising-info-inside-20261030.webp'],
  [['copy','text15'],'8.0 MB','19.8 MB'],
 ],
 'view-pages-franchising-intro':[[['copy','field53'],prefix+'franchise-download-cover.png',prefix+'franchise-download-cover-20261030.webp']],
}
function set(target,path,from,to){
 const parent=path.slice(0,-1).reduce((value,key)=>value[key],target),key=path.at(-1)
 assert([from,to].includes(parent[key]),`${path.join('.')} 已另行修改，停止以免覆蓋`)
 parent[key]=to
}
function update(id,original,originalSchema){
 const body=structuredClone(original),schema=structuredClone(originalSchema)
 assert(changes[id],'未知文件')
 if(id===ids[1])assert.deepEqual(body.brochurePages.map(p=>p.number),['01','02'],'預覽頁面已另行修改')
 for(const [path,from,to]of changes[id])set(body,path,from,to)
 if(id===ids[1]){
  set(schema,['fields','brochurePages','template','image'],prefix+'franchising-info-outside.webp',prefix+'franchising-info-outside-20261030.webp')
  set(schema,['fields','copy','fields','text15','label'],'8.0 MB','PDF 檔案大小')
 }
 validate(body,schema)
 return {body,schema}
}
const args=process.argv.slice(2);assert(args.every(a=>['--self-check','--apply'].includes(a)))
for(const [name,hash]of [
 ['franchising-info-20261030.pdf','55976990f9cf59636493c527e8b1f7543629e2e55aa1e7201cef1ad9142b342d'],
 ['franchising-info-outside-20261030.webp','72205da68f568af1ee42233760f281babf314cd997182630489583031c012acd'],
 ['franchising-info-inside-20261030.webp','c809975453023039e3841022fdeeb30d63b2f4db993111845a201f2a226921a9'],
 ['franchise-download-cover-20261030.webp','97800e82dfd5957d660e6725c36455454048e04aa7c05b7991955a2641c1a2aa'],
])assert.equal(createHash('sha256').update(readFileSync(new URL('../../public'+prefix+name,import.meta.url))).digest('hex'),hash,'新檔與驗證版本不同')
if(args.includes('--self-check')){
 const seed=JSON.parse(readFileSync(new URL('../shared/cms/seed.json',import.meta.url),'utf8'))
 for(const id of ids){
  const expected=seed.find(d=>d.id===id),original=structuredClone(expected.data),schema=structuredClone(expected.schema)
  for(const [path,from,to]of changes[id])set(original,path,to,from)
  if(id===ids[1]){
   set(schema,['fields','brochurePages','template','image'],prefix+'franchising-info-outside-20261030.webp',prefix+'franchising-info-outside.webp')
   set(schema,['fields','copy','fields','text15','label'],'PDF 檔案大小','8.0 MB')
  }
  const before=structuredClone({original,schema}),result=update(id,original,schema)
  assert.deepEqual(result,{body:expected.data,schema:expected.schema});assert.deepEqual({original,schema},before)
  assert.deepEqual(update(id,result.body,result.schema),result)
  for(const [path,from]of changes[id]){
   const custom=structuredClone(original);set(custom,path,from,'自訂內容')
   assert.throws(()=>update(id,custom,schema),/另行修改/)
  }
  const custom=structuredClone(original)
  if(id===ids[0])custom.FRANCHISE_FORM_URL='/franchising/custom'
  else custom.copy.text3='保留自訂文案'
  const preserved=update(id,custom,schema).body
  assert.equal(id===ids[0]?preserved.FRANCHISE_FORM_URL:preserved.copy.text3,id===ids[0]?custom.FRANCHISE_FORM_URL:custom.copy.text3)
 }
 const doc=seed.find(d=>d.id===ids[1]);assert.throws(()=>update(ids[1],{...doc.data,brochurePages:doc.data.brochurePages.slice(1)},doc.schema),/頁面已另行修改/)
 console.log('PASS PDF／預覽／封面 SHA256、僅更新指定欄位、其他內容與輸入保留、重跑及自訂內容保護')
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
    const others=(await query('SELECT * FROM cms.Documents WHERE id NOT IN (@data,@download,@intro) ORDER BY id',{data:ids[0],download:ids[1],intro:ids[2]},tx)).recordset
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
    assert.deepEqual((await query('SELECT * FROM cms.Documents WHERE id NOT IN (@data,@download,@intro) ORDER BY id',{data:ids[0],download:ids[1],intro:ids[2]},tx)).recordset,others)
    assert.deepEqual((await query('SELECT id,documentId,body FROM cms.Versions ORDER BY id',{},tx)).recordset.filter(v=>!added.includes(v.id)),history)
  })}finally{await(await database()).close()}
}
