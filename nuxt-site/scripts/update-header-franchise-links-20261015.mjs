// Add only the two approved franchise links; retain the previous published version.
import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import {resolve} from 'node:path'
import {pathToFileURL} from 'node:url'
import {database,query,transaction} from '../server/cms/database.mjs'
import {getDocument,changeDocument,validate} from '../server/cms/content.mjs'

export function addFranchiseExtras(original) {
  const body=structuredClone(original)
  const groups=body.rightNav.filter(item=>item.to==='/franchising/intro')
  assert.equal(groups.length,1,'加盟分類必須唯一')
  const group=groups[0]
  assert.equal(group.label,'我要加盟','分類名稱已變更，停止以免修改錯誤目標')
  assert(Array.isArray(group.children),'加盟子選單不存在，停止')
  const originalChildren=structuredClone(group.children)
  for(const addition of [
    {label:'加盟申請表單',to:'/franchising/form'},
    {label:'加盟資料下載',to:'/franchising/download'},
  ]){
    const existing=group.children.filter(item=>item.to===addition.to||item.label===addition.label)
    assert(existing.length<=1,`${addition.label} 已重複，停止`)
    if(existing.length)assert.deepEqual(existing[0],addition,`${addition.label} 已另行修改，停止以免覆蓋`)
    else group.children.push(addition)
  }
  const unchanged=structuredClone(body)
  unchanged.rightNav.find(item=>item.to==='/franchising/intro').children=originalChildren
  assert.deepEqual(unchanged,original,'只允許追加兩筆，不得改動其他欄位或原選單')
  return body
}

async function main(){
  assert(process.argv.includes('--production'),'正式CMS操作必須明確指定--production；預設僅dry-run')
  const runtime=readFileSync(new URL('../../.env.azure-runtime.local',import.meta.url),'utf8')
  const expectedServer=/^NUXT_DESIGN_DB_SERVER=(.+)$/m.exec(runtime)?.[1]?.trim().replace(/^['"]|['"]$/g,'')
  assert(expectedServer?.endsWith('.database.windows.net'),'缺少既有正式Azure目標')
  assert.equal(process.env.NUXT_DESIGN_DB_SERVER,expectedServer,'正式目標必須與既有runtime檔一致')
  assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE,'SakuraWebsiteTest','禁止修改其他資料庫')
  assert.equal(process.env.CMS_DB_USER,'sakura_website_cms','只能使用既有CMS應用權限')
  assert.notEqual(process.env.NUXT_DESIGN_DB_TRUST_SERVER_CERTIFICATE,'true','正式TLS不可降低驗證')
  try{
    await transaction(async tx=>{
      const doc=await getDocument('view-components-SiteHeader',tx)
      assert(doc.publishedId&&doc.draftId===doc.publishedId,'有未發布草稿，停止以免覆蓋')
      const previous=(await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body
      const original=JSON.parse(previous),body=addFranchiseExtras(original)
      if(JSON.stringify(body)===JSON.stringify(original)){console.log('UNCHANGED view-components-SiteHeader; 兩筆入口已發布');return}
      validate(body,JSON.parse(doc.schemaJson))
      const before=original.rightNav.find(item=>item.to==='/franchising/intro').children.length
      const after=body.rightNav.find(item=>item.to==='/franchising/intro').children.length
      console.log(`CHECK production Header revision ${doc.revision}; franchise children ${before} -> ${after}; only missing form/download links`)
      if(!process.argv.includes('--apply'))return
      const others=await query('SELECT id,revision,draftId,publishedId FROM cms.Documents WHERE id<>@id ORDER BY id',{id:doc.id},tx)
      const user=(await query("SELECT id,role FROM cms.Users WHERE email='admin@sakura.local' AND role='admin' AND disabled=0",{},tx)).recordset[0]
      assert(user,'找不到既有有效管理員，停止')
      const saved=await changeDocument(doc.id,{action:'save',revision:doc.revision,body},user,tx)
      const published=await changeDocument(doc.id,{action:'publish',revision:saved.revision},user,tx)
      const othersAfter=await query('SELECT id,revision,draftId,publishedId FROM cms.Documents WHERE id<>@id ORDER BY id',{id:doc.id},tx)
      assert.deepEqual(othersAfter.recordset,others.recordset,'其他文件不得改動')
      assert.equal((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body,previous,'舊版本不得覆蓋')
      assert.equal(published.draftId,published.publishedId,'兩筆入口必須發布成功')
      console.log(`UPDATED ${doc.id}; revision ${published.revision}; published ${published.publishedId}; retained ${doc.publishedId}; other ${others.recordset.length} documents unchanged`)
    })
  }finally{await(await database()).close()}
}

if(process.argv[1]&&import.meta.url===pathToFileURL(resolve(process.argv[1])).href)await main()
