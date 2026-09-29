<script setup lang="ts">
definePageMeta({layout:'admin'})
const route=useRoute(),{api}=useCmsAdmin()
const {data:docs,error:loadError}=await useAsyncData<any[]>('cms-home-documents',()=>api('documents'))
const homeDocs=computed(()=>(docs.value||[]).filter(d=>d.category==='首頁').sort((a,b)=>['HomeHero','HomeProject','HomeServices','HomeGallery','HomeWhatWeDo','HomeStoreLocation','HomeStyleMarquee','LogoMarquee'].findIndex(k=>a.id.endsWith(k))-['HomeHero','HomeProject','HomeServices','HomeGallery','HomeWhatWeDo','HomeStoreLocation','HomeStyleMarquee','LogoMarquee'].findIndex(k=>b.id.endsWith(k))))
const selected=computed(()=>typeof route.query.edit==='string'?route.query.edit:homeDocs.value[0]?.id)
</script>
<template><div class="cms-page"><p v-if="loadError" class="cms-error" role="alert">{{ useCmsAdmin().message(loadError) }}</p><nav class="cms-tabs cms-home-tabs" aria-label="首頁區塊"><NuxtLink v-for="d in homeDocs" :key="d.id" :to="{path:'/admin/home',query:{edit:d.id}}" class="cms-button" :class="{'cms-button-gold':selected===d.id}">{{ d.title }}</NuxtLink></nav><AdminResourceEditor v-if="selected" :key="selected" :id="selected" /></div></template>
