import sql from 'mssql'
import { createError, type H3Event } from 'h3'
import { isProductBrand } from '~/data/productBrands'
import type { ProductBrand, ProductSummary, ProductCategory, ProductCategories, ProductDetail, ProductList } from '~/types/products'
import { withDesignDb } from './designCloud'

const sourceBrands = { sakura: '櫻花', svago: 'SVAGO', teka: 'TEKA' }
const brandRoots = { sakura: [83301,83300], svago: [81002], teka: [83312] }
// SPA kitchen-products.vue 的專用分類封面，不以濾芯、皂液器或色樣代表整個分類。
const sakuraCategoryCovers: Record<number, string> = {
  9: 'menu-water-purifier.png', 83097: 'menu-hardware.jpg', 83098: 'menu-faucet.png',
  83100: 'menu-sink.png', 83377: 'menu-door-panel.png', 83378: 'menu-countertop.png',
}
export function requireProductBrand(value: unknown): ProductBrand {
  if (!isProductBrand(value)) throw createError({ statusCode: 404, message: '找不到指定的產品品牌' })
  return value
}
export function productQuery(query: Record<string, unknown>) {
  for (const key of Object.keys(query)) if (!['page','category','q'].includes(key) || typeof query[key] !== 'string') throw createError({ statusCode: 400, message: `不支援或重複參數：${key}` })
  const page = String(query.page ?? '1'), category = String(query.category ?? ''), q = String(query.q ?? '').trim()
  if (!/^[1-9]\d{0,5}$/.test(page) || (category && !/^[1-9]\d{0,8}$/.test(category)) || q.length > 100) throw createError({ statusCode: 400, message: 'page／category 必須是正整數；搜尋最多 100 字' })
  return { page: Number(page), category: category ? Number(category) : null, q }
}
function fileUrl(value: unknown): string | null {
  try { const url = new URL(String(value)); return url.protocol === 'https:' && url.hostname === 'buy.sakura.com.tw' && !url.username && !url.password ? url.href : null } catch { return null }
}
export async function productCatalog(event: H3Event, brand: ProductBrand) {
  return withDesignDb(event, async pool => {
    const request = pool.request().input('brand', sql.NVarChar(50), sourceBrands[brand])
    const rows = (await request.query(`SELECT p.id,p.model,p.name AS title,p.product_class_id_group AS classPath,
      (SELECT TOP(1) f.url FROM sync.BuyKitchenPublicFiles f WHERE f.product_id=p.id AND f.type IN ('main','product_images')
       ORDER BY CASE WHEN f.type='main' THEN 0 WHEN f.url LIKE N'%情境%' THEN 3 WHEN f.url LIKE N'%部件%' OR f.url LIKE N'%提籠%' OR f.url LIKE N'%排水管%' OR f.url LIKE N'%下水器%' THEN 2 ELSE 1 END,COALESCE(f.sort,2147483647),f.id) AS image,
      (SELECT MIN(price) FROM sync.BuyKitchenProductPrices WHERE product_id=p.id AND price>0) AS price
      FROM sync.BuyKitchenProducts p WHERE p.channel=N'展板' AND p.Brand=@brand ORDER BY p.name,p.model,p.id`)).recordset
    const items: ProductSummary[] = rows.map(row => ({ id: row.id, model: row.model.trim(), title: row.title.trim(), image: fileUrl(row.image), price: row.price,
      route: `/products/${brand}/item/${row.id}`, classIds: String(row.classPath ?? '').split(',').filter(id => /^\d+$/.test(id.trim())).map(Number) }))
    const classes = (await pool.query("SELECT id,parent_id,name,description,sort FROM sync.BuyKitchenClasses WHERE channel=N'展板' ORDER BY sort,id")).recordset
    const categories: ProductCategory[] = classes.map(row => {
      const members = items.filter(item => item.classIds.includes(row.id))
      return { id: row.id, parentId: row.parent_id, title: row.name.trim().replace(/^---\s*/, ''), description: row.description?.trim() || '', count: members.length,
        image: members.find(item => item.image && !/配件|部件|提籠|排水管|下水器|情境/.test(decodeURIComponent(item.image)))?.image ?? null, route: `/products/${brand}/category/${row.id}` }
    }).filter(category => category.count > 0)
    // 與 SPA 相同：優先沿分類 Sort 順序找最深層商品主圖，不跨品牌取圖。
    function categoryCover(category: ProductCategory, seen = new Set<number>()): string | null {
      if (seen.has(category.id)) return null
      seen.add(category.id)
      if (brand === 'sakura' && sakuraCategoryCovers[category.id]) return `/products/categories/${sakuraCategoryCovers[category.id]}`
      for (const child of categories.filter(child => child.parentId === category.id)) {
        const image = categoryCover(child, seen)
        if (image) return image
      }
      return category.image
    }
    const covers = categories.map(category => categoryCover(category))
    categories.forEach((category, index) => { category.image = covers[index] ?? null })
    return { items, categories }
  })
}
export async function getProductCategories(event: H3Event, brand: ProductBrand): Promise<ProductCategories> {
  const { items, categories } = await productCatalog(event, brand)
  const roots = brandRoots[brand]
  return { brand, total: items.length, allCategories: categories,
    categories: categories.filter(category => roots.includes(category.parentId) || (brand === 'sakura' && category.parentId === 0 && !roots.includes(category.id))) }
}
function ancestry(category: ProductCategory, categories: ProductCategory[], brand: ProductBrand) {
  const result: ProductCategory[] = [], seen = new Set<number>()
  let current: ProductCategory | undefined = category
  while (current && !seen.has(current.id)) { seen.add(current.id); if (!brandRoots[brand].includes(current.id)) result.unshift(current); current = categories.find(item => item.id === current?.parentId) }
  return result
}
export async function getProductList(event: H3Event, brand: ProductBrand, query: ReturnType<typeof productQuery>): Promise<ProductList> {
  const { items, categories } = await productCatalog(event, brand)
  const category = query.category === null ? null : categories.find(item => item.id === query.category)
  if (category === undefined) throw createError({ statusCode: 404, message: '此品牌沒有指定分類或分類尚無產品' })
  const filtered = items.filter(item => (!category || item.classIds.includes(category.id)) && (!query.q || `${item.model} ${item.title}`.toLowerCase().includes(query.q.toLowerCase())))
  const pageSize = 12, pages = Math.max(1, Math.ceil(filtered.length / pageSize))
  if (query.page > pages) throw createError({ statusCode: 400, message: `頁碼超出範圍，最多 ${pages} 頁` })
  return { items: filtered.slice((query.page-1)*pageSize,query.page*pageSize), total: filtered.length, page: query.page, pageSize, pages, category,
    ancestors: category ? ancestry(category,categories,brand) : [], children: category ? categories.filter(item => item.parentId === category.id) : [] }
}
export async function getProductDetail(event: H3Event, brand: ProductBrand, identifier: string): Promise<ProductDetail> {
  if (!/^[1-9]\d{0,8}$/.test(identifier) && !/^model:[\w-]{1,80}$/i.test(identifier)) throw createError({ statusCode: 400, message: '產品 ID 或舊版型號格式不正確' })
  const { items, categories } = await productCatalog(event,brand)
  const matches = items.filter(item => identifier.startsWith('model:') ? item.model.toLowerCase() === identifier.slice(6).toLowerCase() : item.id === Number(identifier))
  if (!matches.length) throw createError({ statusCode: 404, message: '找不到此品牌的產品' })
  if (matches.length > 1) throw createError({ statusCode: 409, message: '此型號有多筆產品，請從產品列表選擇' })
  const product = matches[0]!
  return withDesignDb(event, async pool => {
    const result = await pool.request().input('id',sql.Int,product.id).input('model',sql.NVarChar(255),product.model).query(`
      SELECT DISTINCT f.id,f.name FROM sync.BuyKitchenProductFeatures pf JOIN sync.BuyKitchenFeatures f ON f.id=pf.product_feature_id WHERE pf.product_id=@id ORDER BY f.id;
      SELECT id,size,price FROM sync.BuyKitchenProductPrices WHERE product_id=@id ORDER BY id;
      SELECT DISTINCT property,value,sort FROM sync.BuyKitchenProductProperties WHERE model=@model ORDER BY sort,property,value;
      SELECT id,type,url FROM sync.BuyKitchenPublicFiles WHERE product_id=@id ORDER BY CASE WHEN type='main' THEN 0 ELSE 1 END,COALESCE(sort,2147483647),id;`)
    const [features,prices,properties,files] = result.recordsets as unknown as Record<string,any>[][]
    const safeFiles = files!.map(row => ({ id: Number(row.id), type: String(row.type), url: fileUrl(row.url) })).filter(row => row.url)
    const gallery = [...new Set([product.image,...safeFiles.filter(file => ['main','product_images'].includes(file.type)).map(file => file.url)].filter((url): url is string => Boolean(url)))]
    const leaf = [...product.classIds].reverse().map(id => categories.find(category => category.id === id)).find(Boolean)
    return { ...product, brand, gallery, features: features!.map(row => String(row.name).trim()),
      variants: prices!.filter(row => row.price > 0).map(row => ({ model: row.size?.trim() || product.model, price: row.price })),
      properties: properties!.map(row => ({ label: String(row.property).trim(), value: String(row.value ?? '').trim() })),
      attachments: safeFiles.filter(file => ['使用手冊','型錄','保養手冊','RoHS','說明書','線稿'].includes(file.type)).map(file => ({ id: String(file.id), label: file.type, url: file.url! })),
      categories: leaf ? ancestry(leaf,categories,brand) : [], related: items.filter(item => item.id !== product.id && leaf && item.classIds.includes(leaf.id)).slice(0,8) }
  })
}
