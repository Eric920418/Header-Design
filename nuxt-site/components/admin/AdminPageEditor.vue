<script setup lang="ts">
import {valueAt,withValue,pageFieldValue,inspirationSharedGroups} from '~/shared/cms/page-editors.mjs'
import {cmsDate} from '~/shared/cms/workflow.mjs'
import {imageReadingHelp,resourceGuide} from '~/shared/cms/presentation.mjs'
import {pageChanges,changeImpacts,blockImpacts,pageMedia,hasPageChanges,itemPublication} from '~/shared/cms/changes.mjs'
import {workbenchBlocks,pagePositionContent,itemWebsitePath} from '~/shared/cms/workbench.mjs'
import {Info} from 'lucide-vue-next'
const props=defineProps<{id:string}>()
const route=useRoute(),router=useRouter(),{api,session,message}=useCmsAdmin()
const {data:namedPages}=useNuxtData<any[]>('cms-pages')
const pageData=ref<any>(),docs=ref<any[]>([]),bodies=ref<Record<string,any>>({}),baseline=ref<Record<string,any>>({}),error=ref(''),notice=ref(''),busy=ref(false),fieldErrors=ref<any[]>([]),selections=ref<Record<string,string>>({}),locationOpen=ref(false),positionOpen=ref(false),focusedField=ref(''),formRoot=ref<HTMLElement>()
provide('cms-field-errors',fieldErrors);provide('cms-item-selections',selections)
const blocks=computed<any[]>(()=>{const named=namedPages.value?.find(p=>p.id===props.id);return workbenchBlocks(props.id,(pageData.value?.blocks||[]).map((b:any)=>({...b,name:named?.blocks.find((n:any)=>n.id===b.id)?.name||b.name})))})
provide('cms-select-block',(name:string)=>{const block=blocks.value.find(b=>b.name===name||b.aliases.some((a:string)=>a.split(':').at(-1)===name));if(block)void selectBlock(block.id)})
const active=computed(()=>blocks.value.find(b=>b.aliases.includes(route.query.block))||blocks.value[0])
const workbench={focused:ref(''),editing:ref(''),selection:ref<any>(null),rows:ref<Record<string,any>>({}),baseline,documents:docs,metadata:computed(()=>pageData.value?.rowPresentation||{}),busy,returnFocus:()=>{},position:()=>{positionOpen.value=true},select:(edit:boolean)=>{positionOpen.value=!edit&&window.innerWidth<1024}}
provide('cms-workbench',workbench)
const focusedGroup=ref('')
const sharedInspiration=computed(()=>active.value?.id==='inspiration:頁面共用設定')
const positionBlock=computed(()=>{
 const block=active.value
 const detail=pageData.value?.positionPresentation?.detailCase?.route
 if(block?.preview==='inspiration-breadcrumb'&&focusedGroup.value==='breadcrumb-detail'&&detail)
  return {...block,previewPage:detail+'#design-inspiration-breadcrumb'}
 if(!sharedInspiration.value)return block
 const previous=typeof route.query.block==='string'?route.query.block.split(':').at(-1):''
 const legacyGroup=previous==='整頁共用文字'?'案例內頁文字':previous
 const selectedGroup=focusedGroup.value||legacyGroup
 if(selectedGroup==='顯示與搜尋設定')return {...block,preview:'inspiration-page',href:'/design-inspiration'}
 const target=inspirationSharedGroups[selectedGroup as keyof typeof inspirationSharedGroups]
 if(!target)return block
 return {...block,preview:target.preview,href:target.anchor?'/design-inspiration#'+target.anchor:detail||block.href}
})
watch(()=>route.query.block,()=>{focusedGroup.value=''})

provide('cms-media-context',computed(()=>pageMedia(docs.value,bodies.value,blocks.value)))
const collections=computed(()=>active.value?.fields.filter((f:any)=>f.schema.type==='array')||[])
const caseManagement=computed(()=>active.value?.preview==='inspiration-cases')
const commonFields=computed(()=>active.value?.fields.filter((f:any)=>f.schema.type!=='array'&&!f.schema.advanced)||[])
const inspirationFormGroups=computed(()=>Object.entries(inspirationSharedGroups).map(([title,group])=>({
 title,help:'help' in group?group.help:'',fields:commonFields.value.filter((f:any)=>f.formGroup===title),
})).filter(group=>group.fields.length))
const settingGroups=computed(()=>{
 const groups=new Map<string,{title:string;readingGroup?:string;imageReading?:boolean;formGroup?:string;fields:any[]}>()
 for(const field of active.value?.fields||[]){
  if(!field.schema.advanced)continue
  const {readingGroup,imageReading}=field.schema
  const key=readingGroup||field.documentId+':'+field.path
  if(!groups.has(key))groups.set(key,{title:imageReading?'圖片朗讀設定':readingGroup?readingGroup+'的朗讀文字':field.schema.disclosureTitle||field.label,readingGroup,imageReading,formGroup:field.formGroup,fields:[]})
  groups.get(key)!.fields.push(field)
 }
 return Array.from(groups.values())
})
const positionPresentation=computed(()=>({...pageData.value?.positionPresentation,rows:pageData.value?.rowPresentation}))
function blockPicture(block:any){return pagePositionContent(block,bodies.value,positionPresentation.value).thumbnail}

function trackField(event:FocusEvent){
 const target=event.target as HTMLElement
 focusedField.value=target.closest('[data-cms-path]')?.getAttribute('data-cms-path')||''
 const group=target.closest<HTMLElement>('[data-inspiration-group]')?.dataset.inspirationGroup
 if(group)focusedGroup.value=group
 if(active.value?.preview==='inspiration-breadcrumb'&&focusedField.value.startsWith('copy.breadcrumb'))
  focusedGroup.value=focusedField.value==='copy.breadcrumbDetail'?'breadcrumb-detail':''
}
watch(()=>active.value?.id,()=>{workbench.focused.value='';workbench.editing.value='';workbench.selection.value=null;focusedField.value=''},{flush:'sync'})
function closeItem(){workbench.editing.value='';workbench.returnFocus()}
function preparePreview(){previewPath.value=props.id==='home'||locationHref.value===active.value?.href?'':locationHref.value;showPreview()}
const title=computed(()=>namedPages.value?.find(p=>p.id===props.id)?.title||pageData.value?.title||(props.id==='home'?'首頁':'修改頁面'))
const modified=computed(()=>blocks.value.filter(b=>b.fields.some((f:any)=>JSON.stringify(pageFieldValue(bodies.value,f))!==JSON.stringify(pageFieldValue(baseline.value,f)))))
const dirty=computed(()=>modified.value.length>0),pending=computed(()=>hasPageChanges(blocks.value,Object.fromEntries(docs.value.map(d=>[d.id,d.publishedBody])),baseline.value))
const impactContext=computed(()=>({heroTitlePages:pageData.value?.positionPresentation?.heroTitlePages,caseDetailRoute:pageData.value?.positionPresentation?.detailCase?.route}))
const changeDetails=computed(()=>pageChanges(blocks.value,docs.value,baseline.value,bodies.value,impactContext.value)),changesOpen=ref(false)
const status=computed(()=>dirty.value?`尚未儲存 · ${changeDetails.value.length} 處修改`:pending.value?'已儲存，官網尚未更新':'官網已更新')
const shared=computed(()=>changeImpacts(changeDetails.value).filter(i=>i.href.split('#')[0]!==pageData.value?.href.split('#')[0]||/全站|所有官網頁面/.test(i.label)))
const returnLink=computed(()=>{const {sitePage,block,edit,part,legacy,field,item,list,create,returnPath,returnSection,...query}=route.query;if(typeof returnSection==='string')query.section=returnSection;return{path:returnPath==='/admin/content'?'/admin/content':props.id==='home'?'/admin':'/admin/content',query}})
const activeDocs=computed(()=>docs.value.filter(d=>active.value?.fields.some((f:any)=>f.documentId===d.id)))
const impacts=computed(()=>{
 if(!pending.value)return blockImpacts(active.value,changeDetails.value,impactContext.value)
 const published=Object.fromEntries(activeDocs.value.map(d=>[d.id,d.publishedBody??d.body]))
 const changes=pageChanges(blocks.value,activeDocs.value,published,bodies.value,impactContext.value)
 return blockImpacts(active.value,changes,impactContext.value)
})
const payload=(action:string)=>({action,documents:docs.value.map(d=>({id:d.id,revision:d.revision,body:bodies.value[d.id]}))})
async function selectBlock(id:string){locationOpen.value=false;await router.replace({query:{...route.query,block:id,legacy:undefined,field:undefined,list:undefined,item:undefined}});await nextTick();formRoot.value?.querySelector<HTMLElement>('.cms-block-title')?.focus({preventScroll:true})}
function update(f:any,value:any){bodies.value={...bodies.value,[f.documentId]:withValue(bodies.value[f.documentId],f.path,value)}}
async function load(){error.value='';try{const result=await api('page-editors/'+props.id,{timeout:20000,retry:0});if(!Array.isArray(result?.documents)||!Array.isArray(result?.blocks))throw Error('伺服器未回傳完整頁面內容，請確認連線後重試。');workbench.rows.value={};pageData.value=result;docs.value=result.documents;bodies.value=Object.fromEntries(result.documents.map((d:any)=>[d.id,d.body]));baseline.value=JSON.parse(JSON.stringify(bodies.value));if(route.query.legacy){const b=result.blocks.find((b:any)=>b.fields.some((f:any)=>f.documentId===route.query.legacy));if(b)await router.replace({query:{...route.query,block:b.id,legacy:undefined}})}}catch(e){error.value=message(e)}}
async function focusError(){const issue=fieldErrors.value[0];if(!issue)return;const block=blocks.value.find(b=>b.fields.some((f:any)=>f.documentId===issue.documentId&&(issue.path===f.path||issue.path.startsWith(f.path+'.'))));if(block)await selectBlock(block.id);await nextTick();await nextTick();const input=formRoot.value?.querySelector<HTMLElement>('[aria-invalid=true]');for(let p=input?.parentElement;p;p=p.parentElement)if(p instanceof HTMLDetailsElement)p.open=true;input?.focus()}
function reload(){if(!dirty.value||window.confirm('重新載入會捨棄本頁尚未儲存的修改，確定繼續？'))void load()}

const previewOpen=ref(false),previewReady=ref(false),previewResult=ref<any>(null),previewError=ref(''),previewState=ref(''),mobile=ref(false),previewPath=ref(''),initialToken=ref(''),previewFrame=ref<HTMLIFrameElement>(),previewSize=ref({width:480,height:640})
let timer:ReturnType<typeof setTimeout>|undefined,previewTimer:ReturnType<typeof setTimeout>|undefined,sequence=0,needsReload=false,recovery=0,controller:AbortController|undefined,observer:ResizeObserver|undefined
const previewScale=computed(()=>Math.min(1,previewSize.value.width/(mobile.value?390:1440)))
const frameStyle=computed(()=>({width:(mobile.value?390:1440)+'px',height:previewSize.value.height/(previewScale.value||1)+'px',transform:`scale(${previewScale.value})`}))
const previewUrl=computed(()=>{const [path,anchor]=(previewPath.value||active.value?.href||pageData.value?.href||'/').split('#'),slide=props.id==='home'&&active.value?.id==='home:主視覺輪播'?`&cmsSlide=${workbench.selection.value?.index||0}`:'';return`${path}${path.includes('?')?'&':'?'}cmsPreview=page:${encodeURIComponent(props.id)}&cmsDraft=${encodeURIComponent(initialToken.value)}${slide}${anchor?'#'+anchor:''}`})
const choices=computed(()=>docs.value.flatMap(d=>{
 const b=bodies.value[d.id],items=d.id==='data-kitchenSeries'?b?.KITCHEN_SERIES_PAGES:d.id==='data-storeCases'?b?.storeCases:['custom-cases','knowledge-articles','news-articles'].includes(d.id)?b?.items:[]
 return(items||[]).filter((i:any)=>i.enabled!==false&&(!pageData.value?.category||i.summary?.category===pageData.value.category)).map((i:any)=>({label:i.summary?.title||i.title||i.name||i.slug,path:itemWebsitePath(d.id,i)}))
}))
const locationHref=computed(()=>{const selected=workbench.selection.value,item=selected?.value;if(item?.enabled===false||item?.available===false)return pageData.value?.href||'/';return positionBlock.value?.previewPage||(props.id==='home'?'':selected?.href||itemWebsitePath(selected?.documentId,item))||positionBlock.value?.href||pageData.value?.href||'/'})
const publicLocation=computed(()=>{
 const selected=workbench.selection.value
 if(props.id!=='home'&&selected&&(itemWebsitePath(selected.documentId,selected.value)||selected.href)){
  const published=itemPublication(docs.value.find(d=>d.id===selected.documentId),selected.path,selected.value,selected.index)
  return published.visible?itemWebsitePath(selected.documentId,published.item)||selected.href:''
 }
 return activeDocs.value.length&&activeDocs.value.every(d=>d.publishedBody)?positionBlock.value?.previewPage||positionBlock.value?.href||pageData.value?.href||'/':''
})
watch(previewFrame,frame=>{observer?.disconnect();if(frame?.parentElement){observer=new ResizeObserver(([entry])=>{if(entry)previewSize.value={width:entry.contentRect.width,height:entry.contentRect.height}});observer.observe(frame.parentElement)}},{flush:'post'})
function failPreview(reason:string){clearTimeout(previewTimer);previewReady.value=false;needsReload=true;previewError.value=reason;previewState.value='目前輸入尚未套用，可重試或返回修改'}
function sendPreview(){if(!previewOpen.value||!previewReady.value||!previewResult.value||needsReload)return;previewState.value='正在更新效果…';previewFrame.value?.contentWindow?.postMessage(JSON.parse(JSON.stringify({type:'sakura:preview',documents:previewResult.value.documents,previewToken:previewResult.value.previewToken})),location.origin);clearTimeout(previewTimer);previewTimer=setTimeout(()=>failPreview('官網預覽沒有回應，請重新載入；目前輸入仍保留。'),20000)}
function receive(event:MessageEvent){if(!previewOpen.value||event.origin!==location.origin||event.source!==previewFrame.value?.contentWindow)return
 if(event.data?.type==='sakura:ready'){previewReady.value=true;if(previewResult.value?.documents.length!==docs.value.length||!previewResult.value.documents.every((d:any)=>JSON.stringify(d.body)===JSON.stringify(bodies.value[d.id])))return;needsReload=false;sendPreview()}
 if(event.data?.type==='sakura:applied'&&!needsReload&&event.data.previewToken===previewResult.value?.previewToken){clearTimeout(previewTimer);previewState.value='目前輸入的效果・尚未更新官網';previewError.value='';recovery=0}
 if(event.data?.type==='sakura:preview-error'&&!needsReload){failPreview(event.data.message||'預覽載入失敗。');if(event.data.statusCode===404&&event.data.previewExpired&&recovery<1){recovery++;void reloadPreview(false)}}
}
async function checkPreview(show=previewOpen.value){
 if(!docs.value.length)return
 controller?.abort();controller=new AbortController();const n=++sequence,snapshot=JSON.stringify(payload('preview'));if(show)previewState.value='正在準備目前輸入…'
 try{const r=await api('page-editors/'+props.id,{method:'POST',body:payload('preview'),timeout:20000,retry:0,signal:controller.signal});if(n!==sequence||snapshot!==JSON.stringify(payload('preview')))return;if(!Array.isArray(r?.documents)||typeof r?.previewToken!=='string')throw Error('官網效果未收到完整回應，請確認連線後重試；目前輸入仍保留。');fieldErrors.value=[];if(show&&previewOpen.value){previewResult.value=r;previewError.value='';if(!initialToken.value||needsReload||!previewReady.value){needsReload=false;previewReady.value=false;initialToken.value=r.previewToken;previewState.value='正在載入官網畫面…';clearTimeout(previewTimer);previewTimer=setTimeout(()=>failPreview('官網畫面載入超過 20 秒，請重試；你仍可繼續修改。'),20000)}else sendPreview()}return r}catch(e:any){if(n!==sequence)return;fieldErrors.value=e.data?.data?.fieldErrors||[];if(show)failPreview(message(e));else error.value=message(e);await focusError()}
}
function showPreview(){mobile.value=window.innerWidth<768;previewOpen.value=true;void checkPreview(true);nextTick(()=>document.querySelector<HTMLElement>('.cms-effect-panel')?.scrollIntoView({block:'nearest'}))}
function closePreview(){previewOpen.value=false;sequence++;controller?.abort();clearTimeout(timer);clearTimeout(previewTimer);observer?.disconnect();previewReady.value=false;previewResult.value=null;initialToken.value='';previewError.value='';nextTick(()=>document.querySelector<HTMLElement>('.cms-savebar .cms-preview-button')?.focus())}
async function reloadPreview(manual=true){if(manual)recovery=0;needsReload=true;previewReady.value=false;await checkPreview(true)}
watch(bodies,()=>{if(!previewOpen.value)return;clearTimeout(timer);timer=setTimeout(()=>void checkPreview(true),400)},{deep:true})
watch(previewPath,()=>{if(previewResult.value){needsReload=true;void checkPreview(true)}})

const confirming=ref(false),confirmMode=ref('publish'),confirmation=ref<any>(),validating=ref(false)
async function save(action='save'){
 if(busy.value)return;busy.value=true;error.value='';notice.value=''
 try{const r=await api('page-editors/'+props.id,{method:'POST',body:payload(action),timeout:20000,retry:0});if(!Array.isArray(r?.documents)||r.documents.length!==docs.value.length||new Set(r.documents.map((d:any)=>d.id)).size!==docs.value.length||r.documents.some((d:any)=>!docs.value.some(x=>x.id===d.id)||!Number.isSafeInteger(d.revision)||!d.body||typeof d.body!=='object'||Array.isArray(d.body)))throw Error('伺服器未回傳完整儲存結果，請確認連線後重試；目前輸入仍保留。');for(const d of r.documents){bodies.value[d.id]=d.body;const saved=docs.value.find(x=>x.id===d.id);Object.assign(saved,d);if(action==='publish')saved.publishedBody=JSON.parse(JSON.stringify(d.body));if(action==='unpublish')saved.publishedBody=null}baseline.value=JSON.parse(JSON.stringify(bodies.value));for(const [scope,state]of Object.entries(workbench.rows.value)){const [id,...parts]=scope.split(':');const rows=valueAt(baseline.value[id],parts.join(':'))||[];state.saved=Object.fromEntries(state.order.map((key:string,i:number)=>[key,JSON.parse(JSON.stringify(rows[i]??null))]))}confirming.value=false;fieldErrors.value=[];notice.value=action==='publish'?'官網已更新。':action==='unpublish'?'已暫停本頁內容的官網顯示。':pending.value?'本頁修改已儲存，官網尚未更新。':'本頁內容已儲存，與官網相同。';await refreshNuxtData(['cms-pages','cms-workspaces','cms-documents','cms-overview']);return true}catch(e:any){confirming.value=false;error.value=message(e);fieldErrors.value=e.data?.data?.fieldErrors||[];await focusError();return false}finally{busy.value=false}
}
async function requestSave(){if(!shared.value.length)return save();confirmMode.value='save';confirmation.value={current:changeDetails.value,saved:[],impacts:shared.value};confirming.value=true}
async function confirmPublish(){if(validating.value||busy.value)return;clearTimeout(timer);error.value='';validating.value=true;confirmMode.value='publish';try{const r=await checkPreview(false);if(r){confirmation.value=r.review;confirming.value=true}}finally{validating.value=false}}
function unpublish(){
 confirmMode.value='unpublish'
 confirmation.value={impacts:changeImpacts(docs.value.filter(d=>d.publishedId).map(d=>({documentId:d.id,path:''})),impactContext.value)}
 confirming.value=true
}
async function restore(d:any,version:string){if(dirty.value){error.value='請先儲存本頁修改，再取回以前的內容。';return}if(!window.confirm('這會將同份資料的完整舊版另存為草稿，可能包含其他區塊；官網不會立即改變。確定繼續？'))return;busy.value=true;try{await api('documents/'+d.id,{method:'POST',body:{action:'restore',revision:d.revision,version}});await load();notice.value='已取回以前的內容，確認後再更新官網。'}catch(e){error.value=message(e)}finally{busy.value=false}}
function beforeUnload(e:BeforeUnloadEvent){if(dirty.value){e.preventDefault();e.returnValue=''}}
watch(()=>props.id,load,{immediate:true})
onMounted(()=>{window.addEventListener('beforeunload',beforeUnload);window.addEventListener('message',receive)})
onBeforeUnmount(()=>{sequence++;controller?.abort();observer?.disconnect();clearTimeout(timer);clearTimeout(previewTimer);window.removeEventListener('beforeunload',beforeUnload);window.removeEventListener('message',receive)})
onBeforeRouteLeave(()=>!dirty.value||window.confirm('本頁還有尚未儲存的修改，確定離開？'))
onBeforeRouteUpdate((to,from)=>to.query.sitePage===from.query.sitePage||!dirty.value||window.confirm('本頁還有尚未儲存的修改，確定離開？'))
</script>
<template><section ref="formRoot" class="cms-page-editor cms-work-editor cms-workbench cms-position-workbench" :class="{'cms-is-editing':!!workbench.editing.value,'cms-text-editing':!collections.length,'cms-inspiration-workbench':id==='inspiration','cms-home-workbench':id==='home'}" :aria-busy="busy" @focusin="trackField">
 <header class="cms-page-editor-heading"><div class="cms-title-group"><NuxtLink :to="returnLink" class="cms-editor-breadcrumb">← 返回</NuxtLink><h1>{{ title }}<span>｜{{ id==='inspiration'?active?.name:'內容管理' }}</span></h1></div><AdminContentSearch /><a v-if="publicLocation" :href="publicLocation" target="_blank" rel="noopener noreferrer" class="cms-button">查看官網 ↗</a><button v-else type="button" class="cms-button" @click="preparePreview">預覽草稿</button></header>
 <p v-if="error" class="cms-error" role="alert">{{ error }} <button type="button" class="cms-button" @click="reload">查看最新內容</button></p><p v-if="notice" class="cms-notice" role="status">{{ notice }}</p><p v-if="!pageData&&!error" class="cms-empty" role="status">正在載入頁面內容…</p>
 <template v-if="pageData">
 <button type="button" class="cms-button cms-location-toggle" :aria-expanded="locationOpen" @click="locationOpen=true">選擇區塊：{{ active?.name }} ▾</button>
 <div class="cms-page-edit-layout">
  <nav class="cms-block-nav cms-panel" aria-label="官網區塊"><h2>選擇{{ title==='首頁'?'首頁':'官網' }}區塊</h2><button v-for="b in blocks.filter(b=>!b.secondary)" :key="b.id" type="button" :aria-current="active?.id===b.id?'location':undefined" @click="selectBlock(b.id)"><AdminThumbnail :src="blockPicture(b)" :alt="b.name+'區塊縮圖'" /><span><strong>{{ b.name }}</strong><small>{{ b.hint }}</small></span><i v-if="modified.some(m=>m.id===b.id)" aria-label="尚未儲存">●</i></button><details v-if="blocks.some(b=>b.secondary)"><summary>其他設定</summary><button v-for="b in blocks.filter(b=>b.secondary)" :key="b.id" type="button" @click="selectBlock(b.id)"><AdminThumbnail :src="blockPicture(b)" :alt="b.name+'區塊縮圖'" /><span>{{ b.name }}</span></button></details></nav>
  <div class="cms-page-form cms-panel">
   <div class="cms-block-heading"><div><h2 class="cms-block-title" tabindex="-1">{{ caseManagement?'自行建置案例':active?.name }}</h2><p v-if="!caseManagement" class="cms-field-help">{{ active?.hint }}<template v-if="collections.length">；選內容看位置，按「編輯」修改。</template></p></div><button type="button" class="cms-button cms-position-toggle" @click="positionOpen=true">看位置</button></div>
   <p v-if="caseManagement" class="cms-case-scope"><Info :size="16" aria-hidden="true" /><span>這裡管理自行新增的案例。串接案例由原系統管理。門市案例請至<NuxtLink to="/admin/content?section=service&sitePage=stores">門市與服務</NuxtLink>修改。</span></p>
   <fieldset :disabled="busy" class="cms-edit-form cms-collection-fields"><template v-for="f in collections" :key="f.documentId+':'+f.path"><div class="cms-block-field"><AdminFields :model-value="pageFieldValue(bodies,f)" :schema="f.schema" :label="f.path.split('.').at(-1)" :document-id="f.documentId" :path="f.path" @update:model-value="update(f,$event)" /></div></template></fieldset>
   <p v-if="caseManagement" class="cms-field-help cms-case-order-scope">官網先顯示門市案例，再依這裡的順序顯示自建案例，最後顯示匯入案例。</p>
   <details v-if="collections.length&&commonFields.length" class="cms-common-settings"><summary>{{ active?.id==='home:主視覺輪播'?'輪播區塊共用設定':'本區塊共用設定' }}</summary><fieldset :disabled="busy" class="cms-edit-form"><div v-for="f in commonFields" :key="f.documentId+':'+f.path" class="cms-block-field"><AdminFields :model-value="pageFieldValue(bodies,f)" :schema="f.schema" :label="f.path.split('.').at(-1)" :document-id="f.documentId" :path="f.path" @update:model-value="update(f,$event)" /></div></fieldset></details>
   <fieldset v-else-if="sharedInspiration" :disabled="busy" class="cms-edit-form">
    <fieldset v-for="group in inspirationFormGroups" :key="group.title" :data-inspiration-group="group.title" class="cms-inspiration-form-group">
     <legend>{{ group.title }}</legend>
     <p v-if="group.help" class="cms-field-help">{{ group.help }}</p>
     <AdminFields v-for="field in group.fields" :key="field.documentId+':'+field.path" :model-value="pageFieldValue(bodies,field)" :schema="field.schema" :document-id="field.documentId" :path="field.path" @update:model-value="update(field,$event)" />
    </fieldset>
   </fieldset>
   <fieldset v-else-if="!collections.length" :disabled="busy" class="cms-edit-form"><div v-for="f in commonFields" :key="f.documentId+':'+f.path" class="cms-block-field"><AdminFields :model-value="pageFieldValue(bodies,f)" :schema="f.schema" :label="f.path.split('.').at(-1)" :document-id="f.documentId" :path="f.path" @update:model-value="update(f,$event)" /></div></fieldset>
   <p v-if="active?.help" class="cms-field-help cms-position-help">{{ active.help }}</p>
   <details v-for="group in settingGroups" :key="active.id+group.title" :open="!group.imageReading&&!collections.length&&!commonFields.length" class="cms-secondary cms-purpose-settings" :data-inspiration-group="group.formGroup">
    <summary>{{ group.title }}</summary>
    <p v-if="group.imageReading" class="cms-field-help">{{ imageReadingHelp }}</p>
    <p v-else-if="group.readingGroup" class="cms-field-help">訪客使用螢幕閱讀器瀏覽{{ group.readingGroup }}時，會聽到這裡設定的文字。平常可沿用原文。</p>
    <fieldset :disabled="busy" class="cms-edit-form"><div v-for="f in group.fields" :key="f.documentId+':'+f.path"><AdminFields :model-value="pageFieldValue(bodies,f)" :schema="f.schema" :document-id="f.documentId" :path="f.path" @update:model-value="update(f,$event)" /></div></fieldset>
   </details>
   <details class="cms-secondary"><summary>影響頁面（{{ impacts.length }}）</summary><ul v-if="impacts.length"><li v-for="i in impacts" :key="i.href+i.label"><a :href="i.href" target="_blank" rel="noopener noreferrer">{{ i.label }} ↗</a></li></ul><p v-else class="cms-field-help">這些設定目前沒有官網顯示位置。</p></details>
   <details v-if="session?.role==='admin'" class="cms-secondary"><summary>其他操作</summary><button type="button" class="cms-button" :disabled="busy||dirty||!docs.some(d=>d.publishedId)" @click="unpublish">暫停本頁內容</button></details>
   <details class="cms-secondary"><summary>過去的修改</summary><section v-for="d in activeDocs" :key="d.id"><h3>{{ resourceGuide(d.id)?.tabTitle||resourceGuide(d.id)?.location[0] }}</h3><div v-for="v in d.versions" :key="v.id" class="cms-history-row"><span>{{ cmsDate(v.createdAt) }} · {{ v.actor||'初始內容' }}</span><button v-if="session?.role==='admin'" type="button" class="cms-button" :disabled="busy||dirty" @click="restore(d,v.id)">取回這份內容</button></div></section></details>
  </div>
  <aside class="cms-inspector cms-panel" :class="{'is-editing':!!workbench.editing.value}" aria-label="位置示意與編輯"><AdminPositionPreview v-if="!workbench.editing.value" :block="positionBlock" :bodies="bodies" :selected="workbench.selection.value" :page-title="title" :presentation="positionPresentation" :focused-field="focusedField" /><div id="cms-item-editor" /></aside>
 </div>
 <footer class="cms-savebar" aria-label="目前內容操作"><span class="cms-save-status" role="status">{{ status }} <button v-if="dirty" type="button" class="cms-change-link" @click="changesOpen=true">查看修改</button></span><div class="cms-actions"><button type="button" class="cms-button cms-preview-button" :disabled="busy" @click="preparePreview">預覽效果</button><button type="button" class="cms-button" :class="{'cms-button-gold':dirty}" :disabled="busy||!dirty" @click="requestSave">{{ busy?'處理中…':'儲存草稿' }}</button><button v-if="session?.role==='admin'" type="button" class="cms-button cms-button-gold" :disabled="busy||validating||(!dirty&&!pending)" @click="confirmPublish">{{ validating?'正在確認…':'更新官網' }}</button></div></footer>
 <AdminDialog :open="changesOpen" title="本頁尚未儲存的修改" wide @close="changesOpen=false"><AdminChangeList :changes="changeDetails" /><p v-if="!dirty" role="status">目前沒有尚未儲存的修改。</p></AdminDialog>
 </template>
 <AdminDialog :open="positionOpen" title="官網位置示意" @close="positionOpen=false"><AdminPositionPreview :block="positionBlock" :bodies="bodies" :selected="workbench.selection.value" :page-title="title" :presentation="positionPresentation" :focused-field="focusedField" /></AdminDialog>
 <AdminDialog :open="previewOpen" title="預覽效果" wide class="cms-live-preview" @close="closePreview"><aside v-if="previewOpen" class="cms-effect-panel" aria-label="官網效果"><div class="cms-effect-toolbar"><strong>完整官網效果</strong><button type="button" class="cms-button" @click="mobile=!mobile">{{ mobile?'看桌機':'看手機' }}</button><button type="button" class="cms-button" @click="reloadPreview()">重試</button><button type="button" class="cms-button" @click="closePreview">返回修改</button></div><select v-if="choices.length" v-model="previewPath" aria-label="選擇預覽頁面"><option value="">目前頁面</option><option v-for="p in choices" :key="p.path" :value="p.path">{{ p.label }}</option></select><p class="cms-field-help" role="status">{{ previewState }}</p><p v-if="previewError" class="cms-error" role="alert">{{ previewError }} <a v-if="previewResult&&initialToken" :href="previewUrl" target="_blank" rel="noopener noreferrer" class="cms-button">另開效果畫面 ↗</a></p><div class="cms-effect-viewport" :class="{'cms-effect-mobile':mobile}"><iframe v-if="previewResult" :key="initialToken" ref="previewFrame" :style="frameStyle" :src="previewUrl" title="目前輸入的官網效果" @error="failPreview('預覽載入失敗，請重試；目前輸入仍保留。')" /></div></aside></AdminDialog>
 <AdminDialog :open="locationOpen" title="選擇要修改的位置" @close="locationOpen=false"><nav class="cms-block-nav cms-block-picker" aria-label="選擇官網區塊"><button v-for="b in blocks" :key="b.id" type="button" :aria-current="active?.id===b.id?'location':undefined" @click="selectBlock(b.id)"><AdminThumbnail :src="blockPicture(b)" :alt="b.name+'縮圖'" /><span><strong>{{ b.name }}</strong><small>{{ b.hint }}</small></span></button></nav></AdminDialog>
 <AdminDialog :open="confirming" :title="confirmMode==='unpublish'?'確認暫停本頁內容':confirmMode==='save'?'確認儲存共用內容':'確認要更新到官網的內容'" wide @close="confirming=false"><p>{{ confirmMode==='unpublish'?'這會暫停本頁管理的所有內容。使用共用資料的頁面也可能無法載入。':confirmMode==='save'?'儲存草稿後，官網不會立即改變。':'以下修改會一起更新到官網，請確認項目與修改前後內容。' }}</p><p v-if="confirmMode!=='unpublish'&&confirmation&&!confirmation.current?.length&&!confirmation.saved?.length" class="cms-notice" role="status">已儲存內容與官網相同；確認後只會同步更新狀態，文字與圖片不會改變。</p><section v-if="confirmation?.current?.length"><h3>本次尚未儲存的修改（{{ confirmation.current.length }}）</h3><AdminChangeList :changes="confirmation.current" /></section><section v-if="confirmation?.saved?.length"><h3>其他已儲存、尚未更新的修改（{{ confirmation.saved.length }}）</h3><AdminChangeList :changes="confirmation.saved" /></section><details v-if="confirmation?.impacts?.length" open><summary>這些內容的官網使用位置</summary><ul><li v-for="i in confirmation.impacts" :key="i.href+i.label">{{ i.label }}</li></ul></details><p v-if="error" class="cms-error" role="alert">{{ error }}</p><div class="cms-actions"><button type="button" class="cms-button" :disabled="busy" @click="confirming=false">返回修改</button><button type="button" class="cms-button cms-button-gold" :disabled="busy" @click="save(confirmMode)">{{ busy?'處理中…':confirmMode==='unpublish'?'確認暫停':confirmMode==='save'?'確認儲存':'確認更新官網' }}</button></div></AdminDialog>
</section></template>
