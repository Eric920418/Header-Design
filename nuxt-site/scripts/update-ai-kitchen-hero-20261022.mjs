import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import {resolve} from 'node:path'
import {pathToFileURL} from 'node:url'
import ts from 'typescript'
import {database,query,transaction} from '../server/cms/database.mjs'
import {getDocument,changeDocument,validate} from '../server/cms/content.mjs'
import {KITCHEN_SERIES_ID,kitchenSeriesHeroSchema} from '../shared/cms/kitchen-series-hero.mjs'

export function updateAiKitchenHero(original, stories) {
  const ai=original.KITCHEN_SERIES_PAGES.find(page=>page.slug==='aikitchen')
  assert(ai&&original.AI_KITCHEN_PAGE?.slug==='aikitchen','必須找到原AI系列及相容入口')
  assert.deepEqual(ai.heroSlides,stories.map(story=>story.image),'原圖片已修改，停止以免錯配')
  for(const page of [ai,original.AI_KITCHEN_PAGE])assert(!page.heroStories||JSON.stringify(page.heroStories)===JSON.stringify(stories),'已有不同輪播文案，停止以免覆蓋')
  if([ai,original.AI_KITCHEN_PAGE].every(page=>JSON.stringify(page.heroStories)===JSON.stringify(stories)))return original
  return {...original,AI_KITCHEN_PAGE:{...original.AI_KITCHEN_PAGE,heroStories:structuredClone(stories)},KITCHEN_SERIES_PAGES:original.KITCHEN_SERIES_PAGES.map(page=>page.slug==='aikitchen'?{...page,heroStories:structuredClone(stories)}:page)}
}

async function main(){
  const args=process.argv.slice(2)
  assert(args.every(arg=>['--target=local','--target=production','--apply'].includes(arg)))
  const targets=args.filter(arg=>arg.startsWith('--target='));assert.equal(targets.length,1,'必須明確指定唯一目標')
  const production=targets[0]==='--target=production'
  const envFile=new URL(production?'../../.env.azure-runtime.local':'../.env',import.meta.url)
  process.loadEnvFile(envFile)
  const expectedServer=production?readFileSync(envFile,'utf8').match(/^NUXT_DESIGN_DB_SERVER=(.+)$/m)?.[1].trim():'127.0.0.1'
  assert(expectedServer&&(!production||expectedServer.endsWith('.database.windows.net')))
  assert.equal(process.env.NUXT_DESIGN_DB_SERVER||'127.0.0.1',expectedServer,'連線目標不可被其他環境覆蓋')
  assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE||'SakuraWebsiteDev',production?'SakuraWebsiteTest':'SakuraWebsiteDev')
  assert.equal(process.env.CMS_DB_USER||'sakura_website_cms','sakura_website_cms')
  if(production)assert.notEqual(process.env.NUXT_DESIGN_DB_TRUST_SERVER_CERTIFICATE,'true')
  const url=new URL('../data/kitchenSeries.ts',import.meta.url),exports={}
  const {outputText}=ts.transpileModule(readFileSync(url,'utf8'),{compilerOptions:{module:ts.ModuleKind.CommonJS,target:ts.ScriptTarget.ES2022,esModuleInterop:true}})
  new Function('require','exports',outputText)(relative=>JSON.parse(readFileSync(new URL(relative,url),'utf8')),exports)
  const stories=exports.AI_KITCHEN_PAGE.heroStories
  assert.deepEqual(stories.map(story=>story.title),['AI CABINET','AI FAUCET','AI LIGHT'])
  try{await transaction(async tx=>{
    const doc=await getDocument(KITCHEN_SERIES_ID,tx)
    assert(doc.publishedId&&doc.draftId===doc.publishedId,'有未發布草稿，停止以免覆蓋')
    const original=JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body)
    const snapshot=structuredClone(original),body=updateAiKitchenHero(original,stories)
    assert.deepEqual(original,snapshot,'更新不得原地修改原版本')
    if(body===original){console.log(`UNCHANGED ${production?'production':'local'} AI Hero`);return}
    const preserved=structuredClone(body)
    for(const [page,before] of [[preserved.AI_KITCHEN_PAGE,original.AI_KITCHEN_PAGE],[preserved.KITCHEN_SERIES_PAGES.find(page=>page.slug==='aikitchen'),original.KITCHEN_SERIES_PAGES.find(page=>page.slug==='aikitchen')]]){
      delete page.heroStories;if(before.heroStories)page.heroStories=before.heroStories
    }
    assert.deepEqual(preserved,original,'只能新增AI Hero圖文，不得更改其他系列／圖片／段落')
    validate(body,kitchenSeriesHeroSchema(doc.id,JSON.parse(doc.schemaJson)))
    console.log(`CHECK ${production?'production':'local'} AI Hero revision ${doc.revision}; 3 image-caption pairs; original images retained`)
    if(!args.includes('--apply'))return
    const others=(await query('SELECT * FROM cms.Documents WHERE id<>@id ORDER BY id',{id:doc.id},tx)).recordset
    const history=(await query('SELECT id,documentId,body FROM cms.Versions ORDER BY id',{},tx)).recordset
    const user=(await query("SELECT id,role FROM cms.Users WHERE email='admin@sakura.local' AND role='admin' AND disabled=0",{},tx)).recordset[0];assert(user,'找不到原有效管理員')
    const saved=await changeDocument(doc.id,{action:'save',revision:doc.revision,body},user,tx)
    const published=await changeDocument(doc.id,{action:'publish',revision:saved.revision},user,tx)
    assert.equal(published.draftId,published.publishedId)
    assert.deepEqual(JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:published.publishedId},tx)).recordset[0].body),body)
    assert.deepEqual((await query('SELECT * FROM cms.Documents WHERE id<>@id ORDER BY id',{id:doc.id},tx)).recordset,others,'其他文件必須完全不變')
    assert.deepEqual((await query('SELECT id,documentId,body FROM cms.Versions WHERE id<>@id ORDER BY id',{id:published.publishedId},tx)).recordset,history,'所有原版本必須保留且不變')
    console.log(`UPDATED ${production?'production':'local'} AI Hero revision ${published.revision}; published ${published.publishedId}; retained ${doc.publishedId}; other ${others.length} documents and ${history.length} versions unchanged`)
  })}finally{await(await database()).close()}
}
if(process.argv[1]&&import.meta.url===pathToFileURL(resolve(process.argv[1])).href)await main()
