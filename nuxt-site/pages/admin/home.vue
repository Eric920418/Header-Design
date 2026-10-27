<script setup lang="ts">
import {editorLink} from '~/shared/cms/workflow.mjs'
definePageMeta({layout:'admin'})
const route=useRoute(),{api,message}=useCmsAdmin()
if(typeof route.query.edit==='string'){
 const target=editorLink(route.query.edit,route.query)
 if(target.path!==route.path||target.query.edit!==route.query.edit||target.query.section!==route.query.section||!!route.query.area)await navigateTo(target,{replace:true})
}
const {data:sections,error,refresh}=await useCmsWorkspaces()
</script>
<template><div class="cms-page"><AdminResourceEditor v-if="typeof route.query.edit==='string'" :key="route.query.edit" :id="route.query.edit" /><template v-else><div class="cms-heading"><div><h1>首頁</h1><p class="cms-muted">選擇要修改的區塊</p></div><a href="/" target="_blank" rel="noopener noreferrer" class="cms-button">查看官網 ↗</a></div><div class="cms-section-grid"><NuxtLink v-for="(s,i) in sections?.filter(s=>s.area==='home')" :key="s.id" :to="editorLink(s.id)" class="cms-section-card cms-panel"><div class="cms-section-photo"><AdminImage v-if="s.thumbnail" :src="s.thumbnail" :alt="s.title+'官網內容縮圖'" /><span v-else>{{ s.title }}</span><span class="cms-section-order">{{ String(i+1).padStart(2,'0') }}</span></div><div class="cms-section-caption"><strong>{{ s.title }}</strong><span class="cms-status" :class="s.pending?'draft':'published'">{{ s.missing?'內容尚未備齊':s.pending?'有待確認修改':'官網已更新' }}</span><small>{{ s.updatedAt?new Date(s.updatedAt).toLocaleString('zh-TW'):'' }}</small></div></NuxtLink></div></template></div></template>
