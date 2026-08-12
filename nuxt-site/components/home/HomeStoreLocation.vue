<script setup lang="ts">
import { ChevronDown, LocateFixed, MapPin } from 'lucide-vue-next'

type Store = { id: number; region: string; city: string; name: string; address: string; phone: string }
const stores: Store[] = [
  { id: 0, region: '北部', city: '臺北市', name: '承德店', address: '臺北市士林區承德路四段238號', phone: '02-28839919' },
  { id: 1, region: '北部', city: '臺北市', name: '石牌店', address: '臺北市北投區石牌路一段68號', phone: '02-28218500' },
  { id: 2, region: '北部', city: '臺北市', name: '民權店', address: '臺北市中山區民權東路二段68號', phone: '02-25371659' },
  { id: 3, region: '北部', city: '臺北市', name: '中山南京店', address: '臺北市中山區中山北路一段71號', phone: '02-25238868' },
  { id: 4, region: '北部', city: '臺北市', name: '八德店', address: '臺北市松山區八德路4段230號', phone: '02-27486733' },
]
const regions: Record<string, string[]> = {
  北部: ['臺北市','新北市','基隆市','新竹市','桃園市','新竹縣','宜蘭縣'],
  中部: ['臺中市','苗栗縣','彰化縣','南投縣','雲林縣'],
  南部: ['高雄市','臺南市','嘉義市','嘉義縣','屏東縣','澎湖縣'],
  東部: ['花蓮縣','臺東縣'],
  離島: ['金門縣','連江縣'],
}
const region = ref('')
const city = ref('')
const selected = ref(0)
const focused = ref(false)
const paused = ref(false)
const reduced = useReducedMotion()
const visibleIds = ref(stores.slice(0, 4).map(store => store.id))
const filtered = computed(() => stores.filter(store => (!region.value || store.region === region.value) && (!city.value || store.city === city.value)))
const visible = computed(() => filtered.value.find(store => store.id === selected.value) || filtered.value[0] || stores[0])
let timer: ReturnType<typeof setInterval> | undefined

watch(region, () => city.value = '')
watch(filtered, value => visibleIds.value = value.slice(0, 4).map(store => store.id), { deep: true })
watch([filtered, paused, reduced], ([list, isPaused, isReduced]) => {
  if (timer) clearInterval(timer)
  if (!import.meta.client || isPaused || isReduced || list.length <= 4) return
  timer = setInterval(() => {
    const candidates = list.filter(store => !visibleIds.value.includes(store.id))
    const slots = visibleIds.value.map((id, index) => ({ id, index })).filter(item => item.id !== selected.value)
    if (!candidates.length || !slots.length) return
    const slot = slots[Math.floor(Math.random() * slots.length)]
    const candidate = candidates[Math.floor(Math.random() * candidates.length)]
    visibleIds.value[slot.index] = candidate.id
  }, 2200)
}, { immediate: true, deep: true })
onBeforeUnmount(() => timer && clearInterval(timer))
</script>

<template>
  <section id="contact" aria-labelledby="store-location-heading" class="store-location-section relative overflow-hidden bg-[#f6f6f6] py-[60px]">
    <div class="mx-auto w-full max-w-[1512px] pl-5 pr-[88px] sm:pl-8 sm:pr-[90px] lg:pl-[51px] lg:pr-[86px]">
      <div class="relative mb-[60px]"><div class="grid grid-cols-1 items-start lg:grid-cols-[minmax(260px,424px)_minmax(0,1fr)] lg:pt-[46px]"><div class="mb-5 lg:mb-0"><span class="inline-flex items-center gap-1.5 rounded-[24px] border border-[rgba(159,159,164,.18)] px-[13px] py-[7px] pl-[9px] font-display text-[12px] uppercase tracking-[1px] text-[#1C1C1D]"><span class="h-1.5 w-1.5 rounded-full bg-[#CAA05C]" />門市查詢</span></div><h2 id="store-location-heading" class="max-w-[661px] font-display text-[42px] leading-[46px] text-[#1C1C1D] sm:text-[52px] sm:leading-[56px] xl:text-[60px] xl:leading-[64px]">Have a Project in <span class="text-[#CAA05C]">Mind?<br />Let’s Make</span> It Happen</h2></div></div>
      <div class="flex min-w-0 flex-col gap-8 lg:flex-row">
        <div class="flex w-full min-w-0 flex-col lg:w-[62%] lg:shrink-0"><div class="h-[var(--store-map-h)] overflow-hidden rounded-3xl bg-[#F6F6F6] shadow-sm lg:min-h-[var(--store-map-h)] lg:flex-1"><GoogleStoreMap :address="visible.address" :focus="focused" /></div></div>
        <div class="min-w-0 flex-1">
          <div class="store-location-filters mb-4 grid grid-cols-3 gap-2 sm:gap-3">
            <button type="button" class="flex h-[52px] min-w-0 items-center justify-between rounded-full border border-[rgba(159,159,164,.25)] bg-white px-2 text-[13px] text-[#1C1C1D] sm:px-5 sm:text-[15px]"><span>我的位置</span><LocateFixed class="h-[18px] w-[18px] text-[#CAA05C] sm:h-[22px] sm:w-[22px]" /></button>
            <div class="relative min-w-0"><select v-model="region" class="h-[52px] w-full appearance-none rounded-full border border-[rgba(159,159,164,.25)] bg-white pl-2.5 pr-6 text-[13px] text-[#1C1C1D] sm:pl-5 sm:pr-10 sm:text-[15px]"><option value="">選擇區域</option><option v-for="name in Object.keys(regions)" :key="name" :value="name">{{ name }}</option></select><ChevronDown class="pointer-events-none absolute right-2 top-1/2 h-4 w-4 -translate-y-1/2 text-[#59585D] sm:right-3.5" /></div>
            <div class="relative min-w-0"><select v-model="city" :disabled="!region" class="h-[52px] w-full appearance-none rounded-full border border-[rgba(159,159,164,.25)] pl-2.5 pr-6 text-[13px] sm:pl-5 sm:pr-10 sm:text-[15px]" :class="region ? 'bg-white text-[#1C1C1D]' : 'cursor-not-allowed bg-[#F6F6F6] text-[#9F9FA4]'"><option value="">選擇城市</option><option v-for="name in regions[region] || []" :key="name" :value="name">{{ name }}</option></select><ChevronDown class="pointer-events-none absolute right-2 top-1/2 h-4 w-4 -translate-y-1/2 text-[#59585D] sm:right-3.5" /></div>
          </div>
          <div class="space-y-3" @mouseenter="paused = true" @mouseleave="paused = false">
            <div v-if="!filtered.length" class="rounded-2xl border border-[#E3E3E8] bg-white px-6 py-10 text-center text-[#59585D]">此區域尚無門市資料。</div>
            <template v-else>
              <button v-for="id in visibleIds" :key="id" type="button" class="store-board-slot h-[112px] w-full rounded-2xl text-left sm:h-[94px] lg:h-[118px] xl:h-[94px]" @click="selected = id; focused = true"><div v-if="filtered.find(store => store.id === id)" class="store-board-face flex h-full flex-col justify-center rounded-2xl border px-5 py-3" :class="id === visible.id ? 'border-[#CAA05C] bg-[#CAA05C] text-white' : 'border-[#E3E3E8] bg-white text-[#1C1C1D]'"><div class="flex items-center gap-3"><span class="rounded-full px-2.5 py-1 text-xs" :class="id === visible.id ? 'bg-white/20' : 'bg-[#F6F6F6] text-[#59585D]'">{{ filtered.find(store => store.id === id)?.region }}</span><span class="text-lg font-medium">{{ filtered.find(store => store.id === id)?.name }}</span></div><div class="mt-2.5 flex items-start justify-between gap-3 text-sm"><span class="flex items-start gap-1.5"><MapPin class="mt-px h-[18px] w-[18px] shrink-0" />{{ filtered.find(store => store.id === id)?.address }}</span><span class="shrink-0" :class="id === visible.id ? 'text-white' : 'text-[#CAA05C]'">{{ filtered.find(store => store.id === id)?.phone }}</span></div></div></button>
            </template>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
