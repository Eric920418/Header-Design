<script setup lang="ts">
import { ArrowLeft, ArrowRight, Download, X } from 'lucide-vue-next'
import { PRODUCT_CATALOGUES } from '~/data/productCatalogues'
import {
  SAKURA_NEAR_SUCTION_PRODUCTS,
  getSakuraNearSuctionProductRoute,
  type SakuraNearSuctionProduct,
} from '~/data/sakuraNearSuctionProducts'

const route = useRoute()
const resolvedProduct = computed(() => {
  const productId = String(route.params.product ?? '').toLowerCase()
  return SAKURA_NEAR_SUCTION_PRODUCTS.find(item => item.id === productId)
})

if (!resolvedProduct.value) {
  throw createError({
    statusCode: 404,
    statusMessage: `找不到 SAKURA 近吸系列產品：${String(route.params.product || '未提供型號')}`,
  })
}

const product = computed<SakuraNearSuctionProduct>(() => resolvedProduct.value as SakuraNearSuctionProduct)
const activeImageIndex = ref(0)
const specificationsDialog = ref<HTMLDialogElement | null>(null)
const relatedStart = ref(0)
const catalogueHighlights = PRODUCT_CATALOGUES.slice(0, 2)

const activeImage = computed(() => product.value.gallery[activeImageIndex.value] ?? product.value.image)
const relatedProducts = computed(() => SAKURA_NEAR_SUCTION_PRODUCTS.filter(item => item.id !== product.value.id))
const visibleRelatedProducts = computed(() => {
  const items = relatedProducts.value
  return Array.from({ length: Math.min(4, items.length) }, (_, offset) => items[(relatedStart.value + offset) % items.length])
})

watch(() => product.value.id, () => {
  activeImageIndex.value = 0
  relatedStart.value = 0
})

function selectPreviousImage() {
  const length = product.value.gallery.length
  if (length > 1) activeImageIndex.value = (activeImageIndex.value - 1 + length) % length
}

function selectNextImage() {
  const length = product.value.gallery.length
  if (length > 1) activeImageIndex.value = (activeImageIndex.value + 1) % length
}

function moveRelated(direction: number) {
  const length = relatedProducts.value.length
  if (length) relatedStart.value = (relatedStart.value + direction + length) % length
}

function openSpecifications() {
  specificationsDialog.value?.showModal()
}

function closeSpecifications() {
  specificationsDialog.value?.close()
}

function closeSpecificationsOnBackdrop(event: MouseEvent) {
  if (event.target === specificationsDialog.value) closeSpecifications()
}

const formatPrice = (price: number) => `$${price.toLocaleString('en-US')}`

useSeoMeta({
  title: () => `${product.value.model} ${product.value.title}｜SAKURA 廚電產品`,
  description: () => `${product.value.model} ${product.value.title}產品特色、詳細規格、附件與同系列商品。`,
  ogTitle: () => `${product.value.model} ${product.value.title}｜SAKURA 廚電產品`,
  ogDescription: () => product.value.features.slice(0, 2).join('；'),
  ogImage: () => product.value.gallery[0] ?? product.value.image,
})
</script>

<template>
  <main class="product-detail-page">
    <section class="product-detail-hero" aria-label="產品導覽">
      <span class="product-detail-hero__overlay" aria-hidden="true" />
      <div v-reveal="{ anim: 'opalMoveUp' }" class="product-detail-hero__inner">
        <nav aria-label="麵包屑" class="product-detail-hero__trail">
          <NuxtLink to="/">首頁</NuxtLink>
          <span aria-hidden="true">/</span>
          <NuxtLink to="/products/sakura">SAKURA 廚電產品</NuxtLink>
          <span aria-hidden="true">/</span>
          <NuxtLink to="/products/sakura/range-hood">除油煙機系列</NuxtLink>
          <span aria-hidden="true">/</span>
          <NuxtLink to="/products/sakura/range-hood/near-suction">近吸系列</NuxtLink>
          <span aria-hidden="true">/</span>
          <span aria-current="page">{{ product.title }}</span>
        </nav>
      </div>
    </section>

    <section class="product-overview" aria-labelledby="product-overview-title">
      <div class="product-detail-rail internal-rail-safe product-overview__grid">
        <div v-reveal="{ anim: 'opalMoveRight' }" class="product-gallery">
          <div class="product-gallery__stage">
            <Transition name="product-image" mode="out-in">
              <InternalProductCategoryImage
                :key="activeImage"
                :src="activeImage"
                :alt="`${product.title} ${product.model}，商品圖片 ${activeImageIndex + 1}`"
              />
            </Transition>
            <div v-if="product.gallery.length > 1" class="product-gallery__controls" aria-label="商品圖片切換">
              <button type="button" aria-label="上一張商品圖片" @click="selectPreviousImage">
                <ArrowLeft aria-hidden="true" />
              </button>
              <button type="button" aria-label="下一張商品圖片" @click="selectNextImage">
                <ArrowRight aria-hidden="true" />
              </button>
            </div>
          </div>
          <p class="product-gallery__counter" aria-live="polite">
            {{ String(activeImageIndex + 1).padStart(2, '0') }} / {{ String(product.gallery.length).padStart(2, '0') }}
          </p>
        </div>

        <div v-reveal="{ anim: 'opalMoveUp', delay: 100 }" class="product-overview__content">
          <span class="product-brand-pill"><i aria-hidden="true" />SAKURA</span>
          <h1 id="product-overview-title">{{ product.title }}</h1>
          <p class="product-model">{{ product.model }}</p>

          <div class="product-features">
            <h3>產品特色</h3>
            <ul>
              <li v-for="feature in product.features" :key="feature">{{ feature }}</li>
            </ul>
          </div>

          <div class="product-variants" aria-label="商品型號與建議售價">
            <div v-for="variant in product.variants" :key="variant.model" class="product-variant-row">
              <span>{{ variant.model }}</span>
              <strong>{{ formatPrice(variant.price) }}</strong>
            </div>
          </div>

          <div class="product-actions" aria-labelledby="product-attachments-title">
            <h3 id="product-attachments-title">產品資料</h3>
            <button type="button" class="product-action-button product-action-button--primary" @click="openSpecifications">
              <span>詳細規格</span>
              <span class="product-action-button__icon"><ArrowRight aria-hidden="true" /></span>
            </button>
            <a
              v-for="attachment in product.attachments"
              :key="attachment.id"
              :href="attachment.url"
              target="_blank"
              rel="noopener noreferrer"
              class="product-action-button product-action-button--attachment"
            >
              <span>{{ attachment.label }}</span>
              <Download aria-hidden="true" />
            </a>
          </div>

          <div class="product-thumbnails" aria-label="選擇商品圖片">
            <button
              v-for="(image, index) in product.gallery"
              :key="image"
              type="button"
              :class="{ 'is-active': activeImageIndex === index }"
              :aria-label="`顯示第 ${index + 1} 張商品圖片`"
              :aria-pressed="activeImageIndex === index"
              @click="activeImageIndex = index"
            >
              <InternalProductCategoryImage :src="image" :alt="`${product.model} 縮圖 ${index + 1}`" />
            </button>
          </div>
        </div>
      </div>
    </section>

    <section class="related-products" aria-labelledby="related-products-title">
      <div class="product-detail-rail internal-rail-safe">
        <div class="related-products__heading">
          <div>
            <span>Related Products</span>
            <h2 id="related-products-title">SAKURA 廚電產品</h2>
          </div>
          <div class="related-products__controls" aria-label="切換相關產品">
            <button type="button" aria-label="上一組相關產品" @click="moveRelated(-1)"><ArrowLeft aria-hidden="true" /></button>
            <button type="button" aria-label="下一組相關產品" @click="moveRelated(1)"><ArrowRight aria-hidden="true" /></button>
          </div>
        </div>

        <ul class="related-products__grid">
          <li v-for="item in visibleRelatedProducts" :key="item.id">
            <NuxtLink :to="getSakuraNearSuctionProductRoute(item)" class="related-product-card">
              <span class="related-product-card__image">
                <InternalProductCategoryImage :src="item.image" :alt="`${item.title} ${item.model}`" />
              </span>
              <span class="related-product-card__copy">
                <strong>{{ item.title }}</strong>
                <small>{{ item.model }}</small>
                <span>建議售價 <b>${{ item.price }}</b></span>
              </span>
            </NuxtLink>
          </li>
        </ul>
      </div>
    </section>

    <section class="product-catalogue" aria-labelledby="product-catalogue-title">
      <div class="product-detail-rail internal-rail-safe product-catalogue__grid">
        <div v-reveal="{ anim: 'opalMoveRight' }" class="product-catalogue__copy">
          <span class="product-brand-pill"><i aria-hidden="true" />SAKURA Product Catalogue</span>
          <h2 id="product-catalogue-title">廚房商品型錄</h2>
          <NuxtLink to="/catalogues/catalog" class="site-content-cta product-catalogue__cta" aria-label="前往廚房商品型錄與產品保養">
            <span>廚房商品型錄下載</span>
            <span class="site-cta-icon"><ArrowRight aria-hidden="true" /></span>
          </NuxtLink>
          <p>集中查看五大商品型錄與產品保養重點。</p>
        </div>

        <div class="product-catalogue__cards">
          <article
            v-for="(catalogue, index) in catalogueHighlights"
            :key="catalogue.id"
            v-reveal="{ anim: 'opalMoveUp', delay: 100 + index * 100 }"
            class="product-catalogue-card"
          >
            <div class="product-catalogue-card__cover">
              <InternalProductCategoryImage :src="catalogue.cover" :alt="`${catalogue.title}封面預覽`" />
            </div>
            <span>Catalogue Preview</span>
            <h3>{{ catalogue.title }}</h3>
          </article>
        </div>
      </div>
    </section>

    <dialog
      ref="specificationsDialog"
      class="product-specifications-dialog"
      aria-labelledby="product-specifications-title"
      @click="closeSpecificationsOnBackdrop"
      @cancel.prevent="closeSpecifications"
    >
      <div class="product-specifications-dialog__panel">
        <div class="product-specifications-dialog__heading">
          <div>
            <span>{{ product.model }}</span>
            <h2 id="product-specifications-title">詳細規格</h2>
          </div>
          <button type="button" aria-label="關閉詳細規格" autofocus @click="closeSpecifications">
            <X aria-hidden="true" />
          </button>
        </div>
        <dl class="product-specifications-list">
          <template v-for="(property, index) in product.properties" :key="`${property.label}-${index}`">
            <dt>
              <span v-if="index === 0 || product.properties[index - 1]?.label !== property.label">{{ property.label }}</span>
              <span v-else class="sr-only">{{ property.label }}</span>
            </dt>
            <dd>{{ property.value }}</dd>
          </template>
        </dl>
      </div>
    </dialog>
  </main>
</template>

<style scoped>
.product-detail-page { overflow: clip; color: #59585d; background: #f6f6f6; }
.product-detail-rail { width: min(1410px, 100%); margin-inline: auto; box-sizing: border-box; }
.product-detail-rail.internal-rail-safe { padding-inline: 43px; }

.product-detail-hero {
  position: relative;
  isolation: isolate;
  min-height: 200px;
  overflow: hidden;
  color: #fff;
  background: url('/section-3/service-process/breadcrumb-df.jpg') center / cover no-repeat fixed;
}
.product-detail-hero__overlay { position: absolute; z-index: -1; inset: 0; background: #100801; opacity: .64; }
.product-detail-hero__inner { width: min(1410px, calc(100% - 60px)); margin-inline: auto; padding: 91px 0 87px; text-align: center; }
.product-detail-hero__trail { display: flex; flex-wrap: wrap; align-items: center; justify-content: center; gap: 10px; font-family: var(--font-ui); font-size: 13px; line-height: 16px; text-transform: uppercase; }
.product-detail-hero__trail a { color: inherit; transition: color .3s ease; }
.product-detail-hero__trail a:hover,
.product-detail-hero__trail a:focus-visible { color: #caa05c; }

.product-overview { padding: 112px 30px 132px; background: #f6f6f6; }
.product-overview__grid { display: grid; grid-template-columns: minmax(0, 1.08fr) minmax(410px, .92fr); align-items: start; gap: clamp(58px, 6vw, 102px); }
.product-gallery { position: sticky; top: 92px; min-width: 0; }
.product-gallery__stage { position: relative; display: grid; overflow: hidden; aspect-ratio: 1; place-items: center; border-radius: 26px; background: #fff; }
.product-gallery__stage :deep(> img),
.product-gallery__stage :deep(.product-category-image-error) { grid-area: 1 / 1; }
.product-gallery__stage :deep(img) { padding: 28px; object-fit: contain; }
.product-gallery__controls { position: absolute; right: 25px; bottom: 25px; display: flex; gap: 8px; }
.product-gallery__controls button,
.related-products__controls button { display: flex; width: 48px; height: 48px; align-items: center; justify-content: center; border: 1px solid #e3e3e8; border-radius: 50%; color: #1c1c1d; background: rgb(255 255 255 / 90%); cursor: pointer; transition: border-color .3s ease, color .3s ease, background-color .3s ease; }
.product-gallery__controls svg,
.related-products__controls svg { width: 19px; height: 19px; }
.product-gallery__controls button:hover,
.product-gallery__controls button:focus-visible,
.related-products__controls button:hover,
.related-products__controls button:focus-visible { border-color: #caa05c; color: #fff; background: #caa05c; }
.product-gallery__counter { margin: 18px 5px 0; color: #9f9fa4; font-family: var(--font-ui); font-size: 12px; line-height: 16px; letter-spacing: .12em; }
.product-image-enter-active,
.product-image-leave-active { transition: opacity .22s ease, transform .22s ease; }
.product-image-enter-from { opacity: 0; transform: scale(.985); }
.product-image-leave-to { opacity: 0; transform: scale(1.015); }

.product-overview__content { min-width: 0; padding-top: 4px; }
.product-brand-pill { display: inline-flex; width: max-content; align-items: center; gap: 7px; border: 1px solid #e3e3e8; border-radius: 999px; padding: 7px 13px; color: #59585d; font-family: var(--font-ui); font-size: 11px; line-height: 14px; letter-spacing: .08em; text-transform: uppercase; }
.product-brand-pill i { width: 5px; height: 5px; flex: none; border-radius: 50%; background: #caa05c; }
.product-overview__content > h1 { margin: 26px 0 8px; color: #1c1c1d; font-family: var(--font-display); font-size: clamp(42px, 4vw, 62px); font-weight: 400; line-height: 1.06; }
.product-model { margin: 0; color: #caa05c; font-family: var(--font-ui); font-size: 18px; line-height: 25px; letter-spacing: .08em; }
.product-features { padding: 41px 0 36px; border-bottom: 1px solid #e3e3e8; }
.product-features h3,
.product-actions h3 { margin: 0 0 18px; color: #1c1c1d; font-family: var(--font-display); font-size: 17px; font-weight: 400; line-height: 23px; }
.product-features ul { display: grid; gap: 10px; margin: 0; padding: 0; list-style: none; }
.product-features li { position: relative; padding-left: 17px; font-size: 15px; line-height: 24px; }
.product-features li::before { position: absolute; top: 9px; left: 0; width: 5px; height: 5px; border-radius: 50%; background: #caa05c; content: ''; }
.product-variants { padding: 25px 0; border-bottom: 1px solid #e3e3e8; }
.product-variant-row { display: flex; align-items: baseline; justify-content: space-between; gap: 18px; padding: 8px 0; }
.product-variant-row span { color: #59585d; font-family: var(--font-ui); font-size: 15px; line-height: 22px; }
.product-variant-row strong { color: #1c1c1d; font-family: var(--font-ui); font-size: 24px; line-height: 30px; }
.product-actions { padding-top: 31px; }
.product-action-button { display: flex; width: 100%; align-items: center; justify-content: space-between; border-radius: 999px; font-family: var(--font-ui); text-decoration: none; transition: border-color .3s ease, color .3s ease, background-color .3s ease; }
.product-action-button--primary { min-height: 62px; border: 0; padding: 8px 9px 8px 27px; color: #fff; background: #1c1c1d; cursor: pointer; }
.product-action-button__icon { display: flex; width: 44px; height: 44px; align-items: center; justify-content: center; border-radius: 50%; color: #1c1c1d; background: #caa05c; }
.product-action-button__icon svg { width: 19px; height: 19px; }
.product-action-button--attachment { min-height: 54px; margin-top: 9px; border: 1px solid #e3e3e8; padding: 11px 20px 11px 26px; color: #59585d; background: #fff; }
.product-action-button--attachment svg { width: 18px; height: 18px; color: #caa05c; }
.product-action-button--attachment:hover,
.product-action-button--attachment:focus-visible { border-color: #caa05c; color: #1c1c1d; }
.product-action-button:focus-visible { outline: 2px solid #caa05c; outline-offset: 4px; }
.product-thumbnails { display: flex; flex-wrap: wrap; gap: 11px; margin-top: 28px; }
.product-thumbnails button { width: 76px; height: 76px; overflow: hidden; border: 1px solid #e3e3e8; border-radius: 12px; padding: 5px; background: #fff; cursor: pointer; transition: border-color .3s ease, box-shadow .3s ease; }
.product-thumbnails button.is-active { border-color: #caa05c; box-shadow: 0 0 0 1px #caa05c; }
.product-thumbnails button:focus-visible { outline: 2px solid #caa05c; outline-offset: 3px; }

.related-products { padding: 120px 30px 135px; background: #fff; }
.related-products__heading { display: flex; align-items: end; justify-content: space-between; gap: 36px; margin-bottom: 54px; }
.related-products__heading > div:first-child > span { color: #caa05c; font-family: var(--font-ui); font-size: 11px; line-height: 15px; letter-spacing: .11em; text-transform: uppercase; }
.related-products__heading h2 { margin: 11px 0 0; color: #1c1c1d; font-family: var(--font-display); font-size: 60px; font-weight: 400; line-height: 64px; }
.related-products__controls { display: flex; flex: none; gap: 8px; padding-bottom: 5px; }
.related-products__grid { display: grid; grid-template-columns: repeat(4, minmax(0, 1fr)); gap: 30px; margin: 0; padding: 0; list-style: none; }
.related-product-card { display: block; min-width: 0; color: inherit; }
.related-product-card:focus-visible { border-radius: 20px; outline: 2px solid #caa05c; outline-offset: 6px; }
.related-product-card__image { display: block; overflow: hidden; aspect-ratio: 4 / 3; border-radius: 20px; background: #f6f6f6; }
.related-product-card__image :deep(img) { transition: transform .55s ease; }
.related-product-card__copy { display: block; padding: 20px 4px 0; }
.related-product-card__copy strong { display: block; min-height: 54px; color: #1c1c1d; font-family: var(--font-ui); font-size: 20px; font-weight: 400; line-height: 27px; transition: color .3s ease; }
.related-product-card__copy small { display: block; margin: 5px 0 13px; color: #85858a; font-family: var(--font-ui); font-size: 16px; line-height: 22px; }
.related-product-card__copy > span { color: #59585d; font-size: 14px; line-height: 21px; }
.related-product-card__copy b { color: #1c1c1d; font-family: var(--font-ui); font-size: 17px; }
.related-product-card:hover .related-product-card__image :deep(img) { transform: scale(1.045); }
.related-product-card:hover .related-product-card__copy strong { color: #caa05c; }

.product-catalogue { padding: 120px 30px 130px; background: #f6f6f6; }
.product-catalogue__grid { display: grid; grid-template-columns: minmax(0, .78fr) minmax(0, 1.22fr); align-items: center; gap: 70px; }
.product-catalogue__copy h2 { margin: 27px 0 38px; color: #1c1c1d; font-family: var(--font-display); font-size: 60px; font-weight: 400; line-height: 64px; }
.product-catalogue__cta { display: inline-flex; height: 60px; align-items: center; gap: 8px; border: 0; border-radius: 999px; padding: 9px 9px 9px 30px; color: #fff; background: #1c1c1d; transition: transform .3s ease, background-color .3s ease; }
.product-catalogue__cta:hover,
.product-catalogue__cta:focus-visible { background: #2a2a2b; transform: translateY(-2px); }
.product-catalogue__cta:focus-visible { outline: 2px solid #caa05c; outline-offset: 4px; }
.product-catalogue__cta > span:first-child { white-space: nowrap; font-size: 15px; line-height: 22px; }
.product-catalogue__cta .site-cta-icon { display: flex; width: 40px; height: 40px; align-items: center; justify-content: center; border-radius: 50%; color: #1c1c1d; background: #caa05c; }
.product-catalogue__cta svg { width: 19px; height: 19px; }
.product-catalogue__copy > p { margin: 18px 0 0; color: #9f9fa4; font-size: 13px; line-height: 20px; }
.product-catalogue__cards { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 30px; }
.product-catalogue-card { min-width: 0; }
.product-catalogue-card__cover { aspect-ratio: 1.1; overflow: hidden; border-radius: 24px; background: #fff; }
.product-catalogue-card__cover :deep(img) { object-fit: cover; object-position: center 16%; transition: transform .55s ease; }
.product-catalogue-card > span { display: block; margin-top: 18px; color: #caa05c; font-size: 11px; line-height: 15px; letter-spacing: .1em; text-transform: uppercase; }
.product-catalogue-card h3 { margin: 7px 0 0; color: #1c1c1d; font-family: var(--font-display); font-size: 22px; font-weight: 400; line-height: 28px; }
.product-catalogue-card:hover .product-catalogue-card__cover :deep(img) { transform: scale(1.04); }

.product-specifications-dialog { width: min(980px, calc(100% - 60px)); max-width: none; max-height: calc(100dvh - 60px); margin: auto; padding: 0; overflow: hidden; border: 0; border-radius: 24px; color: #59585d; background: #f6f6f6; box-shadow: 0 26px 80px rgb(0 0 0 / 38%); }
.product-specifications-dialog::backdrop { background: rgb(16 8 1 / 76%); backdrop-filter: blur(8px); }
.product-specifications-dialog__panel { max-height: calc(100dvh - 60px); overflow-y: auto; padding: 50px; }
.product-specifications-dialog__heading { display: flex; align-items: start; justify-content: space-between; gap: 30px; margin-bottom: 34px; }
.product-specifications-dialog__heading span { color: #caa05c; font-family: var(--font-ui); font-size: 13px; letter-spacing: .1em; }
.product-specifications-dialog__heading h2 { margin: 7px 0 0; color: #1c1c1d; font-family: var(--font-display); font-size: 46px; font-weight: 400; line-height: 52px; }
.product-specifications-dialog__heading button { display: flex; width: 48px; height: 48px; flex: none; align-items: center; justify-content: center; border: 1px solid #e3e3e8; border-radius: 50%; color: #1c1c1d; background: #fff; cursor: pointer; }
.product-specifications-dialog__heading button:hover,
.product-specifications-dialog__heading button:focus-visible { border-color: #caa05c; color: #fff; background: #caa05c; }
.product-specifications-dialog__heading svg { width: 20px; height: 20px; }
.product-specifications-list { display: grid; grid-template-columns: minmax(220px, .78fr) minmax(0, 1.22fr); margin: 0; border-top: 1px solid #d9d9de; border-left: 1px solid #d9d9de; }
.product-specifications-list dt,
.product-specifications-list dd { margin: 0; border-right: 1px solid #d9d9de; border-bottom: 1px solid #d9d9de; padding: 16px 18px; font-size: 14px; line-height: 22px; }
.product-specifications-list dt { color: #1c1c1d; background: #fff; font-weight: 700; }
.product-specifications-list dd { background: #f9f9f9; }

@media (max-width: 1023px) {
  .product-overview { padding-block: 90px 108px; }
  .product-overview__grid { grid-template-columns: minmax(0, 1fr) minmax(340px, .9fr); gap: 42px; }
  .product-gallery { position: static; }
  .related-products,
  .product-catalogue { padding-block: 96px; }
  .related-products__heading h2,
  .product-catalogue__copy h2 { font-size: 50px; line-height: 55px; }
  .related-products__grid { grid-template-columns: repeat(2, minmax(0, 1fr)); gap-block: 44px; }
  .product-catalogue__grid { gap: 42px; }
}

@media (max-width: 767px) {
  .product-detail-rail.internal-rail-safe { padding-inline: 0; }
  .product-detail-hero { min-height: 180px; background-attachment: scroll; }
  .product-detail-hero__inner { width: calc(100% - 30px); padding: 74px 0 61px; }
  .product-detail-hero__trail { font-size: 11px; line-height: 15px; }
  .product-overview { padding: 62px 15px 80px; }
  .product-overview__grid { grid-template-columns: 1fr; gap: 44px; }
  .product-gallery__stage { border-radius: 18px; }
  .product-gallery__stage :deep(img) { padding: 14px; }
  .product-gallery__controls { right: 14px; bottom: 14px; }
  .product-gallery__controls button,
  .related-products__controls button { width: 43px; height: 43px; }
  .product-overview__content > h1 { margin-top: 22px; font-size: 40px; line-height: 45px; }
  .product-features { padding-top: 31px; }
  .product-thumbnails button { width: 66px; height: 66px; }
  .related-products { padding: 76px 15px 84px; }
  .related-products__heading { align-items: end; gap: 18px; margin-bottom: 38px; }
  .related-products__heading h2 { font-size: 38px; line-height: 43px; }
  .related-products__grid { grid-template-columns: 1fr; gap: 42px; }
  .related-product-card__image { border-radius: 18px; }
  .related-product-card__copy strong { min-height: 0; }
  .product-catalogue { padding: 74px 15px 82px; }
  .product-catalogue__grid { grid-template-columns: 1fr; }
  .product-catalogue__copy h2 { margin-block: 22px 30px; font-size: 43px; line-height: 48px; }
  .product-catalogue__cards { gap: 16px; }
  .product-catalogue-card__cover { border-radius: 18px; }
  .product-catalogue-card h3 { font-size: 18px; line-height: 23px; }
  .product-specifications-dialog { width: calc(100% - 30px); max-height: calc(100dvh - 30px); border-radius: 18px; }
  .product-specifications-dialog__panel { max-height: calc(100dvh - 30px); padding: 28px 20px; }
  .product-specifications-dialog__heading h2 { font-size: 36px; line-height: 42px; }
  .product-specifications-list { grid-template-columns: 1fr; border-left: 0; }
  .product-specifications-list dt,
  .product-specifications-list dd { border-left: 1px solid #d9d9de; }
  .product-specifications-list dt { padding-bottom: 5px; border-bottom: 0; }
  .product-specifications-list dd { padding-top: 5px; }
  .product-specifications-list dt:has(.sr-only) { display: none; }
}

@media (prefers-reduced-motion: reduce) {
  .product-image-enter-active,
  .product-image-leave-active,
  .related-product-card__image :deep(img),
  .related-product-card__copy strong,
  .product-catalogue-card__cover :deep(img) { transition: none; }
  .related-product-card:hover .related-product-card__image :deep(img),
  .product-catalogue-card:hover .product-catalogue-card__cover :deep(img) { transform: none; }
}
</style>
