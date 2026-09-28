import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import sql from 'mssql'
import { connect, loadSnapshots, parseLiteralRows } from './design-db.mjs'
import { loadProductSnapshots, importProducts } from './product-db.mjs'

const snapshots = loadProductSnapshots()
assert.equal(loadSnapshots().Cases.length,25, '共用 literal parser 不可破壞設計案例')
assert.throws(() => parseLiteralRows("INSERT INTO [sync].[Products] ([id]) VALUES (GETDATE())\nGO", 'Products', ['id']))
const pool = await connect()
try {
  const repeated = await importProducts(pool, snapshots)
  assert(Object.values(repeated).every(count => count.inserted === 0), '重複匯入不可新增或覆寫')
  for (const [name, rows] of Object.entries(snapshots)) {
    assert.equal((await pool.query(`SELECT COUNT(*) AS n FROM sync.BuyKitchen${name}`)).recordset[0].n, rows.length)
  }
  assert.equal((await pool.query('SELECT COUNT(*) AS n FROM sync.DesignCloudCases')).recordset[0].n,25)
  const failing = structuredClone(snapshots)
  const testId = 2147000000
  assert.equal((await pool.request().input('id',sql.Int,testId).query('SELECT id FROM sync.BuyKitchenClasses WHERE id=@id')).recordset.length,0)
  failing.Classes.push({ ...failing.Classes[0], id: testId, name: 'rollback-test' })
  failing.Products[0].model += '-CONFLICT-TEST'
  await assert.rejects(importProducts(pool,failing), /衝突/)
  assert.equal((await pool.request().input('id',sql.Int,testId).query('SELECT id FROM sync.BuyKitchenClasses WHERE id=@id')).recordset.length,0, '失敗匯入必須完整回滾')
} finally { await pool.close() }
const reader = await connect('reader')
try { await assert.rejects(reader.query("UPDATE sync.BuyKitchenProducts SET model=N'test' WHERE 1=0"), /permission|拒絕|權限/i) } finally { await reader.close() }
console.log('PASS 八表筆數、重複匯入不覆寫、衝突回滾、唯讀權限、設計案例回歸')

const base = process.env.TEST_BASE_URL || 'http://localhost:3100'
const password = process.env.PREVIEW_PASSWORD || /previewPassword: '([^']+)'/.exec(readFileSync(new URL('../nuxt.config.ts',import.meta.url),'utf8'))?.[1]
const login = await fetch(`${base}/api/preview-access`, { method:'POST', headers:{'content-type':'application/json'}, body:JSON.stringify({password}) })
assert.equal(login.status,200)
const cookie = login.headers.getSetCookie().map(value => value.split(';')[0]).join('; ')
async function get(path, status=200) {
  const response = await fetch(base+path,{headers:{cookie}})
  const text = await response.text()
  assert.equal(response.status,status,`${path}: ${text.slice(0,300)}`)
  return response.headers.get('content-type')?.includes('json') ? JSON.parse(text) : text
}
const totals = { sakura:749, svago:60, teka:38 }, assets = new Set(), missing = {}
const all = []
for (const [brand,total] of Object.entries(totals)) {
  const categories = await get(`/api/products/${brand}/categories`)
  assert.equal(categories.total,total)
  const first = await get(`/api/products/${brand}/items`)
  assert.equal(first.items.length,12)
  assert.equal(first.pages,Math.ceil(total/12))
  const items=[...first.items]
  for(let page=2;page<=first.pages;page++) items.push(...(await get(`/api/products/${brand}/items?page=${page}`)).items)
  assert.equal(new Set(items.map(item=>item.id)).size,total)
  all.push(...items.map(item=>({...item,brand})))
  let checkedSeriesLinks = false
  for (const category of categories.allCategories) {
    const result = await get(`/api/products/${brand}/items?category=${category.id}`)
    assert.equal(result.total,category.count)
    assert(result.items.every(item=>item.classIds.includes(category.id)))
    if (!checkedSeriesLinks && result.children.length) {
      const html = await get(category.route)
      const marquee = html.match(/<section[^>]*class="near-suction-series"[\s\S]*?<\/section>/)?.[0]
      assert(marquee, `${brand} 產品系列跑馬燈應存在`)
      const links = [...marquee.matchAll(/<a\b[^>]*>/g)].map(match=>match[0])
      assert.equal(links.length,result.children.length*2)
      for (const child of result.children) assert.equal(links.filter(link=>link.includes(`href="${child.route}"`)).length,2, `${child.title} 必須連到自己的列表`)
      assert.equal(links.filter(link=>link.includes('tabindex="-1"')).length,result.children.length, '複製組不重複進入 Tab 順序')
      checkedSeriesLinks = true
    }
  }
  assert(checkedSeriesLinks, `${brand} 必須驗證系列連結`)
  assert.equal((await get(`/api/products/${brand}/items?q=no-such-model-zzzz`)).total,0)
  await get(`/api/products/${brand}/items?page=0`,400)
  await get(`/api/products/${brand}/items?page=999999`,400)
  await get(`/api/products/${brand}/items?category=999999`,404)
  await get(`/api/products/${brand}/items?q=a&q=b`,400)
  await get(`/api/products/${brand}/items?unknown=1`,400)
  await get(`/api/products/${brand}/items/99999999`,404)
  assert.equal((await get(`/api/products/${brand}/items?q=${encodeURIComponent("' OR 1=1 --")}`)).total,0)
  const html = await get(`/products/${brand}`)
  assert(html.includes(`Elevate Your`) && html.includes(brand.toUpperCase()))
  assert(!html.includes('分類快照'))
  console.log(`PASS ${brand}: ${total} 項，${first.pages} 頁，${categories.allCategories.length} 分類，搜尋／SSR／參數驗證`)
}
await get('/api/products/electrolux/items',404)
await get('/api/products/teka/items/81932',404)
await get('/api/products/sakura/items/invalid-id',400)
await get('/api/products/sakura/items/model:r7615')
for (const path of ['/products/sakura/range-hood','/products/sakura/range-hood/near-suction','/products/sakura/range-hood/near-suction/r7615']) assert((await get(path)).includes('近吸'))
await Promise.all(Array.from({length:4},async()=>{
  while(all.length) {
    const item=all.pop(), detail=await get(`/api/products/${item.brand}/items/${item.id}`)
    assert.equal(detail.id,item.id)
    assert.equal(detail.brand,item.brand)
    assert.equal(detail.model,item.model)
    const source=snapshots.Products.find(product=>product.id===item.id)
    assert.equal(detail.title,source.name.trim())
    const expectedProperties=new Set(snapshots.ProductProperties.filter(row=>row.model.trim()===item.model).map(row=>JSON.stringify([row.property.trim(),row.value.trim(),row.sort])))
    assert.equal(detail.properties.length,expectedProperties.size,`${item.model} 不得遺失規格`)
    missing[item.brand] ||= {images:0,features:0,prices:0,properties:0,attachments:0}
    for(const [field,key] of [['gallery','images'],['features','features'],['variants','prices'],['properties','properties'],['attachments','attachments']]) if(!detail[field].length) missing[item.brand][key]++
    detail.gallery.forEach(url=>assets.add(url))
    detail.attachments.forEach(file=>{assert(file.url.startsWith('https://buy.sakura.com.tw/'));assets.add(file.url)})
    assert(detail.related.every(related=>related.id!==item.id&&related.route.startsWith(`/products/${item.brand}/item/`)))
  }
}))
console.log('PASS 全部 847 筆產品 API、規格筆數、品牌隔離、附件安全及舊網址')
console.log('來源未提供的欄位（產品筆數，不以假資料補齊）',missing)
if(process.argv.includes('--assets')) {
  const queue=[...assets],failures=[]
  await Promise.all(Array.from({length:6},async()=>{
    while(queue.length){const url=queue.pop();try{const response=await fetch(url,{method:'HEAD',signal:AbortSignal.timeout(15000)});if(!response.ok)failures.push({status:response.status,url})}catch(error){failures.push({status:error.message,url})}}
  }))
  console.log(`外部圖片／附件 ${assets.size} 個，失敗 ${failures.length}`,JSON.stringify(failures))
  if(failures.length) process.exitCode=1
}
