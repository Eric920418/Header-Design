<script setup lang="ts">
import {destinationGroups,destinationName} from '~/shared/cms/navigation.mjs'

const {data:workspaces}=useNuxtData<any[]>('cms-workspaces')
const {data:sitePages}=useNuxtData<any[]>('cms-pages')
const props=defineProps<{modelValue:string;label:string;invalid?:boolean;describedby?:string;autoDestination?:boolean;readonly?:boolean}>()
const emit=defineEmits<{'update:modelValue':[value:string|undefined]}>()
const groups=computed(()=>destinationGroups(sitePages.value||[],workspaces.value||[]))
const custom=ref(false)
const selected=computed(()=>{
 if(props.autoDestination&&!props.modelValue)return 'default'
 if(!props.modelValue)return ''
 return props.modelValue==='/'||groups.value.some(group=>group.links.some(page=>page.href===props.modelValue))?props.modelValue:'current'
})
const currentName=computed(()=>destinationName(props.modelValue,groups.value))
function choose(event:Event){
 const value=(event.target as HTMLSelectElement).value
 custom.value=value==='custom'
 if(!custom.value&&value!=='current')emit('update:modelValue',value==='default'?undefined:value)
}
function updateUrl(event:Event){
 const value=(event.target as HTMLInputElement).value
 emit('update:modelValue',props.autoDestination&&!value?undefined:value)
}
</script>
<template>
 <div class="cms-field">
  <label v-if="props.readonly">{{ label }}<input :value="modelValue" readonly :aria-describedby="describedby" /></label>
  <label v-else>{{ label }}
   <select :aria-invalid="invalid" :aria-describedby="describedby" :value="custom?'custom':selected" @change="choose">
    <option value="" disabled>選擇官網頁面</option>
    <option v-if="autoDestination" value="default">沿用既有連結</option>
    <option value="/">首頁</option>
    <option v-if="selected==='current'" value="current">{{ currentName }}</option>
    <optgroup v-for="group in groups" :key="group.key" :label="group.label">
     <option v-for="page in group.links" :key="page.href" :value="page.href">{{ page.title }}</option>
    </optgroup>
    <option value="custom">自行輸入連結</option>
   </select>
  </label>
  <label v-if="custom&&!props.readonly">連結網址
   <input :aria-invalid="invalid" :aria-describedby="describedby" :value="modelValue" placeholder="https://…、tel:… 或 mailto:…" @input="updateUrl" />
  </label>
  <p v-if="modelValue" class="cms-link-current">目前輸入的連結<code>{{ modelValue }}</code></p>
  <p v-else-if="autoDestination" class="cms-field-help">沿用官網原本連結，尚未另外設定。</p>
 </div>
</template>
