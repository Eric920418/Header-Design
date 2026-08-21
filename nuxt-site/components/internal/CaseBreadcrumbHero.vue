<script setup lang="ts">
const route = useRoute()
const fromDesignInspiration = computed(() => route.query.from === 'inspiration')
const parentLabel = computed(() => fromDesignInspiration.value ? '設計靈感' : '案例門市')
const parentRoute = computed(() => fromDesignInspiration.value ? '/design-inspiration' : '/gallery')
</script>

<template>
  <section class="case-breadcrumb-hero hero-includes-header" aria-label="案例門市麵包屑">
    <div class="case-breadcrumb-hero__overlay" aria-hidden="true" />
    <nav aria-label="麵包屑" class="case-breadcrumb-hero__trail" v-reveal="{ anim: 'opalMoveUp' }">
      <NuxtLink to="/">首頁</NuxtLink>
      <span aria-hidden="true">/</span>
      <NuxtLink :to="parentRoute">{{ parentLabel }}</NuxtLink>
      <span aria-hidden="true">/</span>
      <span aria-current="page">門市案例</span>
    </nav>
  </section>
</template>

<style scoped>
.case-breadcrumb-hero {
  position: relative;
  isolation: isolate;
  overflow: hidden;
  padding: 207px 30px 139px;
  background: url('/section-3/store-songzhu.jpg') center 48% / cover no-repeat fixed;
  color: #fff;
}

.case-breadcrumb-hero__overlay {
  position: absolute;
  z-index: -1;
  inset: 0;
  background: #100801;
  opacity: .64;
}

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
  .case-breadcrumb-hero {
    padding: 120px 30px 80px;
    background-attachment: scroll;
  }
}

@media (max-width: 767px) {
  .case-breadcrumb-hero { padding: 100px 15px 60px; }
}

@media (prefers-reduced-motion: reduce) {
  .case-breadcrumb-hero { background-attachment: scroll; }
  .case-breadcrumb-hero__trail a { transition: none; }
}
</style>
