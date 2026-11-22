<script setup lang="ts">
import {valueAt} from '~/shared/cms/page-editors.mjs'
import {itemKey,itemCaption,itemThumbnail,freshArticleValue,articleDateLabel,recentArticleIndexes} from '~/shared/cms/workbench.mjs'
import {newStoreId} from '~/shared/cms/store-location.mjs'
import {seriesEditorSchema,seriesEditorSection} from '~/shared/cms/series-editor.mjs'
import {sameContent,itemPublication} from '~/shared/cms/changes.mjs'
import {compareNewsDates} from '~/shared/cms/public-content.mjs'
import {GripVertical,Plus} from 'lucide-vue-next'
const props=defineProps<{modelValue:any[];schema:any;documentId?:string;path?:string;hasRelatedChanges?:(value:any)=>boolean;seriesPart?:string;fallbackImage?:string;displayLimit?:number}>()
const emit=defineEmits<{'update:modelValue':[value:any[]];'cancel-related':[value:any]}>()
const route=useRoute(),router=useRouter(),cancelOpen=ref(false),moreOpen=ref(false),directTarget=ref(''),itemNotice=ref('')
const depth=inject('cms-array-depth',0);provide('cms-array-depth',depth+1)
const workbench=depth===0?inject<any>('cms-workbench',null):null
const state=inject<any>('cms-item-selections',ref({})),errors=inject<any>('cms-field-errors',ref([])),root=ref<HTMLElement>()
const scope=computed(()=>props.documentId+':'+props.path),fixedArticleIds=computed(()=>props.schema.rowIds||props.schema.recentArticleIds),viewScope=computed(()=>scope.value+(fixedArticleIds.value?':recent':''))
const selected=computed({get:()=>state.value[viewScope.value],set:value=>state.value={...state.value,[viewScope.value]:value}})
const tracking=computed(()=>{
 if(!workbench?.rows)return null
 if(!workbench.rows.value[scope.value]){
  const before=valueAt(workbench.baseline.value[props.documentId||''],props.path||'')||[]
  workbench.rows.value[scope.value]={order:(props.modelValue||[]).map(itemKey),saved:Object.fromEntries(before.map((v:any,i:number)=>[itemKey(v,i),JSON.parse(JSON.stringify(v))]))}
 }
 return workbench.rows.value[scope.value]
})
function syncTracking(){const t=tracking.value;if(!t)return;const keys=(props.modelValue||[]).map((v:any,i:number)=>String(v&&typeof v==='object'&&(v.id??v.slug)!==undefined?(v.id??v.slug):t.order[i]??crypto.randomUUID()));for(const [i,key]of keys.entries()){const old=t.order[i];if(old!==key&&!keys.includes(old)&&Object.hasOwn(t.saved,old)){t.saved[key]=t.saved[old];delete t.saved[old]}}t.order=keys}
const search=computed({get:()=>state.value[viewScope.value+':search']||'',set:value=>state.value={...state.value,[viewScope.value+':search']:value}}),page=computed({get:()=>Number(state.value[viewScope.value+':page']||1),set:value=>state.value={...state.value,[viewScope.value+':page']:String(value)}})
const pageSize=workbench?6:10
const caseTable=computed(()=>props.schema.editor==='case-table'),dragged=ref(''),dropTarget=ref(''),orderNotice=ref('')
const allRows=computed(()=>{
 const rows=(props.modelValue||[]).map((value,index)=>({value,index,key:tracking.value?.order[index]??itemKey(value,index)}))
 if(fixedArticleIds.value)return recentArticleIndexes(props.modelValue,fixedArticleIds.value).map(index=>rows[index]!)
 const items=rows.filter(r=>!props.schema.rowFilter||valueAt(r.value,props.schema.rowFilter.path)===props.schema.rowFilter.value)
 return props.schema.newsOverview?items.sort((a,b)=>compareNewsDates(a.value.summary.publishedAt,b.value.summary.publishedAt)):items
})
const rows=computed(()=>allRows.value.filter(r=>caption(r).toLocaleLowerCase().includes(search.value.toLocaleLowerCase())))
const active=computed(()=>allRows.value.find(r=>r.key===selected.value)),pages=computed(()=>Math.max(1,Math.ceil(rows.value.length/pageSize))),visible=computed(()=>rows.value.slice((page.value-1)*pageSize,page.value*pageSize))
const editing=computed(()=>active.value&&(!workbench||workbench.editing.value===scope.value))
const itemSchema=computed(()=>{
 const s=JSON.parse(JSON.stringify(props.schema.item))
 if(props.schema.itemLabels?.[active.value?.index??-1])s.label=props.schema.itemLabels[active.value!.index]
 if(props.schema.source&&s.fields)for(const k of ['id','name'])if(s.fields[k])s.fields[k].readOnly=true
 if(props.schema.rowFilter&&props.schema.newCategory&&s.fields?.summary?.fields?.category)s.fields.summary.fields.category={...s.fields.summary.fields.category,readOnly:true,enum:[props.schema.newCategory]}
 if(props.documentId==='knowledge-articles'&&active.value?.value.slug==='systemcabinet'&&s.fields?.detail)s.fields.detail.hidden=true
 return props.seriesPart?seriesEditorSchema(s,props.seriesPart):s
})
const label=computed(()=>props.schema.label||'內容')
function caption(r:any){return itemCaption(r.value,r.index,props.schema)}
function metadata(r:any){return workbench?.metadata.value?.[props.documentId||'']?.[r.key]||{}}
function thumbnail(r:any){return itemThumbnail(r.value,props.schema,metadata(r))||props.fallbackImage||''}
function changed(r:any){return !!tracking.value&&(!sameContent(tracking.value.saved[r.key],r.value)||!!props.hasRelatedChanges?.(r.value))}
function publication(r:any){return workbench?.documents?itemPublication(workbench.documents.value.find((d:any)=>d.id===props.documentId),props.path||'',r.value,r.index):{label:r.value.enabled===false?'更新官網後隱藏':'更新官網後顯示'}}
function cancelItem(){const row=active.value,t=tracking.value;if(!row||!t)return;const before=t.saved[row.key];if(props.hasRelatedChanges?.(row.value))emit('cancel-related',row.value);if(before===undefined){t.order.splice(row.index,1);emit('update:modelValue',props.modelValue.filter((_,i)=>i!==row.index));void back()}else{const restored=JSON.parse(JSON.stringify(before));if(props.schema.source)restored.sort=row.value.sort;item(row.index,restored);itemNotice.value='已取消這一筆的未儲存修改，其他修改仍保留。';nextTick(()=>document.querySelector<HTMLElement>('#cms-item-editor .cms-item-editor-heading')?.focus())}cancelOpen.value=false}
function announce(){if(!workbench||workbench.focused.value!==scope.value)return;workbench.selection.value=active.value?{scope:scope.value,caption:caption(active.value),image:thumbnail(active.value),value:active.value.value,documentId:props.documentId,path:props.path,index:active.value.index,href:metadata(active.value).href}:null}
function focusRow(){nextTick(()=>{const row=root.value?.querySelector<HTMLElement>(`[data-row-key="${CSS.escape(selected.value||'')}"] .cms-item-open`);(row||root.value?.querySelector<HTMLElement>('.cms-case-empty button,.cms-items-tools button,input[type=search]'))?.focus()})}
function choose(row:any,edit=false,openPosition=true){if(!row)return;selected.value=row.key;moreOpen.value=false;itemNotice.value='';if(workbench){workbench.focused.value=scope.value;workbench.editing.value=edit?scope.value:'';workbench.returnFocus=focusRow;announce();if(edit||openPosition)workbench.select?.(edit)}nextTick(()=>{if(edit||!workbench)document.querySelector<HTMLElement>(workbench?'#cms-item-editor .cms-item-editor-heading':'.cms-item-editor-heading')?.focus()})}
async function back(){if(workbench){const row=active.value;workbench.editing.value='';if(row&&!rows.value.some(r=>r.key===row.key)){search.value='';await nextTick();page.value=Math.floor(allRows.value.findIndex(r=>r.key===row.key)/pageSize)+1;selected.value=row.key;announce()}if(route.query.list===scope.value)await router.replace({query:{...route.query,list:undefined,item:undefined}});focusRow()}else{selected.value=undefined;nextTick(()=>root.value?.querySelector<HTMLElement>('.cms-item-open')?.focus())}}
async function clearCaseSearch(){
 search.value=''
 await nextTick()
 root.value?.querySelector<HTMLInputElement>('input[type=search]')?.focus()
}
function item(index:number,value:any){const next=[...props.modelValue];next[index]=value;emit('update:modelValue',next)}
function add(){
 const template=JSON.parse(JSON.stringify(props.schema.template??'')),t=['news-articles','knowledge-articles'].includes(props.documentId||'')?freshArticleValue(template,props.schema.item):template
 if(t&&typeof t==='object'&&!Array.isArray(t)){
  if('id'in t)t.id=props.schema.idGenerator==='store'?newStoreId(props.modelValue):typeof t.id==='number'?Math.max(0,...props.modelValue.map(v=>Number(v.id)||0))+1:crypto.randomUUID()
  if('slug'in t)t.slug='new-'+crypto.randomUUID().slice(0,8)
  if(t.summary){t.summary.title='新增'+(props.schema.newItemLabel||'文章');if(props.schema.newCategory)t.summary.category=props.schema.newCategory;t.summary.categoryLabel=({latest:'最新消息',activities:'優惠活動',video:'媒體影音'} as any)[t.summary.category]||'廚房知識';t.summary.publishedAt=new Intl.DateTimeFormat('en-CA',{timeZone:'Asia/Taipei',year:'numeric',month:'2-digit',day:'2-digit'}).format(new Date());t.summary.displayDate=articleDateLabel(t.summary.publishedAt)}
  if('title'in t)t.title=props.documentId==='custom-cases'?'新增案例':props.documentId==='view-components-home-HomeHero'?'新增輪播':'新增內容';if('name'in t)t.name='新增內容'
 }
 const index=props.schema.newsOverview?allRows.value.filter(row=>compareNewsDates(row.value.summary.publishedAt,t.summary.publishedAt)<=0).length:allRows.value.length
 const key=tracking.value&&!(t&&typeof t==='object'&&(t.id??t.slug)!==undefined)?crypto.randomUUID():itemKey(t,props.modelValue.length);tracking.value?.order.push(key);emit('update:modelValue',[...props.modelValue,t]);search.value='';page.value=Math.floor(index/pageSize)+1;choose({key},true)
}
function reorder(from:number,to:number,focusHandle=false){
 if(!caseTable.value||search.value||workbench?.busy.value||!Number.isInteger(from)||!Number.isInteger(to)||from===to||from<0||to<0||from>=props.modelValue.length||to>=props.modelValue.length)return
 if(workbench){if(workbench.focused.value!==scope.value)workbench.editing.value='';workbench.focused.value=scope.value;workbench.returnFocus=focusRow}
 const next=[...props.modelValue],row=allRows.value.find(r=>r.index===from);next.splice(to,0,next.splice(from,1)[0]);if(tracking.value)tracking.value.order.splice(to,0,tracking.value.order.splice(from,1)[0]);selected.value=row!.key;emit('update:modelValue',next);page.value=Math.floor(to/pageSize)+1
 orderNotice.value=`已移到第 ${to+1} 位，尚未儲存。`
 nextTick(()=>{announce();if(focusHandle)root.value?.querySelector<HTMLElement>(`[data-row-key="${CSS.escape(selected.value)}"] .cms-case-order`)?.focus()})
}
function move(index:number,step:number){if(caseTable.value){reorder(index,index+step);return}const position=rows.value.findIndex(r=>r.index===index),other=rows.value[position+step];if(!other)return;const next=[...props.modelValue];[next[index],next[other.index]]=[next[other.index],next[index]];if(tracking.value)[tracking.value.order[index],tracking.value.order[other.index]]=[tracking.value.order[other.index],tracking.value.order[index]];if(props.schema.source)next.forEach((v,i)=>v.sort=i);if(!tracking.value&&!(next[other.index]?.id??next[other.index]?.slug))selected.value=itemKey(next[other.index],other.index);emit('update:modelValue',next)}
function startDrag(event:DragEvent,row:any){if(search.value||workbench?.busy.value){event.preventDefault();return}dragged.value=row.key;event.dataTransfer?.setData('text/plain',scope.value+':'+row.key);if(event.dataTransfer)event.dataTransfer.effectAllowed='move';choose(row)}
function drop(event:DragEvent,row:any){if(dragged.value&&event.dataTransfer?.getData('text/plain')===scope.value+':'+dragged.value){const from=allRows.value.find(r=>r.key===dragged.value)?.index;if(from!==undefined)reorder(from,row.index)}dragged.value='';dropTarget.value=''}
function toggleVisibility(row:any){if(workbench?.busy.value)return;item(row.index,{...row.value,enabled:row.value.enabled===false});choose(row)}
function remove(index:number){if(!window.confirm('移除此項？儲存並更新官網後才會影響訪客。'))return;tracking.value?.order.splice(index,1);emit('update:modelValue',props.modelValue.filter((_,i)=>i!==index));back()}
watch(()=>props.modelValue,syncTracking,{immediate:true,flush:'sync'})
watch(search,()=>page.value=1)
watch(pages,n=>{if(page.value>n)page.value=n})
watch([visible,active,()=>workbench?.focused.value],()=>{if(!workbench)return;if(!workbench.focused.value&&visible.value.length)workbench.focused.value=scope.value;if(!active.value&&visible.value[0])selected.value=visible.value[0].key;announce()},{immediate:true})
watch([page,search],()=>{if(workbench&&visible.value[0]&&!visible.value.some(r=>r.key===selected.value))choose(visible.value[0],false,false)})
watch(()=>errors.value,()=>{const prefix=(props.path?props.path+'.':''),issue=errors.value?.find((e:any)=>e.documentId===props.documentId&&e.path.startsWith(prefix));const index=allRows.value.findIndex(r=>r.index===Number(issue?.path.slice(prefix.length).split('.')[0]));if(issue&&index>=0){search.value='';page.value=Math.floor(index/pageSize)+1;choose(allRows.value[index],true)}},{deep:true,immediate:true})
watch([()=>route.query.item,()=>route.query.list,allRows],()=>{const target=String(route.query.list)+':'+String(route.query.item);if(!workbench)return;if(route.query.list!==scope.value){directTarget.value='';return}if(directTarget.value===target)return;const row=allRows.value.find(r=>r.key===route.query.item);if(!row)return;directTarget.value=target;search.value='';page.value=Math.floor(allRows.value.indexOf(row)/pageSize)+1;nextTick(()=>choose(row,true))},{immediate:true})
watch(()=>route.query.create,async target=>{if(!workbench||props.schema.source||fixedArticleIds.value||target!==scope.value)return;await nextTick();if(route.query.create!==scope.value)return;await router.replace({query:{...route.query,create:undefined}});add()},{immediate:true})
</script>
<template>
 <section ref="root" class="cms-items" :class="{'cms-items-workbench':workbench,'cms-case-manager':caseTable}">
  <template v-if="workbench||!active">
   <div v-if="caseTable&&!allRows.length" class="cms-case-empty">
    <h3>還沒有自建案例</h3>
    <p>新增後可填寫案例標題、介紹、廚房型式和設計風格，並上傳封面和內頁照片。</p>
    <button type="button" class="cms-button cms-button-gold" @click="add"><Plus :size="16" aria-hidden="true" />新增案例</button>
   </div>
   <template v-else>
    <div class="cms-items-tools"><input v-if="caseTable" v-model="search" type="search" aria-label="搜尋案例標題" placeholder="搜尋案例標題" /><strong v-else>{{ label }} <span class="cms-count">{{ rows.length }}</span></strong><slot name="add"><button v-if="!schema.source&&!fixedArticleIds" type="button" class="cms-button" :class="{'cms-button-gold':caseTable}" @click="add"><Plus v-if="caseTable" :size="16" aria-hidden="true" />{{ schema.newItemLabel?.startsWith('新增')?schema.newItemLabel:'新增'+(schema.newItemLabel||'項目') }}</button></slot></div>
    <input v-if="!caseTable&&(workbench||rows.length>8||search)" v-model="search" type="search" :aria-label="schema.searchLabel||`搜尋${label}`" :placeholder="schema.searchLabel||'搜尋'+label+'名稱'" />
    <table v-if="caseTable&&rows.length" class="cms-case-table" aria-label="自建案例" :aria-describedby="allRows.length>1?'cms-custom-case-order-help':undefined"><thead><tr><th scope="col">順序</th><th scope="col">案例</th><th scope="col">官網顯示</th><th scope="col">編輯</th></tr></thead><tbody><tr v-for="r in visible" :key="r.key" :data-row-key="r.key" :class="{'is-selected':selected===r.key&&(!workbench||workbench.focused.value===scope),'is-dragging':dragged===r.key,'is-drop-target':dropTarget===r.key}" @dragover.prevent="dropTarget=dragged?r.key:''" @dragleave="dropTarget=''" @drop.prevent="drop($event,r)">
     <td><button type="button" class="cms-case-order" :draggable="!search&&!workbench?.busy.value" :disabled="!!search||workbench?.busy.value" :aria-label="caption(r)+'，第 '+(r.index+1)+' 位；按上下方向鍵調整順序'" @dragstart="startDrag($event,r)" @dragend="dragged='';dropTarget=''" @keydown.up.prevent="reorder(r.index,r.index-1,true)" @keydown.down.prevent="reorder(r.index,r.index+1,true)"><GripVertical :size="16" aria-hidden="true" /><span>{{ r.index+1 }}</span></button></td>
     <td><button type="button" class="cms-item-open" :aria-pressed="selected===r.key&&(!workbench||workbench.focused.value===scope)" @click="choose(r)"><AdminThumbnail :src="thumbnail(r)" :alt="caption(r)+'縮圖'" /><span>{{ caption(r) }}<small v-if="changed(r)" class="cms-item-modified">尚未儲存</small></span></button></td>
     <td><small class="cms-publication-status">{{ publication(r).label }}</small><button type="button" class="cms-case-status" :class="{'is-hidden':r.value.enabled===false}" :aria-label="caption(r)+'：更新官網後'+(r.value.enabled===false?'隱藏，改為顯示':'顯示，改為隱藏')" :aria-pressed="r.value.enabled!==false" title="更新官網後生效" @click="toggleVisibility(r)">{{ r.value.enabled===false?'更新後隱藏':'更新後顯示' }}</button></td>
     <td><button type="button" class="cms-button cms-item-edit" :aria-label="'編輯'+caption(r)" @click="choose(r,true)">編輯</button></td>
    </tr></tbody></table>
    <div v-else-if="!caseTable" class="cms-item-list">
     <div v-for="r in visible" :key="r.key" class="cms-item-row" :class="{'is-selected':selected===r.key&&(!workbench||workbench.focused.value===scope)}" :data-row-key="r.key">
      <button type="button" class="cms-item-open" :aria-pressed="workbench?selected===r.key&&workbench.focused.value===scope:undefined" @click="choose(r)">
       <AdminThumbnail :src="thumbnail(r)" :alt="caption(r)+'縮圖'" :contain="/標誌|標識|圖示/.test(label)" />
       <span>{{ caption(r) }}
        <small v-if="schema.newsOverview" class="cms-news-row-meta">{{ r.value.summary.categoryLabel }} · {{ r.value.summary.displayDate||r.value.summary.publishedAt }} · {{ publication(r).label }}</small>
        <small v-if="displayLimit!==undefined&&r.index>=displayLimit" class="cms-news-row-meta">超出官網顯示範圍</small>
        <small v-if="changed(r)" class="cms-item-modified">尚未儲存</small>
       </span>
       <small v-if="!schema.newsOverview&&typeof r.value?.enabled==='boolean'">{{ publication(r).label }}</small>
      </button>
      <button v-if="workbench" type="button" class="cms-button cms-item-edit" :aria-label="(schema.newsOverview?'編輯文章：':'編輯')+caption(r)" @click="choose(r,true)">{{ schema.newsOverview?'編輯文章':'編輯' }}</button>
     </div>
    </div>
    <div v-if="caseTable&&!rows.length" class="cms-case-empty">
     <p role="status">找不到符合的自建案例。</p>
     <button type="button" class="cms-button" @click="clearCaseSearch">清除搜尋</button>
    </div>
    <p v-else-if="!rows.length" class="cms-empty">{{ search?'找不到符合的項目':fixedArticleIds?'這個區塊目前沒有可編輯的文章。':'目前沒有內容，可從上方新增。' }}</p>
    <div v-if="(!caseTable||rows.length)&&(workbench||pages>1)" class="cms-list-footer"><span>共 {{ rows.length }} 筆<template v-if="rows.length"> · 顯示 {{ (page-1)*pageSize+1 }}–{{ Math.min(page*pageSize,rows.length) }} 筆</template></span><div v-if="pages>1" class="cms-actions"><button type="button" class="cms-button" :disabled="page===1" @click="page--">上一頁</button><button type="button" class="cms-button" :disabled="page===pages" @click="page++">下一頁 ›</button></div></div>
    <p v-if="caseTable&&rows.length&&allRows.length>1" id="cms-custom-case-order-help" class="cms-case-sort-help">{{ search?'清除搜尋後可調整順序。':'拖曳或用上下方向鍵移動順序。官網會把自建案例排在門市案例之後。' }}</p>
    <p v-if="caseTable&&rows.length&&orderNotice" class="cms-field-help" role="status">{{ orderNotice }}</p>
   </template>
  </template>
  <Teleport v-if="editing&&active" to="#cms-item-editor" :disabled="!workbench">
   <fieldset class="cms-item-form" :disabled="workbench?.busy.value">
    <div class="cms-item-editor-heading" tabindex="-1"><AdminThumbnail :src="thumbnail(active)" :alt="caption(active)+'正在修改的圖片'" :contain="/標誌|標識|圖示/.test(label)" /><div><small>正在修改<span v-if="seriesPart"> · {{ seriesEditorSection(seriesPart).name }}</span><span v-if="typeof active.value?.enabled==='boolean'"> · {{ publication(active).label }}</span></small><strong>{{ caption(active) }}</strong></div><button type="button" class="cms-button" @click="back">返回清單</button></div>
    <div v-if="workbench" class="cms-actions cms-item-primary"><button type="button" class="cms-button" @click="workbench.position()">看位置</button><button v-if="changed(active)" type="button" class="cms-button" @click="cancelOpen=true">取消本筆修改</button><slot name="item-actions" :row="active" /></div>
    <p v-if="itemNotice" class="cms-field-help" role="status">{{ itemNotice }}</p>
    <slot name="editor" :row="active"><AdminArticleFields v-if="path==='items'&&['news-articles','knowledge-articles'].includes(documentId||'')" :model-value="active.value" :schema="itemSchema" :document-id="documentId" :path="`${path?path+'.':''}${active.index}`" @update:model-value="item(active.index,$event)" /><AdminFields v-else :model-value="active.value" :schema="itemSchema" :document-id="documentId" :path="`${path?path+'.':''}${active.index}`" @update:model-value="item(active.index,$event)" /></slot>
    <slot name="item-settings" :row="active" />
    <details v-if="!fixedArticleIds" class="cms-item-more" :open="moreOpen" @toggle="moreOpen=($event.target as HTMLDetailsElement).open"><summary>更多操作</summary><div class="cms-actions cms-item-tools"><button v-if="!schema.newsOverview" type="button" class="cms-button" :disabled="rows[0]?.index===active.index||(caseTable&&!!search)" @click="move(active.index,-1)">往前移</button><button v-if="!schema.newsOverview" type="button" class="cms-button" :disabled="rows.at(-1)?.index===active.index||(caseTable&&!!search)" @click="move(active.index,1)">往後移</button><button v-if="!schema.source" type="button" class="cms-button" :disabled="modelValue.length<=(schema.min||0)" @click="remove(active.index)">移除此項</button></div></details>
   </fieldset>
  <AdminDialog :open="cancelOpen" title="取消這一筆的修改？" @close="cancelOpen=false"><p>這一筆會回復到上次儲存的內容；新項目會移除。本頁其他修改與目前排序會保留。</p><div class="cms-actions"><button type="button" class="cms-button" @click="cancelOpen=false">繼續修改</button><button type="button" class="cms-button cms-button-gold" :disabled="workbench?.busy.value" @click="cancelItem">確認取消本筆修改</button></div></AdminDialog>
  </Teleport>
 </section>
</template>
