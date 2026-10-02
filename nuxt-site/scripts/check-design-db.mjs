import assert from 'node:assert/strict'
import { randomUUID } from 'node:crypto'
import sql from 'mssql'
import { connect, importSnapshots, loadSnapshots, parseSnapshot, tables } from './design-db.mjs'

const snapshots = loadSnapshots()
assert.equal(parseSnapshot("INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (N'id', N'a''b\n文字', NULL)\nGO", 'Tags')[0].name, "a'b\n文字")
assert.throws(() => parseSnapshot("INSERT INTO [guest].[DesignCloudTags] ([id], [name], [pid]) VALUES (NEWID(), N'name', NULL)\nGO", 'Tags'))
const pool = await connect()
const reader = await connect('reader')
const admin = await connect('sa')
const newId = randomUUID()
try {
  for (const [name, definition] of Object.entries(tables)) {
    assert.equal((await pool.query(`SELECT COUNT(*) AS n FROM sync.DesignCloud${name}`)).recordset[0].n, definition.count)
  }
  const repeat = await importSnapshots(pool)
  for (const [name, definition] of Object.entries(tables)) assert.deepEqual(repeat[name], { inserted: 0, unchanged: definition.count })
  const conflict = structuredClone(snapshots)
  conflict.Cases.unshift({ ...conflict.Cases[0], id: newId })
  conflict.Cases[1].name = 'conflict test must not persist'
  await assert.rejects(importSnapshots(pool, conflict), /衝突.*回滾/)
  assert.equal((await pool.request().input('id', newId).query('SELECT COUNT(*) AS n FROM sync.DesignCloudCases WHERE id=@id')).recordset[0].n, 0)
  const broken = structuredClone(snapshots)
  broken.Cases.unshift({ ...broken.Cases[0], id: newId })
  broken.CaseTags.push({ caseId: newId, tagId: randomUUID() })
  await assert.rejects(importSnapshots(pool, broken), /FOREIGN KEY/)
  assert.equal((await pool.request().input('id', newId).query('SELECT COUNT(*) AS n FROM sync.DesignCloudCases WHERE id=@id')).recordset[0].n, 0)
  const orphan = await pool.query(`SELECT COUNT(*) AS n FROM sync.DesignCloudCaseTags ct LEFT JOIN sync.DesignCloudCases c ON c.id=ct.caseId LEFT JOIN sync.DesignCloudTags t ON t.id=ct.tagId WHERE c.id IS NULL OR t.id IS NULL`)
  assert.equal(orphan.recordset[0].n, 0)
  assert.equal((await pool.query("SELECT COUNT(*) AS n FROM sys.foreign_keys WHERE is_disabled=1 OR is_not_trusted=1")).recordset[0].n, 0)
  await assert.rejects(reader.query('UPDATE sync.DesignCloudCases SET name=name WHERE 1=0'), /permission was denied/i)
  await assert.rejects(pool.query('DELETE FROM sync.DesignCloudCases WHERE 1=0'), /permission was denied/i)
  await assert.rejects(importSnapshots(admin), /匯入只允許/)
  console.log('PASS snapshot parser, counts, idempotence, conflict rollback, FK rollback, relations, read-only/import permissions, database guard')

  const base = process.env.PREVIEW_URL || 'http://localhost:3100'
  // Read the local preview setting without logging it. Can override for a different test server.
  const { readFileSync } = await import('node:fs')
  const password = process.env.PREVIEW_PASSWORD || /previewPassword: '([^']+)'/.exec(readFileSync(new URL('../nuxt.config.ts', import.meta.url), 'utf8'))?.[1]
  const login = await fetch(`${base}/api/preview-access`, { method: 'POST', headers: { 'content-type': 'application/json' }, body: JSON.stringify({ password }) })
  assert.equal(login.status, 200)
  const cookie = login.headers.getSetCookie().map(value => value.split(';')[0]).join('; ')
  const get = async (path, expected = 200) => {
    const response = await fetch(base + path, { headers: { cookie } })
    const data = await response.json()
    assert.equal(response.status, expected, `${path}: ${JSON.stringify(data)}`)
    return data
  }
  const root = '/api/design-inspiration'
  const filters = await get(`${root}/filters`)
  assert(filters.forms.length >= 6); assert(filters.styles.length >= 7)
  assert(filters.forms.every(v => v === v.trim()))
  const pages = await Promise.all([1, 2, 3, 4].map(page => get(`${root}/cases?page=${page}`)))
  assert.deepEqual(pages.map(p => p.items.length), [9, 9, 9, 1])
  const items = pages.flatMap(p => p.items)
  assert.equal(new Set(items.map(v => v.id)).size, 28)
  assert.equal(items.filter(v => v.storeSlug).length, 3)
  assert.deepEqual((await get(`${root}/cases`)).items, pages[0].items)
  let emptyFound = false
  for (const form of filters.forms) for (const style of filters.styles) {
    const data = await get(`${root}/cases?${new URLSearchParams({ form, style })}`)
    assert.equal(data.total, items.filter(v => v.form === form && v.style === style).length)
    assert(data.items.every(v => v.form === form && v.style === style))
    if (!data.total) emptyFound = true
  }
  assert(emptyFound)
  assert.deepEqual(await get(`${root}/cases?${new URLSearchParams({ form: 'ㄇ型+中島' })}`), await get(`${root}/cases?${new URLSearchParams({ form: 'ㄇ字型+中島' })}`))
  for (const query of ['page=0', 'page=-1', 'page=1.5', 'page=abc', 'page=5', 'page=1&page=2', 'form=bad', 'style=bad', 'form=x%27%3BDROP%20TABLE', 'foo=1']) await get(`${root}/cases?${query}`, 400)
  await get(`${root}/cases/not-a-uuid`, 400)
  await get(`${root}/cases/${randomUUID()}`, 404)
  for (const item of items.filter(v => !v.storeSlug)) {
    const detail = await get(`${root}/cases/${item.id}`)
    assert.equal(detail.specs.length, 8)
    assert(detail.images.length > 0)
    assert.equal(detail.images[0], item.cover)
    assert(!JSON.stringify(detail).includes('/Pdf/'))
    assert(!JSON.stringify(detail).includes('/CaseFile/'))
  }
  // Only a newly generated test ID is committed/removed; existing rows are never changed.
  await admin.request().input('id', sql.VarChar(80), newId).query("INSERT INTO SakuraWebsiteDev.sync.DesignCloudCases(id,name,exp,isWebsite,isBoard) VALUES(@id,N'驗收測試',N'臨時驗收資料',0,1)")
  try {
    await get(`${root}/cases/${newId}`, 404)
    assert.equal((await get(`${root}/cases`)).total, 28)
    await admin.request().input('id', newId).query('UPDATE SakuraWebsiteDev.sync.DesignCloudCases SET isWebsite=1,isBoard=0 WHERE id=@id')
    await get(`${root}/cases/${newId}`)
    assert.equal((await get(`${root}/cases`)).total, 29)
  } finally { await admin.request().input('id', newId).query('DELETE FROM SakuraWebsiteDev.sync.DesignCloudCases WHERE id=@id') }
  const html = await (await fetch(base + '/design-inspiration', { headers: { cookie } })).text()
  assert(html.includes(items[0].id)); assert(!html.includes(process.env.WEBSITE_DB_READER_PASSWORD))
  assert(!html.includes(process.env.WEBSITE_DB_SA_PASSWORD))
  console.log('PASS API SSR, 9/9/7 pagination, 42 filter combinations, empty, invalid inputs, alias, 25 details, unpublished/IsBoard=0, no credential exposure')
} finally { await Promise.all([pool.close(), reader.close(), admin.close()]) }
