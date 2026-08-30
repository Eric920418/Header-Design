<script setup lang="ts">
import { MapPin } from 'lucide-vue-next'
import type { StoreCaseSummary } from '~/types/content'

defineProps<{ item: StoreCaseSummary }>()

const imageFailed = ref(false)
</script>

<template>
  <article class="antra-store-card">
    <NuxtLink :to="`/gallery/${item.slug}`" class="antra-store-card__image-link" :aria-label="`查看 ${item.storeName} 案例`">
      <figure class="antra-store-card__image">
        <img v-if="!imageFailed" :src="item.cover" :alt="`${item.storeName}門市外觀`" @error="imageFailed = true" />
        <div v-else class="antra-store-card__image-error" role="alert">
          <strong>門市圖片載入失敗</strong>
          <span>無法載入 {{ item.storeName }} 的圖片，請稍後重新整理頁面。</span>
        </div>
      </figure>
    </NuxtLink>

    <div class="antra-store-card__content">
      <NuxtLink :to="`/gallery/${item.slug}`" class="antra-store-card__title-link">
        <h2>{{ item.storeName }}</h2>
      </NuxtLink>
      <address><MapPin aria-hidden="true" /><span>{{ item.address }}</span></address>
      <NuxtLink :to="`/gallery/${item.slug}`" class="antra-store-card__reservation">預約門市</NuxtLink>
    </div>
  </article>
</template>

<style scoped>
.antra-store-card { min-width: 0; }

.antra-store-card__image-link,
.antra-store-card__title-link {
  display: block;
  border-radius: 24px;
}

.antra-store-card__image {
  position: relative;
  height: 350px;
  margin: 0;
  overflow: hidden;
  border-radius: 24px;
  background: #e3e3e8;
}

.antra-store-card__image::after {
  position: absolute;
  inset: 0;
  content: "";
  pointer-events: none;
  background: rgba(0, 0, 0, .24);
  transition: opacity .5s ease;
}

.antra-store-card__image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform .5s ease;
}

.antra-store-card:hover .antra-store-card__image img { transform: scale(1.05); }
.antra-store-card:hover .antra-store-card__image::after { opacity: .7; }

.antra-store-card__image-error {
  position: absolute;
  inset: 0;
  z-index: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 30px;
  color: #1c1c1d;
  background: #e3e3e8;
  text-align: center;
}

.antra-store-card__image-error strong {
  font-family: var(--font-ui);
  font-size: 22px;
  font-weight: 400;
  line-height: 28px;
}

.antra-store-card__image-error span {
  max-width: 300px;
  color: #59585d;
  font-size: 14px;
  line-height: 22px;
}

.antra-store-card__content { padding-top: 22px; }

.antra-store-card h2 {
  margin: 0;
  color: #1c1c1d;
  font-family: var(--font-cjk-serif);
  font-size: 18px;
  font-weight: 600;
  line-height: 27px;
  transition: color .5s ease;
}

.antra-store-card__title-link:hover h2 { color: #caa05c; }

.antra-store-card address {
  display: flex;
  min-height: 0;
  align-items: flex-start;
  gap: 8px;
  margin-top: 8px;
  color: #59585d;
  font-family: var(--font-cjk-sans);
  font-size: 16px;
  font-style: normal;
  line-height: 24px;
}

.antra-store-card address > svg {
  width: 20px;
  height: 20px;
  flex: none;
  margin-top: 2px;
  color: #caa05c;
}

.antra-store-card__reservation {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-height: 34px;
  margin-top: 25px;
  padding: 5px 15px;
  border: 1px solid #caa05c;
  border-radius: 24px;
  color: #fff;
  background: #caa05c;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 22px;
  transition: color .3s ease, background-color .3s ease;
}

.antra-store-card__reservation:hover {
  color: #1c1c1d;
  background: transparent;
}

@media (max-width: 767px) {
  .antra-store-card__image { height: 300px; }
  .antra-store-card__content { padding-top: 15px; text-align: center; }
  .antra-store-card h2 { font-size: 18px; line-height: 27px; }
  .antra-store-card address { min-height: 0; }
}

@media (prefers-reduced-motion: reduce) {
  .antra-store-card__image::after,
  .antra-store-card__image img,
  .antra-store-card h2,
  .antra-store-card__reservation {
    transition: none;
  }

  .antra-store-card:hover .antra-store-card__image img { transform: none; }
}
</style>
