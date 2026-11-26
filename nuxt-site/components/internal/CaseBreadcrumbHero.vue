<script setup lang="ts">
const props = defineProps<{ designListUrl?: string; labels?: Record<string, string>; title?: string }>()
const route = useRoute()
const fromDesignInspiration = computed(() => Boolean(props.designListUrl) || route.query.from === 'inspiration')
const parentLabel = computed(() => props.designListUrl ? props.labels?.breadcrumbList || '設計靈感' : fromDesignInspiration.value ? '設計靈感' : props.labels?.breadcrumbParent || '案例門市')
const parentRoute = computed(() => {
  if (props.designListUrl) return props.designListUrl
  if (!fromDesignInspiration.value) return '/gallery'
  const query = new URLSearchParams()
  for (const key of ['form', 'style', 'page']) if (typeof route.query[key] === 'string') query.set(key, route.query[key] as string)
  return '/design-inspiration' + (query.size ? `?${query}` : '')
})
</script>

<template>
  <section :id="designListUrl ? undefined : 'store-case-hero'" data-hero-photo="songzhu" class="case-breadcrumb-hero hero-includes-header" :aria-label="designListUrl ? '設計案例麵包屑' : '案例門市麵包屑'">
    <div class="case-breadcrumb-hero__overlay" aria-hidden="true" />
    <p v-if="title" id="store-case-title" class="case-breadcrumb-hero__title">{{ title }}</p>
    <nav :id="designListUrl ? 'design-inspiration-breadcrumb' : 'store-case-breadcrumb'" aria-label="麵包屑" class="case-breadcrumb-hero__trail" v-reveal="{ anim: 'opalMoveUp' }">
      <InternalSmartBreadcrumb :fallback="[{ label: labels?.breadcrumbHome || '首頁', to: '/' }, { label: parentLabel, to: parentRoute }, { label: designListUrl ? labels?.breadcrumbDetail || '設計案例' : labels?.breadcrumbDetail || '門市案例' }]" v-slot="{ items, follow }">
        <template v-for="(item, index) in items" :key="index">
          <span v-if="index" aria-hidden="true">/</span>
          <NuxtLink v-if="item.to" :to="item.to" :aria-current="index === items.length - 1 ? 'page' : undefined" @click.capture="follow($event, item)">{{ item.label }}</NuxtLink>
          <span v-else aria-current="page">{{ item.label }}</span>
        </template>
      </InternalSmartBreadcrumb>
    </nav>
  </section>
</template>

<style scoped>
.case-breadcrumb-hero {
  position: relative;
  isolation: isolate;
  overflow: hidden;
  padding: 207px 30px 139px;
  background: var(--cms-image-asset_7692def0, url('/section-3/store-songzhu.jpg')) center 48% / cover no-repeat fixed;
  color: #fff;
}

.case-breadcrumb-hero__overlay {
  position: absolute;
  z-index: -1;
  inset: 0;
  background: #100801;
  opacity: .64;
}

.case-breadcrumb-hero__title {margin:0 0 15px;text-align:center;overflow-wrap:anywhere;font-family:var(--font-display);font-size:60px;line-height:1.2;}
.case-breadcrumb-hero__trail {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  width: min(1410px, 100%);
  margin-inline: auto;
  font-family: var(--font-ui);
  font-size: 15px;
  line-height: 20px;
  text-transform: uppercase;
}

.case-breadcrumb-hero__trail a {
  color: #fff;
  transition: color .3s ease;
}

.case-breadcrumb-hero__trail a:hover { color: #caa05c; }

@media (max-width: 1200px) and (min-width: 1025px) {
  .case-breadcrumb-hero { padding: 160px 30px 100px; }
}

@media (max-width: 1024px) {
  .case-breadcrumb-hero__title {font-size:42px;}
  .case-breadcrumb-hero {
    padding: 120px 30px 80px;
    background-attachment: scroll;
  }
}

@media (max-width: 767px) {
  .case-breadcrumb-hero__title {font-size:30px;}
  .case-breadcrumb-hero { padding: 100px 15px 60px; }
}

@media (prefers-reduced-motion: reduce) {
  .case-breadcrumb-hero { background-attachment: scroll; }
  .case-breadcrumb-hero__trail a { transition: none; }
}
</style>
