<script setup lang="ts">
import { ArrowRight, ChevronDown, Menu, Search, X } from 'lucide-vue-next'
import { KITCHEN_STYLES } from '~/data/kitchenStyles'

type NavChild = { label: string; to?: string; external?: boolean; disabled?: boolean }
type MegaCard = { label: string; image: string; logo: string; to?: string }
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
      { label: 'SAKURA 廚電', image: '/products/sakura.jpg', logo: '/home-2026/logos/sakura.svg', to: '/products/sakura' },
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
  {
    label: '我要加盟',
    to: '/franchising/intro',
    children: [
      { label: '加盟介紹', to: '/franchising/intro#introduction' },
      { label: '加盟優勢', to: '/franchising/intro#advantages' },
      { label: '加盟金與流程', to: '/franchising/intro#franchise-process' },
      { label: '加盟Q&A', to: '/franchising/intro#franchise-faq' },
    ],
  },
  {
    label: '建商專區',
    to: '/builders',
    children: [
      { label: '建商專區首頁', to: '/builders' },
      { label: 'SAKURA KITCHEN', to: '/builders/sakura-kitchen' },
      { label: '建商專區型錄', to: '/builders/catalogues' },
    ],
  },
  { label: '櫻花集團', to: 'https://www.sakura.com.tw/' },
]

const mobileOpen = ref(false)
const searchOpen = ref(false)
const expanded = ref<number | null>(null)
const keyboardNavigation = ref(false)
const activeDesktopMenu = ref<string | null>(null)
let desktopMenuCloseTimer: ReturnType<typeof setTimeout> | null = null
const allNav = computed(() => [...leftNav, ...rightNav])
const route = useRoute()
watch(() => route.fullPath, () => {
  closeAllMenus()
})

function clearDesktopMenuCloseTimer() {
  if (desktopMenuCloseTimer === null) return
  clearTimeout(desktopMenuCloseTimer)
  desktopMenuCloseTimer = null
}

function openDesktopMenu(label: string) {
  clearDesktopMenuCloseTimer()
  activeDesktopMenu.value = label
}

function scheduleDesktopMenuClose() {
  clearDesktopMenuCloseTimer()
  desktopMenuCloseTimer = setTimeout(() => {
    activeDesktopMenu.value = null
    desktopMenuCloseTimer = null
  }, 160)
}

function closeAllMenus() {
  clearDesktopMenuCloseTimer()
  activeDesktopMenu.value = null
  mobileOpen.value = false
  expanded.value = null
  searchOpen.value = false
  keyboardNavigation.value = false
}

function handleDesktopItemFocusOut(event: FocusEvent) {
  const currentTarget = event.currentTarget
  const nextTarget = event.relatedTarget
  if (currentTarget instanceof HTMLElement && nextTarget instanceof Node && currentTarget.contains(nextTarget)) return
  scheduleDesktopMenuClose()
}

onBeforeUnmount(() => {
  clearDesktopMenuCloseTimer()
})

function handleHeaderKeydown(event: KeyboardEvent) {
  if (event.key === 'Escape') {
    closeAllMenus()
    return
  }
  if (event.key === 'Tab' || event.key.startsWith('Arrow')) keyboardNavigation.value = true
}

function handleHeaderPointerDown() {
  keyboardNavigation.value = false
}

function handleHeaderClick(event: MouseEvent) {
  const target = event.target
  if (target instanceof HTMLElement && target.closest('a')) closeAllMenus()
}
</script>

<template>
  <header
    class="fixed inset-x-0 top-0 z-[100] h-[var(--site-header-height)] font-cjk-sans"
    :class="{ 'header-keyboard-navigation': keyboardNavigation }"
    @keydown.capture="handleHeaderKeydown"
    @pointerdown.capture="handleHeaderPointerDown"
    @click.capture="handleHeaderClick"
  >
    <div class="h-full bg-[linear-gradient(90deg,#b79258_20%,#d2b587)]">
      <div class="flex h-[var(--site-header-height)] items-center px-5 min-[1440px]:px-12">
        <nav aria-label="主要導覽" class="site-header__desktop-nav hidden w-full items-center lg:grid">
          <div class="site-header__nav-side site-header__nav-side--left">
            <div
              v-for="item in leftNav"
              :key="item.label"
              class="desktop-nav-item relative flex h-[var(--site-header-height)] items-center"
              @pointerenter="openDesktopMenu(item.label)"
              @pointerleave="scheduleDesktopMenuClose"
              @focusin="openDesktopMenu(item.label)"
              @focusout="handleDesktopItemFocusOut"
            >
              <div v-if="item.children && item.to" class="flex h-[var(--site-header-height)] items-center whitespace-nowrap px-1 text-[15px] leading-[15px] text-white min-[1440px]:px-3">
                <NuxtLink :to="item.to" class="flex h-full items-center">{{ item.label }}</NuxtLink>
                <button type="button" :aria-label="`展開${item.label}選單`" :aria-expanded="activeDesktopMenu === item.label" class="flex h-full items-center pl-1" @click="openDesktopMenu(item.label)">
                  <ChevronDown class="h-3.5 w-3.5 transition-transform" :class="activeDesktopMenu === item.label ? 'rotate-180' : ''" />
                </button>
              </div>
              <button v-else-if="item.children || item.mega" type="button" :aria-expanded="activeDesktopMenu === item.label" class="flex h-[var(--site-header-height)] items-center gap-1 whitespace-nowrap px-1 text-[15px] leading-[15px] text-white min-[1440px]:px-3" @click="openDesktopMenu(item.label)">
                {{ item.label }}
                <ChevronDown class="h-3.5 w-3.5 transition-transform" :class="activeDesktopMenu === item.label ? 'rotate-180' : ''" />
              </button>
              <NuxtLink v-else :to="item.to || '#'" class="px-1 py-2 text-[15px] text-white min-[1440px]:px-3">{{ item.label }}</NuxtLink>

              <div
                v-if="item.mega"
                class="desktop-nav-dropdown fixed inset-x-0 top-[var(--site-header-height)] z-50 pt-7 transition-all duration-300"
                :class="activeDesktopMenu === item.label ? 'pointer-events-auto visible opacity-100' : 'pointer-events-none invisible opacity-0'"
                @pointerenter="clearDesktopMenuCloseTimer"
                @pointerleave="scheduleDesktopMenuClose"
              >
                <div class="border-t border-black/5 bg-white shadow-2xl">
                  <div class="mx-auto max-w-[1200px] px-[30px] py-8 xl:px-0">
                    <div class="grid grid-cols-3 gap-[30px]">
                      <template v-for="card in item.mega" :key="card.label">
                        <NuxtLink v-if="card.to" :to="card.to" class="group/card block">
                          <div class="mb-4 flex h-[50px] items-center">
                            <img :src="card.logo" :alt="card.label" class="h-[50px] w-[170px] object-contain object-left brightness-0" />
                          </div>
                          <div class="relative aspect-[4/3] overflow-hidden rounded-2xl bg-[#1C1C1D]">
                            <img :src="card.image" :alt="card.label" class="absolute inset-0 h-full w-full object-cover transition-transform duration-500 group-hover/card:scale-105" />
                          </div>
                        </NuxtLink>
                        <div v-else aria-disabled="true" class="group/card block cursor-not-allowed opacity-55">
                          <div class="mb-4 flex h-[50px] items-center">
                            <img :src="card.logo" :alt="card.label" class="h-[50px] w-[170px] object-contain object-left brightness-0" />
                          </div>
                          <div class="relative aspect-[4/3] overflow-hidden rounded-2xl bg-[#1C1C1D]">
                            <img :src="card.image" :alt="card.label" class="absolute inset-0 h-full w-full object-cover" />
                          </div>
                        </div>
                      </template>
                    </div>
                    <NuxtLink to="/catalogues/catalog" class="mt-6 inline-flex items-center gap-2 text-sm text-[#1C1C1D] transition-colors hover:text-[#CAA05C]">
                      廚房商品型錄 <ArrowRight class="h-4 w-4" />
                    </NuxtLink>
                  </div>
                </div>
              </div>

              <div v-else-if="item.children && !item.seriesMega" class="desktop-nav-dropdown absolute left-0 top-full z-[70] pt-2 transition-all" :class="activeDesktopMenu === item.label ? 'pointer-events-auto visible opacity-100' : 'pointer-events-none invisible opacity-0'">
                <ul class="series-dropdown-list relative z-[70] min-w-[190px] rounded-xl border border-[#E3E3E8] bg-white py-2 shadow-xl">
                  <li
                    v-for="child in item.children"
                    :key="child.label"
                    class="group/series relative z-[70]"
                  >
                    <span v-if="child.disabled" aria-disabled="true" class="flex cursor-not-allowed items-center justify-between px-5 py-2.5 text-sm text-[#9F9FA4]">{{ child.label }}</span>
                    <a v-else-if="child.external" :href="child.to" target="_blank" rel="noopener noreferrer" class="flex items-center justify-between px-5 py-2.5 text-sm text-[#59585D] hover:bg-[#F6F6F6] hover:text-[#CAA05C]">{{ child.label }}</a>
                    <NuxtLink v-else :to="child.to || '/'" class="flex items-center justify-between gap-4 whitespace-nowrap px-5 py-2.5 text-sm text-[#59585D] hover:bg-[#F6F6F6] hover:text-[#CAA05C]">
                      {{ child.label }}
                    </NuxtLink>
                  </li>
                </ul>
              </div>

              <div
                v-if="item.seriesMega"
                class="fixed inset-x-0 top-[var(--site-header-height)] z-[60] pt-7 transition-all duration-300"
                :class="activeDesktopMenu === item.label ? 'pointer-events-auto visible opacity-100' : 'pointer-events-none invisible opacity-0'"
                @pointerenter="clearDesktopMenuCloseTimer"
                @pointerleave="scheduleDesktopMenuClose"
              >
                <div class="border-t border-black/5 bg-white shadow-2xl">
                  <div class="mx-auto max-w-[1512px] px-5 py-7 xl:px-12">
                    <div class="grid grid-cols-[210px_minmax(0,1fr)] gap-7 xl:grid-cols-[230px_minmax(0,1fr)] xl:gap-10">
                      <div class="border-r border-[#E3E3E8] pr-7 xl:pr-10">
                        <p class="text-[11px] uppercase tracking-[0.18em] text-[#9F9FA4]">Design Inspiration</p>
                        <h2 class="mt-1 flex items-center gap-3 font-display text-[24px] font-semibold leading-[30px] text-[#1C1C1D]">
                          <span>品牌系列</span>
                          <ArrowRight aria-hidden="true" class="h-5 w-5 text-[#CAA05C]" />
                        </h2>
                        <nav aria-label="設計案例分類" class="mt-5 border-t border-[#E3E3E8] pt-2">
                          <NuxtLink
                            v-for="child in (item.children || []).slice(1)"
                            :key="child.label"
                            :to="child.to || '/'"
                            class="flex items-center border-b border-[#E3E3E8] py-3 text-[14px] text-[#59585D] transition-colors hover:text-[#CAA05C]"
                          >
                            {{ child.label }}
                          </NuxtLink>
                        </nav>
                      </div>

                      <div class="min-w-0">
                        <div class="mb-3 flex items-end justify-between">
                          <div><p class="text-[11px] uppercase tracking-[0.18em] text-[#9F9FA4]">Kitchen Series</p><h2 class="mt-1 font-display text-[24px] font-semibold leading-[30px] text-[#1C1C1D]">品牌系列</h2></div>
                          <p class="text-xs text-[#9F9FA4]">目前開放 AI Kitchen</p>
                        </div>
                        <div class="grid grid-cols-5 gap-3 xl:gap-4">
                          <template v-for="style in KITCHEN_STYLES" :key="style.slug">
                            <NuxtLink v-if="style.available && style.route" :to="style.route" class="group/card relative aspect-[16/10] overflow-hidden rounded-xl bg-[#1C1C1D]" @click="closeAllMenus">
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
                </div>
              </div>
            </div>
          </div>

          <NuxtLink to="/" aria-label="SAKURA Kitchen 首頁" class="site-header__desktop-logo flex w-[160px] shrink-0 items-center justify-center min-[1200px]:w-[266px]">
            <img src="/home-2026/logos/sakura-kitchen-horizontal.svg" alt="SAKURA Kitchen" width="266" height="21" class="h-auto w-full object-contain" />
          </NuxtLink>

          <div class="site-header__nav-side site-header__nav-side--right">
            <div
              v-for="item in rightNav"
              :key="item.label"
              class="desktop-nav-item relative flex h-[var(--site-header-height)] items-center"
              @pointerenter="openDesktopMenu(item.label)"
              @pointerleave="scheduleDesktopMenuClose"
              @focusin="openDesktopMenu(item.label)"
              @focusout="handleDesktopItemFocusOut"
            >
              <div v-if="item.children && item.to" class="flex h-[var(--site-header-height)] items-center whitespace-nowrap px-1 text-[15px] leading-[15px] text-white min-[1440px]:px-3">
                <NuxtLink :to="item.to" class="flex h-full items-center">{{ item.label }}</NuxtLink>
                <button type="button" :aria-label="`展開${item.label}選單`" :aria-expanded="activeDesktopMenu === item.label" class="flex h-full items-center pl-1" @click="openDesktopMenu(item.label)">
                  <ChevronDown class="h-3.5 w-3.5 transition-transform" :class="activeDesktopMenu === item.label ? 'rotate-180' : ''" />
                </button>
              </div>
              <button v-else-if="item.children" type="button" :aria-expanded="activeDesktopMenu === item.label" class="flex h-[var(--site-header-height)] items-center gap-1 whitespace-nowrap px-1 text-[15px] text-white min-[1440px]:px-3" @click="openDesktopMenu(item.label)">{{ item.label }} <ChevronDown class="h-3.5 w-3.5 transition-transform" :class="activeDesktopMenu === item.label ? 'rotate-180' : ''" /></button>
              <a
                v-else-if="item.to?.startsWith('http')"
                :href="item.to"
                target="_blank"
                rel="noopener noreferrer"
                :data-footer-align-anchor="item.label === '櫻花集團' ? 'sakura-group' : undefined"
                class="whitespace-nowrap px-1 py-2 text-[15px] text-white min-[1440px]:px-3"
              >{{ item.label }}</a>
              <NuxtLink v-else :to="item.to || '#'" class="whitespace-nowrap px-1 py-2 text-[15px] text-white min-[1440px]:px-3">{{ item.label }}</NuxtLink>
              <div v-if="item.children" class="desktop-nav-dropdown absolute right-0 top-full z-50 pt-2 transition-all" :class="activeDesktopMenu === item.label ? 'pointer-events-auto visible opacity-100' : 'pointer-events-none invisible opacity-0'">
                <ul class="min-w-[190px] rounded-xl border border-[#E3E3E8] bg-white py-2 shadow-xl">
                  <li v-for="child in item.children" :key="child.label">
                    <span v-if="child.disabled" aria-disabled="true" class="block cursor-not-allowed whitespace-nowrap px-5 py-2.5 text-sm text-[#9F9FA4]">{{ child.label }}</span>
                    <NuxtLink v-else :to="child.to || '/'" class="block whitespace-nowrap px-5 py-2.5 text-sm text-[#59585D] hover:bg-[#F6F6F6] hover:text-[#CAA05C]">{{ child.label }}</NuxtLink>
                  </li>
                </ul>
              </div>
            </div>
          </div>

          <div class="site-header__desktop-search">
            <button type="button" aria-label="搜尋" class="flex h-10 w-10 items-center justify-center text-white" @click="closeAllMenus(); searchOpen = true"><Search class="h-[15px] w-[15px]" /></button>
          </div>
        </nav>

        <div class="flex w-full items-center justify-between lg:hidden">
          <NuxtLink to="/" aria-label="SAKURA Kitchen 首頁" class="w-[184px]"><img src="/home-2026/logos/sakura-kitchen-horizontal.svg" alt="SAKURA Kitchen" width="266" height="21" class="h-auto w-full" /></NuxtLink>
          <div class="flex items-center gap-5 text-white"><button type="button" aria-label="搜尋" class="flex h-10 w-10 items-center justify-center" @click="searchOpen = true"><Search class="h-[15px] w-[15px]" /></button><button :aria-label="mobileOpen ? '關閉選單' : '開啟選單'" @click="mobileOpen = !mobileOpen"><X v-if="mobileOpen" class="h-7 w-7" /><Menu v-else class="h-7 w-7" /></button></div>
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
          <template v-else>
            <template v-for="card in item.mega" :key="card.label">
              <NuxtLink v-if="card.to" :to="card.to" class="block py-3 text-sm text-white/80">{{ card.label }}</NuxtLink>
              <span v-else aria-disabled="true" class="block cursor-not-allowed py-3 text-sm text-white/35">{{ card.label }}・尚未開放</span>
            </template>
            <NuxtLink to="/catalogues/catalog" class="block py-3 text-sm text-[#CAA05C]">廚房商品型錄</NuxtLink>
          </template>
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
.site-header__desktop-nav {
  --header-logo-width: 160px;
  grid-template-columns: 40px minmax(0, 1fr) var(--header-logo-width) minmax(0, 1fr) 40px;
}

.site-header__nav-side {
  display: grid;
  grid-template-columns: repeat(4, minmax(0, 1fr));
  min-width: 0;
  align-items: center;
}

.site-header__nav-side--left {
  grid-column: 2;
}

.site-header__desktop-logo {
  grid-column: 3;
}

.site-header__nav-side--right {
  grid-column: 4;
}

.site-header__nav-side > .desktop-nav-item {
  min-width: 0;
  justify-self: center;
}

.site-header__desktop-search {
  position: relative;
  grid-column: 5;
  display: flex;
  width: 40px;
  height: var(--site-header-height);
  align-items: center;
  justify-content: center;
}

.site-header__desktop-search::before {
  position: absolute;
  top: 50%;
  left: 0;
  width: 1px;
  height: 28px;
  content: '';
  background: rgb(255 255 255 / 40%);
  transform: translate(-12px, -50%);
}

@media (min-width: 1200px) {
  .site-header__desktop-nav {
    --header-logo-width: 266px;
  }
}

.desktop-nav-dropdown {
  transition-duration: 220ms;
  transition-property: opacity, visibility;
}
</style>
