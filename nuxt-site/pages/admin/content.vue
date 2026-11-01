<script setup lang="ts">
import {cmsDate} from '~/shared/cms/workflow.mjs'
import {navigationSections,sectionForQuery} from '~/shared/cms/navigation.mjs'
import {pageEditorLink,legacyPageLink,searchPages} from '~/shared/cms/page-editors.mjs'
definePageMeta({layout:'admin'})
const route=useRoute(),router=useRouter(),{message}=useCmsAdmin()
if(typeof route.query.edit==='string')await navigateTo(legacyPageLink(route.query.edit,route.query),{replace:true})
const section=computed(()=>sectionForQuery(route.query))
const {data:workspaces}=await useCmsWorkspaces()
const {data:pages,error,refresh}=await useCmsPages()
const title=computed(()=>navigationSections(workspaces.value).find(s=>s.key===section.value)?.label||'全部可修改頁面')
const searchTerm=ref(String(route.query.q||''))
const ready=ref(false)
onMounted(()=>ready.value=true)
const query=computed({get:()=>searchTerm.value,set:q=>{searchTerm.value=q;void router.replace({query:{...route.query,q:q||undefined,page:undefined}})}})
watch(()=>route.query.q,q=>{searchTerm.value=String(q||'')})
const page=computed(()=>Math.max(1,Number(route.query.page)||1))
const results=computed(()=>searchPages((pages.value||[]).filter(p=>section.value==='all'||p.section===section.value),query.value))
const count=computed(()=>Math.max(1,Math.ceil(results.value.length/12)))
watch(count,n=>{if(page.value>n)void router.replace({query:{...route.query,page:n===1?undefined:n}})})
function changePage(n:number){void router.push({query:{...route.query,page:n===1?undefined:n}})}
</script>
<template><div class="cms-page"><AdminPageEditor v-if="typeof route.query.sitePage==='string'" :key="route.query.sitePage" :id="route.query.sitePage" /><template v-else><div class="cms-heading"><h1>{{ title }}</h1><button type="button" class="cms-button" @click="refresh()">重新整理</button></div><div class="cms-content-tools"><label class="cms-search"><input v-model="query" type="search" :disabled="!ready" aria-label="找要修改的內容" placeholder="找要修改的內容，例如：輪播、按鈕、門市" /></label></div><p v-if="error" class="cms-error" role="alert">{{ message(error) }} <button type="button" class="cms-button" @click="refresh()">重試</button></p><div class="cms-section-grid"><NuxtLink v-for="(r,i) in results.slice((page-1)*12,page*12)" :key="r.page.id+':'+(r.block?.id||i)" :to="pageEditorLink(r.page.id,{...route.query,q:query||undefined},r.block?.id)" class="cms-section-card cms-panel"><div class="cms-section-photo"><AdminImage v-if="r.page.thumbnail" :src="r.page.thumbnail" :alt="r.page.title+'官網內容縮圖'" /><span v-else>{{ r.page.title }}</span></div><div class="cms-section-caption"><strong>{{ r.page.title }}</strong><span v-if="r.block" class="cms-card-location">{{ r.block.name }}</span><span class="cms-status" :class="r.page.pending?'draft':'published'">{{ r.page.pending?'有待確認修改':'官網已更新' }}</span><small>{{ r.page.updatedAt?cmsDate(r.page.updatedAt):'' }}</small></div></NuxtLink></div><p v-if="!results.length&&!error" class="cms-empty">找不到符合的位置，請換個名稱搜尋。</p><div v-if="count>1" class="cms-actions cms-pagination"><button type="button" class="cms-button" :disabled="page<=1" @click="changePage(page-1)">上一頁</button><span>{{ page }} / {{ count }}</span><button type="button" class="cms-button" :disabled="page>=count" @click="changePage(page+1)">下一頁</button></div></template></div></template>
