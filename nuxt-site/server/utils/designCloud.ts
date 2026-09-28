import sql from 'mssql'
import { createError, type H3Event } from 'h3'

let connection: Promise<sql.ConnectionPool> | undefined

export async function withDesignDb<T>(event: H3Event, run: (pool: sql.ConnectionPool) => Promise<T>): Promise<T> {
  const config = useRuntimeConfig(event).designDb
  try {
    const missing = ['server', 'database', 'user', 'password'].filter(key => !config[key as keyof typeof config])
    if (missing.length) throw createError({ statusCode: 503, message: `缺少伺服器端資料庫設定：${missing.map(k => `NUXT_DESIGN_DB_${k.toUpperCase()}`).join(', ')}`, data: { code: 'DB_CONFIG_MISSING' } })
    if (!connection) {
      const pool = new sql.ConnectionPool({
        server: config.server, port: Number(config.port), database: config.database, user: config.user, password: config.password,
        options: { encrypt: String(config.encrypt) !== 'false', trustServerCertificate: String(config.trustServerCertificate) === 'true' },
        connectionTimeout: 8000, requestTimeout: 15000, pool: { max: 5, min: 0, idleTimeoutMillis: 30000 },
      })
      pool.on('error', () => { connection = undefined; void pool.close().catch(() => {}) })
      connection = pool.connect().catch(async error => { connection = undefined; await pool.close(); throw error })
    }
    return await run(await connection)
  } catch (error: any) {
    if (error.statusCode && error.statusCode < 500) throw error
    const code = String(error.data?.code ?? error.code ?? 'DB_QUERY_FAILED')
    let reason = String(error.message ?? '資料庫查詢失敗')
    if (config.password) reason = reason.split(config.password).join('[已遮蔽]')
    reason = reason.replace(/(password|pwd)\s*[=:]\s*[^;\s]+/gi, '$1=[已遮蔽]')
    throw createError({ statusCode: 503, statusMessage: 'Design database unavailable', message: reason, data: { code, reason } })
  }
}

export function designQuery(query: Record<string, unknown>) {
  for (const key of Object.keys(query)) {
    if (!['form', 'style', 'page'].includes(key)) throw createError({ statusCode: 400, message: `不支援參數：${key}` })
    if (typeof query[key] !== 'string') throw createError({ statusCode: 400, message: `${key} 必須是單一字串` })
  }
  let form = String(query.form ?? '').trim()
  if (form === 'ㄇ型+中島') form = 'ㄇ字型+中島'
  const style = String(query.style ?? '').trim()
  const page = String(query.page ?? '1')
  if (form.length > 50 || style.length > 50 || !/^[1-9]\d{0,5}$/.test(page)) throw createError({ statusCode: 400, message: '型式／風格最多 50 字；page 必須是 1–999999 的整數' })
  return { form, style, page: Number(page) }
}

export const filterSql = `SELECT RTRIM(t.name) AS name, RTRIM(parent.name) AS category
  FROM sync.DesignCloudTags t JOIN sync.DesignCloudTags parent ON parent.id=t.pid
  WHERE parent.name IN (N'型式', N'設計風格')
  ORDER BY CASE WHEN t.Sort IS NULL THEN 1 ELSE 0 END, t.Sort, t.name, t.id`

export const caseSelect = `SELECT c.id, c.name AS title, c.exp AS description,
  (SELECT TOP (1) url FROM sync.DesignCloudFiles WHERE caseId=c.id AND type='Image'
    ORDER BY mainImage DESC, CASE WHEN sort IS NULL THEN 1 ELSE 0 END, sort, url) AS cover,
  (SELECT TOP (1) RTRIM(t.name) FROM sync.DesignCloudCaseTags ct JOIN sync.DesignCloudTags t ON t.id=ct.tagId
    JOIN sync.DesignCloudTags p ON p.id=t.pid WHERE ct.caseId=c.id AND p.name=N'型式' ORDER BY t.id) AS form,
  (SELECT TOP (1) RTRIM(t.name) FROM sync.DesignCloudCaseTags ct JOIN sync.DesignCloudTags t ON t.id=ct.tagId
    JOIN sync.DesignCloudTags p ON p.id=t.pid WHERE ct.caseId=c.id AND p.name=N'設計風格' ORDER BY t.id) AS style
  FROM sync.DesignCloudCases c`

export const caseWhere = `WHERE c.isWebsite=1
  AND (@form=N'' OR EXISTS (SELECT 1 FROM sync.DesignCloudCaseTags ct JOIN sync.DesignCloudTags t ON t.id=ct.tagId
    JOIN sync.DesignCloudTags p ON p.id=t.pid WHERE ct.caseId=c.id AND p.name=N'型式' AND RTRIM(t.name)=@form))
  AND (@style=N'' OR EXISTS (SELECT 1 FROM sync.DesignCloudCaseTags ct JOIN sync.DesignCloudTags t ON t.id=ct.tagId
    JOIN sync.DesignCloudTags p ON p.id=t.pid WHERE ct.caseId=c.id AND p.name=N'設計風格' AND RTRIM(t.name)=@style))`
