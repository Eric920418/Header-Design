<script setup lang="ts">
import { brandBenefits } from '~/data/brandAdvantage'
</script>

<template>
  <section class="brand-benefits" aria-labelledby="brand-benefits-title">
    <div class="brand-benefits-rail">
      <header v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="brand-benefits-heading ev">
        <span class="brand-benefits-pill"><i aria-hidden="true" />Our Advantages</span>
        <h2 id="brand-benefits-title">Take A Look At <span>Our Ideal<br />Kitchen</span> Advantages</h2>
        <p>櫻花整體廚房擁有近百家門市，第一線接觸消費者的設計師皆受過專業的產品力及設計力之培訓、及廚藝大學之認證，提供給消費者最符合其需求的廚房規劃。</p>
      </header>

      <div class="brand-benefits-list">
        <article
          v-for="(benefit, index) in brandBenefits"
          :key="benefit.id"
          v-reveal="{ anim: 'opalMoveUp', delay: index * 100 }"
          data-ev="opalMoveUp"
          class="brand-benefit-row ev"
          :style="{ animationDelay: `${index * 100}ms` }"
        >
          <div class="brand-benefit-copy">
            <div class="brand-benefit-eyebrow"><strong>{{ benefit.number }}</strong><span>{{ benefit.englishTitle }}</span></div>
            <h3>{{ benefit.title }}</h3>
            <p>{{ benefit.description }}</p>
          </div>
          <InternalBrandImage :src="benefit.image" :alt="`${benefit.number} ${benefit.title}`" class="brand-benefit-image" />
        </article>
      </div>
    </div>
  </section>
</template>

<style scoped>
.brand-benefits { overflow: hidden; padding: 100px 30px 120px; background: #fff; }
.brand-benefits-rail { width: min(1410px, 100%); margin-inline: auto; }
.brand-benefits-heading { display: grid; grid-template-columns: 30% 70%; margin-bottom: 75px; }
.brand-benefits-pill { display: inline-flex; width: fit-content; height: fit-content; align-items: center; gap: 7px; padding: 7px 13px 7px 10px; border: 1px solid rgb(114 114 114 / 18%); border-radius: 24px; color: #1c1c1d; font-family: "Cal Sans", sans-serif; font-size: 12px; line-height: 14px; letter-spacing: 1px; text-transform: uppercase; }
.brand-benefits-pill i { width: 6px; height: 6px; border-radius: 50%; background: #caa05c; }
.brand-benefits-heading h2 { max-width: 830px; margin: 0; color: #1c1c1d; font-family: "Cal Sans", sans-serif; font-size: 60px; font-weight: 400; line-height: 64px; text-transform: capitalize; }
.brand-benefits-heading h2 span { color: #caa05c; }
.brand-benefits-heading > p { grid-column: 2; max-width: 830px; margin: 24px 0 0; color: #59585d; font-size: 16px; line-height: 26px; }
.brand-benefits-list { display: grid; gap: 90px; }
.brand-benefit-row { display: grid; grid-template-columns: minmax(0, 45%) minmax(0, 55%); align-items: center; gap: 70px; }
.brand-benefit-copy { padding-left: 30px; }
.brand-benefit-eyebrow { display: flex; align-items: baseline; gap: 14px; margin-bottom: 16px; }
.brand-benefit-eyebrow strong { color: #e3e3e8; font-family: "Cal Sans", sans-serif; font-size: 72px; font-weight: 400; line-height: 72px; }
.brand-benefit-eyebrow span { color: #caa05c; font-family: "Cal Sans", sans-serif; font-size: 15px; line-height: 22px; text-transform: uppercase; }
.brand-benefit-copy h3 { margin: 0 0 18px; color: #1c1c1d; font-family: "Cal Sans", sans-serif; font-size: 34px; font-weight: 400; line-height: 40px; }
.brand-benefit-copy p { max-width: 520px; margin: 0; color: #59585d; font-size: 16px; line-height: 26px; }
.brand-benefit-image { width: 100%; aspect-ratio: 1.3461538462 / 1; border-radius: 24px; }

@media (max-width: 1200px) {
  .brand-benefit-row { gap: 45px; }
  .brand-benefit-copy { padding-left: 0; }
}

@media (max-width: 1024px) {
  .brand-benefits { padding-block: 80px; }
  .brand-benefits-heading h2 { font-size: 48px; line-height: 52px; }
  .brand-benefits-list { gap: 60px; }
  .brand-benefit-row { grid-template-columns: 1fr; gap: 30px; }
  .brand-benefit-copy p { max-width: none; }
}

@media (max-width: 767px) {
  .brand-benefits { padding: 60px 15px; }
  .brand-benefits-heading { display: block; margin-bottom: 45px; text-align: center; }
  .brand-benefits-heading h2 { margin-top: 20px; font-size: 30px; line-height: 35px; }
  .brand-benefits-heading h2 br { display: none; }
  .brand-benefits-heading > p { font-size: 15px; line-height: 24px; text-align: left; }
  .brand-benefit-eyebrow strong { font-size: 56px; line-height: 56px; }
  .brand-benefit-copy h3 { font-size: 28px; line-height: 34px; }
  .brand-benefit-copy p { font-size: 15px; line-height: 24px; }
}
</style>
