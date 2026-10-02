import { query,transaction,randomUUID,fail,throttle } from '../../cms/database.mjs'
import { normalizeMedia,saveMedia,validateChunk } from '../../cms/media.mjs'
import { cmsHandler,cmsWrite } from '../../utils/cms'
export default defineEventHandler(event=>cmsHandler(event,async()=>{
 const user=await cmsWrite(event)
 if(event.method==='POST'){
  const b=await readBody(event)
  if(!b||typeof b.name!=='string'||!b.name.trim()||b.name.length>255||!['image/jpeg','image/png','image/webp','application/pdf'].includes(b.mime)||!Number.isSafeInteger(b.size)||b.size<=0||b.size>(b.mime==='application/pdf'?30:10)*1024*1024)fail(400,'檔案格式或大小不符合規範：圖片 10MB、PDF 30MB')
  await throttle(`media-upload:${user.id}`,30,3600)
  return transaction(async(tx:any)=>{
   await query('DELETE cms.MediaUploads WHERE expiresAt<SYSUTCDATETIME()',{},tx)
   const count=(await query('SELECT COUNT(*) AS n,COALESCE(SUM(CONVERT(bigint,size)),0) AS size FROM cms.MediaUploads WITH(UPDLOCK,HOLDLOCK) WHERE mediaId IS NULL',{},tx)).recordset[0]
   if(count.n>=10||Number(count.size)+b.size>100*1024*1024)fail(429,'暫存上傳空間已滿，請稍後重試')
   const id=randomUUID();await query('INSERT cms.MediaUploads(id,userId,name,mime,size,expiresAt) VALUES(@id,@userId,@name,@mime,@size,@expires)',{id,userId:user.id,name:b.name,mime:b.mime,size:b.size,expires:new Date(Date.now()+3600000)},tx);return{id}
  })
 }
 if(!['PUT','PATCH'].includes(event.method))fail(405,'不支援的操作')
 const q=getQuery(event),id=q.id
 if(typeof id!=='string'||!/^[a-f0-9]{8}(-[a-f0-9]{4}){3}-[a-f0-9]{12}$/i.test(id))fail(400,'上傳識別碼不正確')
 const part=event.method==='PUT'?await readRawBody(event,false):null
 return transaction(async(tx:any)=>{
  const row=(await query('SELECT * FROM cms.MediaUploads WITH(UPDLOCK,HOLDLOCK) WHERE id=@id AND userId=@userId AND expiresAt>SYSUTCDATETIME()',{id,userId:user.id},tx)).recordset[0]
  if(!row)fail(404,'上傳不存在或已過期，請重新選擇檔案')
  if(row.mediaId)return{id:row.mediaId,src:`/media/${row.mediaId}`}
  if(event.method==='PUT'){
   if(typeof q.offset!=='string'||!/^\d+$/.test(q.offset))fail(400,'區塊位置不正確')
   if(validateChunk(row.bytes,part,Number(q.offset),row.size))await query('UPDATE cms.MediaUploads SET bytes=bytes+@part WHERE id=@id',{id,part},tx)
   return{ok:true}
  }
  if(row.bytes.length!==row.size)fail(409,'檔案尚未完整上傳')
  const result=await saveMedia(await normalizeMedia(row.bytes,row.mime),row.name,user.id,tx)
  await query('UPDATE cms.MediaUploads SET bytes=0x,mediaId=@mediaId WHERE id=@id',{id,mediaId:result.id},tx)
  return result
 })
}))
