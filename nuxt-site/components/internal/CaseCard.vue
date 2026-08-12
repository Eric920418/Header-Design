<script setup lang="ts">
import { ArrowUpRight, MapPin } from 'lucide-vue-next'
import type { StoreCaseSummary } from '~/types/content'

defineProps<{ item: StoreCaseSummary }>()
</script>

<template>
  <article class="group overflow-hidden rounded-[24px] bg-white shadow-[0_24px_70px_-40px_rgba(0,0,0,.5)]">
    <NuxtLink :to="`/gallery/${item.slug}`" class="block focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-[#CAA05C]">
      <div class="relative aspect-[1.12] overflow-hidden bg-[#E3E3E8]">
        <img :src="item.cover" :alt="`${item.storeName}案例：${item.title}`" class="h-full w-full object-cover transition-transform duration-700 group-hover:scale-105" />
        <div class="absolute inset-0 bg-gradient-to-t from-black/65 via-transparent to-transparent opacity-70 transition-opacity group-hover:opacity-100" />
        <span class="absolute right-5 top-5 flex h-12 w-12 translate-y-2 items-center justify-center rounded-full bg-[#CAA05C] text-white opacity-0 transition-all duration-500 group-hover:translate-y-0 group-hover:opacity-100"><ArrowUpRight class="h-5 w-5" /></span>
        <div class="absolute inset-x-0 bottom-0 translate-y-3 px-6 pb-6 text-white opacity-0 transition-all duration-500 group-hover:translate-y-0 group-hover:opacity-100"><span class="text-sm">查看完整案例</span></div>
      </div>
      <div class="p-6 sm:p-7">
        <div class="flex items-center justify-between gap-4 text-sm text-[#59585D]"><span>{{ item.city }}</span><span>設計師 {{ item.designer }}</span></div>
        <h2 class="mt-4 line-clamp-3 min-h-[84px] font-display text-[25px] leading-7 text-[#1C1C1D] sm:text-[28px] sm:leading-8">{{ item.title }}</h2>
        <p class="mt-5 flex items-start gap-2 border-t border-[#E3E3E8] pt-5 text-sm leading-6 text-[#59585D]"><MapPin class="mt-0.5 h-4 w-4 shrink-0 text-[#CAA05C]" />{{ item.storeName }}<br class="sr-only" /></p>
      </div>
    </NuxtLink>
  </article>
</template>
