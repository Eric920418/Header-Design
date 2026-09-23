<script setup lang="ts">
import { ArrowUpRight, ChevronRight, Eye, Image, Monitor, Smartphone, Save, LayoutTemplate } from 'lucide-vue-next'
import { ADMIN_HOME, type AdminMedia } from '~/data/adminDemo'
definePageMeta({ layout: 'admin' })
useSeoMeta({ title: '首頁管理｜SAKURA Content Studio' })
const draft = reactive({ ...ADMIN_HOME })
const picker = ref(false)
const preview = ref(false)
const mobilePreview = ref(false)
const notice = ref('')
const section = ref(0)
const sections = [
  { name: '首頁主視覺' },
  { name: '廚房系列' },
  { name: '精選設計案例' },
  { name: '品牌理念' },
  { name: '門市據點' },
]
const selectImage = (media: AdminMedia) => { draft.image = media.src; picker.value = false }
const showNotice = (action: string) => { notice.value = `「${action}」為提案操作示意。目前變更僅供畫面預覽，未儲存、未發布；重新整理後會還原。` }
</script>

<template>
  <div class="cms-page">
    <div class="cms-heading">
      <h1>首頁管理</h1>
      <div class="cms-actions">
        <button class="cms-button" type="button" @click="preview = true"><Eye :size="17" />預覽</button>
        <button class="cms-button" type="button" @click="showNotice('儲存草稿')"><Save :size="17" />儲存草稿</button>
        <button class="cms-button cms-button-gold" type="button" @click="showNotice('發布網站')">發布網站 <ArrowUpRight :size="17" /></button>
      </div>
    </div>
    <p v-if="notice" class="cms-notice" role="status">{{ notice }}</p>
    <div class="cms-editor" :class="{ 'cms-editor-readonly': section !== 0 }">
      <aside class="cms-section-list">
        <div class="cms-section-list-title"><LayoutTemplate :size="17" /><strong>頁面區塊</strong></div>
        <button v-for="(item, index) in sections" :key="item.name" type="button" :class="{ active: section === index }" :aria-pressed="section === index" @click="section = index">
          <span class="cms-section-number">0{{ index + 1 }}</span><span>{{ item.name }}</span><ChevronRight :size="15" />
        </button>
      </aside>
      <section class="cms-preview-column">
        <div class="cms-preview-toolbar">
          <span aria-live="polite">{{ sections[section]!.name }}預覽</span>
          <div><button type="button" class="cms-icon-button" :class="{ active: !mobilePreview }" :aria-pressed="!mobilePreview" aria-label="桌機預覽" @click="mobilePreview = false"><Monitor :size="17" /></button><button type="button" class="cms-icon-button" :class="{ active: mobilePreview }" :aria-pressed="mobilePreview" aria-label="手機預覽" @click="mobilePreview = true"><Smartphone :size="17" /></button></div>
        </div>
        <div class="cms-preview-canvas"><AdminHomePreview :draft="draft" :section="section" :mobile="mobilePreview" /></div>
      </section>
      <aside v-if="section === 0" class="cms-properties">
        <div class="cms-properties-heading"><h2>編輯內容</h2></div>
        <div class="cms-form">
          <label>英文眉標<input v-model="draft.subtitle" maxlength="80" /></label>
          <label>主標題<textarea aria-label="主標題" v-model="draft.title" rows="2" maxlength="100" /></label>
          <label>說明文字<textarea aria-label="說明文字" v-model="draft.description" rows="3" maxlength="240" /></label>
          <label>按鈕文字<input v-model="draft.button" maxlength="30" /></label>
          <div class="cms-field"><span>主視覺圖片</span><button type="button" class="cms-image-picker" aria-label="更換圖片" @click="picker = true"><AdminImage :src="draft.image" alt="目前選用的首頁主視覺" /><span><Image :size="15" />更換圖片</span></button></div>
        </div>
      </aside>
    </div>
    <AdminDialog :open="picker" title="選擇圖片" wide @close="picker = false"><AdminMediaGrid :selected="draft.image" picking @select="selectImage" /></AdminDialog>
    <AdminDialog :open="preview" :title="`${sections[section]!.name}預覽`" wide @close="preview = false"><AdminHomePreview :draft="draft" :section="section" :mobile="mobilePreview" expanded /></AdminDialog>
  </div>
</template>
