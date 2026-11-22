<script setup lang="ts">
import {ArrowRight,ChevronDown,SlidersHorizontal} from 'lucide-vue-next'
import {inspirationPosition} from '~/shared/cms/workbench.mjs'
const props=defineProps<{kind:string;bodies:Record<string,any>;presentation?:any;selected?:any;focusedField?:string}>()
const view=computed(()=>inspirationPosition(props.bodies,props.presentation,props.selected))
const target=(part:string)=>props.kind==='inspiration-'+part
const filterReading=computed(()=>target('filters')&&['copy.text2','copy.text3','copy.text4'].includes(props.focusedField||'')?view.value.copy[props.focusedField!.split('.').at(-1)!]:null)
</script>
<template>
 <div class="cms-inspiration-position">
  <div class="cms-position-sitebar"><span>設計案例 · 廚房產品 · 門市與服務</span><img src="/home-2026/logos/sakura-kitchen-horizontal.svg" alt="SAKURA KITCHEN" /><span>品牌承諾 · 我要加盟</span></div>
  <div class="cms-inspiration-hero" :class="{'is-target':target('hero')}">
   <AdminThumbnail :src="view.heroImage" alt="設計靈感頁面主視覺背景" /><div class="cms-inspiration-hero-copy">
    <h3>{{ view.copy.text1 }}</h3>
    <div class="cms-inspiration-trail" :class="{'is-target':target('breadcrumb')}">
     <span>{{ view.breadcrumb.breadcrumbHome }} / {{ view.breadcrumb.breadcrumbList }}</span>
    </div>
   </div>
  </div>
  <div class="cms-inspiration-screen">
   <div v-if="target('breadcrumb')" class="cms-inspiration-trail-sample is-target">
    <small>案例內頁上方</small>
    <p>{{ view.breadcrumb.breadcrumbHome }} / {{ view.breadcrumb.breadcrumbList }} / {{ view.breadcrumb.breadcrumbDetail }}</p>
   </div>
   <template v-else-if="!target('detail')">
    <div class="cms-inspiration-filters" :class="{'is-target':target('filters')}">
     <span :class="{'is-focused':focusedField==='copy.text3'}" :aria-label="view.copy.text3">全部型式 <ChevronDown :size="11" /></span>
     <span :class="{'is-focused':focusedField==='copy.text4'}" :aria-label="view.copy.text4">全部風格 <ChevronDown :size="11" /></span>
     <span class="cms-inspiration-filter-button" :class="{'is-focused':focusedField==='copy.text5'}">{{ view.copy.text5 }} <ArrowRight :size="15" /></span>
    </div>
    <div v-if="filterReading!==null" class="cms-inspiration-reading is-target"><small>螢幕閱讀器會讀到</small><p>{{ filterReading }}</p></div>
    <div v-if="target('results')" class="cms-inspiration-reading is-target"><small>螢幕閱讀器朗讀範例</small><p>{{ view.copy.text6 }}<b>筆數</b>{{ view.copy.text7 }}</p></div>
    <div v-if="target('empty')" class="cms-inspiration-empty is-target"><SlidersHorizontal :size="28" /><h4>{{ view.copy.text9 }}</h4><p>{{ view.copy.text10 }}</p><span>{{ view.copy.text11 }}</span></div>
    <div v-else class="cms-inspiration-cards" :class="{'is-target':target('cases')||target('card-button')}">
     <article v-for="(c,index) in view.cases" :key="c.slug||index" :class="{'is-selected':c.selected}"><div><AdminThumbnail v-if="c.image" :src="c.image" :alt="c.title+'案例圖片'" /><span v-if="target('cases')||target('card-button')||focusedField==='copy.text8'" class="cms-inspiration-view">{{ view.copy.text8 }}</span></div><h4>{{ c.title }}</h4><small v-if="c.enabled===false" class="cms-case-hidden-note">下架後不顯示</small><p v-if="c.description" class="cms-field-help">{{ c.description }}</p></article>
     <div v-if="!view.cases.length" class="cms-inspiration-no-cases">目前沒有可顯示的案例。</div>
    </div>
   </template>
   <div v-else class="cms-inspiration-detail is-target"><h4>{{ view.detailCase?.title }}</h4><AdminThumbnail v-if="view.detailCase?.image" :src="view.detailCase.image" :alt="view.detailCase.title+'案例內頁圖片'" /><p v-else>{{ view.detail.text1 }}</p><section><strong>{{ view.detail.text2 }}</strong><span>型式／風格等案例資料</span></section><span class="cms-inspiration-return">← {{ view.detail.text3 }}</span></div>
  </div>
 </div>
</template>
