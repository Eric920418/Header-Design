<script setup lang="ts">
import {ArrowRight,ChevronDown,SlidersHorizontal} from 'lucide-vue-next'
import {inspirationPosition} from '~/shared/cms/workbench.mjs'
const props=defineProps<{kind:string;bodies:Record<string,any>;presentation?:any;selected?:any;focusedField?:string}>()
const view=computed(()=>inspirationPosition(props.bodies,props.presentation,props.selected))
const target=(part:string)=>props.kind==='inspiration-'+part
const sourceLabels:Record<string,string>={'門市案例':'門市案例','自建案例':'自建案例','來源案例':'系統同步','系統同步':'系統同步'}
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
    <div v-if="target('empty')" class="cms-inspiration-empty is-target"><SlidersHorizontal :size="28" /><h4 :class="{'is-focused':focusedField==='copy.text9'}">{{ view.copy.text9 }}</h4><p :class="{'is-focused':focusedField==='copy.text10'}">{{ view.copy.text10 }}</p><span :class="{'is-focused':focusedField==='copy.text11'}">{{ view.copy.text11 }}</span></div>
    <template v-else>
     <div v-if="target('cases')" class="cms-case-preview-note">
      <h4>{{ selected?'所選案例的卡片示意':'官網上目前的案例' }}</h4>
      <p>卡片下方標示來源，可分辨門市、自建與系統同步的案例。</p>
     </div>
     <div class="cms-inspiration-cards" :class="{'is-target':target('card-button')}">
      <article v-for="(c,index) in view.cases" :key="c.slug||index" :class="{'is-selected':c.selected}">
       <div><AdminThumbnail v-if="c.image" :src="c.image" :alt="c.title+'案例圖片'" /><p v-else-if="c.selected" class="cms-case-missing-cover">選擇案例列表封面後，圖片會顯示在這裡。</p><span v-if="c.image&&(target('cases')||target('card-button')||focusedField==='copy.text8')" class="cms-inspiration-view" :class="{'is-focused':focusedField==='copy.text8'&&index===0}">{{ view.copy.text8 }}</span></div>
       <small v-if="target('cases')&&sourceLabels[c.source]" class="cms-case-source">{{ sourceLabels[c.source] }}</small>
       <h4>{{ c.title }}</h4>
       <small v-if="c.enabled===false" class="cms-case-hidden-note">更新官網後隱藏</small>
       <p v-if="c.description" class="cms-field-help">{{ c.description }}</p>
      </article>
      <div v-if="!view.cases.length" class="cms-inspiration-no-cases">目前沒有可顯示的案例。</div>
     </div>
    </template>
   </template>
   <div v-else class="cms-inspiration-detail is-target"><h4>{{ view.detailCase?.title }}</h4><AdminThumbnail v-if="view.detailCase?.image&&focusedField!=='copy.text1'" :src="view.detailCase.image" :alt="view.detailCase.title+'案例內頁圖片'" /><p v-else :class="{'is-focused':focusedField==='copy.text1'}">{{ view.detail.text1 }}</p><section><strong :class="{'is-focused':focusedField==='copy.text2'}">{{ view.detail.text2 }}</strong><span>型式／風格等案例資料</span></section><span class="cms-inspiration-return" :class="{'is-focused':focusedField==='copy.text3'}">← {{ view.detail.text3 }}</span></div>
  </div>
 </div>
</template>
