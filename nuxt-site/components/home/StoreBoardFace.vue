<script setup lang="ts">
import { MapPin } from 'lucide-vue-next'

type Store = {
  id: number
  region: string
  city: string
  name: string
  address: string
  phone: string
}

defineProps<{
  store: Store
  active: boolean
}>()
</script>

<template>
  <div
    class="store-board-surface flex h-full w-full flex-col justify-center overflow-hidden rounded-2xl border px-5 py-3"
    :class="active ? 'border-[#CAA05C] bg-[#CAA05C] text-white' : 'border-[#E3E3E8] bg-white text-[#1C1C1D]'"
  >
    <div class="flex items-center gap-3">
      <span class="rounded-full px-2.5 py-1 text-xs" :class="active ? 'bg-white/20' : 'bg-[#F6F6F6] text-[#59585D]'">{{ store.region }}</span>
      <span class="text-[18px] font-medium">{{ store.name }}</span>
    </div>
    <div class="store-board-meta mt-2.5 flex items-start justify-between gap-3 text-[15px]">
      <span class="flex min-w-0 items-start gap-1.5 leading-[21px]"><MapPin class="mt-px h-[18px] w-[18px] shrink-0" />{{ store.address }}</span>
      <span class="shrink-0 leading-[21px]" :class="active ? 'text-white' : 'text-[#CAA05C]'">{{ store.phone }}</span>
    </div>
  </div>
</template>
