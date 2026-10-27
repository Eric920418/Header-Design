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
for (const [brand, total, count] of [['sakura', 749, 9], ['svago', 60, 8], ['teka', 38, 8]]) {
  const data = await (await get(`/api/products/${brand}/categories`)).json()
  assert.equal(data.total, total)
  assert.equal(data.categories.length, count)
  if (brand === 'sakura') assert.deepEqual(data.categories.map(category => category.id), [6, 7, 162, 8, 48, 83307, 5, 83227, 9], 'SAKURA 分類須符合客戶截圖的九項及順序')
  const html = await (await get(`/products/${brand}`)).text()
  const allProducts=await(await get(`/products/${brand}/all`)).text()
  assert.match(allProducts,/<em[^>]*>Smart Kitchen Living<\/em>/,`${brand}: 全部產品英文需一致`)
  assert.match(allProducts,/aria-label="產品清單"/,`${brand}: 全部產品仍須顯示商品`)
  assert(!allProducts.includes('aria-label="產品系列"'), `${brand}: 全部產品不可變成分類頁`)
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
    const categoryPage=await(await get(category.route)).text()
    assert.match(categoryPage,/<em[^>]*>Smart Kitchen Living<\/em>/,`${brand}/${category.title}: 分類列表英文需一致`)
    if (list.children.length) {
      const grid = categoryPage.match(/<ul[^>]*aria-label="產品系列"[\s\S]*?<\/ul>/)?.[0]
      assert(grid, `${brand}/${category.title}: 有子分類時必須先選系列`)
      assert.equal([...grid.matchAll(/<a\b/g)].length, list.children.length)
      for (const child of list.children) {
        assert(grid.includes(`href="${child.route}"`), `${child.title} 需連到自己的分類`)
        assert(grid.includes(`共 ${child.count} 項產品`), `${child.title} 需顯示實際數量`)
        if (child.image) assert(grid.includes(`src="${child.image}"`), `${child.title} 需使用分類代表圖`)
      }
      assert(!categoryPage.includes('aria-label="產品清單"'), '選系列前不混入全產品')
      assert(!categoryPage.includes('aria-label="產品分頁"'), '系列頁不顯示產品頁碼')
      assert(!categoryPage.includes('class="near-suction-series"'), '不重複系列跑馬燈')
    } else {
      assert.match(categoryPage,/aria-label="產品清單"/,`${brand}/${category.title}: 葉分類保留產品列表`)
    }
    const response = await fetch(new URL(category.image, base), { method: 'HEAD', signal: AbortSignal.timeout(15000) })
    assert.equal(response.status, 200, `${category.title} 圖片無法載入`)
  }
  console.log(`PASS ${brand}: ${count} 張分類封面、SSR、列表連結、子分類選圖及 ${total} 項產品總數`)
}
const waterPage = await (await get('/products/sakura/category/9')).text()
assert.match(waterPage, /<em[^>]*>Smart Kitchen Living<\/em>/)
assert.match(waterPage, /<h1[^>]*>Kitchen Appliances<\/h1>/)
const faucetPage = await (await get('/products/sakura/category/83098')).text()
assert.match(faucetPage, /<em[^>]*>Smart Kitchen Living<\/em>/)
const hood = await (await get('/api/products/sakura/items?category=6')).json()
assert.deepEqual(hood.children.map(item => item.title), ['近吸系列','歐化系列','隱藏系列','流線系列','深罩系列','斜背系列','輕巧系列','配備'])
for (const series of hood.children) {
  const list = await (await get(`/api/products/sakura/items?category=${series.id}`)).json()
  assert.equal(list.total, series.count)
  assert(list.items.every(item => item.classIds.includes(series.id)))
  const page = await (await get(series.route)).text()
  assert.match(page, /aria-label="產品清單"/)
  assert(!page.includes('aria-label="產品系列"'))
  for (const item of list.items) assert(page.includes(`href="${item.route}?category=${series.id}&amp;page=1"`), '詳細頁返回需保留所選系列')
}
const legacyHood = await (await get('/products/sakura/range-hood')).text()
assert.match(legacyHood, /aria-label="產品系列"/)
const searchedHood = await (await get('/products/sakura/category/6?q=R7600')).text()
assert.match(searchedHood, /aria-label="產品清單"/)
assert(!searchedHood.includes('aria-label="產品系列"'))
console.log('PASS 三品牌父分類先選系列、葉分類／全部產品／搜尋維持產品列表；除油煙機八系列內容及舊網址')
console.log('PASS 三品牌全部產品／分類／淨水／龍頭列表統一英文標題，Hero保留')
