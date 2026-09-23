<script setup lang="ts">
import { Check, Search, ArrowUpRight } from 'lucide-vue-next'
import { ADMIN_MEDIA, type AdminMedia } from '~/data/adminDemo'
defineProps<{ selected?: string; picking?: boolean }>()
const emit = defineEmits<{ select: [media: AdminMedia] }>()
const category = ref('全部素材')
const query = ref('')
const categories = ['全部素材', '首頁主視覺', '設計案例', '品牌消息']
const filtered = computed(() => ADMIN_MEDIA.filter(item => (category.value === '全部素材' || item.category === category.value) && item.name.includes(query.value.trim())))
</script>

<template>
  <div class="cms-media-tools"><div class="cms-tabs" aria-label="素材分類"><button v-for="item in categories" :key="item" type="button" :class="{ active: category === item }" :aria-pressed="category === item" @click="category = item">{{ item }}</button></div><label class="cms-search"><Search :size="16" /><input v-model="query" aria-label="搜尋素材" placeholder="搜尋素材名稱" /></label></div>
  <div class="cms-media-grid">
    <button v-for="item in filtered" :key="item.id" type="button" class="cms-media-card" :class="{ selected: selected === item.src }" :aria-label="`${picking ? '選擇' : '檢視'} ${item.name}`" @click="emit('select', item)">
      <div class="cms-media-photo"><AdminImage :src="item.src" :alt="item.alt" /><span v-if="selected === item.src" class="cms-media-check"><Check :size="16" /></span><span v-else class="cms-media-arrow"><ArrowUpRight :size="19" /></span></div>
      <div class="cms-media-caption"><strong>{{ item.name }}</strong><span>{{ item.category }}<span>JPG</span></span></div>
    </button>
  </div>
  <p v-if="!filtered.length" class="cms-empty" role="status">沒有符合的素材，請試試其他名稱或分類。</p>
</template>
