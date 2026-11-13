import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import {createHash} from 'node:crypto'
import {database,query,transaction} from '../server/cms/database.mjs'
import {getDocument,changeDocument,validate} from '../server/cms/content.mjs'

const descriptions={
  'sakura-kitchen-2026':'2026 年綜合商品版',
  'kitchenware-2026':'2026 年商品版',
  'sakura-stone-2024':'2024 年產品版',
  'sakura-all-2026':'2026 年廚電商品綜合版',
  'imported-appliances-2026':'2026 年 SVAGO／TEKA 綜合版',
}
const oldCover='/section-2/catalogues/catalog/covers/sakura-kitchen-2026.jpg'
const oldPdf='https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/2026_SAKURA%20KITCHEN_DM_260806.pdf'
const cover='/section-2/catalogues/catalog/covers/sakura-kitchen-2026-20261102.jpg'
const pdfUrl='/section-2/catalogues/catalog/files/sakura-kitchen-2026-20261102.pdf'
function update(original){
  assert.deepEqual(original.PRODUCT_CATALOGUES.map(item=>item.id).sort(),Object.keys(descriptions).sort(),'型錄清單已另行修改，停止以免覆蓋')
  const body=structuredClone(original)
  for(const item of body.PRODUCT_CATALOGUES){
    const year=descriptions[item.id].slice(0,4)
    assert([descriptions[item.id],year].includes(item.description),'描述已自訂，停止以免覆蓋')
    item.description=year
    if(item.id==='sakura-kitchen-2026'){
      assert([oldCover,cover].includes(item.cover)&&[oldPdf,pdfUrl].includes(item.pdfUrl),'封面或 PDF 已自訂，停止以免覆蓋')
      Object.assign(item,{cover,pdfUrl})
    }
  }
  const preserved=structuredClone(body)
  preserved.PRODUCT_CATALOGUES.forEach((item,i)=>{
    const previous=original.PRODUCT_CATALOGUES[i]
    item.description=previous.description
    if(item.id==='sakura-kitchen-2026')Object.assign(item,{cover:previous.cover,pdfUrl:previous.pdfUrl})
  })
  assert.deepEqual(preserved,original,'只能更新五筆年份及第一份 PDF／封面')
  return body
}
const args=process.argv.slice(2)
assert(args.every(arg=>['--apply','--self-check'].includes(arg)))
const bytes=readFileSync(new URL('../../public'+pdfUrl,import.meta.url))
assert.equal(createHash('sha256').update(bytes).digest('hex'),'7cdbc0583112092d3832a0324a4d93206b9a1401bc5506a18e6568cad701cfab','新版 PDF 與指定原檔不同')
if(args.includes('--self-check')){
  const seed=JSON.parse(readFileSync(new URL('../shared/cms/seed.json',import.meta.url),'utf8')).find(item=>item.id==='data-productCatalogues').data
  const original=structuredClone(seed)
  original.PRODUCT_CATALOGUES.forEach(item=>{item.description=descriptions[item.id]})
  Object.assign(original.PRODUCT_CATALOGUES[0],{cover:oldCover,pdfUrl:oldPdf})
  const before=structuredClone(original),body=update(original)
  assert.deepEqual(original,before);assert.deepEqual(body,seed);assert.deepEqual(update(body),body)
  const custom=structuredClone(original);custom.PRODUCT_CATALOGUES[1].description='後台自訂描述'
  assert.throws(()=>update(custom),/已自訂/)
  const customPdf=structuredClone(original);customPdf.PRODUCT_CATALOGUES[0].pdfUrl='/media/custom'
  assert.throws(()=>update(customPdf),/已自訂/)
  assert.throws(()=>update({PRODUCT_CATALOGUES:original.PRODUCT_CATALOGUES.slice(1)}),/清單已另行修改/)
  console.log('PASS 原檔 SHA256、五筆年份、單份檔案替換、其餘欄位保留、輸入不變、重跑與衝突保護')
}else{
  const env=new URL('../../.env.azure-runtime.local',import.meta.url)
  process.loadEnvFile(env)
  const server=readFileSync(env,'utf8').match(/^NUXT_DESIGN_DB_SERVER=(.+)$/m)?.[1].trim()
  assert(server?.endsWith('.database.windows.net'));assert.equal(process.env.NUXT_DESIGN_DB_SERVER,server)
  assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE,'SakuraWebsiteTest')
  assert.equal(process.env.CMS_DB_USER,'sakura_website_cms');assert.notEqual(process.env.NUXT_DESIGN_DB_TRUST_SERVER_CERTIFICATE,'true')
  try{await transaction(async tx=>{
    const doc=await getDocument('data-productCatalogues',tx)
    assert(doc.publishedId&&doc.draftId===doc.publishedId,'有未發布草稿，停止以免覆蓋')
    const original=JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:doc.publishedId},tx)).recordset[0].body)
    const body=update(original);validate(body,JSON.parse(doc.schemaJson))
    console.log('CHECK production product catalogues revision',doc.revision,'items',body.PRODUCT_CATALOGUES.length)
    if(!args.includes('--apply')||JSON.stringify(original)===JSON.stringify(body))return
    const others=(await query('SELECT * FROM cms.Documents WHERE id<>@id ORDER BY id',{id:doc.id},tx)).recordset
    const history=(await query('SELECT id,documentId,body FROM cms.Versions ORDER BY id',{},tx)).recordset
    const actor=(await query("SELECT id,role FROM cms.Users WHERE email='admin@sakura.local' AND role='admin' AND disabled=0",{},tx)).recordset[0];assert(actor)
    const saved=await changeDocument(doc.id,{action:'save',revision:doc.revision,body},actor,tx)
    const published=await changeDocument(doc.id,{action:'publish',revision:saved.revision},actor,tx)
    assert.equal(published.draftId,published.publishedId)
    assert.deepEqual(JSON.parse((await query('SELECT body FROM cms.Versions WHERE id=@id',{id:published.publishedId},tx)).recordset[0].body),body)
    assert.deepEqual((await query('SELECT * FROM cms.Documents WHERE id<>@id ORDER BY id',{id:doc.id},tx)).recordset,others)
    assert.deepEqual((await query('SELECT id,documentId,body FROM cms.Versions WHERE id<>@id ORDER BY id',{id:published.publishedId},tx)).recordset,history)
    console.log('UPDATED production product catalogues revision',published.revision,'published',published.publishedId,'retained',doc.publishedId)
  })}finally{await(await database()).close()}
}
