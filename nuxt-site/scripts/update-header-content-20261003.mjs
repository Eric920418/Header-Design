// Scoped, versioned CMS correction; production may change only the pavilion label.
import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import {database,query,transaction} from '../server/cms/database.mjs'
import {getDocument,changeDocument,validate} from '../server/cms/content.mjs'

const production=process.argv.includes('--production')
if(production){
  const runtime=readFileSync(new URL('../../.env.azure-runtime.local',import.meta.url),'utf8')
  const expectedServer=/^NUXT_DESIGN_DB_SERVER=(.+)$/m.exec(runtime)?.[1]?.trim().replace(/^['"]|['"]$/g,'')
  assert(expectedServer?.endsWith('.database.windows.net'),'缺少既有正式Azure目標')
  assert.equal(process.env.NUXT_DESIGN_DB_SERVER,expectedServer,'正式目標必須與既有runtime檔一致')
  assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE,'SakuraWebsiteTest','禁止修改其他資料庫')
  assert.equal(process.env.CMS_DB_USER,'sakura_website_cms','只能使用既有CMS應用權限')
  assert.notEqual(process.env.NUXT_DESIGN_DB_TRUST_SERVER_CERTIFICATE,'true','正式TLS不可降低驗證')
}else{
  assert.equal(process.env.NUXT_DESIGN_DB_SERVER,'127.0.0.1','非本機CMS必須明確指定--production')
  assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE,'SakuraWebsiteDev','禁止修改其他資料庫')
}
assert(process.argv.slice(2).every(arg=>['--apply','--production'].includes(arg)),'不支援的參數')
const apply=process.argv.includes('--apply')
try {
  await transaction(async tx=>{
    const doc=await getDocument('view-components-SiteHeader',tx)
    assert(doc.publishedId&&doc.draftId===doc.publishedId,'有未發布草稿，停止以免覆蓋')
    const body=JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body)
    const previous=JSON.stringify(body)
    const matches=body.rightNav.flatMap(item=>item.children||[]).filter(child=>child.to==='/about/exhibition')
    assert.equal(matches.length,1,'品牌館選單項目必須唯一')
    const entry=matches[0]
    assert(['集團品牌館','櫻花集團品牌館'].includes(entry.label),'文案已另行修改，停止以免覆蓋')
    entry.label='櫻花集團品牌館'
    const franchise=body.rightNav.filter(item=>item.to==='/franchising/intro')
    assert.equal(franchise.length,1,'我要加盟選單必須唯一')
    assert(Array.isArray(franchise[0].children),'找不到加盟子選單')
    for(const addition of [{label:'加盟申請表單',to:'/franchising/form'},{label:'加盟資料下載',to:'/franchising/download'}]){
      const existing=franchise[0].children.filter(child=>child.label===addition.label||child.to===addition.to)
      assert(existing.length<=1,`${addition.label} 項目重複，停止`)
      if(existing.length){
        assert.equal(existing[0].label,addition.label,'選單文案已另行修改，停止以免覆蓋')
        assert.equal(existing[0].to,addition.to,'選單網址已另行修改，停止以免覆蓋')
      }else franchise[0].children.push(addition)
    }
    if(production){
      const unchanged=structuredClone(body),original=JSON.parse(previous)
      unchanged.rightNav.flatMap(item=>item.children||[]).find(child=>child.to==='/about/exhibition').label=original.rightNav.flatMap(item=>item.children||[]).find(child=>child.to==='/about/exhibition').label
      assert.deepEqual(unchanged,original,'正式只允許修改品牌館名稱；其他差異必須停止')
    }
    if(JSON.stringify(body)===previous){console.log('UNCHANGED view-components-SiteHeader');return}
    validate(body,JSON.parse(doc.schemaJson))
    if(!apply){console.log(production?`CHECK production Header revision ${doc.revision}; only pavilion label 集團品牌館 -> 櫻花集團品牌館`:'CHECK 本機品牌館名稱／加盟申請表單／加盟資料下載；保留所有其他欄位及舊版本');return}
    const others=await query('SELECT id,revision,draftId,publishedId FROM cms.Documents WHERE id<>@id ORDER BY id',{id:doc.id},tx)
    const user=(await query("SELECT id,role FROM cms.Users WHERE email='admin@sakura.local' AND role='admin' AND disabled=0",{},tx)).recordset[0]
    assert(user,'找不到既有有效管理員，停止')
    const saved=await changeDocument(doc.id,{action:'save',revision:doc.revision,body},user,tx)
    const published=await changeDocument(doc.id,{action:'publish',revision:saved.revision},user,tx)
    assert.deepEqual((await query('SELECT id,revision,draftId,publishedId FROM cms.Documents WHERE id<>@id ORDER BY id',{id:doc.id},tx)).recordset,others.recordset,'其他文件不得改動')
    assert.deepEqual(JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body),JSON.parse(previous),'舊版本不得覆蓋')
    assert.equal(published.draftId,published.publishedId,'新版本必須發布成功')
    console.log(`UPDATED ${doc.id}; revision ${published.revision}; published ${published.publishedId}; retained ${doc.publishedId}; other ${others.recordset.length} documents unchanged`)
  })
} finally {await(await database()).close()}
