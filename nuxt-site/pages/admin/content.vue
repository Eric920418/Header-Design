<script setup lang="ts">
import {editorLink,cmsDate} from '~/shared/cms/workflow.mjs'
import {navigationSections,sectionForQuery,matchesWorkspace,orderDesignWorkspaces} from '~/shared/cms/navigation.mjs'
definePageMeta({layout:'admin'})
const route=useRoute(),router=useRouter(),{api,message}=useCmsAdmin()
const section=computed(()=>sectionForQuery(route.query))
const query=computed({get:()=>String(route.query.q||''),set:q=>router.replace({query:{...route.query,q:q||undefined,page:undefined}})}),category=computed({get:()=>String(route.query.group||'全部'),set:group=>router.replace({query:{...route.query,group:group==='全部'?undefined:group,page:undefined}})}),page=computed(()=>Math.max(1,Number(route.query.page)||1))
if(typeof route.query.edit==='string'){
 const target=editorLink(route.query.edit,route.query)
 if(target.path!==route.path||target.query.edit!==route.query.edit||target.query.section!==route.query.section||!!route.query.area)await navigateTo(target,{replace:true})
}
const {data:sections,error,refresh}=await useCmsWorkspaces()
const title=computed(()=>navigationSections(sections.value).find(s=>s.key===section.value)?.label||'全部可修改頁面')
const inArea=computed(()=>{const rows=(sections.value||[]).filter(s=>section.value==='all'||s.section===section.value);return section.value==='design'?orderDesignWorkspaces(rows):rows})
const categories=computed(()=>['全部',...new Set(inArea.value.map(s=>s.pageTitle))])
const filtered=computed(()=>inArea.value.filter(s=>(category.value==='全部'||s.pageTitle===category.value)&&matchesWorkspace(s,query.value)))
watch(categories,values=>{if(!values.includes(category.value))category.value='全部'},{immediate:true})
const pages=computed(()=>Math.max(1,Math.ceil(filtered.value.length/12)))
watch(pages,n=>{if(page.value>n)void router.replace({query:{...route.query,page:n}})})
function changePage(n:number){void router.push({query:{...route.query,page:n===1?undefined:n}})}
</script>
<template><div class="cms-page"><AdminResourceEditor v-if="typeof route.query.edit==='string'" :key="route.query.edit" :id="route.query.edit" /><template v-else><div class="cms-heading"><div><h1>{{ title }}</h1><p class="cms-muted">選擇要修改的頁面或內容</p></div><button class="cms-button" @click="refresh()">重新整理</button></div><div class="cms-content-tools"><label class="cms-search"><input v-model="query" aria-label="搜尋內容" placeholder="搜尋頁面或內容名稱" /></label><select v-if="categories.length>2" v-model="category" aria-label="內容分類"><option v-for="c in categories" :key="c">{{ c }}</option></select></div><div class="cms-section-grid"><NuxtLink v-for="s in filtered.slice((page-1)*12,page*12)" :key="s.id" :to="editorLink(s.id,{...route.query,section:section})" class="cms-section-card cms-panel"><div class="cms-section-photo"><AdminImage v-if="s.thumbnail" :src="s.thumbnail" :alt="s.title+'內容縮圖'" /><span v-else>{{ s.title }}</span></div><div class="cms-section-caption"><strong>{{ s.title }}</strong><span class="cms-status" :class="s.pending?'draft':'published'">{{ s.pending?'有待確認修改':'官網已更新' }}</span><small>{{ s.updatedAt?cmsDate(s.updatedAt):'' }}</small></div></NuxtLink></div><p v-if="!filtered.length&&!error" class="cms-empty">找不到符合的內容，請換個名稱搜尋。</p><div v-if="pages>1" class="cms-actions cms-pagination"><button class="cms-button" :disabled="page<=1" @click="changePage(page-1)">上一頁</button><span>{{ page }} / {{ pages }}</span><button class="cms-button" :disabled="page>=pages" @click="changePage(page+1)">下一頁</button></div></template></div></template>
