// PPT page 5: scoped, versioned local Footer update. Other documents stay untouched.
import assert from 'node:assert/strict'
import {database,query,transaction} from '../server/cms/database.mjs'
import {getDocument,changeDocument,validate} from '../server/cms/content.mjs'

assert.equal(process.env.NUXT_DESIGN_DB_SERVER,'127.0.0.1','僅限本機 CMS')
assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE,'SakuraWebsiteDev','禁止修改其他資料庫')
const apply=process.argv.includes('--apply')
try {
  await transaction(async tx=>{
    const doc=await getDocument('view-components-SiteFooter',tx)
    assert(doc.publishedId&&doc.draftId===doc.publishedId,'有未發布草稿，停止以免覆蓋')
    const body=JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body)
    const previous=JSON.stringify(body)
    function group(title){
      const matches=body.sitemapGroups.filter(g=>g.title===title)
      assert.equal(matches.length,1,`${title} 分類必須唯一`)
      return matches[0]
    }
    const promise=group('品牌承諾')
    for(const [to,oldLabel,newLabel] of [['/about/exhibition','品牌館','櫻花集團品牌館'],['/about/introduce','關於櫻花','關於我們']]){
      const matches=promise.links.filter(link=>link[1]===to)
      assert.equal(matches.length,1,`${to} 入口必須唯一`)
      assert([oldLabel,newLabel].includes(matches[0][0]),'文案已另行修改，停止以免覆蓋')
      matches[0][0]=newLabel
    }
    for(const addition of [['到府丈量','https://www.sakura-kitchenlife.com.tw/measuring'],['線上客服','https://icare.sakura.com.tw']]){
      const services=group('門市與服務').links
      const existing=services.filter(link=>link[0]===addition[0]||link[1]===addition[1])
      assert(existing.length<=1,`${addition[0]} 項目重複，停止`)
      if(existing.length)assert.deepEqual(existing[0],addition,'既有服務連結已另行修改，停止以免覆蓋')
      else services.push(addition)
    }
    // Remove only the five surplus Footer entries shown absent/masked in the reference.
    for(const [title,to,label] of [
      ['廚房產品','/products/sakura/range-hood','除油煙機系列'],
      ['廚房產品','/products/sakura/range-hood/near-suction','近吸系列'],
      ['合作專區','/franchising/download','加盟資料下載'],
      ['合作專區','/builders/sakura-kitchen','建商整體廚房'],
      ['合作專區','/builders/catalogues','建商專區型錄'],
    ]){
      const section=group(title),matches=section.links.filter(link=>link[1]===to)
      assert(matches.length<=1,`${to} 入口重複，停止`)
      if(matches.length){assert.equal(matches[0][0],label,'入口已另行修改，停止以免覆蓋');section.links=section.links.filter(link=>link[1]!==to)}
    }
    if(JSON.stringify(body)===previous){console.log('UNCHANGED view-components-SiteFooter');return}
    validate(body,JSON.parse(doc.schemaJson))
    if(!apply){console.log('CHECK Footer 文案、兩個服務入口與指定五個多餘入口；保留其他欄位及舊版本');return}
    const user=(await query("SELECT id,role FROM cms.Users WHERE email='admin@sakura.local' AND role='admin' AND disabled=0",{},tx)).recordset[0]
    assert(user,'找不到有效本機管理員')
    const saved=await changeDocument(doc.id,{action:'save',revision:doc.revision,body},user,tx)
    const published=await changeDocument(doc.id,{action:'publish',revision:saved.revision},user,tx)
    console.log(`UPDATED ${doc.id}; revision ${published.revision}; retained previous version ${doc.publishedId}`)
  })
} finally {await(await database()).close()}
