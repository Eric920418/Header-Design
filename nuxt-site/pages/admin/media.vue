<script setup lang="ts">
import { Upload, ArrowUpRight } from 'lucide-vue-next'
import { ADMIN_MEDIA, type AdminMedia } from '~/data/adminDemo'
definePageMeta({ layout: 'admin' })
useSeoMeta({ title: '媒體庫｜SAKURA Content Studio' })
const selected = ref<AdminMedia | null>(null)
const notice = ref('')
</script>

<template>
  <div class="cms-page">
    <div class="cms-heading"><h1>媒體庫 <span class="cms-count">{{ ADMIN_MEDIA.length }}</span></h1><button type="button" class="cms-button cms-button-dark" @click="notice = '「上傳素材」為提案操作示意，本次不會開啟檔案、上傳或儲存任何資料。'"><Upload :size="17" />上傳素材</button></div>
    <p v-if="notice" class="cms-notice" role="status">{{ notice }}</p>
    <AdminMediaGrid @select="selected = $event" />
    <AdminDialog :open="Boolean(selected)" title="素材詳情" wide @close="selected = null"><div v-if="selected" class="cms-media-detail"><AdminImage :src="selected.src" :alt="selected.alt" /><div><h2>{{ selected.name }}</h2><dl><dt>素材分類</dt><dd>{{ selected.category }}</dd><dt>替代文字</dt><dd>{{ selected.alt }}</dd><dt>檔案格式</dt><dd>JPG</dd><dt>素材路徑</dt><dd>{{ selected.src }}</dd></dl><NuxtLink to="/admin/home" class="cms-button cms-button-dark" @click="selected = null">前往首頁編輯 <ArrowUpRight :size="16" /></NuxtLink></div></div></AdminDialog>
  </div>
</template>
