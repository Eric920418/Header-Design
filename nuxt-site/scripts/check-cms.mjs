import assert from 'node:assert/strict'
import {randomBytes,randomUUID} from 'node:crypto'
import {query,transaction,passwordHash,digest} from '../server/cms/database.mjs'
import sharp from 'sharp'
import {PDFDocument} from 'pdf-lib'
import {readFile,mkdtemp,writeFile,rm,unlink} from 'node:fs/promises'
import {tmpdir} from 'node:os'
import {join} from 'node:path'
import {execFileSync} from 'node:child_process'
import {validate,normalizeVideos} from '../server/cms/content.mjs'
const seed=JSON.parse(await readFile(new URL('../shared/cms/seed.json',import.meta.url),'utf8'))
for(const d of seed)validate(d.data,d.schema)
assert.equal(normalizeVideos('https://youtu.be/wH374AF9wLI',{format:'youtube'}),'wH374AF9wLI');assert.throws(()=>normalizeVideos('https://youtube.com.evil.test/watch?v=wH374AF9wLI',{format:'youtube'}))
const base=process.env.PREVIEW_URL||'http://localhost:3100'
const stamp=randomUUID(),userId=randomUUID(),editorId=randomUUID(),docId='test-'+stamp,password=randomBytes(24).toString('base64url')
const cookies=new Map(),sessions={}
const previewPassword=process.env.PREVIEW_PASSWORD||/previewPassword:\s*'([^']+)'/.exec(await(await import('node:fs/promises')).readFile(new URL('../nuxt.config.ts',import.meta.url),'utf8'))[1]
async function call(path,method='GET',body,who='admin',status=200,extra={}){
 const headers={Origin:base,...extra};if(cookies.has(who))headers.Cookie=cookies.get(who);if(sessions[who])headers['X-CSRF-Token']=sessions[who]
 if(body&&!(body instanceof FormData))headers['Content-Type']='application/json'
 Object.assign(headers,extra)
 const response=await fetch(base+path,{signal:AbortSignal.timeout(45000),method,headers,body:body?(body instanceof FormData?body:JSON.stringify(body)):undefined,redirect:'manual'})
 const incoming=response.headers.getSetCookie();if(incoming.length){const jar=new Map((cookies.get(who)||'').split('; ').filter(Boolean).map(s=>s.split(/=(.*)/s)));for(const s of incoming){const first=s.split(';')[0],at=first.indexOf('=');jar.set(first.slice(0,at),first.slice(at+1))}cookies.set(who,[...jar].map(([k,v])=>k+'='+v).join('; '))}
 const text=await response.text();let data;try{data=JSON.parse(text)}catch{data=text}
 if(Array.isArray(status))assert(status.includes(response.status),`${method} ${path}: ${text.slice(0,400)}`);else assert.equal(response.status,status,`${method} ${path}: ${text.slice(0,400)}`);return data
}
const sourceBefore=(await query("SELECT COUNT(*) AS total,CHECKSUM_AGG(BINARY_CHECKSUM(*)) AS checksum FROM sync.BuyKitchenProducts;SELECT COUNT(*) AS total,CHECKSUM_AGG(BINARY_CHECKSUM(*)) AS checksum FROM sync.DesignCloudCases")).recordsets
let mediaId;const extraMedia=[];const contentBackups=new Map()
try{
 await query("INSERT cms.Users(id,email,name,password,role,mustChange) VALUES(@id,@email,N'CMS 驗收管理員',@password,'admin',0),(@editor,@editorEmail,N'CMS 驗收編輯者',@password,'editor',0)",{id:userId,email:`test-${stamp}@example.test`,password:passwordHash(password),editor:editorId,editorEmail:`editor-${stamp}@example.test`})
 for(const who of ['admin','editor','guest'])await call('/api/preview-access','POST',{password:previewPassword},who)
 await call('/api/admin/documents','GET',null,'guest',401)
 for(const [who,email]of [['admin',`test-${stamp}@example.test`],['editor',`editor-${stamp}@example.test`]]){await call('/api/admin/login','POST',{email,password},who);const user=await call('/api/admin/session','GET',null,who);sessions[who]=user.csrf}
 await call('/api/admin/users','GET',null,'editor',403);await call('/api/admin/inbox','GET',null,'editor',403)
 const schema={type:'object',fields:{title:{type:'string'},image:{type:'string',format:'media'}},required:['title','image']}
 await query('INSERT cms.Documents(id,title,category,route,schemaJson) VALUES(@id,@title,@category,@route,@schema)',{id:docId,title:'CMS 自動驗收',category:'驗收',route:'/',schema:JSON.stringify(schema)})
 let result=await call('/api/admin/documents/'+docId,'POST',{action:'save',revision:1,body:{title:'第一版',image:''}},'editor')
 const race=await Promise.all([1,2].map(()=>call('/api/admin/documents/'+docId,'POST',{action:'save',revision:result.revision,body:{title:'第一版',image:''}},'editor',[200,409])));assert.equal(race.filter(r=>r.statusCode===409).length,1);result=race.find(r=>r.revision)
 const firstVersion=result.draftId
 await call('/api/content/'+docId,'GET',null,'guest',404)
 assert.equal((await call('/api/content/'+docId+'?preview='+docId)).title,'第一版')
 await call('/api/content/'+docId+'?preview='+docId,'GET',null,'guest',401)
 await call('/api/admin/documents/'+docId,'POST',{action:'publish',revision:result.revision},'editor',403)
 await call('/api/admin/documents/'+docId,'POST',{action:'publish',revision:result.revision},'admin',403,{'X-CSRF-Token':'invalid'})
 result=await call('/api/admin/documents/'+docId,'POST',{action:'publish',revision:result.revision})
 assert.equal((await call('/api/content/'+docId,'GET',null,'guest')).title,'第一版')
 await call('/api/admin/documents/'+docId,'POST',{action:'save',revision:1,body:{title:'過期',image:''}},'admin',409)
 result=await call('/api/admin/documents/'+docId,'POST',{action:'save',revision:result.revision,body:{title:'第二版',image:''}})
 assert.equal((await call('/api/content/'+docId,'GET',null,'guest')).title,'第一版')
 result=await call('/api/admin/documents/'+docId,'POST',{action:'restore',revision:result.revision,version:firstVersion})
 assert.equal((await call('/api/admin/documents/'+docId)).body.title,'第一版')
 result=await call('/api/admin/documents/'+docId,'POST',{action:'unpublish',revision:result.revision})
 await call('/api/content/'+docId,'GET',null,'guest',404)
 const form=new FormData();form.append('file',new Blob([await sharp({create:{width:30,height:30,channels:3,background:'#CAA05C'}}).png().toBuffer()],{type:'image/png'}),'cms-test.png')
 const media=await call('/api/admin/media','POST',form);mediaId=media.id
 await call(media.src,'GET',null,'guest',401);await call(media.src)
 const invalid=new FormData();invalid.append('file',new Blob(['fake-image'],{type:'image/png'}),'fake.png');await call('/api/admin/media','POST',invalid,'admin',400)
 const pdf=await PDFDocument.create();pdf.addPage();const pdfForm=new FormData();pdfForm.append('file',new Blob([await pdf.save()],{type:'application/pdf'}),'test.pdf');extraMedia.push((await call('/api/admin/media','POST',pdfForm)).id)
 const fakePdf=new FormData();fakePdf.append('file',new Blob(['%PDF-1.7 broken %%EOF'],{type:'application/pdf'}),'fake.pdf');await call('/api/admin/media','POST',fakePdf,'admin',400)
 const tooBig=new FormData();tooBig.append('file',new Blob([new Uint8Array(10*1024*1024+1)],{type:'image/png'}),'too-big.png');await call('/api/admin/media','POST',tooBig,'admin',413)
 for(const format of ['jpeg','webp']){const file=new FormData();file.append('file',new Blob([await sharp({create:{width:5,height:5,channels:3,background:'#fff'}})[format]().toBuffer()],{type:'image/'+format}),'test.'+format);extraMedia.push((await call('/api/admin/media','POST',file)).id)}
 result=await call('/api/admin/documents/'+docId,'POST',{action:'save',revision:result.revision,body:{title:'圖片發布',image:media.src}})
 result=await call('/api/admin/documents/'+docId,'POST',{action:'publish',revision:result.revision})
 await call(media.src,'GET',null,'guest')
 const m=(await call('/api/admin/media')).find(m=>m.id.toLowerCase()===mediaId.toLowerCase())
 await call('/api/admin/media','PATCH',{...m,archived:true},'admin',409)
 const body={contactName:'驗收資料',phone:'0912345678',company:'測試建設',email:'test@example.test',note:stamp,consent:true},key=randomUUID()
 const one=await call('/api/forms/builder-appointment','POST',body,'guest',200,{'Idempotency-Key':key}),two=await call('/api/forms/builder-appointment','POST',body,'guest',200,{'Idempotency-Key':key});assert.equal(one.id.toLowerCase(),two.id.toLowerCase())
 await call('/api/forms/builder-appointment','POST',{...body,note:'不同內容'},'guest',409,{'Idempotency-Key':key})
 await call('/api/forms/builder-appointment','POST',{...body,consent:false},'guest',400,{'Idempotency-Key':randomUUID()})
 const comment=await call('/api/comments','POST',{name:'驗收留言',email:'private@example.test',website:'',comment:'這是一則等待審核的驗收留言 '+stamp,route:'/gallery/case10',consent:true},'guest',200,{'Idempotency-Key':randomUUID()})
 assert(!(await call('/api/comments?route=/gallery/case10','GET',null,'guest')).some(c=>c.id.toLowerCase()===comment.id.toLowerCase()))
 await call('/api/admin/comments/'+comment.id,'POST',{status:'已核准',note:'',revision:1})
 const published=(await call('/api/comments?route=/gallery/case10','GET',null,'guest')).find(c=>c.id.toLowerCase()===comment.id.toLowerCase());assert(published);assert(!('email'in published))
 const editor=(await call('/api/admin/users')).find(u=>u.id===editorId),temporary=password+'-temporary'
 await call('/api/admin/users/'+editorId,'POST',{...editor,password:temporary})
 await call('/api/admin/session','GET',null,'editor',401)
 await call('/api/admin/login','POST',{email:editor.email,password},'editor',401)
 await call('/api/admin/login','POST',{email:editor.email,password:temporary},'editor');const changed=await call('/api/admin/session','GET',null,'editor');assert(changed.mustChange);sessions.editor=changed.csrf
 await call('/api/admin/documents','GET',null,'editor',403)
 cookies.set('stale',cookies.get('editor'))
 await call('/api/admin/password','POST',{currentPassword:temporary,password:password+'-permanent'},'editor');sessions.editor=(await call('/api/admin/session','GET',null,'editor')).csrf
 await call('/api/admin/session','GET',null,'stale',401);await call('/api/admin/documents','GET',null,'editor')
 const updated=(await call('/api/admin/users')).find(u=>u.id===editorId);await call('/api/admin/users/'+editorId,'POST',{...updated,disabled:true});await call('/api/admin/session','GET',null,'editor',401)
 const seeded=await query('SELECT id,draftId,publishedId,seedHash,revision FROM cms.Documents ORDER BY id')
 execFileSync(process.execPath,['scripts/cms-db.mjs','seed'],{cwd:new URL('../',import.meta.url),env:process.env,stdio:'pipe'})
 assert.deepEqual((await query('SELECT id,draftId,publishedId,seedHash,revision FROM cms.Documents ORDER BY id')).recordset,seeded.recordset)
 const tmp=await mkdtemp(join(tmpdir(),'cms-conflict-'));try{const conflict=structuredClone(seed[0]);conflict.data.conflict=true;const fresh={...seed[0],id:'test-conflict-'+stamp};await writeFile(join(tmp,'seed.json'),JSON.stringify([fresh,conflict]));assert.throws(()=>execFileSync(process.execPath,['scripts/cms-db.mjs','seed',join(tmp,'seed.json')],{cwd:new URL('../',import.meta.url),env:process.env,stdio:'pipe'}));assert.equal((await query('SELECT id FROM cms.Documents WHERE id=@id',{id:fresh.id})).recordset.length,0)}finally{await rm(tmp,{recursive:true,force:true})}
 for(const d of seed){await call('/api/content/'+d.id,'GET',null,'guest')}
 if(process.env.CMS_TEST_REAL_CONTENT==='1'){
  async function saveReal(id,body){let state=contentBackups.get(id);if(!state){const d=await call('/api/admin/documents/'+id);assert.equal(d.draftId,d.publishedId,`Skip ${id}: existing unpublished work`);state={body:d.body,revision:d.revision};contentBackups.set(id,state)}const r=await call('/api/admin/documents/'+id,'POST',{action:'save',revision:state.revision,body});state.revision=r.revision}
  async function publishReal(id){const state=contentBackups.get(id),r=await call('/api/admin/documents/'+id,'POST',{action:'publish',revision:state.revision});state.revision=r.revision}
  async function restoreReal(id){const state=contentBackups.get(id);await saveReal(id,state.body);await publishReal(id);contentBackups.delete(id)}
  for(const id of ['news-articles','knowledge-articles','custom-cases']){
   const d=await call('/api/admin/documents/'+id),item=structuredClone(d.schema.fields.items.template);item.id=randomUUID();item.slug='cms-check-'+stamp
   let route
   if(id==='custom-cases'){delete item.slug;Object.assign(item,{title:'CMS 新案例驗收',description:'獨立來源案例測試',cover:'/home-2026/hero/10bn/aikitchen.webp',images:['/home-2026/hero/10bn/aikitchen.webp'],form:'驗收型式',style:'驗收風格'});route='/design-inspiration/'+item.id}
   else {item.summary.title='CMS 新文章驗收 '+stamp;route=id==='news-articles'?'/news/latest/'+item.slug:'/knowledge/design/'+item.slug}
   await saveReal(id,{...d.body,items:[item,...d.body.items]})
   if(id==='custom-cases'){await call('/api/design-inspiration/cases/'+item.id,'GET',null,'guest',404);await call('/api/design-inspiration/cases/'+item.id+'?cmsPreview=custom-cases');await call('/api/design-inspiration/cases/'+item.id+'?cmsPreview=custom-cases','GET',null,'guest',401)}
   else{const alias=id==='news-articles'?'data-news':'data-kitchenGuides',key=id==='news-articles'?'newsArticles':'KITCHEN_GUIDE_ARTICLES';assert(!(await call('/api/content/'+alias,'GET',null,'guest'))[key].some(i=>i.id===item.id));assert((await call('/api/content/'+alias+'?preview='+id))[key].some(i=>i.id===item.id))}
   await publishReal(id);const html=await call(route,'GET',null,'guest');assert(html.includes(id==='custom-cases'?item.title:item.summary.title))
   if(id==='custom-cases'){assert((await call('/api/design-inspiration/filters')).forms.includes('驗收型式'));assert((await call('/api/design-inspiration/cases?form='+encodeURIComponent('驗收型式'))).items.some(i=>i.id===item.id))}
   await restoreReal(id)
  }
  const d=await call('/api/admin/documents/catalog-sakura'),body=structuredClone(d.body),product=body.items.find(i=>i.enabled);product.enabled=false
  await saveReal(d.id,body);await call('/api/products/sakura/items/'+product.id,'GET',null,'guest');await call('/api/products/sakura/items/'+product.id+'?cmsPreview=catalog-sakura','GET',null,'admin',404);await publishReal(d.id);await call('/api/products/sakura/items/'+product.id,'GET',null,'guest',404);await restoreReal(d.id)
 }
 const sources=(await query("SELECT COUNT(*) AS total,CHECKSUM_AGG(BINARY_CHECKSUM(*)) AS checksum FROM sync.BuyKitchenProducts;SELECT COUNT(*) AS total,CHECKSUM_AGG(BINARY_CHECKSUM(*)) AS checksum FROM sync.DesignCloudCases")).recordsets
 assert.deepEqual(sources,sourceBefore)
 const routes=['/','/home-style/aikitchen','/home-style/clever','/news','/news/latest','/news/latest/kaohsiung_opening','/news/activities','/news/video','/gallery','/gallery/case10','/about/introduce','/about/advantage','/about/exhibition','/knowledge','/service-process','/franchising/intro','/builders','/catalogues/catalog','/products/sakura','/design-inspiration']
 routes.push(...seed.find(d=>d.id==='data-kitchenSeries').data.KITCHEN_SERIES_PAGES.map(i=>'/home-style/'+i.slug),...seed.find(d=>d.id==='news-articles').data.items.map(i=>`/news/${i.summary.category}/${i.slug}`),...seed.find(d=>d.id==='knowledge-articles').data.items.map(i=>'/knowledge/design/'+i.slug),...seed.find(d=>d.id==='data-storeCases').data.storeCases.map(i=>'/gallery/'+i.slug))
 for(const path of new Set(routes)){console.log('SSR',path);const html=await call(path,'GET',null,'guest');assert(typeof html==='string'&&html.includes('__NUXT'),'SSR '+path)}
 console.log(`Verified ${new Set(routes).size} public SSR routes and ${seed.length} resource APIs`)
 console.log('PASS: authentication, roles, CSRF, draft/publish/restore/unpublish, 409 conflicts, uploads/private media/references, idempotent forms, moderation, source checksums account reset/disable/session revocation, safe seed reruns/conflicts, all resource APIs and public SSR routes')
}finally{
 for(const[id,state]of contentBackups){const r=await call('/api/admin/documents/'+id,'POST',{action:'save',revision:state.revision,body:state.body});await call('/api/admin/documents/'+id,'POST',{action:'publish',revision:r.revision})}
 await transaction(async tx=>{
  await query('DELETE cms.MediaRefs WHERE versionId IN(SELECT id FROM cms.Versions WHERE documentId=@id);DELETE cms.Versions WHERE documentId=@id;DELETE cms.Documents WHERE id=@id',{id:docId},tx)
  await query('DELETE cms.Submissions WHERE body LIKE @needle;DELETE cms.Comments WHERE comment LIKE @needle',{needle:'%'+stamp+'%'},tx)
  await query('DELETE cms.Sessions WHERE userId IN(@id,@editor);DELETE cms.Audit WHERE actor IN(@id,@editor);DELETE cms.Users WHERE id IN(@id,@editor)',{id:userId,editor:editorId},tx)
  for(const id of [mediaId,...extraMedia].filter(Boolean)){const row=(await query('SELECT filename FROM cms.Media WHERE id=@id',{id},tx)).recordset[0];await query('DELETE cms.Media WHERE id=@id',{id},tx);if(row)await(await import('node:fs/promises')).unlink((process.env.CMS_MEDIA_DIR||'')+'/'+row.filename).catch(()=>{})}
 });process.exitCode=process.exitCode||0
}
await(await import('../server/cms/database.mjs')).database().then(p=>p.close())
