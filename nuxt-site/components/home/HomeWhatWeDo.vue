<script setup lang="ts">
import { ArrowRight, Check } from 'lucide-vue-next'
const items = ['Residence And Condo', 'Modern Kitchen Renovate', 'Interior House Decoration']
const videoState = ref<'idle' | 'playing' | 'error'>('idle')
const youtubeId = 'wH374AF9wLI'
</script>

<template>
  <section id="brand-promise" aria-labelledby="what-we-do-heading" class="what-we-do-section relative overflow-hidden bg-white">
    <img src="/decor/h6-bg-3.png" alt="" aria-hidden="true" class="wwd-blueprint pointer-events-none absolute bottom-0 right-0 z-0 w-[821px] max-w-none select-none" />
    <div class="what-we-do-layout relative z-10 mx-auto grid max-w-[1410px] items-center">
      <div v-reveal data-ev="slideInLeft" class="ev what-we-do-copy min-w-0">
        <div class="what-we-do-heading mb-[40px]"><span class="mb-[20px] inline-flex items-center gap-[6px] rounded-[24px] border border-[rgba(114,114,114,.18)] px-[13px] py-[3px] pl-[10px] font-display text-[12px] uppercase tracking-[1px] text-[#1C1C1D]"><span class="h-[6px] w-[6px] rounded-full bg-[#CAA05C]" />品牌承諾</span><h2 id="what-we-do-heading" class="what-we-do-title mx-auto max-w-[670px] font-display capitalize text-[#1C1C1D]">SAKURA has <span class="text-[#CAA05C]">created exceptional</span> architectural designs.</h2></div>
        <ul class="border-t border-[#E3E3E8]"><li v-for="item in items" :key="item" class="flex items-center gap-[7px] border-b border-[#E3E3E8] py-[16px] font-display text-[18px] leading-[24px] text-[#1C1C1D]"><Check class="h-[19px] w-[19px] text-[#CAA05C]" :stroke-width="3" />{{ item }}</li></ul>
        <p class="what-we-do-description mx-auto max-w-[645px] text-[16px] leading-[24px] text-[#59585D]">We specialize in transforming visions into reality. Explore our portfolio of innovative architectural and interior design projects crafted with precision.</p>
        <div class="what-we-do-cta-row flex"><a href="#" class="site-content-cta group inline-flex h-[60px] items-center gap-[8px] rounded-full border border-[rgba(159,159,164,.64)] py-[9px] pl-[30px] pr-[9px] text-[#1C1C1D] hover:border-[#CAA05C] hover:bg-[#CAA05C] hover:text-white"><span class="text-[15px]">櫻花優勢</span><span class="site-cta-icon flex h-[40px] w-[40px] -rotate-45 items-center justify-center rounded-full bg-[#CAA05C] text-white transition-transform group-hover:rotate-0"><ArrowRight class="h-5 w-5" /></span></a></div>
      </div>
      <div v-reveal data-ev="slideInRight" class="ev relative min-w-0 w-full" style="animation-delay:300ms"><div class="group relative aspect-video overflow-hidden rounded-3xl bg-black shadow-2xl transition-transform hover:scale-[1.02]">
        <template v-if="videoState === 'idle'"><img :src="`https://img.youtube.com/vi/${youtubeId}/maxresdefault.jpg`" alt="SAKURA 品牌承諾影片縮圖" class="absolute inset-0 h-full w-full object-cover" @error="videoState = 'error'" /><div class="absolute inset-0 flex items-center justify-center"><button type="button" aria-label="播放 SAKURA 品牌承諾影片" class="antra-template-video-popup" @click="videoState = 'playing'"><span class="antra-template-video-icon" aria-hidden="true" /></button></div></template>
        <iframe v-else-if="videoState === 'playing'" :src="`https://www.youtube.com/embed/${youtubeId}?autoplay=1&rel=0&playsinline=1`" title="SAKURA 品牌承諾影片" class="absolute inset-0 h-full w-full border-0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen @error="videoState = 'error'" />
        <div v-else role="alert" class="absolute inset-0 flex flex-col items-center justify-center gap-4 bg-[#1C1C1D] px-8 text-center text-white"><p>影片載入失敗（影片 ID：{{ youtubeId }}）。請確認網路連線或瀏覽器第三方內容設定。</p><a :href="`https://www.youtube.com/watch?v=${youtubeId}`" target="_blank" rel="noopener noreferrer" class="rounded-full border border-white/50 px-6 py-3 hover:border-[#CAA05C] hover:bg-[#CAA05C]">前往 YouTube 觀看</a></div>
      </div></div>
    </div>
  </section>
</template>
