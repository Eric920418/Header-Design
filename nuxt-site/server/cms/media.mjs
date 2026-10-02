import { mkdir, writeFile, unlink } from 'node:fs/promises'
import { homedir } from 'node:os'
import { join } from 'node:path'
import sharp from 'sharp'
import { PDFDocument } from 'pdf-lib'
import { query, randomUUID, digest, fail, audit } from './database.mjs'

export async function normalizeMedia(bytes, type) {
 if (!Buffer.isBuffer(bytes)||!bytes.length) fail(400,'檔案內容為空')
 if(bytes.subarray(0,5).toString()==='%PDF-'){
  if(type!=='application/pdf'||bytes.length>30*1024*1024||!bytes.subarray(-2048).includes(Buffer.from('%%EOF'))||/\/JavaScript|\/JS\b|\/Launch|\/EmbeddedFile/.test(bytes.toString('latin1')))fail(400,'PDF 格式、大小或內嵌內容不符合規範')
  try {const pdf=await PDFDocument.load(bytes,{ignoreEncryption:false});if(!pdf.getPageCount())fail(400,'PDF 沒有頁面')}catch{fail(400,'PDF 無法解析或已加密')}
  return {bytes,mime:'application/pdf',ext:'pdf'}
 }
 if(bytes.length>10*1024*1024)fail(413,'圖片不可超過 10MB')
 try{
  const image=sharp(bytes,{limitInputPixels:40000000,failOn:'warning'}),meta=await image.metadata()
  const allowed={jpeg:'image/jpeg',png:'image/png',webp:'image/webp'}
  if(!allowed[meta.format]||allowed[meta.format]!==type)fail(400,'圖片實際格式與宣告格式不符')
  return {bytes:await image.rotate().webp({quality:90}).toBuffer(),mime:'image/webp',ext:'webp'}
 }catch(error){fail(400,error.statusCode?error.message:'圖片無法完整解碼，請上傳有效的 JPEG、PNG 或 WebP')}
}

export async function saveMedia(file,name,userId,tx) {
 const {bytes,mime,ext}=file,id=randomUUID(),filename=`${id}.${ext}`
 if(process.env.CMS_MEDIA_STORAGE==='sql'){
  // ponytail: SQL media is capped at 2GB for this small test; use object storage when it grows.
  const used=(await query('SELECT COALESCE(SUM(CONVERT(bigint,DATALENGTH(bytes))),0) AS size FROM cms.MediaBytes WITH(UPDLOCK,HOLDLOCK)',{},tx)).recordset[0].size
  if(Number(used)+bytes.length>2*1024**3)fail(413,'測試素材空間已達 2GB 上限')
  await query('INSERT cms.Media(id,name,mime,size,filename,hash) VALUES(@id,@name,@mime,@size,@filename,@hash)',{id,name,mime,size:bytes.length,filename,hash:digest(bytes)},tx)
  await query('INSERT cms.MediaBytes(id,bytes) VALUES(@id,@bytes)',{id,bytes},tx)
 }else{
  const dir=process.env.CMS_MEDIA_DIR||join(homedir(),'.sakura-cms','media');await mkdir(dir,{recursive:true})
  await writeFile(join(dir,filename),bytes,{flag:'wx',mode:0o600})
  tx.once('rollback',()=>{void unlink(join(dir,filename)).catch(()=>{})})
  try{await query('INSERT cms.Media(id,name,mime,size,filename,hash) VALUES(@id,@name,@mime,@size,@filename,@hash)',{id,name,mime,size:bytes.length,filename,hash:digest(bytes)},tx)}catch(e){await unlink(join(dir,filename)).catch(()=>{});throw e}
 }
 await audit(userId,'media-upload',id,tx)
 return{id,src:`/media/${id}`,name,mime}
}

export function validateChunk(stored,part,offset,total) {
 if(!Buffer.isBuffer(part)||!part.length||part.length>2*1024*1024||!Number.isSafeInteger(offset)||offset<0||offset+part.length>total)fail(400,'上傳區塊大小或位置不正確')
 if(offset<stored.length){if(offset+part.length<=stored.length&&stored.subarray(offset,offset+part.length).equals(part))return false;fail(409,'重複區塊內容不符')}
 if(offset!==stored.length)fail(409,'上傳區塊不連續，請重新上傳')
 return true
}
