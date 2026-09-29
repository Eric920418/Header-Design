// Runs its own isolated server; never points credential tests at the original database.
import assert from 'node:assert/strict'
import {spawn} from 'node:child_process'
import {readFile} from 'node:fs/promises'
import {homedir} from 'node:os'
import {join} from 'node:path'
import {randomBytes,createHash} from 'node:crypto'
const target=process.env.CMS_RESTORE_DATABASE
assert(/^SakuraCmsRestore_[A-Za-z0-9_]+$/.test(target||''),'Specify the restored, isolated database')
assert(process.env.CMS_ADMIN_EMAIL&&process.env.CMS_ADMIN_PASSWORD,'Supply the account from the restored backup')
const snapshot=JSON.parse(await readFile(join(process.argv[2],'cms.json'),'utf8'))
const base='http://127.0.0.1:3141',server=spawn(process.execPath,['.output/server/index.mjs'],{cwd:new URL('../',import.meta.url),env:{...process.env,PORT:'3141',HOST:'127.0.0.1',CMS_DB_DATABASE:target,CMS_MEDIA_DIR:join(homedir(),'.sakura-cms',target)},stdio:['ignore','pipe','pipe']})
let cookie='',csrf=''
async function call(path,method='GET',body,status=200){const r=await fetch(base+path,{method,signal:AbortSignal.timeout(15000),headers:{Origin:base,Cookie:cookie,'X-CSRF-Token':csrf,...(body?{'Content-Type':'application/json'}:{})},body:body?JSON.stringify(body):undefined});const jar=new Map(cookie.split('; ').filter(Boolean).map(s=>s.split(/=(.*)/s)));for(const c of r.headers.getSetCookie()){const[k,v]=c.split(';')[0].split(/=(.*)/s);jar.set(k,v)}cookie=[...jar].map(([k,v])=>k+'='+v).join('; ');const text=await r.text();assert.equal(r.status,status,text.slice(0,160));return JSON.parse(text)}
try{
 await new Promise((resolve,reject)=>{const timer=setTimeout(()=>reject(new Error('Isolated server startup timeout')),15000);server.once('error',reject);server.once('exit',code=>reject(new Error('Isolated server exited: '+code)));server.stdout.on('data',b=>{if(b.toString().includes('Listening')){clearTimeout(timer);resolve()}})})
 const preview=process.env.PREVIEW_PASSWORD||/previewPassword:\s*'([^']+)'/.exec(await readFile(new URL('../nuxt.config.ts',import.meta.url),'utf8'))[1]
 await call('/api/preview-access','POST',{password:preview})
 await call('/api/admin/login','POST',{email:process.env.CMS_ADMIN_EMAIL,password:process.env.CMS_ADMIN_PASSWORD})
 let user=await call('/api/admin/session');csrf=user.csrf
 const password=randomBytes(24).toString('base64url')
 await call('/api/admin/password','POST',{currentPassword:process.env.CMS_ADMIN_PASSWORD,password});user=await call('/api/admin/session');csrf=user.csrf
 const users=await call('/api/admin/users');assert.equal(users.filter(u=>u.role==='admin'&&!u.disabled).length,1,'Use a backup with one active administrator for this check')
 const me=users.find(u=>u.id.toLowerCase()===user.id.toLowerCase())
 await call('/api/admin/users/'+me.id,'POST',{...me,disabled:true},400)
 await call('/api/admin/users/'+me.id,'POST',{...me,role:'editor'},400)
 const doc=snapshot.Documents.find(d=>d.id==='site-visuals'),version=snapshot.Versions.find(v=>v.id===doc.publishedId)
 assert.deepEqual(await call('/api/content/site-visuals'),JSON.parse(version.body))
 const publishedIds=new Set(snapshot.Documents.map(d=>d.publishedId)),ref=snapshot.MediaRefs.find(r=>publishedIds.has(r.versionId)),media=snapshot.Media.find(m=>m.id===ref.mediaId)
 const bytes=await fetch(base+'/media/'+media.id,{headers:{Cookie:cookie},signal:AbortSignal.timeout(15000)}).then(r=>{assert.equal(r.status,200);return r.arrayBuffer()})
 assert.equal(createHash('sha256').update(Buffer.from(bytes)).digest('hex'),media.hash)
 console.log('PASS isolated restore: login, first password change, last-administrator guard, published content and media SHA-256; original database credentials untouched')
}finally{server.kill('SIGTERM')}
