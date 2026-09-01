<template>
  <section class="about-us-breadcrumb hero-includes-header" aria-labelledby="about-us-page-title">
    <InternalBrandImage
      src="/section-5/brand-pavilion/pavilion-taichung.jpg"
      alt="SAKURA 台中集團品牌館外觀"
      eager
      class="about-us-breadcrumb__image"
    />
    <div class="about-us-breadcrumb__overlay" aria-hidden="true" />
    <div v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="about-us-breadcrumb__inner ev">
      <h1 id="about-us-page-title">About Us</h1>
      <nav aria-label="麵包屑" class="about-us-breadcrumb__trail">
        <NuxtLink to="/">首頁</NuxtLink><span aria-hidden="true">/</span><span aria-current="page">關於我們</span>
      </nav>
    </div>
  </section>
</template>

<style scoped>
.about-us-breadcrumb { position: relative; isolation: isolate; min-height: 360px; overflow: hidden; color: #fff; background: #1c1c1d; }
.about-us-breadcrumb__image { position: absolute; z-index: -2; inset: 0; width: 100%; height: 100%; }
.about-us-breadcrumb__image :deep(img) { object-position: center 61%; }
.about-us-breadcrumb__overlay { position: absolute; z-index: -1; inset: 0; background: rgb(16 8 1 / 64%); }
.about-us-breadcrumb__inner { width: min(1410px, calc(100% - 60px)); margin-inline: auto; padding: 138px 0 97px; text-align: center; }
.about-us-breadcrumb h1 { margin: 0 0 35px; color: #fff; font-family: var(--font-display); font-size: 80px; font-weight: 400; line-height: .9523809524; }
.about-us-breadcrumb__trail { display: flex; align-items: center; justify-content: center; gap: 10px; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 22px; }
.about-us-breadcrumb__trail a { color: #fff; transition: color .3s ease; }
.about-us-breadcrumb__trail a:hover { color: #caa05c; }

@media (max-width: 1024px) {
  .about-us-breadcrumb { min-height: 300px; }
  .about-us-breadcrumb__inner { padding: 120px 0 70px; }
  .about-us-breadcrumb h1 { font-size: 64px; }
}

@media (max-width: 767px) {
  .about-us-breadcrumb { min-height: 240px; }
  .about-us-breadcrumb__inner { width: calc(100% - 30px); padding: 100px 0 48px; }
  .about-us-breadcrumb h1 { margin-bottom: 24px; font-size: 44px; }
}

@media (prefers-reduced-motion: reduce) {
  .about-us-breadcrumb__trail a { transition: none; }
}
</style>
