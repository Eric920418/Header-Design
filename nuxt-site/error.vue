<script setup lang="ts">
import { ArrowLeft, RefreshCcw } from 'lucide-vue-next'
import type { NuxtError } from '#app'

const props = defineProps<{ error: NuxtError }>()
const status = computed(() => props.error.statusCode || 500)
const title = computed(() => status.value === 404 ? '找不到這個頁面' : '頁面暫時無法顯示')
const message = computed(() => props.error.message || props.error.statusMessage || '發生未預期的錯誤，請稍後再試。')
const retry = () => clearError({ redirect: window.location.pathname })
</script>

<template>
  <div id="top" class="min-h-screen bg-[#F6F6F6]">
    <SiteHeader />
    <div class="h-[60px]" />
    <main class="flex min-h-[calc(100vh-60px)] items-center justify-center px-5 py-20">
      <div class="w-full max-w-[760px] rounded-[28px] bg-white p-8 text-center shadow-sm sm:p-14">
        <p class="font-display text-[90px] leading-none text-[#CAA05C] sm:text-[140px]">{{ status }}</p>
        <h1 class="mt-5 font-display text-4xl text-[#1C1C1D] sm:text-5xl">{{ title }}</h1>
        <p role="alert" class="mx-auto mt-5 max-w-xl text-base leading-8 text-[#59585D]">{{ message }}</p>
        <div class="mt-8 flex flex-wrap justify-center gap-3">
          <button type="button" class="inline-flex items-center gap-2 rounded-full bg-[#1C1C1D] px-6 py-3.5 text-sm text-white hover:bg-[#CAA05C]" @click="retry"><RefreshCcw class="h-4 w-4" />重試</button>
          <NuxtLink to="/" class="inline-flex items-center gap-2 rounded-full border border-[#E3E3E8] px-6 py-3.5 text-sm text-[#1C1C1D] hover:border-[#CAA05C]"><ArrowLeft class="h-4 w-4" />返回首頁</NuxtLink>
        </div>
      </div>
    </main>
    <SiteFooter />
  </div>
</template>
