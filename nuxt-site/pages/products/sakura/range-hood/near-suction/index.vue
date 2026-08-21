<script setup lang="ts">
import { ArrowRight } from 'lucide-vue-next'
import { PRODUCT_CATALOGUES } from '~/data/productCatalogues'
import {
  SAKURA_NEAR_SUCTION_PRODUCTS,
  getSakuraNearSuctionProductRoute,
} from '~/data/sakuraNearSuctionProducts'
import { RANGE_HOOD_SERIES } from '~/data/sakuraProductSeries'

const catalogueHighlights = PRODUCT_CATALOGUES.slice(0, 2)

useSeoMeta({
  title: '近吸系列｜SAKURA 廚電產品',
  description: '瀏覽 SAKURA 近吸系列除油煙機 R7600、R7615、R7653、DR7396、DR7397、R7302A 與 R7301A。',
  ogTitle: '近吸系列｜SAKURA 廚電產品',
  ogDescription: 'SAKURA 近吸系列七項除油煙機產品。',
  ogImage: SAKURA_NEAR_SUCTION_PRODUCTS[0]?.image,
})
</script>

<template>
  <main class="near-suction-page">
    <section class="near-suction-hero hero-includes-header" aria-labelledby="near-suction-page-title">
      <span class="near-suction-hero__overlay" aria-hidden="true" />
      <div v-reveal="{ anim: 'opalMoveUp' }" class="near-suction-hero__inner">
        <h1 id="near-suction-page-title">SAKURA 廚電產品</h1>
        <nav aria-label="麵包屑" class="near-suction-hero__trail">
          <NuxtLink to="/">首頁</NuxtLink>
          <span aria-hidden="true">/</span>
          <NuxtLink to="/products/sakura">SAKURA 廚電產品</NuxtLink>
          <span aria-hidden="true">/</span>
          <NuxtLink to="/products/sakura/range-hood">除油煙機系列</NuxtLink>
          <span aria-hidden="true">/</span>
          <span aria-current="page">近吸系列</span>
        </nav>
      </div>
    </section>

    <section class="near-suction-products" aria-labelledby="near-suction-products-title">
      <div class="near-suction-rail internal-rail-safe">
        <h2 id="near-suction-products-title" v-reveal="{ anim: 'opalMoveUp' }">
          <span>近吸系列</span>
          <em>Range Hood Series</em>
        </h2>
        <ul class="near-suction-product-grid" aria-label="近吸系列商品清單">
          <li
            v-for="(product, index) in SAKURA_NEAR_SUCTION_PRODUCTS"
            :key="product.id"
            v-reveal="{ anim: 'opalMoveUp', delay: Math.min(index * 60, 240) }"
          >
            <NuxtLink
              :to="getSakuraNearSuctionProductRoute(product)"
              class="near-suction-product-card"
              :aria-label="`查看 ${product.title} ${product.model} 詳細資料`"
            >
              <div
                class="near-suction-product-card__image"
                :class="`near-suction-product-card__image--${product.id}`"
              >
                <InternalProductCategoryImage :src="product.image" :alt="`${product.title} ${product.model}`" />
                <span class="near-suction-product-card__shade" aria-hidden="true" />
                <span class="near-suction-product-card__action" aria-hidden="true"><ArrowRight /></span>
              </div>
              <div class="near-suction-product-card__text">
                <h3>{{ product.title }}</h3>
                <p>{{ product.model }}</p>
                <span>建議售價 <strong>${{ product.price }}</strong></span>
              </div>
            </NuxtLink>
          </li>
        </ul>
      </div>
    </section>

    <section class="near-suction-series" aria-labelledby="near-suction-series-title">
      <div class="near-suction-rail internal-rail-safe">
        <h2 id="near-suction-series-title">除油煙機系列</h2>
        <div class="near-suction-series__viewport" role="region" aria-label="除油煙機八個系列名稱">
          <div class="near-suction-series__track">
            <ul
              v-for="groupIndex in 2"
              :key="groupIndex"
              class="near-suction-series__group"
              :aria-hidden="groupIndex === 2 ? 'true' : undefined"
            >
              <li
                v-for="series in RANGE_HOOD_SERIES"
                :key="`${groupIndex}-${series.id}`"
                class="near-suction-series-name"
              >
                <strong>{{ series.title }}</strong>
                <span>{{ series.productCount }} 個產品</span>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>

    <section class="near-suction-catalogue" aria-labelledby="near-suction-catalogue-title">
      <div class="near-suction-rail internal-rail-safe near-suction-catalogue__grid">
        <div v-reveal="{ anim: 'opalMoveRight' }" class="near-suction-catalogue__copy">
          <span class="near-suction-pill"><i aria-hidden="true" />SAKURA Product Catalogue</span>
          <h2 id="near-suction-catalogue-title">
            <span>廚房商品型錄</span>
            <em>Kitchen Product Catalog</em>
          </h2>
          <NuxtLink to="/catalogues/catalog" class="site-content-cta near-suction-catalogue__cta" aria-label="前往廚房商品型錄與產品保養">
            <span>廚房商品型錄下載</span>
            <span class="site-cta-icon"><ArrowRight aria-hidden="true" /></span>
          </NuxtLink>
          <p>集中查看五大商品型錄與產品保養重點。</p>
        </div>

        <div class="near-suction-catalogue__cards">
          <article
            v-for="(catalogue, index) in catalogueHighlights"
            :key="catalogue.id"
            v-reveal="{ anim: 'opalMoveUp', delay: 100 + index * 100 }"
            class="near-suction-catalogue-card"
          >
            <div class="near-suction-catalogue-card__cover">
              <InternalProductCategoryImage :src="catalogue.cover" :alt="`${catalogue.title}封面預覽`" />
            </div>
            <span>Catalogue Preview</span>
            <h3>{{ catalogue.title }}</h3>
          </article>
        </div>
      </div>
    </section>
  </main>
</template>

<style scoped>
.near-suction-page { overflow: clip; color: #59585d; background: #f6f6f6; }
.near-suction-rail { width: min(1410px, 100%); margin-inline: auto; box-sizing: border-box; }
.near-suction-rail.internal-rail-safe { padding-inline: 43px; }

.near-suction-hero {
  position: relative;
  isolation: isolate;
  min-height: 360px;
  overflow: hidden;
  color: #fff;
  background: url('/section-3/store-songzhu.jpg') center 68% / cover no-repeat fixed;
}
.near-suction-hero__overlay { position: absolute; z-index: -1; inset: 0; background: #100801; opacity: .64; }
.near-suction-hero__inner { width: min(1410px, calc(100% - 60px)); margin-inline: auto; padding: 138px 0 97px; text-align: center; }
.near-suction-hero h1 { margin: 0 0 35px; color: #fff; font-family: var(--font-cjk-serif); font-size: 80px; font-weight: 500; line-height: .9523809524; }
.near-suction-hero__trail { display: flex; flex-wrap: wrap; align-items: center; justify-content: center; gap: 10px; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 22px; }
.near-suction-hero__trail a { color: inherit; transition: color .3s ease; }
.near-suction-hero__trail a:hover,
.near-suction-hero__trail a:focus-visible { color: #caa05c; }

.near-suction-products { padding: 100px 30px 125px; background: #f6f6f6; }
.near-suction-products h2 { display: flex; margin: 0 0 54px; color: #1c1c1d; flex-direction: column; font-weight: 500; }
.near-suction-products h2 span { font-family: var(--font-cjk-serif); font-size: 40px; line-height: 50px; }
.near-suction-products h2 em { color: #caa05c; font-family: var(--font-editorial); font-size: 40px; font-style: normal; font-weight: 400; line-height: 46px; }
.near-suction-product-grid { display: grid; grid-template-columns: repeat(4, minmax(0, 1fr)); gap: 58px 30px; margin: 0; padding: 0; list-style: none; }
.near-suction-product-grid > li { min-width: 0; }
.near-suction-product-card { display: block; min-width: 0; color: inherit; }
.near-suction-product-card:focus-visible { border-radius: 20px; outline: 2px solid #caa05c; outline-offset: 6px; }
.near-suction-product-card__image { position: relative; aspect-ratio: 4 / 3; overflow: hidden; border-radius: 20px; background: #fff; }
.near-suction-product-card__image :deep(img) { transform: translate(var(--product-shift-x, 0), var(--product-shift-y, 0)) scale(1); transition: transform .55s ease; }
.near-suction-product-card__image--r7600 { --product-shift-x: -4%; --product-shift-y: -1%; }
.near-suction-product-card__image--r7615 { --product-shift-x: -1.3%; --product-shift-y: .4%; }
.near-suction-product-card__image--r7653 { --product-shift-x: -2.1%; --product-shift-y: 1.6%; }
.near-suction-product-card__image--dr7396 { --product-shift-x: 1%; --product-shift-y: .3%; }
.near-suction-product-card__image--dr7397 { --product-shift-x: -3.75%; --product-shift-y: -6%; }
.near-suction-product-card__image--r7302a { --product-shift-x: -1.25%; --product-shift-y: -5.5%; }
.near-suction-product-card__image--r7301a { --product-shift-x: -1.8%; --product-shift-y: -10%; }
.near-suction-product-card__shade { position: absolute; inset: 0; background: rgb(0 0 0 / 42%); opacity: 0; transition: opacity .4s ease; }
.near-suction-product-card__action { position: absolute; top: 50%; left: 50%; display: grid; width: 60px; height: 60px; place-items: center; border: 1px solid rgb(255 255 255 / 72%); border-radius: 50%; color: #fff; opacity: 0; transition: opacity .4s ease, transform .4s ease, background-color .4s ease; transform: translate(-50%, -50%) scale(.76) rotate(-45deg); }
.near-suction-product-card__action svg { width: 24px; height: 24px; }
.near-suction-product-card__text { padding: 20px 4px 0; }
.near-suction-product-card__text h3 { min-height: 54px; margin: 0; color: #1c1c1d; font-family: var(--font-cjk-serif); font-size: 20px; font-weight: 500; line-height: 27px; transition: color .3s ease; }
.near-suction-product-card__text p { margin: 5px 0 13px; color: #85858a; font-family: var(--font-cjk-sans); font-size: 16px; line-height: 22px; }
.near-suction-product-card__text span { color: #59585d; font-family: var(--font-cjk-sans); font-size: 14px; line-height: 21px; }
.near-suction-product-card__text strong { color: #1c1c1d; font-family: var(--font-cjk-sans); font-size: 17px; font-weight: 700; }
.near-suction-product-card:hover .near-suction-product-card__image :deep(img) { transform: translate(var(--product-shift-x, 0), var(--product-shift-y, 0)) scale(1.045); }
.near-suction-product-card:hover h3 { color: #caa05c; }
.near-suction-product-card:hover .near-suction-product-card__shade,
.near-suction-product-card:focus-visible .near-suction-product-card__shade,
.near-suction-product-card:hover .near-suction-product-card__action,
.near-suction-product-card:focus-visible .near-suction-product-card__action { opacity: 1; }
.near-suction-product-card:hover .near-suction-product-card__action,
.near-suction-product-card:focus-visible .near-suction-product-card__action { background: #caa05c; transform: translate(-50%, -50%) scale(1) rotate(0); }

.near-suction-series { overflow: hidden; padding: 50px 30px 125px; background: #f6f6f6; }
.near-suction-series h2 { display: flex; margin: 0 0 62px; color: #1c1c1d; align-items: center; justify-content: center; gap: 24px; font-family: var(--font-cjk-serif); font-size: 25px; font-weight: 500; line-height: 36px; text-align: center; }
.near-suction-series h2::before,
.near-suction-series h2::after { width: min(190px, 18vw); height: 1px; background: #d7d7db; content: ""; }
.near-suction-series__viewport { width: 100%; overflow: hidden; }
.near-suction-series__track { display: flex; width: max-content; animation: near-suction-series 31s linear infinite; }
.near-suction-series__group { display: flex; flex: none; margin: 0; padding: 0; list-style: none; }
.near-suction-series-name { display: flex; width: 190px; min-width: 190px; align-items: center; justify-content: center; flex-direction: column; gap: 6px; padding-inline: 14px; color: #85858a; text-align: center; transition: color .3s ease; }
.near-suction-series-name strong { color: inherit; font-family: var(--font-cjk-sans); font-size: 20px; font-weight: 400; line-height: 28px; white-space: nowrap; }
.near-suction-series-name span { color: #aaa9ae; font-family: var(--font-cjk-sans); font-size: 13px; line-height: 19px; letter-spacing: .08em; white-space: nowrap; }
.near-suction-series-name:hover { color: #59585d; }
.near-suction-series-name:hover span { color: #77777c; }
.near-suction-series__viewport:hover .near-suction-series__track { animation-play-state: paused; }

@keyframes near-suction-series {
  to { transform: translateX(-50%); }
}

.near-suction-catalogue { padding: 120px 30px 130px; background: #fff; }
.near-suction-catalogue__grid { display: grid; grid-template-columns: minmax(0, .78fr) minmax(0, 1.22fr); align-items: center; gap: 70px; }
.near-suction-pill { display: inline-flex; width: max-content; align-items: center; gap: 7px; border: 1px solid #e3e3e8; border-radius: 999px; padding: 7px 13px; color: #59585d; font-family: var(--font-cjk-sans); font-size: 11px; line-height: 14px; letter-spacing: .08em; text-transform: uppercase; }
.near-suction-pill i { width: 5px; height: 5px; flex: none; border-radius: 50%; background: #caa05c; }
.near-suction-catalogue__copy h2 { display: flex; margin: 27px 0 38px; color: #1c1c1d; flex-direction: column; font-weight: 500; }
.near-suction-catalogue__copy h2 span { font-family: var(--font-cjk-serif); font-size: 60px; line-height: 64px; }
.near-suction-catalogue__copy h2 em { color: #caa05c; font-family: var(--font-editorial); font-size: 48px; font-style: normal; font-weight: 400; line-height: 52px; }
.near-suction-catalogue__cta { display: inline-flex; height: 60px; align-items: center; gap: 8px; border: 0; border-radius: 999px; padding: 9px 9px 9px 30px; color: #fff; background: #1c1c1d; transition: transform .3s ease, background-color .3s ease; }
.near-suction-catalogue__cta:hover,
.near-suction-catalogue__cta:focus-visible { background: #2a2a2b; transform: translateY(-2px); }
.near-suction-catalogue__cta:focus-visible { outline: 2px solid #caa05c; outline-offset: 4px; }
.near-suction-catalogue__cta > span:first-child { white-space: nowrap; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 22px; }
.near-suction-catalogue__cta .site-cta-icon { display: flex; width: 40px; height: 40px; align-items: center; justify-content: center; border-radius: 50%; color: #fff; background: #caa05c; }
.near-suction-catalogue__cta svg { width: 19px; height: 19px; }
.near-suction-catalogue__copy > p { margin: 18px 0 0; color: #9f9fa4; font-family: var(--font-cjk-sans); font-size: 13px; line-height: 20px; }
.near-suction-catalogue__cards { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 30px; }
.near-suction-catalogue-card { min-width: 0; }
.near-suction-catalogue-card__cover { aspect-ratio: 1.1; overflow: hidden; border-radius: 24px; background: #f6f6f6; }
.near-suction-catalogue-card__cover :deep(img) { object-fit: cover; object-position: center 16%; transition: transform .55s ease; }
.near-suction-catalogue-card > span { display: block; margin-top: 18px; color: #caa05c; font-family: var(--font-cjk-sans); font-size: 11px; line-height: 15px; letter-spacing: .1em; text-transform: uppercase; }
.near-suction-catalogue-card h3 { margin: 7px 0 0; color: #1c1c1d; font-family: var(--font-cjk-sans); font-size: 20px; font-weight: 400; line-height: 28px; }
.near-suction-catalogue-card:hover .near-suction-catalogue-card__cover :deep(img) { transform: scale(1.04); }

@media (max-width: 1023px) {
  .near-suction-products { padding-block: 80px 100px; }
  .near-suction-products h2 span,
  .near-suction-products h2 em { font-size: 38px; line-height: 45px; }
  .near-suction-product-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
  .near-suction-series { padding-bottom: 100px; }
  .near-suction-catalogue { padding-block: 96px; }
  .near-suction-catalogue__grid { gap: 42px; }
  .near-suction-catalogue__copy h2 span { font-size: 50px; line-height: 55px; }
  .near-suction-catalogue__copy h2 em { font-size: 40px; line-height: 46px; }
}

@media (max-width: 767px) {
  .near-suction-rail.internal-rail-safe { padding-inline: 0; }
  .near-suction-hero { min-height: 288px; background-attachment: scroll; }
  .near-suction-hero__inner { width: calc(100% - 30px); padding: 80px 0 60px; }
  .near-suction-hero h1 { margin-bottom: 25px; font-size: clamp(34px, 10.7vw, 42px); line-height: 48px; white-space: nowrap; }
  .near-suction-hero__trail { font-size: 12px; line-height: 18px; }
  .near-suction-products { padding: 60px 15px 80px; }
  .near-suction-products h2 { margin-bottom: 38px; }
  .near-suction-products h2 span { font-size: 34px; line-height: 42px; }
  .near-suction-products h2 em { font-size: 31px; line-height: 38px; }
  .near-suction-product-grid { grid-template-columns: 1fr; gap: 42px; }
  .near-suction-product-card__image,
  .near-suction-catalogue-card__cover { border-radius: 18px; }
  .near-suction-product-card__action { top: auto; right: 18px; bottom: 18px; left: auto; width: 48px; height: 48px; opacity: 1; background: #caa05c; transform: none; }
  .near-suction-product-card__shade { display: none; }
  .near-suction-product-card:hover .near-suction-product-card__action,
  .near-suction-product-card:focus-visible .near-suction-product-card__action { transform: none; }
  .near-suction-product-card__text h3 { min-height: 0; }
  .near-suction-series { padding: 24px 15px 78px; }
  .near-suction-series h2 { gap: 13px; margin-bottom: 42px; font-size: 20px; line-height: 28px; }
  .near-suction-series h2::before,
  .near-suction-series h2::after { width: 42px; }
  .near-suction-series-name { width: 170px; min-width: 170px; padding-inline: 10px; }
  .near-suction-series-name strong { font-size: 18px; line-height: 24px; }
  .near-suction-series-name span { font-size: 11px; line-height: 16px; }
  .near-suction-catalogue { padding: 74px 15px 82px; }
  .near-suction-catalogue__grid { grid-template-columns: 1fr; }
  .near-suction-catalogue__copy h2 { margin-block: 22px 30px; }
  .near-suction-catalogue__copy h2 span { font-size: 43px; line-height: 48px; }
  .near-suction-catalogue__copy h2 em { font-size: 34px; line-height: 40px; }
  .near-suction-catalogue__cards { gap: 16px; }
  .near-suction-catalogue-card h3 { font-size: 18px; line-height: 23px; }
}

@media (prefers-reduced-motion: reduce) {
  .near-suction-product-card__image :deep(img),
  .near-suction-product-card__shade,
  .near-suction-product-card__action,
  .near-suction-product-card__text h3,
  .near-suction-series-name,
  .near-suction-catalogue-card__cover :deep(img) { transition: none; }
  .near-suction-series__viewport { overflow-x: auto; }
  .near-suction-series__track { animation: none; }
  .near-suction-series__group[aria-hidden="true"] { display: none; }
  .near-suction-product-card:hover .near-suction-product-card__image :deep(img),
  .near-suction-catalogue-card:hover .near-suction-catalogue-card__cover :deep(img) { transform: none; }
  .near-suction-catalogue__cta .site-cta-icon::after { animation: none; opacity: 0; }
}
</style>
