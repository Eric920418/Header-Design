import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'

// 唯讀 HTTP 回歸；不匯入或修改資料庫。
const base = process.env.TEST_BASE_URL || 'http://localhost:3100'
const password = process.env.PREVIEW_PASSWORD || /previewPassword: '([^']+)'/.exec(readFileSync(new URL('../nuxt.config.ts', import.meta.url), 'utf8'))?.[1]
const login = await fetch(`${base}/api/preview-access`, { method: 'POST', headers: { 'content-type': 'application/json' }, body: JSON.stringify({ password }) })
assert.equal(login.status, 200)
const cookie = login.headers.getSetCookie().map(value => value.split(';')[0]).join('; ')
async function get(path) {
  const response = await fetch(new URL(path, base), { headers: { cookie }, signal: AbortSignal.timeout(15000) })
  assert.equal(response.status, 200, path)
  return response
}
const covers = { 9: 'menu-water-purifier.png', 83097: 'menu-hardware.jpg', 83098: 'menu-faucet.png', 83100: 'menu-sink.png', 83377: 'menu-door-panel.png', 83378: 'menu-countertop.png' }
for (const [brand, total, count] of [['sakura', 749, 16], ['svago', 60, 8], ['teka', 38, 8]]) {
  const data = await (await get(`/api/products/${brand}/categories`)).json()
  assert.equal(data.total, total)
  assert.equal(data.categories.length, count)
  const html = await (await get(`/products/${brand}`)).text()
  for (const category of data.allCategories) {
    if (brand === 'sakura' && covers[category.id]) {
      assert.equal(category.image, `/products/categories/${covers[category.id]}`)
      const response = await get(category.image)
      assert(response.headers.get('content-type').startsWith('image/'))
      assert.deepEqual(Buffer.from(await response.arrayBuffer()), readFileSync(new URL(`../../public${category.image}`, import.meta.url)))
    } else {
      const child = data.allCategories.find(child => child.parentId === category.id && child.image)
      if (child) assert.equal(category.image, child.image, `${brand}/${category.title} 應依子分類順序選圖`)
    }
  }
  for (const category of data.categories) {
    assert(category.image, `${category.title} 缺封面`)
    assert(html.includes(`src="${category.image}"`), `${category.title} SSR 未使用分類封面`)
    assert(html.includes(`href="${category.route}"`))
    const list = await (await get(`/api/products/${brand}/items?category=${category.id}`)).json()
    assert.equal(list.total, category.count)
    const response = await fetch(new URL(category.image, base), { method: 'HEAD', signal: AbortSignal.timeout(15000) })
    assert.equal(response.status, 200, `${category.title} 圖片無法載入`)
  }
  console.log(`PASS ${brand}: ${count} 張分類封面、SSR、列表連結、子分類選圖及 ${total} 項產品總數`)
}
const waterPage = await (await get('/products/sakura/category/9')).text()
assert.match(waterPage, /<em[^>]*>Smart Appliances for Better Living<\/em>/)
assert.match(waterPage, /<h1[^>]*>Kitchen Appliances<\/h1>/)
const faucetPage = await (await get('/products/sakura/category/83098')).text()
assert.match(faucetPage, /<em[^>]*>SAKURA Kitchen Appliances<\/em>/)
console.log('PASS 淨水設備列表新標題，Hero 與其他分類標題不變')
