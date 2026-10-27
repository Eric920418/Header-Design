import {randomUUID,digest,query,transaction,fail} from './database.mjs'
import {gzipSync,gunzipSync} from 'node:zlib'
import {contentAliases,publicContent} from '../../shared/cms/public-content.mjs'
// Temporary snapshots must be shared by all server instances, separate from content versions.
export async function createDraftPreview(userId,documents,connection){
 const serialized=JSON.stringify(Object.fromEntries(documents.map(d=>[d.id,d.body])))
 if(Buffer.byteLength(serialized)>2*1024*1024)fail(413,'預覽內容過大，請減少單次修改的內容後重試。')
 const token=randomUUID(),body=gzipSync(serialized)
 const run=async tx=>{
  await query('DELETE cms.PreviewSessions WHERE expiresAt<=SYSUTCDATETIME()',{},tx)
  await query('WITH owned AS (SELECT id,ROW_NUMBER() OVER(ORDER BY createdAt DESC,id) AS n FROM cms.PreviewSessions WHERE userId=@userId) DELETE FROM owned WHERE n>=40',{userId},tx)
  await query('WITH recent AS (SELECT id,ROW_NUMBER() OVER(ORDER BY createdAt DESC,id) AS n FROM cms.PreviewSessions) DELETE FROM recent WHERE n>=400',{},tx)
  await query('INSERT cms.PreviewSessions(id,userId,body,expiresAt) VALUES(@id,@userId,@body,DATEADD(minute,5,SYSUTCDATETIME()))',{id:digest(token),userId,body},tx)
 }
 await(connection?run(connection):transaction(run))
 return token
}
export async function readDraftPreview(token,userId,id){
 const preview=typeof token==='string'&&/^[a-f\d]{8}(?:-[a-f\d]{4}){3}-[a-f\d]{12}$/i.test(token)?(await query('SELECT body FROM cms.PreviewSessions WHERE id=@id AND userId=@userId AND expiresAt>SYSUTCDATETIME()',{id:digest(token),userId})).recordset[0]:null
 if(!preview)throw Object.assign(new Error('預覽已過期或無法存取，請回後台重新看效果。'),{statusCode:404,data:{cmsPreviewExpired:true}})
 const body=JSON.parse(gunzipSync(preview.body,{maxOutputLength:2*1024*1024}).toString('utf8'))[contentAliases[id]||id]
 return body?publicContent(id,body):undefined
}
