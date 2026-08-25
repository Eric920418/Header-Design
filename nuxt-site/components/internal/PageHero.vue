<script setup lang="ts">
withDefaults(defineProps<{
  title: string
  eyebrow?: string
  background?: string
  parentLabel?: string
  headingTag?: 'h1' | 'p'
}>(), {
  eyebrow: 'SAKURA KITCHEN',
  background: '/services/h6-bg-2.jpg',
  parentLabel: '首頁',
  headingTag: 'h1',
})
</script>

<template>
  <section class="internal-hero hero-includes-header relative isolate min-h-[390px] overflow-hidden bg-[#1C1C1D] text-white sm:min-h-[470px] lg:min-h-[560px]">
    <img :src="background" alt="" aria-hidden="true" class="absolute inset-0 -z-20 h-full w-full object-cover" />
    <div class="absolute inset-0 -z-10 bg-gradient-to-r from-black/85 via-black/55 to-black/20" />
    <div class="mx-auto flex min-h-[390px] w-[calc(100%_-_30px)] max-w-[1410px] flex-col justify-end pb-14 pt-28 sm:min-h-[470px] sm:w-[calc(100%_-_60px)] sm:pb-20 lg:min-h-[560px] lg:pb-24">
      <div v-reveal="{ anim: 'slideInUp' }">
        <InternalSectionPill tone="dark">{{ eyebrow }}</InternalSectionPill>
        <component :is="headingTag" class="mt-6 max-w-[1000px] font-display text-[54px] font-semibold leading-[.96] sm:text-[78px] lg:text-[110px]">{{ title }}</component>
        <nav aria-label="麵包屑" class="mt-8 flex items-center gap-2 text-sm text-white/75 sm:text-base">
          <NuxtLink to="/" class="transition-colors hover:text-[#CAA05C] focus-visible:text-[#CAA05C]">{{ parentLabel }}</NuxtLink>
          <span aria-hidden="true">/</span>
          <span aria-current="page" class="text-white">{{ title }}</span>
        </nav>
      </div>
    </div>
  </section>
</template>
