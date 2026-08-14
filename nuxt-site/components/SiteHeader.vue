<script setup lang="ts">
import { ArrowRight, ChevronDown, Menu, Search, X } from 'lucide-vue-next'
import { KITCHEN_STYLES } from '~/data/kitchenStyles'

type NavChild = { label: string; to?: string; external?: boolean; disabled?: boolean }
type MegaCard = { label: string; image: string; logo: string }
type NavItem = { label: string; to?: string; children?: NavChild[]; mega?: MegaCard[]; seriesMega?: boolean }

const leftNav: NavItem[] = [
  {
    label: '設計案例',
    seriesMega: true,
    children: [
      { label: '品牌系列' },
      { label: '設計靈感', to: '/design-inspiration' },
      { label: '廚房裝修指南', to: '/knowledge' },
      { label: '品牌系列型錄', to: '/catalogues/kitchenware-catalog' },
    ],
  },
  {
    label: '廚房產品',
    mega: [
      { label: 'SAKURA 廚電', image: '/products/sakura.jpg', logo: '/home-2026/logos/sakura.svg' },
      { label: 'SVAGO', image: '/products/svago.jpg', logo: '/home-2026/logos/svago.svg' },
      { label: 'TEKA', image: '/products/teka.jpg', logo: '/home-2026/logos/teka.svg' },
    ],
  },
  {
    label: '門市與服務',
    children: [
      { label: '服務流程', to: '/service-process' },
      { label: '案例門市', to: '/gallery' },
      { label: '到府丈量', to: 'https://www.sakura-kitchenlife.com.tw/measuring', external: true },
      { label: '客服中心', to: 'https://icare.sakura.com.tw', external: true },
    ],
  },
  {
    label: '優惠消息',
    to: '/news',
    children: [
      { label: '優惠活動', to: '/news/activities' },
      { label: '最新消息', to: '/news/latest' },
      { label: '媒體影音', to: '/news/video' },
    ],
  },
]

const rightNav: NavItem[] = [
  { label: '品牌承諾', children: [{ label: '品牌優勢', to: '/about/advantage' }, { label: '集團品牌館', to: '/about/exhibition' }, { label: '關於我們', to: '/about/introduce' }] },
  { label: '我要加盟', children: [{ label: '加盟介紹', to: '#' }, { label: '加盟優勢', to: '#' }, { label: '加盟金與流程', to: '#' }, { label: '加盟Q&A', to: '#' }] },
  { label: '建商專區', to: '#' },
  { label: '櫻花集團', to: 'https://www.sakura.com.tw/' },
]

const mobileOpen = ref(false)
const searchOpen = ref(false)
const expanded = ref<number | null>(null)
const keyboardNavigation = ref(false)
const allNav = computed(() => [...leftNav, ...rightNav])
const route = useRoute()
watch(() => route.fullPath, () => {
  mobileOpen.value = false
  searchOpen.value = false
  keyboardNavigation.value = false
})

function handleHeaderKeydown(event: KeyboardEvent) {
  if (event.key === 'Tab' || event.key.startsWith('Arrow')) keyboardNavigation.value = true
}

function handleHeaderPointerDown() {
  keyboardNavigation.value = false
}
</script>

<template>
  <header
    class="fixed inset-x-0 top-0 z-[100] h-[60px] font-sans"
    :class="{ 'header-keyboard-navigation': keyboardNavigation }"
    @keydown.capture="handleHeaderKeydown"
    @pointerdown.capture="handleHeaderPointerDown"
  >
    <div class="h-full bg-[linear-gradient(90deg,#b79258_20%,#d2b587)]">
      <div class="flex h-[60px] items-center px-5 xl:px-12">
        <nav aria-label="主要導覽" class="hidden w-full items-center lg:flex">
          <div class="flex flex-1 items-center justify-start gap-1">
            <div v-for="item in leftNav" :key="item.label" class="desktop-nav-item group relative flex h-[60px] items-center">
              <div v-if="item.children && item.to" class="flex h-[60px] items-center whitespace-nowrap px-1 text-[15px] leading-[15px] text-white xl:px-3">
                <NuxtLink :to="item.to" class="flex h-full items-center">{{ item.label }}</NuxtLink>
                <button type="button" :aria-label="`展開${item.label}選單`" class="flex h-full items-center pl-1">
                  <ChevronDown class="h-3.5 w-3.5 transition-transform group-hover:rotate-180" />
                </button>
              </div>
              <button v-else-if="item.children || item.mega" type="button" class="flex h-[60px] items-center gap-1 whitespace-nowrap px-1 text-[15px] leading-[15px] text-white xl:px-3">
                {{ item.label }}
                <ChevronDown class="h-3.5 w-3.5 transition-transform group-hover:rotate-180" />
              </button>
              <NuxtLink v-else :to="item.to || '#'" class="px-1 py-2 text-[15px] text-white xl:px-3">{{ item.label }}</NuxtLink>

              <div v-if="item.mega" class="desktop-nav-dropdown pointer-events-none invisible fixed inset-x-0 top-[60px] z-50 border-t border-black/5 bg-white opacity-0 shadow-2xl transition-all duration-300">
                <div class="mx-auto max-w-[1200px] px-[30px] py-8 xl:px-0">
                  <div class="grid grid-cols-3 gap-[30px]">
                    <NuxtLink v-for="card in item.mega" :key="card.label" to="#" class="group/card block">
                      <div class="mb-4 flex h-[50px] items-center">
                        <img :src="card.logo" :alt="card.label" class="h-[50px] w-[170px] object-contain object-left brightness-0" />
                      </div>
                      <div class="relative aspect-[4/3] overflow-hidden rounded-2xl bg-[#1C1C1D]">
                        <img :src="card.image" :alt="card.label" class="absolute inset-0 h-full w-full object-cover transition-transform duration-500 group-hover/card:scale-105" />
                      </div>
                    </NuxtLink>
                  </div>
                  <NuxtLink to="#" class="mt-6 inline-flex items-center gap-2 text-sm text-[#1C1C1D] transition-colors hover:text-[#CAA05C]">
                    廚房商品型錄 <ArrowRight class="h-4 w-4" />
                  </NuxtLink>
                </div>
              </div>

              <div v-else-if="item.children" class="desktop-nav-dropdown pointer-events-none invisible absolute left-0 top-full z-50 pt-2 opacity-0 transition-all">
                <ul class="isolate min-w-[190px] rounded-xl border border-[#E3E3E8] bg-white py-2 shadow-xl">
                  <li
                    v-for="(child, childIndex) in item.children"
                    :key="child.label"
                    class="group/series"
                    :class="childIndex === 0 ? 'peer/series' : 'relative z-[70] bg-white peer-hover/series:opacity-0 peer-focus-within/series:opacity-0'"
                  >
                    <button v-if="item.seriesMega && childIndex === 0" type="button" aria-haspopup="true" class="flex w-full items-center justify-between gap-4 whitespace-nowrap px-5 py-2.5 text-left text-sm text-[#59585D] hover:bg-[#F6F6F6] hover:text-[#CAA05C]">
                      {{ child.label }} <ArrowRight class="h-4 w-4" />
                    </button>
                    <span v-else-if="child.disabled" aria-disabled="true" class="flex cursor-not-allowed items-center justify-between px-5 py-2.5 text-sm text-[#9F9FA4]">{{ child.label }}</span>
                    <a v-else-if="child.external" :href="child.to" target="_blank" rel="noopener noreferrer" class="flex items-center justify-between px-5 py-2.5 text-sm text-[#59585D] hover:bg-[#F6F6F6] hover:text-[#CAA05C]">{{ child.label }}</a>
                    <NuxtLink v-else :to="child.to || '/'" class="flex items-center justify-between gap-4 whitespace-nowrap px-5 py-2.5 text-sm text-[#59585D] hover:bg-[#F6F6F6] hover:text-[#CAA05C]">
                      {{ child.label }}
                    </NuxtLink>

                    <div v-if="item.seriesMega && childIndex === 0" class="pointer-events-none invisible fixed inset-x-0 top-[60px] z-[60] opacity-0 transition-all duration-300 group-hover/series:pointer-events-auto group-hover/series:visible group-hover/series:opacity-100 group-focus-within/series:pointer-events-auto group-focus-within/series:visible group-focus-within/series:opacity-100">
                      <div class="border-t border-black/5 bg-white shadow-2xl">
                        <div class="mx-auto max-w-[1512px] px-5 py-7 xl:px-12">
                          <div class="mb-3 flex items-end justify-between">
                            <div><p class="text-[11px] uppercase tracking-[0.18em] text-[#9F9FA4]">Kitchen Series</p><h2 class="mt-1 font-display text-[24px] leading-[30px] text-[#1C1C1D]">十大廚房系列</h2></div>
                            <p class="text-xs text-[#9F9FA4]">目前開放 AI Kitchen</p>
                          </div>
                          <div class="grid grid-cols-5 gap-3 xl:gap-4">
                            <template v-for="style in KITCHEN_STYLES" :key="style.slug">
                              <NuxtLink v-if="style.available && style.route" :to="style.route" class="group/card relative aspect-[16/10] overflow-hidden rounded-xl bg-[#1C1C1D]">
                                <img :src="style.image" :alt="style.zh" class="absolute inset-0 h-full w-full object-cover transition-transform duration-500 group-hover/card:scale-105" />
                                <span class="absolute inset-0 bg-gradient-to-t from-black/85 via-black/15 to-transparent" />
                                <span class="absolute inset-x-0 bottom-0 p-3 text-white"><span class="block text-[15px]">{{ style.zh }}</span><span class="block truncate text-[11px] text-white/70">{{ style.en }}</span></span>
                              </NuxtLink>
                              <div v-else aria-disabled="true" class="relative aspect-[16/10] cursor-not-allowed overflow-hidden rounded-xl bg-[#1C1C1D] opacity-55">
                                <img :src="style.image" :alt="style.zh" class="absolute inset-0 h-full w-full object-cover grayscale" />
                                <span class="absolute inset-0 bg-gradient-to-t from-black/90 via-black/30 to-black/10" />
                                <span class="absolute right-2 top-2 rounded-full border border-white/30 px-2 py-0.5 text-[9px] text-white/70">尚未開放</span>
                                <span class="absolute inset-x-0 bottom-0 p-3 text-white"><span class="block text-[15px]">{{ style.zh }}</span><span class="block truncate text-[11px] text-white/70">{{ style.en }}</span></span>
                              </div>
                            </template>
                          </div>
                        </div>
                      </div>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>

          <NuxtLink to="/" aria-label="SAKURA Kitchen 首頁" class="flex w-[160px] shrink-0 items-center justify-center xl:w-[260px]">
            <img src="/home-2026/footer/sakura-kitchen.png" alt="SAKURA Kitchen" class="h-auto w-full scale-125 object-contain brightness-0 invert" />
          </NuxtLink>

          <div class="flex flex-1 items-center justify-end gap-1">
            <div v-for="item in rightNav" :key="item.label" class="desktop-nav-item group relative flex h-[60px] items-center">
              <button v-if="item.children" type="button" class="flex h-[60px] items-center gap-1 whitespace-nowrap px-1 text-[15px] text-white xl:px-3">{{ item.label }} <ChevronDown class="h-3.5 w-3.5" /></button>
              <a v-else-if="item.to?.startsWith('http')" :href="item.to" target="_blank" rel="noopener noreferrer" class="whitespace-nowrap px-1 py-2 text-[15px] text-white xl:px-3">{{ item.label }}</a>
              <NuxtLink v-else :to="item.to || '#'" class="whitespace-nowrap px-1 py-2 text-[15px] text-white xl:px-3">{{ item.label }}</NuxtLink>
              <div v-if="item.children" class="desktop-nav-dropdown pointer-events-none invisible absolute right-0 top-full z-50 pt-2 opacity-0 transition-all">
                <ul class="min-w-[190px] rounded-xl border border-[#E3E3E8] bg-white py-2 shadow-xl">
                  <li v-for="child in item.children" :key="child.label">
                    <span v-if="child.disabled" aria-disabled="true" class="block cursor-not-allowed whitespace-nowrap px-5 py-2.5 text-sm text-[#9F9FA4]">{{ child.label }}</span>
                    <NuxtLink v-else :to="child.to || '/'" class="block whitespace-nowrap px-5 py-2.5 text-sm text-[#59585D] hover:bg-[#F6F6F6] hover:text-[#CAA05C]">{{ child.label }}</NuxtLink>
                  </li>
                </ul>
              </div>
            </div>
            <span class="mx-3 h-7 w-px bg-white/40" />
            <button type="button" aria-label="搜尋" class="text-white" @click="searchOpen = true"><Search class="h-6 w-6" /></button>
          </div>
        </nav>

        <div class="flex w-full items-center justify-between lg:hidden">
          <NuxtLink to="/" aria-label="SAKURA Kitchen 首頁" class="w-[184px]"><img src="/home-2026/footer/sakura-kitchen.png" alt="SAKURA Kitchen" class="w-full origin-left scale-125 brightness-0 invert" /></NuxtLink>
          <div class="flex items-center gap-5 text-white"><button aria-label="搜尋" @click="searchOpen = true"><Search class="h-6 w-6" /></button><button :aria-label="mobileOpen ? '關閉選單' : '開啟選單'" @click="mobileOpen = !mobileOpen"><X v-if="mobileOpen" class="h-7 w-7" /><Menu v-else class="h-7 w-7" /></button></div>
        </div>
      </div>
    </div>

    <div v-if="mobileOpen" class="absolute inset-x-0 top-[60px] max-h-[calc(100vh-60px)] overflow-y-auto border-t border-white/20 bg-[#1C1C1D] text-white lg:hidden">
      <div v-for="(item, index) in allNav" :key="item.label" class="border-b border-white/10">
        <button v-if="item.children || item.mega" class="flex w-full items-center justify-between px-6 py-4 text-left" @click="expanded = expanded === index ? null : index">{{ item.label }} <ChevronDown class="h-4 w-4 transition-transform" :class="expanded === index ? 'rotate-180' : ''" /></button>
        <NuxtLink v-else :to="item.to || '#'" class="block px-6 py-4">{{ item.label }}</NuxtLink>
        <div v-if="expanded === index" class="bg-white/5 px-8 py-2">
          <template v-if="item.children">
            <NuxtLink v-if="item.to" :to="item.to" class="block py-3 text-sm text-[#CAA05C]">{{ item.label }}總覽</NuxtLink>
            <template v-if="item.seriesMega">
              <p class="pb-2 pt-3 text-xs uppercase tracking-[.16em] text-[#CAA05C]">品牌系列</p>
              <template v-for="style in KITCHEN_STYLES" :key="style.slug">
                <NuxtLink v-if="style.available && style.route" :to="style.route" class="flex items-center justify-between py-3 text-sm text-white">
                  <span>{{ style.zh }}</span><span class="text-xs text-white/55">{{ style.en }}</span>
                </NuxtLink>
                <span v-else aria-disabled="true" class="flex cursor-not-allowed items-center justify-between py-3 text-sm text-white/35">
                  <span>{{ style.zh }}</span><span class="text-xs">尚未開放</span>
                </span>
              </template>
            </template>
            <template v-for="child in item.seriesMega ? item.children.slice(1) : item.children" :key="child.label">
              <span v-if="child.disabled" aria-disabled="true" class="block py-3 text-sm text-white/40">{{ child.label }}</span>
              <a v-else-if="child.external" :href="child.to" target="_blank" rel="noopener noreferrer" class="block py-3 text-sm text-white/80">{{ child.label }}</a>
              <NuxtLink v-else :to="child.to || '/'" class="block py-3 text-sm text-white/80">{{ child.label }}</NuxtLink>
            </template>
          </template>
          <template v-else><a v-for="card in item.mega" :key="card.label" href="#" class="block py-3 text-sm text-white/80">{{ card.label }}</a><a href="#" class="block py-3 text-sm text-[#CAA05C]">廚房商品型錄</a></template>
        </div>
      </div>
    </div>

    <div v-if="searchOpen" class="fixed inset-0 z-[120] flex items-start justify-center bg-black/70 px-5 pt-[18vh] backdrop-blur-md" @click.self="searchOpen = false">
      <form class="flex w-full max-w-3xl items-center gap-3 rounded-full bg-white p-3 pl-7" @submit.prevent="searchOpen = false">
        <label for="site-search" class="sr-only">站內搜尋</label><input id="site-search" autofocus type="search" placeholder="搜尋 SAKURA Kitchen" class="min-w-0 flex-1 bg-transparent text-lg text-[#1C1C1D] outline-none" /><button class="flex h-12 w-12 items-center justify-center rounded-full bg-[#CAA05C] text-white" aria-label="送出搜尋"><Search /></button>
      </form>
      <button aria-label="關閉搜尋" class="absolute right-6 top-6 text-white" @click="searchOpen = false"><X class="h-8 w-8" /></button>
    </div>
  </header>
</template>

<style scoped>
/* Only keyboard focus may keep a menu open after the pointer leaves. */
.header-keyboard-navigation .desktop-nav-item:focus-within > .desktop-nav-dropdown {
  pointer-events: auto;
  visibility: visible;
  opacity: 1;
}

@media (hover: hover) {
  .desktop-nav-item:hover > .desktop-nav-dropdown {
    pointer-events: auto;
    visibility: visible;
    opacity: 1;
  }
}
</style>
