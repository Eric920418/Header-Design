import sql from 'mssql'
import { randomBytes } from 'node:crypto'
import { readFile, writeFile, mkdir, cp, access } from 'node:fs/promises'
import { resolve, join } from 'node:path'
import { homedir } from 'node:os'
import { fileURLToPath } from 'node:url'
import { database, query, transaction, passwordHash, randomUUID, digest } from '../server/cms/database.mjs'
const root = fileURLToPath(new URL('../../',import.meta.url))
const mediaRoot = process.env.CMS_MEDIA_DIR || join(homedir(),'.sakura-cms','media')
const tables = ['Documents','Versions','Users','Media','MediaRefs','Submissions','Comments','Audit']
async function initialize() {
 const admin = await new sql.ConnectionPool({server:'127.0.0.1',port:14333,user:'sa',password:process.env.WEBSITE_DB_SA_PASSWORD,database:process.env.NUXT_DESIGN_DB_DATABASE||'SakuraWebsiteDev',options:{encrypt:true,trustServerCertificate:true}}).connect()
 try {
  const envPath = join(root,'nuxt-site/.env'); let env=await readFile(envPath,'utf8')
  let password=process.env.CMS_DB_PASSWORD || /^CMS_DB_PASSWORD=(.+)$/m.exec(env)?.[1]
  if(!password){password=randomBytes(32).toString('base64url');env+=`\nCMS_DB_PASSWORD=${password}\nCMS_DB_USER=sakura_website_cms\nCMS_MEDIA_DIR=${mediaRoot}\n`;await writeFile(envPath,env,{mode:0o600})}
  process.env.CMS_DB_PASSWORD=password
  await admin.request().input('password',sql.NVarChar(128),password).query(`IF SUSER_ID('sakura_website_cms') IS NULL BEGIN DECLARE @q nvarchar(max)=N'CREATE LOGIN sakura_website_cms WITH PASSWORD='+QUOTENAME(@password,''''); EXEC sp_executesql @q; END;
   IF SCHEMA_ID('cms') IS NULL EXEC('CREATE SCHEMA cms');
   IF USER_ID('sakura_website_cms') IS NULL CREATE USER sakura_website_cms FOR LOGIN sakura_website_cms;`)
  const ddl=await readFile(new URL('../server/cms/schema.sql',import.meta.url),'utf8');await admin.query(ddl)
  await admin.query('GRANT SELECT,INSERT,UPDATE,DELETE ON SCHEMA::cms TO sakura_website_cms; GRANT SELECT ON SCHEMA::sync TO sakura_website_cms;')
  await mkdir(mediaRoot,{recursive:true}); console.log('CMS schema ready; source sync tables unchanged')
 }finally{await admin.close()}
}
async function seed() {
 const entries=JSON.parse(await readFile(process.argv[3]||new URL('../shared/cms/seed.json',import.meta.url),'utf8'))
 await transaction(async tx=>{for(const item of entries){
  const body=JSON.stringify(item.data), hash=digest(body)
  const existing=(await query('SELECT seedHash FROM cms.Documents WITH(UPDLOCK,HOLDLOCK) WHERE id=@id',{id:item.id},tx)).recordset[0]
  if(existing){if(existing.seedHash!==hash)throw new Error(`種子內容衝突：${item.id}；未覆寫任何內容`);await query('UPDATE cms.Documents SET schemaJson=@schema,title=@title WHERE id=@id',{id:item.id,schema:JSON.stringify(item.schema),title:item.title},tx);continue}
  await query('INSERT cms.Documents(id,title,category,route,schemaJson,seedHash) VALUES(@id,@title,@category,@route,@schema,@hash)',{id:item.id,title:item.title,category:item.category,route:item.route||'/',schema:JSON.stringify(item.schema),hash},tx)
  const version=randomUUID();await query('INSERT cms.Versions(id,documentId,body,actor) VALUES(@version,@id,@body,NULL); UPDATE cms.Documents SET draftId=@version,publishedId=@version WHERE id=@id',{id:item.id,version,body},tx)
 }});console.log(`Validated ${entries.length} content resources; existing edits retained`)
}
async function user(reset=false){
 const email=process.env.CMS_ADMIN_EMAIL?.trim().toLowerCase(),password=process.env.CMS_ADMIN_PASSWORD
 if(!email||!password)throw new Error('Set CMS_ADMIN_EMAIL and CMS_ADMIN_PASSWORD in the environment')
 const hash=passwordHash(password)
 await transaction(async tx=>{
 const row=(await query('SELECT id FROM cms.Users WITH(UPDLOCK,HOLDLOCK) WHERE email=@email',{email},tx)).recordset[0]
 if(row&&!reset)throw new Error('帳號已存在，未覆寫')
 if(!row)await query("INSERT cms.Users(id,email,name,password,role,mustChange) VALUES(@id,@email,N'管理員',@hash,'admin',1)",{id:randomUUID(),email,hash},tx)
 else await query('UPDATE cms.Users SET password=@hash,mustChange=1,disabled=0 WHERE id=@id; DELETE cms.Sessions WHERE userId=@id',{id:row.id,hash},tx)
 });console.log(reset?'Password reset; sessions revoked':'Administrator created; first login must change password')
}
async function backup(){
 const destination=resolve(process.argv[3]||join(homedir(),'.sakura-cms',`backup-${Date.now()}`));await mkdir(destination,{recursive:false,mode:0o700})
 // Keep a SERIALIZABLE read transaction while copying immutable media bytes.
 const data=await transaction(async tx=>{const snapshot={};for(const t of tables)snapshot[t]=(await query(`SELECT * FROM cms.${t}`,{},tx)).recordset;await cp(mediaRoot,join(destination,'media'),{recursive:true});return snapshot})
 await writeFile(join(destination,'cms.json'),JSON.stringify(data),{mode:0o600});console.log(destination)
}
async function restore(){
 const source=resolve(process.argv[3]||'');const target=process.env.CMS_RESTORE_DATABASE
 if(!target||!/^SakuraCmsRestore_[A-Za-z0-9_]+$/.test(target))throw new Error('Restore only accepts a NEW isolated CMS_RESTORE_DATABASE=SakuraCmsRestore_<name>')
 const snapshot=JSON.parse(await readFile(join(source,'cms.json'),'utf8'));const dir=join(homedir(),'.sakura-cms',target)
 try{await access(dir);throw new Error('還原目錄已存在')}catch(e){if(e.code!=='ENOENT')throw e}
 const config={server:'127.0.0.1',port:14333,user:'sa',password:process.env.WEBSITE_DB_SA_PASSWORD,database:'master',options:{trustServerCertificate:true}}
 let admin=await new sql.ConnectionPool(config).connect()
 try{
 if((await admin.request().input('name',target).query('SELECT DB_ID(@name) AS id')).recordset[0].id)throw new Error('還原資料庫已存在；拒絕覆蓋')
 await admin.query(`CREATE DATABASE [${target}]`)
 await admin.close();admin=await new sql.ConnectionPool({...config,database:target}).connect()
 await admin.query(`EXEC('CREATE SCHEMA cms'); CREATE USER sakura_website_cms FOR LOGIN sakura_website_cms; GRANT SELECT,INSERT,UPDATE,DELETE ON SCHEMA::cms TO sakura_website_cms;`)
 await admin.query(await readFile(new URL('../server/cms/schema.sql',import.meta.url),'utf8'))
 const tx=new sql.Transaction(admin);await tx.begin()
 try{for(const t of tables){for(const row of snapshot[t]){const req=new sql.Request(tx);const keys=Object.keys(row).filter(k=>k!=='sequence');for(const k of keys)req.input(k,row[k]);await req.query(`INSERT cms.${t} (${keys.map(k=>'['+k+']').join(',')}) VALUES (${keys.map(k=>'@'+k).join(',')})`)}}await tx.commit()}catch(e){await tx.rollback();throw e}
 await cp(join(source,'media'),dir,{recursive:true,errorOnExist:true,force:false});
 for(const t of tables){const count=(await admin.query(`SELECT COUNT(*) AS count FROM cms.${t}`)).recordset[0].count;if(count!==snapshot[t].length)throw new Error(`還原筆數不符 ${t}`)}
 for(const m of snapshot.Media){if(!/^[a-f0-9-]+\.[a-z0-9]+$/i.test(m.filename))throw new Error('素材檔名不安全');if(digest(await readFile(join(dir,m.filename)))!==m.hash)throw new Error(`素材校驗失敗：${m.id}`)}
 console.log(`Restored and verified ${target}; media: ${dir}; active sessions excluded`)
 }finally{await admin.close()}
}
try {const cmd=process.argv[2];if(cmd==='init')await initialize();else if(cmd==='seed')await seed();else if(cmd==='create-admin')await user();else if(cmd==='reset-password')await user(true);else if(cmd==='backup')await backup();else if(cmd==='restore')await restore();else throw new Error('Commands: init | seed | create-admin | reset-password | backup <new-dir> | restore <backup-dir>');process.exit(0)}catch(e){console.error(e.message);process.exit(1)}
