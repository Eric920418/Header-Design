<script setup lang="ts">
import { ArrowUpRight, LayoutDashboard, PanelsTopLeft, Files, Images, Menu } from 'lucide-vue-next'
import '~/assets/css/admin.css'
const route = useRoute()
const mobileNav = ref(false)
const fatalError = ref('')
const navigation = [
  { to: '/admin', label: '工作台總覽', icon: LayoutDashboard },
  { to: '/admin/home', label: '首頁管理', icon: PanelsTopLeft },
  { to: '/admin/content', label: '內容管理', icon: Files },
  { to: '/admin/media', label: '媒體庫', icon: Images },
]
const active = computed(() => navigation.find(item => item.to === route.path) || navigation[0]!)
watch(() => route.path, () => { mobileNav.value = false })
useSeoMeta({ robots: 'noindex, nofollow' })
onErrorCaptured((error, _instance, info) => {
  fatalError.value = `${info}\n${error instanceof Error ? `${error.message}\n${error.stack || ''}` : String(error)}`
  return false
})
</script>

<template>
  <div class="cms">
    <a href="#cms-main" class="cms-skip">跳至主要內容</a>
    <aside class="cms-sidebar">
      <NuxtLink to="/admin" class="cms-brand" aria-label="SAKURA 工作台"><img src="/home-2026/logos/sakura-kitchen-horizontal.svg" alt="SAKURA KITCHEN" /></NuxtLink>
      <nav aria-label="後台主選單"><NuxtLink v-for="item in navigation" :key="item.to" :to="item.to" :class="{ active: route.path === item.to }" :aria-current="route.path === item.to ? 'page' : undefined"><component :is="item.icon" :size="19" /><span>{{ item.label }}</span><ArrowUpRight v-if="route.path === item.to" :size="16" /></NuxtLink></nav>
      <a href="/" target="_blank" rel="noopener noreferrer" class="cms-visit">查看品牌網站 <ArrowUpRight :size="17" /></a>
      <div class="cms-profile"><span>編</span><div>品牌編輯<small>展示帳號</small></div><span class="cms-profile-dot" aria-hidden="true" /></div>
    </aside>
    <div class="cms-shell">
      <header class="cms-topbar"><div class="cms-topbar-location"><button type="button" class="cms-icon-button cms-menu-toggle" aria-label="開啟後台選單" @click="mobileNav = true"><Menu :size="20" /></button><strong>{{ active.label }}</strong></div><span class="cms-demo-badge"><i />提案展示・假資料</span></header>
      <main id="cms-main" class="cms-main" tabindex="-1"><pre v-if="fatalError" class="cms-error" role="alert">{{ fatalError }}</pre><slot v-else /></main>
    </div>
    <AdminDialog :open="mobileNav" title="工作空間" @close="mobileNav = false"><nav class="cms-mobile-nav" aria-label="行動版後台選單"><NuxtLink v-for="item in navigation" :key="item.to" :to="item.to" :aria-current="route.path === item.to ? 'page' : undefined" @click="mobileNav = false"><component :is="item.icon" :size="20" />{{ item.label }}<ArrowUpRight :size="18" /></NuxtLink><a href="/" target="_blank" rel="noopener noreferrer">查看品牌網站 <ArrowUpRight :size="18" /></a></nav></AdminDialog>
  </div>
</template>
