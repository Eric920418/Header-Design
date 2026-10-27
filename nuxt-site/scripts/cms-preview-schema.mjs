import assert from 'node:assert/strict'
import sql from 'mssql'
import {readFile} from 'node:fs/promises'

const server='sakura-website-test-20260929.database.windows.net',database='SakuraWebsiteTest'
assert.equal(process.env.NUXT_DESIGN_DB_SERVER,server)
assert.equal(process.env.CMS_DB_DATABASE,database)
assert(process.env.AZURE_SQL_ADMIN_PASSWORD,'Missing configured database administrator credential')
assert(process.argv.slice(2).every(arg=>arg==='--apply'),'Only --apply is supported; omit it for a read-only check')
const ddl=(await readFile(new URL('../server/cms/schema.sql',import.meta.url),'utf8')).match(/IF OBJECT_ID\('cms\.PreviewSessions'\) IS NULL BEGIN[\s\S]*?\nEND;/)?.[0]
assert(ddl,'Missing standalone preview table migration')
const pool=await new sql.ConnectionPool({server,database,user:'sakura_admin',password:process.env.AZURE_SQL_ADMIN_PASSWORD,options:{encrypt:true,trustServerCertificate:false},connectionTimeout:60000,requestTimeout:30000}).connect()
let tx
try{
 assert.equal((await pool.query('SELECT DB_NAME() AS name')).recordset[0].name,database)
 const existing=(await pool.query("SELECT OBJECT_ID('cms.PreviewSessions') AS id")).recordset[0].id
 if(!existing&&!process.argv.includes('--apply'))console.log('Pending: add only cms.PreviewSessions; no existing data will be changed. Re-run with --apply.')
 else{
  tx=new sql.Transaction(pool);await tx.begin()
  const before=(await new sql.Request(tx).query('SELECT id,revision,draftId,publishedId,updatedAt FROM cms.Documents ORDER BY id')).recordset
  await new sql.Request(tx).query(ddl)
  const columns=(await new sql.Request(tx).query("SELECT c.name,t.name AS type,c.max_length FROM sys.columns c JOIN sys.types t ON t.user_type_id=c.user_type_id WHERE c.object_id=OBJECT_ID('cms.PreviewSessions') ORDER BY c.column_id")).recordset
  assert.deepEqual(columns.map(c=>[c.name,c.type,c.max_length]),[['id','varchar',64],['userId','uniqueidentifier',16],['body','varbinary',-1],['createdAt','datetime2',8],['expiresAt','datetime2',8]],'Existing preview schema differs; stopped without overwriting')
  assert.deepEqual((await new sql.Request(tx).query('SELECT id,revision,draftId,publishedId,updatedAt FROM cms.Documents ORDER BY id')).recordset,before)
  await tx.commit();tx=undefined
  console.log(existing?'Verified existing preview table; no schema or content changes.':'Created only cms.PreviewSessions and its indexes; existing content unchanged.')
 }
}catch(error){if(tx)await tx.rollback().catch(()=>{});throw error}
finally{await pool.close()}
