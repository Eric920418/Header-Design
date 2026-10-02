import assert from 'node:assert/strict'
import { randomUUID,randomBytes } from 'node:crypto'
import { readFile } from 'node:fs/promises'
import { spawnSync } from 'node:child_process'
import { PDFDocument } from 'pdf-lib'
import { query,passwordHash,digest,database } from '../server/cms/database.mjs'
const base=process.env.TEST_BASE_URL
if(!base||!/^https:\/\/header-design-[\w-]+\.vercel\.app$/.test(base)||process.env.CMS_DB_DATABASE!=='SakuraWebsiteTest')throw Error('Only staged header-design Vercel deployments and SakuraWebsiteTest are allowed')
const password=randomBytes(24).toString('base64url'),id=randomUUID(),email=`cloud-check-${id}@example.test`,jar=new Map()
const proposal=/previewPassword:\s*'([^']+)'/.exec(await readFile(new URL('../nuxt.config.ts',import.meta.url),'utf8'))[1]
let csrf='',mediaId
async function call(path,{method='GET',body,expected=200,guest=false,binary=false}={}){
 const headers={Origin:base};if(!guest){headers.Cookie=[...jar].map(([k,v])=>`${k}=${v}`).join('; ');if(csrf)headers['X-CSRF-Token']=csrf}
 if(body!==undefined)headers['Content-Type']=Buffer.isBuffer(body)?'application/octet-stream':'application/json'
 const response=await fetch(base+path,{method,headers,body:body===undefined?undefined:Buffer.isBuffer(body)?body:JSON.stringify(body),redirect:'manual',signal:AbortSignal.timeout(180000)})
 if(!guest)for(const c of response.headers.getSetCookie()){const p=c.split(';')[0],at=p.indexOf('=');jar.set(p.slice(0,at),p.slice(at+1))}
 assert.equal(response.status,expected,`${method} ${path}: status ${response.status}`)
 if(binary)return Buffer.from(await response.arrayBuffer())
 const text=await response.text();try{return JSON.parse(text)}catch{return text}
}
try{
 const access=spawnSync('vercel',['curl','/?x-vercel-set-bypass-cookie=true','--deployment',base,'--','--include','--silent'],{encoding:'utf8',timeout:60000})
 if(access.status!==0)throw Error('Vercel CLI authenticated test access failed')
 for(const c of access.stdout.matchAll(/^set-cookie:\s*([^=]+)=([^;\r\n]+)/gmi))jar.set(c[1],c[2])
 await call('/api/preview-access',{method:'POST',body:{password:proposal}})
 for(const path of ['/','/design-inspiration','/products/sakura','/products/svago','/products/teka','/gallery','/admin/login']){
  const html=await call(path);assert.equal(typeof html,'string');assert(!html.includes('服務暫時無法完成操作'));console.log(`SSR ${path}: 200`)
 }
 for(const [page,count] of [[1,9],[2,9],[3,7]]){
  const data=await call(`/api/design-inspiration/cases?page=${page}`);assert.equal(data.items.length,count);assert.equal(data.total,25)
 }
 for(const [brand,total] of [['sakura',749],['svago',60],['teka',38]]){const data=await call(`/api/products/${brand}/items`);assert.equal(data.total,total);console.log(`${brand}: ${total}`)}
 await query("INSERT cms.Users(id,email,name,password,role,mustChange) VALUES(@id,@email,N'雲端短期驗收',@password,'editor',0)",{id,email,password:passwordHash(password)})
 await call('/api/admin/login',{method:'POST',body:{email,password}});csrf=(await call('/api/admin/session')).csrf
 const pdf=await PDFDocument.create();pdf.addPage();const bytes=Buffer.concat([Buffer.from(await pdf.save()),Buffer.alloc(5*1024*1024,32),Buffer.from('\n%%EOF')])
 const u=await call('/api/admin/media-upload',{method:'POST',body:{name:'cloud-stream-test.pdf',mime:'application/pdf',size:bytes.length}})
 await call(`/api/admin/media-upload?id=${u.id}&offset=1`,{method:'PUT',body:bytes.subarray(0,10),expected:409})
 await call(`/api/admin/media-upload?id=${u.id}`,{method:'PATCH',expected:409})
 for(let offset=0;offset<bytes.length;offset+=2*1024*1024){const part=bytes.subarray(offset,offset+2*1024*1024);await call(`/api/admin/media-upload?id=${u.id}&offset=${offset}`,{method:'PUT',body:part});if(offset===0)await call(`/api/admin/media-upload?id=${u.id}&offset=0`,{method:'PUT',body:part})}
 const media=await call(`/api/admin/media-upload?id=${u.id}`,{method:'PATCH'});mediaId=media.id
 assert.equal((await call(`/api/admin/media-upload?id=${u.id}`,{method:'PATCH'})).id,mediaId)
 const downloaded=await call(media.src,{binary:true});assert.equal(digest(downloaded),digest(bytes));console.log('5MB+ PDF chunks, retry, private streaming: passed')
 const saved=csrf;csrf='invalid';await call('/api/admin/media-upload',{method:'POST',body:{},expected:403});csrf=saved
 const guestJar=new Map(jar);jar.delete('sakura_cms_session');await call(media.src,{expected:401});for(const [k,v]of guestJar)jar.set(k,v)
 const published=(await query('SELECT TOP(1) m.id,m.hash FROM cms.Media m JOIN cms.MediaRefs r ON r.mediaId=m.id JOIN cms.Documents d ON d.publishedId=r.versionId WHERE m.archived=0')).recordset[0]
 jar.delete('sakura_cms_session');assert.equal(digest(await call(`/media/${published.id}`,{binary:true})),published.hash)
 console.log('Published media, private denial, CSRF, pagination, brand totals: passed')
}finally{
 // Only rows owned by this run's unpredictable test user; never alter existing CMS content.
 await query('DELETE cms.MediaUploads WHERE userId=@id;DELETE cms.Sessions WHERE userId=@id;DELETE cms.Audit WHERE actor=@id',{id})
 if(mediaId)await query('DELETE cms.Media WHERE id=@id',{id:mediaId})
 await query('DELETE cms.Users WHERE id=@id',{id});await(await database()).close()
}
