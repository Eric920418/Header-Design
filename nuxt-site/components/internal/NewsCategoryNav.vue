<script setup lang="ts">
import { Camera, Images, PlaySquare } from 'lucide-vue-next'

defineProps<{ active: 'activities' | 'latest' | 'video' }>()

const route = useRoute()
const categories = [
  { id: 'activities', label: '優惠活動', path: '/news/activities', icon: Camera },
  { id: 'latest', label: '最新消息', path: '/news/latest', icon: Images },
  { id: 'video', label: '媒體影音', path: '/news/video', icon: PlaySquare },
] as const
const categoryQuery = computed(() => {
  const { page: _page, ...query } = route.query
  return query
})
</script>

<template>
  <nav class="news-category-nav" aria-label="優惠消息分類">
    <NuxtLink
      v-for="category in categories"
      :key="category.id"
      :to="{ path: category.path, query: categoryQuery }"
      :aria-current="active === category.id ? 'page' : undefined"
    >
      <component :is="category.icon" aria-hidden="true" />
      {{ category.label }}
    </NuxtLink>
  </nav>
</template>

<style scoped>
.news-category-nav {
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  gap: 10px;
  margin-bottom: 30px;
}

.news-category-nav a {
  display: inline-flex;
  min-height: 34px;
  align-items: center;
  gap: 7px;
  padding: 5px 14px;
  border: 1px solid #e3e3e8;
  border-radius: 24px;
  color: #59585d;
  background: transparent;
  font-family: var(--font-cjk-sans);
  font-size: 14px;
  font-weight: 500;
  line-height: 24px;
  cursor: pointer;
  transition: color .3s ease, border-color .3s ease;
}

.news-category-nav :deep(svg) { width: 15px; height: 15px; flex-shrink: 0; }

.news-category-nav a[aria-current="page"] {
  border-color: #caa05c;
  color: #fff;
  background: #caa05c;
}

.news-category-nav a:not([aria-current="page"]):hover {
  border-color: #caa05c;
  color: #caa05c;
}

.news-category-nav a:focus-visible {
  outline: 2px solid #caa05c;
  outline-offset: 3px;
}

@media (max-width: 767px) {
  .news-category-nav { margin-bottom: 24px; }
  .news-category-nav a { min-height: 44px; }
}

@media (prefers-reduced-motion: reduce) {
  .news-category-nav a { transition: none; }
}
</style>
