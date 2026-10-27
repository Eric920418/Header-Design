import assert from 'node:assert/strict'
import {spawnSync} from 'node:child_process'
import {readFile} from 'node:fs/promises'
import {workspaces,workspaceFor,editorLink,cmsDate} from '../shared/cms/workflow.mjs'
import {workspaceSummariesFromRows} from '../server/cms/workspaces.mjs'
import {nameBindings,siteSections,workspaceNames,navigationSections,sectionForQuery,matchesWorkspace} from '../shared/cms/navigation.mjs'
const seed=JSON.parse(await readFile(new URL('../shared/cms/seed.json',import.meta.url))),published=Object.fromEntries(seed.map(d=>[d.id,structuredClone(d.data)])),original=JSON.stringify(published)
const names=workspaceNames(workspaces,published),find=(rows,id)=>rows.find(w=>w.id===workspaceFor(id)?.id)
assert.equal(names.length,48);assert.deepEqual(Object.keys(nameBindings).sort(),workspaces.map(w=>w.id).sort());assert.equal(new Set(names.map(w=>w.title)).size,48)
for(const w of names){assert(w.pageTitle&&w.purpose&&w.sectionTitle);assert.equal(w.title,w.pageTitle+'｜'+w.purpose);assert(w.href.startsWith('/'));assert.equal(w.location.at(-1),w.purpose);assert(matchesWorkspace(w,w.title));assert(matchesWorkspace(w,workspaces.find(i=>i.id===w.id).title));assert(siteSections.some(s=>s.key===w.section)||w.section==='home')}
assert.equal(find(names,'knowledge-articles').section,'design');assert.equal(find(names,'data-brandPavilions').section,'brand');assert.equal(find(names,'data-service').section,'service')
const changed=structuredClone(published),header=changed['view-components-SiteHeader'];header.leftNav.reverse();const news=header.leftNav.find(n=>n.to==='/news');news.label='櫻花新消息';news.children.find(n=>n.to==='/news/latest').label='最新品牌動態'
changed['view-components-home-HomeProject'].copy.text1='全新';changed['view-components-home-HomeProject'].copy.text2='廚房系列'
const renamed=workspaceNames(workspaces,changed)
assert.equal(find(renamed,'news-articles').pageTitle,'櫻花新消息');assert.equal(find(renamed,'view-pages-news-latest-slug-').pageTitle,'最新品牌動態');assert.equal(find(renamed,'view-components-home-HomeProject').pageTitle,'全新廚房系列');assert.equal(navigationSections(renamed)[0].key,'news')
const draft=structuredClone(changed);draft['view-components-home-HomeProject'].copy.text1='未發布草稿';const mixedRows=Object.entries(changed).map(([id,body])=>({id,body:JSON.stringify(draft[id]),publishedBody:JSON.stringify(body)}));assert.equal(find(workspaceSummariesFromRows(mixedRows),'view-components-home-HomeProject').pageTitle,'全新廚房系列')
changed['news-articles'].items[0].summary.title='單篇文章的任意名稱';assert.equal(find(workspaceNames(workspaces,changed),'view-pages-news-latest-slug-').pageTitle,'最新品牌動態')
for(const w of workspaceNames(workspaces,{}))assert(w.title&&!w.title.includes('undefined'))
delete changed['view-components-home-HomeProject'].copy.text1;assert.equal(find(workspaceNames(workspaces,changed),'view-components-home-HomeProject').pageTitle,'品牌系列')
const legacy={pages:'all',cases:'design',stores:'service',news:'news',products:'products',settings:'shared'}
for(const [area,section]of Object.entries(legacy))assert.equal(sectionForQuery({area}),section)
assert.equal(sectionForQuery({section:'invalid'}),'all')
const link=editorLink('data-kitchenStyles',{area:'pages',q:'品牌',page:'2',section:'all'});assert.equal(link.path,'/admin/home');assert.equal(link.query.part,'data-kitchenStyles');assert.equal(link.query.returnPath,'/admin/content');assert.equal(link.query.q,'品牌');assert.equal(link.query.page,'2');assert(!('area'in link.query));assert.equal(editorLink('knowledge-articles').query.section,'design')
const latest=find(names,'view-pages-news-latest-slug-');assert(latest.pageLinks.every(p=>p.href==='/news/latest'),'shared text must not masquerade as a single article')
for(const brand of ['sakura','svago','teka'])assert(find(names,'catalog-'+brand).pageLinks.some(p=>p.href==='/products/'+brand))
assert.equal(JSON.stringify(published),original,'Name resolution must not mutate published content')
const dateCode="import {cmsDate} from './shared/cms/workflow.mjs';console.log(cmsDate('2026-09-28T14:02:46Z'))"
const formatted=['UTC','Asia/Taipei'].map(TZ=>{const r=spawnSync(process.execPath,['--input-type=module','-e',dateCode],{cwd:new URL('../',import.meta.url),env:{...process.env,TZ},encoding:'utf8'});assert.equal(r.status,0,r.stderr);return r.stdout.trim()})
assert.equal(formatted[0],formatted[1]);assert.equal(formatted[0],'2026/9/28 下午10:02:46');assert.equal(cmsDate('invalid'),'尚無時間');assert.equal(cmsDate(null),'尚無時間')
console.log('PASS: matching server/browser dates across UTC and Taipei; missing dates remain readable')
console.log('PASS: 48 unique entries, official categories, published names/reordering, missing-name defaults, shared pages, legacy search/URLs, return conditions and page choices')
if(process.env.CMS_NAMES_PRODUCTION==='1'){
 assert.equal(process.env.NUXT_DESIGN_DB_SERVER,'sakura-website-test-20260929.database.windows.net');assert.equal(process.env.CMS_DB_DATABASE,'SakuraWebsiteTest')
 const {query,database,digest}=await import('../server/cms/database.mjs'),{workspaceSummaries}=await import('../server/cms/workspaces.mjs')
 try{
  const fingerprint=async()=>digest(JSON.stringify((await query('SELECT id,revision,draftId,publishedId,updatedAt FROM cms.Documents ORDER BY id')).recordset)+JSON.stringify((await query('SELECT id,documentId,body FROM cms.Versions ORDER BY id')).recordset))
  const before=await fingerprint(),rows=await workspaceSummaries();assert.equal(rows.length,48)
  for(const w of rows){assert(w.title&&w.section&&w.purpose&&w.location.length===3);assert(matchesWorkspace(w,w.title))}
  assert.equal(await fingerprint(),before,'Read-only acceptance must leave all documents and versions unchanged')
  console.log('PASS: production SQL read-only summaries, 48 entries, published metadata and unchanged documents/versions')
  console.log(JSON.stringify(rows.map(({id,section,title,href})=>({id,section,title,href}))))
 }finally{await(await database()).close()}
}
