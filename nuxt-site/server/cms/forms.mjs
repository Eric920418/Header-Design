import { query,transaction,randomUUID,digest,fail } from './database.mjs'
import {safeLink} from './content.mjs'
import {franchiseChoiceGroups,franchiseTextFields,franchiseErrors} from '../../shared/franchise-form.mjs'
const email=v=>typeof v==='string'&&v.length<=254&&/^\S+@\S+\.\S+$/.test(v)
export async function submit(kind,b,key){
 if(!/^[a-f0-9-]{36}$/i.test(key||''))fail(400,'缺少有效的送出識別碼')
 if(!b||b.consent!==true)fail(400,'請同意個人資料使用說明')
 if(kind==='franchise'){
  const errors=franchiseErrors(b)
  if(Object.keys(errors).length)fail(400,Object.values(errors).join('\n'))
 }
 const payload={consent:true,consentVersion:kind==='franchise'?'2026-10-02':'2026-09-28',consentedAt:new Date().toISOString()}
 const fields=kind==='franchise'?['name','email','phone','experience','budget','area','timeline']:kind==='builder'?['contactName','phone','company','email','note']:['route','name','email','website','comment']
 for(const field of fields){const value=b[field]??'';if(typeof value!=='string'||value.length>(['comment','note'].includes(field)?4000:['name','contactName'].includes(field)?100:500))fail(400,`${field} 格式或長度不符`);payload[field]=value.trim()}
 const required=kind==='franchise'?fields:kind==='builder'?['contactName','phone','company']:['route','name','email','comment'];for(const field of required)if(!payload[field])fail(400,`${field} 為必填`)
 if((kind!=='builder'||payload.email)&&!email(payload.email))fail(400,'電子郵件格式錯誤')
 if(kind!=='comment'&&!/^\d{9,10}$/.test(payload.phone.replace(/\D/g,'')))fail(400,'請填寫 9–10 碼電話')
 if(kind==='franchise'&&(!['200萬以下','200萬 - 300萬','300萬 - 400萬','400萬以上'].includes(payload.budget)||!['暫無計畫','三個月內','半年內','一年內','其他'].includes(payload.timeline)))fail(400,'加盟選項格式錯誤')
 if(kind==='franchise'){
  for(const g of franchiseChoiceGroups)payload[g.key]=g.multiple?g.options.filter(v=>(b[g.key]??[]).includes(v)):b[g.key]
  for(const f of franchiseTextFields)payload[f.key]=b.storeType!=='自有店面'&&['storeAddress','storeWidth','storeArea'].includes(f.key)?'':(b[f.key]??'').trim()
 }
 if(kind==='comment'&&(!safeLink(payload.website)||!/^\/(gallery|news|knowledge)\/[\w/-]+$/.test(payload.route)||payload.comment.length<10))fail(400,'留言內容、頁面或網址格式錯誤')
 const hash=digest(JSON.stringify({...payload,consentedAt:undefined})),requestKey=digest(kind+':'+key),table=kind==='comment'?'Comments':'Submissions'
 return transaction(async tx=>{
 const old=(await query(`SELECT id,bodyHash FROM cms.${table} WITH(UPDLOCK,HOLDLOCK) WHERE requestKey=@requestKey`,{requestKey},tx)).recordset[0]
 if(old){if(old.bodyHash!==hash)fail(409,'此送出識別碼已用於不同內容，請重新開啟表單');return{id:old.id,received:true}}
 const id=randomUUID()
 if(kind==='comment')await query('INSERT cms.Comments(id,route,name,email,website,comment,consent,requestKey,bodyHash) VALUES(@id,@route,@name,@email,@website,@comment,@consent,@requestKey,@hash)',{id,route:payload.route,name:payload.name,email:payload.email,website:payload.website,comment:payload.comment,consent:payload.consentVersion,requestKey,hash},tx)
 else await query('INSERT cms.Submissions(id,kind,body,requestKey,bodyHash) VALUES(@id,@kind,@body,@requestKey,@hash)',{id,kind,body:JSON.stringify(payload),requestKey,hash},tx)
 return{id,received:true}
 })
}
