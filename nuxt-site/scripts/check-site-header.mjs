// Read-only acceptance against the requested origin, never the local CMS as a proxy for production.
import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'

const base=new URL(process.env.TEST_BASE_URL||'http://localhost:3100')
assert(['http:','https:'].includes(base.protocol)&&!base.username&&!base.password&&base.pathname==='/'&&!base.search&&!base.hash,'只能指定完整網站origin')
assert(['localhost','127.0.0.1','sakura-demo-vanlantech.com','header-design-two.vercel.app'].includes(base.hostname),'只允許本機或兩個既有正式網域，禁止將預覽密碼傳至其他網站')
assert(['localhost','127.0.0.1'].includes(base.hostname)||base.protocol==='https:'&&!base.port,'正式網站必須使用標準HTTPS')
const password=process.env.PREVIEW_PASSWORD||readFileSync(new URL('../nuxt.config.ts',import.meta.url),'utf8').match(/previewPassword:\s*['"]([^'"]+)['"]/)?.[1]
assert(password,'找不到既有預覽登入設定')
const login=await fetch(new URL('/api/preview-access',base),{method:'POST',redirect:'error',headers:{'content-type':'application/json'},body:JSON.stringify({password}),signal:AbortSignal.timeout(45000)})
assert.equal(login.status,200,base.origin+' 預覽登入失敗')
const cookie=login.headers.getSetCookie().map(s=>s.split(';')[0]).join('; ')
async function get(path){
 const response=await fetch(new URL(path,base),{redirect:'error',headers:{cookie},signal:AbortSignal.timeout(45000)})
 assert.equal(response.status,200,base.origin+path+' HTTP錯誤')
 return response
}
const content=await(await get('/api/content/view-components-SiteHeader')).json()
const pavilion=content.rightNav.flatMap(item=>item.children||[]).filter(item=>item.to==='/about/exhibition')
assert.equal(pavilion.length,1,base.origin+' 品牌館入口必須唯一')
assert.equal(pavilion[0].label,'櫻花集團品牌館',base.origin+' 正式已發布Header名稱錯誤，不得以本機結果替代')
const franchise=content.rightNav.find(item=>item.to==='/franchising/intro')
assert(franchise,'保留我要加盟分類')
assert.deepEqual(franchise.children.filter(item=>['/franchising/form','/franchising/download'].includes(item.to)),[{label:'加盟申請表單',to:'/franchising/form'},{label:'加盟資料下載',to:'/franchising/download'}],'保留已發布的兩個加盟額外入口')
for(const path of ['/','/news']){
 const html=await(await get(path)).text(),header=html.match(/<header\b[\s\S]*?<\/header>/)?.[0]
 assert(header,base.origin+path+' 主導覽不存在')
 const labels=[...header.matchAll(/<a\b[^>]*href="\/about\/exhibition"[^>]*>([\s\S]*?)<\/a>/g)].map(m=>m[1].replace(/<[^>]+>/g,'').trim())
 assert(labels.length>0&&labels.every(label=>label==='櫻花集團品牌館'),base.origin+path+' 真實SSR主導覽仍為舊名稱')
 assert(header.includes('aria-controls="franchise-extra-desktop"'),'原加盟伸縮箭頭不得消失')
 console.log(`PASS ${base.origin}${path} Header: 櫻花集團品牌館；加盟箭頭及兩筆入口保留`)
}
