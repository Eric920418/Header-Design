<template>
  <section class="brand-store-section" aria-labelledby="brand-store-title">
    <div class="brand-store-rail internal-rail-safe">
      <header class="brand-store-heading">
        <InternalTemplateHeadingRail
          v-reveal="{ anim: 'opalMoveRight' }"
          label="Popular Queries"
          data-ev="opalMoveRight"
          class="brand-store-heading-aside ev"
        />
        <div v-reveal="{ anim: 'opalMoveLeft' }" data-ev="opalMoveLeft" class="brand-store-heading-copy ev">
          <h2 id="brand-store-title">Description. <span>Architecture<br />Process For</span> Exceptional Results</h2>
          <h3>全國最大廚具連鎖通路</h3>
          <p>櫻花自 1997 年開始推展「櫻花廚藝生活館」的連鎖廚具加盟體系；並以社區廚房專家自許，以讓櫻花對消費者的服務能像便利商店一般的無所不在，時時照顧著每一個家庭的廚房生活品質，給所有消費者一個高質感的廚房空間。專營進口廚具、系統廚具、廚具設計，為口碑第一且品質優良的廚具品牌。</p>
        </div>
      </header>

      <div v-reveal="{ anim: 'opalScaleUp' }" data-ev="opalScaleUp" class="brand-store-gallery ev">
        <figure class="brand-store-gallery-main">
          <InternalBrandImage src="/section-5/brand-advantage/store-sanmin.jpg" alt="櫻花整體廚房三民店" class="brand-store-image" />
          <figcaption>櫻花廚藝生活館_三民店</figcaption>
        </figure>
        <figure class="brand-store-gallery-side">
          <InternalBrandImage src="/section-5/brand-advantage/store-henan.jpg" alt="櫻花整體廚房河南店" class="brand-store-image" />
          <figcaption>櫻花廚藝生活館_河南店</figcaption>
        </figure>
      </div>
    </div>
  </section>
</template>

<style scoped>
.brand-store-section { overflow: hidden; padding: 100px 30px 80px; background: linear-gradient(180deg, #f6f6f6 0%, #fff 72.12%); }
.brand-store-rail { width: min(1410px, 100%); margin-inline: auto; }
.brand-store-heading { display: grid; grid-template-columns: 30% 70%; margin-bottom: 55px; }
.brand-store-heading-aside { align-self: stretch; }
.brand-store-heading-copy { padding-top: 64px; }
.brand-store-heading h2 { width: min(850px, 100%); margin: 0; color: #1c1c1d; font-family: var(--font-display); font-size: 60px; font-weight: 400; line-height: 64px; text-transform: capitalize; }
.brand-store-heading h2 span { color: #caa05c; }
.brand-store-heading h3 { margin: 35px 0 12px; color: #1c1c1d; font-family: var(--font-cjk-serif); font-size: 25px; font-weight: 500; line-height: 36px; }
.brand-store-heading p { width: min(850px, 100%); margin: 0; color: #59585d; font-size: 16px; line-height: 26px; }
.brand-store-gallery { display: grid; grid-template-columns: 754fr 386fr; gap: 30px; }
.brand-store-gallery figure { margin: 0; }
.brand-store-image { width: 100%; aspect-ratio: var(--store-ratio); border-radius: 24px; }
.brand-store-gallery-main { --store-ratio: 754 / 440; }
.brand-store-gallery-side { --store-ratio: 386 / 440; }
.brand-store-gallery figcaption { margin-top: 15px; color: #59585d; font-family: var(--font-cjk-sans); font-size: 16px; line-height: 24px; }

@media (max-width: 1024px) {
  .brand-store-section { padding-block: 80px; }
  .brand-store-heading h2 { font-size: 48px; line-height: 52px; }
}

@media (max-width: 767px) {
  .brand-store-section { padding: 60px 15px; }
  .brand-store-rail.internal-rail-safe { padding-right: 72px; }
  .brand-store-heading { grid-template-columns: 1fr; margin-bottom: 35px; text-align: center; }
  .brand-store-heading-copy { padding-top: 20px; }
  .brand-store-heading h2 { font-size: 30px; line-height: 35px; }
  .brand-store-heading h2 br { display: none; }
  .brand-store-heading h3 { margin-top: 25px; font-size: 22px; line-height: 32px; }
  .brand-store-heading p { font-size: 15px; line-height: 24px; text-align: left; }
  .brand-store-gallery { grid-template-columns: 1fr; gap: 28px; }
}
</style>
