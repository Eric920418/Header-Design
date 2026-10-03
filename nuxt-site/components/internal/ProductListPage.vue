<script setup lang="ts">
import { ArrowRight } from 'lucide-vue-next'
import { PRODUCT_CATALOGUES as cmsSeed_PRODUCT_CATALOGUES } from '~/data/productCatalogues'
import { PRODUCT_BRANDS as cmsSeed_PRODUCT_BRANDS } from '~/data/productBrands'
import type { ProductBrand, ProductList } from '~/types/products'
const { PRODUCT_CATALOGUES } = await useCmsResource('data-productCatalogues', { PRODUCT_CATALOGUES: cmsSeed_PRODUCT_CATALOGUES })
const { PRODUCT_BRANDS } = await useCmsResource('data-productBrands', { PRODUCT_BRANDS: cmsSeed_PRODUCT_BRANDS })


const { brand, category } = defineProps<{ brand: ProductBrand; category?: number }>()
const info = PRODUCT_BRANDS[brand]
const route = useRoute()
const query = computed(() => ({ ...(category ? { category } : {}), page: route.query.page ?? '1', q: route.query.q ?? '' }))
const { data, error, status, refresh } = await useFetch<ProductList>(`/api/products/${brand}/items`, { query:computed(()=>({...query.value,...(useRoute().query.cmsPreview?{cmsPreview:useRoute().query.cmsPreview}:{})})) })
const search = ref(typeof route.query.q === 'string' ? route.query.q : '')
watch(() => route.query.q, q => { search.value = typeof q === 'string' ? q : '' })
const heading = computed(() => data.value?.category?.title ?? `${info.name} 全部產品`)
const catalogueHighlights = PRODUCT_CATALOGUES.filter(item => ['sakura-kitchen-2026', brand === 'sakura' ? 'sakura-all-2026' : 'imported-appliances-2026'].includes(item.id))
const productCategories = computed(() => data.value?.children.map(item => ({ ...item, groupLabel: info.name })) ?? [])
const breadcrumbs = computed(() => [{ label: '首頁', to: '/' }, { label: info.label, to: `/products/${brand}` },
  ...(data.value?.ancestors.length ? data.value.ancestors.map((item, index, list) => ({ label: item.title, to: index < list.length - 1 ? item.route : undefined })) : [{ label: '全部產品' }])])
const pageNumbers = computed(() => {
  const current = data.value?.page ?? 1, total = data.value?.pages ?? 1
  const start = Math.max(1, Math.min(current - 2, total - 4))
  return Array.from({ length: Math.min(5,total) }, (_,index) => start + index)
})
const pageRoute = (page: number) => ({ path: route.path, query: { ...(route.query.q ? { q: route.query.q } : {}), page: String(page) } })
const productRoute = (item: { route: string }) => ({ path: item.route, query: { ...(category ? { category: String(category) } : {}), ...(route.query.q ? { q: route.query.q } : {}), page: String(data.value?.page ?? 1) } })
function submitSearch() { return navigateTo({ path: route.path, query: search.value.trim() ? { q: search.value.trim() } : {} }) }
if (import.meta.server && error.value) setResponseStatus(error.value.statusCode ?? 500)
useSeoMeta({ title: () => `${heading.value}｜${info.name} 廚房產品`, description: info.description })
</script>

<template>
  <main class="near-suction-page">
    <section data-hero-photo="songzhu" class="near-suction-hero hero-includes-header" aria-labelledby="near-suction-page-title">
      <span class="near-suction-hero__overlay" aria-hidden="true" />
      <div v-reveal="{ anim: 'opalMoveUp' }" class="near-suction-hero__inner">
        <h1 id="near-suction-page-title">Kitchen Appliances</h1>
        <nav aria-label="麵包屑" class="near-suction-hero__trail">
          <InternalSmartBreadcrumb :fallback="breadcrumbs" v-slot="{ items, follow }">
            <template v-for="(item, index) in items" :key="index">
              <span v-if="index" aria-hidden="true">/</span>
              <NuxtLink v-if="item.to" :to="item.to" :aria-current="index === items.length - 1 ? 'page' : undefined" @click.capture="follow($event, item)">{{ item.label }}</NuxtLink>
              <span v-else aria-current="page">{{ item.label }}</span>
            </template>
          </InternalSmartBreadcrumb>
        </nav>
      </div>
    </section>

    <section class="near-suction-products" aria-labelledby="near-suction-products-title">
      <div class="near-suction-rail internal-rail-safe">
        <h2 id="near-suction-products-title" v-reveal="{ anim: 'opalMoveUp' }">
          <em>{{ brand === 'sakura' && category === 9 ? 'Smart Appliances for Better Living' : `${info.name} Kitchen Appliances` }}</em>
          <span>{{ heading }}</span>
        </h2>
        <form class="product-search" role="search" @submit.prevent="submitSearch">
          <label for="product-search">搜尋產品名稱／型號</label>
          <div><input id="product-search" v-model="search" type="search" maxlength="100" placeholder="輸入產品名稱或型號"><button type="submit">搜尋</button></div>
        </form>
        <nav v-if="data?.children.length" class="product-subcategories" aria-label="產品子分類">
          <NuxtLink v-for="child in data.children" :key="child.id" :to="child.route">{{ child.title }}（{{ child.count }}）</NuxtLink>
        </nav>
        <InternalDesignLoadState label="商品列表" :pending="status === 'pending'" :error="error" @retry="refresh()" />
        <p v-if="data && !error" class="mb-6 font-cjk-sans" role="status">共 {{ data.total }} 項產品 · 第 {{ data.page }}／{{ data.pages }} 頁</p>
        <p v-if="data && !error && !data.total" class="py-12 text-center" role="status">沒有符合條件的產品，請更換搜尋文字。</p>
        <ul v-if="data && !error && status !== 'pending'" class="near-suction-product-grid" aria-label="產品清單">
          <li
            v-for="(product, index) in data.items"
            :key="product.id"
            v-reveal="{ anim: 'opalMoveUp', delay: Math.min(index * 60, 240) }"
          >
            <NuxtLink
              :to="productRoute(product)"
              class="near-suction-product-card"
              :aria-label="`查看 ${product.title} ${product.model} 詳細資料`"
            >
              <div
                class="near-suction-product-card__image"
                :class="`near-suction-product-card__image--${product.id}`"
              >
                <InternalProductCategoryImage v-if="product.image" :src="product.image" :alt="`${product.title} ${product.model}`" />
                <span v-else class="flex h-full items-center justify-center p-6">此產品尚未提供圖片</span>
                <span class="near-suction-product-card__shade" aria-hidden="true" />
                <span class="near-suction-product-card__action" aria-hidden="true"><ArrowRight /></span>
              </div>
              <div class="near-suction-product-card__text">
                <h3>{{ product.title }}</h3>
                <p>{{ product.model }}</p>
                <span v-if="product.price !== null">參考售價 <strong>NT$ {{ product.price.toLocaleString('en-US') }} 起</strong></span><span v-else>售價請洽門市</span>
              </div>
            </NuxtLink>
          </li>
        </ul>
        <nav v-if="data && !error && data.pages > 1" class="product-pagination" aria-label="產品分頁">
          <NuxtLink v-if="data.page > 1" :to="pageRoute(data.page - 1)">上一頁</NuxtLink>
          <NuxtLink v-for="page in pageNumbers" :key="page" :to="pageRoute(page)" :aria-current="page === data.page ? 'page' : undefined">{{ page }}</NuxtLink>
          <NuxtLink v-if="data.page < data.pages" :to="pageRoute(data.page + 1)">下一頁</NuxtLink>
        </nav>
      </div>
    </section>

    <section v-if="productCategories.length" class="near-suction-series" aria-labelledby="near-suction-series-title">
      <div class="near-suction-rail internal-rail-safe">
        <h2 id="near-suction-series-title" v-reveal="{ anim: 'opalMoveUp' }">
          <strong>{{ info.name }}</strong> 廚電產品
        </h2>
        <div v-reveal="{ anim: 'opalMoveUp', delay: 100 }" class="near-suction-series__viewport" role="region" :aria-label="`${info.name} 產品分類`">
          <div class="near-suction-series__track">
            <ul
              v-for="groupIndex in 2"
              :key="groupIndex"
              class="near-suction-series__group"
              :aria-hidden="groupIndex === 2 ? 'true' : undefined"
            >
              <li
                v-for="category in productCategories"
                :key="`${groupIndex}-${category.id}`"
              >
                <NuxtLink :to="category.route" class="near-suction-series-name" :tabindex="groupIndex === 2 ? -1 : undefined">
                  <strong>{{ category.title }}</strong>
                  <span>{{ category.groupLabel }}</span>
                </NuxtLink>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>

    <section class="near-suction-catalogue" aria-labelledby="near-suction-catalogue-title">
      <div class="near-suction-rail internal-rail-safe near-suction-catalogue__grid">
        <div v-reveal="{ anim: 'opalMoveRight' }" class="near-suction-catalogue__copy">
          <InternalSectionPill>{{ info.name }} Product Catalogue</InternalSectionPill>
          <h2 id="near-suction-catalogue-title">
            <span>Kitchen <em>Product</em> Catalogue</span>
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
.product-search { margin: 28px 0; font-family: var(--font-cjk-sans); }
.product-search label { display: block; margin-bottom: 10px; }
.product-search > div { display: flex; gap: 12px; }
.product-search input { min-width: 0; flex: 1; border: 1px solid #c8c8cc; border-radius: 999px; padding: 12px 22px; background: #fff; }
.product-search button { border-radius: 999px; padding: 12px 24px; background: #1c1c1d; color: #fff; cursor: pointer; }
.product-subcategories, .product-pagination { display: flex; flex-wrap: wrap; gap: 12px; margin: 30px 0; font-family: var(--font-cjk-sans); }
.product-subcategories a, .product-pagination a { border: 1px solid #caa05c; border-radius: 999px; padding: 10px 18px; }
.product-pagination { justify-content: center; margin-top: 45px; }
.product-pagination a[aria-current], .product-subcategories a:hover, .product-pagination a:hover { background: #caa05c; color: white; }

.near-suction-catalogue__copy h2 em { color: #caa05c; font-style: normal; }
.near-suction-page { overflow: clip; color: #59585d; background: #fafafa; }
.near-suction-rail { width: min(1410px, 100%); margin-inline: auto; box-sizing: border-box; }
.near-suction-rail.internal-rail-safe { padding-inline: 43px; }

.near-suction-hero {
  position: relative;
  isolation: isolate;
  min-height: 360px;
  overflow: hidden;
  color: #fff;
  background: var(--cms-image-asset_7692def0, url('/section-3/store-songzhu.jpg')) center 68% / cover no-repeat fixed;
}
.near-suction-hero__overlay { position: absolute; z-index: -1; inset: 0; background: #100801; opacity: .64; }
.near-suction-hero__inner { width: min(1410px, calc(100% - 60px)); margin-inline: auto; padding: 138px 0 97px; text-align: center; }
.near-suction-hero h1 { margin: 0 0 35px; color: #fff; font-family: var(--font-display); font-size: 80px; font-weight: 400; line-height: .9523809524; }
.near-suction-hero__trail { display: flex; flex-wrap: wrap; align-items: center; justify-content: center; gap: 10px; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 22px; }
.near-suction-hero__trail a { color: inherit; transition: color .3s ease; }
.near-suction-hero__trail a:hover,
.near-suction-hero__trail a:focus-visible { color: #caa05c; }

.near-suction-products { padding: 100px 30px 125px; background: #fafafa; }
.near-suction-products h2 { display: flex; margin: 0 0 54px; color: #1c1c1d; flex-direction: column; font-weight: 500; }
.near-suction-products h2 span { font-family: var(--font-cjk-serif); font-size: 30px; line-height: 40px; }
.near-suction-products h2 em { margin-bottom: 8px; color: #caa05c; font-family: var(--font-display); font-size: 40px; font-style: normal; font-weight: 400; line-height: 44px; }
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

.near-suction-series { overflow: hidden; padding: 50px 30px 125px; background: #fafafa; }
.near-suction-series h2 { display: flex; margin: 0 0 62px; color: #1c1c1d; align-items: center; justify-content: center; gap: 24px; font-family: var(--font-cjk-serif); font-size: 25px; font-weight: 500; line-height: 36px; text-align: center; }
.near-suction-series h2::before,
.near-suction-series h2::after { height: 1px; flex: 1 1 0; background: #d7d7db; content: ""; }
.near-suction-series h2 strong { font-weight: 700; }
.near-suction-series__viewport { width: 100%; overflow: hidden; }
.near-suction-series__track { display: flex; width: max-content; animation: near-suction-series 48s linear .65s infinite; animation-play-state: paused; }
.near-suction-series__viewport.is-visible .near-suction-series__track { animation-play-state: running; }
.near-suction-series__group { display: flex; flex: none; margin: 0; padding: 0; list-style: none; }
.near-suction-series-name { display: flex; width: 200px; min-width: 200px; align-items: center; justify-content: center; flex-direction: column; gap: 6px; padding-inline: 14px; color: #85858a; text-align: center; cursor: pointer; transition: color .3s ease; }
.near-suction-series-name:focus-visible { outline: 2px solid #caa05c; outline-offset: -2px; border-radius: 4px; }
.near-suction-series-name strong { color: inherit; font-family: var(--font-cjk-sans); font-size: 20px; font-weight: 400; line-height: 28px; white-space: nowrap; }
.near-suction-series-name span { color: #aaa9ae; font-family: var(--font-cjk-sans); font-size: 13px; line-height: 19px; letter-spacing: .08em; white-space: nowrap; }
.near-suction-series-name:hover { color: #59585d; }
.near-suction-series-name:hover span { color: #77777c; }

@keyframes near-suction-series {
  to { transform: translateX(-50%); }
}

.near-suction-catalogue { padding: 120px 30px 130px; background: #fff; }
.near-suction-catalogue__grid { display: grid; grid-template-columns: minmax(0, .78fr) minmax(0, 1.22fr); align-items: center; gap: 70px; }
.near-suction-catalogue__copy h2 { display: flex; margin: 27px 0 38px; color: #1c1c1d; flex-direction: column; font-weight: 500; }
.near-suction-catalogue__copy h2 span { font-family: var(--font-display); font-size: 60px; font-weight: 400; line-height: 64px; }
.near-suction-catalogue__cta { display: inline-flex; height: 60px; align-items: center; gap: 8px; border: 1px solid rgb(159 159 164 / 64%); border-radius: 999px; padding: 9px 9px 9px 30px; color: #1c1c1d; background: transparent; transition: color .3s ease, border-color .3s ease, background-color .3s ease, transform .3s ease; }
.near-suction-catalogue__cta:hover,
.near-suction-catalogue__cta:focus-visible { border-color: #caa05c; color: #fff; background: #caa05c; transform: translateY(-2px); }
.near-suction-catalogue__cta:focus-visible { outline: 2px solid #caa05c; outline-offset: 4px; }
.near-suction-catalogue__cta > span:first-child { white-space: nowrap; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 22px; }
.near-suction-catalogue__cta .site-cta-icon { position: relative; isolation: isolate; display: flex; width: 40px; height: 40px; align-items: center; justify-content: center; border-radius: 50%; color: #fff; background: #caa05c; transform: rotate(-45deg); transition: transform .5s ease; }
.near-suction-catalogue__cta .site-cta-icon::after { position: absolute; z-index: -1; inset: 0; border-radius: 50%; background: #caa05c; content: ""; animation: near-suction-cta-radar 2s ease-out infinite; }
.near-suction-catalogue__cta svg { width: 19px; height: 19px; }
.near-suction-catalogue__cta:hover .site-cta-icon,
.near-suction-catalogue__cta:focus-visible .site-cta-icon { transform: rotate(0); }
.near-suction-catalogue__cta:hover .site-cta-icon::after,
.near-suction-catalogue__cta:focus-visible .site-cta-icon::after { animation: none; opacity: 0; }
@keyframes near-suction-cta-radar { from { opacity: .55; transform: scale(1); } to { opacity: 0; transform: scale(1.55); } }
.near-suction-catalogue__copy > p { margin: 18px 0 0; color: #9f9fa4; font-family: var(--font-cjk-sans); font-size: 13px; line-height: 20px; }
.near-suction-catalogue__cards { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 30px; }
.near-suction-catalogue-card { min-width: 0; }
.near-suction-catalogue-card__cover { aspect-ratio: 1.1; overflow: hidden; border-radius: 24px; background: #fafafa; }
.near-suction-catalogue-card__cover :deep(img) { object-fit: cover; object-position: center 16%; transition: transform .55s ease; }
.near-suction-catalogue-card > span { display: block; margin-top: 18px; color: #caa05c; font-family: var(--font-cjk-sans); font-size: 11px; line-height: 15px; letter-spacing: .1em; text-transform: uppercase; }
.near-suction-catalogue-card h3 { margin: 7px 0 0; color: #1c1c1d; font-family: var(--font-cjk-serif); font-size: 20px; font-weight: 600; line-height: 28px; }
.near-suction-catalogue-card:hover .near-suction-catalogue-card__cover :deep(img) { transform: scale(1.04); }

@media (max-width: 1023px) {
  .near-suction-products { padding-block: 80px 100px; }
  .near-suction-product-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
  .near-suction-series { padding-bottom: 100px; }
  .near-suction-catalogue { padding-block: 96px; }
  .near-suction-catalogue__grid { gap: 42px; }
  .near-suction-catalogue__copy h2 span { font-size: 50px; line-height: 55px; }
}

@media (max-width: 1024px) {
  .near-suction-products h2 em { font-size: 36px; line-height: 42px; }
}

@media (max-width: 767px) {
  .near-suction-rail.internal-rail-safe { padding-inline: 0; }
  .near-suction-hero { min-height: 288px; background-attachment: scroll; }
  .near-suction-hero__inner { width: calc(100% - 30px); padding: 80px 0 60px; }
  .near-suction-hero h1 { margin-bottom: 25px; font-size: clamp(34px, 10.7vw, 42px); line-height: 48px; white-space: nowrap; }
  .near-suction-hero__trail { font-size: 12px; line-height: 18px; }
  .near-suction-products { padding: 60px 15px 80px; }
  .near-suction-products h2 { margin-bottom: 38px; }
  .near-suction-products h2 em { font-size: 30px; line-height: 35px; }
  .near-suction-products h2 span { font-size: 30px; line-height: 40px; }
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
  .near-suction-catalogue__cards { gap: 16px; }
  .near-suction-catalogue-card h3 { font-size: 18px; line-height: 23px; }
}

@media (prefers-reduced-motion: reduce) {
  .near-suction-catalogue__cta,
  .near-suction-catalogue__cta .site-cta-icon,
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
