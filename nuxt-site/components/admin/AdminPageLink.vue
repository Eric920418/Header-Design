<script setup lang="ts">
import {destinationGroups} from '~/shared/cms/navigation.mjs'

const {data:workspaces}=useNuxtData<any[]>('cms-workspaces')
const {data:sitePages}=useNuxtData<any[]>('cms-pages')
const props=defineProps<{modelValue:string;label:string;invalid?:boolean;describedby?:string;autoDestination?:boolean}>()
const emit=defineEmits<{'update:modelValue':[value:string|undefined]}>()
const groups=computed(()=>destinationGroups(sitePages.value||[],workspaces.value||[]))
const custom=ref(false)
const selected=computed(()=>{
 if(props.autoDestination&&!props.modelValue)return 'default'
 return props.modelValue==='/'||groups.value.some(group=>group.links.some(page=>page.href===props.modelValue))?props.modelValue:'custom'
})
function choose(event:Event){
 const value=(event.target as HTMLSelectElement).value
 custom.value=value==='custom'
 if(!custom.value)emit('update:modelValue',value==='default'?undefined:value)
}
function updateUrl(event:Event){
 const value=(event.target as HTMLInputElement).value
 emit('update:modelValue',props.autoDestination&&!value?undefined:value)
}
</script>
<template>
 <div class="cms-field">
  <label>{{ label }}
   <select :aria-invalid="invalid" :aria-describedby="describedby" :value="custom?'custom':selected" @change="choose">
    <option value="" disabled>選擇官網頁面</option>
    <option v-if="autoDestination" value="default">沿用既有連結</option>
    <option value="/">首頁</option>
    <optgroup v-for="group in groups" :key="group.key" :label="group.label">
     <option v-for="page in group.links" :key="page.href" :value="page.href">{{ page.title }}</option>
    </optgroup>
    <option value="custom">其他網址、電話或電子郵件</option>
   </select>
  </label>
  <label v-if="custom||selected==='custom'">連結網址
   <input :aria-invalid="invalid" :aria-describedby="describedby" :value="modelValue" placeholder="https://…、tel:… 或 mailto:…" @input="updateUrl" />
  </label>
 </div>
</template>
