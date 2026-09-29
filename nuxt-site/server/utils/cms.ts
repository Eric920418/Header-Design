import { randomBytes } from 'node:crypto'
import { query, digest, fail, randomUUID } from '../cms/database.mjs'
import type { H3Event } from 'h3'
export async function cmsUser(event:H3Event, admin=false, allowPasswordChange=false) {
 const token=getCookie(event,'sakura_cms_session')||''
 const row=(await query(`SELECT u.id,u.email,u.name,u.role,u.mustChange,u.revision,s.csrf FROM cms.Sessions s JOIN cms.Users u ON u.id=s.userId WHERE s.id=@id AND s.expiresAt>SYSUTCDATETIME() AND u.disabled=0`,{id:digest(token)})).recordset[0]
 if(!row)fail(401,'請先登入管理後台')
 if(!allowPasswordChange&&row.mustChange)fail(403,'請先變更臨時密碼')
 if(admin&&row.role!=='admin')fail(403,'此操作僅限管理員')
 return row
}
export function sameOrigin(event:H3Event) {
 const origin=getHeader(event,'origin'), url=getRequestURL(event)
 if(!origin||origin!==url.origin)fail(403,'請從本網站送出操作')
}
export async function cmsWrite(event:H3Event,admin=false,allowPasswordChange=false) {
 sameOrigin(event);const user=await cmsUser(event,admin,allowPasswordChange)
 if(getHeader(event,'x-csrf-token')!==user.csrf)fail(403,'操作驗證已失效，請重新登入')
 return user
}
export async function cmsSession(event:H3Event,userId:string) {
 const token=randomBytes(32).toString('hex'),csrf=randomBytes(32).toString('hex')
 await query('INSERT cms.Sessions(id,userId,csrf,expiresAt) VALUES(@id,@userId,@csrf,@expiresAt)',{id:digest(token),userId,csrf,expiresAt:new Date(Date.now()+8*3600e3)})
 setCookie(event,'sakura_cms_session',token,{httpOnly:true,secure:getRequestURL(event).protocol==='https:',sameSite:'strict',path:'/',maxAge:8*3600})
 return csrf
}
export async function cmsHandler(event:H3Event,run:()=>Promise<any>) {
 setResponseHeader(event,'Cache-Control','private, no-store');setResponseHeader(event,'X-Robots-Tag','noindex, nofollow')
 try{if(!['GET','HEAD'].includes(event.method)){const limit=event.path.split('?')[0]==='/api/admin/media'?31*1024*1024:2*1024*1024;if(getHeader(event,'transfer-encoding')||Number(getHeader(event,'content-length'))>limit)fail(413,'請求內容過大或使用不支援的串流格式')}return await run()}catch(error:any){const traceId=randomUUID();if(!error.statusCode||error.statusCode>=500)console.error(`[CMS ${traceId}]`,error);throw createError({statusCode:error.statusCode||503,message:error.statusCode&&error.statusCode<500?error.message:'服務暫時無法完成操作，請重試或將追蹤編號提供給管理員。',data:{traceId}})}
}
