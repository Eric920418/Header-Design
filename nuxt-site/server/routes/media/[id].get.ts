import { readFile } from 'node:fs/promises'
import { join } from 'node:path'
import { homedir } from 'node:os'
import { Readable } from 'node:stream'
import { query,fail } from '../../cms/database.mjs'
import { cmsHandler,cmsUser } from '../../utils/cms'
export default defineEventHandler(event=>cmsHandler(event,async()=>{
 const id=getRouterParam(event,'id')||'';if(!/^[a-f0-9-]{36}$/i.test(id))fail(404,'素材不存在')
 const m=(await query('SELECT * FROM cms.Media WHERE id=@id',{id})).recordset[0];if(!m||m.archived)fail(404,'素材不存在或已封存')
 const published=(await query('SELECT TOP(1) r.mediaId FROM cms.MediaRefs r JOIN cms.Documents d ON d.publishedId=r.versionId WHERE r.mediaId=@id',{id})).recordset.length
 if(!published)await cmsUser(event)
 const bytes=process.env.CMS_MEDIA_STORAGE==='sql'?(await query('SELECT bytes FROM cms.MediaBytes WHERE id=@id',{id})).recordset[0]?.bytes:await readFile(join(process.env.CMS_MEDIA_DIR||join(homedir(),'.sakura-cms','media'),m.filename))
 if(!bytes)fail(404,'素材檔案不存在')
 setResponseHeaders(event,{'Content-Type':m.mime,'Content-Length':String(bytes.length),'X-Content-Type-Options':'nosniff','Content-Security-Policy':"default-src 'none'; sandbox",'Content-Disposition':`${m.mime==='application/pdf'?'attachment':'inline'}; filename="${m.filename}"`})
 return sendStream(event,Readable.from((function*(){for(let i=0;i<bytes.length;i+=65536)yield bytes.subarray(i,i+65536)})()))
}))
