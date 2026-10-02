import sql from 'mssql'
import { readFile,writeFile,chmod } from 'node:fs/promises'
import { createHash,randomBytes } from 'node:crypto'
import { parseEnv } from 'node:util'
import { join } from 'node:path'
import { homedir } from 'node:os'
import { tables } from './design-db.mjs'
import { productTables } from './product-db.mjs'
// Deliberately fixed destination: this command must never become a general production restore.
const server='sakura-website-test-20260929.database.windows.net',database='SakuraWebsiteTest'
const names=[...Object.keys(tables).map(n=>`sync.DesignCloud${n}`),...Object.keys(productTables).map(n=>`sync.BuyKitchen${n}`),...['Documents','Versions','Users','Media','MediaRefs','Submissions','Comments','Audit'].map(n=>`cms.${n}`)]
const hash=b=>createHash('sha256').update(b).digest('hex')
const fingerprint=rows=>hash(JSON.stringify(rows.map(r=>JSON.stringify(r)).sort()))
const qi=s=>`[${s.replaceAll(']',']]')}]`
const runtimeFile=new URL('../../.env.azure-runtime.local',import.meta.url)
const config={server,port:1433,database,connectionTimeout:60000,requestTimeout:120000,options:{encrypt:true,trustServerCertificate:false,maxRetriesOnTransientErrors:0}}
let source,target,tx
try{
 if(!['import','verify'].includes(process.argv[2]))throw Error('Usage: azure-test-db.mjs import|verify')
 if(!process.env.AZURE_SQL_ADMIN_PASSWORD)throw Error('Missing AZURE_SQL_ADMIN_PASSWORD')
 source=await new sql.ConnectionPool({server:'127.0.0.1',port:14333,database:'SakuraWebsiteDev',user:'sa',password:process.env.WEBSITE_DB_SA_PASSWORD,options:{encrypt:true,trustServerCertificate:true}}).connect()
 target=await new sql.ConnectionPool({...config,user:'sakura_admin',password:process.env.AZURE_SQL_ADMIN_PASSWORD}).connect()
 if((await target.query('SELECT DB_NAME() AS name')).recordset[0].name!==database)throw Error('Destination guard failed')
 const snapshot={},metadata={}
 const localTx=new sql.Transaction(source);await localTx.begin(sql.ISOLATION_LEVEL.SERIALIZABLE)
 try{for(const name of names){snapshot[name]=(await new sql.Request(localTx).query(`SELECT * FROM ${name} WITH(HOLDLOCK)`)).recordset;metadata[name]=(await new sql.Request(localTx).input('name',name).query(`SELECT c.name,t.name AS type,c.max_length,c.precision,c.scale,c.is_nullable FROM sys.columns c JOIN sys.types t ON c.user_type_id=t.user_type_id WHERE c.object_id=OBJECT_ID(@name) ORDER BY c.column_id`)).recordset}await localTx.commit()}catch(e){await localTx.rollback();throw e}
 const media=[]
 for(const m of snapshot['cms.Media']){
  if(!/^[a-f0-9-]+\.[a-z0-9]+$/i.test(m.filename))throw Error('Unsafe media filename')
  const bytes=await readFile(join(process.env.CMS_MEDIA_DIR||join(homedir(),'.sakura-cms/media'),m.filename))
  if(hash(bytes)!==m.hash||bytes.length!==m.size)throw Error(`Source media hash mismatch: ${m.id}`)
  media.push({id:m.id,bytes})
 }
 async function verify(connection){
  for(const name of names){const actual=(await new sql.Request(connection).query(`SELECT * FROM ${name}`)).recordset;if(fingerprint(actual)!==fingerprint(snapshot[name]))throw Error(`Cloud mismatch: ${name}; no overwrite attempted`);console.log(`${name}: ${actual.length} rows verified`)}
  const hashes=(await new sql.Request(connection).query("SELECT id,CONVERT(varchar(64),HASHBYTES('SHA2_256',bytes),2) AS hash FROM cms.MediaBytes")).recordset
  if(hashes.length!==media.length)throw Error('Cloud media count mismatch')
  const byId=new Map(hashes.map(r=>[r.id.toLowerCase(),r.hash.toLowerCase()]))
  for(const m of media)if(byId.get(m.id.toLowerCase())!==hash(m.bytes))throw Error(`Cloud media hash mismatch: ${m.id}`)
  console.log(`Media: ${media.length} SHA-256 hashes verified`)
 }
 const existing=(await target.query('SELECT COUNT(*) AS n FROM sys.tables WHERE is_ms_shipped=0')).recordset[0].n
 if(existing){await verify(target);console.log('Existing identical data retained; no writes');}
 else{
  if(process.argv[2]==='verify')throw Error('Cloud database is empty')
  let runtime
  try{runtime=parseEnv(await readFile(runtimeFile,'utf8'))}catch(e){if(e.code!=='ENOENT')throw e;runtime={NUXT_DESIGN_DB_SERVER:server,NUXT_DESIGN_DB_PORT:'1433',NUXT_DESIGN_DB_DATABASE:database,NUXT_DESIGN_DB_USER:'sakura_website_reader',NUXT_DESIGN_DB_PASSWORD:randomBytes(32).toString('base64url'),NUXT_DESIGN_DB_ENCRYPT:'true',NUXT_DESIGN_DB_TRUST_SERVER_CERTIFICATE:'false',CMS_DB_DATABASE:database,CMS_DB_USER:'sakura_website_cms',CMS_DB_PASSWORD:randomBytes(32).toString('base64url'),CMS_MEDIA_STORAGE:'sql'};await writeFile(runtimeFile,Object.entries(runtime).map(([k,v])=>`${k}=${v}`).join('\n')+'\n',{flag:'wx',mode:0o600})}
  await chmod(runtimeFile,0o600)
  if(runtime.NUXT_DESIGN_DB_SERVER!==server||runtime.NUXT_DESIGN_DB_DATABASE!==database||!runtime.CMS_DB_PASSWORD||!runtime.NUXT_DESIGN_DB_PASSWORD)throw Error('Runtime credential file does not match target')
  tx=new sql.Transaction(target);await tx.begin(sql.ISOLATION_LEVEL.SERIALIZABLE)
  await new sql.Request(tx).query("EXEC('CREATE SCHEMA sync'); EXEC('CREATE SCHEMA cms');")
  for(const name of names.filter(n=>n.startsWith('sync.'))){
   const key=name.replace('sync.DesignCloud',''),productKey=name.replace('sync.BuyKitchen','')
   const keys=(tables[key]||productTables[productKey]).keys
   const fields=metadata[name].map(c=>{
    if(!['varchar','nvarchar','bit','int'].includes(c.type))throw Error(`Unexpected source type: ${c.type}`)
    const size=c.type.includes('varchar')?`(${c.max_length===-1?'max':c.max_length/(c.type==='nvarchar'?2:1)})`:''
    return `${qi(c.name)} ${c.type}${size} ${c.is_nullable?'NULL':'NOT NULL'}`
   })
   await new sql.Request(tx).query(`CREATE TABLE ${name} (${fields.join(',')}, PRIMARY KEY(${keys.map(qi).join(',')}))`)
  }
  await new sql.Request(tx).query(await readFile(new URL('../server/cms/schema.sql',import.meta.url),'utf8'))
  for(const name of names){
   const rows=snapshot[name]
   if(name==='cms.Audit'){
    const types={sequence:sql.BigInt,actor:sql.UniqueIdentifier,action:sql.NVarChar(80),subject:sql.NVarChar(255),createdAt:sql.DateTime2(7)}
    for(const row of rows){const req=new sql.Request(tx);for(const [k,v]of Object.entries(row))req.input(k,types[k],v);await req.query(`SET IDENTITY_INSERT cms.Audit ON; INSERT cms.Audit (${Object.keys(row).map(qi).join(',')}) VALUES(${Object.keys(row).map(k=>'@'+k).join(',')}); SET IDENTITY_INSERT cms.Audit OFF;`)}
   }else if(rows.length)await new sql.Request(tx).bulk(rows.toTable(name),{keepNulls:true,checkConstraints:true})
   console.log(`${name}: ${rows.length} staged`)
  }
  await new sql.Request(tx).query(`ALTER TABLE sync.DesignCloudTags ADD FOREIGN KEY(pid) REFERENCES sync.DesignCloudTags(id);
   ALTER TABLE sync.DesignCloudCaseTags ADD FOREIGN KEY(caseId) REFERENCES sync.DesignCloudCases(id),FOREIGN KEY(tagId) REFERENCES sync.DesignCloudTags(id);
   ALTER TABLE sync.DesignCloudFiles ADD FOREIGN KEY(caseId) REFERENCES sync.DesignCloudCases(id);
   ALTER TABLE sync.DesignCloudProperty ADD FOREIGN KEY(caseId) REFERENCES sync.DesignCloudCases(id);
   CREATE INDEX IX_BuyKitchenFiles_Product ON sync.BuyKitchenPublicFiles(product_id,sort,id) INCLUDE(type,url);
   CREATE INDEX IX_BuyKitchenPrices_Product ON sync.BuyKitchenProductPrices(product_id) INCLUDE(price,size);`)
  const mediaBatch=new sql.Table('cms.MediaBytes');mediaBatch.columns.add('id',sql.UniqueIdentifier,{nullable:false});mediaBatch.columns.add('bytes',sql.VarBinary(sql.MAX),{nullable:false});for(const m of media)mediaBatch.rows.add(m.id,m.bytes);await new sql.Request(tx).bulk(mediaBatch,{checkConstraints:true})
  for(const [user,password]of [['sakura_website_reader',runtime.NUXT_DESIGN_DB_PASSWORD],['sakura_website_cms',runtime.CMS_DB_PASSWORD]])await new sql.Request(tx).input('password',sql.NVarChar(128),password).query(`DECLARE @q nvarchar(max)=N'CREATE USER ${user} WITH PASSWORD='+QUOTENAME(@password,'''');EXEC sp_executesql @q;`)
  await new sql.Request(tx).query(`GRANT SELECT ON SCHEMA::sync TO sakura_website_reader; DENY INSERT,UPDATE,DELETE,ALTER ON SCHEMA::sync TO sakura_website_reader;
   GRANT SELECT ON SCHEMA::sync TO sakura_website_cms; DENY INSERT,UPDATE,DELETE,ALTER ON SCHEMA::sync TO sakura_website_cms;
   GRANT SELECT,INSERT,UPDATE,DELETE ON SCHEMA::cms TO sakura_website_cms;`)
  await verify(tx)
  if(process.env.AZURE_TEST_ROLLBACK==='1'){await tx.rollback();tx=undefined;console.log('Rollback test complete; cloud remains empty')}
  else{await tx.commit();tx=undefined;console.log('Cloud migration committed; application credentials saved privately')}
 }
}catch(e){if(tx)await tx.rollback().catch(()=>{});let message=e.message;for(const key of ['AZURE_SQL_ADMIN_PASSWORD','WEBSITE_DB_SA_PASSWORD','CMS_DB_PASSWORD'])if(process.env[key])message=message.replaceAll(process.env[key],'[REDACTED]');console.error(message);process.exitCode=1}
finally{await source?.close();await target?.close()}
