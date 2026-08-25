<script setup lang="ts">
import { ChevronDown, LocateFixed } from 'lucide-vue-next'

type Store = { id: number; region: string; city: string; name: string; address: string; phone: string }
type FlipState = { slot: number; previousId: number }

const STORE_BOARD_ROWS = 4
const STORE_FLIP_INTERVAL = 2200
const STORE_FLIP_DURATION = 760

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
const boardPaused = ref(false)
const displayedIds = ref(stores.slice(0, STORE_BOARD_ROWS).map(store => store.id))
const flipState = ref<FlipState | null>(null)
const reducedMotion = useReducedMotion()
let flipTimer: ReturnType<typeof setTimeout> | undefined
let flipFinishTimer: ReturnType<typeof setTimeout> | undefined

const filtered = computed(() => stores.filter(store => (!region.value || store.region === region.value) && (!city.value || store.city === city.value)))
const filteredKey = computed(() => filtered.value.map(store => store.id).join(','))
const displayedStores = computed(() => displayedIds.value
  .map(id => filtered.value.find(store => store.id === id))
  .filter((store): store is Store => Boolean(store)))
const visible = computed(() => filtered.value.find(store => store.id === selected.value) || filtered.value[0] || stores[0])

watch(region, () => city.value = '')
watch(filteredKey, () => {
  const list = filtered.value
  if (!list.some(store => store.id === selected.value)) selected.value = list[0]?.id ?? stores[0].id
  displayedIds.value = list.slice(0, STORE_BOARD_ROWS).map(store => store.id)
  flipState.value = null
  clearFlipTimers()
  nextTick(scheduleFlip)
})

watch([boardPaused, reducedMotion, selected], scheduleFlip)

onMounted(scheduleFlip)
onBeforeUnmount(clearFlipTimers)

function clearFlipTimers() {
  if (flipTimer) clearTimeout(flipTimer)
  if (flipFinishTimer) clearTimeout(flipFinishTimer)
  flipTimer = undefined
  flipFinishTimer = undefined
}

function scheduleFlip() {
  if (flipTimer) clearTimeout(flipTimer)
  flipTimer = undefined

  if (
    boardPaused.value
    || reducedMotion.value
    || flipState.value
    || filtered.value.length <= STORE_BOARD_ROWS
    || !displayedIds.value.length
  ) return

  flipTimer = setTimeout(runFlip, STORE_FLIP_INTERVAL)
}

function runFlip() {
  flipTimer = undefined
  if (boardPaused.value || reducedMotion.value || flipState.value) return

  const candidates = filtered.value.filter(store => !displayedIds.value.includes(store.id))
  const replaceableSlots = displayedIds.value
    .map((id, index) => ({ id, index }))
    .filter(({ id }) => id !== selected.value)

  if (!candidates.length || !replaceableSlots.length) {
    scheduleFlip()
    return
  }

  const target = replaceableSlots[Math.floor(Math.random() * replaceableSlots.length)]!
  const replacement = candidates[Math.floor(Math.random() * candidates.length)]!
  flipState.value = { slot: target.index, previousId: target.id }
  displayedIds.value = displayedIds.value.map((id, index) => index === target.index ? replacement.id : id)

  flipFinishTimer = setTimeout(() => {
    flipState.value = null
    flipFinishTimer = undefined
    scheduleFlip()
  }, STORE_FLIP_DURATION)
}

function previousStoreFor(index: number) {
  if (flipState.value?.slot !== index) return undefined
  return stores.find(store => store.id === flipState.value?.previousId)
}

function setBoardPaused(value: boolean) {
  boardPaused.value = value
}

function handleBoardFocusOut(event: FocusEvent) {
  if (!(event.currentTarget as HTMLElement).contains(event.relatedTarget as Node | null)) setBoardPaused(false)
}
</script>

<template>
  <section id="contact" aria-labelledby="store-location-heading" class="store-location-section relative overflow-hidden bg-[#f6f6f6] py-[60px]">
    <div class="mx-auto w-full max-w-[1512px] pl-5 pr-[88px] sm:pl-8 sm:pr-[90px] lg:pl-[51px] lg:pr-[86px]">
      <div class="relative mb-[60px]"><div class="grid grid-cols-1 items-start lg:grid-cols-[minmax(260px,424px)_minmax(0,1fr)] lg:pt-[46px]"><div class="mb-5 lg:mb-0"><InternalSectionPill v-reveal="{ anim: 'opalMoveRight' }">STORE LOCATOR</InternalSectionPill></div><h2 id="store-location-heading" v-reveal="{ anim: 'opalMoveLeft', delay: 100 }" class="max-w-[661px] font-display text-[42px] leading-[46px] text-[#1C1C1D] sm:text-[52px] sm:leading-[56px] xl:text-[60px] xl:leading-[64px]">Have a Project in <span class="text-[#CAA05C]">Mind?<br />Let’s Make</span> It Happen</h2></div></div>
      <div class="flex min-w-0 flex-col gap-8 lg:flex-row">
        <div v-reveal="{ anim: 'opalMoveRight', delay: 180 }" class="flex w-full min-w-0 flex-col lg:w-[62%] lg:shrink-0"><div class="h-[var(--store-map-h)] overflow-hidden rounded-3xl bg-[#F6F6F6] shadow-sm lg:min-h-[var(--store-map-h)] lg:flex-1"><GoogleStoreMap :address="visible.address" :focus="focused" /></div></div>
        <div class="min-w-0 flex-1">
          <div v-reveal="{ anim: 'opalMoveLeft', delay: 180 }" class="store-location-filters mb-4 grid gap-2 sm:gap-3">
            <button type="button" class="store-location-locate flex h-[52px] min-w-0 items-center justify-between whitespace-nowrap rounded-full border border-[rgba(159,159,164,.25)] bg-white px-5 font-cjk-sans text-[15px] text-[#1C1C1D]"><span>我的位置</span><LocateFixed class="h-[22px] w-[22px] text-[#CAA05C]" /></button>
            <div class="relative min-w-0"><select v-model="region" aria-label="選擇區域" class="store-location-select h-[52px] w-full appearance-none whitespace-nowrap rounded-full border border-[rgba(159,159,164,.25)] bg-white pl-5 pr-10 font-cjk-sans text-[15px] text-[#1C1C1D]"><option value="">選擇區域</option><option v-for="name in Object.keys(regions)" :key="name" :value="name">{{ name }}</option></select><ChevronDown class="store-location-select-chevron pointer-events-none absolute right-3.5 top-1/2 h-4 w-4 -translate-y-1/2 text-[#59585D]" /></div>
            <div class="relative min-w-0"><select v-model="city" aria-label="選擇城市" :disabled="!region" class="store-location-select h-[52px] w-full appearance-none whitespace-nowrap rounded-full border border-[rgba(159,159,164,.25)] pl-5 pr-10 font-cjk-sans text-[15px]" :class="region ? 'bg-white text-[#1C1C1D]' : 'cursor-not-allowed bg-[#F6F6F6] text-[#9F9FA4]'"><option value="">選擇城市</option><option v-for="name in regions[region] || []" :key="name" :value="name">{{ name }}</option></select><ChevronDown class="store-location-select-chevron pointer-events-none absolute right-3.5 top-1/2 h-4 w-4 -translate-y-1/2 text-[#59585D]" /></div>
          </div>
          <div
            v-reveal="{ anim: 'storeGroupReveal' }"
            class="store-board-list space-y-3 font-cjk-sans"
            @mouseenter="setBoardPaused(true)"
            @mouseleave="setBoardPaused(false)"
            @focusin="setBoardPaused(true)"
            @focusout="handleBoardFocusOut"
          >
            <div v-if="!filtered.length" class="rounded-2xl border border-[#E3E3E8] bg-white px-6 py-10 text-center text-[#59585D]">此區域尚無門市資料。</div>
            <template v-else>
              <button
                v-for="(store, index) in displayedStores"
                :key="index"
                type="button"
                :aria-label="`查看${store.name}：${store.address}`"
                class="store-board-entry store-board-slot relative h-[122px] w-full rounded-2xl text-left outline-none sm:h-[100px] lg:h-[118px] xl:h-[100px]"
                :style="{ animationDelay: `${index * 100}ms` }"
                @click="selected = store.id; focused = true"
              >
                <HomeStoreBoardFace
                  :store="store"
                  :active="store.id === visible.id"
                  class="store-board-base transition-colors"
                  :class="previousStoreFor(index) ? 'store-board-base--flipping' : ''"
                />
                <template v-if="previousStoreFor(index)">
                  <div class="store-board-half store-board-half--old-bottom" aria-hidden="true">
                    <HomeStoreBoardFace
                      :store="previousStoreFor(index)!"
                      :active="previousStoreFor(index)?.id === visible.id"
                      class="store-board-half-surface store-board-half-surface--bottom"
                    />
                  </div>
                  <div class="store-board-half store-board-half--old-top" aria-hidden="true">
                    <HomeStoreBoardFace
                      :store="previousStoreFor(index)!"
                      :active="previousStoreFor(index)?.id === visible.id"
                      class="store-board-half-surface store-board-half-surface--top"
                    />
                  </div>
                  <div class="store-board-half store-board-half--new-bottom" aria-hidden="true">
                    <HomeStoreBoardFace
                      :store="store"
                      :active="store.id === visible.id"
                      class="store-board-half-surface store-board-half-surface--bottom"
                    />
                  </div>
                </template>
              </button>
            </template>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
