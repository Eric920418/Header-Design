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
const filtered = computed(() => stores.filter(store => (!region.value || store.region === region.value) && (!city.value || store.city === city.value)))
const visibleStores = computed(() => filtered.value.slice(0, 4))
const visible = computed(() => filtered.value.find(store => store.id === selected.value) || filtered.value[0] || stores[0])

watch(region, () => city.value = '')
watch(filtered, (list) => {
  if (!list.some(store => store.id === selected.value)) selected.value = list[0]?.id ?? stores[0].id
}, { deep: true })
</script>

<template>
  <section id="contact" aria-labelledby="store-location-heading" class="store-location-section relative overflow-hidden bg-[#f6f6f6] py-[60px]">
    <div class="mx-auto w-full max-w-[1512px] pl-5 pr-[88px] sm:pl-8 sm:pr-[90px] lg:pl-[51px] lg:pr-[86px]">
      <div class="relative mb-[60px]"><div class="grid grid-cols-1 items-start lg:grid-cols-[minmax(260px,424px)_minmax(0,1fr)] lg:pt-[46px]"><div class="mb-5 lg:mb-0"><span v-reveal="{ anim: 'opalMoveRight' }" class="inline-flex items-center gap-1.5 rounded-[24px] border border-[rgba(159,159,164,.18)] px-[13px] py-[5px] pl-[9px] font-cjk-sans text-[15px] uppercase leading-[20px] tracking-[1px] text-[#1C1C1D]"><span class="h-1.5 w-1.5 rounded-full bg-[#CAA05C]" />STORE LOCATOR</span></div><h2 id="store-location-heading" v-reveal="{ anim: 'opalMoveLeft', delay: 100 }" class="max-w-[661px] font-display text-[42px] leading-[46px] text-[#1C1C1D] sm:text-[52px] sm:leading-[56px] xl:text-[60px] xl:leading-[64px]">Have a Project in <span class="text-[#CAA05C]">Mind?<br />Let’s Make</span> It Happen</h2></div></div>
      <div class="flex min-w-0 flex-col gap-8 lg:flex-row">
        <div v-reveal="{ anim: 'opalMoveRight', delay: 180 }" class="flex w-full min-w-0 flex-col lg:w-[62%] lg:shrink-0"><div class="h-[var(--store-map-h)] overflow-hidden rounded-3xl bg-[#F6F6F6] shadow-sm lg:min-h-[var(--store-map-h)] lg:flex-1"><GoogleStoreMap :address="visible.address" :focus="focused" /></div></div>
        <div class="min-w-0 flex-1">
          <div v-reveal="{ anim: 'opalMoveLeft', delay: 180 }" class="store-location-filters mb-4 grid gap-2 sm:gap-3">
            <button type="button" class="store-location-locate flex h-[52px] min-w-0 items-center justify-between whitespace-nowrap rounded-full border border-[rgba(159,159,164,.25)] bg-white px-5 font-cjk-sans text-[15px] text-[#1C1C1D]"><span>我的位置</span><LocateFixed class="h-[22px] w-[22px] text-[#CAA05C]" /></button>
            <div class="relative min-w-0"><select v-model="region" aria-label="選擇區域" class="store-location-select h-[52px] w-full appearance-none whitespace-nowrap rounded-full border border-[rgba(159,159,164,.25)] bg-white pl-5 pr-10 font-cjk-sans text-[15px] text-[#1C1C1D]"><option value="">選擇區域</option><option v-for="name in Object.keys(regions)" :key="name" :value="name">{{ name }}</option></select><ChevronDown class="store-location-select-chevron pointer-events-none absolute right-3.5 top-1/2 h-4 w-4 -translate-y-1/2 text-[#59585D]" /></div>
            <div class="relative min-w-0"><select v-model="city" aria-label="選擇城市" :disabled="!region" class="store-location-select h-[52px] w-full appearance-none whitespace-nowrap rounded-full border border-[rgba(159,159,164,.25)] pl-5 pr-10 font-cjk-sans text-[15px]" :class="region ? 'bg-white text-[#1C1C1D]' : 'cursor-not-allowed bg-[#F6F6F6] text-[#9F9FA4]'"><option value="">選擇城市</option><option v-for="name in regions[region] || []" :key="name" :value="name">{{ name }}</option></select><ChevronDown class="store-location-select-chevron pointer-events-none absolute right-3.5 top-1/2 h-4 w-4 -translate-y-1/2 text-[#59585D]" /></div>
          </div>
          <div v-reveal="{ anim: 'storeGroupReveal' }" class="store-board-list space-y-3 font-cjk-sans">
            <div v-if="!filtered.length" class="rounded-2xl border border-[#E3E3E8] bg-white px-6 py-10 text-center text-[#59585D]">此區域尚無門市資料。</div>
            <template v-else>
              <button v-for="(store, index) in visibleStores" :key="store.id" type="button" class="store-board-entry store-board-slot h-[122px] w-full rounded-2xl text-left sm:h-[100px] lg:h-[118px] xl:h-[100px]" :style="{ animationDelay: `${index * 100}ms` }" @click="selected = store.id; focused = true"><div class="store-board-face flex h-full flex-col justify-center rounded-2xl border px-5 py-3" :class="store.id === visible.id ? 'border-[#CAA05C] bg-[#CAA05C] text-white' : 'border-[#E3E3E8] bg-white text-[#1C1C1D]'"><div class="flex items-center gap-3"><span class="rounded-full px-2.5 py-1 text-xs" :class="store.id === visible.id ? 'bg-white/20' : 'bg-[#F6F6F6] text-[#59585D]'">{{ store.region }}</span><span class="text-[18px] font-medium">{{ store.name }}</span></div><div class="store-board-meta mt-2.5 flex items-start justify-between gap-3 text-[15px]"><span class="flex min-w-0 items-start gap-1.5 leading-[21px]"><MapPin class="mt-px h-[18px] w-[18px] shrink-0" />{{ store.address }}</span><span class="shrink-0 leading-[21px]" :class="store.id === visible.id ? 'text-white' : 'text-[#CAA05C]'">{{ store.phone }}</span></div></div></button>
            </template>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
