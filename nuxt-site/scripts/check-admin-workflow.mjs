import assert from 'node:assert/strict'
import {readFile} from 'node:fs/promises'
import {randomUUID} from 'node:crypto'
import {workspaces,workspaceFor,changedItems,firstImage} from '../shared/cms/workflow.mjs'
import {editingSchema,fieldPresentation} from '../shared/cms/presentation.mjs'
import {publicContent,contentAliases} from '../shared/cms/public-content.mjs'
import {createDraftPreview,readDraftPreview} from '../server/cms/previews.mjs'
import {workspaceInput} from '../server/cms/workspaces.mjs'
import {pageEditors,pageEditor,pageBlocks,legacyPage,legacyPageLink,pageEditorLink,searchPages,pageSummary,valueAt,withValue,pageFieldValue} from '../shared/cms/page-editors.mjs'
import {checkPageBody,pageEditorInput,editorSchema,changePageEditor} from '../server/cms/page-editors.mjs'
import {validate} from '../server/cms/content.mjs'
import {HOME_PROJECT_ID,HOME_SERVICES_ID,homeProjectHeading,homeServicesHeading} from '../shared/cms/home-headings.mjs'
import {hasPageChanges,pageChanges} from '../shared/cms/changes.mjs'
const seed=JSON.parse(await readFile(new URL('../shared/cms/seed.json',import.meta.url)))
assert.deepEqual(['copy.field1','copy.text2','copy.text3','copy.text4'].map(path=>fieldPresentation('view-pages-privacy',path).label),['頁面英文標題','條款介紹文字','最後修訂日期','公司名稱'])
const pageDocuments=seed.map(d=>({...d,body:d.data,schema:editorSchema({...d,schemaJson:JSON.stringify(d.schema)})}))
const homePage=pageEditor('home'), headingDoc=pageDocuments.find(d=>d.id===HOME_PROJECT_ID), homeBlocks=pageBlocks(homePage,pageDocuments)
const headingFields=homeBlocks.find(b=>b.id==='home:品牌系列').fields.filter(f=>f.documentId===HOME_PROJECT_ID)
assert.deepEqual(headingFields.map(f=>f.label),['區塊英文標籤','主標題前置英文','區塊中文主標題','區塊英文主標題（第一段）','區塊英文主標題（第二段）','介紹文字'])
const beforeHeading={[HOME_PROJECT_ID]:headingDoc.body}
assert.deepEqual(headingFields.slice(0,5).map(f=>pageFieldValue(beforeHeading,f)),['BRAND SERIES','Explore Our',headingDoc.body.copy.text1+headingDoc.body.copy.text2,'Creative Projects','That Define Our Style'])
const editedHeading=structuredClone(headingDoc.body)
Object.assign(editedHeading.copy,{englishTitleSecond:'Another Line',chineseTitle:'完整中文標題',englishLabel:'NEW LABEL',englishTitleFirst:'Different Ideas',englishLead:'Take A Look'})
checkPageBody(homePage,HOME_PROJECT_ID,headingDoc.body,editedHeading,headingDoc.schema)
validate(headingDoc.body,headingDoc.schema);validate(editedHeading,headingDoc.schema)
assert.deepEqual(Object.values(homeProjectHeading(editedHeading.copy)),['NEW LABEL','Take A Look','完整中文標題','Different Ideas','Another Line'])
assert.equal(homeProjectHeading({...editedHeading.copy,englishLead:''}).englishLead,'')
assert(!Object.hasOwn(headingDoc.body.copy,'chineseTitle'))
assert(!hasPageChanges(homeBlocks,beforeHeading,{[HOME_PROJECT_ID]:{...headingDoc.body,copy:{...headingDoc.body.copy,...homeProjectHeading(headingDoc.body.copy)}}}),'Reading old titles does not generate unpublished edits')
assert.equal(pageChanges(homeBlocks,[headingDoc],beforeHeading,{[HOME_PROJECT_ID]:editedHeading}).find(c=>c.path==='copy.englishLabel').before,'BRAND SERIES')
assert.throws(()=>checkPageBody(homePage,HOME_PROJECT_ID,headingDoc.body,{...editedHeading,copy:{...editedHeading.copy,text1:'越過欄位限制'}},headingDoc.schema),e=>e.statusCode===400)
const serviceHeadingDoc=pageDocuments.find(d=>d.id===HOME_SERVICES_ID),serviceTitleField=homeBlocks.flatMap(b=>b.fields).find(f=>f.documentId===HOME_SERVICES_ID&&f.path==='copy.chineseTitle')
assert.equal(pageFieldValue({[HOME_SERVICES_ID]:serviceHeadingDoc.body},serviceTitleField),'廚房產品')
const serviceFields=homeBlocks.find(b=>b.id==='home:廚房產品').fields.filter(f=>f.documentId===HOME_SERVICES_ID&&f.path.startsWith('copy.')&&f.path!=='copy.field3')
assert.deepEqual(serviceFields.map(f=>f.label),headingFields.slice(0,5).map(f=>f.label))
const serviceEdit=structuredClone(serviceHeadingDoc.body)
Object.assign(serviceEdit.copy,{englishLabel:'APPLIANCES',englishLead:'Discover',chineseTitle:'智慧廚電',englishTitleFirst:'First Line',englishTitleSecond:'Second Line'})
checkPageBody(homePage,HOME_SERVICES_ID,serviceHeadingDoc.body,serviceEdit,serviceHeadingDoc.schema)
validate(serviceEdit,serviceHeadingDoc.schema)
assert.equal(homeServicesHeading({...serviceEdit.copy,englishLabel:''}).englishLabel,'')
assert(!hasPageChanges(homeBlocks,{[HOME_SERVICES_ID]:serviceHeadingDoc.body},{[HOME_SERVICES_ID]:{...serviceHeadingDoc.body,copy:{...serviceHeadingDoc.body.copy,...homeServicesHeading(serviceHeadingDoc.body.copy)}}}),'Reading original service headings does not create pending changes')
assert.equal(pageChanges(homeBlocks,[serviceHeadingDoc],{[HOME_SERVICES_ID]:serviceHeadingDoc.body},{[HOME_SERVICES_ID]:serviceEdit}).find(c=>c.path==='copy.englishLabel').before,'KITCHEN PRODUCTS')
for(const w of workspaces)assert(legacyPage(w.id),'Missing page: '+w.id)
assert.equal(workspaceFor('catalog-cases'),undefined)
assert.equal(legacyPage('catalog-cases').id,'inspiration')
assert.deepEqual(legacyPageLink('catalog-cases',{area:'cases',q:'案例',page:'2',list:'catalog-cases:items',item:'source-1'}),{
 path:'/admin/content',query:{q:'案例',page:'2',section:'design',sitePage:'inspiration',block:'inspiration:案例管理'},
})
assert(!pageEditor('inspiration').ids.includes('catalog-cases'))
assert.throws(()=>workspaceInput('catalog-cases',{action:'save',documents:[]}),e=>e.statusCode===404)
const inspirationInput={action:'preview',documents:pageEditor('inspiration').ids.map(id=>({id,revision:1,body:{}}))}
assert.equal(pageEditorInput('inspiration',inspirationInput).id,'inspiration')
assert.throws(()=>pageEditorInput('inspiration',{...inspirationInput,documents:[...inspirationInput.documents,{id:'catalog-cases',revision:1,body:{}}]}),e=>e.statusCode===400)

assert.equal(legacyPage('site-visuals').id,'visuals');assert.equal(legacyPage('data-brandPavilions').id,'pavilions');assert.equal(legacyPage('data-kitchenStyles').id,'home')
assert.deepEqual(pageEditors.filter(p=>p.section==='design').map(p=>p.name),['品牌系列','設計靈感','廚房裝修指南','品牌系列型錄'])
for(const p of pageEditors){
 const documents=pageDocuments.filter(d=>p.ids.includes(d.id)),blocks=pageBlocks(p,documents),positions=blocks.flatMap(b=>b.fields.map(f=>f.documentId+':'+f.path))
 assert.deepEqual(pageBlocks(p,[...documents].reverse()).map(b=>({id:b.id,fields:b.fields.map(f=>f.documentId+':'+f.path)})),blocks.map(b=>({id:b.id,fields:b.fields.map(f=>f.documentId+':'+f.path)})),'Database row order must not change page positions')
 assert(blocks.length>0);assert.equal(new Set(positions).size,positions.length,'No duplicated fields inside '+p.id)
 for(const d of documents){
  checkPageBody(p,d.id,d.body,structuredClone(d.body),d.schema)
  const allowed=blocks.flatMap(b=>b.fields.filter(f=>f.documentId===d.id))
  for(const f of allowed){assert(f.label&&!f.label.includes('copy.'));assert.notEqual(f.label,'內容欄位',p.id+':'+f.path)}
 }
 const input={action:'save',documents:documents.map(d=>({id:d.id,revision:1,body:d.body}))};assert.equal(pageEditorInput(p.id,input),p)
 assert.throws(()=>pageEditorInput(p.id,{...input,documents:input.documents.slice(1)}))
}
const testPage=pageEditor('news-latest'),newsDoc=pageDocuments.find(d=>d.id==='news-articles'),newsNext=structuredClone(newsDoc.body)
newsNext.items.find(i=>i.summary.category==='latest').summary.title='僅修改最新消息'
checkPageBody(testPage,newsDoc.id,newsDoc.body,newsNext,newsDoc.schema)
newsNext.items.find(i=>i.summary.category==='activities').summary.title='不允許修改另一分類'
assert.throws(()=>checkPageBody(testPage,newsDoc.id,newsDoc.body,newsNext,newsDoc.schema),e=>e.statusCode===400)
const brandDoc=pageDocuments.find(d=>d.id==='data-productBrands'),brandNext=structuredClone(brandDoc.body)
brandNext.PRODUCT_BRANDS.teka.name='其他品牌不可改'
assert.throws(()=>checkPageBody(pageEditor('products-sakura'),brandDoc.id,brandDoc.body,brandNext,brandDoc.schema))
const seriesDoc=pageDocuments.find(d=>d.id==='data-kitchenSeries'),fixedNext=structuredClone(seriesDoc.body)
fixedNext.AI_KITCHEN_PAGE.name='不可改隱藏副本'
assert.throws(()=>checkPageBody(pageEditor('series'),seriesDoc.id,seriesDoc.body,fixedNext,seriesDoc.schema))
const heroDoc=pageDocuments.find(d=>d.id==='view-components-home-HomeHero'),heroNext=structuredClone(heroDoc.body)
heroNext.slides[0].image='/kitchen-styles/basic-plus.jpg';heroNext.slides[0].mobileImage='/kitchen-styles/basic-plus.jpg'
checkPageBody(pageEditor('home'),heroDoc.id,heroDoc.body,heroNext,heroDoc.schema)
const locationDoc=pageDocuments.find(d=>d.id==='view-components-home-HomeStoreLocation'),locationNext=structuredClone(locationDoc.body)
locationNext.stores[0].region='中部';locationNext.stores[0].city='臺中市';checkPageBody(pageEditor('home'),locationDoc.id,locationDoc.body,locationNext,locationDoc.schema)
const changedRegions=structuredClone(locationNext)
changedRegions.regions['中部'].pop()
assert.throws(()=>checkPageBody(pageEditor('home'),locationDoc.id,locationDoc.body,changedRegions,locationDoc.schema),/目前頁面以外/)
const serviceDoc=pageDocuments.find(d=>d.id==='view-components-home-HomeServices'),serviceNext=structuredClone(serviceDoc.body);serviceNext.services[0].imageLayout='arbitrary-style'
assert.throws(()=>checkPageBody(pageEditor('home'),serviceDoc.id,serviceDoc.body,serviceNext,serviceDoc.schema))
const homeLinkCards=[
 ['view-components-home-HomeStyleMarquee','styles','/knowledge?cms-link-check=style'],
 ['view-components-home-HomeServices','services','/gallery?cms-link-check=product'],
]
for(const [id,key,route] of homeLinkCards){
 const d=pageDocuments.find(d=>d.id===id),next=structuredClone(d.body)
 assert.equal(next[key][0].route,undefined)
 next[key][0].route=route
 checkPageBody(homePage,id,d.body,next,d.schema)
 validate(next,d.schema)
 const change=pageChanges(homeBlocks,[d],{[id]:d.body},{[id]:next})[0]
 assert.equal(change.path,key+'.0.route');assert(change.label.endsWith(key==='styles'?'設計風格選項連結':'廚電品牌卡片連結'))
 next[key][0].route='invalid://destination'
 assert.throws(()=>validate(next,d.schema),e=>e.statusCode===400&&e.message.includes('.route'))
}
const summaries=pageEditors.map(p=>pageSummary(p,[],pageDocuments)),found=searchPages(summaries,'品牌系列 圖片')
assert(found.some(r=>r.page.id==='series'&&r.block));assert(!searchPages(summaries,'完全不存在的修改位置').length)
const oldQuery={q:'案例',page:'2',group:'設計靈感'},newLink=pageEditorLink('inspiration',oldQuery,'inspiration:案例內容');assert.equal(newLink.query.q,'案例');assert.equal(newLink.query.page,'2');assert.equal(newLink.query.block,'inspiration:案例內容')
const allLink=pageEditorLink('inspiration',{section:'all',page:'2',q:'案例'});assert.equal(allLink.query.section,'design');assert.equal(allLink.query.returnSection,'all');assert.equal(allLink.query.page,'2')
const raw={copy:{text:'保留',other:'不變'}},patched=withValue(raw,'copy.text','新文字');assert.equal(valueAt(patched,'copy.text'),'新文字');assert.equal(raw.copy.text,'保留');assert.equal(patched.copy.other,'不變');assert.throws(()=>withValue(raw,'__proto__.bad','x'))
console.log(`PASS: ${pageEditors.length} page entries cover all editable workspace entries; design order, scoped fields, filtered articles, fixed data, search, immutable edits and old list conditions`)
const ignored=new Set([...Object.keys(contentAliases),'view-components-FloatingButtons','catalog-cases'])
for(const d of seed.filter(d=>!ignored.has(d.id))){assert(workspaceFor(d.id),`Missing task: ${d.id}`);assert.equal(workspaces.filter(w=>w.ids.includes(d.id)).length,1);assert.match(workspaceFor(d.id).title,/[\u4e00-\u9fffA-Z]/)}
const project=workspaceFor('data-kitchenStyles');assert(project.ids.includes('view-components-home-HomeProject'));assert.equal(project.area,'home')
const input={action:'preview',documents:project.ids.map(id=>({id,revision:1,body:{}}))};assert.equal(workspaceInput(project.id,input),project)
for(const mutation of [{...input,action:'delete'},{...input,documents:[input.documents[0],input.documents[0]]},{...input,documents:input.documents.slice(1)},{...input,documents:input.documents.map(d=>({...d,revision:'1'}))}])assert.throws(()=>workspaceInput(project.id,mutation))
const sample=seed.find(d=>d.id==='data-kitchenStyles'),before=structuredClone(sample.data),next=structuredClone(before);next.KITCHEN_STYLES[0].zh='變更卡片名稱';next.KITCHEN_STYLES[1].desc='另一筆先前的修改'
const changes=changedItems(before,next,editingSchema(sample.schema,sample.id));assert(changes.some(c=>c.includes('變更卡片名稱')));assert(changes.length>=2);assert(firstImage(before))
for(const d of seed.filter(d=>!contentAliases[d.id])){const original=JSON.stringify(d.data);publicContent(d.id,d.data);assert.equal(JSON.stringify(d.data),original,'Projection must not mutate inputs')}
await assert.rejects(()=>readDraftPreview('invalid','author',sample.id),e=>e.statusCode===404&&e.data.cmsPreviewExpired===true)
await assert.rejects(()=>createDraftPreview('author',[{id:'too-large',body:{text:'字'.repeat(1024*1024)}}]),e=>e.statusCode===413)
console.log(`PASS: ${workspaces.length} tasks cover every managed resource once; grouped sections, validation, complete pending-change summaries and immutable public projections.`)
if(process.env.CMS_PAGE_HTTP){
 const base=process.env.CMS_PAGE_HTTP;assert(['localhost','127.0.0.1'].includes(new URL(base).hostname))
 for(const name of ['PREVIEW_PASSWORD','CMS_TEST_EMAIL','CMS_TEST_PASSWORD','CMS_EDITOR_EMAIL'])assert(process.env[name],`Missing ${name}`)
 const jars={admin:{},editor:{},guest:{}}
 async function call(path,role='admin',body,csrf=true){
  const headers={Origin:base,Cookie:Object.entries(jars[role]).map(([k,v])=>k+'='+v).join('; ')}
  if(body){headers['Content-Type']='application/json';if(csrf&&jars[role].csrf)headers['X-CSRF-Token']=jars[role].csrf}
  const r=await fetch(base+path,{method:body?'POST':'GET',headers,signal:AbortSignal.timeout(30000),...(body?{body:JSON.stringify(body)}:{})})
  for(const value of r.headers.getSetCookie()){const pair=value.split(';')[0],i=pair.indexOf('=');jars[role][pair.slice(0,i)]=pair.slice(i+1)}
  return{status:r.status,body:await r.json(),cache:r.headers.get('cache-control')}
 }
 for(const role of ['admin','editor','guest']){assert.equal((await call('/api/preview-access',role,{password:process.env.PREVIEW_PASSWORD})).status,200);if(role!=='guest'){assert.equal((await call('/api/admin/login',role,{email:role==='admin'?process.env.CMS_TEST_EMAIL:process.env.CMS_EDITOR_EMAIL,password:process.env.CMS_TEST_PASSWORD})).status,200);jars[role].csrf=(await call('/api/admin/session',role)).body.csrf}}
 assert.equal((await call('/api/admin/page-editors','guest')).status,401)
 const before=(await call('/api/admin/documents')).body,home=(await call('/api/admin/page-editors/home')).body
 const links=home.documents.map(d=>({id:d.id,revision:d.revision,body:structuredClone(d.body)}))
 for(const [id,key,route] of homeLinkCards)links.find(d=>d.id===id).body[key][0].route=route
 const linkPreview=await call('/api/admin/page-editors/home','admin',{action:'preview',documents:links})
 assert.equal(linkPreview.status,200)
 const linkHeaders={Cookie:Object.entries(jars.admin).map(([k,v])=>k+'='+v).join('; ')}
 const pageHtml=async path=>{
  const response=await fetch(base+path,{headers:linkHeaders,signal:AbortSignal.timeout(30000)})
  assert.equal(response.status,200,path.split('?')[0])
  return await response.text()
 }
 const originalHome=await pageHtml('/'),previewHome=await pageHtml('/?cmsPreview=page:home&cmsDraft='+linkPreview.body.previewToken)
 assert(originalHome.includes('href="/design-inspiration?style=')&&originalHome.includes('href="/products/sakura"'))
 for(const [,,route] of homeLinkCards){
  assert(previewHome.includes('href="'+route+'"'),route)
  assert(!originalHome.includes(route),'A preview must leave the published links unchanged')
 }
 const heroInput=home.documents.map(d=>({id:d.id,revision:d.revision,body:structuredClone(d.body)}))
 const heroSlides=heroInput.find(d=>d.id===heroDoc.id).body.slides
 const basic=heroSlides.find(s=>s.route==='/home-style/basic-plus')
 const ai=heroSlides.find(s=>s.route==='/home-style/aikitchen')
 basic.description='輪播描述範圍驗收'
 const createHeroPreview=async()=>{
  const response=await call('/api/admin/page-editors/home','admin',{action:'preview',documents:heroInput})
  assert.equal(response.status,200)
  return response.body
 }
 const descriptionPreview=await createHeroPreview()
 assert(!descriptionPreview.impacts.some(i=>i.href.startsWith('/home-style/')))
 basic.title='Basic+ 預設標題驗收';ai.title='AI 主視覺驗收'
 const titlePreview=await createHeroPreview()
 assert.deepEqual(titlePreview.impacts.filter(i=>i.href.startsWith('/home-style/')).map(i=>i.href),['/home-style/basic-plus'])
 const heroQuery='?cmsPreview=page:home&cmsDraft='+titlePreview.previewToken
 const h1=html=>html.match(/<h1\b[^>]*id="ai-kitchen-hero-title"[^>]*>(.*?)<\/h1>/s)?.[1]
 assert.equal(h1(await pageHtml('/home-style/basic-plus'+heroQuery)),basic.title)
 assert.notEqual(h1(await pageHtml('/home-style/basic-plus')),basic.title)
 assert.equal(h1(await pageHtml('/home-style/aikitchen'+heroQuery)),h1(await pageHtml('/home-style/aikitchen')))
 console.log('PASS: published series with dedicated hero stories ignore a changed homepage title, while the default title is used by Basic+')
 const fixedLinks=[
  ['series','data-kitchenSeries','KITCHEN_SERIES_PAGES.0.buttonDestinations.explore','/home-style/aikitchen'],
  ['products-sakura','data-productBrands','PRODUCT_BRANDS.sakura.catalogueDestination','/products/sakura/all'],
  ['store-cases','view-pages-gallery-slug-','copy.storeBookingDestination','/gallery/case10'],
  ['pavilions','view-pages-about-exhibition','copy.bookingDestination','/about/exhibition'],
  ['knowledge','view-pages-knowledge-design-slug-','copy.moreDestination','/knowledge/design/systemcabinet'],
 ]
 for(const [page,id,field,location] of fixedLinks){
  const route='/knowledge?cms-link-check='+page
  const editor=await call('/api/admin/page-editors/'+page)
  assert.equal(editor.status,200,page)
  const documents=editor.body.documents.map(d=>({id:d.id,revision:d.revision,body:d.id===id?withValue(d.body,field,route):d.body}))
  const preview=await call('/api/admin/page-editors/'+page,'admin',{action:'preview',documents})
  assert.equal(preview.status,200,page)
  assert((await pageHtml(location+'?cmsPreview=page:'+page+'&cmsDraft='+preview.body.previewToken)).includes('href="'+route+'"'),page+' must render its configured link')
  assert(!(await pageHtml(location)).includes(route),page+' preview must not update the public website')
 }
 console.log('PASS: fixed button destinations and both homepage card links render in previews only')
 const allPages=(await call('/api/admin/page-editors')).body;assert.equal(allPages.length,pageEditors.length)
 for(const p of allPages){
  const r=await call('/api/admin/page-editors/'+p.id);assert.equal(r.status,200,p.id);assert(r.body.blocks.length)
  assert(r.body.positionPresentation&&Array.isArray(r.body.positionPresentation.sections),p.id+' must include read-only position information')
  assert(r.body.documents.every(d=>Object.hasOwn(d,'publishedBody')&&!Object.hasOwn(d.body,'publishedBody')),'Published status is read-only information, outside editable content')
  assert.equal(r.body.pending,p.pending,'The dashboard and editor must agree on actual pending content')
  assert(r.body.documents.every(d=>!Object.hasOwn(d.body,'positionPresentation')&&!Object.hasOwn(d.body,'rowPresentation')),'Preview photographs cannot be added to stored bodies')
  const snapshot=await call('/api/admin/page-editors/'+p.id,'admin',{action:'preview',documents:r.body.documents.map(d=>({id:d.id,revision:d.revision,body:d.body}))});assert.equal(snapshot.status,200,p.id+':'+JSON.stringify(snapshot.body));assert(snapshot.body.previewToken);assert(Array.isArray(snapshot.body.review.current)&&Array.isArray(snapshot.body.review.saved));console.log('Verified page read/preview/review: '+p.id)
 }
 const input={action:'preview',documents:home.documents.map(d=>({id:d.id,revision:d.revision,body:d.body}))}
 input.documents.find(d=>d.id==='view-components-home-HomeProject').body.copy.chineseTitle='HTTP未儲存驗收'
 assert.equal((await call('/api/admin/page-editors/home','admin',input,false)).status,403)
 const preview=await call('/api/admin/page-editors/home','admin',input);assert.equal(preview.status,200);assert.match(preview.cache,/no-store/)
 const path='/api/content/view-components-home-HomeProject?preview=page:home&cmsDraft='+preview.body.previewToken
 assert.equal((await call(path)).body.copy.chineseTitle,'HTTP未儲存驗收');assert.equal((await call(path,'guest')).status,401);assert.equal((await call(path,'editor')).status,404)
 assert.equal((await call('/api/admin/page-editors/home','editor',{...input,action:'publish'})).status,403)
 const stale=structuredClone(input);stale.documents[0].revision--;assert.equal((await call('/api/admin/page-editors/home','admin',stale)).status,409)
 const invalid=structuredClone(input);invalid.documents.find(d=>d.id==='view-components-home-HomeProject').body.copy.chineseTitle=42;const issue=await call('/api/admin/page-editors/home','admin',invalid);assert.equal(issue.status,400);assert(issue.body.data.fieldErrors?.length)
 const inspiration=(await call('/api/admin/page-editors/inspiration')).body,custom=inspiration.documents.find(d=>d.id==='custom-cases'),caseId=randomUUID(),hiddenId=randomUUID(),caseForm='驗收型式-'+caseId
 assert.equal(custom.schema.fields.items.item.fields.enabled.type,'boolean')
 const sample={...custom.schema.fields.items.template,id:caseId,title:'未儲存的自建案例',description:'只供預覽',cover:'/home-2026/hero/10bn/aikitchen.webp',images:['/home-2026/hero/10bn/aikitchen.webp'],form:caseForm,style:'現代風',specs:[]}
 custom.body.items.push({...sample,enabled:true},{...sample,id:hiddenId,enabled:false,style:'隱藏風格-'+hiddenId})
 const casesPreview=await call('/api/admin/page-editors/inspiration','admin',{action:'preview',documents:inspiration.documents.map(d=>({id:d.id,revision:d.revision,body:d.body}))});assert.equal(casesPreview.status,200)
 const draft='cmsPreview=page:inspiration&cmsDraft='+casesPreview.body.previewToken
 const visibleCases=await call('/api/design-inspiration/cases?'+draft+'&form='+encodeURIComponent(caseForm));assert.equal(visibleCases.status,200);assert.deepEqual(visibleCases.body.items.map(i=>i.id),[caseId])
 assert.equal((await call('/api/design-inspiration/cases/'+caseId+'?'+draft)).status,200);assert.equal((await call('/api/design-inspiration/cases/'+hiddenId+'?'+draft)).status,404)
 const caseFilters=await call('/api/design-inspiration/filters?'+draft);assert(caseFilters.body.forms.includes(caseForm));assert(!caseFilters.body.styles.includes('隱藏風格-'+hiddenId))
 const projected=await call('/api/content/custom-cases?preview=page:inspiration&cmsDraft='+casesPreview.body.previewToken);assert(projected.body.items.some(i=>i.id===caseId));assert(!projected.body.items.some(i=>i.id===hiddenId));assert.equal((await call('/api/design-inspiration/cases?'+draft,'guest')).status,401)
 const newsEditor=(await call('/api/admin/page-editors/news-latest')).body,newsDocument=newsEditor.documents.find(d=>d.id==='news-articles'),article=structuredClone(newsDocument.body.items.find(i=>i.summary.category==='latest'))
 article.id=randomUUID();article.slug='unsaved-'+article.id;article.summary.title='未刊登文章的預覽驗收';newsDocument.body.items.push(article)
 const articlePreview=await call('/api/admin/page-editors/news-latest','admin',{action:'preview',documents:newsEditor.documents.map(d=>({id:d.id,revision:d.revision,body:d.body}))});assert.equal(articlePreview.status,200)
 const articlePath='/news/latest/'+article.slug,draftQuery='cmsPreview=page:news-latest&cmsDraft='+articlePreview.body.previewToken,headers={Cookie:Object.entries(jars.admin).map(([k,v])=>k+'='+v).join('; ')}
 const privateArticle=await fetch(base+articlePath+'?'+draftQuery,{headers,signal:AbortSignal.timeout(30000)});assert.equal(privateArticle.status,200);assert((await privateArticle.text()).includes(article.summary.title));assert.match(privateArticle.headers.get('cache-control'),/no-store/)
 assert.equal((await fetch(base+articlePath,{headers,signal:AbortSignal.timeout(30000)})).status,404,'An unsaved article must never become publicly available')
 assert.equal((await call('/api/content/data-news?preview=page:news-latest&cmsDraft='+articlePreview.body.previewToken,'guest')).status,401)
 assert(!(await call('/api/content/data-news')).body.newsArticles.some(i=>i.id===article.id))
 assert.deepEqual((await call('/api/admin/documents')).body,before)
 console.log('PASS: all page reads/previews, login/permissions/CSRF/409, custom case display across list/detail/filters/content API, authenticated snapshots and unchanged website documents')
}
if(process.env.CMS_WORKFLOW_DB==='1'){
 assert.equal(process.env.NUXT_DESIGN_DB_SERVER||'127.0.0.1','127.0.0.1','Write checks require the local database')
 assert.equal(process.env.CMS_DB_DATABASE||process.env.NUXT_DESIGN_DB_DATABASE||'SakuraWebsiteDev','SakuraWebsiteDev')
 const {query,database,sql,passwordHash,randomUUID}=await import('../server/cms/database.mjs')
 const {changeWorkspace}=await import('../server/cms/workspaces.mjs')
 const {digest}=await import('../server/cms/database.mjs')
 const fingerprint=async()=>digest(JSON.stringify((await query('SELECT id,revision,draftId,publishedId FROM cms.Documents ORDER BY id')).recordset)+JSON.stringify((await query('SELECT id,documentId,body FROM cms.Versions ORDER BY id')).recordset))
 const original=await fingerprint(),tx=new sql.Transaction(await database());await tx.begin(sql.ISOLATION_LEVEL.SERIALIZABLE)
 try{
  const user={id:randomUUID(),role:'admin'},email=`workflow-${user.id}@example.invalid`
  await query('INSERT cms.Users(id,email,name,role,password,mustChange) VALUES(@id,@email,N\'流程交易測試\',N\'admin\',@password,0)',{...user,email,password:passwordHash(randomUUID())},tx)
  const documents=[]
  for(const id of project.ids){const d=(await query('SELECT d.*,v.body FROM cms.Documents d JOIN cms.Versions v ON v.id=d.draftId WHERE d.id=@id',{id},tx)).recordset[0];documents.push({id,revision:d.revision,body:JSON.parse(d.body)})}
  const body={action:'preview',documents},counts=await query('SELECT COUNT(*) n FROM cms.Versions',{},tx)
  // Only the temporary snapshot is written; content versions remain unchanged.
  await changeWorkspace(project.id,body,user,tx)
  assert.equal((await query('SELECT COUNT(*) n FROM cms.Versions',{},tx)).recordset[0].n,counts.recordset[0].n)
  documents.find(d=>d.id==='data-kitchenStyles').body.KITCHEN_STYLES[0].desc+='（僅限回滾交易驗證）'
  const saved=await changeWorkspace(project.id,{...body,action:'save'},user,tx);assert(saved.documents.some(d=>d.draftId!==d.publishedId))
  const savedInput={action:'publish',documents:saved.documents.map(d=>({id:d.id,revision:d.revision,body:d.body}))}
  await assert.rejects(()=>changeWorkspace(project.id,savedInput,{...user,role:'editor'},tx),e=>e.statusCode===403)
  const published=await changeWorkspace(project.id,savedInput,user,tx);assert(published.documents.every(d=>d.draftId===d.publishedId))
  const current={action:'unpublish',documents:published.documents.map(d=>({id:d.id,revision:d.revision,body:d.body}))}
  const hidden=await changeWorkspace(project.id,current,user,tx);assert(hidden.documents.every(d=>d.publishedId===null))
  await assert.rejects(()=>changeWorkspace(project.id,{...body,action:'save'},user,tx),e=>e.statusCode===409)
  const homepage=pageEditor('home'),homeDocs=[]
  for(const id of homepage.ids){const d=(await query('SELECT d.*,v.body FROM cms.Documents d JOIN cms.Versions v ON v.id=d.draftId WHERE d.id=@id',{id},tx)).recordset[0];homeDocs.push({id,revision:d.revision,body:JSON.parse(d.body)})}
  homeDocs.find(d=>d.id==='view-components-home-HomeHero').body.slides[0].title+='回滾預覽測試'
  homeDocs.find(d=>d.id==='view-components-home-HomeProject').body.copy.chineseTitle='整頁一起儲存'
  for(const [id,key,route] of homeLinkCards)homeDocs.find(d=>d.id===id).body[key][0].route=route
  const homeInput={action:'preview',documents:homeDocs},versionCount=(await query('SELECT COUNT(*) n FROM cms.Versions',{},tx)).recordset[0].n
  const preview=await changePageEditor('home',homeInput,user,tx);assert(preview.previewToken);assert.equal((await query('SELECT COUNT(*) n FROM cms.Versions',{},tx)).recordset[0].n,versionCount)
  const homeSaved=await changePageEditor('home',{...homeInput,action:'save'},user,tx);assert.equal((await query('SELECT COUNT(*) n FROM cms.Versions',{},tx)).recordset[0].n,versionCount+4,'Only changed documents get new versions')
  for(const [id,key,route] of homeLinkCards)assert.equal(homeSaved.documents.find(d=>d.id===id).body[key][0].route,route)
  const publishHome={action:'publish',documents:homeSaved.documents.map(d=>({id:d.id,revision:d.revision,body:d.body}))}
  await assert.rejects(()=>changePageEditor('home',publishHome,{...user,role:'editor'},tx),e=>e.statusCode===403)
  const homePublished=await changePageEditor('home',publishHome,user,tx);assert(homePublished.documents.every(d=>d.draftId===d.publishedId))
  await assert.rejects(()=>changePageEditor('home',{...homeInput,action:'save'},user,tx),e=>e.statusCode===409)
  const inspirationDocs=[]
  for(const id of pageEditor('inspiration').ids){const d=(await query('SELECT d.*,v.body FROM cms.Documents d JOIN cms.Versions v ON v.id=d.draftId WHERE d.id=@id',{id},tx)).recordset[0];inspirationDocs.push({id,revision:d.revision,body:JSON.parse(d.body)})}
  inspirationDocs.find(d=>d.id==='view-pages-design-inspiration-index').body.copy.text5='交易內篩選文字'
  inspirationDocs.find(d=>d.id==='view-pages-design-inspiration-id-').body.copy.text3='交易內返回文字'
  const inspirationVersions=(await query('SELECT COUNT(*) n FROM cms.Versions',{},tx)).recordset[0].n
  const inspirationPreview=await changePageEditor('inspiration',{action:'preview',documents:inspirationDocs},user,tx);assert(inspirationPreview.previewToken)
  assert.equal((await query('SELECT COUNT(*) n FROM cms.Versions',{},tx)).recordset[0].n,inspirationVersions)
  const inspirationSaved=await changePageEditor('inspiration',{action:'save',documents:inspirationDocs},user,tx)
  assert.equal((await query('SELECT COUNT(*) n FROM cms.Versions',{},tx)).recordset[0].n,inspirationVersions+2)
  assert(inspirationSaved.documents.filter(d=>['view-pages-design-inspiration-index','view-pages-design-inspiration-id-'].includes(d.id)).every(d=>d.draftId!==d.publishedId))
  for(const pageId of ['stores','store-cases']){
   const page=pageEditor(pageId),documents=[]
   const shared=(await query("SELECT revision,publishedId FROM cms.Documents WHERE id=N'data-storeCases'",{},tx)).recordset[0]
   assert(shared.publishedId)
   for(const id of page.ids){
    const d=(await query('SELECT d.*,v.body FROM cms.Documents d JOIN cms.Versions v ON v.id=d.draftId WHERE d.id=@id',{id},tx)).recordset[0]
    documents.push({id,revision:d.revision,body:JSON.parse(d.body)})
   }
   const paused=await changePageEditor(pageId,{action:'unpublish',documents},user,tx)
   assert(paused.documents.filter(d=>page.unpublishIds.includes(d.id)).every(d=>d.publishedId===null))
   assert.deepEqual((await query("SELECT revision,publishedId FROM cms.Documents WHERE id=N'data-storeCases'",{},tx)).recordset[0],shared)
  }
  console.log('PASS: each store editor can hide its own page settings while preserving the published store data; transaction rolled back')
  const newsOverview=pageEditor('news'),overviewDocuments=[]
  for(const id of newsOverview.ids){
   const d=(await query('SELECT d.revision,v.body FROM cms.Documents d JOIN cms.Versions v ON v.id=d.draftId WHERE d.id=@id',{id},tx)).recordset[0]
   overviewDocuments.push({id,revision:d.revision,body:JSON.parse(d.body)})
  }
  const articles=overviewDocuments.find(d=>d.id==='news-articles')
  const activity=articles.body.items.find(i=>i.summary.category==='activities')
  activity.detail.sections[0].paragraphs[0]+='（總覽內文回滾驗收）'
  const beforeNews=(await query('SELECT COUNT(*) n FROM cms.Versions',{},tx)).recordset[0].n
  const newsSaved=await changePageEditor(newsOverview.id,{action:'save',documents:overviewDocuments},user,tx)
  assert.equal((await query('SELECT COUNT(*) n FROM cms.Versions',{},tx)).recordset[0].n,beforeNews+1)
  const articleState=newsSaved.documents.find(d=>d.id==='news-articles')
  assert.notEqual(articleState.draftId,articleState.publishedId)
  const newsPaused=await changePageEditor(newsOverview.id,{action:'unpublish',documents:newsSaved.documents},user,tx)
  assert.equal(newsPaused.documents.find(d=>d.id==='news-articles').publishedId,articleState.publishedId)
  console.log('PASS: overview body edits save to the shared article draft; pausing the overview preserves published articles')
  console.log('PASS: inspiration filter and detail text save together as two drafts; their preview creates no content versions; this transaction is rolled back')
  console.log('PASS: whole-page preview creates no versions, two modified blocks save atomically, unchanged documents create no versions, editor publish denied and stale page returns 409')
  console.log('PASS: read-only preview, draft save, admin-only publish, unpublish and stale-edit conflict against real SQL inside a rollback-only transaction.')
 }finally{await tx.rollback()}
 assert.equal(await fingerprint(),original,'No original content or versions may change')
 // A failure in the last document must roll back any earlier saves.
 const userId=(await query("SELECT TOP(1) id FROM cms.Users WHERE role=N'admin' AND disabled=0")).recordset[0]?.id;assert(userId)
 const documents=[];for(const id of project.ids){const d=(await query('SELECT d.*,v.body FROM cms.Documents d JOIN cms.Versions v ON v.id=d.draftId WHERE d.id=@id',{id})).recordset[0];documents.push({id,revision:d.revision,body:JSON.parse(d.body)})}
 const sorted=[...documents].sort((a,b)=>a.id.localeCompare(b.id));sorted[0].body.KITCHEN_STYLES[0].desc+='（必須自動回滾）';sorted[1].revision--
 await assert.rejects(()=>changeWorkspace(project.id,{action:'save',documents}, {id:userId,role:'admin'}),e=>e.statusCode===409)
 assert.equal(await fingerprint(),original,'Transaction must undo the earlier document when a later document conflicts')
 console.log('PASS: failed multi-document operation rolls back completely; original document and version fingerprints unchanged.')
 const homeInput=[]
 for(const id of pageEditor('home').ids){const d=(await query('SELECT d.*,v.body FROM cms.Documents d JOIN cms.Versions v ON v.id=d.draftId WHERE d.id=@id',{id})).recordset[0];homeInput.push({id,revision:d.revision,body:JSON.parse(d.body)})}
 const homeOrdered=[...homeInput].sort((a,b)=>a.id.localeCompare(b.id));homeOrdered.find(d=>d.id==='view-components-home-HomeHero').body.slides[0].title+='必須回滾';homeOrdered.at(-1).revision--
 await assert.rejects(()=>changePageEditor('home',{action:'save',documents:homeInput},{id:userId,role:'admin'}),e=>e.statusCode===409)
 assert.equal(await fingerprint(),original,'A later page conflict must undo every earlier page save')
 console.log('PASS: whole-page conflict after earlier writes rolls back all documents and versions')
 await(await database()).close()
}
