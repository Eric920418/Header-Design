<script setup lang="ts">
import { galleryCaseRoute, galleryCaseLabel, galleryCaseEntry } from '~/shared/cms/gallery-cases.mjs'
const props=defineProps<{modelValue:any[];label:string}>()
const emit=defineEmits<{'update:modelValue':[value:any[]]}>()
const {api,message}=useCmsAdmin()
const hintId=useId()
const picking=ref<number|null>(null),library=ref<any[]>([]),loading=ref(false),error=ref(''),query=ref(''),page=ref(1),openSlug=ref('')
const filtered=computed(()=>library.value.filter(i=>`${i.store} ${i.title} ${i.slug} ${i.source}`.toLowerCase().includes(query.value.trim().toLowerCase())))
const selected=computed(()=>new Set(props.modelValue.filter((_,index)=>index!==picking.value).map(i=>i.slug)))
watch(query,()=>page.value=1)
async function load(){loading.value=true;error.value='';try{library.value=await api('case-library')}catch(e){error.value=message(e)}finally{loading.value=false}}
function open(index:number,event:Event){(event.currentTarget as HTMLButtonElement).focus();query.value='';page.value=1;picking.value=index;void load()}
function choose(option:any){if(selected.value.has(option.slug)||!option.image)return;const entry=galleryCaseEntry(option),next=[...props.modelValue];if(picking.value===-1)next.push(entry);else if(picking.value!==null)next[picking.value]=entry;else return;emit('update:modelValue',next);openSlug.value=entry.slug;picking.value=null}
function set(index:number,key:string,value:string){emit('update:modelValue',props.modelValue.map((item,i)=>i===index?{...item,[key]:value}:item))}
function move(index:number,step:number){const next=[...props.modelValue],other=index+step;if(other<0||other>=next.length)return;[next[index],next[other]]=[next[other],next[index]];emit('update:modelValue',next)}
function remove(index:number){if(props.modelValue.length>1)emit('update:modelValue',props.modelValue.filter((_,i)=>i!==index))}
</script>

<template>
  <section class="cms-array cms-home-cases" :aria-label="'首頁'+label">
    <div class="cms-section-heading"><strong>{{ label }} <span class="cms-count">{{ modelValue.length }}</span></strong><button type="button" class="cms-button" @click="open(-1,$event)">新增案例</button></div>
    <details v-for="(item,index) in modelValue" :key="item.slug" class="cms-array-row" :open="openSlug===item.slug">
      <summary>{{ galleryCaseLabel(item) }}</summary>
      <div class="cms-actions">
        <button type="button" class="cms-button" :disabled="index===0" @click="move(index,-1)">上移</button><button type="button" class="cms-button" :disabled="index===modelValue.length-1" @click="move(index,1)">下移</button><button type="button" class="cms-button" :disabled="modelValue.length<=1" @click="remove(index)">移除此項</button>
        <button type="button" class="cms-button" @click="open(index,$event)">更換案例</button><a :href="galleryCaseRoute(item)" target="_blank" rel="noopener noreferrer" class="cms-button">查看案例 ↗</a>
      </div>
      <div class="cms-fields cms-home-case-fields">
        <label class="cms-field">案例識別碼<input :value="item.slug" readonly /></label>
        <label v-if="item.title" class="cms-field">案例標題<input :value="item.title" readonly /></label>
        <div class="cms-field"><label>門市名稱<input :value="item.store" :aria-describedby="item.store?undefined:`${hintId}-${index}`" @input="set(index,'store',($event.target as HTMLInputElement).value)" /></label><p v-if="!item.store" :id="`${hintId}-${index}`" class="cms-field-help">案例庫未提供門市名稱，可在此補填。</p></div>
        <AdminFields :model-value="item.image" :schema="{type:'string',format:'media',label:'案例圖片'}" label="image" @update:model-value="set(index,'image',$event)" />
        <label class="cms-field">案例連結<input :value="galleryCaseRoute(item)" readonly /></label>
      </div>
    </details>
    <AdminDialog :open="picking!==null" :title="picking===-1?'新增案例':'更換案例'" wide @close="picking=null">
      <div class="cms-content-tools"><label class="cms-search"><input v-model="query" aria-label="搜尋案例庫" placeholder="搜尋門市、案例名稱或識別碼" /></label><button class="cms-button" :disabled="loading" @click="load">重新整理</button></div>
      <p v-if="error" class="cms-error" role="alert">{{ error }}</p>
      <p v-if="loading" role="status">正在載入已發布案例…</p>
      <template v-else-if="!error">
        <p class="cms-field-help">僅列出已發布案例。已選案例不能重複加入；原始資料未提供門市時，選取後可補填。</p>
        <div class="cms-media-grid cms-case-library">
          <article v-for="option in filtered.slice((page-1)*12,page*12)" :key="option.slug" class="cms-case-option">
            <button type="button" class="cms-media-card" :class="{selected:selected.has(option.slug)}" :disabled="selected.has(option.slug)||!option.image" :aria-label="`選取${galleryCaseLabel(option)}（${option.slug}）`" @click="choose(option)">
              <div class="cms-media-photo"><AdminImage v-if="option.image" :src="option.image" :alt="option.title||option.store" /><span v-else class="cms-pdf-tile">尚未設定圖片</span></div>
              <div class="cms-media-caption"><strong>{{ option.title||option.store }}</strong><span>{{ option.store||'未提供門市名稱' }}</span><span>{{ option.source }} · {{ option.slug.slice(0,8) }}{{ selected.has(option.slug)?' · 已選取':'' }}</span></div>
            </button>
            <a :href="option.route" target="_blank" rel="noopener noreferrer" class="cms-case-option-link">查看案例 ↗</a>
          </article>
        </div>
        <p v-if="!filtered.length" class="cms-empty">沒有符合的已發布案例。</p>
        <div v-if="filtered.length>12" class="cms-actions cms-pagination"><button type="button" class="cms-button" :disabled="page===1" @click="page--">上一頁</button><span>{{ page }} / {{ Math.ceil(filtered.length/12) }}</span><button type="button" class="cms-button" :disabled="page*12>=filtered.length" @click="page++">下一頁</button></div>
      </template>
    </AdminDialog>
  </section>
</template>
