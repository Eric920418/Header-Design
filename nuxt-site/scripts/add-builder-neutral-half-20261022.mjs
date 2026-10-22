import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import {resolve} from 'node:path'
import {pathToFileURL} from 'node:url'
import {database,query,transaction} from '../server/cms/database.mjs'
import {getDocument,changeDocument,validate} from '../server/cms/content.mjs'
import {BUILDER_SERIES_ID,builderSeriesSchema} from '../shared/cms/builder-series.mjs'

export function addBuilderNeutralHalf(original,item){
  assert.equal(item?.name,'原色系列 0.5');assert.equal(item.subtitle,'NEUTRAL COLOR')
  assert.deepEqual(item.images,[1,2].map(index=>`/section-6/builders/sakura-kitchen/series-20261022/neutral-color-0-5-${index}.webp`));assert.equal(item.image,item.images[0])
  const found=original.series.findIndex(series=>series.name===item.name)
  if(found>=0){assert.equal(found,2,'0.5位置已另行修改，停止');assert.deepEqual(original.series[found],item,'0.5已另行修改，停止以免覆蓋');return original}
  assert.equal(original.series.length,8,'既有系列數已變更，停止以免覆蓋')
  assert.deepEqual(original.series.slice(0,2).map(series=>[series.name,series.subtitle]),[['足元抽套系 01','HORIZON'],['足元抽套系 02','HORIZON']],'HORIZON順序已變更，停止')
  return {...original,series:[...original.series.slice(0,2),structuredClone(item),...original.series.slice(2)]}
}

async function main(){
  const args=process.argv.slice(2);assert(args.every(arg=>['--target=local','--target=production','--apply'].includes(arg)))
  const targets=args.filter(arg=>arg.startsWith('--target='));assert.equal(targets.length,1,'必須指定唯一目標')
  const production=targets[0]==='--target=production',envFile=new URL(production?'../../.env.azure-runtime.local':'../.env',import.meta.url)
  process.loadEnvFile(envFile)
  const expectedServer=production?readFileSync(envFile,'utf8').match(/^NUXT_DESIGN_DB_SERVER=(.+)$/m)?.[1].trim():'127.0.0.1'
  assert(expectedServer&&(!production||expectedServer.endsWith('.database.windows.net')))
  assert.equal(process.env.NUXT_DESIGN_DB_SERVER||'127.0.0.1',expectedServer,'禁止其他連線目標')
  assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE||'SakuraWebsiteDev',production?'SakuraWebsiteTest':'SakuraWebsiteDev')
  assert.equal(process.env.CMS_DB_USER||'sakura_website_cms','sakura_website_cms')
  if(production)assert.notEqual(process.env.NUXT_DESIGN_DB_TRUST_SERVER_CERTIFICATE,'true')
  const item=JSON.parse(readFileSync(new URL('../data/builderKitchenSeries.json',import.meta.url),'utf8')).find(series=>series.name==='原色系列 0.5');assert(item)
  if(production&&args.includes('--apply')){
    const origin='https://header-design-two.vercel.app',password=readFileSync(new URL('../nuxt.config.ts',import.meta.url),'utf8').match(/previewPassword: '([^']+)'/)?.[1];assert(password)
    const login=await fetch(origin+'/api/preview-access',{method:'POST',redirect:'error',headers:{'content-type':'application/json'},body:JSON.stringify({password}),signal:AbortSignal.timeout(30000)});assert.equal(login.status,200)
    const cookie=login.headers.getSetCookie().map(value=>value.split(';')[0]).join('; ')
    for(const image of item.images){assert(image.startsWith('/section-6/builders/sakura-kitchen/series-20261022/'));const response=await fetch(origin+image,{method:'HEAD',redirect:'error',headers:{cookie},signal:AbortSignal.timeout(30000)});assert.equal(response.status,200,'先部署素材才能發布資料');assert.match(response.headers.get('content-type')||'',/^image\/webp/)}
  }
  try{await transaction(async tx=>{
    const doc=await getDocument(BUILDER_SERIES_ID,tx);assert(doc.publishedId&&doc.draftId===doc.publishedId,'有未發布草稿，停止以免覆蓋')
    const original=JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body),snapshot=structuredClone(original)
    const body=addBuilderNeutralHalf(original,item);assert.deepEqual(original,snapshot,'不得原地修改原資料')
    if(body===original){console.log(`UNCHANGED ${production?'production':'local'} neutral 0.5`);return}
    assert.deepEqual({...body,series:body.series.filter(series=>series.name!==item.name)},original,'只可新增0.5，其他8組／文案／Hero／預約不得更動')
    validate(body,builderSeriesSchema(doc.id,JSON.parse(doc.schemaJson)))
    console.log(`CHECK ${production?'production':'local'} neutral 0.5 revision ${doc.revision}; insert third card; 8 -> 9 groups; 2 new images`)
    if(!args.includes('--apply'))return
    const others=(await query('SELECT * FROM cms.Documents WHERE id<>@id ORDER BY id',{id:doc.id},tx)).recordset
    const history=(await query('SELECT id,documentId,body FROM cms.Versions ORDER BY id',{},tx)).recordset
    const user=(await query("SELECT id,role FROM cms.Users WHERE email='admin@sakura.local' AND role='admin' AND disabled=0",{},tx)).recordset[0];assert(user,'找不到原有效管理員')
    const saved=await changeDocument(doc.id,{action:'save',revision:doc.revision,body},user,tx)
    const published=await changeDocument(doc.id,{action:'publish',revision:saved.revision},user,tx)
    assert.equal(published.draftId,published.publishedId)
    assert.deepEqual(JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:published.publishedId},tx)).recordset[0].body),body)
    assert.deepEqual((await query('SELECT * FROM cms.Documents WHERE id<>@id ORDER BY id',{id:doc.id},tx)).recordset,others)
    assert.deepEqual((await query('SELECT id,documentId,body FROM cms.Versions WHERE id<>@id ORDER BY id',{id:published.publishedId},tx)).recordset,history)
    console.log(`UPDATED ${production?'production':'local'} neutral 0.5 revision ${published.revision}; published ${published.publishedId}; retained ${doc.publishedId}; other ${others.length} documents and ${history.length} versions unchanged`)
  })}finally{await(await database()).close()}
}
if(process.argv[1]&&import.meta.url===pathToFileURL(resolve(process.argv[1])).href)await main()
