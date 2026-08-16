<script setup lang="ts">
import { ArrowRight } from 'lucide-vue-next'
import { PRODUCT_CATALOGUES } from '~/data/productCatalogues'
import { SAKURA_PRODUCT_GROUPS } from '~/data/sakuraProducts'
import { RANGE_HOOD_SERIES } from '~/data/sakuraProductSeries'

const productCategories = SAKURA_PRODUCT_GROUPS.flatMap(group => group.categories)

const catalogueHighlights = PRODUCT_CATALOGUES.slice(0, 2)

useSeoMeta({
  title: '除油煙機系列｜SAKURA 廚電產品',
  description: '瀏覽 SAKURA 除油煙機近吸、歐化、隱藏、流線、深罩、斜背、輕巧與配備系列。',
  ogTitle: '除油煙機系列｜SAKURA 廚電產品',
  ogDescription: 'SAKURA 除油煙機八大系列與商品數量。',
  ogImage: RANGE_HOOD_SERIES[0]?.image,
})
</script>

<template>
  <main class="sakura-series-page">
    <section class="sakura-series-hero" aria-labelledby="sakura-series-title">
      <span class="sakura-series-hero__overlay" aria-hidden="true" />
      <div v-reveal="{ anim: 'opalMoveUp' }" class="sakura-series-hero__inner">
        <h1 id="sakura-series-title">SAKURA 廚電產品</h1>
        <nav aria-label="麵包屑" class="sakura-series-hero__trail">
          <NuxtLink to="/">首頁</NuxtLink>
          <span aria-hidden="true">/</span>
          <NuxtLink to="/products/sakura">SAKURA 廚電產品</NuxtLink>
          <span aria-hidden="true">/</span>
          <span aria-current="page">除油煙機系列</span>
        </nav>
      </div>
    </section>

    <section class="sakura-series-products" aria-labelledby="range-hood-series-title">
      <div class="sakura-series-rail internal-rail-safe">
        <h2 id="range-hood-series-title" v-reveal="{ anim: 'opalMoveUp' }">除油煙機系列</h2>
        <ul class="sakura-series-grid" aria-label="除油煙機系列清單">
          <li
            v-for="(series, index) in RANGE_HOOD_SERIES"
            :key="series.id"
            v-reveal="{ anim: 'opalMoveUp', delay: Math.min(index * 70, 280) }"
            class="sakura-series-card"
          >
            <NuxtLink
              v-if="series.route"
              :to="series.route"
              class="sakura-series-card__link"
              :aria-label="`查看${series.title}的 ${series.productCount} 個產品`"
            >
              <div class="sakura-series-card__image">
                <InternalProductCategoryImage :src="series.image" :alt="`${series.title}代表商品`" />
              </div>
              <div class="sakura-series-card__text">
                <h3>{{ series.title }}</h3>
                <span aria-label="商品數量">{{ series.productCount }} 個產品</span>
              </div>
            </NuxtLink>
            <article v-else>
              <div class="sakura-series-card__image">
                <InternalProductCategoryImage :src="series.image" :alt="`${series.title}代表商品`" />
              </div>
              <div class="sakura-series-card__text">
                <h3>{{ series.title }}</h3>
                <span aria-label="商品數量">{{ series.productCount }} 個產品</span>
              </div>
            </article>
          </li>
        </ul>
      </div>
    </section>

    <section class="sakura-series-categories" aria-labelledby="sakura-series-categories-title">
      <div class="sakura-series-rail internal-rail-safe">
        <h2 id="sakura-series-categories-title">
          <strong>SAKURA</strong> 廚電產品
        </h2>
        <div class="sakura-series-categories__viewport" role="region" aria-label="SAKURA 商品、熱水器與淨水設備系列名稱">
          <div class="sakura-series-categories__track">
            <ul
              v-for="groupIndex in 2"
              :key="groupIndex"
              class="sakura-series-categories__group"
              :aria-hidden="groupIndex === 2 ? 'true' : undefined"
            >
              <li
                v-for="category in productCategories"
                :key="`${groupIndex}-${category.id}`"
                class="sakura-series-category"
              >
                <strong>{{ category.title }}</strong>
                <span>{{ category.groupLabel }}</span>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>

    <section class="sakura-series-catalogue" aria-labelledby="sakura-catalogue-title">
      <div class="sakura-series-rail internal-rail-safe sakura-series-catalogue__grid">
        <div v-reveal="{ anim: 'opalMoveRight' }" class="sakura-series-catalogue__copy">
          <span class="sakura-series-pill"><i aria-hidden="true" />SAKURA Product Catalogue</span>
          <h2 id="sakura-catalogue-title">廚房商品型錄</h2>
          <NuxtLink to="/catalogues/catalog" class="site-content-cta sakura-series-catalogue__cta" aria-label="前往廚房商品型錄與產品保養">
            <span>廚房商品型錄下載</span>
            <span class="site-cta-icon"><ArrowRight aria-hidden="true" /></span>
          </NuxtLink>
          <p>集中查看五大商品型錄與產品保養重點。</p>
        </div>

        <div class="sakura-series-catalogue__cards">
          <article
            v-for="(catalogue, index) in catalogueHighlights"
            :key="catalogue.id"
            v-reveal="{ anim: 'opalMoveUp', delay: 100 + index * 100 }"
            class="sakura-series-catalogue-card"
          >
            <div class="sakura-series-catalogue-card__cover">
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
.sakura-series-page { overflow: clip; color: #59585d; background: #f6f6f6; }
.sakura-series-rail { width: min(1410px, 100%); margin-inline: auto; box-sizing: border-box; }
.sakura-series-rail.internal-rail-safe { padding-inline: 43px; }

.sakura-series-hero {
  position: relative;
  isolation: isolate;
  min-height: 360px;
  overflow: hidden;
  color: #fff;
  background: url('/section-3/service-process/breadcrumb-df.jpg') center / cover no-repeat fixed;
}
.sakura-series-hero__overlay { position: absolute; z-index: -1; inset: 0; background: #100801; opacity: .64; }
.sakura-series-hero__inner { width: min(1410px, calc(100% - 60px)); margin-inline: auto; padding: 138px 0 97px; text-align: center; }
.sakura-series-hero h1 { margin: 0 0 35px; color: #fff; font-family: "Cal Sans", sans-serif; font-size: 80px; font-weight: 400; line-height: .9523809524; }
.sakura-series-hero__trail { display: flex; flex-wrap: wrap; align-items: center; justify-content: center; gap: 10px; font-family: "Cal Sans", sans-serif; font-size: 13px; line-height: 16px; text-transform: uppercase; }
.sakura-series-hero__trail a { color: inherit; transition: color .3s ease; }
.sakura-series-hero__trail a:hover,
.sakura-series-hero__trail a:focus-visible { color: #caa05c; }

.sakura-series-products { padding: 100px 30px 125px; background: #f6f6f6; }
.sakura-series-products h2 { margin: 0 0 54px; color: #1c1c1d; font-family: "Cal Sans", sans-serif; font-size: 60px; font-weight: 400; line-height: 64px; }
.sakura-series-grid { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 46px 30px; margin: 0; padding: 0; list-style: none; }
.sakura-series-card,
.sakura-series-card article,
.sakura-series-card__link { min-width: 0; }
.sakura-series-card article,
.sakura-series-card__link { display: block; height: 100%; overflow: hidden; border-radius: 24px; color: inherit; background: #fff; }
.sakura-series-card__link:focus-visible { outline: 2px solid #caa05c; outline-offset: 5px; }
.sakura-series-card__image { aspect-ratio: 4 / 3; overflow: hidden; background: #fff; }
.sakura-series-card__image :deep(img) { transition: transform .55s ease; }
.sakura-series-card__text { display: flex; min-height: 102px; align-items: flex-start; justify-content: space-between; gap: 20px; padding: 22px 24px 24px; }
.sakura-series-card__text h3 { margin: 0; color: #1c1c1d; font-family: "Cal Sans", sans-serif; font-size: 26px; font-weight: 400; line-height: 31px; transition: color .3s ease; }
.sakura-series-card__text span { flex: none; padding-top: 6px; color: #9f9fa4; font-size: 13px; line-height: 18px; }
.sakura-series-card:hover .sakura-series-card__image :deep(img) { transform: scale(1.045); }
.sakura-series-card:hover h3 { color: #caa05c; }

.sakura-series-categories { overflow: hidden; padding: 50px 30px 125px; background: #f6f6f6; }
.sakura-series-categories h2 { margin: 0 0 62px; color: #1c1c1d; font-family: "Cal Sans", sans-serif; font-size: 17px; font-weight: 400; line-height: 23px; text-align: center; }
.sakura-series-categories h2 strong { font-weight: 700; }
.sakura-series-categories__viewport { width: 100%; overflow: hidden; }
.sakura-series-categories__track { display: flex; width: max-content; animation: sakura-product-categories 48s linear infinite; }
.sakura-series-categories__group { display: flex; flex: none; margin: 0; padding: 0; list-style: none; }
.sakura-series-category { display: flex; width: 200px; min-width: 200px; align-items: center; justify-content: center; flex-direction: column; gap: 6px; padding-inline: 14px; color: #85858a; text-align: center; transition: color .3s ease; }
.sakura-series-category strong { color: inherit; font-family: "Cal Sans", sans-serif; font-size: 21px; font-weight: 400; line-height: 27px; white-space: nowrap; }
.sakura-series-category span { color: #aaa9ae; font-size: 9px; line-height: 13px; letter-spacing: .13em; white-space: nowrap; }
.sakura-series-category:hover { color: #59585d; }
.sakura-series-category:hover span { color: #77777c; }
.sakura-series-categories__viewport:hover .sakura-series-categories__track { animation-play-state: paused; }

@keyframes sakura-product-categories {
  to { transform: translateX(-50%); }
}

.sakura-series-catalogue { padding: 120px 30px 130px; background: #fff; }
.sakura-series-catalogue__grid { display: grid; grid-template-columns: minmax(0, .78fr) minmax(0, 1.22fr); align-items: center; gap: 70px; }
.sakura-series-pill { display: inline-flex; width: max-content; align-items: center; gap: 7px; border: 1px solid #e3e3e8; border-radius: 999px; padding: 7px 13px; color: #59585d; font-family: "Cal Sans", sans-serif; font-size: 11px; line-height: 14px; letter-spacing: .08em; text-transform: uppercase; }
.sakura-series-pill i { width: 5px; height: 5px; flex: none; border-radius: 50%; background: #caa05c; }
.sakura-series-catalogue__copy h2 { margin: 27px 0 38px; color: #1c1c1d; font-family: "Cal Sans", sans-serif; font-size: 60px; font-weight: 400; line-height: 64px; }
.sakura-series-catalogue__cta { display: inline-flex; height: 60px; align-items: center; gap: 8px; border: 0; border-radius: 999px; padding: 9px 9px 9px 30px; color: #fff; background: #1c1c1d; transition: transform .3s ease, background-color .3s ease; }
.sakura-series-catalogue__cta:hover,
.sakura-series-catalogue__cta:focus-visible { background: #2a2a2b; transform: translateY(-2px); }
.sakura-series-catalogue__cta:focus-visible { outline: 2px solid #caa05c; outline-offset: 4px; }
.sakura-series-catalogue__cta > span:first-child { white-space: nowrap; font-size: 15px; line-height: 22px; }
.sakura-series-catalogue__cta .site-cta-icon { display: flex; width: 40px; height: 40px; align-items: center; justify-content: center; border-radius: 50%; color: #1c1c1d; background: #caa05c; }
.sakura-series-catalogue__cta svg { width: 19px; height: 19px; }
.sakura-series-catalogue__copy > p { margin: 18px 0 0; color: #9f9fa4; font-size: 13px; line-height: 20px; }
.sakura-series-catalogue__cards { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 30px; }
.sakura-series-catalogue-card { min-width: 0; }
.sakura-series-catalogue-card__cover { aspect-ratio: 1.1; overflow: hidden; border-radius: 24px; background: #f6f6f6; }
.sakura-series-catalogue-card__cover :deep(img) { object-fit: cover; object-position: center 16%; transition: transform .55s ease; }
.sakura-series-catalogue-card > span { display: block; margin-top: 18px; color: #caa05c; font-size: 11px; line-height: 15px; letter-spacing: .1em; text-transform: uppercase; }
.sakura-series-catalogue-card h3 { margin: 7px 0 0; color: #1c1c1d; font-family: "Cal Sans", sans-serif; font-size: 22px; font-weight: 400; line-height: 28px; }
.sakura-series-catalogue-card:hover .sakura-series-catalogue-card__cover :deep(img) { transform: scale(1.04); }

@media (max-width: 1023px) {
  .sakura-series-products { padding-block: 80px 100px; }
  .sakura-series-products h2 { font-size: 52px; line-height: 57px; }
  .sakura-series-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
  .sakura-series-categories { padding-bottom: 100px; }
  .sakura-series-catalogue { padding-block: 96px; }
  .sakura-series-catalogue__grid { gap: 42px; }
  .sakura-series-catalogue__copy h2 { font-size: 50px; line-height: 55px; }
}

@media (max-width: 767px) {
  .sakura-series-rail.internal-rail-safe { padding-inline: 0; }
  .sakura-series-hero { min-height: 288px; background-attachment: scroll; }
  .sakura-series-hero__inner { width: calc(100% - 30px); padding: 80px 0 60px; }
  .sakura-series-hero h1 { margin-bottom: 25px; font-size: 48px; line-height: 52px; }
  .sakura-series-hero__trail { font-size: 11px; line-height: 15px; }
  .sakura-series-products { padding: 60px 15px 80px; }
  .sakura-series-products h2 { margin-bottom: 38px; font-size: 40px; line-height: 45px; }
  .sakura-series-grid { grid-template-columns: 1fr; gap: 32px; }
  .sakura-series-card article,
  .sakura-series-catalogue-card__cover { border-radius: 18px; }
  .sakura-series-categories { padding: 24px 15px 78px; }
  .sakura-series-categories h2 { margin-bottom: 42px; font-size: 16px; line-height: 22px; }
  .sakura-series-category { width: 170px; min-width: 170px; padding-inline: 10px; }
  .sakura-series-category strong { font-size: 18px; line-height: 24px; }
  .sakura-series-category span { font-size: 8px; line-height: 12px; }
  .sakura-series-catalogue { padding: 74px 15px 82px; }
  .sakura-series-catalogue__grid { grid-template-columns: 1fr; }
  .sakura-series-catalogue__copy h2 { margin-block: 22px 30px; font-size: 43px; line-height: 48px; }
  .sakura-series-catalogue__cards { gap: 16px; }
  .sakura-series-catalogue-card h3 { font-size: 18px; line-height: 23px; }
}

@media (prefers-reduced-motion: reduce) {
  .sakura-series-card__image :deep(img),
  .sakura-series-card__text h3,
  .sakura-series-category,
  .sakura-series-catalogue-card__cover :deep(img) { transition: none; }
  .sakura-series-categories__viewport { overflow-x: auto; }
  .sakura-series-categories__track { animation: none; }
  .sakura-series-categories__group[aria-hidden="true"] { display: none; }
  .sakura-series-card:hover .sakura-series-card__image :deep(img),
  .sakura-series-catalogue-card:hover .sakura-series-catalogue-card__cover :deep(img) { transform: none; }
  .sakura-series-catalogue__cta .site-cta-icon::after { animation: none; opacity: 0; }
}
</style>
