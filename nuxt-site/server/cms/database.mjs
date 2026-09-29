import sql from 'mssql'
import { randomUUID, createHash, randomBytes, scryptSync, timingSafeEqual } from 'node:crypto'
export { sql, randomUUID }
let pool
export async function database() {
  if (!pool) {
    const p = new sql.ConnectionPool({ server: process.env.NUXT_DESIGN_DB_SERVER || '127.0.0.1', port: Number(process.env.NUXT_DESIGN_DB_PORT || 14333), database: process.env.CMS_DB_DATABASE || process.env.NUXT_DESIGN_DB_DATABASE || 'SakuraWebsiteDev', user: process.env.CMS_DB_USER || 'sakura_website_cms', password: process.env.CMS_DB_PASSWORD, options: {encrypt: true, trustServerCertificate: process.env.NUXT_DESIGN_DB_TRUST_SERVER_CERTIFICATE === 'true'}, pool: {max: 8, min: 0}, connectionTimeout: 8000, requestTimeout: 20000 })
    pool = p.connect().catch(e => {pool = undefined; throw e})
    p.on('error', () => {pool = undefined; void p.close()})
  }
  return pool
}
export async function query(text, params = {}, connection) {
  const request = new sql.Request(connection || await database())
  for (const [key,value] of Object.entries(params)) request.input(key, value === undefined ? null : value)
  const result = await request.query(text)
  for(const rows of result.recordsets || []) for(const row of rows) for(const key of Object.keys(row)) {
    if(typeof row[key]==='string' && /^[a-f0-9]{8}(-[a-f0-9]{4}){3}-[a-f0-9]{12}$/i.test(row[key])) row[key]=row[key].toLowerCase()
  }
  return result
}
export async function transaction(run) {
  const tx = new sql.Transaction(await database())
  await tx.begin(sql.ISOLATION_LEVEL.SERIALIZABLE)
  try {const result = await run(tx); await tx.commit(); return result} catch(e) {await tx.rollback().catch(()=>{}); throw e}
}
export function fail(statusCode, message) {throw Object.assign(new Error(message), {statusCode})}
export const digest = value => createHash('sha256').update(value).digest('hex')
export function passwordHash(password) {
  if (typeof password !== 'string' || password.length < 12 || password.length > 128) fail(400,'密碼須為 12–128 個字元')
  const salt = randomBytes(16).toString('hex')
  return `${salt}:${scryptSync(password,salt,64).toString('hex')}`
}
export function checkPassword(password, stored) {
  if (typeof password !== 'string' || password.length > 128) return false
  const [salt, hash] = stored.split(':')
  return timingSafeEqual(Buffer.from(hash,'hex'),scryptSync(password,salt,64))
}
export async function audit(actor, action, subject, tx) {
  await query('INSERT cms.Audit (actor,action,subject) VALUES (@actor,@action,@subject)', {actor,action,subject},tx)
}
export async function throttle(key, limit, seconds) {
  await transaction(async tx => {
    const until = new Date(Date.now()+seconds*1000)
    const row = (await query('SELECT * FROM cms.RateLimits WITH (UPDLOCK,HOLDLOCK) WHERE id=@id',{id:digest(key)},tx)).recordset[0]
    if (!row) await query('INSERT cms.RateLimits VALUES (@id,1,@until)',{id:digest(key),until},tx)
    else if (new Date(row.until)<=new Date()) await query('UPDATE cms.RateLimits SET hits=1,until=@until WHERE id=@id',{id:digest(key),until},tx)
    else {if(row.hits>=limit) fail(429,'操作過於頻繁，請稍後再試'); await query('UPDATE cms.RateLimits SET hits=hits+1 WHERE id=@id',{id:digest(key)},tx)}
  })
}
