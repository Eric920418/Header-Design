<script setup lang="ts">
const cmsCopy = await useCmsResource('view-pages-about-advantage', {"copy":{"text1":"Creating Ideal Kitchens for Every Family","text2":"打造符合每個家庭的理想廚房","text3":"源自於全台數百萬戶家庭生活研究與觀察，櫻花進一步將消費者依不同的家庭型態去探究，用心找出未曾注意的生活需求，發展出不同生活行為的廚房空間及設計風格，與消費者一起打造符合每個家庭的理想廚房。"},"cmsSettings":{"visible":true,"seoTitle":"","seoDescription":""}})
// shortcut: 僅校正既有舊標題，後台發布指定文案後可移除此相容分支。
const familyTitle = cmsCopy.copy.text1 === 'Creating Ideal Kitchens for Every Family' ? 'Creating the Ideal Kitchen for Every Family' : cmsCopy.copy.text1

import { brandAdvantageFaqGroups as cmsSeed_brandAdvantageFaqGroups } from '~/data/brandAdvantage'
const { brandAdvantageFaqGroups } = await useCmsResource('data-brandAdvantage', { brandAdvantageFaqGroups: cmsSeed_brandAdvantageFaqGroups })


useSeoMeta({
  title: '品牌優勢｜SAKURA 整體廚房',
  description: '了解 SAKURA 整體廚房如何以數位設計、安心品質、專業服務與全國連鎖通路，打造符合每個家庭的理想廚房。',
  ogTitle: '品牌優勢｜SAKURA 整體廚房',
  ogDescription: '從家庭生活研究、3D 廚房設計、品質驗證到售後健檢，認識 SAKURA 整體廚房的品牌優勢。',
  ogImage: '/section-5/brand-advantage/banner.jpg',
})
useHead(() => ({ ...(cmsCopy.cmsSettings.seoTitle ? {title:cmsCopy.cmsSettings.seoTitle}:{}), meta: cmsCopy.cmsSettings.seoDescription ? [{name:'description',content:cmsCopy.cmsSettings.seoDescription}] : [] }))
</script>

<template>
  <template v-if="cmsCopy.cmsSettings.visible">
  <main class="brand-advantage-page">
    <InternalBrandAdvantageHero />

    <section class="brand-family-section" aria-labelledby="brand-family-title">
      <div class="brand-family-rail internal-rail-safe">
        <header v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="brand-family-heading ev">
          <h2 id="brand-family-title">{{ familyTitle }}</h2>
          <h3>{{ cmsCopy.copy.text2 }}</h3>
          <p>{{ cmsCopy.copy.text3 }}</p>
        </header>
        <InternalBrandFamilyGallery />
      </div>
    </section>

    <InternalBrandBenefits />
    <InternalBrandStoreSection />
    <InternalFaqAccordion class="brand-advantage-faq" :groups="brandAdvantageFaqGroups" section-id="brand-advantage-faq-title" safe-rail>
      <template #title>
        <span class="bilingual-heading-lead"><span class="brand-faq-eyebrow">Explore Our</span><b class="brand-faq-chinese">一站式專業服務</b></span>Clear <span class="brand-faq-accent">Answers</span> To<br /><b class="brand-faq-chinese">實現理想廚房</b>Your <span class="brand-faq-accent">Main</span> Questions
      </template>
    </InternalFaqAccordion>
  </main>
</template>
</template>

<style scoped>
.brand-advantage-page { background: #fafafa; }
.brand-family-section { overflow: hidden; padding: 100px 30px 95px; background: #fff; }
.brand-advantage-page :deep(.brand-benefits) { background: #fafafa; }
.brand-advantage-page :deep(.brand-store-section) { background: #fff; }
.brand-family-rail { width: min(1410px, 100%); margin-inline: auto; }
.brand-family-heading { margin-bottom: 50px; }
.brand-family-heading h2 { scroll-margin-top: 100px; margin: 0; color: #1c1c1d; font-family: var(--font-display); font-size: 40px; font-weight: 400; line-height: 44px; text-transform: none; }
.brand-family-heading h3 { margin: 24px 0 12px; color: #1c1c1d; font-family: var(--font-cjk-serif); font-size: 25px; font-weight: 500; line-height: 36px; }
.brand-family-heading p { width: min(1050px, 100%); margin: 0; color: #59585d; font-size: 16px; line-height: 26px; }
.brand-advantage-faq { background: #fafafa; }
.brand-advantage-faq :deep(.antra-faq-heading) { grid-template-columns: 30% 70%; }
.brand-advantage-faq :deep(.antra-faq-title) { min-width: 0; width: 100%; font-size: 50px; line-height: 1.2; text-transform: none; }
.brand-advantage-faq :deep(.brand-faq-accent) { color: #caa05c; }
.brand-advantage-faq :deep(.antra-faq-title .brand-faq-eyebrow) { display: inline-block; margin-right: 16px; border-bottom: 1px solid #bdbdbd; color: #1c1c1d; font-size: 18px; line-height: 22px; vertical-align: baseline; }
.brand-advantage-faq :deep(.brand-faq-chinese) { position: relative; top: -.06em; margin-right: 12px; color: #caa05c; font-family: var(--font-cjk-serif); font-size: 40px; font-weight: 600; line-height: 1.2; vertical-align: baseline; }
.brand-advantage-page :deep(.antra-faq-question) { font-size: 20px; line-height: 30px; }
.brand-advantage-page :deep(.antra-faq-panel p) { padding-top: 0; }

@media (max-width: 1024px) {
  .brand-family-section { padding: 80px 30px 65px; }
  .brand-family-heading h2 { font-size: 36px; line-height: 42px; }
}

@media (max-width: 1023px) {
  .brand-advantage-faq :deep(.antra-faq-title) { font-size: 42px; }
  .brand-advantage-faq :deep(.brand-faq-chinese) { font-size: 32px; }
}

@media (max-width: 767px) {
  .brand-advantage-faq :deep(.antra-faq-heading) { grid-template-columns: 1fr; }
  .brand-advantage-faq :deep(.antra-faq-title) { font-size: 30px; line-height: 35px; }
  .brand-advantage-faq :deep(.antra-faq-title .brand-faq-eyebrow) { display: block; width: fit-content; margin: 0 auto 8px; }
  .brand-advantage-faq :deep(.brand-faq-chinese) { display: block; top: auto; margin: 0 0 8px; font-size: 28px; text-wrap: balance; }
  .brand-family-section { padding: 30px 15px 40px; }
  .brand-family-rail.internal-rail-safe { padding-right: 72px; }
  .brand-family-heading { margin-bottom: 35px; text-align: center; }
  .brand-family-heading h2 { font-size: 30px; line-height: 35px; }
  .brand-family-heading h3 { margin-top: 20px; font-size: 22px; line-height: 32px; }
  .brand-family-heading p { font-size: 15px; line-height: 24px; text-align: left; }
}
</style>
