<script setup lang="ts">
import {GripVertical,Plus} from 'lucide-vue-next'
import {caseSources,caseManagementRows,filterCaseManagement,storeCaseManagementLink} from '~/shared/cms/case-management.mjs'
const props=defineProps<{library:any[];customRows:any[];publishedCustom:any[];choose:(row:any,edit?:boolean,openPosition?:boolean)=>void;add:()=>void;reorder:(from:number,to:number)=>void;publication:(row:any)=>any}>()
const route=useRoute(),workbench=inject<any>('cms-workbench'),sourceId=useId(),searchId=useId()
const source=ref(caseSources.includes(String(route.query.caseSource))?String(route.query.caseSource):'')
const search=ref(typeof route.query.caseQuery==='string'?route.query.caseQuery:'')
const page=ref(Number.isSafeInteger(Number(route.query.casePage))&&Number(route.query.casePage)>0?Number(route.query.casePage):1),pageSize=6,dragged=ref<number|null>(null),returning=ref(false)
const all=computed(()=>caseManagementRows(props.library,props.customRows,props.publishedCustom))
const filtered=computed(()=>filterCaseManagement(all.value,source.value,search.value))
const pages=computed(()=>Math.max(1,Math.ceil(filtered.value.length/pageSize)))
const visible=computed(()=>filtered.value.slice((page.value-1)*pageSize,page.value*pageSize))
const state=computed(()=>({source:source.value,search:search.value,page:page.value}))
const selected=(row:any)=>workbench?.selection.value?.value?.id===row.slug||workbench?.selection.value?.value?.slug===row.slug
const sortable=computed(()=>source.value==='自建案例'&&!search.value.trim()&&!workbench?.busy.value)
function choose(row:any){
 if(row.customRow){props.choose(row.customRow);return}
 if(!workbench)return
 workbench.editing.value='';workbench.focused.value='case-library'
 workbench.selection.value={scope:'case-library',caption:row.title,image:row.image,source:row.source,value:{...row,id:row.slug},documentId:row.source==='門市案例'?'data-storeCases':'catalog-cases',path:row.source==='門市案例'?'storeCases':'items',index:-1,href:row.route}
 workbench.select?.(false)
}
async function addCase(){source.value='自建案例';search.value='';props.add();await nextTick();page.value=Math.floor(Math.max(0,props.customRows.length-1)/pageSize)+1}
function moveCase(from:number,to:number){
 if(!sortable.value||to<0||to>=props.customRows.length)return
 props.reorder(from,to);page.value=Math.floor(to/pageSize)+1
 nextTick(()=>document.querySelector<HTMLElement>('.cms-case-manager-row.is-selected .cms-case-order')?.focus())
}
function drop(event:DragEvent,row:any){
 if(sortable.value&&row.customRow&&dragged.value!==null&&event.dataTransfer?.getData('text/plain')==='cms-custom-case:'+dragged.value)moveCase(dragged.value,row.customRow.index)
 dragged.value=null
}
watch([source,search],()=>page.value=1)
watch(pages,count=>{if(page.value>count)page.value=count},{immediate:true})
watch(()=>workbench?.editing.value,async (editing,previous)=>{
 if(editing||!previous)return
 const row=all.value.find(selected)
 if(!row?.customRow)return
 returning.value=true
 if(source.value&&source.value!==row.source)source.value=row.source
 if(!filterCaseManagement([row],source.value,search.value).length)search.value=''
 await nextTick()
 const index=filtered.value.findIndex((item:any)=>item.key===row.key)
 if(index>=0){page.value=Math.floor(index/pageSize)+1;props.choose(row.customRow,false,false)}
 await nextTick();returning.value=false
 document.querySelector<HTMLElement>('.cms-case-manager-row.is-selected .cms-item-open')?.focus()
})
watch([visible,()=>workbench?.focused.value,()=>workbench?.editing.value],()=>{if(returning.value||workbench?.editing.value)return;if(!visible.value.length){if(workbench)workbench.selection.value=null;return}if(!visible.value.some(selected))choose(visible.value[0])},{immediate:true})
</script>
<template>
 <section class="cms-case-manager-list" aria-label="全部案例管理">
  <div class="cms-items-tools"><strong>全部案例 <span class="cms-count">{{ all.length }}</span></strong><button type="button" class="cms-button cms-button-gold" @click="addCase"><Plus :size="16" />新增案例</button></div>
  <div class="cms-field"><label :for="sourceId">案例來源</label><select :id="sourceId" v-model="source"><option value="">全部來源</option><option v-for="name in caseSources" :key="name" :value="name">{{ name }}（{{ all.filter(row=>row.source===name).length }}）</option></select></div>
  <div class="cms-field"><label :for="searchId">搜尋案例</label><input :id="searchId" v-model="search" type="search" aria-label="搜尋案例標題或門市" placeholder="輸入案例標題或門市名稱" /></div>
  <p class="cms-field-help">{{ source||'全部來源' }} · 共 {{ filtered.length }} 筆</p>
  <div class="cms-case-manager-rows">
   <article v-for="row in visible" :key="row.key" :data-row-key="row.customRow?.key" class="cms-case-manager-row" :class="{'is-selected':selected(row)}" @dragover.prevent @drop.prevent="drop($event,row)">
    <button type="button" class="cms-item-open" :aria-pressed="selected(row)" @click="choose(row)"><AdminThumbnail :src="row.image" :alt="row.title+'封面'" /><span><strong>{{ row.title||'尚未命名的案例' }}</strong><small v-if="row.store">{{ row.store }}</small></span></button>
    <div class="cms-case-manager-meta"><span class="cms-case-source">{{ row.source }}</span><span class="cms-publication-status">{{ row.customRow?publication(row.customRow).label:row.draftRemoved?'草稿已移除，官網仍顯示':'官網已刊登' }}</span></div>
    <div class="cms-case-manager-actions">
     <NuxtLink v-if="row.source==='門市案例'" :to="storeCaseManagementLink(row,route.query,state)" class="cms-button">前往編輯</NuxtLink>
     <button v-else-if="row.customRow" type="button" class="cms-button cms-item-edit" @click="props.choose(row.customRow,true)">編輯案例</button>
     <small v-else>{{ row.draftRemoved?'已從草稿移除':'請回原系統修改' }}</small>
     <template v-if="row.customRow&&source==='自建案例'">
      <button type="button" class="cms-case-order" :draggable="sortable" :disabled="!sortable" :aria-label="row.title+'，第 '+(row.customRow.index+1)+' 位；按上下方向鍵調整順序'" @dragstart="dragged=row.customRow.index;$event.dataTransfer?.setData('text/plain','cms-custom-case:'+dragged)" @dragend="dragged=null" @keydown.up.prevent="sortable&&moveCase(row.customRow.index,row.customRow.index-1)" @keydown.down.prevent="sortable&&moveCase(row.customRow.index,row.customRow.index+1)"><GripVertical :size="15" />{{ row.customRow.index+1 }}</button>
     </template>
    </div>
   </article>
   <p v-if="!filtered.length" class="cms-empty">{{ search?'找不到符合的案例。':source==='自建案例'?'目前沒有自建案例，可從上方新增。':'目前沒有這個來源的案例。' }}</p>
  </div>
  <div class="cms-list-footer"><span>共 {{ filtered.length }} 筆<template v-if="filtered.length"> · 顯示 {{ (page-1)*pageSize+1 }}–{{ Math.min(page*pageSize,filtered.length) }} 筆</template></span><div v-if="pages>1" class="cms-actions"><button type="button" class="cms-button" :disabled="page===1" @click="page--">上一頁</button><button type="button" class="cms-button" :disabled="page===pages" @click="page++">下一頁 ›</button></div></div>
  <p v-if="source==='自建案例'" class="cms-field-help">拖曳序號或按上下方向鍵調整自建案例順序。搜尋時請先清除關鍵字。</p>
 </section>
</template>
