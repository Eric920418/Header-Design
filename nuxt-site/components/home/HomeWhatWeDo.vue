<script setup lang="ts">
const cmsVisuals=await useCmsResource('site-visuals',{"images":{"asset_7692def0":"/section-3/store-songzhu.jpg","asset_7a7fece6":"/section-6/franchise/antra-original/h5-bg1.png","asset_39582b0b":"/section-6/franchise/antra-original/h5-bg02.png","asset_18ed1982":"/section-6/franchise/antra-original/h1-bg01.png","asset_52e702e4":"/section-6/franchise/antra-original/h1-bg01-1.png","asset_d0922f9d":"/section-6/franchise/antra-original/h1-bg02.png","asset_82b9dd3e":"/section-6/franchise/antra-original/h1-bg05.png","asset_38bb39f2":"/section-6/franchise/antra-original/h6-bg-3.png","asset_b3dcb152":"/section-6/builders/builder-hero.jpg","asset_1795db00":"/section-6/franchise/hero-store.jpg","asset_98d304fd":"/section-3/service-process/breadcrumb-df.jpg","asset_44761f00":"/section-5/brand-pavilion/pavilion-taichung.jpg","asset_9b0c0f62":"/home-2026/footer/kitchen-background.webp","asset_73c853de":"/services/h6-bg-2.jpg","asset_809f4bbe":"/section-3/store-chengde.jpg","asset_daa09d8d":"/section-5/brand-pavilion/banner.jpg","asset_10b5a86c":"/home-2026/brand-commitment-opening-frame.webp"},"brandVideoId":"wH374AF9wLI","franchiseVideoId":"sAuAjtpvZYk"})

const cmsCopy = await useCmsResource('view-components-home-HomeWhatWeDo', {"copy":{"field1":"/decor/h6-bg-3.png","field2":"","text3":"品牌承諾","text4":"Why ","text5":"SAKURA KITCHEN","text6":"打造符合每個家庭的理想廚房","text7":"源自於全台數百萬戶家庭生活研究與觀察，櫻花進一步將消費者依不同的家庭型態去探究，用心找出未曾注意的生活需求，發展出不同生活行為的廚房空間及設計風格，與消費者一起打造符合每個家庭的理想廚房。","field8":"/about/advantage","text9":"櫻花優勢","field10":"SAKURA 品牌承諾影片開場畫面：兩位女性手持食材紙袋"},"cmsSettings":{"visible":true,"seoTitle":"","seoDescription":""}})

import { ArrowRight } from 'lucide-vue-next'
useHead(() => ({ ...(cmsCopy.cmsSettings.seoTitle ? {title:cmsCopy.cmsSettings.seoTitle}:{}), meta: cmsCopy.cmsSettings.seoDescription ? [{name:'description',content:cmsCopy.cmsSettings.seoDescription}] : [] }))
</script>

<template>
  <template v-if="cmsCopy.cmsSettings.visible">
  <section id="brand-promise" aria-labelledby="what-we-do-heading" class="what-we-do-section relative overflow-hidden bg-white">
    <img :src="cmsCopy.copy.field1" :alt="cmsCopy.copy.field2" aria-hidden="true" class="wwd-blueprint pointer-events-none absolute bottom-0 right-0 z-0 w-[821px] max-w-none select-none" />
    <div class="what-we-do-layout relative z-10 mx-auto grid max-w-[1410px] items-center">
      <div class="what-we-do-copy min-w-0">
        <div class="what-we-do-heading">
          <InternalSectionPill v-reveal="{ anim: 'opalMoveRight' }" class="mb-[20px]">{{ cmsCopy.copy.text3 }}</InternalSectionPill>
          <h2 id="what-we-do-heading" v-reveal="{ anim: 'opalMoveLeft', delay: 100 }" class="what-we-do-title mx-auto max-w-[560px] font-display text-[#1C1C1D]">{{ cmsCopy.copy.text4 }}<span class="text-[#CAA05C]">{{ cmsCopy.copy.text5 }}</span></h2>
        </div>
        <div v-reveal="{ anim: 'opalMoveUp', delay: 180 }" class="what-we-do-description mx-auto max-w-[645px]">
          <h3 class="font-cjk-serif text-[30px] font-semibold leading-[42px] text-[#1C1C1D]">{{ cmsCopy.copy.text6 }}</h3>
          <p class="mt-[12px] font-cjk-sans text-[15px] leading-[28px] text-[#59585D]">{{ cmsCopy.copy.text7 }}</p>
        </div>
        <div v-reveal="{ anim: 'opalScaleUp', delay: 320 }" class="what-we-do-cta-row flex"><NuxtLink :to="cmsCopy.copy.field8" class="site-content-cta group/cta inline-flex h-[60px] items-center gap-[8px] rounded-full border border-[rgba(159,159,164,.64)] py-[9px] pl-[30px] pr-[9px] text-[#1C1C1D] hover:border-[#CAA05C] hover:bg-[#CAA05C] hover:text-white"><span class="font-cjk-sans text-[15px]">{{ cmsCopy.copy.text9 }}</span><span class="site-cta-icon flex h-[40px] w-[40px] -rotate-45 items-center justify-center rounded-full bg-[#CAA05C] text-white transition-transform group-hover/cta:rotate-0"><ArrowRight class="h-5 w-5" /></span></NuxtLink></div>
      </div>
      <div v-reveal="{ anim: 'opalMoveLeft', delay: 200 }" class="what-we-do-video relative w-full min-w-0 justify-self-end">
        <InternalBrandVideo
          :cover="cmsVisuals.images.asset_10b5a86c"
          :alt="cmsCopy.copy.field10"
        />
      </div>
    </div>
  </section>
</template>
</template>
