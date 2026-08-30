<script setup lang="ts">
import { MapPin } from 'lucide-vue-next'
import type { StoreCaseDetail } from '~/types/content'

const props = withDefaults(defineProps<{
  item: StoreCaseDetail
  featured?: boolean
  revealDelay?: number
  source?: 'inspiration'
}>(), {
  featured: false,
  revealDelay: 0,
})

const excerpt = computed(() => props.item.article?.[0]?.paragraphs[0] ?? '')
const detailRoute = computed(() => props.source === 'inspiration'
  ? { path: `/gallery/${props.item.slug}`, query: { from: 'inspiration' } }
  : `/gallery/${props.item.slug}`)
</script>

<template>
  <article
    class="case-recommendation-card"
    :class="{ 'case-recommendation-card--featured': featured }"
    v-reveal="{ anim: 'opalMoveUp', delay: revealDelay }"
  >
    <div class="case-recommendation-card__media">
      <NuxtLink :to="detailRoute" class="case-recommendation-card__image-link">
        <InternalCaseImage :src="item.images[0]!" :alt="`${item.title}案例照片`" class="case-recommendation-card__image" />
      </NuxtLink>
      <a
        :href="item.contact?.lineUrl ?? item.reservationUrl"
        target="_blank"
        rel="noopener noreferrer"
        class="case-recommendation-card__booking"
      >預約門市</a>
    </div>

    <div class="case-recommendation-card__body">
      <div class="case-recommendation-card__meta">
        <span>{{ item.storeName }}</span>
        <span>設計師 {{ item.designer }}</span>
      </div>
      <h3><NuxtLink :to="detailRoute">{{ item.title }}</NuxtLink></h3>
      <p class="case-recommendation-card__location"><MapPin aria-hidden="true" />{{ item.city }}</p>
      <p v-if="excerpt" class="case-recommendation-card__excerpt">{{ excerpt }}</p>
    </div>
  </article>
</template>

<style scoped>
.case-recommendation-card { position: relative; min-width: 0; height: 560px; }
.case-recommendation-card__media { position: relative; }
.case-recommendation-card__image-link { display: block; overflow: hidden; border-radius: 24px; }
.case-recommendation-card__image { width: 100%; aspect-ratio: 1.40625; transition: transform .5s ease; }
.case-recommendation-card:hover .case-recommendation-card__image { transform: scale(1.05); }
.case-recommendation-card__booking { position: absolute; z-index: 2; top: 20px; left: 20px; padding: 7px 13px; border-radius: 24px; color: #fff; background: #caa05c; font-family: var(--font-ui); font-size: 12px; line-height: 14px; transition: color .3s ease, background-color .3s ease; }
.case-recommendation-card__booking:hover { color: #fff; background: #1c1c1d; }
.case-recommendation-card__body { padding-top: 21px; }
.case-recommendation-card__meta { display: flex; justify-content: space-between; gap: 16px; color: #9f9fa4; font-size: 13px; line-height: 20px; }
.case-recommendation-card h3 { display: -webkit-box; min-height: 60px; margin-top: 8px; overflow: hidden; color: #1c1c1d; font-family: var(--font-display); font-size: 20px; font-weight: 600; line-height: 30px; -webkit-box-orient: vertical; -webkit-line-clamp: 2; }
.case-recommendation-card h3 a { transition: color .3s ease; }
.case-recommendation-card h3 a:hover { color: #caa05c; }
.case-recommendation-card__location { display: flex; align-items: flex-start; gap: 8px; margin-top: 13px; color: #59585d; font-size: 14px; line-height: 22px; }
.case-recommendation-card__location :deep(svg) { width: 16px; height: 16px; margin-top: 3px; flex: 0 0 auto; color: #caa05c; }
.case-recommendation-card__excerpt { display: -webkit-box; overflow: hidden; margin-top: 13px; color: #59585d; font-size: 14px; line-height: 22px; -webkit-box-orient: vertical; -webkit-line-clamp: 3; }

.case-recommendation-card--featured { overflow: hidden; border-radius: 24px; }
.case-recommendation-card--featured .case-recommendation-card__media,
.case-recommendation-card--featured .case-recommendation-card__image-link,
.case-recommendation-card--featured .case-recommendation-card__image { height: 100%; }
.case-recommendation-card--featured .case-recommendation-card__image-link { border-radius: 0; }
.case-recommendation-card--featured .case-recommendation-card__image { aspect-ratio: .8035714286; }
.case-recommendation-card--featured .case-recommendation-card__media::after { position: absolute; z-index: 1; inset: 45% 0 0; content: ""; pointer-events: none; background: linear-gradient(180deg, rgba(185,183,174,0) 0%, rgba(134,132,126,.54) 31%, #53524e 76%); }
.case-recommendation-card--featured .case-recommendation-card__body { position: absolute; z-index: 2; right: 37px; bottom: 42px; left: 50px; padding: 0; color: #fff; }
.case-recommendation-card--featured .case-recommendation-card__meta,
.case-recommendation-card--featured .case-recommendation-card__location { color: #fff; }
.case-recommendation-card--featured h3,
.case-recommendation-card--featured h3 a { color: #fff; }
.case-recommendation-card--featured h3 { min-height: 0; }
.case-recommendation-card--featured .case-recommendation-card__excerpt { display: none; }

@media (max-width: 1366px) and (min-width: 1025px) {
  .case-recommendation-card { height: 517px; }
}

@media (max-width: 1200px) and (min-width: 1025px) {
  .case-recommendation-card { height: 448px; }
  .case-recommendation-card h3 { font-size: 20px; line-height: 30px; }
  .case-recommendation-card--featured .case-recommendation-card__body { right: 15px; bottom: 30px; left: 15px; }
}

@media (max-width: 1024px) {
  .case-recommendation-card,
  .case-recommendation-card--featured { height: auto; overflow: visible; border-radius: 0; }
  .case-recommendation-card--featured .case-recommendation-card__media,
  .case-recommendation-card--featured .case-recommendation-card__image-link,
  .case-recommendation-card--featured .case-recommendation-card__image { height: auto; }
  .case-recommendation-card--featured .case-recommendation-card__image-link { border-radius: 24px; }
  .case-recommendation-card--featured .case-recommendation-card__image { aspect-ratio: 1.40625; }
  .case-recommendation-card--featured .case-recommendation-card__media::after { display: none; }
  .case-recommendation-card--featured .case-recommendation-card__body { position: static; padding-top: 21px; color: inherit; }
  .case-recommendation-card--featured .case-recommendation-card__meta { color: #9f9fa4; }
  .case-recommendation-card--featured .case-recommendation-card__location { color: #59585d; }
  .case-recommendation-card--featured h3,
  .case-recommendation-card--featured h3 a { color: #1c1c1d; }
  .case-recommendation-card--featured .case-recommendation-card__excerpt { display: -webkit-box; }
}

@media (max-width: 767px) {
  .case-recommendation-card h3 { font-size: 20px; line-height: 28px; }
  .case-recommendation-card__meta { flex-direction: column; gap: 2px; }
}

@media (prefers-reduced-motion: reduce) {
  .case-recommendation-card__image,
  .case-recommendation-card__booking,
  .case-recommendation-card h3 a { transition: none; }
  .case-recommendation-card:hover .case-recommendation-card__image { transform: none; }
}
</style>
