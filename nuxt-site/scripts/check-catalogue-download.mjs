import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import vm from 'node:vm'
import ts from 'typescript'

const source=readFileSync(new URL('../server/api/catalogues/[id].get.ts',import.meta.url),'utf8')
const code=ts.transpileModule(source.replace(/^import .*$/m,''),{compilerOptions:{module:ts.ModuleKind.CommonJS}}).outputText
let pdfUrl,fetches=0,headers
const context=vm.createContext({
  exports:{},URL,Response,AbortSignal,TextDecoder,Uint8Array,
  defineEventHandler:handler=>handler,
  readContent:async()=>({KITCHEN_CATALOGUES:[],PRODUCT_CATALOGUES:[{id:'test',pdfUrl}]}),
  getRouterParam:event=>event.id,
  createError:options=>Object.assign(new Error(options.message||options.statusMessage),options),
  sendRedirect:(_event,url,status)=>({url,status}),
  setResponseHeaders:(_event,value)=>{headers=value},
  fetch:async()=>{fetches++;return new Response('%PDF-1.4\n%%EOF',{headers:{'Content-Type':'application/pdf'}})},
})
vm.runInContext(code,context)
const handler=context.exports.default
for(const url of ['/section-2/catalogues/catalog/files/sakura-kitchen-2026-20261102.pdf','/media/4c8ad00e-af11-43b1-856c-a49569fe3681']){
  pdfUrl=url
  const result=await handler({id:'test'})
  assert.equal(result.url,url);assert.equal(result.status,302)
}
assert.equal(fetches,0,'本站型錄及媒體庫不應代理下載全部位元組')
for(const url of ['/section-2/catalogues/catalog/files/../private.pdf','/section-2/catalogues/catalog/files/%2e%2e-private.pdf','//evil.example/test.pdf','https://evil.example/test.pdf','https://user:password@www.sakura-kitchenlife.com.tw/test.pdf']){
  pdfUrl=url
  await assert.rejects(()=>handler({id:'test'}))
}
assert.equal(fetches,0,'不可信來源不得發出請求')
pdfUrl='https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/test.pdf'
assert.equal(new TextDecoder().decode(await handler({id:'test'})),'%PDF-1.4\n%%EOF')
assert.equal(fetches,1);assert.equal(headers['Content-Type'],'application/pdf')
await assert.rejects(()=>handler({id:'missing'}),{statusCode:404})
console.log('PASS 本站／媒體庫轉址、無額外代理請求、路徑與來源限制、官方 PDF 及不存在 ID')
