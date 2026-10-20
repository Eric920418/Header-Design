<script setup lang="ts">
import { ArrowUpRight } from 'lucide-vue-next'
import { resourceGuide, resourceSearchText } from '~/shared/cms/presentation.mjs'
definePageMeta({layout:'admin'})
const route=useRoute(),{api,message}=useCmsAdmin()
const query=ref(''),category=ref('全部'),page=ref(1)
const {data:docs,refresh,error:loadError}=await useAsyncData<any[]>('cms-documents',()=>api('documents'))
const categories=computed(()=>['全部',...new Set((docs.value||[]).map(d=>d.category))])
const filtered=computed(()=>(docs.value||[]).filter(d=>(category.value==='全部'||d.category===category.value)&&resourceSearchText(d).includes(query.value.trim().toLowerCase())))
watch([query,category],()=>page.value=1)
</script>

<template>
  <div class="cms-page">
    <p v-if="loadError" class="cms-error" role="alert">{{ message(loadError) }}</p>
    <AdminResourceEditor v-if="typeof route.query.edit==='string'" :key="route.query.edit" :id="route.query.edit" />
    <template v-else>
      <div class="cms-heading"><h1>網站內容</h1><button class="cms-button" @click="refresh()">重新整理</button></div>
      <p class="cms-muted">依官網位置選擇內容。共用資料會同步影響列出的頁面。</p>
      <div class="cms-content-tools"><label class="cms-search"><input v-model="query" aria-label="搜尋內容" placeholder="搜尋頁面、區塊或內容，例如：首頁 品牌系列" /></label><select v-model="category" aria-label="內容分類"><option v-for="c in categories" :key="c">{{ c }}</option></select></div>
      <div class="cms-panel cms-resource-list">
        <article v-for="d in filtered.slice((page-1)*20,page*20)" :key="d.id" class="cms-guided-resource">
          <NuxtLink :to="{path:'/admin/content',query:{edit:d.id}}" class="cms-resource-edit">
            <span class="cms-resource-location">{{ resourceGuide(d.id)?.location.join(' → ')||'位置說明尚未設定' }}</span>
            <strong>{{ resourceGuide(d.id)?.title||d.title }}</strong>
            <span class="cms-resource-effects">影響：{{ resourceGuide(d.id)?.impacts.map((i:any)=>i.label).join('；') }}</span>
          </NuxtLink>
          <div class="cms-resource-controls"><span class="cms-status" :class="d.publishedId===d.draftId?'published':'draft'">{{ !d.publishedId?'未發布':d.publishedId===d.draftId?'已發布':'有新草稿' }}</span><a v-if="resourceGuide(d.id)" :href="resourceGuide(d.id).href" :aria-label="`查看官網位置：${resourceGuide(d.id).title}`" target="_blank" rel="noopener noreferrer" class="cms-resource-visit">查看官網位置<ArrowUpRight :size="14" /></a></div>
        </article>
        <p v-if="!filtered.length" class="cms-empty">沒有符合的內容，請改用頁面或區塊名稱搜尋。</p>
      </div>
      <div class="cms-actions cms-pagination"><button class="cms-button" :disabled="page<=1" @click="page--">上一頁</button><span>{{ page }} / {{ Math.max(1,Math.ceil(filtered.length/20)) }}</span><button class="cms-button" :disabled="page*20>=filtered.length" @click="page++">下一頁</button></div>
    </template>
  </div>
</template>
