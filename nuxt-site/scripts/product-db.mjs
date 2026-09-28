import { readFileSync } from 'node:fs'
import { fileURLToPath } from 'node:url'
import { createHash } from 'node:crypto'
import sql from 'mssql'
import { connect, parseLiteralRows } from './design-db.mjs'

// The same 展板 channel used by SPA. Original mixed-channel SQL stays private and untouched.
export const productTables = {
  Classes: { columns: ['id','channel','description','parent_id','name','sort'], keys: ['id'], count: 263 },
  Products: { columns: ['id','channel','product_class_id_group','product_class_name_group','Brand','model','name','erp_model'], keys: ['id'], count: 1023 },
  Features: { columns: ['id','name'], keys: ['id'], count: 1150 },
  ProductClass: { columns: ['product_id','product_class_id'], keys: ['product_id','product_class_id'], count: 2560 },
  ProductFeatures: { columns: ['product_id','product_feature_id'], keys: ['product_id','product_feature_id'], count: 3224 },
  ProductPrices: { columns: ['id','product_id','size','price'], keys: ['id'], count: 599 },
  ProductProperties: { columns: ['id','model','name','property','value','sort','rowKey'], keys: ['rowKey'], count: 7360 },
  PublicFiles: { columns: ['id','type','product_id','url','sort'], keys: ['id'], count: 2288 },
}
const integers = new Set(['id','parent_id','sort','product_id','product_class_id','product_feature_id','price'])
export function loadProductSnapshots() {
  return Object.fromEntries(Object.entries(productTables).map(([name, definition]) => {
    let rows = parseLiteralRows(readFileSync(new URL(`../../private/kitchen-buy/BuyKitchen${name}.sql`, import.meta.url), 'utf8'), `BuyKitchen${name}`, definition.columns.filter(column => column !== 'rowKey'))
    if (rows.length !== definition.count) throw Error(`${name} 預期 ${definition.count} 筆，實際 ${rows.length}`)
    if (definition.columns.includes('channel')) rows = rows.filter(row => row.channel === '展板')
    const unique = new Map()
    for (const row of rows) {
      for (const column of definition.columns.filter(column => integers.has(column))) {
        if (row[column] === null) continue
        if (!/^-?\d+$/.test(String(row[column])) || !Number.isSafeInteger(Number(row[column]))) throw Error(`${name}.${column} 非整數`)
        row[column] = Number(row[column])
      }
      // Upstream repeats id across different specifications and variants. Preserve id and every distinct row.
      if (name === 'ProductProperties') row.rowKey = createHash('sha256').update(JSON.stringify(row)).digest('hex')
      const key = definition.keys.map(key => row[key]).join('/')
      if (unique.has(key) && JSON.stringify(unique.get(key)) !== JSON.stringify(row)) throw Error(`${name} 快照 ID 衝突：${key}`)
      unique.set(key, row)
    }
    return [name, [...unique.values()]]
  }))
}

export async function initializeProducts() {
  const pool = await connect('sa')
  try {
    if (!(await pool.query("SELECT DB_ID('SakuraWebsiteDev') AS id")).recordset[0].id) throw Error('請先執行 db:init 建立獨立開發資料庫')
    for (const [name, definition] of Object.entries(productTables)) {
      const fields = definition.columns.map(column => `[${column}] ${integers.has(column) ? 'int' : column === 'rowKey' ? 'nvarchar(64)' : 'nvarchar(max)'} ${definition.keys.includes(column) ? 'NOT NULL' : 'NULL'}`)
      await pool.query(`USE SakuraWebsiteDev; IF OBJECT_ID('sync.BuyKitchen${name}') IS NULL CREATE TABLE sync.BuyKitchen${name} (${fields.join(',')}, PRIMARY KEY (${definition.keys.map(key => `[${key}]`).join(',')}));`)
    }
    await pool.query(`USE SakuraWebsiteDev;
      IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id=OBJECT_ID('sync.BuyKitchenPublicFiles') AND name='IX_BuyKitchenFiles_Product')
        CREATE INDEX IX_BuyKitchenFiles_Product ON sync.BuyKitchenPublicFiles(product_id,sort,id) INCLUDE(type,url);
      IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id=OBJECT_ID('sync.BuyKitchenProductPrices') AND name='IX_BuyKitchenPrices_Product')
        CREATE INDEX IX_BuyKitchenPrices_Product ON sync.BuyKitchenProductPrices(product_id) INCLUDE(price,size);
    `)
  } finally { await pool.close() }
}

export async function importProducts(pool, snapshots = loadProductSnapshots()) {
  const database = (await pool.query('SELECT DB_NAME() AS name')).recordset[0].name
  if (database !== 'SakuraWebsiteDev' || pool.config.server !== '127.0.0.1' || pool.config.port !== 14333) throw Error('匯入只允許 127.0.0.1:14333/SakuraWebsiteDev')
  const tx = new sql.Transaction(pool)
  await tx.begin(sql.ISOLATION_LEVEL.SERIALIZABLE)
  const counts = {}
  try {
    for (const [name, definition] of Object.entries(productTables)) {
      const stored = (await new sql.Request(tx).query(`SELECT * FROM sync.BuyKitchen${name} WITH (UPDLOCK,HOLDLOCK)`)).recordset
      const keyOf = row => definition.keys.map(key => row[key]).join('/')
      const byKey = new Map(stored.map(row => [keyOf(row),row]))
      const pending = []
      for (const row of snapshots[name]) {
        const existing = byKey.get(keyOf(row))
        if (!existing) pending.push(row)
        else {
          const changed = definition.columns.filter(column => existing[column] !== row[column])
          if (changed.length) throw Error(`BuyKitchen${name} ID ${keyOf(row)} 衝突 (${changed.join(',')})，不覆寫、整批回滾`)
        }
      }
      if (pending.length) {
        const batch = new sql.Table(`sync.BuyKitchen${name}`)
        definition.columns.forEach(column => batch.columns.add(column, integers.has(column) ? sql.Int : sql.NVarChar(column === 'rowKey' ? 64 : sql.MAX), { nullable: !definition.keys.includes(column) }))
        pending.forEach(row => batch.rows.add(...definition.columns.map(column => row[column])))
        await new sql.Request(tx).bulk(batch)
      }
      counts[name] = { inserted: pending.length, unchanged: snapshots[name].length - pending.length }
    }
    await tx.commit()
    return counts
  } catch (error) { await tx.rollback(); throw error }
}

if (process.argv[1] === fileURLToPath(import.meta.url)) {
  try {
    if (process.argv[2] === 'inspect') console.log(Object.fromEntries(Object.entries(loadProductSnapshots()).map(([name, rows]) => [name, rows.length])))
    else if (process.argv[2] === 'init') { await initializeProducts(); console.log('BuyKitchen tables ready; no existing rows changed') }
    else if (process.argv[2] === 'import') { const pool = await connect(); try { console.log(await importProducts(pool)) } finally { await pool.close() } }
    else throw Error('用法：product-db.mjs inspect|init|import')
  } catch (error) { console.error(error.message); process.exitCode = 1 }
}
