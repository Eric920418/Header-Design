// Local, versioned content corrections. Never seed over existing CMS documents.
import assert from 'node:assert/strict'
import {readFile} from 'node:fs/promises'
import {join} from 'node:path'
import sharp from 'sharp'
import {database,query,transaction,digest} from '../server/cms/database.mjs'
import {readContent,getDocument,changeDocument,validate} from '../server/cms/content.mjs'
import {normalizeMedia,saveMedia} from '../server/cms/media.mjs'

const apply=process.argv.includes('--apply')
const assetDir=process.env.FRONTEND_ASSET_DIR
assert(assetDir,'請指定 FRONTEND_ASSET_DIR（2.2廚房產品型錄資料夾）')
assert.equal(process.env.NUXT_DESIGN_DB_SERVER,'127.0.0.1','本指令僅限本機')
assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE,'SakuraWebsiteDev','禁止寫入其他資料庫')
const cutouts={
  G2926G:'https://buy.sakura.com.tw/media/2538/G2926G.png',
  VE7770A:'https://buy.sakura.com.tw/media/12287/VE7770A_web-01.png',
  DR7796SXL:'https://buy.sakura.com.tw/media/7674/DR7796_800.png',
  DR7786B:'https://buy.sakura.com.tw/media/8048/DR7786BSXL_800.png',
  G2928G:'https://buy.sakura.com.tw/media/2605/G2928G.png',
  P0231:'https://buy.sakura.com.tw/media/6218/P0231.png',
  R7765S:'https://buy.sakura.com.tw/media/6061/R7765_web.png',
  E8890:'https://buy.sakura.com.tw/media/4534/E8890.png',
  R610HS:'https://buy.sakura.com.tw/media/12116/01.png',
}
try {
  const ids=['data-kitchenStyles','view-components-home-HomeWhatWeDo','data-productCatalogues','data-kitchenSeries']
  const docs=await Promise.all(ids.map(async id=>{
    const doc=await getDocument(id)
    assert.equal(doc.draftId,doc.publishedId,`${id} 有未發布草稿，停止以免覆蓋`)
    const body=await readContent(id)
    return {doc,body,previous:JSON.stringify(body)}
  }))
  const [styles,promise,catalogues,series]=docs
  const premium=styles.body.KITCHEN_STYLES.find(i=>i.slug==='premium')
  const hero=series.body.KITCHEN_SERIES_PAGES.find(i=>i.slug==='premium').heroSlides[0]
  assert(['/kitchen-styles/premium.jpg',hero].includes(premium.image),'君璽圖片已另行修改，請人工確認')
  premium.image=hero
  assert(['品牌承諾','Brand Commitment'].includes(promise.body.copy.text3),'品牌承諾小標已另行修改')
  promise.body.copy.text3='Brand Commitment'

  for(const [model,url] of Object.entries(cutouts)){
    const response=await fetch(url,{signal:AbortSignal.timeout(20000)})
    assert(response.ok,`${model} 素材 HTTP ${response.status}`)
    const image=sharp(Buffer.from(await response.arrayBuffer()))
    assert((await image.metadata()).hasAlpha&&!(await image.stats()).isOpaque,`${model} 並非透明去背圖`)
  }
  for(const page of series.body.KITCHEN_SERIES_PAGES)for(const item of page.equipment){
    // Existing AI Kitchen PNGs are already transparent; do not replace them.
    if(cutouts[item.model]&&item.image.startsWith('https://www.sakura-kitchenlife.com.tw/uploads/photos/shares/equipment/'))item.image=cutouts[item.model]
  }

  const pdf=await normalizeMedia(await readFile(join(assetDir,'櫻花整廚2026廚房配備型錄260909.pdf')),'application/pdf')
  const cover=await normalizeMedia(await readFile(join(assetDir,'2026_kitchenware_DM_0730-cover.jpg')),'image/jpeg')
  const catalogue=catalogues.body.PRODUCT_CATALOGUES.find(i=>i.id==='kitchenware-2026')
  assert(catalogue,'找不到廚房配備型錄項目')
  const oldPdf='https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/2026_kitchenware_DM_0730.pdf'
  if(catalogue.pdfUrl!==oldPdf){
    const current=(await query('SELECT hash FROM cms.Media WHERE id=@id',{id:catalogue.pdfUrl.replace('/media/','')})).recordset[0]
    assert.equal(current?.hash,digest(pdf.bytes),'型錄已另行修改，請人工確認')
  }
  const user=(await query("SELECT id,role FROM cms.Users WHERE email='admin@sakura.local' AND role='admin' AND disabled=0")).recordset[0]
  assert(user,'找不到有效本機管理員')
  async function media(file,name){
    const existing=(await query('SELECT id FROM cms.Media WHERE hash=@hash AND archived=0',{hash:digest(file.bytes)})).recordset[0]
    if(existing)return `/media/${existing.id}`
    if(!apply)return '/media/00000000-0000-0000-0000-000000000000'
    return(await transaction(tx=>saveMedia(file,name,user.id,tx))).src
  }
  catalogue.pdfUrl=await media(pdf,'櫻花整廚2026廚房配備型錄260909.pdf')
  catalogue.cover=await media(cover,'2026_kitchenware_DM_0730-cover.jpg')
  for(const {doc,body,previous} of docs){
    validate(body,JSON.parse(doc.schemaJson))
    if(JSON.stringify(body)===previous){console.log(`UNCHANGED ${doc.id}`);continue}
    if(!apply){console.log(`CHECK ${doc.id}`);continue}
    const saved=await changeDocument(doc.id,{action:'save',revision:doc.revision,body},user)
    await changeDocument(doc.id,{action:'publish',revision:saved.revision},user)
    console.log(`UPDATED ${doc.id}; retained previous version ${doc.publishedId}`)
  }
} finally {await(await database()).close()}
