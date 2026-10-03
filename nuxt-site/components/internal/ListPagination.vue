<script setup lang="ts">
import { ArrowUpLeft, ArrowUpRight } from 'lucide-vue-next'
import { visibleListPages } from '~/utils/listPagination'

const props = defineProps<{ currentPage: number; totalPages: number; label: string }>()
const route = useRoute()
const pages = computed(() => visibleListPages(props.currentPage, props.totalPages))
function pageRoute(page: number) {
  const query = { ...route.query }
  if (page > 1) query.page = String(page)
  else delete query.page
  return { path: route.path, query }
}
</script>

<template>
  <nav v-if="totalPages > 0" class="list-pagination" :aria-label="label">
    <NuxtLink v-if="currentPage > 1" :to="pageRoute(currentPage - 1)" class="list-pagination__arrow list-pagination__arrow--prev" aria-label="上一頁"><ArrowUpLeft aria-hidden="true" /></NuxtLink>
    <template v-for="(page, index) in pages" :key="`${page}-${index}`">
      <span v-if="page === 'ellipsis'" class="list-pagination__ellipsis" aria-hidden="true">…</span>
      <span v-else-if="page === currentPage" class="list-pagination__current" aria-current="page" :aria-label="`第${page}頁，目前頁面`">{{ page }}</span>
      <NuxtLink v-else :to="pageRoute(page)" :aria-label="`第${page}頁`">{{ page }}</NuxtLink>
    </template>
    <NuxtLink v-if="currentPage < totalPages" :to="pageRoute(currentPage + 1)" class="list-pagination__arrow list-pagination__arrow--next" aria-label="下一頁"><ArrowUpRight aria-hidden="true" /></NuxtLink>
  </nav>
</template>

<style scoped>
.list-pagination { display: flex; flex-wrap: wrap; align-items: center; justify-content: center; gap: 10px; margin-top: 41px; font-family: var(--font-ui); font-size: 16px; line-height: 24px; }
.list-pagination > a,
.list-pagination > span { display: flex; width: 40px; height: 40px; align-items: center; justify-content: center; border-radius: 100px; color: #1c1c1d; }
.list-pagination > a { cursor: pointer; transition: color .3s ease, background-color .3s ease; }
.list-pagination > a:hover,
.list-pagination > a:focus-visible,
.list-pagination > .list-pagination__current { color: #fff; background: #caa05c; }
.list-pagination > a:focus-visible { outline: 2px solid #caa05c; outline-offset: 4px; }
.list-pagination__arrow svg { width: 21px; height: 21px; transition: transform .3s ease; }
.list-pagination__arrow--next:hover svg,
.list-pagination__arrow--next:focus-visible svg { transform: rotate(45deg); }
.list-pagination__arrow--prev:hover svg,
.list-pagination__arrow--prev:focus-visible svg { transform: rotate(-45deg); }
@media (max-width: 767px) { .list-pagination { margin-top: 30px; } .list-pagination > a, .list-pagination > span { width: 44px; height: 44px; } }
@media (prefers-reduced-motion: reduce) { .list-pagination > a, .list-pagination__arrow svg { transition: none; } }
</style>
