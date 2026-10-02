// Local proposal assets and versioned content; never replace an unpublished draft.
import assert from 'node:assert/strict'
import {readFile,writeFile,mkdir} from 'node:fs/promises'
import {join} from 'node:path'
import sharp from 'sharp'
import {database,query,digest} from '../server/cms/database.mjs'
import {getDocument,readContent,changeDocument} from '../server/cms/content.mjs'

const apply=process.argv.includes('--apply')
const source=process.env.BUILDERS_ASSET_DIR
assert(source,'請指定 BUILDERS_ASSET_DIR（提案後新增用圖／6.2建商專區）')
assert.equal(process.env.NUXT_DESIGN_DB_SERVER||'127.0.0.1','127.0.0.1','僅限本機')
assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE||'SakuraWebsiteDev','SakuraWebsiteDev','禁止寫入其他資料庫')
const prefix='/section-6/builders/proposal-20261002/'
const assets=[
 ['6.2design45m.png','design-modules.webp',1600],
 ['6.2aifactory.PNG','ai-factory.webp',1280],
 ['6.2platform.PNG','project-platform.webp',1280],
 ['6.2HOMEinONE.png','home-in-one.webp',1600],
 ['6.2professional-personalized-dedicatedSupport.PNG','dedicated-services.webp',1280],
 ['6.2iCare.PNG','icare.webp',1280],
]
try{
 const id='view-pages-builders-index',doc=await getDocument(id)
 assert.equal(doc.draftId,doc.publishedId,'有未發布草稿，停止以免覆蓋')
 const previous=await readContent(id),body=structuredClone(previous)
 assert.equal(body.strengths.length,3)
 const directory=new URL('../../public'+prefix,import.meta.url)
 if(apply)await mkdir(directory,{recursive:true})
 for(const [original,name,width]of assets){
  const bytes=await sharp(await readFile(join(source,original))).rotate().resize({width,withoutEnlargement:true}).webp({quality:90}).toBuffer()
  const meta=await sharp(bytes).metadata()
  assert(meta.width<=width&&meta.height>0&&bytes.length<2*1024*1024,original+' 最佳化檢查失敗')
  const target=new URL(name,directory)
  try{assert.equal(digest(await readFile(target)),digest(bytes),name+' 已存在不同內容，未覆寫')}
  catch(error){if(error.code!=='ENOENT')throw error;if(apply)await writeFile(target,bytes,{flag:'wx'})}
  console.log(`${apply?'READY':'CHECK'} ${prefix+name} ${meta.width}×${meta.height} ${bytes.length} bytes`)
 }
 const old=['catalog-background.png','factory-background.png','management-background.png']
 for(let i=0;i<3;i++){
  const next=prefix+assets[i][1]
  assert([`/section-6/builders/capability-banners/${old[i]}`,next].includes(body.strengths[i].background),'素材已被另行修改，停止')
  body.strengths[i].background=next
 }
 assert(['/section-6/builders/i-care-service.png',prefix+'icare.webp'].includes(body.copy.field28),'iCare 素材已被另行修改，停止')
 body.copy.field28=prefix+'icare.webp'
 body.copy.field29='SAKURA iCare 時刻在乎・永恆守護：以智能平台整合永久免費服務，掃描產品 QR Code，享受櫻花的安心守護。'
 const unchanged=structuredClone(body)
 unchanged.strengths.forEach((item,i)=>{item.background=previous.strengths[i].background})
 unchanged.copy.field28=previous.copy.field28;unchanged.copy.field29=previous.copy.field29
 assert.deepEqual(unchanged,previous,'只能更新本次圖片與 iCare 替代文字')
 if(apply&&JSON.stringify(body)!==JSON.stringify(previous)){
  const actor=(await query("SELECT TOP 1 id,role FROM cms.Users WHERE role='admin' AND disabled=0 ORDER BY email")).recordset[0]
  assert(actor,'找不到本機管理員')
  const saved=await changeDocument(id,{action:'save',revision:doc.revision,body},actor)
  await changeDocument(id,{action:'publish',revision:saved.revision},actor)
  assert.deepEqual(await readContent(id),body)
  console.log('PASS 已發布新版本，保留原內容版本 '+doc.publishedId)
 }else console.log(apply?'PASS 內容不變，未建立重複版本':'CHECK 僅檢查，尚未写入')
}finally{await(await database()).close()}
