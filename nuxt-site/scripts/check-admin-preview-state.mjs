import assert from 'node:assert/strict'
import {readFile} from 'node:fs/promises'
import {runInNewContext} from 'node:vm'
import {createRequire} from 'node:module'
import {createServer} from 'node:http'
import ts from 'typescript'
import {ref,computed,watch,nextTick} from 'vue'
import {contentAliases,publicContent} from '../shared/cms/public-content.mjs'

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
const initial=editor();let initialChecks=0
Object.assign(initial.state,{docs:ref([]),bodies:ref({}),baseline:ref(''),active:ref(''),error:ref(''),props:{id:'home'},route:{query:{}},watch,timer:undefined})
initial.state.dirty=computed(()=>JSON.stringify(initial.state.bodies.value)!==initial.state.baseline.value)
initial.state.api=async()=>({id:'home',body:{title:'初始文字'}})
initial.state.checkPreview=()=>{initialChecks++}
const load=parsed.statements.find(s=>ts.isFunctionDeclaration(s)&&s.name?.text==='load').getText(parsed)
const bodyWatcher=parsed.statements.find(s=>ts.isExpressionStatement(s)&&s.getText(parsed).startsWith('watch(bodies,')).getText(parsed)
runInNewContext(ts.transpileModule(load+'\n'+bodyWatcher+'\nthis.loadBody=load;',{compilerOptions:{target:ts.ScriptTarget.ES2022}}).outputText,initial.state)
await initial.state.loadBody();await nextTick()
for(const [id,timer]of initial.timers){initial.timers.delete(id);timer.fn()}
assert.equal(initialChecks,1,'Initial document loading must not start a second preview that interrupts the first iframe')
console.log('PASS: one initial preview check instead of two')

const resourceSource=await readFile(new URL('../composables/useCmsResource.ts',import.meta.url),'utf8')
function resources(preview=true,client=true){
 const states=new Map(),route={query:preview?{cmsPreview:'home',cmsDraft:'first'}:{}},requests=[]
 const context={contentAliases,publicContent,useRoute:()=>route,useState:(key,init)=>{if(!states.has(key))states.set(key,ref(init()));return states.get(key)},
  useAsyncData:async(key,fetch)=>({data:ref(await fetch()),error:ref(null)}),useNuxtApp:()=>({isHydrating:false,payload:{data:{}}}),
  useRequestFetch:()=>async path=>{requests.push(path);return{title:'官網原有文字'}},createError:options=>Object.assign(Error(options.message),options)}
 const code=ts.transpileModule(resourceSource.replace(/^import .*\n/,'').replace('export async function','async function').replaceAll('import.meta.client',String(client)),{compilerOptions:{target:ts.ScriptTarget.ES2022}}).outputText
 runInNewContext(code+'\nthis.read=useCmsResource;',context)
 return{context,route,states,requests}
}
const cached=resources()
await cached.context.read('site-visuals',{});cached.route.query.cmsDraft='next';await cached.context.read('site-visuals',{})
assert.equal(cached.requests.length,1,'Unedited preview resources must not be fetched again on every text change')
cached.states.get('cms-unsaved-preview').value['site-visuals']={title:'目前修改的文字'}
assert.equal((await cached.context.read('site-visuals',{})).title,'目前修改的文字');assert.equal(cached.requests.length,1)
for(const fixture of [resources(false),resources(true,false)]){await fixture.context.read('site-visuals',{});await fixture.context.read('site-visuals',{});assert.equal(fixture.requests.length,2,'Published requests and server renders must remain fresh')}
const fresh=resources();await fresh.context.read('site-visuals',{});assert.equal(fresh.requests.length,1,'A new preview must load a fresh baseline')
console.log('PASS: unedited preview resources are reused; current input wins; fresh previews, SSR and the published site still fetch current data')
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
