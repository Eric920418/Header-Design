// Scoped, versioned local CMS copy correction. Never replace other navigation data.
import assert from 'node:assert/strict'
import {database,query,transaction} from '../server/cms/database.mjs'
import {getDocument,changeDocument,validate} from '../server/cms/content.mjs'

assert.equal(process.env.NUXT_DESIGN_DB_SERVER,'127.0.0.1','僅限本機 CMS')
assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE,'SakuraWebsiteDev','禁止修改其他資料庫')
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
    if(JSON.stringify(body)===previous){console.log('UNCHANGED view-components-SiteHeader');return}
    validate(body,JSON.parse(doc.schemaJson))
    if(!apply){console.log('CHECK 品牌館名稱／加盟申請表單／加盟資料下載；保留所有其他欄位及舊版本');return}
    const user=(await query("SELECT id,role FROM cms.Users WHERE email='admin@sakura.local' AND role='admin' AND disabled=0",{},tx)).recordset[0]
    assert(user,'找不到有效本機管理員')
    const saved=await changeDocument(doc.id,{action:'save',revision:doc.revision,body},user,tx)
    const published=await changeDocument(doc.id,{action:'publish',revision:saved.revision},user,tx)
    console.log(`UPDATED ${doc.id}; revision ${published.revision}; retained previous version ${doc.publishedId}`)
  })
} finally {await(await database()).close()}
