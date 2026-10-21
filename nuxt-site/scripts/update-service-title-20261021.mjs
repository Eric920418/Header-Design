import assert from 'node:assert/strict'
import {resolve} from 'node:path'
import {pathToFileURL} from 'node:url'
import {database,query,transaction} from '../server/cms/database.mjs'
import {getDocument,changeDocument,validate} from '../server/cms/content.mjs'

export function updateServiceHeroTitle(original){
  assert(['to Life','To Life'].includes(original.copy?.text5?.trim()),'文案已另行修改，停止以免覆蓋')
  return {...original,copy:{...original.copy,text5:original.copy.text5.replace('to Life','To Life')}}
}

async function main(){
  assert.equal(process.env.NUXT_DESIGN_DB_SERVER,'127.0.0.1','僅限本機CMS，不得修改正式端')
  assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE,'SakuraWebsiteDev','禁止修改其他資料庫')
  assert(process.argv.slice(2).every(arg=>arg==='--apply'),'只接受--apply；預設dry-run')
  try{
    await transaction(async tx=>{
      const doc=await getDocument('view-pages-service-process',tx)
      assert(doc.publishedId&&doc.draftId===doc.publishedId,'有未發布草稿，停止以免覆蓋')
      const previous=(await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body
      const original=JSON.parse(previous),body=updateServiceHeroTitle(original)
      if(JSON.stringify(body)===JSON.stringify(original)){console.log('UNCHANGED local Service intro title');return}
      validate(body,JSON.parse(doc.schemaJson))
      assert.deepEqual({...body,copy:{...body.copy,text5:original.copy.text5}},original,'只能修改copy.text5，其他內容不得變更')
      console.log(`CHECK local Service intro revision ${doc.revision}; only copy.text5 to Life -> To Life`)
      if(!process.argv.includes('--apply'))return
      const others=(await query('SELECT id,revision,draftId,publishedId FROM cms.Documents WHERE id<>@id ORDER BY id',{id:doc.id},tx)).recordset
      const history=(await query('SELECT id,body FROM cms.Versions WHERE documentId=@id ORDER BY id',{id:doc.id},tx)).recordset
      const user=(await query("SELECT id,role FROM cms.Users WHERE email='admin@sakura.local' AND role='admin' AND disabled=0",{},tx)).recordset[0]
      assert(user,'找不到既有有效管理員，停止')
      const saved=await changeDocument(doc.id,{action:'save',revision:doc.revision,body},user,tx)
      const published=await changeDocument(doc.id,{action:'publish',revision:saved.revision},user,tx)
      assert.deepEqual((await query('SELECT id,revision,draftId,publishedId FROM cms.Documents WHERE id<>@id ORDER BY id',{id:doc.id},tx)).recordset,others,'其他文件不得改動')
      assert.deepEqual((await query('SELECT id,body FROM cms.Versions WHERE documentId=@id AND id<>@newId ORDER BY id',{id:doc.id,newId:published.publishedId},tx)).recordset,history,'所有舊版本必須保留且不變')
      assert.equal(published.draftId,published.publishedId,'本機新版本必須發布成功')
      console.log(`UPDATED local Service intro revision ${published.revision}; published ${published.publishedId}; retained ${doc.publishedId}; other ${others.length} documents unchanged`)
    })
  }finally{await(await database()).close()}
}

if(process.argv[1]&&import.meta.url===pathToFileURL(resolve(process.argv[1])).href)await main()
