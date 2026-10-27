import assert from 'node:assert/strict'
import {readFile} from 'node:fs/promises'
import {runInNewContext} from 'node:vm'
import {createRequire} from 'node:module'
import {createServer} from 'node:http'
import ts from 'typescript'

// Exercise the editor's actual handlers without a browser, SQL or content writes.
const source=await readFile(new URL('../components/admin/AdminResourceEditor.vue',import.meta.url),'utf8')
const script=source.match(/<script setup[^>]*>([\s\S]*?)<\/script>/)[1]
const parsed=ts.createSourceFile('editor.ts',script,ts.ScriptTarget.Latest,true)
const handlers=new Set(['failPreview','sendPreview','receive','checkPreview','reloadPreview'])
const code=ts.transpileModule(parsed.statements.filter(s=>ts.isFunctionDeclaration(s)&&handlers.has(s.name?.text)).map(s=>s.getText(parsed)).join('\n'),{compilerOptions:{target:ts.ScriptTarget.ES2022}}).outputText
function editor(){
 const timers=new Map(),messages=[],requests=[];let timerId=0,token=0
 const frame={postMessage:message=>messages.push(message)}
 const state={docs:{value:[{id:'home'}]},bodies:{value:{home:{title:'保留的輸入'}}},workspace:{value:{id:'home'}},previewReady:{value:false},previewResult:{value:null},initialToken:{value:''},previewError:{value:''},previewState:{value:''},fieldErrors:{value:[]},previewFrame:{value:{contentWindow:frame}},previewNeedsReload:false,previewRecoveryAttempts:0,sequence:0,previewTimer:undefined,location:{origin:'https://cms.example'},JSON,
  payload:()=>({action:'preview',documents:[{id:'home',revision:1,body:structuredClone(state.bodies.value.home)}]}),
  message:e=>e.message,
  api:async(path,options)=>{requests.push({path,options});return{previewToken:'snapshot-'+ ++token,documents:[]}},
  setTimeout:(fn,ms)=>{const id=++timerId;timers.set(id,{fn,ms});return id},clearTimeout:id=>timers.delete(id),
 }
 runInNewContext(code+'\nthis.check=checkPreview;this.fail=failPreview;this.receiveMessage=receive;',state)
 return{state,timers,messages,requests,frame}
}
const {state,timers,messages,requests,frame}=editor()
await state.check();const firstToken=state.initialToken.value
assert.equal(state.previewState.value,'正在載入官網畫面…');assert.equal(timers.size,1)
state.fail('官網畫面無法載入，請確認網路後重試。');assert.equal(timers.size,0)
await state.check()
assert.notEqual(state.initialToken.value,firstToken,'After a failed frame, new input must load a fresh snapshot instead of waiting for the old frame')
assert.equal(state.previewState.value,'正在載入官網畫面…');assert.equal(timers.size,1)
assert.equal(requests.at(-1).options.timeout,20000);assert.equal(requests.at(-1).options.retry,0)
state.previewReady.value=true;await state.check()
assert.equal(state.previewState.value,'正在更新效果…');assert.equal(messages.length,1)
state.receiveMessage({origin:state.location.origin,source:frame,data:{type:'sakura:applied',previewToken:'stale'}})
assert.equal(timers.size,1,'An old acknowledgement must not finish the current update')
state.receiveMessage({origin:state.location.origin,source:frame,data:{type:'sakura:applied',previewToken:state.previewResult.value.previewToken}})
assert.equal(timers.size,0);assert.equal(state.previewState.value,'目前輸入的效果・尚未更新官網')
const appliedToken=state.initialToken.value
state.fail('官網預覽沒有回應，請重新載入預覽。')
assert.equal(state.previewReady.value,false)
state.receiveMessage({origin:state.location.origin,source:frame,data:{type:'sakura:applied',previewToken:state.previewResult.value.previewToken}})
assert.match(state.previewError.value,/沒有回應/,'A late acknowledgement cannot clear a failed preview')
await state.check();assert.notEqual(state.initialToken.value,appliedToken)
state.api=async()=>{throw Object.assign(Error('request timeout'),{cause:{name:'TimeoutError'}})}
await state.check();assert.match(state.previewError.value,/超過 20 秒/);assert.equal(state.bodies.value.home.title,'保留的輸入')
const overlap=editor(),pending=[]
overlap.state.api=()=>new Promise(resolve=>pending.push(resolve))
const old=overlap.state.check(),latest=overlap.state.check()
pending[1]({previewToken:'latest',documents:[]});await latest
pending[0]({previewToken:'old',documents:[]});await old
assert.equal(overlap.state.initialToken.value,'latest','A late response must not replace the newest preview')
console.log('PASS: failed-frame recovery, bounded requests, fresh snapshots, current-token acknowledgement, retained inputs and stale-response isolation')
// Use the installed fetch client against a real silent server to verify cancellation.
const require=createRequire(import.meta.url),{$fetch}=await import(createRequire(require.resolve('nuxt/package.json')).resolve('ofetch'))
let attempts=0
const server=createServer(()=>{attempts++})
await new Promise(resolve=>server.listen(0,'127.0.0.1',resolve))
try{
 const stalled=editor(),started=Date.now()
 stalled.state.api=(path,options)=>$fetch(`http://127.0.0.1:${server.address().port}`,options)
 await stalled.state.check()
 assert.match(stalled.state.previewError.value,/超過 20 秒/);assert(Date.now()-started<25000);assert.equal(attempts,1)
 assert.equal(stalled.state.bodies.value.home.title,'保留的輸入')
 console.log('PASS: a silent HTTP server is aborted after 20 seconds, without retries or input loss')
}finally{server.closeAllConnections();await new Promise(resolve=>server.close(resolve))}
