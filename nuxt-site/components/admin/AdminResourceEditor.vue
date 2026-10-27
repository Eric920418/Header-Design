<script setup lang="ts">
import {editingSchema,resourceGuide} from '~/shared/cms/presentation.mjs'
import {workspaceFor,workspaceDefaults,editorLink,cmsDate} from '~/shared/cms/workflow.mjs'
const props=defineProps<{id:string}>()
const route=useRoute(),router=useRouter(),{api,session,message}=useCmsAdmin()
const {data:names}=useNuxtData<any[]>('cms-workspaces')
const namedWorkspace=(id:string)=>{const w=workspaceFor(id);return names.value?.find(n=>n.id===w?.id)||workspaceDefaults.find((n:any)=>n.id===w?.id)}
const workspace=computed(()=>namedWorkspace(props.id))
const docs=ref<any[]>([]),bodies=ref<Record<string,any>>({}),baseline=ref(''),active=ref(''),error=ref(''),notice=ref(''),busy=ref(false),fieldErrors=ref<any[]>([])
const previewSize=ref({width:480,height:640}),previewFrame=ref<HTMLIFrameElement>(),previewReady=ref(false),previewResult=ref<any>(null),previewError=ref(''),previewState=ref('正在載入官網畫面…'),mobile=ref(false),display=ref('edit'),previewPath=ref(''),initialToken=ref(''),confirming=ref(false),confirmation=ref<any>(null)
const dirty=computed(()=>docs.value.length>0&&JSON.stringify(bodies.value)!==baseline.value)
const pending=computed(()=>docs.value.some(d=>d.draftId!==d.publishedId))
const title=computed(()=>workspace.value?.title||'修改內容')
const guide=computed(()=>resourceGuide(props.id))
const impacts=computed(()=>[...new Map((workspace.value?.ids||[]).flatMap((id:string)=>resourceGuide(id).impacts).map((i:any)=>[i.href+'|'+i.label,i])).values()] as any[])
const related=computed(()=>[...new Set((workspace.value?.ids||[]).flatMap((id:string)=>resourceGuide(id).related||[]))].filter(id=>!workspace.value?.ids.includes(id)))
const returnLink=computed(()=>{const {edit,part,returnPath,...query}=route.query;return{path:returnPath==='/admin/content'?returnPath:route.path,query}})
provide('cms-field-errors',fieldErrors)
let timer:ReturnType<typeof setTimeout>|undefined,sequence=0,previewTimer:ReturnType<typeof setTimeout>|undefined,previewNeedsReload=false,previewRecoveryAttempts=0
const activeDoc=computed(()=>docs.value.find(d=>d.id===active.value))
const activeSchema=computed(()=>activeDoc.value?editingSchema(activeDoc.value.schema,active.value):null)
const partTitle=(id:string)=>id.startsWith('view-')?'標題、圖片與按鈕':id==='data-kitchenStyles'?'系列卡片':namedWorkspace(id)?.purpose||'內容'
const status=computed(()=>dirty.value?'尚未儲存':pending.value?'已儲存，官網尚未更新':'官網已更新')
const choices=computed(()=>{const all:any[]=[];for(const d of docs.value){const b=bodies.value[d.id];if(!b)continue
 const items=d.id==='data-kitchenSeries'?b.KITCHEN_SERIES_PAGES:d.id==='data-storeCases'?b.storeCases:d.id==='custom-cases'||d.id==='knowledge-articles'||d.id==='news-articles'?b.items:[]
 for(const i of items||[]){const path=d.id==='news-articles'?`/news/${i.summary.category}/${i.slug}`:d.id==='knowledge-articles'?`/knowledge/design/${i.slug}`:d.id==='data-kitchenSeries'?`/home-style/${i.slug}`:d.id==='data-storeCases'?`/gallery/${i.slug}`:`/design-inspiration/${i.id}`;all.push({label:i.summary?.title||i.title||i.name||i.slug,path})}
 }return all})
const previewUrl=computed(()=>{const [path,anchor]=(previewPath.value||workspace.value?.href||'/').split('#');return`${path}${path.includes('?')?'&':'?'}cmsPreview=${encodeURIComponent(props.id)}${initialToken.value?'&cmsDraft='+encodeURIComponent(initialToken.value):''}${anchor?'#'+anchor:''}`})
function setPart(id:string){active.value=id;void router.replace({query:{...route.query,part:id===workspace.value?.id?undefined:id}})}
function payload(action:string){return{action,documents:docs.value.map(d=>({id:d.id,revision:d.revision,body:bodies.value[d.id]}))}}
async function load(){error.value='';docs.value=[];try{const loaded=await Promise.all((workspace.value?.ids||[props.id]).map((id:string)=>api('documents/'+id)));bodies.value=Object.fromEntries(loaded.map(d=>[d.id,d.body]));baseline.value=JSON.stringify(bodies.value);docs.value=loaded;active.value=loaded.some(d=>d.id===route.query.part)?String(route.query.part):loaded.some(d=>d.id===props.id)?props.id:loaded[0]?.id;void checkPreview()}catch(e){error.value=message(e)}}
const previewScale=computed(()=>Math.min(1,previewSize.value.width/(mobile.value?390:1440)))
const frameStyle=computed(()=>({width:(mobile.value?390:1440)+'px',height:previewSize.value.height/(previewScale.value||1)+'px',transform:`scale(${previewScale.value})`}))
let observer:ResizeObserver|undefined
watch(previewFrame,frame=>{observer?.disconnect();if(frame?.parentElement){observer=new ResizeObserver(([entry])=>{if(entry)previewSize.value={width:entry.contentRect.width,height:entry.contentRect.height}});observer.observe(frame.parentElement)}},{flush:'post'})
function failPreview(reason:string){clearTimeout(previewTimer);previewError.value=reason;previewState.value='目前輸入尚未套用，請重新載入預覽'}
function sendPreview(){if(!previewReady.value||!previewResult.value||previewNeedsReload)return;previewState.value='正在更新效果…';previewFrame.value?.contentWindow?.postMessage(JSON.parse(JSON.stringify({type:'sakura:preview',documents:previewResult.value.documents,previewToken:previewResult.value.previewToken})),location.origin);clearTimeout(previewTimer);previewTimer=setTimeout(()=>failPreview('官網預覽沒有回應，請重新載入預覽。'),20000)}
function receive(event:MessageEvent){if(event.origin!==location.origin||event.source!==previewFrame.value?.contentWindow)return
 if(event.data?.type==='sakura:ready'){previewReady.value=true;sendPreview()}
 if(event.data?.type==='sakura:applied'&&!previewNeedsReload&&event.data.previewToken===previewResult.value?.previewToken){clearTimeout(previewTimer);previewState.value='目前輸入的效果・尚未更新官網';previewError.value='';previewRecoveryAttempts=0}
 if(event.data?.type==='sakura:preview-error'&&!previewNeedsReload){
  failPreview(event.data.message||'官網預覽載入失敗。')
  if(event.data.statusCode===404&&event.data.previewExpired===true&&previewRecoveryAttempts<1){previewRecoveryAttempts++;void reloadPreview(false)}
 }
}
async function checkPreview(){if(!docs.value.length)return;const n=++sequence,snapshot=JSON.stringify(payload('preview'));previewState.value='正在檢查目前輸入…';try{const r=await api('workspaces/'+workspace.value?.id,{method:'POST',body:payload('preview')});if(n!==sequence||snapshot!==JSON.stringify(payload('preview')))return;fieldErrors.value=[];previewError.value='';previewResult.value=r;
 if(!initialToken.value||previewNeedsReload){previewNeedsReload=false;previewReady.value=false;initialToken.value=r.previewToken;previewState.value='正在載入官網畫面…';clearTimeout(previewTimer);previewTimer=setTimeout(()=>failPreview('官網畫面無法載入，請確認網路後重試。'),20000)}
 else sendPreview();return r}catch(e:any){if(n!==sequence)return;previewNeedsReload=false;fieldErrors.value=e.data?.data?.fieldErrors||[];failPreview(message(e))}}
watch(bodies,()=>{clearTimeout(timer);timer=setTimeout(()=>void checkPreview(),600)},{deep:true})
watch(()=>route.query.part,value=>{if(docs.value.length)active.value=docs.value.some(d=>d.id===value)?String(value):docs.value[0].id})
watch(previewUrl,()=>{previewReady.value=false;previewState.value='正在載入官網畫面…'})
async function save(action='save'){if(busy.value)return;busy.value=true;error.value='';notice.value='';try{const r=await api('workspaces/'+workspace.value?.id,{method:'POST',body:payload(action)});for(const d of r.documents){bodies.value[d.id]=d.body;const stored=docs.value.find(x=>x.id===d.id);Object.assign(stored,d)}baseline.value=JSON.stringify(bodies.value);notice.value=action==='publish'?'官網已更新。':action==='unpublish'?'已暫停在官網顯示。':'已儲存，官網尚未變更。';confirming.value=false;fieldErrors.value=[];await refreshNuxtData(['cms-workspaces','cms-documents','cms-overview']);return true}catch(e:any){error.value=message(e);fieldErrors.value=e.data?.data?.fieldErrors||[];if(fieldErrors.value[0]){active.value=fieldErrors.value[0].documentId;display.value='edit';await nextTick();document.querySelector<HTMLElement>('.cms-edit-form [aria-invalid=true]')?.focus()}return false}finally{busy.value=false}}
async function confirmPublish(){error.value='';const r=await checkPreview();if(r){confirmation.value=r;confirming.value=true}else error.value=previewError.value}
async function unpublish(){if(!window.confirm(`暫停「${title.value}」會影響列出的官網位置，確定繼續？`))return;await save('unpublish')}
async function restore(id:string,version:string){if(dirty.value){error.value='請先儲存目前修改，再選擇以前的內容。';return}if(!window.confirm('將這份內容另存為待確認內容；官網不會立即改變。確定繼續？'))return;busy.value=true;try{const d=docs.value.find(d=>d.id===id);await api('documents/'+id,{method:'POST',body:{action:'restore',revision:d.revision,version}});await load();notice.value='已取回以前的內容；確認後再更新官網。'}catch(e){error.value=message(e)}finally{busy.value=false}}
function reload(){if(!dirty.value||window.confirm('重新載入會捨棄尚未儲存內容，確定繼續？'))void load()}
watch(previewPath,()=>{if(previewResult.value)initialToken.value=previewResult.value.previewToken})
async function reloadPreview(manual=true){if(manual)previewRecoveryAttempts=0;previewNeedsReload=true;previewReady.value=false;clearTimeout(previewTimer);await checkPreview()}
function beforeUnload(e:BeforeUnloadEvent){if(dirty.value){e.preventDefault();e.returnValue=''}}
watch(()=>props.id,load,{immediate:true})
onMounted(()=>{window.addEventListener('beforeunload',beforeUnload);window.addEventListener('message',receive)})
onBeforeUnmount(()=>{observer?.disconnect();clearTimeout(timer);clearTimeout(previewTimer);window.removeEventListener('beforeunload',beforeUnload);window.removeEventListener('message',receive);sequence++})
onBeforeRouteLeave(()=>!dirty.value||window.confirm('還有尚未儲存的修改，確定離開？'))
onBeforeRouteUpdate((to,from)=>to.query.edit===from.query.edit||!dirty.value||window.confirm('還有尚未儲存的修改，確定切換？'))
</script>
<template>
 <section class="cms-work-editor" :aria-busy="busy">
  <div class="cms-editor-breadcrumb"><NuxtLink :to="returnLink">← {{ returnLink.path==='/admin/home'?'首頁區塊':'返回列表' }}</NuxtLink><span>›</span><span>{{ workspace?.sectionTitle||'首頁' }}</span><span>›</span><span>{{ title }}</span></div>
  <div class="cms-heading"><h1>{{ title }}</h1><a aria-label="查看官網位置" :href="workspace?.href||guide?.href" target="_blank" rel="noopener noreferrer" class="cms-button">查看官網位置 ↗</a></div>
  <p v-if="error" class="cms-error" role="alert">{{ error }} <button type="button" class="cms-button" @click="reload">查看最新內容</button></p>
  <p v-if="notice" class="cms-notice" role="status">{{ notice }}</p>
  <p v-if="!docs.length&&!error" role="status" class="cms-empty">正在載入內容…</p>
  <template v-if="docs.length">
   <div class="cms-editor-view-tabs"><button type="button" class="cms-button" :class="{'cms-button-gold':display==='edit'}" @click="display='edit'">修改內容</button><button type="button" class="cms-button" :class="{'cms-button-gold':display==='preview'}" @click="display='preview';checkPreview()">看效果</button></div>
   <div class="cms-edit-columns" :class="{'cms-show-preview':display==='preview'}">
    <fieldset :disabled="busy" class="cms-edit-form">
     <nav v-if="docs.length>1" class="cms-tabs cms-part-tabs" aria-label="這個區塊的內容"><button v-for="d in docs" :key="d.id" type="button" class="cms-button" :class="{'cms-button-gold':active===d.id}" @click="setPart(d.id)">{{ partTitle(d.id) }}</button></nav>
     <div v-if="activeDoc" class="cms-panel cms-resource-form"><AdminFields :key="active" v-model="bodies[active]" :schema="activeSchema" :document-id="active" path="" /><p class="cms-field-help">本區最近儲存：{{ cmsDate(activeDoc.updatedAt) }}</p></div>
     <details class="cms-panel cms-secondary"><summary>會影響哪些頁面（{{ impacts.length }}）</summary><ul><li v-for="i in impacts" :key="i.href+i.label"><a :href="i.href" target="_blank" rel="noopener noreferrer">{{ i.label }} ↗</a></li></ul></details>
     <details v-if="related.length" class="cms-panel cms-secondary"><summary>其他相關內容</summary><NuxtLink v-for="id in related" :key="id as string" :to="editorLink(id)" class="cms-button">{{ namedWorkspace(id as string)?.title||resourceGuide(id)?.location[0] }}</NuxtLink></details>
     <details class="cms-panel cms-secondary"><summary>過去的修改</summary><section v-for="d in docs" :key="d.id"><h3>{{ partTitle(d.id) }}</h3><div v-for="v in d.versions" :key="v.id" class="cms-history-row"><span>{{ cmsDate(v.createdAt) }} · {{ v.actor||'初始內容' }}</span><button v-if="session?.role==='admin'" class="cms-button" :disabled="busy||dirty" @click="restore(d.id,v.id)">取回這份內容</button></div></section></details>
    </fieldset>
    <aside class="cms-effect-panel cms-panel" aria-label="官網效果"><div class="cms-effect-toolbar"><strong>官網效果</strong><button type="button" class="cms-button" @click="mobile=!mobile">{{ mobile?'看桌機':'看手機' }}</button><button type="button" class="cms-button" @click="reloadPreview()">重新載入</button></div><select v-if="choices.length" v-model="previewPath" aria-label="選擇預覽頁面"><option value="">列表頁面</option><option v-for="p in choices" :key="p.path" :value="p.path">{{ p.label }}</option></select><p class="cms-field-help" role="status">{{ previewState }}</p><p v-if="previewError" class="cms-error" role="alert">{{ previewError }}</p><div class="cms-effect-viewport" :class="{'cms-effect-mobile':mobile}"><iframe v-if="previewResult" :key="initialToken" ref="previewFrame" :style="frameStyle" :src="previewUrl" title="目前輸入的官網效果" @error="failPreview('預覽載入失敗，請重試。')" /></div></aside>
   </div>
   <footer class="cms-savebar" aria-label="目前內容操作"><span class="cms-save-status" role="status">{{ status }}</span><div class="cms-actions"><details v-if="session?.role==='admin'" class="cms-more-actions"><summary class="cms-button">更多操作</summary><div><button class="cms-button" :disabled="busy||dirty||!docs.some(d=>d.publishedId)" @click="unpublish">暫停官網顯示</button></div></details><button class="cms-button" :disabled="busy" @click="display='preview';checkPreview()">看效果</button><button class="cms-button" :class="{'cms-button-gold':dirty||session?.role!=='admin'}" :disabled="busy||!dirty" @click="save()">{{ busy?'處理中…':'儲存' }}</button><button v-if="session?.role==='admin'" class="cms-button" :class="{'cms-button-gold':!dirty}" :disabled="busy||(!dirty&&!pending)" @click="confirmPublish">更新官網</button></div></footer>
  </template>
  <AdminDialog :open="confirming" title="確認要更新到官網的內容" @close="confirming=false"><p>以下包含本區其他已儲存、尚未更新到官網的修改：</p><section v-for="d in confirmation?.documents||[]" :key="d.id"><h3>{{ namedWorkspace(d.id)?.title }} · {{ partTitle(d.id) }}</h3><ul v-if="d.changes.length"><li v-for="(c,i) in d.changes" :key="i">{{ c }}</li></ul><p v-else class="cms-muted">沒有新的修改</p></section><details open><summary>會更新的位置</summary><ul><li v-for="i in impacts" :key="i.href+i.label">{{ i.label }}</li></ul></details><p v-if="error" class="cms-error" role="alert">{{ error }}</p><div class="cms-actions"><button class="cms-button" :disabled="busy" @click="confirming=false">返回修改</button><button class="cms-button cms-button-gold" :disabled="busy" @click="save('publish')">{{ busy?'正在更新…':'確認更新官網' }}</button></div></AdminDialog>
 </section>
</template>
