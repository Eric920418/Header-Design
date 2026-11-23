import assert from 'node:assert/strict'
import {readFile} from 'node:fs/promises'
import {fileURLToPath} from 'node:url'

export async function checkNewsHeadings(get, content) {
 const articles=(await content('data-news')).newsArticles
 const escapeHtml=text=>String(text).replace(/[&<>"']/g,char=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[char]))
 for(const category of ['activities','latest','video']){
  const samples=articles.filter(row=>row.category===category)
  assert(samples.length,category+'需有已發布文章可驗證標題')
  for(const article of samples){
   const html=await(await get(article.legacyPath)).text()
   const main=html.match(/<main\b[^>]*>([\s\S]*?)<\/main>/)?.[1]||''
   const headings=[...main.matchAll(/<h1\b([^>]*)>([\s\S]*?)<\/h1>/g)]
   assert.equal(headings.length,1,article.legacyPath+'需有一個h1')
   const [,attributes,contents]=headings[0]
   assert(/class="[^"]*\bentry-title\b/.test(attributes),article.legacyPath+'需使用entry-title')
   assert.equal(contents.replace(/<[^>]*>/g,''),escapeHtml(article.title),article.legacyPath+'需完整顯示CMS標題')
   const id=attributes.match(/\bid="([^"]+)"/)?.[1]
   assert(id&&main.includes('aria-labelledby="'+id+'"'),article.legacyPath+'文章需由實際h1標示名稱')
  }
  console.log('PASS '+category+' '+samples.length+' published article headings, text runs, single h1 and accessible name')
 }
}

if(process.argv[1]===fileURLToPath(import.meta.url)){
 const base=process.env.TEST_BASE_URL||'http://127.0.0.1:3101'
 assert(['localhost','127.0.0.1'].includes(new URL(base).hostname),'此指令僅供本機回歸')
 const config=await readFile(new URL('../nuxt.config.ts',import.meta.url),'utf8')
 const password=process.env.PREVIEW_PASSWORD||config.match(/previewPassword:\s*'([^']+)'/)[1]
 const gate=await fetch(base+'/api/preview-access',{method:'POST',headers:{'content-type':'application/json'},body:JSON.stringify({password}),signal:AbortSignal.timeout(30000)})
 assert.equal(gate.status,200)
 const cookie=gate.headers.getSetCookie().map(value=>value.split(';')[0]).join('; ')
 const get=async path=>{const response=await fetch(base+path,{headers:{cookie},signal:AbortSignal.timeout(45000)});assert.equal(response.status,200,path);return response}
 await checkNewsHeadings(get,async id=>(await get('/api/content/'+id)).json())
}
