import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import {database,query,transaction} from '../server/cms/database.mjs'
import {getDocument,changeDocument,validate} from '../server/cms/content.mjs'

const oldUrl='https://www.sakura-kitchenlife.com.tw/measuring'
const newUrl='https://icare.sakura.com.tw/auth/login?toph=/member/measuring&FS=kitchen'
const ids=['view-components-SiteHeader','view-components-FloatingButtons']
function update(id,original){
 const body=structuredClone(original)
 const entries=id===ids[0]
  ?body.leftNav.filter(item=>item.label==='門市與服務').flatMap(item=>item.children).filter(item=>item.label==='免費丈量')
  :body.serviceItems.filter(item=>item.label==='免費丈量')
 assert.equal(entries.length,1,'免費丈量入口必須唯一')
 const entry=entries[0],key=id===ids[0]?'to':'href',before=entry[key]
 assert([oldUrl,newUrl].includes(before),'連結已另行修改，停止')
 assert.equal(entry[id===ids[0]?'external':'newTab'],true,'保留原另開分頁設定')
 entry[key]=newUrl
 const result=structuredClone(body)
 entry[key]=before
 assert.deepEqual(body,original,'只允許修改免費丈量目的地')
 return result
}
const args=process.argv.slice(2)
assert(args.every(arg=>['--apply','--self-check'].includes(arg)))
if(args.includes('--self-check')){
 for(const id of ids){
  const entry={label:'免費丈量',[id===ids[0]?'to':'href']:oldUrl,[id===ids[0]?'external':'newTab']:true,icon:'unchanged.svg'}
  const original=id===ids[0]?{leftNav:[{label:'門市與服務',children:[entry,{label:'客服中心',to:'https://icare.sakura.com.tw'}]}]}:{serviceItems:[entry,{label:'線上客服',href:'https://icare.sakura.com.tw'}],copy:{field3:'https://ai.sakura.com.tw/lens/kitchen'}}
  const snapshot=structuredClone(original),body=update(id,original)
  assert.deepEqual(original,snapshot);assert.deepEqual(update(id,body),body)
  const duplicate=structuredClone(original)
  ;(id===ids[0]?duplicate.leftNav[0].children:duplicate.serviceItems).push(entry)
  assert.throws(()=>update(id,duplicate))
  entry[id===ids[0]?'to':'href']='https://example.com/custom'
  assert.throws(()=>update(id,original))
 }
 console.log('PASS 兩個指定入口、僅改目的地、其他內容與輸入保留、可重跑及自訂／重複入口拒絕')
}else{
 const env=new URL('../../.env.azure-runtime.local',import.meta.url)
 process.loadEnvFile(env)
 const server=readFileSync(env,'utf8').match(/^NUXT_DESIGN_DB_SERVER=(.+)$/m)?.[1].trim()
 assert(server?.endsWith('.database.windows.net'));assert.equal(process.env.NUXT_DESIGN_DB_SERVER,server)
 assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE,'SakuraWebsiteTest')
 assert.equal(process.env.CMS_DB_USER,'sakura_website_cms');assert.notEqual(process.env.NUXT_DESIGN_DB_TRUST_SERVER_CERTIFICATE,'true')
 try{await transaction(async tx=>{
  const changes=[]
  for(const id of ids){
   const doc=await getDocument(id,tx)
   assert(doc.publishedId&&doc.draftId===doc.publishedId,'有未發布草稿，停止')
   const original=JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body)
   const body=update(id,original);validate(body,JSON.parse(doc.schemaJson))
   console.log('CHECK',id,'revision',doc.revision,'destination',newUrl)
   if(JSON.stringify(body)!==JSON.stringify(original))changes.push({doc,body})
  }
  if(!args.includes('--apply')||!changes.length)return
  const others=(await query('SELECT * FROM cms.Documents WHERE id NOT IN (@header,@floating) ORDER BY id',{header:ids[0],floating:ids[1]},tx)).recordset
  const history=(await query('SELECT id,documentId,body FROM cms.Versions ORDER BY id',{},tx)).recordset
  const actor=(await query("SELECT id,role FROM cms.Users WHERE email='admin@sakura.local' AND role='admin' AND disabled=0",{},tx)).recordset[0];assert(actor)
  const created=[]
  for(const {doc,body} of changes){
   const saved=await changeDocument(doc.id,{action:'save',revision:doc.revision,body},actor,tx)
   const published=await changeDocument(doc.id,{action:'publish',revision:saved.revision},actor,tx)
   assert.equal(published.draftId,published.publishedId)
   assert.deepEqual(JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:published.publishedId},tx)).recordset[0].body),body)
   created.push(published.publishedId)
   console.log('UPDATED',doc.id,'revision',published.revision,'published',published.publishedId,'retained',doc.publishedId)
  }
  assert.deepEqual((await query('SELECT * FROM cms.Documents WHERE id NOT IN (@header,@floating) ORDER BY id',{header:ids[0],floating:ids[1]},tx)).recordset,others)
  const after=(await query('SELECT id,documentId,body FROM cms.Versions ORDER BY id',{},tx)).recordset
  assert.deepEqual(after.filter(item=>!created.includes(item.id)),history,'所有舊版本保留')
  assert.equal(after.length,history.length+created.length)
  console.log('PASS 兩入口原子發布，其他文件及全部舊版本逐項保留')
 })}finally{await(await database()).close()}
}
