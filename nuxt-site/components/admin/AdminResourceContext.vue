<script setup lang="ts">
import { ArrowUpRight, CornerDownRight } from 'lucide-vue-next'
import { resourceGuide } from '~/shared/cms/presentation.mjs'
const props=defineProps<{id:string}>()
const guide=computed(()=>resourceGuide(props.id))
const entries=computed(()=>(guide.value?.related||[]).map((id:string)=>({id,guide:resourceGuide(id)})).filter((entry:any)=>entry.guide))
const sectionLabel=computed(()=>guide.value?.location[1]||'內容區塊')
</script>

<template>
  <section v-if="guide" class="cms-panel cms-location-context" aria-label="官網位置與影響範圍">
    <figure class="cms-location-diagram" :aria-label="`${guide.title}的官網位置示意`">
      <figcaption>官網位置示意</figcaption>
      <div class="cms-diagram-page" :data-layout="guide.visual">
        <div class="cms-diagram-nav" :class="{'is-target':guide.visual==='navigation'}">主選單</div>
        <div class="cms-diagram-hero" :class="{'is-target':guide.visual==='hero'}">{{ guide.visual==='hero'?sectionLabel:'主視覺' }}</div>
        <div v-if="!['hero','navigation','footer'].includes(guide.visual)" class="cms-diagram-content is-target">
          <strong>{{ sectionLabel }}</strong>
          <div v-if="guide.visual==='cards'" class="cms-diagram-cards"><span /><span /><span /></div>
          <div v-else-if="guide.visual==='store'" class="cms-diagram-store"><span /><div><i /><i /><i /></div></div>
          <div v-else class="cms-diagram-lines"><i /><i /><i /></div>
        </div>
        <div v-else class="cms-diagram-placeholder"><i /><i /></div>
        <div class="cms-diagram-footer" :class="{'is-target':guide.visual==='footer'}">頁尾</div>
      </div>
    </figure>
    <div class="cms-location-details">
      <div class="cms-location-heading"><div><p class="cms-location-eyebrow">正在編輯的官網位置</p><ol class="cms-location-trail" aria-label="內容對應位置"><li v-for="(part,index) in guide.location" :key="index">{{ part }}</li></ol></div><a :href="guide.href" target="_blank" rel="noopener noreferrer" class="cms-button cms-location-open">查看官網位置<ArrowUpRight :size="16" /></a></div>
      <p class="cms-location-summary">{{ guide.summary }}</p>
      <div class="cms-location-impacts"><h2>影響範圍 <span>{{ guide.impacts.length }} 處</span></h2><ul><li v-for="item in guide.impacts" :key="item.label"><a :href="item.href" target="_blank" rel="noopener noreferrer">{{ item.label }}<ArrowUpRight :size="13" aria-hidden="true" /></a></li></ul></div>
      <div v-if="entries.length" class="cms-related-editors"><h2>相關編輯入口</h2><div><NuxtLink v-for="entry in entries" :key="entry.id" :to="{path:'/admin/content',query:{edit:entry.id}}" class="cms-related-entry"><CornerDownRight :size="14" />{{ guide.relatedLabels?.[entry.id]||entry.guide.title }}</NuxtLink></div></div>
    </div>
  </section>
  <p v-else class="cms-error" role="alert">此內容尚未設定官網位置說明，請先確認位置再修改。</p>
</template>
