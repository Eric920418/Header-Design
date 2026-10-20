import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import {resolve} from 'node:path'
import {pathToFileURL} from 'node:url'
import {database,query,transaction} from '../server/cms/database.mjs'
import {getDocument,changeDocument,validate} from '../server/cms/content.mjs'

export function updateFooterNavigation(original){
  const body=structuredClone(original)
  const group=title=>{
    const matches=body.sitemapGroups.filter(item=>item.title===title)
    assert.equal(matches.length,1,`${title} 分類必須唯一`)
    return matches[0]
  }
  const brands=group('設計案例').links.filter(link=>link[1]==='/home-style/aikitchen')
  assert.equal(brands.length,1,'品牌系列入口必須唯一')
  assert(['品牌系列・AI 廚房','品牌系列'].includes(brands[0][0]),'品牌系列名稱已另行修改，停止以免覆蓋')
  brands[0][0]='品牌系列'
  const news=group('優惠消息')
  const links=[['優惠活動','/news/activities'],['最新消息','/news/latest'],['媒體影音','/news/video']]
  if(JSON.stringify(news.links)!==JSON.stringify(links))assert.deepEqual(news.links,[['優惠消息','/news']],'消息選單已另行修改，停止以免覆蓋')
  news.links=links
  return body
}

async function main(){
  const production=process.argv.includes('--production'),target=production?'production':'local'
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
  assert(process.argv.slice(2).every(arg=>['--apply','--production'].includes(arg)),'只接受--apply／--production；預設dry-run')
  try{
    await transaction(async tx=>{
      const doc=await getDocument('view-components-SiteFooter',tx)
      assert(doc.publishedId&&doc.draftId===doc.publishedId,'有未發布草稿，停止以免覆蓋')
      const previous=(await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body
      const original=JSON.parse(previous),body=updateFooterNavigation(original)
      if(JSON.stringify(body)===JSON.stringify(original)){console.log(`UNCHANGED ${target} Footer navigation`);return}
      validate(body,JSON.parse(doc.schemaJson))
      const unchanged=structuredClone(body)
      for(const title of ['設計案例','優惠消息'])unchanged.sitemapGroups.find(g=>g.title===title).links=original.sitemapGroups.find(g=>g.title===title).links
      assert.deepEqual(unchanged,original,'其他分類／文案／圖示／設定不得修改')
      console.log(`CHECK ${target} Footer revision ${doc.revision}; 品牌系列去後綴；優惠活動／最新消息／媒體影音三入口`)
      if(!process.argv.includes('--apply'))return
      const others=(await query('SELECT id,revision,draftId,publishedId FROM cms.Documents WHERE id<>@id ORDER BY id',{id:doc.id},tx)).recordset
      const history=(await query('SELECT id,body FROM cms.Versions WHERE documentId=@id ORDER BY id',{id:doc.id},tx)).recordset
      const user=(await query("SELECT id,role FROM cms.Users WHERE email='admin@sakura.local' AND role='admin' AND disabled=0",{},tx)).recordset[0]
      assert(user,'找不到既有有效管理員，停止')
      const saved=await changeDocument(doc.id,{action:'save',revision:doc.revision,body},user,tx)
      const published=await changeDocument(doc.id,{action:'publish',revision:saved.revision},user,tx)
      assert.deepEqual((await query('SELECT id,revision,draftId,publishedId FROM cms.Documents WHERE id<>@id ORDER BY id',{id:doc.id},tx)).recordset,others,'其他文件不得改動')
      assert.equal((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body,previous,'舊版本不得覆蓋')
      assert.deepEqual((await query('SELECT id,body FROM cms.Versions WHERE documentId=@id AND id<>@newId ORDER BY id',{id:doc.id,newId:published.publishedId},tx)).recordset,history,'所有舊版本皆須保留且內容不變')
      assert.equal(published.draftId,published.publishedId,'新版本必須發布成功')
      console.log(`UPDATED ${target} Footer revision ${published.revision}; published ${published.publishedId}; retained ${doc.publishedId}; other ${others.length} documents unchanged`)
    })
  }finally{await(await database()).close()}
}

if(process.argv[1]&&import.meta.url===pathToFileURL(resolve(process.argv[1])).href)await main()
