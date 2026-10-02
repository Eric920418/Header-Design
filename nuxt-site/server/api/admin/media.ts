import { mkdir, writeFile, rename, unlink } from 'node:fs/promises'
import { homedir } from 'node:os'
import { join } from 'node:path'
import sharp from 'sharp'
import { PDFDocument } from 'pdf-lib'
import { query,transaction,randomUUID,digest,fail,audit } from '../../cms/database.mjs'
import { cmsHandler,cmsUser,cmsWrite } from '../../utils/cms'
import { normalizeMedia,saveMedia } from '../../cms/media.mjs'
export default defineEventHandler(event=>cmsHandler(event,async()=>{
 if(event.method==='GET'){
  await cmsUser(event)
  const rows=(await query(`SELECT m.*, (SELECT d.title FROM cms.MediaRefs r JOIN cms.Versions v ON v.id=r.versionId JOIN cms.Documents d ON d.id=v.documentId WHERE r.mediaId=m.id GROUP BY d.title FOR JSON PATH) AS uses FROM cms.Media m ORDER BY createdAt DESC`)).recordset
  return rows.map((m:any)=>({...m,src:`/media/${m.id}`,uses:JSON.parse(m.uses)}))
 }
 const user=await cmsWrite(event)
 if(event.method==='PATCH'){
  const b=await readBody(event);if(!b||typeof b.name!=='string'||!b.name.trim()||b.name.length>255||typeof b.alt!=='string'||b.alt.length>500||typeof b.category!=='string'||b.category.length>80||typeof b.archived!=='boolean')fail(400,'素材欄位格式錯誤')
  return transaction(async(tx:any)=>{
   if(b.archived&&(await query('SELECT TOP(1) mediaId FROM cms.MediaRefs WHERE mediaId=@id',{id:b.id},tx)).recordset.length)fail(409,'此素材仍被內容或歷史版本引用，無法封存')
   const r=await query('UPDATE cms.Media SET name=@name,alt=@alt,category=@category,archived=@archived,revision=revision+1 WHERE id=@id AND revision=@revision',{id:b.id,name:b.name,alt:b.alt,category:b.category,archived:b.archived,revision:b.revision},tx);if(!r.rowsAffected[0])fail(409,'素材已變更，請重新載入');await audit(user.id,'media-update',b.id,tx);return{ok:true}
  })
 }
 if(event.method!=='POST')fail(405,'不支援的操作')
 const length=Number(getHeader(event,'content-length'));if(!length||length>31*1024*1024)fail(413,'上傳總大小不可超過 31MB')
 const parts=await readMultipartFormData(event);const files=parts?.filter(p=>p.name==='file'&&p.filename)||[];if(files.length!==1)fail(400,'請一次上傳一個檔案')
 if(process.env.CMS_MEDIA_STORAGE==='sql'){const f=files[0]!;const file=await normalizeMedia(f.data,f.type);return transaction((tx:any)=>saveMedia(file,(f.filename||'素材').slice(0,255),user.id,tx))}
 const f=files[0]!;let bytes=f.data,mime='',ext=''
 const name=(f.filename||'素材').slice(0,255)
 if(bytes.subarray(0,5).toString()==='%PDF-'){
  if(f.type!=='application/pdf'||bytes.length>30*1024*1024||!bytes.subarray(-2048).includes(Buffer.from('%%EOF'))||/\/JavaScript|\/JS\b|\/Launch|\/EmbeddedFile/.test(bytes.toString('latin1')))fail(400,'PDF 格式、大小或內嵌內容不符合規範')
  try { const pdf=await PDFDocument.load(bytes,{ignoreEncryption:false});if(!pdf.getPageCount())fail(400,'PDF 沒有頁面') } catch { fail(400,'PDF 無法解析或已加密') }
  mime='application/pdf';ext='pdf'
 }else{
  if(bytes.length>10*1024*1024)fail(413,'圖片不可超過 10MB')
  try{const image=sharp(bytes,{limitInputPixels:40000000,failOn:'warning'});const meta=await image.metadata();const allowed:Record<string,string>={jpeg:'image/jpeg',png:'image/png',webp:'image/webp'};if(!meta.format||!allowed[meta.format]||allowed[meta.format]!==f.type)fail(400,'圖片實際格式與宣告格式不符');bytes=await image.rotate().webp({quality:90}).toBuffer();mime='image/webp';ext='webp'}catch(error:any){fail(400,error.statusCode?error.message:'圖片無法完整解碼，請上傳有效的 JPEG、PNG 或 WebP')}
 }
 const id=randomUUID(),filename=`${id}.${ext}`,dir=process.env.CMS_MEDIA_DIR||join(homedir(),'.sakura-cms','media'),temporary=join(dir,`${id}.tmp`)
 await mkdir(dir,{recursive:true});await writeFile(temporary,bytes,{flag:'wx',mode:0o600})
 try{await rename(temporary,join(dir,filename));await transaction(async(tx:any)=>{await query('INSERT cms.Media(id,name,mime,size,filename,hash) VALUES(@id,@name,@mime,@size,@filename,@hash)',{id,name,mime,size:bytes.length,filename,hash:digest(bytes)},tx);await audit(user.id,'media-upload',id,tx)})}catch(e){await unlink(temporary).catch(()=>{});await unlink(join(dir,filename)).catch(()=>{});throw e}
 return{id,src:`/media/${id}`,name,mime}
}))
