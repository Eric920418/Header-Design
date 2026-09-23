<script setup lang="ts">
import { ArrowUpRight, ArrowRight, Plus, PanelsTopLeft, Files, Image, Pencil, Clock3 } from 'lucide-vue-next'
import { ADMIN_CONTENT, ADMIN_MEDIA } from '~/data/adminDemo'
definePageMeta({ layout: 'admin' })
useSeoMeta({ title: '工作台總覽｜SAKURA Content Studio' })
const drafts = ADMIN_CONTENT.filter(item => item.status === '草稿')
const metrics = [
  { value: String(ADMIN_CONTENT.filter(item => item.status === '已發布').length).padStart(2, '0'), label: '已發布內容', icon: Files, to: '/admin/content?status=published' },
  { value: String(drafts.length).padStart(2, '0'), label: '待完成草稿', icon: Pencil, to: '/admin/content?status=draft' },
  { value: String(ADMIN_MEDIA.length).padStart(2, '0'), label: '品牌影像素材', icon: Image, to: '/admin/media' },
]
</script>

<template>
  <div class="cms-page">
    <div class="cms-heading"><h1>工作台總覽</h1><NuxtLink to="/admin/content?new=1" class="cms-button cms-button-gold"><Plus :size="17" />新增內容</NuxtLink></div>
    <div class="cms-metrics">
      <NuxtLink v-for="metric in metrics" :key="metric.label" :to="metric.to" class="cms-metric"><div><span class="cms-metric-label"><component :is="metric.icon" :size="16" />{{ metric.label }}</span><strong>{{ metric.value }}</strong></div><ArrowUpRight :size="17" /></NuxtLink>
    </div>
    <div class="cms-overview-feature">
      <div class="cms-cover-story"><AdminImage src="/home-2026/hero/ai-kitchen.jpg" alt="SAKURA 精品廚房主視覺預覽" /><div class="cms-cover-shade" /><div class="cms-cover-copy"><h2>首頁主視覺</h2><NuxtLink to="/admin/home" class="cms-cover-link">編輯首頁 <ArrowUpRight :size="19" /></NuxtLink></div></div>
      <div class="cms-feature-aside"><h2>快捷操作</h2><div class="cms-quick-links"><NuxtLink to="/admin/home"><PanelsTopLeft :size="20" /><span>首頁管理</span><ArrowUpRight :size="18" /></NuxtLink><NuxtLink to="/admin/content?new=1"><Plus :size="20" /><span>新增內容</span><ArrowUpRight :size="18" /></NuxtLink><NuxtLink to="/admin/media"><Image :size="20" /><span>媒體庫</span><ArrowUpRight :size="18" /></NuxtLink></div></div>
    </div>
    <div class="cms-overview-bottom">
      <section class="cms-panel cms-recent"><div class="cms-section-heading"><h2>最近編輯</h2><NuxtLink to="/admin/content" class="cms-text-link">所有內容 <ArrowRight :size="16" /></NuxtLink></div><NuxtLink v-for="item in ADMIN_CONTENT.slice(0, 3)" :key="item.id" :to="`/admin/content?edit=${item.id}`" class="cms-recent-row"><AdminImage :src="item.image" :alt="item.title" /><div><span class="cms-muted">{{ item.category }}</span><h3>{{ item.title }}</h3></div><span class="cms-status" :class="item.status === '草稿' ? 'draft' : 'published'">{{ item.status }}</span><span class="cms-date">{{ item.date }}</span><ArrowUpRight :size="17" /></NuxtLink></section>
      <section class="cms-panel cms-drafts"><div class="cms-section-heading"><h2>待完成草稿 <span class="cms-count">{{ drafts.length }}</span></h2><Clock3 :size="18" /></div><NuxtLink v-for="item in drafts" :key="item.id" :to="`/admin/content?edit=${item.id}`" class="cms-draft-row"><span class="cms-draft-dot" /><div><h3>{{ item.title }}</h3><span class="cms-muted">{{ item.category }} · {{ item.date }}</span></div><ArrowRight :size="17" /></NuxtLink></section>
    </div>
  </div>
</template>
