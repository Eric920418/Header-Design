<script setup lang="ts">
useSeoMeta({
  title: '服務流程｜SAKURA 整體廚房',
  description: '了解 SAKURA 整體廚房從專業諮詢、到府丈量、量身設計到完工驗收與售後服務的完整流程。',
  ogTitle: '服務流程｜SAKURA 整體廚房',
  ogDescription: '八步完成理想廚房，並解答服務、售後、原廠認證與品質保證常見問題。',
})
</script>

<template>
  <main class="service-process-page">
    <section class="antra-breadcrumb hero-includes-header" aria-labelledby="service-page-title">
      <div class="antra-breadcrumb__overlay" aria-hidden="true" />
      <div class="antra-breadcrumb__inner" v-reveal="{ anim: 'opalMoveUp' }">
        <h1 id="service-page-title">Our Process</h1>
        <nav aria-label="麵包屑" class="antra-breadcrumb__trail">
          <NuxtLink to="/">首頁</NuxtLink><span aria-hidden="true">/</span><span aria-current="page">服務流程</span>
        </nav>
      </div>
    </section>

    <section aria-labelledby="service-intro-title" class="antra-service-intro">
      <div class="antra-service-intro__rail">
        <header class="antra-service-intro__heading">
          <InternalTemplateHeadingRail v-reveal="{ anim: 'opalMoveRight' }" label="Service Process" />
          <div v-reveal="{ anim: 'opalMoveLeft' }">
            <h2 id="service-intro-title">Description <span>Architecture<br />Process</span> For Exceptional Results.</h2>
            <p>堅持用專業的服務，依照您的需求提供設計，希望以更完整、更貼心的服務，讓您最滿意。</p>
          </div>
        </header>
        <InternalServiceFlow />
      </div>
    </section>

    <section aria-label="SAKURA 品牌影片" class="antra-service-video">
      <div v-reveal="{ anim: 'opalScaleUp' }" class="antra-service-video__rail">
        <InternalBrandVideo
          cover="/section-3/service-process/video-cover.jpg"
          aspect="1410 / 640"
          alt="SAKURA 整體廚房品牌影片封面"
          flat
        />
      </div>
    </section>

    <InternalFaqAccordion safe-rail />
  </main>
</template>

<style scoped>
.antra-breadcrumb {
  position: relative;
  isolation: isolate;
  min-height: 360px;
  overflow: hidden;
  background: url('/section-5/brand-pavilion/pavilion-taichung.jpg') center 61% / cover no-repeat;
  color: #fff;
}

.antra-breadcrumb__overlay {
  position: absolute;
  inset: 0;
  z-index: -1;
  background: #100801;
  opacity: .64;
}

.antra-breadcrumb__inner {
  width: min(1410px, calc(100% - 60px));
  margin-inline: auto;
  padding: 138px 0 97px;
  text-align: center;
}

.antra-breadcrumb h1 {
  margin: 0 0 35px;
  color: #fff;
  font-family: var(--font-display);
  font-size: 80px;
  font-weight: 400;
  line-height: .9523809524;
}

.antra-breadcrumb__trail {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  font-weight: 400;
  line-height: 22px;
  text-transform: uppercase;
}

.antra-breadcrumb__trail a { color: #fff; transition: color .3s ease; }
.antra-breadcrumb__trail a:hover { color: #caa05c; }

.antra-service-intro {
  overflow: hidden;
  padding: 100px 30px 110px;
  background: #fafafa;
}

.antra-service-intro__rail {
  width: min(1410px, 100%);
  margin-inline: auto;
}

.antra-service-intro__heading {
  display: grid;
  grid-template-columns: 30% 70%;
}

.antra-service-intro__heading > div:last-child {
  padding: 64px 0 30px;
}

.antra-service-intro h2 {
  width: min(920px, 100%);
  margin: 0 0 20px;
  color: #1c1c1d;
  font-family: var(--font-display);
  font-size: 60px;
  font-weight: 400;
  line-height: 64px;
}

.antra-service-intro h2 span { color: #caa05c; }

.antra-service-intro p {
  width: min(766px, 100%);
  margin: 0;
  color: #59585d;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 25px;
}

.antra-service-video {
  overflow: hidden;
  padding: 0 30px;
  background: #fafafa;
}

.antra-service-video__rail {
  width: min(1410px, 100%);
  margin-inline: auto;
}

.service-process-page :deep(.antra-faq-question) { font-size: 20px; line-height: 30px; }
.service-process-page :deep(.antra-faq-panel p) { padding-top: 0; }

@media (min-width: 1025px) and (max-width: 1366px) {
  .antra-service-intro h2 {
    font-size: 50px;
    line-height: 56px;
  }
}

@media (max-width: 1024px) {
  .antra-breadcrumb { min-height: 285px; }
  .antra-breadcrumb__inner { padding-block: 80px; }
  .antra-service-intro { padding-block: 80px; }
  .antra-service-intro__heading > div:last-child { padding: 70px 0 40px; }
  .antra-service-intro h2 { font-size: 46px; line-height: 52px; }
}

@media (max-width: 767px) {
  .antra-breadcrumb { min-height: 204px; }
  .antra-breadcrumb__inner { width: calc(100% - 30px); padding: 80px 0 60px; }
  .antra-breadcrumb h1 { margin-bottom: 15px; font-size: 30px; line-height: 35px; }
  .antra-service-intro { padding: 60px 15px; }
  .antra-service-intro__rail {
    box-sizing: border-box;
    padding-right: 72px;
  }
  .antra-service-intro__heading { grid-template-columns: 1fr; text-align: center; }
  .antra-service-intro__heading > div:first-child { display: none; }
  .antra-service-intro__heading > div:last-child { padding: 0 0 30px; }
  .antra-service-intro h2 { font-size: 30px; line-height: 35px; }
  .antra-service-video { padding-inline: 15px; }
}

</style>
