<script setup lang="ts">
import { ArrowRight } from 'lucide-vue-next'
</script>

<template>
  <section id="brand-promise" aria-labelledby="what-we-do-heading" class="what-we-do-section relative overflow-hidden bg-white">
    <img src="/decor/h6-bg-3.png" alt="" aria-hidden="true" class="wwd-blueprint pointer-events-none absolute bottom-0 right-0 z-0 w-[821px] max-w-none select-none" />
    <div class="what-we-do-layout relative z-10 mx-auto grid max-w-[1410px] items-center">
      <div class="what-we-do-copy min-w-0">
        <div class="what-we-do-heading">
          <InternalSectionPill v-reveal="{ anim: 'opalMoveRight' }" class="mb-[20px]">Brand Commitment</InternalSectionPill>
          <h2 id="what-we-do-heading" v-reveal="{ anim: 'opalMoveLeft', delay: 100 }" class="what-we-do-title mx-auto max-w-[560px] font-cjk-serif font-semibold text-[#1C1C1D]">打造符合每個家庭的理想廚房</h2>
        </div>
        <p v-reveal="{ anim: 'opalMoveUp', delay: 180 }" class="what-we-do-description mx-auto max-w-[645px] font-cjk-sans text-[15px] leading-[28px] text-[#59585D]">源自於全台數百萬戶家庭生活研究與觀察，櫻花進一步將消費者依不同的家庭型態去探究，用心找出未曾注意的生活需求，發展出不同生活行為的廚房空間及設計風格，與消費者一起打造符合每個家庭的理想廚房。</p>
        <div v-reveal="{ anim: 'opalScaleUp', delay: 320 }" class="what-we-do-cta-row flex"><NuxtLink to="/about/advantage" class="site-content-cta group/cta inline-flex h-[60px] items-center gap-[8px] rounded-full border border-[rgba(159,159,164,.64)] py-[9px] pl-[30px] pr-[9px] text-[#1C1C1D] hover:border-[#CAA05C] hover:bg-[#CAA05C] hover:text-white"><span class="font-cjk-sans text-[15px]">櫻花優勢</span><span class="site-cta-icon flex h-[40px] w-[40px] -rotate-45 items-center justify-center rounded-full bg-[#CAA05C] text-white transition-transform group-hover/cta:rotate-0"><ArrowRight class="h-5 w-5" /></span></NuxtLink></div>
      </div>
      <div v-reveal="{ anim: 'opalMoveLeft', delay: 200 }" class="what-we-do-video relative w-full min-w-0 justify-self-end">
        <InternalBrandVideo alt="SAKURA 品牌承諾影片第一幀" />
      </div>
    </div>
  </section>
</template>
