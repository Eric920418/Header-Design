<script setup lang="ts">
import emblaCarouselVue from 'embla-carousel-vue'
import { brandFamilies as cmsSeed_brandFamilies } from '~/data/brandAdvantage'
const { brandFamilies } = await useCmsResource('data-brandAdvantage', { brandFamilies: cmsSeed_brandFamilies })


const [emblaRef, emblaApi] = emblaCarouselVue({ loop: true, align: 'start' })
const reduced = useReducedMotion()
let timer: ReturnType<typeof setInterval> | undefined

watch([emblaApi, reduced], ([api, isReduced]) => {
  if (timer) clearInterval(timer)
  if (api && !isReduced) timer = setInterval(() => api.scrollNext(), 4000)
}, { immediate: true })

onBeforeUnmount(() => timer && clearInterval(timer))
</script>

<template>
  <div v-reveal="{ anim: 'opalMoveLeft', delay: 400 }" data-ev="opalMoveLeft" class="brand-family-reveal ev" style="animation-delay:400ms">
    <div ref="emblaRef" class="brand-family-viewport">
      <div class="brand-family-track">
        <article v-for="family in brandFamilies" :key="family.id" class="brand-family-slide">
          <InternalBrandImage :src="family.image" :alt="`${family.title} ${family.englishTitle}`" class="brand-family-image" />
          <h3>{{ family.title }}</h3>
          <p>{{ family.englishTitle }}</p>
        </article>
      </div>
    </div>
  </div>
</template>

<style scoped>
.brand-family-viewport { overflow: hidden; cursor: grab; }
.brand-family-viewport:active { cursor: grabbing; }
.brand-family-track { display: flex; margin-left: -18px; touch-action: pan-y pinch-zoom; }
.brand-family-slide { min-width: 0; flex: 0 0 20%; padding-left: 18px; }
.brand-family-image { aspect-ratio: .7 / 1; border-radius: 24px; }
.brand-family-slide h3 { margin: 18px 0 0; color: #1c1c1d; font-family: var(--font-cjk-sans); font-size: 18px; font-weight: 400; line-height: 26px; }
.brand-family-slide p { margin: 3px 0 0; color: #9f9fa4; font-family: var(--font-editorial); font-size: 20px; line-height: 28px; }

@media (max-width: 1366px) { .brand-family-slide { flex-basis: 25%; } }
@media (max-width: 1024px) { .brand-family-slide { flex-basis: 33.3333%; } }
@media (max-width: 880px) { .brand-family-slide { flex-basis: 50%; } }
@media (max-width: 568px) {
  .brand-family-slide { flex-basis: 82%; }
  .brand-family-image { height: 400px; aspect-ratio: auto; }
  .brand-family-slide h3 { font-size: 18px; line-height: 26px; }
  .brand-family-slide p { font-size: 18px; line-height: 26px; }
}

@media (prefers-reduced-motion: reduce) {
  .brand-family-viewport { scroll-behavior: auto; }
}
</style>
