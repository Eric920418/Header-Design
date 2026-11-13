import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import ts from 'typescript'
import {ref} from 'vue'

const source=readFileSync(new URL('../components/internal/BrandVideo.vue',import.meta.url),'utf8')
const script=source.match(/<script setup lang="ts">([\s\S]*?)<\/script>/)[1]
const code=ts.transpileModule(script.replace(/^import .*$/gm,'').replaceAll('import.meta.client','true'),{compilerOptions:{target:ts.ScriptTarget.ES2022,module:ts.ModuleKind.ESNext}}).outputText
const run=new (async()=>{}).constructor('useCmsResource','withDefaults','defineProps','ref','onMounted','onBeforeUnmount','setTimeout','clearTimeout',code+'\nreturn {state,nativeVideo,playbackError,play,loaded,failed,nativeFailed}')
async function player(props){
  let mounted,unmounted,timeout,cleared=0
  const instance=await run(async()=>({brandVideoId:'wH374AF9wLI'}),(_props,defaults)=>({...defaults,...props}),()=>props,ref,fn=>{mounted=fn},fn=>{unmounted=fn},fn=>{timeout=fn;return 1},()=>{cleared++})
  return {...instance,mount:()=>mounted(),unmount:()=>unmounted(),expire:()=>timeout(),cleared:()=>cleared}
}
const native=await player({src:'/section-3/service-process/video/service-guide-2027-20261027.mp4'})
let plays=0,pauses=0,loads=0
const video={error:null,play(){plays++;return Promise.resolve()},pause(){pauses++},load(){loads++;this.error=null}}
native.nativeVideo.value=video
assert.equal(native.state.value,'idle');assert.equal(plays,0)
native.play();assert.equal(plays,1,'必須在點擊處理期間呼叫 play，以保留 Safari 使用者手勢')
assert.equal(native.state.value,'loading');native.loaded();assert.equal(native.state.value,'playing');assert(native.cleared()>0)
video.error={code:4,message:'Unsupported media'};native.nativeFailed()
assert.equal(native.state.value,'error');assert.match(native.playbackError.value,/4.*Unsupported media/);assert.equal(pauses,1)
native.play();assert.equal(loads,1);assert.equal(plays,2);assert.equal(native.playbackError.value,'')
native.expire();assert.equal(native.state.value,'error')
video.play=()=>Promise.reject(new Error('Playback blocked'))
native.play();await Promise.resolve();assert.equal(native.state.value,'error');assert.equal(native.playbackError.value,'Playback blocked')
native.unmount();assert(native.cleared()>1)
const youtube=await player({autoplay:true});assert.equal(youtube.state.value,'loading');youtube.mount();youtube.loaded();assert.equal(youtube.state.value,'playing');youtube.play();youtube.expire();assert.equal(youtube.state.value,'error');youtube.unmount()
console.log('PASS 點擊前不播放、同步使用者手勢、成功／錯誤／重試／逾時、清理及既有 YouTube 流程')
