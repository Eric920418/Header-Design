<script setup lang="ts">
import { heroImageSource, heroPosition } from '~/shared/cms/hero-media.mjs'

const props = withDefaults(defineProps<{
  slide: { image: string; mobileImage?: string; desktopFocusX?: number; desktopFocusY?: number; mobileFocusX?: number; mobileFocusY?: number }
  alt: string
  viewport?: 'responsive' | 'desktop' | 'mobile'
  imageClass?: string
}>(), { viewport: 'responsive', imageClass: '' })
const image = ref<HTMLImageElement>()
const failed = ref(false)
const source = computed(() => heroImageSource(props.slide, props.viewport))
function checkImage() { failed.value = Boolean(image.value?.complete && !image.value.naturalWidth) }
watch(() => [props.slide.image, props.slide.mobileImage, props.viewport], async () => {
  failed.value = false
  await nextTick()
  checkImage()
})
onMounted(checkImage)
</script>

<template>
  <div class="home-hero-media" :style="{ '--hero-desktop-position': heroPosition(slide, 'desktop'), '--hero-mobile-position': heroPosition(slide, 'mobile') }">
    <picture>
      <source v-if="viewport === 'responsive'" media="(max-width: 767px)" :srcset="heroImageSource(slide, 'mobile')" />
      <img ref="image" :src="source" :alt="alt" class="home-hero-media-image" :class="[imageClass, `home-hero-media-${viewport}`]" @load="failed = false" @error="failed = true" />
    </picture>
    <p v-if="failed" class="home-hero-media-error" role="alert">圖片載入失敗：{{ alt || '輪播圖片' }}<br />{{ viewport === 'mobile' ? heroImageSource(slide, 'mobile') : image?.currentSrc || source }}</p>
  </div>
</template>

<style scoped>
.home-hero-media { position: relative; width: 100%; height: 100%; overflow: hidden; background: #9f9fa4; }
.home-hero-media-image { position: absolute; inset: 0; width: 100%; height: 100%; object-fit: cover; object-position: var(--hero-desktop-position); }
.home-hero-media-mobile { object-position: var(--hero-mobile-position); }
.home-hero-media-error { position: absolute; inset: 12px; z-index: 1; margin: 0; padding: 12px; height: fit-content; color: #fff; background: #701f1fee; font: 13px/1.6 'Noto Sans TC', sans-serif; overflow-wrap: anywhere; }
@media (max-width: 767px) { .home-hero-media-responsive { object-position: var(--hero-mobile-position); } }
</style>
