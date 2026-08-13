<script setup lang="ts">
import { brandAdvantageFaqGroups } from '~/data/brandAdvantage'

useSeoMeta({
  title: '品牌優勢｜SAKURA 整體廚房',
  description: '了解 SAKURA 整體廚房如何以數位設計、安心品質、專業服務與全國連鎖通路，打造符合每個家庭的理想廚房。',
  ogTitle: '品牌優勢｜SAKURA 整體廚房',
  ogDescription: '從家庭生活研究、3D 廚房設計、品質驗證到售後健檢，認識 SAKURA 整體廚房的品牌優勢。',
  ogImage: '/section-5/brand-advantage/banner.jpg',
})
</script>

<template>
  <main class="brand-advantage-page">
    <InternalBrandAdvantageHero />

    <section class="brand-family-section" aria-labelledby="brand-family-title">
      <div class="brand-family-rail">
        <header v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="brand-family-heading ev">
          <h2 id="brand-family-title">Industrial Elegance Condo</h2>
          <h3>打造符合每個家庭的理想廚房</h3>
          <p>源自於全台數百萬戶家庭生活研究與觀察，櫻花進一步將消費者依不同的家庭型態去探究，用心找出未曾注意的生活需求，發展出不同生活行為的廚房空間及設計風格，與消費者一起打造符合每個家庭的理想廚房。</p>
        </header>
        <InternalBrandFamilyGallery />
      </div>
    </section>

    <InternalBrandBenefits />
    <InternalBrandStoreSection />
    <InternalFaqAccordion :groups="brandAdvantageFaqGroups" section-id="brand-advantage-faq-title" />
  </main>
</template>

<style scoped>
.brand-advantage-page { background: #f6f6f6; }
.brand-family-section { overflow: hidden; padding: 100px 30px 95px; background: #f6f6f6; }
.brand-family-rail { width: min(1410px, 100%); margin-inline: auto; }
.brand-family-heading { margin-bottom: 50px; }
.brand-family-heading h2 { margin: 0; color: #1c1c1d; font-family: "Cal Sans", sans-serif; font-size: 40px; font-weight: 400; line-height: 44px; text-transform: capitalize; }
.brand-family-heading h3 { margin: 24px 0 12px; color: #1c1c1d; font-size: 22px; font-weight: 500; line-height: 32px; }
.brand-family-heading p { width: min(1050px, 100%); margin: 0; color: #59585d; font-size: 16px; line-height: 26px; }

@media (max-width: 1024px) {
  .brand-family-section { padding: 80px 30px 65px; }
  .brand-family-heading h2 { font-size: 36px; line-height: 42px; }
}

@media (max-width: 767px) {
  .brand-family-section { padding: 30px 15px 40px; }
  .brand-family-heading { margin-bottom: 35px; text-align: center; }
  .brand-family-heading h2 { font-size: 30px; line-height: 35px; }
  .brand-family-heading h3 { margin-top: 20px; font-size: 20px; line-height: 28px; }
  .brand-family-heading p { font-size: 15px; line-height: 24px; text-align: left; }
}
</style>
