<script setup lang="ts">
import {workspaces} from '~/shared/cms/workflow.mjs'
const props=defineProps<{modelValue:string;label:string;invalid?:boolean}>(),emit=defineEmits<{'update:modelValue':[value:string]}>()
const pages=[...new Map([{href:'/',title:'首頁'},...workspaces].map(w=>[w.href,{href:w.href,title:w.title}])).values()]
const custom=ref(false)
const selected=computed(()=>pages.some(p=>p.href===props.modelValue)?props.modelValue:'custom')
function choose(event:Event){const v=(event.target as HTMLSelectElement).value;custom.value=v==='custom';if(v!=='custom')emit('update:modelValue',v)}
</script>
<template><div class="cms-field"><label>{{ label }}<select :aria-invalid="invalid" :value="custom?'custom':selected" @change="choose"><option value="" disabled>選擇官網頁面</option><option v-for="p in pages" :key="p.href" :value="p.href">{{ p.title }}</option><option value="custom">其他網址、電話或電子郵件</option></select></label><label v-if="custom||selected==='custom'">連結網址<input :aria-invalid="invalid" :value="modelValue" placeholder="https://…、tel:… 或 mailto:…" @input="emit('update:modelValue',($event.target as HTMLInputElement).value)" /></label></div></template>
