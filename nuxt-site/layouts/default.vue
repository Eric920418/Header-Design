<script setup lang="ts">
const cmsVisuals=await useCmsResource('site-visuals',{"images":{"asset_7692def0":"/section-3/store-songzhu.jpg","asset_7a7fece6":"/section-6/franchise/antra-original/h5-bg1.png","asset_39582b0b":"/section-6/franchise/antra-original/h5-bg02.png","asset_18ed1982":"/section-6/franchise/antra-original/h1-bg01.png","asset_52e702e4":"/section-6/franchise/antra-original/h1-bg01-1.png","asset_d0922f9d":"/section-6/franchise/antra-original/h1-bg02.png","asset_82b9dd3e":"/section-6/franchise/antra-original/h1-bg05.png","asset_38bb39f2":"/section-6/franchise/antra-original/h6-bg-3.png","asset_b3dcb152":"/section-6/builders/builder-hero.jpg","asset_1795db00":"/section-6/franchise/hero-store.jpg","asset_98d304fd":"/section-3/service-process/breadcrumb-df.jpg","asset_44761f00":"/section-5/brand-pavilion/pavilion-taichung.jpg","asset_9b0c0f62":"/home-2026/footer/kitchen-background.webp","asset_73c853de":"/services/h6-bg-2.jpg","asset_809f4bbe":"/section-3/store-chengde.jpg","asset_daa09d8d":"/section-5/brand-pavilion/banner.jpg","asset_10b5a86c":"/home-2026/brand-commitment-opening-frame.webp"},"brandVideoId":"wH374AF9wLI","franchiseVideoId":"sAuAjtpvZYk"})
const visualStyle=computed(()=>Object.fromEntries(Object.entries(cmsVisuals.images).map(([key,url])=>['--cms-image-'+key,'url('+JSON.stringify(url)+')'])))
</script>
<template>
  <div id="top" :style="visualStyle" class="min-h-screen bg-white overflow-x-clip">
    <SiteHeader />
    <div class="site-header-spacer" aria-hidden="true" />
    <div class="min-w-0"><slot /></div>
    <SiteFooter />
    <FloatingButtons />
  </div>
</template>
