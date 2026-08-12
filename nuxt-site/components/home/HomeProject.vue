<script setup lang="ts">
import emblaCarouselVue from 'embla-carousel-vue'
import { ArrowLeft, ArrowRight } from 'lucide-vue-next'
import { KITCHEN_STYLES } from '~/data/kitchenStyles'

const [emblaRef, emblaApi] = emblaCarouselVue({ loop: true, align: 'start' })
const dragging = ref(false)
const paused = ref(false)
const reduced = useReducedMotion()
let timer: ReturnType<typeof setInterval> | undefined
let resume: ReturnType<typeof setTimeout> | undefined

watch([emblaApi, reduced], ([api, isReduced]) => {
  if (timer) clearInterval(timer)
  if (!api) return
  api.on('pointerDown', () => dragging.value = true)
  api.on('pointerUp', () => dragging.value = false)
  if (!isReduced) timer = setInterval(() => { if (!paused.value) api.scrollNext() }, 2800)
}, { immediate: true })

function pause() { if (resume) clearTimeout(resume); paused.value = true }
function unpause() { if (resume) clearTimeout(resume); resume = setTimeout(() => paused.value = false, 560) }
onBeforeUnmount(() => { if (timer) clearInterval(timer); if (resume) clearTimeout(resume) })
</script>

<template>
  <section id="kitchen-series" v-reveal data-ev="slideInUp" class="ev relative z-10 bg-[#f6f6f6]">
    <div ref="emblaRef" class="cursor-grab overflow-hidden bg-[#1C1C1D] active:cursor-grabbing" @mouseenter="pause" @mouseleave="unpause"><div class="flex">
      <div v-for="(style, index) in [...KITCHEN_STYLES, ...KITCHEN_STYLES]" :key="index" class="group shrink-0 w-[280px] transition-[width] duration-500 ease-out md:w-[340px] lg:w-[378px]" :class="dragging ? '' : 'hover:w-[420px] md:hover:w-[510px] lg:hover:w-[567px]'">
        <article class="relative -ml-px h-[480px] w-[calc(100%+2px)] overflow-hidden md:h-[640px] lg:h-[880px]">
          <img :src="style.image" :alt="`${style.en} ${style.zh}`" draggable="false" class="absolute inset-0 h-full w-full object-cover object-center" />
          <div class="pointer-events-none absolute inset-x-0 bottom-0 z-[1] h-2/5 bg-[linear-gradient(rgba(0,0,0,0)_0%,rgba(0,0,0,.64)_30%,rgba(0,0,0,1)_100%)]" />
          <span class="absolute left-8 top-8 z-[2] rounded-full border border-white/50 px-4 py-1.5 text-[16px] font-bold text-white backdrop-blur-sm">{{ style.en }}</span>
          <div class="absolute inset-x-0 bottom-0 z-[2] px-8 pb-9"><h3 class="w-fit font-display text-[36px] leading-[44px] text-white transition-colors hover:text-[#CAA05C]">{{ style.zh }}</h3><p class="max-h-0 overflow-hidden text-[16px] leading-[24px] text-white/90 opacity-0 transition-all duration-500 group-hover:mt-2.5 group-hover:max-h-20 group-hover:opacity-100">{{ style.desc }}</p></div>
        </article>
      </div>
    </div></div>
    <button aria-label="向左瀏覽" class="absolute left-[30px] top-1/2 z-20 flex h-12 w-12 -translate-y-1/2 items-center justify-center rounded-full border border-white/30 bg-white/10 text-white backdrop-blur-md hover:border-[#CAA05C] hover:bg-[#CAA05C] lg:left-[60px]" @click="emblaApi?.scrollNext()"><ArrowLeft /></button>
    <button aria-label="向右瀏覽" class="absolute right-[30px] top-1/2 z-20 flex h-12 w-12 -translate-y-1/2 items-center justify-center rounded-full border border-white/30 bg-white/10 text-white backdrop-blur-md hover:border-[#CAA05C] hover:bg-[#CAA05C]" @click="emblaApi?.scrollPrev()"><ArrowRight /></button>
  </section>
</template>
