<script setup lang="ts">
import {pageEditorLink,searchPages} from '~/shared/cms/page-editors.mjs'
const props=defineProps<{pages?:any[]}>()
const route=useRoute(),query=ref(''),open=ref(false),ready=ref(false),root=ref<HTMLElement>()
const {data:all}=await useCmsPages()
const results=computed(()=>query.value.trim()?searchPages(props.pages||all.value||[],query.value).slice(0,20):[])
function close(){open.value=false}
function outside(event:PointerEvent){if(!root.value?.contains(event.target as Node))close()}
function next(event:KeyboardEvent){if(event.key==='ArrowDown'){event.preventDefault();root.value?.querySelector<HTMLAnchorElement>('.cms-find-results a')?.focus()}}
watch(()=>route.fullPath,()=>{close();query.value=''})
onMounted(()=>{ready.value=true;document.addEventListener('pointerdown',outside)})
onBeforeUnmount(()=>document.removeEventListener('pointerdown',outside))
</script>
<template><div ref="root" class="cms-find" @keydown.esc="close"><input v-model="query" type="search" :disabled="!ready" aria-label="找要修改的內容" placeholder="找要修改的內容，例如：輪播、按鈕、門市" :aria-expanded="open&&!!query.trim()" aria-controls="cms-find-results" @focus="open=true" @input="open=true" @keydown="next" /><div v-if="open&&query.trim()" id="cms-find-results" class="cms-find-results"><NuxtLink v-for="(r,i) in results" :key="r.page.id+':'+(r.block?.id||i)" :to="pageEditorLink(r.page.id,{...route.query,q:query},r.block?.id)"><strong>{{ r.page.title }}</strong><span v-if="r.block">{{ r.block.name }}</span><small>{{ r.page.sectionTitle }}</small></NuxtLink><p v-if="!results.length" role="status">找不到符合的位置，請換個名稱搜尋。</p></div></div></template>
