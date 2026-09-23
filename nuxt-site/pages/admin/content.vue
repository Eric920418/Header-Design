<script setup lang="ts">
import { Plus, Search, ArrowUpRight, ArrowDown, Save, Image, Eye } from 'lucide-vue-next'
import { ADMIN_CONTENT, ADMIN_MEDIA, type AdminContent, type AdminMedia } from '~/data/adminDemo'
definePageMeta({ layout: 'admin' })
useSeoMeta({ title: '內容管理｜SAKURA Content Studio' })
const route = useRoute()
const query = ref('')
const category = ref('全部內容')
const status = ref('全部狀態')
const editing = ref<AdminContent | null>(null)
const picker = ref(false)
const preview = ref(false)
const notice = ref('')
const filtered = computed(() => ADMIN_CONTENT.filter(item =>
  (category.value === '全部內容' || item.category === category.value) &&
  (status.value === '全部狀態' || item.status === status.value) &&
  `${item.title} ${item.excerpt}`.includes(query.value.trim()),
))
const edit = (item: AdminContent) => { notice.value = ''; editing.value = { ...item } }
const create = () => edit({ id: 'new', title: '', category: '最新消息', status: '草稿', date: '2026.09.14', excerpt: '', image: ADMIN_MEDIA[0]!.src })
const selectImage = (media: AdminMedia) => { if (editing.value) editing.value.image = media.src; picker.value = false }
const showNotice = (action: string) => { notice.value = `「${action}」為提案操作示意，沒有寫入資料或發布內容。關閉編輯畫面後將捨棄本次輸入。` }
watch(() => route.fullPath, () => {
  status.value = route.query.status === 'draft' ? '草稿' : route.query.status === 'published' ? '已發布' : '全部狀態'
  const item = ADMIN_CONTENT.find(item => item.id === route.query.edit)
  if (item) edit(item)
  else if (route.query.new === '1') create()
  else editing.value = null
}, { immediate: true })
</script>

<template>
  <div class="cms-page">
    <div class="cms-heading"><h1>內容管理</h1><button type="button" class="cms-button cms-button-dark" @click="create"><Plus :size="17" />新增內容</button></div>
    <section class="cms-panel cms-content-panel"><div class="cms-content-tools"><div class="cms-tabs" aria-label="內容分類"><button v-for="item in ['全部內容', '最新消息', '設計案例']" :key="item" type="button" :class="{ active: category === item }" :aria-pressed="category === item" @click="category = item">{{ item }}<span>{{ item === '全部內容' ? ADMIN_CONTENT.length : ADMIN_CONTENT.filter(row => row.category === item).length }}</span></button></div><div class="cms-filter-tools"><label class="cms-search"><Search :size="16" /><input v-model="query" aria-label="搜尋內容" placeholder="搜尋內容標題或文字" /></label><select v-model="status" aria-label="內容狀態"><option>全部狀態</option><option>已發布</option><option>草稿</option></select></div></div>
      <div class="cms-table-wrap"><table class="cms-content-table"><thead><tr><th>內容名稱</th><th>分類</th><th>狀態</th><th>更新日期 <ArrowDown :size="12" /></th><th><span class="cms-sr-only">操作</span></th></tr></thead><tbody><tr v-for="item in filtered" :key="item.id"><td><button type="button" class="cms-content-title" @click="edit(item)"><AdminImage :src="item.image" :alt="item.title" /><span><strong>{{ item.title }}</strong><small>{{ item.excerpt }}</small></span></button></td><td><span class="cms-category-label">{{ item.category }}</span></td><td><span class="cms-status" :class="item.status === '草稿' ? 'draft' : 'published'">{{ item.status }}</span></td><td class="cms-table-date">{{ item.date }}</td><td><button type="button" class="cms-icon-button" :aria-label="`編輯 ${item.title}`" @click="edit(item)"><ArrowUpRight :size="19" /></button></td></tr></tbody></table></div>
      <p v-if="!filtered.length" class="cms-empty" role="status">沒有符合的內容，請調整搜尋文字或篩選條件。</p><div class="cms-table-footer"><span>顯示 {{ filtered.length }} / {{ ADMIN_CONTENT.length }} 篇內容</span></div>
    </section>
    <AdminDialog :open="Boolean(editing)" :title="editing?.id === 'new' ? '新增內容' : '編輯內容'" wide @close="editing = null; picker = false; preview = false">
      <template v-if="editing"><p class="cms-dialog-description">展示編輯，關閉後不保留。</p><div class="cms-content-editor"><div class="cms-form"><label>內容標題<input v-model="editing.title" maxlength="120" placeholder="輸入標題" /></label><div class="cms-form-row"><label>內容分類<select v-model="editing.category"><option>最新消息</option><option>設計案例</option></select></label><label>展示狀態<select v-model="editing.status"><option>草稿</option><option>已發布</option></select></label></div><label>內容摘要<textarea aria-label="內容摘要" v-model="editing.excerpt" rows="7" maxlength="1200" placeholder="輸入摘要" /></label></div><div class="cms-field"><span>封面圖片</span><button type="button" class="cms-image-picker cms-content-cover" aria-label="更換封面" @click="picker = true"><AdminImage :src="editing.image" alt="內容封面預覽" /><span><Image :size="16" />更換封面</span></button></div></div><p v-if="notice" class="cms-notice" role="status">{{ notice }}</p><div class="cms-dialog-actions"><button type="button" class="cms-button" @click="preview = true"><Eye :size="16" />預覽內容</button><button type="button" class="cms-button" @click="showNotice('儲存草稿')"><Save :size="16" />儲存草稿</button><button type="button" class="cms-button cms-button-dark" @click="showNotice('發布內容')">發布內容 <ArrowUpRight :size="16" /></button></div></template>
    </AdminDialog>
    <AdminDialog :open="picker" title="選擇封面" wide @close="picker = false"><AdminMediaGrid :selected="editing?.image" picking @select="selectImage" /></AdminDialog>
    <AdminDialog :open="preview" title="內容預覽" @close="preview = false"><article v-if="editing" class="cms-article-preview"><AdminImage :src="editing.image" alt="故事封面" /><span class="cms-eyebrow">{{ editing.category }} · 示意預覽</span><h2>{{ editing.title || '尚未填寫標題' }}</h2><p>{{ editing.excerpt || '尚未填寫摘要' }}</p></article></AdminDialog>
  </div>
</template>
