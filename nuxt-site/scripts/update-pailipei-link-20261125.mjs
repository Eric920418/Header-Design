import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import {database,query,transaction} from '../server/cms/database.mjs'
import {getDocument,changeDocument,validate} from '../server/cms/content.mjs'

const id='view-components-FloatingButtons'
const oldUrl='https://ai.sakura.com.tw/lens/kitchen'
const newUrl='https://www.sakura-kitchenlife.com.tw/news/latest/sakuralens-go-live'
function update(original){
 const body=structuredClone(original)
 assert([oldUrl,newUrl].includes(body.copy.field3),'拍立配目的地已另行修改，停止')
 const before=body.copy.field3;body.copy.field3=newUrl
 const result=structuredClone(body);body.copy.field3=before
 assert.deepEqual(body,original,'只能修改拍立配連結，保留免費丈量與其他內容')
 return result
}
const args=process.argv.slice(2)
assert(args.every(arg=>['--apply','--self-check'].includes(arg)))
if(args.includes('--self-check')){
 const original={serviceItems:[{label:'免費丈量',href:'https://icare.sakura.com.tw/auth/login?toph=/member/measuring&FS=kitchen'}],copy:{field3:oldUrl,field4:'/floating-icons/pailipei.svg'}}
 const before=structuredClone(original),body=update(original)
 assert.deepEqual(original,before);assert.deepEqual(update(body),body)
 assert.equal(body.copy.field3,newUrl);assert.deepEqual(body.serviceItems,original.serviceItems)
 original.copy.field3='https://example.com/custom';assert.throws(()=>update(original))
 console.log('PASS 僅改拍立配目的地、免費丈量／圖示／輸入保留、可重跑及自訂目的地拒絕')
}else{
 const env=new URL('../../.env.azure-runtime.local',import.meta.url)
 process.loadEnvFile(env)
 const server=readFileSync(env,'utf8').match(/^NUXT_DESIGN_DB_SERVER=(.+)$/m)?.[1].trim()
 assert(server?.endsWith('.database.windows.net'));assert.equal(process.env.NUXT_DESIGN_DB_SERVER,server)
 assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE,'SakuraWebsiteTest')
 assert.equal(process.env.CMS_DB_USER,'sakura_website_cms');assert.notEqual(process.env.NUXT_DESIGN_DB_TRUST_SERVER_CERTIFICATE,'true')
 try{await transaction(async tx=>{
  const doc=await getDocument(id,tx)
  assert(doc.publishedId&&doc.draftId===doc.publishedId,'有未發布草稿，停止')
  const original=JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body)
  const body=update(original);validate(body,JSON.parse(doc.schemaJson))
  console.log('CHECK',id,'revision',doc.revision,'destination',newUrl)
  if(!args.includes('--apply')||JSON.stringify(original)===JSON.stringify(body))return
  const others=(await query('SELECT * FROM cms.Documents WHERE id<>@id ORDER BY id',{id},tx)).recordset
  const history=(await query('SELECT id,documentId,body FROM cms.Versions ORDER BY id',{},tx)).recordset
  const actor=(await query("SELECT id,role FROM cms.Users WHERE email='admin@sakura.local' AND role='admin' AND disabled=0",{},tx)).recordset[0];assert(actor)
  const saved=await changeDocument(id,{action:'save',revision:doc.revision,body},actor,tx)
  const published=await changeDocument(id,{action:'publish',revision:saved.revision},actor,tx)
  assert.equal(published.draftId,published.publishedId)
  assert.deepEqual(JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:published.publishedId},tx)).recordset[0].body),body)
  assert.deepEqual((await query('SELECT * FROM cms.Documents WHERE id<>@id ORDER BY id',{id},tx)).recordset,others)
  assert.deepEqual((await query('SELECT id,documentId,body FROM cms.Versions WHERE id<>@id ORDER BY id',{id:published.publishedId},tx)).recordset,history)
  console.log('UPDATED',id,'revision',published.revision,'published',published.publishedId,'retained',doc.publishedId)
  console.log('PASS 其他文件、全部舊版本及剛更新的免費丈量內容保留')
 })}finally{await(await database()).close()}
}
