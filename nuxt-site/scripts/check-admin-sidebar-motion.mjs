import assert from 'node:assert/strict'
import {readFile} from 'node:fs/promises'
import {runInNewContext} from 'node:vm'
import ts from 'typescript'

const source=await readFile(new URL('../composables/useCmsSidebarMotion.ts',import.meta.url),'utf8')
const code=ts.transpileModule(source.replace('export function','function').replaceAll('import.meta.client','true'),{compilerOptions:{target:ts.ScriptTarget.ES2022}}).outputText
function fixture(){
 let phase='before',reads=0,cleanup
 const hooks=new Map(),created=[],collapsed={value:false},reduced={value:false}
 const rect=(left,top=0)=>({left,top,width:300,height:80,bottom:top+80})
 const node=(id,from,to,children=[])=>({id,from:rect(from),to:rect(to),children,isConnected:true,
  contains(target){return this===target||children.some(child=>child.contains(target))},
  getBoundingClientRect(){reads++;return this[phase==='before'?'from':'to']},
  animate(frames,options){const animation={id,frames,options,cancelled:false,cancel(){this.cancelled=true}};created.push(animation);return animation}})
 const bar=node('savebar',220,76),heading=node('heading',244,100),columns=node('columns',244,100)
 const editor=node('editor',244,100,[heading,columns,bar]),page=node('page',244,100,[editor])
 const nav=node('nav-link',24,8),main={children:[page]}
 const root={value:{querySelector:selector=>selector==='.cms-savebar'?bar:main,querySelectorAll:()=>[nav]}}
 const context={window:{innerWidth:1440,innerHeight:960},useReducedMotion:()=>reduced,watch:(target,callback)=>hooks.set(target,callback),onBeforeUnmount:callback=>cleanup=callback,nextTick:async()=>{phase='after'}}
 runInNewContext(code+'\nthis.install=useCmsSidebarMotion;',context);context.install(collapsed,root)
 return{created,context,root,reduced,heading,columns,bar,change:()=>hooks.get(collapsed)(),reduce:()=>hooks.get(reduced)(true),cleanup:()=>cleanup(),before:()=>{phase='before'},get reads(){return reads}}
}
const f=fixture();await f.change()
assert.deepEqual(f.created.map(a=>a.id),['nav-link','heading','columns','savebar'])
assert.equal(f.created.find(a=>a.id==='savebar').frames[0].transform,'translate(144px,0px)')
for(const animation of f.created){assert.equal(animation.options.duration,240);assert.deepEqual(Object.keys(animation.frames[0]),['transform'])}
assert(!f.created.some(a=>['page','editor'].includes(a.id)),'Never transform the fixed action bar ancestors')
const first=f.created.slice();f.before();f.heading.from.left=170;f.heading.to.left=244;await f.change()
assert(first.every(a=>a.cancelled),'Interrupt the previous motion before reversing')
assert.equal(f.created.filter(a=>a.id==='heading').at(-1).frames[0].transform,'translate(-74px,0px)','Reverse from the current visual position')
f.reduced.value=true;f.reduce();assert(f.created.every(a=>a.cancelled))
const reads=f.reads;await f.change();assert.equal(f.reads,reads,'Reduced motion must skip measurements and animation')
const mobile=fixture();mobile.context.window.innerWidth=390;await mobile.change();assert.equal(mobile.created.length,0);assert.equal(mobile.reads,0)
const pending=fixture();let release
pending.context.nextTick=()=>new Promise(resolve=>release=resolve)
const running=pending.change();pending.cleanup();release();await running;assert.equal(pending.created.length,0,'Unmount must stop pending animation work')
const removed=fixture();removed.columns.isConnected=false;await removed.change();assert(!removed.created.some(a=>a.id==='columns'))
console.log('PASS: transform-only motion, aligned fixed actions, interrupted reversal, reduced motion, mobile, removed nodes and unmount cleanup')
