<script setup lang="ts">
import { ChevronRight } from 'lucide-vue-next'
import { KITCHEN_STYLES } from '~/data/kitchenStyles'

const slides = ['/home-2026/hero/ai-kitchen.jpg', '/home-2026/hero/clever-kitchen.jpg', '/home-2026/hero/basic-plus.jpg']
const seriesOpen = ref(false)
const activeSlide = ref(0)
const previousSlide = ref<number | null>(null)
const reduced = useReducedMotion()
let timer: ReturnType<typeof setInterval> | undefined

watch(reduced, (value) => {
  if (timer) clearInterval(timer)
  if (!import.meta.client || value) return
  timer = setInterval(() => {
    previousSlide.value = activeSlide.value
    activeSlide.value = (activeSlide.value + 1) % slides.length
  }, 5000)
}, { immediate: true })
onBeforeUnmount(() => timer && clearInterval(timer))
</script>

<template>
  <section class="hero-template-section hero-includes-header relative w-full overflow-hidden bg-[#9F9FA4]" aria-labelledby="hero-title">
    <div class="hidden" aria-hidden="true"><img v-for="image in slides" :key="image" :src="image" alt="" /></div>
    <!-- Antra Home 01 / Slider Revolution `slidingoverlaydown` + `double`：
         暗色新圖先向下揭幕，原色新圖延遲 333ms 再覆蓋。 -->
    <div :key="`hero-${activeSlide}`" aria-hidden="true" class="pointer-events-none absolute inset-0 overflow-hidden">
      <span v-if="previousSlide === null" class="absolute inset-0 bg-[#9F9FA4]" />
      <img v-else :src="slides[previousSlide]" alt="" class="absolute inset-0 h-full w-full object-cover object-center" />
      <span class="hero-page1-image-layer hero-page1-image-layer-masked">
        <img :src="slides[activeSlide]" alt="" class="absolute inset-0 h-full w-full object-cover object-center" />
        <span class="absolute inset-0 bg-[rgba(16,8,1,0.46)]" />
      </span>
      <span class="hero-page1-image-layer hero-page1-image-layer-final"><img :src="slides[activeSlide]" alt="" class="absolute inset-0 h-full w-full object-cover object-center" /></span>
    </div>
    <div aria-hidden="true" class="pointer-events-none absolute inset-x-0 bottom-0 z-[3] h-[58%] bg-[linear-gradient(180deg,rgba(0,0,0,0)_0%,rgba(0,0,0,.42)_42%,rgba(0,0,0,.86)_100%)]" />

    <div class="hero-template-top z-10 transition-transform duration-500" :class="seriesOpen ? 'lg:translate-x-[200px]' : 'lg:translate-x-0'">
      <div>
        <!-- Home 06 原始 `antra-heading` widget：eyebrow 與 H1 是同一個 slideInLeft 動畫單元。 -->
        <div v-reveal="{ anim: 'slideInLeft', duration: 'slow' }">
          <div class="hero-template-eyebrow-row mb-[20px] flex justify-center">
            <InternalSectionPill tone="dark">Trusted Design Partner</InternalSectionPill>
          </div>
          <h1 id="hero-title" class="hero-template-title m-0 font-display font-normal capitalize tracking-[-1px] text-white">Find Your <span class="text-[#CAA05C]">Inspired</span><br /><span class="text-[#CAA05C]">Kitchen</span> Design</h1>
        </div>
        <p v-reveal="{ anim: 'slideInLeft', duration: 'slow' }" class="hero-template-description mt-[30px] font-sans text-[18px] font-medium leading-[24px] text-white">Transform your vision into reality with our innovative designs, creating modern spaces that blend functionality, aesthetics, and sustainability.</p>
      </div>
    </div>

    <div aria-hidden="true" class="hero-template-divider absolute inset-x-0 z-10 h-px bg-white/25" />
    <div class="hero-template-bottom z-20 transition-transform duration-500" :class="seriesOpen ? 'lg:translate-x-[200px]' : 'lg:translate-x-0'">
      <div class="hero-template-cta h-[120px] w-[120px] shrink-0">
        <div v-reveal="{ anim: 'fadeIn', delay: 900, duration: 'slow' }" class="h-full w-full rounded-[200px] backdrop-blur-[58px]">
          <a href="#contact" class="hero-start-project flex h-full w-full items-center justify-center rounded-[100px] border border-[#FFFFFF12] bg-[#5C5C5C75] text-center font-display text-[18px] leading-[24px] text-white transition-colors hover:text-[#CAA05C]"><span class="relative z-[1]">Start<br />Project</span></a>
        </div>
      </div>
      <div class="hero-template-watermark-slot pointer-events-none">
        <div class="hero-template-watermark select-none whitespace-nowrap text-right font-display opacity-[0.64]">
          <div v-reveal="{ anim: 'fadeInUp', delay: 900, duration: 'slow' }"><span aria-hidden="true" class="block bg-[linear-gradient(180deg,#CAA05C_14.9%,rgba(159,159,164,0)_80.95%)] bg-clip-text text-transparent">Kitchen</span></div>
        </div>
      </div>
    </div>

    <div class="fixed left-0 top-1/2 z-40 hidden -translate-y-1/2 lg:block">
      <div class="relative">
        <div id="hero-kitchen-series" :aria-hidden="!seriesOpen" :inert="seriesOpen ? undefined : true" class="absolute left-0 top-0 overflow-hidden transition-all duration-500" :class="seriesOpen ? 'w-[210px] opacity-100' : 'pointer-events-none w-0 opacity-0'">
          <div class="w-[210px] border-y border-white/10 bg-[rgba(0,0,0,.66)] py-3 backdrop-blur-md">
            <ul>
              <li v-for="style in KITCHEN_STYLES" :key="style.slug">
                <NuxtLink v-if="style.available && style.route" :to="style.route" class="flex items-center justify-between gap-3 whitespace-nowrap border-l-2 border-transparent py-2 pl-6 pr-4 text-[15px] text-white transition-colors hover:border-[#CAA05C] hover:bg-white/5 hover:text-[#CAA05C]" @click="seriesOpen = false">
                  <span>{{ style.zh }}</span><span class="text-[10px] uppercase text-white/55">{{ style.en }}</span>
                </NuxtLink>
                <button v-else type="button" class="flex w-full items-center justify-between gap-3 whitespace-nowrap border-l-2 border-transparent py-2 pl-6 pr-4 text-left text-[15px] text-white transition-colors hover:border-[#CAA05C] hover:bg-white/5 hover:text-[#CAA05C]" @click="seriesOpen = false">
                  <span>{{ style.zh }}</span><span class="max-w-[78px] truncate text-[10px] uppercase text-white/55">{{ style.en }}</span>
                </button>
              </li>
            </ul>
          </div>
        </div>
        <button type="button" aria-controls="hero-kitchen-series" :aria-expanded="seriesOpen" :aria-label="seriesOpen ? '收合品牌系列選單' : '展開品牌系列選單'" class="flex h-36 w-10 flex-col items-center justify-center gap-2 rounded-r-2xl border border-white/10 bg-[rgba(0,0,0,.55)] text-white/85 backdrop-blur-md transition-all duration-500 hover:text-[#CAA05C]" :class="seriesOpen ? 'translate-x-[210px]' : ''" @click="seriesOpen = !seriesOpen">
          <ChevronRight class="h-5 w-5 transition-transform" :class="seriesOpen ? 'rotate-180' : ''" /><span class="writing-vertical text-base tracking-[.3em]">品牌系列</span>
        </button>
      </div>
    </div>
  </section>
</template>
