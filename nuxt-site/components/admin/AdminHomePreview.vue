<script setup lang="ts">
import { ArrowUpRight, MapPin } from 'lucide-vue-next'
import { ADMIN_HOME, ADMIN_MEDIA, ADMIN_CONTENT } from '~/data/adminDemo'
defineProps<{ draft: typeof ADMIN_HOME; section: number; mobile?: boolean; expanded?: boolean }>()
const collections = [
  { name: 'Premium', description: '開放格局，從容享受每一場相聚。', media: ADMIN_MEDIA[0]! },
  { name: 'Clever', description: '收納與美感，剛剛好的日常。', media: ADMIN_MEDIA[1]! },
  { name: 'Basic+', description: '回歸生活，留下最喜歡的樣子。', media: ADMIN_MEDIA[2]! },
]
const cases = ADMIN_CONTENT.filter(item => item.category === '設計案例')
</script>

<template>
  <div class="cms-mini-site" :class="{ 'cms-mini-mobile': mobile, 'cms-mini-expanded': expanded }" :data-preview-section="section">
    <div class="cms-mini-header"><span>SAKURA<span>KITCHEN</span></span><span>讓生活，更有想像。</span></div>
    <template v-if="section === 0">
      <div class="cms-mini-hero">
        <AdminImage :src="draft.image" alt="首頁主視覺編輯預覽" /><div class="cms-mini-shade" />
        <div class="cms-mini-copy"><span>{{ draft.subtitle }}</span><h2 data-testid="hero-preview-title">{{ draft.title }}</h2><p>{{ draft.description }}</p><span class="cms-mini-cta">{{ draft.button }} <ArrowUpRight :size="15" /></span></div>
      </div>
      <div class="cms-mini-bottom"><span>DESIGNED AROUND YOU.</span><h3>廚房，是生活的起點。</h3><div><span>Premium</span><span>Clever</span><span>Basic+</span></div></div>
    </template>
    <section v-else-if="section === 1" class="cms-section-preview">
      <span class="cms-eyebrow">KITCHEN COLLECTIONS</span><h2>找到你的理想廚房</h2><p>三種生活提案，讓廚房貼近你的每一天。</p>
      <div class="cms-preview-tiles"><article v-for="collection in collections" :key="collection.name"><AdminImage :src="collection.media.src" :alt="collection.media.alt" /><h3>{{ collection.name }}</h3><p>{{ collection.description }}</p></article></div>
    </section>
    <section v-else-if="section === 2" class="cms-section-preview cms-cases-preview">
      <span class="cms-eyebrow">SELECTED PROJECTS</span><h2>生活的樣子，設計的答案</h2><p>從真實空間出發，探索下一個家的靈感。</p>
      <div class="cms-preview-tiles"><article v-for="item in cases" :key="item.id"><AdminImage :src="item.image" :alt="item.title" /><h3>{{ item.title }}</h3><p>{{ item.excerpt }}</p></article></div>
    </section>
    <section v-else-if="section === 3" class="cms-section-preview cms-brand-preview">
      <AdminImage :src="ADMIN_MEDIA[2]!.src" :alt="ADMIN_MEDIA[2]!.alt" />
      <div><span class="cms-eyebrow">OUR PHILOSOPHY</span><h2>以廚房，連結家的美好</h2><p>從料理的動線，到每一處收納細節，讓設計回應生活，讓家更貼近理想。</p><div class="cms-preview-values"><span>以人為本</span><span>用心設計</span><span>安心陪伴</span></div></div>
    </section>
    <section v-else-if="section === 4" class="cms-section-preview">
      <span class="cms-eyebrow">FIND A SHOWROOM</span><h2>走進門市，遇見理想生活</h2><p>親身感受材質與空間，找到適合你的廚房。</p>
      <div class="cms-store-preview"><AdminImage :src="ADMIN_MEDIA[6]!.src" :alt="ADMIN_MEDIA[6]!.alt" /><div><span><MapPin :size="15" />台中</span><h3>台中品牌生活館</h3><p>探索完整廚房展示與生活提案。</p><span class="cms-preview-store-caption">品牌門市 · 展示資料</span></div></div>
    </section>
  </div>
</template>
