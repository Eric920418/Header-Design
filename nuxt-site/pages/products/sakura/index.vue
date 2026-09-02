<script setup lang="ts">
import { ArrowRight, Database, RefreshCw } from 'lucide-vue-next'
import { SAKURA_PRODUCT_GROUPS } from '~/data/sakuraProducts'
import type { SakuraProductCategory, SakuraProductGroup } from '~/data/sakuraProducts'

const runtimeConfig = useRuntimeConfig()
const productEndpoint = String(runtimeConfig.public.sakuraProductEndpoint || '').trim()

function isRecord(value: unknown): value is Record<string, unknown> {
  return typeof value === 'object' && value !== null && !Array.isArray(value)
}

function parseProductGroups(payload: unknown): SakuraProductGroup[] {
  const rawGroups = Array.isArray(payload)
    ? payload
    : isRecord(payload) && Array.isArray(payload.data)
      ? payload.data
      : null

  if (!rawGroups) {
    throw new Error('商品 API 格式錯誤：預期回傳陣列，或包含 data 陣列的物件。')
  }

  return rawGroups.map((rawGroup, groupIndex) => {
    if (!isRecord(rawGroup) || typeof rawGroup.id !== 'string' || typeof rawGroup.label !== 'string' || !Array.isArray(rawGroup.categories)) {
      throw new Error(`商品 API 格式錯誤：第 ${groupIndex + 1} 個分類群組缺少 id、label 或 categories。`)
    }

    const groupLabel = rawGroup.label
    const categories: SakuraProductCategory[] = rawGroup.categories.map((rawCategory, categoryIndex) => {
      if (
        !isRecord(rawCategory)
        || typeof rawCategory.id !== 'string'
        || typeof rawCategory.title !== 'string'
        || typeof rawCategory.image !== 'string'
      ) {
        throw new Error(`商品 API 格式錯誤：${groupLabel} 的第 ${categoryIndex + 1} 筆分類缺少 id、title 或 image。`)
      }

      return {
        id: rawCategory.id,
        title: rawCategory.title,
        groupLabel: typeof rawCategory.groupLabel === 'string' ? rawCategory.groupLabel : groupLabel,
        image: rawCategory.image,
        route: typeof rawCategory.route === 'string' ? rawCategory.route : undefined,
      }
    })

    return { id: rawGroup.id, label: groupLabel, categories }
  })
}

const {
  data: remoteGroups,
  error: productSourceError,
  status: productSourceStatus,
  refresh: refreshProducts,
} = await useAsyncData<SakuraProductGroup[]>(
  'sakura-product-categories',
  async () => {
    if (!productEndpoint) return []
    const payload = await $fetch<unknown>(productEndpoint)
    return parseProductGroups(payload)
  },
  { default: () => [] },
)

const productGroups = computed(() => remoteGroups.value?.length ? remoteGroups.value : SAKURA_PRODUCT_GROUPS)
const productCategories = computed(() => productGroups.value.flatMap((group) => {
  if (group.id === 'kitchen-appliances') {
    return group.categories.map(category => ({ ...category, groupLabel: 'SUKURA Products' }))
  }
  if (group.id === 'water-heaters') {
    return group.categories.map(category => ({ ...category, groupLabel: 'Water Heater' }))
  }
  if (group.id === 'water-purifiers') {
    const category = group.categories[0]
    return category ? [{ ...category, title: '淨水設備', groupLabel: 'Water Purifier' }] : []
  }
  return group.categories
}))
const usingSnapshot = computed(() => Boolean(productSourceError.value) || Boolean(productEndpoint && !remoteGroups.value?.length))
const sourceStatusTitle = computed(() => productSourceError.value ? '商品資料讀取失敗' : '商品資料介接狀態')
const sourceStatusMessage = computed(() => {
  if (productSourceError.value) {
    return `${productSourceError.value.message}；端點：${productEndpoint}。目前改顯示 PPT 第二頁可核對的分類快照。`
  }
  if (!remoteGroups.value?.length) {
    return `商品 API 沒有回傳任何分類；端點：${productEndpoint}。目前改顯示 PPT 第二頁可核對的分類快照。`
  }
  return ''
})

function retryProducts() {
  void refreshProducts()
}

useSeoMeta({
  title: 'SAKURA Kitchen Appliances｜SAKURA 整體廚房',
  description: '瀏覽 SAKURA 廚電、熱水器與淨水設備共 9 個商品分類。',
  ogTitle: 'SAKURA Kitchen Appliances｜SAKURA 整體廚房',
  ogDescription: 'SAKURA 廚電、熱水器與淨水設備商品分類。',
  ogImage: '/services/sakura-product.png',
})
</script>

<template>
  <main class="sakura-product-page">
    <section class="sakura-product-hero hero-includes-header" aria-labelledby="sakura-product-title">
      <span class="sakura-product-hero__overlay" aria-hidden="true" />
      <div v-reveal="{ anim: 'opalMoveUp' }" class="sakura-product-hero__inner">
        <h1 id="sakura-product-title">Kitchen Appliances</h1>
        <nav aria-label="麵包屑" class="sakura-product-hero__trail">
          <NuxtLink to="/">首頁</NuxtLink>
          <span aria-hidden="true">/</span>
          <span aria-current="page">SAKURA Kitchen Appliances</span>
        </nav>
      </div>
    </section>

    <section class="sakura-product-story" aria-labelledby="sakura-product-story-title">
      <div class="sakura-product-story__rail internal-rail-safe">
        <div v-reveal="{ anim: 'opalMoveUp' }" class="sakura-product-story__copy">
          <InternalSectionPill class="sakura-product-story__eyebrow">Kitchen Appliance</InternalSectionPill>
          <h2 id="sakura-product-story-title">
            Behind <span>Every Statistic Pulses</span> A Human Story
          </h2>
          <p>SAKURA 從廚房日常出發，整合烹調、清潔、熱水與淨水設備，讓每一項產品分類都回到真實家庭的使用需求。</p>
        </div>
        <div v-reveal="{ anim: 'opalMoveUp', delay: 120 }" class="sakura-product-story__image">
          <InternalProductCategoryImage src="/services/sakura-product.png" alt="SAKURA 廚電與整體廚房展示" />
        </div>
      </div>
    </section>

    <section
      v-if="usingSnapshot"
      class="sakura-product-source"
      :aria-labelledby="productSourceError ? 'sakura-source-error-title' : 'sakura-source-status-title'"
      :role="productSourceError ? 'alert' : 'status'"
    >
      <div class="sakura-product-source__rail internal-rail-safe">
        <Database aria-hidden="true" />
        <div>
          <h2 :id="productSourceError ? 'sakura-source-error-title' : 'sakura-source-status-title'">{{ sourceStatusTitle }}</h2>
          <p>{{ sourceStatusMessage }}</p>
        </div>
        <button
          v-if="productEndpoint && productSourceError"
          type="button"
          :disabled="productSourceStatus === 'pending'"
          @click="retryProducts"
        >
          <RefreshCw aria-hidden="true" :class="{ 'is-loading': productSourceStatus === 'pending' }" />
          {{ productSourceStatus === 'pending' ? '重新讀取中' : '重新讀取' }}
        </button>
      </div>
    </section>

    <section class="sakura-product-list" aria-labelledby="sakura-product-list-title">
      <div class="sakura-product-list__rail internal-rail-safe">
        <h2 id="sakura-product-list-title" class="sr-only">SAKURA 廚電商品分類</h2>
        <ul class="sakura-product-grid" aria-label="SAKURA 廚電商品分類">
          <li
            v-for="(category, index) in productCategories"
            :key="category.id"
            v-reveal="{ anim: 'opalMoveUp', delay: Math.min(index * 60, 240) }"
            class="sakura-product-card"
          >
            <NuxtLink v-if="category.route" :to="category.route" class="sakura-product-card__link" :aria-label="`查看${category.title}系列`">
              <article>
                <div class="sakura-product-card__image">
                  <InternalProductCategoryImage :src="category.image" :alt="`${category.title}代表商品`" />
                  <span class="sakura-product-card__shade" aria-hidden="true" />
                  <span class="sakura-product-card__arrow" aria-hidden="true"><ArrowRight /></span>
                </div>
                <div class="sakura-product-card__text">
                  <span>{{ category.groupLabel }}</span>
                  <h3>{{ category.title }}</h3>
                </div>
              </article>
            </NuxtLink>
            <article v-else>
              <div class="sakura-product-card__image">
                <InternalProductCategoryImage :src="category.image" :alt="`${category.title}代表商品`" />
              </div>
              <div class="sakura-product-card__text">
                <span>{{ category.groupLabel }}</span>
                <h3>{{ category.title }}</h3>
              </div>
            </article>
          </li>
        </ul>
      </div>
    </section>
  </main>
</template>

<style scoped>
.sakura-product-page { color: #59585d; background: #f6f6f6; }

.sakura-product-hero {
  position: relative;
  isolation: isolate;
  min-height: 360px;
  overflow: hidden;
  color: #fff;
  background: url('/section-3/store-songzhu.jpg') center 68% / cover no-repeat fixed;
}

.sakura-product-hero__overlay {
  position: absolute;
  z-index: -1;
  inset: 0;
  background: #100801;
  opacity: .64;
}

.sakura-product-hero__inner {
  width: min(1410px, calc(100% - 60px));
  margin-inline: auto;
  padding: 138px 0 97px;
  text-align: center;
}

.sakura-product-hero h1 {
  margin: 0 0 35px;
  color: #fff;
  font-family: var(--font-display);
  font-size: 80px;
  font-weight: 400;
  line-height: .9523809524;
}

.sakura-product-hero__trail {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 22px;
}

.sakura-product-hero__trail a { color: inherit; transition: color .3s ease; }
.sakura-product-hero__trail a:hover,
.sakura-product-hero__trail a:focus-visible { color: #caa05c; }

.sakura-product-story { padding: 100px 30px 80px; background: #f6f6f6; }

.sakura-product-story__rail,
.sakura-product-source__rail,
.sakura-product-list__rail {
  width: min(1410px, 100%);
  margin-inline: auto;
}

.sakura-product-story__rail.internal-rail-safe,
.sakura-product-source__rail.internal-rail-safe,
.sakura-product-list__rail.internal-rail-safe { padding-inline: 43px; }

.sakura-product-story__rail {
  display: grid;
  grid-template-columns: minmax(0, .88fr) minmax(0, 1.12fr);
  align-items: center;
  gap: 72px;
}

.sakura-product-story__eyebrow { margin: 0 0 24px; }

.sakura-product-story h2 {
  max-width: 620px;
  margin: 0 0 25px;
  color: #1c1c1d;
  font-family: var(--font-display);
  font-size: clamp(44px, 4.2vw, 64px);
  font-weight: 400;
  line-height: .98;
}

.sakura-product-story h2 span { color: #caa05c; }
.sakura-product-story__copy > p:last-child { max-width: 610px; margin: 0; font-family: var(--font-cjk-sans); font-size: 16px; line-height: 24px; }

.sakura-product-story__image {
  min-width: 0;
  aspect-ratio: 1.62;
  overflow: hidden;
  border-radius: 24px;
  background: #e3e3e8;
}

.sakura-product-story__image :deep(img) { object-fit: cover; }

.sakura-product-source { padding: 0 30px 50px; background: #f6f6f6; }
.sakura-product-source__rail {
  display: grid;
  grid-template-columns: auto minmax(0, 1fr) auto;
  align-items: center;
  gap: 18px;
  border: 1px solid #e3e3e8;
  border-radius: 18px;
  padding-block: 20px;
  background: #fff;
}

.sakura-product-source__rail > svg { width: 28px; height: 28px; color: #caa05c; }
.sakura-product-source h2 { margin: 0 0 5px; color: #1c1c1d; font-family: var(--font-display); font-size: 20px; font-weight: 400; line-height: 24px; }
.sakura-product-source p { margin: 0; font-size: 14px; line-height: 21px; overflow-wrap: anywhere; }
.sakura-product-source button {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  border: 0;
  border-radius: 999px;
  padding: 12px 18px;
  color: #fff;
  background: #1c1c1d;
  cursor: pointer;
}
.sakura-product-source button:disabled { cursor: wait; opacity: .62; }
.sakura-product-source button svg { width: 17px; height: 17px; }
.sakura-product-source button svg.is-loading { animation: sakura-product-spin .9s linear infinite; }

.sakura-product-list { overflow: hidden; padding: 0 30px 130px; background: #f6f6f6; }
.sakura-product-grid {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 50px 30px;
  margin: 0;
  padding: 0;
  list-style: none;
}

.sakura-product-card,
.sakura-product-card article { min-width: 0; }
.sakura-product-card__link { display: block; color: inherit; }

.sakura-product-card__image {
  position: relative;
  width: 100%;
  aspect-ratio: 4 / 3;
  overflow: hidden;
  border: 1px solid #e3e3e8;
  border-radius: 24px;
  background: #fff;
}

.sakura-product-card__image :deep(img) { transition: transform .55s ease; }
.sakura-product-card__shade { position: absolute; inset: 0; background: rgb(0 0 0 / 42%); opacity: 0; transition: opacity .4s ease; }
.sakura-product-card__arrow {
  position: absolute;
  top: 50%;
  left: 50%;
  display: grid;
  width: 60px;
  height: 60px;
  place-items: center;
  border: 1px solid rgb(255 255 255 / 72%);
  border-radius: 50%;
  color: #fff;
  opacity: 0;
  transform: translate(-50%, -50%) scale(.76) rotate(-45deg);
  transition: opacity .35s ease, transform .35s ease, background-color .35s ease;
}
.sakura-product-card__arrow svg { width: 24px; height: 24px; }
.sakura-product-card__text { padding-top: 20px; }
.sakura-product-card__text span {
  display: block;
  margin-bottom: 8px;
  color: #9f9fa4;
  font-family: var(--font-cjk-sans);
  font-size: 13px;
  line-height: 19px;
  letter-spacing: .12em;
  text-transform: uppercase;
}

.sakura-product-card__text h3 {
  margin: 0;
  color: #1c1c1d;
  font-family: var(--font-cjk-serif);
  font-size: 25px;
  font-weight: 400;
  line-height: 34px;
  transition: color .3s ease;
}

.sakura-product-card:hover .sakura-product-card__image :deep(img) { transform: scale(1.04); }
.sakura-product-card:hover .sakura-product-card__text h3 { color: #caa05c; }
.sakura-product-card__link:hover .sakura-product-card__shade,
.sakura-product-card__link:focus-visible .sakura-product-card__shade,
.sakura-product-card__link:hover .sakura-product-card__arrow,
.sakura-product-card__link:focus-visible .sakura-product-card__arrow { opacity: 1; }
.sakura-product-card__link:hover .sakura-product-card__arrow,
.sakura-product-card__link:focus-visible .sakura-product-card__arrow { background: #caa05c; transform: translate(-50%, -50%) scale(1) rotate(0); }
.sakura-product-card__link:focus-visible { border-radius: 24px; outline-offset: 7px; }

@keyframes sakura-product-spin { to { transform: rotate(360deg); } }

@media (max-width: 1023px) {
  .sakura-product-story { padding-block: 80px 70px; }
  .sakura-product-story__rail { gap: 36px; }
  .sakura-product-story h2 { font-size: 46px; }
  .sakura-product-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
  .sakura-product-list { padding-bottom: 100px; }
}

@media (max-width: 767px) {
  .sakura-product-hero { min-height: 288px; background-attachment: scroll; }
  .sakura-product-hero__inner { width: calc(100% - 30px); padding: 80px 0 60px; }
  .sakura-product-hero h1 { margin-bottom: 25px; font-size: clamp(34px, 10.7vw, 42px); line-height: 48px; white-space: nowrap; }
  .sakura-product-story { padding: 60px 15px 50px; }
  .sakura-product-story__rail.internal-rail-safe,
  .sakura-product-source__rail.internal-rail-safe,
  .sakura-product-list__rail.internal-rail-safe { padding-inline: 0; }
  .sakura-product-story__rail { grid-template-columns: 1fr; gap: 34px; }
  .sakura-product-story h2 { font-size: 40px; line-height: 43px; }
  .sakura-product-story__image { aspect-ratio: 1.35; border-radius: 18px; }
  .sakura-product-source { padding: 0 15px 40px; }
  .sakura-product-source__rail { grid-template-columns: auto minmax(0, 1fr); padding: 18px; }
  .sakura-product-source button { grid-column: 1 / -1; justify-self: start; }
  .sakura-product-list { padding: 0 15px 80px; }
  .sakura-product-grid { grid-template-columns: 1fr; gap: 38px; }
  .sakura-product-card__image { border-radius: 18px; }
  .sakura-product-card__shade { display: none; }
  .sakura-product-card__arrow { top: auto; right: 16px; bottom: 16px; left: auto; width: 52px; height: 52px; opacity: 1; background: #caa05c; transform: none; }
  .sakura-product-card__link:hover .sakura-product-card__arrow,
  .sakura-product-card__link:focus-visible .sakura-product-card__arrow { transform: none; }
  .sakura-product-card__text h3 { font-size: 25px; line-height: 31px; }
}

@media (prefers-reduced-motion: reduce) {
  .sakura-product-card__image :deep(img),
  .sakura-product-card__shade,
  .sakura-product-card__text h3,
  .sakura-product-card__arrow { transition: none; }
  .sakura-product-card:hover .sakura-product-card__image :deep(img) { transform: none; }
  .sakura-product-source button svg.is-loading { animation: none; }
}
</style>
