<script setup lang="ts">
import { homeResources, resourceGuide } from '~/shared/cms/presentation.mjs'
definePageMeta({layout:'admin'})
const route=useRoute(),{api}=useCmsAdmin()
const {data:docs,error:loadError}=await useAsyncData<any[]>('cms-home-documents',()=>api('documents'))
const homeDocs=computed(()=>homeResources.map((id:string)=>(docs.value||[]).find(d=>d.id===id)).filter(Boolean))
const selected=computed(()=>typeof route.query.edit==='string'?route.query.edit:homeDocs.value[0]?.id)
</script>
<template><div class="cms-page"><p v-if="loadError" class="cms-error" role="alert">{{ useCmsAdmin().message(loadError) }}</p><nav class="cms-tabs cms-home-tabs" aria-label="首頁區塊"><NuxtLink v-for="d in homeDocs" :key="d.id" :to="{path:'/admin/home',query:{edit:d.id}}" class="cms-button" :class="{'cms-button-gold':selected===d.id}">{{ resourceGuide(d.id)?.tabTitle||d.title }}</NuxtLink></nav><AdminResourceEditor v-if="selected" :key="selected" :id="selected" /></div></template>
