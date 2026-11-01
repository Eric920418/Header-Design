<script setup lang="ts">
import {rowName,firstImage} from '~/shared/cms/workflow.mjs'
import {valueAt} from '~/shared/cms/page-editors.mjs'
import {newStoreId} from '~/shared/cms/store-location.mjs'
const props=defineProps<{modelValue:any[];schema:any;documentId?:string;path?:string}>()
const emit=defineEmits<{'update:modelValue':[value:any[]]}>()
const state=inject<any>('cms-item-selections',ref({})),errors=inject<any>('cms-field-errors',ref([])),selectBlock=inject<((name:string)=>void)|undefined>('cms-select-block',undefined),root=ref<HTMLElement>()
const scope=computed(()=>props.documentId+':'+props.path),selected=computed({get:()=>state.value[scope.value],set:value=>state.value={...state.value,[scope.value]:value}})
const search=computed({get:()=>state.value[scope.value+':search']||'',set:value=>state.value={...state.value,[scope.value+':search']:value}}),page=computed({get:()=>Number(state.value[scope.value+':page']||1),set:value=>state.value={...state.value,[scope.value+':page']:String(value)}})
const key=(value:any,index:number)=>String(value&&typeof value==='object'?(value.id??value.slug??index):index)
const allRows=computed(()=>(props.modelValue||[]).map((value,index)=>({value,index,key:key(value,index)})).filter(r=>!props.schema.rowFilter||valueAt(r.value,props.schema.rowFilter.path)===props.schema.rowFilter.value))
const rows=computed(()=>allRows.value.filter(r=>rowName(r.value,r.index).toLocaleLowerCase().includes(search.value.toLocaleLowerCase())))
const active=computed(()=>allRows.value.find(r=>r.key===selected.value))
const pages=computed(()=>Math.max(1,Math.ceil(rows.value.length/10)))
const itemSchema=computed(()=>{
 const s=JSON.parse(JSON.stringify(props.schema.item))
 if(props.schema.itemLabels?.[active.value?.index??-1])s.label=props.schema.itemLabels[active.value!.index]
 if(props.schema.source&&s.fields)for(const k of ['id','name'])if(s.fields[k])s.fields[k].readOnly=true
 if(props.schema.newCategory&&s.fields?.summary?.fields?.category)s.fields.summary.fields.category={...s.fields.summary.fields.category,readOnly:true,enum:[props.schema.newCategory]}
 if(props.documentId==='knowledge-articles'&&active.value?.value.slug==='systemcabinet'&&s.fields?.detail)s.fields.detail.hidden=true
 return s
})
const label=computed(()=>props.schema.label||'內容'),caption=(r:any)=>props.schema.rowLabel?r.value?.[props.schema.rowLabel]||rowName(r.value,r.index):rowName(r.value,r.index)
const thumbnail=(r:any)=>props.schema.rowImage?(Array.isArray(r.value?.[props.schema.rowImage])?r.value[props.schema.rowImage][0]:r.value?.[props.schema.rowImage]):firstImage(r.value)
function item(index:number,value:any){const next=[...props.modelValue];next[index]=value;emit('update:modelValue',next)}
function choose(row:any){selected.value=row.key;nextTick(()=>root.value?.querySelector<HTMLElement>('.cms-item-editor-heading')?.focus())}
function back(){selected.value=undefined;nextTick(()=>root.value?.querySelector<HTMLElement>('.cms-item-open')?.focus())}
function add(){
 const t=JSON.parse(JSON.stringify(props.schema.template??''))
 if(t&&typeof t==='object'&&!Array.isArray(t)){
  if('id'in t)t.id=props.schema.idGenerator==='store'?newStoreId(props.modelValue):typeof t.id==='number'?Math.max(0,...props.modelValue.map(v=>Number(v.id)||0))+1:crypto.randomUUID()
  if('slug'in t)t.slug='new-'+crypto.randomUUID().slice(0,8)
  if(t.summary){t.summary.title='新增內容';if(props.schema.newCategory)t.summary.category=props.schema.newCategory}
  if('title'in t)t.title='新增內容';if('name'in t)t.name='新增內容'
 }
 selected.value=key(t,props.modelValue.length);emit('update:modelValue',[...props.modelValue,t]);search.value='';nextTick(()=>root.value?.querySelector<HTMLInputElement>('input:not([readonly]),textarea')?.focus())
}
function move(index:number,step:number){const visible=rows.value,position=visible.findIndex(r=>r.index===index),other=visible[position+step];if(!other)return;const next=[...props.modelValue];[next[index],next[other.index]]=[next[other.index],next[index]];if(props.schema.source)next.forEach((v,i)=>v.sort=i);if(!(next[index]?.id??next[index]?.slug))selected.value=key(next[other.index],other.index);emit('update:modelValue',next)}
function remove(index:number){if(!window.confirm('移除此項？儲存並更新官網後才會影響訪客。'))return;emit('update:modelValue',props.modelValue.filter((_,i)=>i!==index));back()}
watch(search,()=>page.value=1)
watch(pages,n=>{if(page.value>n)page.value=n})
watch(()=>errors.value,()=>{const prefix=(props.path?props.path+'.':''),issue=errors.value?.find((e:any)=>e.documentId===props.documentId&&e.path.startsWith(prefix));const index=Number(issue?.path.slice(prefix.length).split('.')[0]);if(issue&&Number.isInteger(index)&&props.modelValue[index]!==undefined){search.value='';selected.value=key(props.modelValue[index],index)}},{deep:true,immediate:true})
</script>
<template><section ref="root" class="cms-items"><template v-if="active"><div class="cms-item-editor-heading" tabindex="-1"><button type="button" class="cms-button" @click="back">← 返回清單</button><strong>{{ caption(active) }}</strong></div><button v-if="documentId==='knowledge-articles'&&active.value.slug==='systemcabinet'&&selectBlock" type="button" class="cms-button" @click="selectBlock('系統櫃介紹')">修改文章內文 →</button><div class="cms-actions cms-item-tools"><button type="button" class="cms-button" :disabled="rows[0]?.index===active.index" @click="move(active.index,-1)">往前移</button><button type="button" class="cms-button" :disabled="rows.at(-1)?.index===active.index" @click="move(active.index,1)">往後移</button><button v-if="!schema.source" type="button" class="cms-button" :disabled="modelValue.length<=(schema.min||0)" @click="remove(active.index)">移除此項</button></div><AdminFields :model-value="active.value" :schema="itemSchema" :document-id="documentId" :path="`${path?path+'.':''}${active.index}`" @update:model-value="item(active.index,$event)" /></template><template v-else><div class="cms-items-tools"><strong>{{ label }} <span class="cms-count">{{ rows.length }}</span></strong><button v-if="!schema.source" type="button" class="cms-button" @click="add">{{ schema.newItemLabel?.startsWith('新增')?schema.newItemLabel:'新增'+(schema.newItemLabel||'項目') }}</button></div><input v-if="rows.length>8||search" v-model="search" type="search" :aria-label="`搜尋${label}`" placeholder="搜尋名稱" /><div class="cms-item-list"><button v-for="r in rows.slice((page-1)*10,page*10)" :key="r.key" type="button" class="cms-item-open" @click="choose(r)"><AdminImage v-if="thumbnail(r)" :src="thumbnail(r)" :alt="caption(r)+'縮圖'" /><span>{{ typeof r.value==='object'?caption(r):(schema.item?.format==='media'?'圖片 '+(r.index+1):r.value||'文字 '+(r.index+1)) }}</span><small v-if="typeof r.value?.enabled==='boolean'">{{ r.value.enabled?'官網顯示':'暫不顯示' }}</small><span aria-hidden="true">›</span></button></div><p v-if="!rows.length" class="cms-empty">{{ search?'找不到符合的項目':'目前沒有內容，可從上方新增。' }}</p><div v-if="pages>1" class="cms-actions cms-pagination"><button type="button" class="cms-button" :disabled="page===1" @click="page--">上一頁</button><span>{{ page }} / {{ pages }}</span><button type="button" class="cms-button" :disabled="page===pages" @click="page++">下一頁</button></div></template></section></template>
