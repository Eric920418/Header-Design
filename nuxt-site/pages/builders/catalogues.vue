<script setup lang="ts">
import { ArrowUpRight } from 'lucide-vue-next'

interface BuilderCatalogueCard {
  id: string
  title: string
  description: string
  cover: string
  pdfUrl: string
  actionLabel: string
}

const catalogues: BuilderCatalogueCard[] = [
  {
    id: 'developer-2026',
    title: '建商專區型錄',
    description: '建商專區型錄 2026',
    cover: '/section-6/builders/catalogues/developer-catalogue-2026.jpg',
    pdfUrl: '/section-6/builders/catalogues/developer-catalogue-2026.pdf',
    actionLabel: '預覽',
  },
]

useSeoMeta({
  title: '建商專區型錄｜SAKURA 整體廚房',
  description: '預覽 SAKURA KITCHEN 2026 建商專區型錄；正式 PDF 將於甲方提供後開放。',
  ogTitle: '建商專區型錄｜SAKURA 整體廚房',
  ogDescription: 'SAKURA KITCHEN 建商合作型錄。',
  ogImage: '/section-6/builders/catalogues/developer-catalogue-2026.jpg',
})
</script>

<template>
  <main class="builder-catalogue-page">
    <section class="builder-catalogue-hero hero-includes-header" aria-labelledby="builder-catalogue-title">
      <span class="builder-catalogue-hero__overlay" aria-hidden="true" />
      <div class="builder-catalogue-hero__inner">
        <h1 id="builder-catalogue-title" v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="ev">Developer Catalogues</h1>
        <nav v-reveal="{ anim: 'opalMoveUp', delay: 90 }" aria-label="麵包屑" class="builder-catalogue-hero__trail ev" data-ev="opalMoveUp" style="animation-delay:90ms">
          <NuxtLink to="/">首頁</NuxtLink>
          <span aria-hidden="true">/</span>
          <NuxtLink to="/builders">建商專區</NuxtLink>
          <span aria-hidden="true">/</span>
          <span aria-current="page">建商專區型錄</span>
        </nav>
      </div>
    </section>

    <section class="builder-catalogue-projects" aria-labelledby="builder-catalogue-list-title">
      <div class="builder-catalogue-projects__rail internal-rail-safe">
        <h2 id="builder-catalogue-list-title" class="sr-only">建商專區與品牌系列型錄</h2>
        <ul class="builder-catalogue-grid" aria-label="建商專區型錄清單">
          <li
            v-for="(catalogue, index) in catalogues"
            :key="catalogue.id"
            v-reveal="{ anim: 'opalMoveUp', delay: Math.min(index * 80, 240) }"
            class="builder-catalogue-card"
          >
            <article>
              <a
                :href="catalogue.pdfUrl"
                target="_blank"
                rel="noopener noreferrer"
                class="builder-catalogue-card__link"
                aria-label="開啟 2026 建商專區型錄 PDF"
              >
                <span class="builder-catalogue-card__transition">
                  <span class="builder-catalogue-card__image builder-catalogue-card__image--developer">
                    <InternalCatalogueImage :src="catalogue.cover" :alt="`${catalogue.description}封面`" />
                  </span>
                  <span class="builder-catalogue-card__shade" aria-hidden="true" />
                  <span class="builder-catalogue-card__action" aria-hidden="true">
                    <span>{{ catalogue.actionLabel }}</span>
                    <span class="builder-catalogue-card__arrow"><ArrowUpRight /></span>
                  </span>
                </span>
                <span class="builder-catalogue-card__text">
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
.builder-catalogue-page { color: #59585d; background: #f6f6f6; }

.builder-catalogue-hero {
  position: relative;
  isolation: isolate;
  min-height: 360px;
  overflow: hidden;
  color: #fff;
  background: url('/section-3/store-songzhu.jpg') center 36% / cover no-repeat fixed;
}

.builder-catalogue-hero__overlay {
  position: absolute;
  z-index: -1;
  inset: 0;
  background: #100801;
  opacity: .64;
}

.builder-catalogue-hero__inner {
  width: min(1410px, calc(100% - 60px));
  margin-inline: auto;
  padding: 138px 0 97px;
  text-align: center;
}

.builder-catalogue-hero h1 {
  margin: 0 0 35px;
  color: #fff;
  font-family: var(--font-display);
  font-size: 60px;
  font-weight: 500;
  line-height: 72px;
}

.builder-catalogue-hero__trail {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 22px;
}

.builder-catalogue-hero__trail a { color: inherit; transition: color .3s ease; }
.builder-catalogue-hero__trail a:hover,
.builder-catalogue-hero__trail a:focus-visible { color: #caa05c; }

.builder-catalogue-projects {
  overflow: hidden;
  padding: 100px 30px 130px;
  background: #f6f6f6;
}

.builder-catalogue-projects__rail {
  width: min(1410px, 100%);
  margin-inline: auto;
}

.builder-catalogue-projects__rail.internal-rail-safe { padding-inline: 43px; }

.builder-catalogue-grid {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 50px 30px;
  margin: 0;
  padding: 0;
  list-style: none;
}

.builder-catalogue-card,
.builder-catalogue-card article { min-width: 0; }

.builder-catalogue-card__link {
  display: block;
  width: 100%;
  min-width: 0;
  padding: 0;
  border: 0;
  color: inherit;
  background: transparent;
  font: inherit;
  text-align: left;
  text-decoration: none;
  cursor: pointer;
}

.builder-catalogue-card__transition {
  position: relative;
  display: block;
  overflow: hidden;
  border-radius: 24px;
  background: #e3e3e8;
}

.builder-catalogue-card__image {
  display: block;
  width: 100%;
  aspect-ratio: .8333333333;
  overflow: hidden;
}

.builder-catalogue-card__image :deep(img) { transition: transform .55s ease; }
.builder-catalogue-card__image--developer :deep(img) { object-position: center 48%; }

.builder-catalogue-card__shade {
  position: absolute;
  z-index: 1;
  inset: 0;
  background: rgb(0 0 0 / 13%);
  transition: background-color .5s ease;
}

.builder-catalogue-card__action {
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
  line-height: 20px;
  opacity: 0;
  visibility: hidden;
  transform: translateY(16px);
  transition: opacity .5s ease, visibility .5s ease, transform .5s ease;
}

.builder-catalogue-card__arrow {
  display: flex;
  width: 64px;
  height: 64px;
  align-items: center;
  justify-content: center;
  border: 1px solid rgb(255 255 255 / 16%);
  border-radius: 50%;
  background: rgb(0 0 0 / 58%);
  backdrop-filter: blur(28px);
}

.builder-catalogue-card__arrow svg { width: 24px; height: 24px; }

.builder-catalogue-card__text {
  position: relative;
  display: block;
  padding-top: 23px;
}

.builder-catalogue-card__text strong {
  display: block;
  min-height: 34px;
  margin-bottom: 14px;
  color: #1c1c1d;
  font-family: var(--font-cjk-serif);
  font-size: 25px;
  font-weight: var(--font-cjk-serif-semibold, 600);
  line-height: 34px;
  transition: color .3s ease;
}

.builder-catalogue-card:first-child .builder-catalogue-card__text strong { word-spacing: .12em; }

.builder-catalogue-card__text > span { display: block; color: #59585d; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 24px; }

.builder-catalogue-card__link:hover .builder-catalogue-card__shade,
.builder-catalogue-card__link:focus-visible .builder-catalogue-card__shade { background: rgb(0 0 0 / 34%); }
.builder-catalogue-card__link:hover .builder-catalogue-card__image :deep(img),
.builder-catalogue-card__link:focus-visible .builder-catalogue-card__image :deep(img) { transform: scale(1.05); }
.builder-catalogue-card__link:hover .builder-catalogue-card__action,
.builder-catalogue-card__link:focus-visible .builder-catalogue-card__action { opacity: 1; visibility: visible; transform: translateY(0); }
.builder-catalogue-card__link:hover .builder-catalogue-card__text strong,
.builder-catalogue-card__link:focus-visible .builder-catalogue-card__text strong { color: #caa05c; }
.builder-catalogue-card__link:focus-visible { outline: 2px solid #caa05c; outline-offset: 6px; border-radius: 24px; }

@media (max-width: 1023px) {
  .builder-catalogue-projects { padding-block: 80px; }
  .builder-catalogue-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
}

@media (max-width: 767px) {
  .builder-catalogue-hero { min-height: 288px; background-attachment: scroll; }
  .builder-catalogue-hero__inner { width: calc(100% - 30px); padding: 80px 0 60px; }
  .builder-catalogue-hero h1 { margin-bottom: 25px; font-size: 48px; line-height: 52px; }
  .builder-catalogue-hero__trail { flex-wrap: wrap; }
  .builder-catalogue-projects { padding: 60px 15px; }
  .builder-catalogue-projects__rail.internal-rail-safe { padding-inline: 0; }
  .builder-catalogue-grid { grid-template-columns: 1fr; gap: 42px; }
  .builder-catalogue-card__action { right: 78px; bottom: 18px; gap: 9px; opacity: 1; visibility: visible; transform: none; }
  .builder-catalogue-card__arrow { width: 54px; height: 54px; }
  .builder-catalogue-card__text { padding-right: 72px; }
  .builder-catalogue-card__text strong { min-height: 0; font-size: 25px; line-height: 32px; }
}

@media (prefers-reduced-motion: reduce) {
  .builder-catalogue-hero__trail a,
  .builder-catalogue-card__image :deep(img),
  .builder-catalogue-card__shade,
  .builder-catalogue-card__action,
  .builder-catalogue-card__text strong { transition: none; }
  .builder-catalogue-card__link:hover .builder-catalogue-card__image :deep(img),
  .builder-catalogue-card__link:focus-visible .builder-catalogue-card__image :deep(img) { transform: none; }
}
</style>
