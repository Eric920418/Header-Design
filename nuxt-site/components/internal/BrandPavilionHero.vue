<template>
  <section class="pavilion-single-hero" aria-labelledby="pavilion-hero-title">
    <div v-reveal="{ anim: 'opalScaleUp' }" data-ev="opalScaleUp" class="pavilion-single-hero__rail ev">
      <InternalBrandImage
        src="/section-5/brand-pavilion/banner.jpg"
        alt="SAKURA 集團品牌館外觀"
        eager
        class="pavilion-single-hero__image"
      />
      <div class="pavilion-single-hero__shade" aria-hidden="true" />
      <div class="pavilion-single-hero__copy">
        <small>集團品牌館<br />SAKURA Brand Pavilion</small>
        <h1 id="pavilion-hero-title">Creative <span>Projects That<br />Define</span> Our Style</h1>
      </div>
      <nav class="pavilion-single-hero__pages" aria-label="品牌承諾頁面">
        <NuxtLink to="/about/advantage"><b>01</b><span>品牌優勢</span></NuxtLink>
        <NuxtLink to="/about/exhibition" aria-current="page"><b>02</b><span>集團品牌館</span></NuxtLink>
        <NuxtLink to="/about/introduce"><b>03</b><span>關於我們</span></NuxtLink>
      </nav>
    </div>
  </section>
</template>

<style scoped>
.pavilion-single-hero { padding: 120px 30px 38px; background: #f6f6f6; }
.pavilion-single-hero__rail { position: relative; width: min(1410px, 100%); aspect-ratio: 2.203125 / 1; margin-inline: auto; overflow: hidden; border-radius: 24px; color: #fff; }
.pavilion-single-hero__image { position: absolute; inset: 0; width: 100%; height: 100%; }
.pavilion-single-hero__shade { position: absolute; inset: 0; background: linear-gradient(90deg, rgb(16 8 1 / 58%) 0%, rgb(16 8 1 / 12%) 61%, rgb(16 8 1 / 28%) 100%); }
.pavilion-single-hero__copy { position: absolute; left: 30px; bottom: 54px; width: min(665px, 55%); }
.pavilion-single-hero__copy small { display: block; margin-bottom: 20px; color: rgb(255 255 255 / 75%); font-family: "Cal Sans", sans-serif; font-size: 11px; line-height: 16px; letter-spacing: .12em; text-transform: uppercase; }
.pavilion-single-hero__copy h1 { margin: 0; font-family: "Cal Sans", sans-serif; font-size: 60px; font-weight: 400; line-height: 58px; text-transform: capitalize; }
.pavilion-single-hero__copy h1 span { color: #caa05c; }
.pavilion-single-hero__pages { position: absolute; right: 30px; bottom: 30px; display: grid; width: 380px; max-width: calc(100% - 60px); grid-template-columns: repeat(3, minmax(0, 1fr)); overflow: hidden; border: 1px solid rgb(255 255 255 / 16%); border-radius: 18px; background: rgb(255 255 255 / 30%); backdrop-filter: blur(58px); }
.pavilion-single-hero__pages > * { display: grid; min-width: 0; gap: 2px; padding: 14px 12px; color: rgb(255 255 255 / 72%); text-decoration: none; transition: background .3s ease, color .3s ease; }
.pavilion-single-hero__pages > * + * { border-left: 1px solid rgb(255 255 255 / 16%); }
.pavilion-single-hero__pages b { color: #caa05c; font-family: "Cal Sans", sans-serif; font-size: 12px; font-weight: 400; line-height: 16px; }
.pavilion-single-hero__pages span { overflow: hidden; font-size: 13px; line-height: 19px; text-overflow: ellipsis; white-space: nowrap; }
.pavilion-single-hero__pages a:hover,
.pavilion-single-hero__pages a[aria-current="page"] { color: #fff; background: rgb(28 28 29 / 32%); }
.pavilion-single-hero__pages > span[aria-disabled="true"] { opacity: .55; }

@media (max-width: 1024px) {
  .pavilion-single-hero { padding-top: 100px; }
  .pavilion-single-hero__rail { aspect-ratio: 1.72 / 1; }
  .pavilion-single-hero__copy h1 { font-size: 48px; line-height: 48px; }
  .pavilion-single-hero__pages { width: 340px; }
}

@media (max-width: 767px) {
  .pavilion-single-hero { padding: 90px 15px 30px; }
  .pavilion-single-hero__rail { min-height: 520px; aspect-ratio: auto; }
  .pavilion-single-hero__copy { left: 20px; bottom: 154px; width: calc(100% - 40px); }
  .pavilion-single-hero__copy small { margin-bottom: 14px; }
  .pavilion-single-hero__copy h1 { font-size: 38px; line-height: 38px; }
  .pavilion-single-hero__pages { left: 20px; right: 20px; bottom: 20px; width: auto; max-width: none; }
  .pavilion-single-hero__pages > * { padding: 12px 8px; }
  .pavilion-single-hero__pages span { font-size: 12px; }
}

@media (prefers-reduced-motion: reduce) {
  .pavilion-single-hero__pages > * { transition: none; }
}
</style>
