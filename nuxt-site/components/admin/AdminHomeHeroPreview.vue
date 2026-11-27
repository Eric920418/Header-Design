<script setup lang="ts">
import {ChevronRight} from 'lucide-vue-next'
import {homeHeroPosition} from '~/shared/cms/workbench.mjs'
const props=defineProps<{bodies:Record<string,any>;selected?:any;focusedField?:string}>()
const view=computed(()=>homeHeroPosition(props.bodies,props.selected))
const focus=(...paths:string[])=>paths.includes(props.focusedField||'')
const alternate=computed(()=>focus('copy.text8','copy.text9'))
</script>
<template>
 <div class="cms-home-hero-preview" aria-label="首頁輪播位置示意">
  <div class="cms-position-sitebar"><span>設計案例 · 廚房產品 · 門市與服務</span><img src="/home-2026/logos/sakura-kitchen-horizontal.svg" alt="SAKURA KITCHEN" /><span>品牌承諾 · 我要加盟</span></div>
  <div v-if="view.slide?.image" class="cms-home-hero-frame" :class="{'is-focused':focus('slides.'+view.index+'.route')}" :style="{'--hero-pan-x':view.pan}">
   <HomeHeroImage :slide="view.slide" viewport="desktop" :alt="(view.slide.title||'首頁輪播')+'官網裁切位置'" image-class="hero-page1-image-settled" />
   <div class="cms-home-hero-shade" aria-hidden="true" />
   <div class="cms-home-hero-copy"><h3 class="font-display">{{ view.slide.title }}</h3><p>{{ view.slide.description }}</p></div>
   <span v-if="view.copy.text11" class="cms-home-series-label" :class="{'is-focused':focus('copy.text11')}"><ChevronRight :size="14" aria-hidden="true" /><span>{{ view.copy.text11 }}</span></span>
   <div class="cms-home-hero-bottom"><span v-if="view.copy.text6||view.copy.text7" class="cms-home-hero-button" :class="{'is-focused':focus('copy.text6','copy.text7','copy.text8','copy.text9','copy.field5')}">{{ alternate?view.copy.text8:view.copy.text6 }}<br />{{ alternate?view.copy.text9:view.copy.text7 }}</span><span class="cms-home-watermark font-display" :class="{'is-focused':focus('copy.text10')}">{{ view.copy.text10 }}</span></div>
  </div>
  <p v-else class="cms-home-hero-empty">尚未選擇輪播圖片，按「編輯」後可選擇或上傳。</p>
  <div v-if="view.styles.length" class="cms-home-style-strip" aria-label="輪播下方的設計風格入口"><div v-for="(style,index) in view.styles.slice(0,3)" :key="index"><AdminThumbnail :src="style.logo" :alt="style.zh+'風格圖示'" contain /><span><strong>{{ style.zh }}</strong><small>{{ style.en }}</small></span></div></div>
 </div>
</template>
