import { readFileSync } from 'node:fs'
import { fileURLToPath } from 'node:url'
import sql from 'mssql'

export const tables = {
  Cases: { columns: ['id', 'name', 'exp', 'isWebsite', 'isBoard'], keys: ['id'], count: 25 },
  Tags: { columns: ['id', 'name', 'pid'], keys: ['id'], count: 46 },
  CaseTags: { columns: ['caseId', 'tagId'], keys: ['caseId', 'tagId'], count: 200 },
  Files: { columns: ['caseId', 'type', 'url', 'mainImage', 'sort'], keys: ['caseId', 'type', 'url'], count: 182 },
  Property: { columns: ['id', 'caseId', 'name', 'value', 'sort'], keys: ['id'], count: 200 },
}

// Only literal INSERT rows are decoded. No snapshot SQL is ever sent to SQL Server.
export function parseLiteralRows(source, table, expectedColumns) {
  const rows = []
  const inserts = /INSERT INTO \[(?:guest|sync)\]\.\[(\w+)\] \(([^)]*)\) VALUES \(([\s\S]*?)\)\s*\r?\nGO/g
  for (const match of source.matchAll(inserts)) {
    if (match[1] !== table) throw new Error('快照資料表不符')
    const columns = match[2].split(',').map(v => v.trim().replace(/^\[|\]$/g, ''))
    if (JSON.stringify(columns) !== JSON.stringify(expectedColumns)) throw new Error('快照欄位不符')
    const values = []; let remaining = match[3].trim()
    while (remaining) {
      const token = /^(?:N?'((?:''|[^'])*)'|(NULL)|(-?\d+))(\s*,\s*|\s*$)/.exec(remaining)
      if (!token) throw new Error(`無法解析 ${table} 資料列；只接受字串、整數、NULL`)
      values.push(token[2] ? null : token[3] !== undefined ? Number(token[3]) : token[1].replace(/''/g, "'"))
      remaining = remaining.slice(token[0].length)
    }
    if (values.length !== columns.length) throw new Error('快照欄位數不符')
    const row = Object.fromEntries(columns.map((column, i) => [column, values[i]]))
    rows.push(row)
  }
  if (rows.length !== (source.match(/^INSERT INTO /gm) ?? []).length) throw new Error('快照有未解析的 INSERT')
  return rows
}

export function parseSnapshot(source, table) {
  const definition = tables[table]
  if (!definition) throw new Error('未知快照資料表')
  const rows = parseLiteralRows(source, `DesignCloud${table}`, definition.columns)
  for (const row of rows) {
    for (const column of ['isWebsite', 'isBoard', 'mainImage', 'sort']) {
      if (column in row && row[column] !== null) {
        if (!/^-?\d+$/.test(String(row[column]))) throw new Error(`非法整數 ${column}`)
        row[column] = Number(row[column])
        if (column !== 'sort' && ![0, 1].includes(row[column])) throw new Error(`非法旗標 ${column}`)
      }
    }
  }
  return rows
}

export function loadSnapshots() {
  const result = {}
  for (const [name, definition] of Object.entries(tables)) {
    result[name] = parseSnapshot(readFileSync(new URL(`../../private/design-cloud/DesignCloud${name}.sql`, import.meta.url), 'utf8'), name)
    if (result[name].length !== definition.count) throw new Error(`${name} 預期 ${definition.count} 筆，實際 ${result[name].length}`)
  }
  return result
}

export async function connect(role = 'import') {
  const password = process.env[`WEBSITE_DB_${role.toUpperCase()}_PASSWORD`]
  if (!password) throw new Error(`缺少 WEBSITE_DB_${role.toUpperCase()}_PASSWORD`)
  return new sql.ConnectionPool({ server: '127.0.0.1', port: 14333,
    database: role === 'sa' ? 'master' : 'SakuraWebsiteDev',
    user: role === 'sa' ? 'sa' : `sakura_website_${role}`, password,
    options: { encrypt: true, trustServerCertificate: true },
  }).connect()
}

export async function initialize() {
  const pool = await connect('sa')
  try {
    await pool.query("IF DB_ID(N'SakuraWebsiteDev') IS NULL CREATE DATABASE [SakuraWebsiteDev] COLLATE Chinese_Taiwan_Stroke_CI_AS")
    for (const role of ['import', 'reader']) {
      const password = process.env[`WEBSITE_DB_${role.toUpperCase()}_PASSWORD`]
      if (!password) throw new Error(`缺少 ${role} 密碼`)
      // CREATE LOGIN cannot bind PASSWORD directly; QUOTENAME escapes the parameter server-side.
      await pool.request().input('password', sql.NVarChar(128), password).query(`
        IF SUSER_ID(N'sakura_website_${role}') IS NULL BEGIN
          DECLARE @statement nvarchar(max) = N'CREATE LOGIN [sakura_website_${role}] WITH PASSWORD = ' + QUOTENAME(@password, '''');
          EXEC sp_executesql @statement;
        END`)
    }
    await pool.query(`USE [SakuraWebsiteDev];
      IF SCHEMA_ID('sync') IS NULL EXEC('CREATE SCHEMA sync');
      IF OBJECT_ID('sync.DesignCloudCases') IS NULL CREATE TABLE sync.DesignCloudCases (
        id varchar(80) PRIMARY KEY, name nvarchar(100) NOT NULL, exp nvarchar(max) NOT NULL,
        isWebsite bit NOT NULL, isBoard bit NOT NULL);
      IF OBJECT_ID('sync.DesignCloudTags') IS NULL CREATE TABLE sync.DesignCloudTags (
        id varchar(80) PRIMARY KEY, name nvarchar(50) NOT NULL, pid varchar(80) NULL REFERENCES sync.DesignCloudTags(id), Sort int NULL);
      IF COL_LENGTH('sync.DesignCloudTags', 'Sort') IS NULL ALTER TABLE sync.DesignCloudTags ADD Sort int NULL;
      IF OBJECT_ID('sync.DesignCloudCaseTags') IS NULL CREATE TABLE sync.DesignCloudCaseTags (
        caseId varchar(80) NOT NULL REFERENCES sync.DesignCloudCases(id), tagId varchar(80) NOT NULL REFERENCES sync.DesignCloudTags(id), PRIMARY KEY(caseId, tagId));
      IF OBJECT_ID('sync.DesignCloudFiles') IS NULL CREATE TABLE sync.DesignCloudFiles (
        caseId varchar(80) NOT NULL REFERENCES sync.DesignCloudCases(id), type varchar(8) NOT NULL,
        url nvarchar(154) NOT NULL, mainImage bit NOT NULL, sort int NULL, PRIMARY KEY(caseId, type, url));
      IF OBJECT_ID('sync.DesignCloudProperty') IS NULL CREATE TABLE sync.DesignCloudProperty (
        id varchar(80) PRIMARY KEY, caseId varchar(80) NOT NULL REFERENCES sync.DesignCloudCases(id),
        name nvarchar(255) NULL, value nvarchar(max) NULL, sort int NULL);
      IF USER_ID('sakura_website_import') IS NULL CREATE USER sakura_website_import FOR LOGIN sakura_website_import;
      IF USER_ID('sakura_website_reader') IS NULL CREATE USER sakura_website_reader FOR LOGIN sakura_website_reader;
      GRANT SELECT, INSERT ON SCHEMA::sync TO sakura_website_import;
      DENY UPDATE, DELETE, ALTER ON SCHEMA::sync TO sakura_website_import;
      GRANT SELECT ON SCHEMA::sync TO sakura_website_reader;
      DENY INSERT, UPDATE, DELETE, ALTER ON SCHEMA::sync TO sakura_website_reader;
    `)
  } finally { await pool.close() }
}

export async function importSnapshots(pool, snapshots = loadSnapshots()) {
  const database = (await pool.query('SELECT DB_NAME() AS name')).recordset[0].name
  if (database !== 'SakuraWebsiteDev' || pool.config.server !== '127.0.0.1' || pool.config.port !== 14333) {
    throw new Error('匯入只允許 127.0.0.1:14333/SakuraWebsiteDev')
  }
  const tx = new sql.Transaction(pool)
  await tx.begin(sql.ISOLATION_LEVEL.SERIALIZABLE)
  const counts = {}; const conflicts = []
  try {
    for (const [table, definition] of Object.entries(tables)) {
      counts[table] = { inserted: 0, unchanged: 0 }
      const rows = table === 'Tags' ? [...snapshots[table]].sort((a, b) => Number(Boolean(a.pid)) - Number(Boolean(b.pid))) : snapshots[table]
      for (const row of rows) {
        const request = new sql.Request(tx)
        definition.columns.forEach(column => {
          const type = ['isWebsite', 'isBoard', 'mainImage'].includes(column) ? sql.Bit : column === 'sort' ? sql.Int : sql.NVarChar(sql.MAX)
          request.input(column, type, row[column])
        })
        const where = definition.keys.map(key => `[${key}] = @${key}`).join(' AND ')
        const existing = (await request.query(`SELECT ${definition.columns.map(c => `[${c}]`).join(',')} FROM sync.DesignCloud${table} WITH (UPDLOCK, HOLDLOCK) WHERE ${where}`)).recordset[0]
        if (existing) {
          const differences = definition.columns.filter(key => String(existing[key]) !== String(row[key]) && !(typeof existing[key] === 'boolean' && Number(existing[key]) === row[key]))
          if (differences.length) conflicts.push(`${table} ${definition.keys.map(k => row[k]).join('/')}：${differences.join(', ')}`)
          else counts[table].unchanged++
        } else {
          await request.query(`INSERT INTO sync.DesignCloud${table} (${definition.columns.map(c => `[${c}]`).join(',')}) VALUES (${definition.columns.map(c => `@${c}`).join(',')})`)
          counts[table].inserted++
        }
      }
    }
    if (conflicts.length) throw new Error(`既有資料衝突，不覆寫，整批回滾：\n${conflicts.join('\n')}`)
    await tx.commit()
    return counts
  } catch (error) {
    await tx.rollback()
    throw error
  }
}

if (process.argv[1] === fileURLToPath(import.meta.url)) {
  try {
    if (process.argv[2] === 'init') { await initialize(); console.log('SakuraWebsiteDev schema / accounts ready (no existing data overwritten)') }
    else if (process.argv[2] === 'import') {
      const pool = await connect()
      try { console.log(await importSnapshots(pool)) } finally { await pool.close() }
    } else throw new Error('用法：design-db.mjs init|import')
  } catch (error) { console.error(error.message); process.exitCode = 1 }
}
