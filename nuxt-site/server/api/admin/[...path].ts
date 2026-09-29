import { query, transaction, fail, passwordHash, checkPassword, digest, randomUUID, audit, throttle } from '../../cms/database.mjs'
import { getDocument, changeDocument, alignSource } from '../../cms/content.mjs'
import { cmsHandler, cmsUser, cmsWrite, sameOrigin, cmsSession } from '../../utils/cms'

export default defineEventHandler(event=>cmsHandler(event,async()=>{
 const path=(getRouterParam(event,'path')||'').split('/'),method=event.method
 if(path[0]==='login'&&method==='POST'){
  sameOrigin(event);await throttle('login:'+getRequestIP(event),60,900)
  const b=await readBody(event);if(typeof b?.email!=='string'||typeof b?.password!=='string')fail(400,'請填寫帳號與密碼')
  await throttle('login-account:'+b.email.trim().toLowerCase(),10,900)
  const u=(await query('SELECT * FROM cms.Users WHERE email=@email',{email:b.email.trim().toLowerCase()})).recordset[0]
  if(!u||u.disabled||!checkPassword(b.password,u.password))fail(401,'帳號或密碼不正確')
  await cmsSession(event,u.id);await audit(u.id,'login',u.email);return{ok:true,mustChange:u.mustChange}
 }
 if(path[0]==='session'&&method==='GET')return cmsUser(event,false,true)
 const isWrite=method!=='GET';const user=isWrite?await cmsWrite(event,false,path[0]==='password'||path[0]==='logout'):await cmsUser(event)
 if(path[0]==='logout'&&method==='POST'){await query('DELETE cms.Sessions WHERE id=@id',{id:digest(getCookie(event,'sakura_cms_session')||'')});deleteCookie(event,'sakura_cms_session',{path:'/'});return{ok:true}}
 if(path[0]==='password'&&method==='POST'){
  const b=await readBody(event);const u=(await query('SELECT password FROM cms.Users WHERE id=@id',{id:user.id})).recordset[0]
  if(!checkPassword(b.currentPassword,u.password))fail(400,'目前密碼不正確');if(b.currentPassword===b.password)fail(400,'新密碼不可與目前密碼相同')
  const hash=passwordHash(b.password);await transaction(async(tx:any)=>{await query('UPDATE cms.Users SET password=@hash,mustChange=0,revision=revision+1 WHERE id=@id; DELETE cms.Sessions WHERE userId=@id',{id:user.id,hash},tx);await audit(user.id,'password-change',user.email,tx)});await cmsSession(event,user.id);return{ok:true}
 }
 if(path[0]==='documents'){
  if(!path[1]&&method==='GET')return(await query("SELECT id,title,category,route,revision,draftId,publishedId,updatedAt FROM cms.Documents WHERE id NOT IN (N'data-kitchenGuides',N'data-kitchenGuideDetails',N'data-news',N'data-latestArticles',N'data-activityArticles',N'data-mediaVideos') ORDER BY category,title")).recordset
  if(path[1]&&method==='GET'){
   const d=await getDocument(path[1]);const v=(await query('SELECT body FROM cms.Versions WHERE id=@id',{id:d.draftId})).recordset[0]
   const versions=(await query('SELECT v.id,v.createdAt,u.name AS actor FROM cms.Versions v LEFT JOIN cms.Users u ON u.id=v.actor WHERE documentId=@id ORDER BY createdAt DESC',{id:d.id})).recordset
   const body=v?JSON.parse(v.body):{}
   return{...d,schema:JSON.parse(d.schemaJson),body:d.id.startsWith('catalog-')?await alignSource(d.id,body):body,versions}
  }
  if(path[1]&&method==='POST')return changeDocument(path[1],await readBody(event),user)
 }
 if(path[0]==='users'){
  if(user.role!=='admin')fail(403,'此操作僅限管理員')
  if(method==='GET')return(await query('SELECT id,email,name,role,disabled,mustChange,revision FROM cms.Users ORDER BY email')).recordset
  if(method!=='POST')fail(405,'不支援的操作')
  const b=await readBody(event);if(!b||typeof b.email!=='string'||!/^\S+@\S+\.\S+$/.test(b.email)||b.email.length>254||typeof b.name!=='string'||!b.name.trim()||b.name.length>100||!['admin','editor'].includes(b.role)||typeof b.disabled!=='boolean')fail(400,'帳號欄位格式錯誤')
  const hash=b.password?passwordHash(b.password):null
  return transaction(async(tx:any)=>{
   const admins=(await query("SELECT id FROM cms.Users WITH(UPDLOCK,HOLDLOCK) WHERE role='admin' AND disabled=0",{},tx)).recordset
   const id=path[1]||randomUUID()
   if((await query('SELECT id FROM cms.Users WHERE email=@email AND id<>@id',{email:b.email.trim().toLowerCase(),id},tx)).recordset.length)fail(409,'帳號已存在')
   if(path[1]){const previous=(await query('SELECT * FROM cms.Users WHERE id=@id',{id},tx)).recordset[0];if(!previous)fail(404,'帳號不存在');if(previous.revision!==b.revision)fail(409,'帳號已變更，請重新載入');if(admins.some((a:any)=>a.id.toLowerCase()===id.toLowerCase())&&admins.length===1&&(b.disabled||b.role!=='admin'))fail(400,'不可停用或降級最後一位管理員');await query('UPDATE cms.Users SET email=@email,name=@name,role=@role,disabled=@disabled,password=COALESCE(@hash,password),mustChange=CASE WHEN @hash IS NULL THEN mustChange ELSE 1 END,revision=revision+1 WHERE id=@id',{id,email:b.email.toLowerCase(),name:b.name,role:b.role,disabled:b.disabled,hash},tx);await query('DELETE cms.Sessions WHERE userId=@id',{id},tx)}
   else{if(!hash)fail(400,'新帳號需要臨時密碼');if((await query('SELECT id FROM cms.Users WHERE email=@email',{email:b.email.toLowerCase()},tx)).recordset.length)fail(409,'帳號已存在');await query('INSERT cms.Users(id,email,name,role,password) VALUES(@id,@email,@name,@role,@hash)',{id,email:b.email.toLowerCase(),name:b.name,role:b.role,hash},tx)}
   await audit(user.id,'account-update',id,tx);return{ok:true,id}
  })
 }
 if(path[0]==='inbox'||path[0]==='comments'){
  if(user.role!=='admin')fail(403,'此操作僅限管理員')
  const table=path[0]==='inbox'?'Submissions':'Comments'
  if(method==='GET'){const rows=(await query(`SELECT * FROM cms.${table} ORDER BY createdAt DESC`)).recordset;return rows.map((r:any)=>({...r,...(r.body?{body:JSON.parse(r.body)}:{})}))}
  if(method==='POST'&&path[1]){const b=await readBody(event);const allowed=table==='Comments'?['待審核','已核准','已拒絕']:['待處理','處理中','已完成','垃圾訊息'];if(!allowed.includes(b.status)||typeof b.note!=='string'||b.note.length>4000)fail(400,'狀態或備註格式錯誤');return transaction(async(tx:any)=>{const r=await query(`UPDATE cms.${table} SET status=@status,${table==='Submissions'?'note=@note,':''}revision=revision+1 WHERE id=@id AND revision=@revision`,{id:path[1],status:b.status,note:b.note,revision:b.revision},tx);if(!r.rowsAffected[0])fail(409,'紀錄已變更，請重新載入');await audit(user.id,'review',path[1],tx);return{ok:true}})}
 }
 if(path[0]==='audit'&&method==='GET'){if(user.role!=='admin')fail(403,'此操作僅限管理員');return(await query('SELECT TOP(200) a.*,u.name AS actorName FROM cms.Audit a LEFT JOIN cms.Users u ON u.id=a.actor ORDER BY sequence DESC')).recordset}
 fail(404,'找不到管理操作')
}))
