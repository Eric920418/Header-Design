<script setup lang="ts">
import { ArrowLeft, ArrowRight } from 'lucide-vue-next'

const cases = ['/home-2026/gallery/yuan-aifei.jpg','/home-2026/gallery/old-house-kitchen.jpg','/home-2026/gallery/custom-kitchen.jpg']
const active = ref(0)
const paused = ref(false)
const reduced = useReducedMotion()
const dragStart = ref<number | null>(null)
const cards = computed(() => [1, 2].map(offset => ({ image: cases[(active.value + offset) % cases.length], index: (active.value + offset) % cases.length })))
let timer: ReturnType<typeof setInterval> | undefined
const next = () => active.value = (active.value + 1) % cases.length
const prev = () => active.value = (active.value - 1 + cases.length) % cases.length
watch([paused, reduced], ([isPaused, isReduced]) => {
  if (timer) clearInterval(timer)
  if (import.meta.client && !isPaused && !isReduced) timer = setInterval(next, 3200)
}, { immediate: true })
onBeforeUnmount(() => timer && clearInterval(timer))
function pointerUp(event: PointerEvent) { if (dragStart.value === null) return; const delta = event.clientX - dragStart.value; if (delta < -40) next(); else if (delta > 40) prev(); dragStart.value = null }
</script>

<template>
  <section aria-labelledby="gallery-heading" class="gallery-section relative min-h-[956px] overflow-hidden" @mouseenter="paused = true" @mouseleave="paused = false">
    <img v-for="(image, index) in cases" :key="image" :src="image" alt="" class="gallery-bg absolute inset-0 h-full w-full object-cover transition-opacity duration-700" :class="index === active ? 'opacity-100' : 'opacity-0'" />
    <span aria-hidden="true" class="absolute inset-0 bg-[linear-gradient(90deg,rgba(0,0,0,.62)_0%,rgba(0,0,0,.26)_48%,rgba(0,0,0,.12)_100%)]" />
    <div class="gallery-content-shell relative z-10 w-full"><div class="gallery-main-layout">
      <div class="gallery-heading-column">
        <div v-reveal="{ anim: 'opalMoveRight' }" class="mb-[26px]"><InternalSectionPill tone="dark">SHOWROOM PROJECTS</InternalSectionPill></div>
        <h2 id="gallery-heading" v-reveal="{ anim: 'opalMoveLeft', delay: 100 }" class="gallery-heading-title font-display capitalize text-white">Interior Design</h2>
        <p v-reveal="{ anim: 'opalMoveUp', delay: 180 }" class="gallery-description mt-[37px] w-[378px] max-w-full text-[18px] leading-[24px] text-white">Lorem ipsum dolor sit amet consectetur. Magna nunc porttitor convallis faucibus laoreet.</p>
        <div v-reveal="{ anim: 'opalScaleUp', delay: 260 }">
          <NuxtLink to="/gallery" class="site-content-cta group/cta mt-[40px] inline-flex h-[60px] items-center gap-[8px] rounded-full border border-[rgba(159,159,164,.64)] py-[9px] pl-[30px] pr-[9px] text-white hover:border-[#CAA05C] hover:bg-[#CAA05C]"><span class="font-cjk-sans text-[15px]">更多設計</span><span class="site-cta-icon flex h-[40px] w-[40px] -rotate-45 items-center justify-center rounded-full bg-[#CAA05C] transition-transform group-hover/cta:rotate-0"><ArrowRight class="h-5 w-5" /></span></NuxtLink>
        </div>
      </div>
      <div v-reveal="{ anim: 'opalMoveUp', delay: 360 }" class="gallery-case-row flex select-none justify-end touch-pan-y" @pointerdown="dragStart = $event.clientX" @pointerup="pointerUp" @pointercancel="dragStart = null"><div class="gallery-case-layout"><div :key="active" class="gallery-card-pair animate-gallery-card"><button v-for="card in cards" :key="card.index" type="button" :aria-label="`切換至門市案例 ${card.index + 1}`" class="group/card shrink-0 rounded-3xl" @click="active = card.index"><div data-gallery-card class="gallery-case-card aspect-square overflow-hidden rounded-3xl shadow-[0_24px_60px_-12px_rgba(0,0,0,.55)]"><img :src="card.image" alt="" draggable="false" class="h-full w-full object-cover transition-transform duration-700 group-hover/card:scale-[1.06]" /></div></button></div></div></div>
    </div><div data-gallery-controls class="gallery-case-controls mt-[30px] flex items-center justify-center gap-5 lg:mt-0"><button aria-label="上一張" class="flex h-[42px] w-[42px] items-center justify-center rounded-full border border-white/25 bg-black/20 text-white" @click="prev"><ArrowLeft class="h-[18px] w-[18px]" /></button><button aria-label="下一張" class="flex h-[42px] w-[42px] items-center justify-center rounded-full border border-white/25 bg-black/20 text-white" @click="next"><ArrowRight class="h-[18px] w-[18px]" /></button></div></div>
  </section>
</template>
