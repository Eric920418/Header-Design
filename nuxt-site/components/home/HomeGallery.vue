<script setup lang="ts">
const cmsCopy = await useCmsResource('view-components-home-HomeGallery', {"cases":[{"slug":"case10","store":"安康店","image":"/section-3/cases/case10/case10_content_asset_03_20260904.webp"},{"slug":"case56","store":"承德店","image":"/section-3/cases/case56/case56_content_asset_04_20260904.webp"},{"slug":"case35","store":"松竹店","image":"/section-3/cases/case35/case35_content_asset_11_20260904.webp"}],"copy":{"field1":"","text2":"SHOWROOM PROJECTS","text3":"設計案例","field4":"/design-inspiration","text5":"更多設計","field6":""},"cmsSettings":{"visible":true,"seoTitle":"","seoDescription":""}})

import { ArrowLeft, ArrowRight } from 'lucide-vue-next'

const cases = cmsCopy.cases
const active = ref(0)
const reduced = useReducedMotion()
const dragStart = ref<number | null>(null)
const dragged = ref(false)
const pointerHeld = ref(false)
const activeCase = computed(() => cases[active.value]!)
const cards = computed(() => [1, 2].map(offset => ({ ...cases[(active.value + offset) % cases.length]!, index: (active.value + offset) % cases.length })))
let timer: ReturnType<typeof setInterval> | undefined
const next = () => active.value = (active.value + 1) % cases.length
const prev = () => active.value = (active.value - 1 + cases.length) % cases.length
watch(reduced, (isReduced) => {
  if (timer) clearInterval(timer)
  if (import.meta.client && !isReduced) timer = setInterval(() => { if (!pointerHeld.value) next() }, 3200)
}, { immediate: true })
onBeforeUnmount(() => timer && clearInterval(timer))
function pointerUp(event: PointerEvent) { pointerHeld.value = false; if (dragStart.value === null) return; const delta = event.clientX - dragStart.value; dragged.value = Math.abs(delta) > 40; if (delta < -40) next(); else if (delta > 40) prev(); dragStart.value = null }
useHead(() => ({ ...(cmsCopy.cmsSettings.seoTitle ? {title:cmsCopy.cmsSettings.seoTitle}:{}), meta: cmsCopy.cmsSettings.seoDescription ? [{name:'description',content:cmsCopy.cmsSettings.seoDescription}] : [] }))
</script>

<template>
  <template v-if="cmsCopy.cmsSettings.visible">
  <section aria-labelledby="gallery-heading" class="gallery-section relative min-h-[956px] overflow-hidden">
    <NuxtLink :to="`/gallery/${activeCase.slug}`" :aria-label="`查看${activeCase.store}門市案例介紹`" class="absolute inset-0 cursor-pointer" @pointerdown="pointerHeld = true" @pointerup="pointerHeld = false" @pointerleave="pointerHeld = false" @pointercancel="pointerHeld = false"><img v-for="(item, index) in cases" :key="item.slug" :src="item.image" :alt="cmsCopy.copy.field1" class="gallery-bg absolute inset-0 h-full w-full object-cover transition-opacity duration-700" :class="index === active ? 'opacity-100' : 'opacity-0'" /></NuxtLink>
    <span aria-hidden="true" class="pointer-events-none absolute inset-0 bg-[linear-gradient(90deg,rgba(0,0,0,.62)_0%,rgba(0,0,0,.26)_48%,rgba(0,0,0,.12)_100%)]" />
    <div class="gallery-content-shell pointer-events-none relative z-10 w-full"><div class="gallery-main-layout">
      <div class="gallery-heading-column pointer-events-auto">
        <div v-reveal="{ anim: 'opalMoveRight' }" class="mb-[26px]"><InternalSectionPill tone="dark">{{ cmsCopy.copy.text2 }}</InternalSectionPill></div>
        <h2 id="gallery-heading" v-reveal="{ anim: 'opalMoveLeft', delay: 100 }" class="gallery-heading-title font-cjk-serif font-semibold text-white">{{ cmsCopy.copy.text3 }}</h2>
        <div v-reveal="{ anim: 'opalScaleUp', delay: 260 }">
          <NuxtLink :to="cmsCopy.copy.field4" class="site-content-cta group/cta mt-[40px] inline-flex h-[60px] items-center gap-[8px] rounded-full border border-[rgba(159,159,164,.64)] py-[9px] pl-[30px] pr-[9px] text-white hover:border-[#CAA05C] hover:bg-[#CAA05C]"><span class="font-cjk-sans text-[15px]">{{ cmsCopy.copy.text5 }}</span><span class="site-cta-icon flex h-[40px] w-[40px] -rotate-45 items-center justify-center rounded-full bg-[#CAA05C] transition-transform group-hover/cta:rotate-0"><ArrowRight class="h-5 w-5" /></span></NuxtLink>
        </div>
      </div>
      <div v-reveal="{ anim: 'opalMoveUp', delay: 360 }" class="gallery-case-row flex select-none justify-end touch-pan-y" @pointerdown="pointerHeld = true; dragStart = $event.clientX; dragged = false" @pointerup="pointerUp" @pointerleave="pointerHeld = false; dragStart = null" @pointercancel="pointerHeld = false; dragStart = null"><div class="gallery-case-layout"><div :key="active" class="gallery-card-pair animate-gallery-card"><NuxtLink v-for="card in cards" :key="card.index" :to="`/gallery/${card.slug}`" :aria-label="`查看${card.store}門市案例介紹`" class="group/card pointer-events-auto shrink-0 cursor-pointer rounded-3xl" @click.capture="dragged && $event.detail > 0 && $event.preventDefault()"><div data-gallery-card class="gallery-case-card aspect-square overflow-hidden rounded-3xl shadow-[0_24px_60px_-12px_rgba(0,0,0,.55)]"><img :src="card.image" :alt="cmsCopy.copy.field6" draggable="false" class="h-full w-full object-cover transition-transform duration-700 group-hover/card:scale-[1.06]" /></div></NuxtLink></div></div></div>
    </div><div data-gallery-controls class="gallery-case-controls mt-[30px] flex items-center justify-center gap-5 lg:mt-0"><button aria-label="上一張" class="pointer-events-auto flex h-[42px] w-[42px] cursor-pointer items-center justify-center rounded-full border border-white/25 bg-black/20 text-white" @click="prev"><ArrowLeft class="h-[18px] w-[18px]" /></button><button aria-label="下一張" class="pointer-events-auto flex h-[42px] w-[42px] cursor-pointer items-center justify-center rounded-full border border-white/25 bg-black/20 text-white" @click="next"><ArrowRight class="h-[18px] w-[18px]" /></button></div></div>
  </section>
</template>
</template>

<style scoped>
.gallery-case-controls button { transition: background-color .3s ease, border-color .3s ease; }
.gallery-case-controls button:hover,
.gallery-case-controls button:focus-visible { background: #caa05c; border-color: #caa05c; color: #fff; }
</style>
