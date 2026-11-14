<script setup lang="ts">
import {valueAt} from '~/shared/cms/page-editors.mjs'
import {itemKey,itemCaption,itemThumbnail,freshArticleValue} from '~/shared/cms/workbench.mjs'
import {newStoreId} from '~/shared/cms/store-location.mjs'
const props=defineProps<{modelValue:any[];schema:any;documentId?:string;path?:string}>()
const emit=defineEmits<{'update:modelValue':[value:any[]]}>()
const depth=inject('cms-array-depth',0);provide('cms-array-depth',depth+1)
const workbench=depth===0?inject<any>('cms-workbench',null):null
const state=inject<any>('cms-item-selections',ref({})),errors=inject<any>('cms-field-errors',ref([])),selectBlock=inject<((name:string)=>void)|undefined>('cms-select-block',undefined),root=ref<HTMLElement>()
const scope=computed(()=>props.documentId+':'+props.path),selected=computed({get:()=>state.value[scope.value],set:value=>state.value={...state.value,[scope.value]:value}})
const search=computed({get:()=>state.value[scope.value+':search']||'',set:value=>state.value={...state.value,[scope.value+':search']:value}}),page=computed({get:()=>Number(state.value[scope.value+':page']||1),set:value=>state.value={...state.value,[scope.value+':page']:String(value)}})
const pageSize=workbench?6:10
const allRows=computed(()=>(props.modelValue||[]).map((value,index)=>({value,index,key:itemKey(value,index)})).filter(r=>!props.schema.rowFilter||valueAt(r.value,props.schema.rowFilter.path)===props.schema.rowFilter.value))
const rows=computed(()=>allRows.value.filter(r=>caption(r).toLocaleLowerCase().includes(search.value.toLocaleLowerCase())))
const active=computed(()=>allRows.value.find(r=>r.key===selected.value)),pages=computed(()=>Math.max(1,Math.ceil(rows.value.length/pageSize))),visible=computed(()=>rows.value.slice((page.value-1)*pageSize,page.value*pageSize))
const editing=computed(()=>active.value&&(!workbench||workbench.editing.value===scope.value))
const itemSchema=computed(()=>{
 const s=JSON.parse(JSON.stringify(props.schema.item))
 if(props.schema.itemLabels?.[active.value?.index??-1])s.label=props.schema.itemLabels[active.value!.index]
 if(props.schema.source&&s.fields)for(const k of ['id','name'])if(s.fields[k])s.fields[k].readOnly=true
 if(props.schema.newCategory&&s.fields?.summary?.fields?.category)s.fields.summary.fields.category={...s.fields.summary.fields.category,readOnly:true,enum:[props.schema.newCategory]}
 if(props.documentId==='knowledge-articles'&&active.value?.value.slug==='systemcabinet'&&s.fields?.detail)s.fields.detail.hidden=true
 return s
})
const label=computed(()=>props.schema.label||'內容')
function caption(r:any){return itemCaption(r.value,r.index,props.schema)}
function metadata(r:any){return workbench?.metadata.value?.[props.documentId||'']?.[r.key]||{}}
function thumbnail(r:any){return itemThumbnail(r.value,props.schema,metadata(r))}
function announce(){if(!workbench||workbench.focused.value!==scope.value)return;workbench.selection.value=active.value?{scope:scope.value,caption:caption(active.value),image:thumbnail(active.value),value:active.value.value,documentId:props.documentId,path:props.path,index:active.value.index,href:metadata(active.value).href}:null}
function focusRow(){nextTick(()=>root.value?.querySelector<HTMLElement>(`[data-row-key="${CSS.escape(selected.value||'')}"] .cms-item-open`)?.focus())}
function choose(row:any,edit=false){if(!row)return;selected.value=row.key;if(workbench){workbench.focused.value=scope.value;workbench.editing.value=edit?scope.value:'';workbench.returnFocus=focusRow;announce();workbench.select?.(edit)}nextTick(()=>{if(edit||!workbench)document.querySelector<HTMLElement>(workbench?'#cms-item-editor .cms-item-editor-heading':'.cms-item-editor-heading')?.focus()})}
function back(){if(workbench){workbench.editing.value='';focusRow()}else{selected.value=undefined;nextTick(()=>root.value?.querySelector<HTMLElement>('.cms-item-open')?.focus())}}
function item(index:number,value:any){const next=[...props.modelValue];next[index]=value;emit('update:modelValue',next)}
function add(){
 const template=JSON.parse(JSON.stringify(props.schema.template??'')),t=['news-articles','knowledge-articles'].includes(props.documentId||'')?freshArticleValue(template,props.schema.item):template
 if(t&&typeof t==='object'&&!Array.isArray(t)){
  if('id'in t)t.id=props.schema.idGenerator==='store'?newStoreId(props.modelValue):typeof t.id==='number'?Math.max(0,...props.modelValue.map(v=>Number(v.id)||0))+1:crypto.randomUUID()
  if('slug'in t)t.slug='new-'+crypto.randomUUID().slice(0,8)
  if(t.summary){t.summary.title='新增'+(props.schema.newItemLabel||'文章');if(props.schema.newCategory)t.summary.category=props.schema.newCategory;t.summary.categoryLabel=({latest:'最新消息',activities:'優惠活動',video:'媒體影音'} as any)[t.summary.category]||'廚房知識';t.summary.publishedAt=new Intl.DateTimeFormat('en-CA',{timeZone:'Asia/Taipei',year:'numeric',month:'2-digit',day:'2-digit'}).format(new Date());t.summary.displayDate=t.summary.publishedAt}
  if('title'in t)t.title='新增內容';if('name'in t)t.name='新增內容'
 }
 emit('update:modelValue',[...props.modelValue,t]);search.value='';page.value=Math.ceil((allRows.value.length+1)/pageSize);choose({key:itemKey(t,props.modelValue.length)},true)
}
function move(index:number,step:number){const position=rows.value.findIndex(r=>r.index===index),other=rows.value[position+step];if(!other)return;const next=[...props.modelValue];[next[index],next[other.index]]=[next[other.index],next[index]];if(props.schema.source)next.forEach((v,i)=>v.sort=i);if(!(next[index]?.id??next[index]?.slug))selected.value=itemKey(next[other.index],other.index);emit('update:modelValue',next)}
function remove(index:number){if(!window.confirm('移除此項？儲存並更新官網後才會影響訪客。'))return;emit('update:modelValue',props.modelValue.filter((_,i)=>i!==index));back()}
watch(search,()=>page.value=1)
watch(pages,n=>{if(page.value>n)page.value=n})
watch([visible,active,()=>workbench?.focused.value],()=>{if(!workbench)return;if(!workbench.focused.value&&visible.value.length)workbench.focused.value=scope.value;if(!active.value&&visible.value[0])selected.value=visible.value[0].key;announce()},{immediate:true})
watch([page,search],()=>{if(workbench&&visible.value[0]&&!visible.value.some(r=>r.key===selected.value))choose(visible.value[0])})
watch(()=>errors.value,()=>{const prefix=(props.path?props.path+'.':''),issue=errors.value?.find((e:any)=>e.documentId===props.documentId&&e.path.startsWith(prefix));const index=Number(issue?.path.slice(prefix.length).split('.')[0]);if(issue&&Number.isInteger(index)&&props.modelValue[index]!==undefined){search.value='';page.value=Math.floor(allRows.value.findIndex(r=>r.index===index)/pageSize)+1;choose(allRows.value.find(r=>r.index===index),true)}},{deep:true,immediate:true})
</script>
<template>
 <section ref="root" class="cms-items" :class="{'cms-items-workbench':workbench}">
  <template v-if="workbench||!active">
   <div class="cms-items-tools"><strong>{{ label }} <span class="cms-count">{{ rows.length }}</span></strong><slot name="add"><button v-if="!schema.source" type="button" class="cms-button" @click="add">{{ schema.newItemLabel?.startsWith('新增')?schema.newItemLabel:'新增'+(schema.newItemLabel||'項目') }}</button></slot></div>
   <input v-if="workbench||rows.length>8||search" v-model="search" type="search" :aria-label="`搜尋${label}`" :placeholder="'搜尋'+label+'名稱'" />
   <div class="cms-item-list"><div v-for="r in visible" :key="r.key" class="cms-item-row" :class="{'is-selected':selected===r.key&&(!workbench||workbench.focused.value===scope)}" :data-row-key="r.key"><button type="button" class="cms-item-open" :aria-pressed="workbench?selected===r.key&&workbench.focused.value===scope:undefined" @click="choose(r)"><AdminImage v-if="thumbnail(r)" :src="thumbnail(r)" :alt="caption(r)+'縮圖'" /><span v-else class="cms-item-no-image" aria-hidden="true">圖文</span><span>{{ caption(r) }}</span><small v-if="typeof r.value?.enabled==='boolean'">{{ r.value.enabled?'顯示中':'暫不顯示' }}</small></button><button v-if="workbench" type="button" class="cms-button cms-item-edit" :aria-label="'編輯'+caption(r)" @click="choose(r,true)">編輯</button></div></div>
   <p v-if="!rows.length" class="cms-empty">{{ search?'找不到符合的項目':'目前沒有內容，可從上方新增。' }}</p>
   <div v-if="workbench||pages>1" class="cms-list-footer"><span>共 {{ rows.length }} 筆<template v-if="rows.length"> · 顯示 {{ (page-1)*pageSize+1 }}–{{ Math.min(page*pageSize,rows.length) }} 筆</template></span><div v-if="pages>1" class="cms-actions"><button type="button" class="cms-button" :disabled="page===1" @click="page--">上一頁</button><button type="button" class="cms-button" :disabled="page===pages" @click="page++">下一頁 ›</button></div></div>
  </template>
  <Teleport v-if="editing&&active" to="#cms-item-editor" :disabled="!workbench">
   <fieldset class="cms-item-form" :disabled="workbench?.busy.value">
    <div class="cms-item-editor-heading" tabindex="-1"><div><small>正在修改</small><strong>{{ caption(active) }}</strong></div><button type="button" class="cms-button" @click="back">返回清單</button></div>
    <button v-if="documentId==='knowledge-articles'&&active.value.slug==='systemcabinet'&&selectBlock" type="button" class="cms-button" @click="selectBlock('系統櫃介紹')">修改文章內文 →</button>
    <div class="cms-actions cms-item-tools"><button type="button" class="cms-button" :disabled="rows[0]?.index===active.index" @click="move(active.index,-1)">往前移</button><button type="button" class="cms-button" :disabled="rows.at(-1)?.index===active.index" @click="move(active.index,1)">往後移</button><button v-if="!schema.source" type="button" class="cms-button" :disabled="modelValue.length<=(schema.min||0)" @click="remove(active.index)">移除此項</button></div>
    <slot name="editor" :row="active"><AdminFields :model-value="active.value" :schema="itemSchema" :document-id="documentId" :path="`${path?path+'.':''}${active.index}`" @update:model-value="item(active.index,$event)" /></slot>
   </fieldset>
  </Teleport>
 </section>
</template>
