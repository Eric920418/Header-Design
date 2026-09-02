<script setup lang="ts">
import emblaCarouselVue from 'embla-carousel-vue'

const styles = [
  { zh: '現代風', en: 'Modern', logo: '/brand-logos/5.svg' },
  { zh: '輕奢風', en: 'Modern Luxury', logo: '/brand-logos/6.svg' },
  { zh: '北歐風', en: 'Scandinavian', logo: '/brand-logos/4.svg' },
  { zh: '工業風', en: 'Industrial', logo: '/brand-logos/3.svg' },
  { zh: '美式風', en: 'American', logo: '/brand-logos/1.svg' },
  { zh: '鄉村風', en: 'Country', logo: '/brand-logos/2.svg' },
]
const previews = ['/kitchen-styles/basic-plus.jpg','/kitchen-styles/ai-kitchen.jpg','/kitchen-styles/clever.jpg','/kitchen-styles/loft-chic.jpg','/kitchen-styles/joyful.jpg','/kitchen-styles/premium.jpg','/kitchen-styles/elegant.jpg','/kitchen-styles/chef.jpg','/kitchen-styles/country.jpg','/kitchen-styles/harmony.jpg']
const [emblaRef, emblaApi] = emblaCarouselVue({ loop: true, align: 'start', duration: 25 })
const preview = ref<{ left: number; top: number; title: string } | null>(null)
const previewIndex = ref(0)
const paused = ref(false)
const interacted = ref(false)
const reduced = useReducedMotion()
let autoplay: ReturnType<typeof setInterval> | undefined
let previewTimer: ReturnType<typeof setInterval> | undefined

function showPreview(event: MouseEvent | FocusEvent, index: number, title: string) {
  const anchor = event.currentTarget as HTMLElement
  const rect = anchor.getBoundingClientRect()
  previewIndex.value = index % previews.length
  preview.value = { left: Math.min(window.innerWidth - 132, Math.max(132, rect.left + rect.width / 2)), top: Math.max(12, rect.top - 166), title }
}

watch(preview, (value) => {
  if (previewTimer) clearInterval(previewTimer)
  if (value && !reduced.value) previewTimer = setInterval(() => previewIndex.value = (previewIndex.value + 1) % previews.length, 1100)
})

watch([emblaApi, reduced], ([api, isReduced]) => {
  if (autoplay) clearInterval(autoplay)
  if (!api || isReduced) return
  api.on('pointerDown', () => interacted.value = true)
  autoplay = setInterval(() => { if (!paused.value && !interacted.value) api.scrollPrev() }, 4000)
}, { immediate: true })

onBeforeUnmount(() => { if (autoplay) clearInterval(autoplay); if (previewTimer) clearInterval(previewTimer) })
</script>

<template>
  <section aria-label="廚房風格" aria-roledescription="carousel" class="group/brands overflow-hidden bg-[#fafafa] px-[15px] py-3 md:px-[30px] md:py-4" @mouseenter="paused = true" @mouseleave="paused = false; preview = null">
    <div class="mx-auto w-full max-w-[1770px]">
      <div ref="emblaRef" class="h-[62px] overflow-hidden"><div class="flex h-[62px] touch-pan-y">
        <template v-for="setIndex in 3" :key="setIndex"><div v-for="(item, index) in styles" :key="`${setIndex}-${item.en}`" class="brand-carousel-slide group/item mr-[120px] flex h-[62px] min-w-0 shrink-0 items-center justify-center overflow-visible">
          <a href="#" :tabindex="setIndex > 1 ? -1 : undefined" class="flex h-[62px] shrink-0 items-center justify-center gap-4 p-[2px]" @click.prevent @mouseenter="showPreview($event, index, item.zh)" @focus="showPreview($event, index, item.zh)" @mouseleave="preview = null" @blur="preview = null">
            <img :src="item.logo" alt="" draggable="false" class="h-[58px] w-auto transition-[filter,opacity] duration-300 group-hover/brands:opacity-50 group-hover/brands:grayscale group-hover/item:!opacity-100 group-hover/item:!grayscale-0" />
            <span class="shrink-0 leading-tight text-[#59585D] transition-colors group-hover/item:text-[#CAA05C]"><span class="block text-[15px] font-bold">{{ item.zh }}</span><span class="block text-[13px] tracking-wide">{{ item.en }}</span></span>
          </a>
        </div></template>
      </div></div>
    </div>
    <Teleport to="body"><div v-if="preview" aria-hidden="true" class="pointer-events-none fixed z-[95] hidden w-[240px] overflow-hidden rounded-[14px] border border-white/30 bg-[#1C1C1D] p-1 shadow-[0_18px_45px_rgba(0,0,0,.38)] md:block" :style="{ left: `${preview.left}px`, top: `${preview.top}px`, transform: 'translateX(-50%)' }"><div class="h-[148px] overflow-hidden rounded-[10px]"><img :src="previews[previewIndex]" :alt="preview.title" class="style-preview-image h-full w-full object-cover" /></div></div></Teleport>
  </section>
</template>
