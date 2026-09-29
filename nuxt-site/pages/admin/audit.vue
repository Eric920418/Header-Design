<script setup lang="ts">
definePageMeta({layout:'admin'})
const {api}=useCmsAdmin()
const {data:rows,error:loadError}=await useAsyncData<any[]>('cms-audit',()=>api('audit'))
</script>
<template><div class="cms-page"><p v-if="loadError" class="cms-error" role="alert">{{ useCmsAdmin().message(loadError) }}</p><div class="cms-heading"><h1>操作紀錄</h1></div><p class="cms-muted">最近 200 筆操作</p><div class="cms-panel"><div v-for="row in rows" :key="row.sequence" class="cms-resource-row"><div><strong>{{ row.actorName||'系統' }} · {{ row.action }}</strong><small>{{ row.subject }}</small></div><time>{{ new Date(row.createdAt).toLocaleString('zh-TW') }}</time></div></div></div></template>
