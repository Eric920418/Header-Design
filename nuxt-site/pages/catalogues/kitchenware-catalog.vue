<script setup lang="ts">
import { ArrowUpRight } from 'lucide-vue-next'
import { KITCHEN_CATALOGUES } from '~/data/catalogues'

useSeoMeta({
  title: '品牌系列型錄｜SAKURA 整體廚房',
  description: '下載 MUJI Basic+、Clever、iPremium、Joyful、Premium、Harmony、Loft Chic 與 Elegant 八款 SAKURA 整體廚房系列產品型錄。',
  ogTitle: '品牌系列型錄｜SAKURA 整體廚房',
  ogDescription: '瀏覽並下載八款 SAKURA 整體廚房系列產品型錄。',
  ogImage: KITCHEN_CATALOGUES[0]?.cover,
})
</script>

<template>
  <main class="catalogue-page">
    <section class="catalogue-hero hero-includes-header" aria-labelledby="catalogue-page-title">
      <span class="catalogue-hero__overlay" aria-hidden="true" />
      <div class="catalogue-hero__inner" v-reveal="{ anim: 'opalMoveUp' }">
        <h1 id="catalogue-page-title">品牌系列型錄</h1>
        <nav aria-label="麵包屑" class="catalogue-hero__trail">
          <NuxtLink to="/">首頁</NuxtLink>
          <span aria-hidden="true">/</span>
          <span aria-current="page">品牌系列型錄</span>
        </nav>
      </div>
    </section>

    <section class="catalogue-projects" aria-labelledby="catalogue-list-title">
      <div class="catalogue-projects__rail internal-rail-safe">
        <h2 id="catalogue-list-title" class="sr-only">八款品牌系列產品型錄</h2>
        <ul class="catalogue-grid" aria-label="品牌系列型錄清單">
          <li
            v-for="(catalogue, index) in KITCHEN_CATALOGUES"
            :key="catalogue.id"
            v-reveal="{ anim: 'opalMoveUp', delay: Math.min(index * 80, 240) }"
            class="catalogue-card"
          >
            <article>
              <a
                :href="catalogue.pdfUrl"
                target="_blank"
                rel="noopener noreferrer"
                class="catalogue-card__link"
                :aria-label="`開啟 PDF：${catalogue.title}`"
              >
                <span class="catalogue-card__transition">
                  <span class="catalogue-card__image">
                    <InternalCatalogueImage :src="catalogue.cover" :alt="`${catalogue.title}封面`" />
                  </span>
                  <span class="catalogue-card__shade" aria-hidden="true" />
                  <span class="catalogue-card__action" aria-hidden="true">
                    <span>開啟型錄</span>
                    <span class="catalogue-card__arrow"><ArrowUpRight /></span>
                  </span>
                </span>
                <span class="catalogue-card__text">
                  <strong>{{ catalogue.title }}</strong>
                  <span>{{ catalogue.description }}</span>
                </span>
              </a>
            </article>
          </li>
        </ul>
      </div>
    </section>
  </main>
</template>

<style scoped>
.catalogue-page { color: #59585d; background: #f6f6f6; }

.catalogue-hero {
  position: relative;
  isolation: isolate;
  min-height: 360px;
  overflow: hidden;
  color: #fff;
  background: url('/section-3/service-process/breadcrumb-df.jpg') center / cover no-repeat fixed;
}

.catalogue-hero__overlay {
  position: absolute;
  z-index: -1;
  inset: 0;
  background: #100801;
  opacity: .64;
}

.catalogue-hero__inner {
  width: min(1410px, calc(100% - 60px));
  margin-inline: auto;
  padding: 138px 0 97px;
  text-align: center;
}

.catalogue-hero h1 {
  margin: 0 0 35px;
  color: #fff;
  font-family: var(--font-cjk-serif);
  font-size: 80px;
  font-weight: 500;
  line-height: .9523809524;
}

.catalogue-hero__trail {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 22px;
}

.catalogue-hero__trail a { color: inherit; transition: color .3s ease; }
.catalogue-hero__trail a:hover,
.catalogue-hero__trail a:focus-visible { color: #caa05c; }

.catalogue-projects {
  overflow: hidden;
  padding: 100px 30px 130px;
  background: #f6f6f6;
}

.catalogue-projects__rail {
  width: min(1410px, 100%);
  margin-inline: auto;
}

.catalogue-projects__rail.internal-rail-safe { padding-inline: 43px; }

.catalogue-grid {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 50px 30px;
  margin: 0;
  padding: 0;
  list-style: none;
}

.catalogue-card { min-width: 0; }
.catalogue-card article,
.catalogue-card__link { display: block; }
.catalogue-card__link { color: inherit; }

.catalogue-card__transition {
  position: relative;
  display: block;
  overflow: hidden;
  border-radius: 24px;
  background: #e3e3e8;
}

.catalogue-card__image {
  display: block;
  width: 100%;
  aspect-ratio: .8333333333;
  overflow: hidden;
}

.catalogue-card__image :deep(img) { transition: transform .5s ease; }

.catalogue-card__shade {
  position: absolute;
  z-index: 1;
  inset: 0;
  background: rgba(0, 0, 0, .15);
  transition: background-color .5s ease;
}

.catalogue-card__action {
  position: absolute;
  right: 24px;
  bottom: 24px;
  z-index: 2;
  display: flex;
  align-items: center;
  gap: 12px;
  color: #fff;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  font-weight: 500;
  line-height: 22px;
  opacity: 0;
  visibility: hidden;
  transform: translateY(16px);
  transition: opacity .5s ease, visibility .5s ease, transform .5s ease;
}

.catalogue-card__arrow {
  display: flex;
  width: 64px;
  height: 64px;
  align-items: center;
  justify-content: center;
  border: 1px solid rgba(255, 255, 255, .12);
  border-radius: 50%;
  color: #fff;
  background: rgba(0, 0, 0, .56);
  backdrop-filter: blur(28px);
  transition: color .5s ease, background-color .5s ease;
}

.catalogue-card__arrow svg { width: 24px; height: 24px; }

.catalogue-card__text {
  position: relative;
  display: block;
  padding-top: 23px;
}

.catalogue-card__text strong {
  display: block;
  min-height: 36px;
  margin-bottom: 9px;
  color: #1c1c1d;
  font-family: var(--font-cjk-serif);
  font-size: 25px;
  font-weight: 500;
  line-height: 36px;
  transition: color .3s ease;
}

.catalogue-card__text > span {
  display: block;
  color: #59585d;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 23px;
}

.catalogue-card__link:hover .catalogue-card__shade,
.catalogue-card__link:focus-visible .catalogue-card__shade { background: rgba(0, 0, 0, .25); }
.catalogue-card__link:hover .catalogue-card__image :deep(img),
.catalogue-card__link:focus-visible .catalogue-card__image :deep(img) { transform: scale(1.05); }
.catalogue-card__link:hover .catalogue-card__action,
.catalogue-card__link:focus-visible .catalogue-card__action { opacity: 1; visibility: visible; transform: translateY(0); }
.catalogue-card__link:hover .catalogue-card__text strong,
.catalogue-card__link:focus-visible .catalogue-card__text strong { color: #caa05c; }
.catalogue-card__link:focus-visible { outline: 2px solid #caa05c; outline-offset: 6px; border-radius: 24px; }

@media (max-width: 1023px) {
  .catalogue-projects { padding-block: 80px; }
  .catalogue-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
}

@media (max-width: 767px) {
  .catalogue-hero { min-height: 288px; background-attachment: scroll; }
  .catalogue-hero__inner { width: calc(100% - 30px); padding: 80px 0 60px; }
  .catalogue-hero h1 { margin-bottom: 25px; font-size: 48px; line-height: 52px; }
  .catalogue-projects { padding: 60px 93px 80px 15px; }
  .catalogue-projects__rail.internal-rail-safe { padding-inline: 0; }
  .catalogue-grid { grid-template-columns: 1fr; gap: 42px; }
  .catalogue-card__action { right: 18px; bottom: 18px; gap: 10px; opacity: 1; visibility: visible; transform: none; }
  .catalogue-card__arrow { width: 54px; height: 54px; }
  .catalogue-card__text strong { min-height: 0; font-size: 25px; line-height: 36px; }
}

@media (prefers-reduced-motion: reduce) {
  .catalogue-card__image :deep(img),
  .catalogue-card__shade,
  .catalogue-card__action,
  .catalogue-card__text strong { transition: none; }
  .catalogue-card__link:hover .catalogue-card__image :deep(img),
  .catalogue-card__link:focus-visible .catalogue-card__image :deep(img) { transform: none; }
}
</style>
