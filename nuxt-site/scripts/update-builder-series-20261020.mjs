import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import {resolve} from 'node:path'
import {pathToFileURL} from 'node:url'
import {database,query,transaction} from '../server/cms/database.mjs'
import {getDocument,changeDocument,validate} from '../server/cms/content.mjs'
import {BUILDER_SERIES_ID,builderSeriesSchema} from '../shared/cms/builder-series.mjs'

export function updateBuilderSeries(original, series) {
  if(JSON.stringify(original.series)===JSON.stringify(series))return original
  const oldNames=['iChef','iFun','Loft Chic','iPremium','原色系列 01','原色系列 02']
  const oldImages=['/section-6/builders/sakura-kitchen/series-01.webp','/section-6/builders/sakura-kitchen/series-02.webp','/section-6/builders/sakura-kitchen/series-03.webp','/section-6/builders/hero-kitchen.webp','/section-6/builders/sakura-kitchen/series-05.webp','/section-6/builders/sakura-kitchen/series-06.webp']
  assert.deepEqual(original.series,oldNames.map((name,index)=>({name,image:oldImages[index]})),'系列已另行修改，停止以免覆蓋')
  assert.equal(series.length,8,'本次只發布已提供素材的8組，不補缺少的原色0.5')
  assert.equal(new Set(series.map(item=>item.name)).size,8,'系列名稱不可重複')
  assert.equal(series.reduce((sum,item)=>sum+item.images.length,0),18,'8組共18張提供圖片')
  for(const item of series)assert.equal(item.image,item.images[0],'每組第一張必須作為封面')
  return {...original,series:structuredClone(series)}
}

async function main(){
  assert.equal(process.env.NUXT_DESIGN_DB_SERVER,'127.0.0.1','僅限本機CMS，不得修改正式端')
  assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE,'SakuraWebsiteDev','禁止修改其他資料庫')
  assert(process.argv.slice(2).every(arg=>arg==='--apply'),'只接受--apply；預設dry-run')
  const series=JSON.parse(readFileSync(new URL('../data/builderKitchenSeries.json',import.meta.url),'utf8'))
  try{
    await transaction(async tx=>{
      const doc=await getDocument(BUILDER_SERIES_ID,tx)
      assert(doc.publishedId&&doc.draftId===doc.publishedId,'有未發布草稿，停止以免覆蓋')
      const original=JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body)
      const body=updateBuilderSeries(original,series)
      if(body===original){console.log('UNCHANGED local builder series');return}
      validate(body,builderSeriesSchema(doc.id,JSON.parse(doc.schemaJson)))
      assert.deepEqual({...body,series:original.series},original,'只允許修改系列，其他Hero／預約／文案不可變')
      console.log(`CHECK local builder series revision ${doc.revision}; 6 -> 8 cards; 18 gallery images; missing 03 excluded`)
      if(!process.argv.includes('--apply'))return
      const others=(await query('SELECT id,revision,draftId,publishedId,schemaJson FROM cms.Documents WHERE id<>@id ORDER BY id',{id:doc.id},tx)).recordset
      const history=(await query('SELECT id,body FROM cms.Versions WHERE documentId=@id ORDER BY id',{id:doc.id},tx)).recordset
      const user=(await query("SELECT id,role FROM cms.Users WHERE email='admin@sakura.local' AND role='admin' AND disabled=0",{},tx)).recordset[0]
      assert(user,'找不到既有有效管理員，停止')
      const saved=await changeDocument(doc.id,{action:'save',revision:doc.revision,body},user,tx)
      const published=await changeDocument(doc.id,{action:'publish',revision:saved.revision},user,tx)
      assert.deepEqual((await query('SELECT id,revision,draftId,publishedId,schemaJson FROM cms.Documents WHERE id<>@id ORDER BY id',{id:doc.id},tx)).recordset,others,'其他文件不可更動')
      assert.deepEqual((await query('SELECT id,body FROM cms.Versions WHERE documentId=@id AND id<>@newId ORDER BY id',{id:doc.id,newId:published.publishedId},tx)).recordset,history,'所有舊版本必須保留且不變')
      assert.equal(published.draftId,published.publishedId,'本機新版本必須發布成功')
      console.log(`UPDATED local builder series revision ${published.revision}; published ${published.publishedId}; retained ${doc.publishedId}; other ${others.length} documents unchanged`)
    })
  }finally{await(await database()).close()}
}
if(process.argv[1]&&import.meta.url===pathToFileURL(resolve(process.argv[1])).href)await main()
