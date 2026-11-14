<script setup lang="ts">
import {positionContent} from '~/shared/cms/workbench.mjs'
const props=defineProps<{block:any;bodies:Record<string,any>;selected?:any;pageTitle:string}>()
const content=computed(()=>positionContent(props.block,props.bodies,props.selected))
</script>
<template>
 <section class="cms-position" aria-label="官網位置示意">
  <header><h2>官網位置預覽</h2><span class="cms-position-badge">位置示意</span></header>
  <div class="cms-position-trail">{{ pageTitle }}<span aria-hidden="true"> › </span>{{ block?.name }}<template v-if="selected"> › {{ selected.caption }}</template></div>
  <div class="cms-position-page" :data-kind="content.kind">
   <div class="cms-position-sitebar"><span>設計案例 · 廚房產品 · 門市與服務</span><img src="/home-2026/logos/sakura-kitchen-horizontal.svg" alt="SAKURA KITCHEN" /><span>品牌承諾 · 我要加盟</span></div>
   <div v-if="content.image" class="cms-position-picture" :class="{'is-hero':content.kind==='hero'}">
    <HomeHeroImage v-if="content.kind==='hero'&&content.value?.image" :slide="content.value" viewport="desktop" :alt="content.title+'位置示意'" image-class="hero-page1-image-settled" />
    <AdminImage v-else :src="content.image" :alt="content.title+'位置示意'" />
    <div v-if="content.kind==='hero'" class="cms-position-hero-copy"><strong>{{ content.title }}</strong><p>{{ content.description }}</p><span>Kitchen</span></div>
   </div>
   <div v-else class="cms-position-diagram" :aria-label="block?.name+'的位置'">
    <div>頁面主視覺</div><div class="is-target"><span>目前修改位置</span><strong>{{ block?.name }}</strong><i /><i /><i /></div><div>頁尾</div>
   </div>
   <div v-if="content.kind!=='hero'" class="cms-position-caption"><strong>{{ content.title }}</strong><p v-if="content.description">{{ content.description }}</p></div>
   <div v-if="content.kind==='hero'" class="cms-position-styles"><span>現代風</span><span>輕奢風</span><span>北歐風</span><span>工業風</span><span>美式風</span></div>
  </div>
  <p class="cms-position-note">示意修改位置；完整畫面請按「預覽效果」。</p>
 </section>
</template>
