<script setup lang="ts">
import {
  systemCabinetCaseStudies,
  systemCabinetImportance,
  systemCabinetMaterials,
  systemCabinetSelectionSteps,
} from '~/data/kitchenSystemCabinet'
import { KITCHEN_GUIDE_ARTICLES } from '~/data/kitchenGuides'

const article = KITCHEN_GUIDE_ARTICLES.find(entry => entry.id === 'systemcabinet')!
const relatedGuideArticles = KITCHEN_GUIDE_ARTICLES
  .filter(entry => entry.id !== article.id)
  .map(entry => ({ ...entry, categoryLabel: '廚房裝修指南' }))

const designStyleLinks = [
  { label: '北歐風', to: '/design-inspiration?style=北歐風' },
  { label: '現代風', to: '/design-inspiration?style=現代風' },
  { label: '工業風', to: '/design-inspiration?style=工業風' },
]

const kitchenSeriesLinks = ['鄉村', '童樂', '閤樂', '臻美', '潮派', '君璽', '大廚']

useSeoMeta({
  title: `${article.title}｜SAKURA 整體廚房`,
  description: article.excerpt,
  ogTitle: article.title,
  ogDescription: article.excerpt,
  ogImage: article.cover,
  ogType: 'article',
  articlePublishedTime: article.publishedAt,
})

useHead({
  link: [{ rel: 'canonical', href: article.legacyUrl }],
})
</script>

<template>
  <main class="knowledge-article-page">
    <section class="knowledge-article-breadcrumb hero-includes-header" aria-label="廚房裝修指南麵包屑">
      <span class="knowledge-article-breadcrumb__overlay" aria-hidden="true" />
      <nav class="knowledge-article-breadcrumb__trail" aria-label="麵包屑" v-reveal="{ anim: 'opalMoveUp' }">
        <NuxtLink to="/">首頁</NuxtLink>
        <span aria-hidden="true">/</span>
        <NuxtLink to="/knowledge" aria-current="page">廚房裝修指南</NuxtLink>
      </nav>
    </section>

    <article class="knowledge-article" aria-labelledby="system-cabinet-title">
      <header class="knowledge-article__header" v-reveal="{ anim: 'opalMoveUp' }">
        <div class="knowledge-article__meta">
          <NuxtLink to="/knowledge">廚房裝修指南</NuxtLink>
          <time :datetime="article.publishedAt">{{ article.displayDate }}</time>
        </div>
        <h1 id="system-cabinet-title">{{ article.title }}</h1>
      </header>

      <figure class="knowledge-article__cover" v-reveal="{ anim: 'opalScaleUp', delay: 100 }">
        <InternalGuideImage :src="article.cover" :alt="`${article.title}文章主圖`" eager />
      </figure>

      <div class="knowledge-article__content">
        <section class="knowledge-copy-block" v-reveal="{ anim: 'opalMoveUp' }">
          <h2>廚房系統櫃材質重要嗎？4大重點告訴你！</h2>
          <p>{{ article.excerpt }}</p>

          <div v-for="point in systemCabinetImportance" :key="point.title" class="knowledge-copy-block__point">
            <h3>{{ point.title }}</h3>
            <p v-for="paragraph in point.paragraphs" :key="paragraph">{{ paragraph }}</p>
          </div>
        </section>

        <section class="knowledge-copy-block" v-reveal="{ anim: 'opalMoveUp' }">
          <h2>廚房系統櫃材質有哪些？常見5大板材比較</h2>
          <div class="knowledge-material-table" tabindex="0" role="region" aria-label="常見五大廚房系統櫃板材比較表">
            <table>
              <caption>塑合板、木芯板、密集板、美耐板與實木的基材、優缺點及用途比較</caption>
              <thead>
                <tr>
                  <th scope="col">材質</th>
                  <th v-for="column in systemCabinetMaterials.columns" :key="column" scope="col">{{ column }}</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="row in systemCabinetMaterials.rows" :key="row.label">
                  <th scope="row">{{ row.label }}</th>
                  <td v-for="(value, valueIndex) in row.values" :key="`${row.label}-${valueIndex}`">{{ value }}</td>
                </tr>
              </tbody>
            </table>
          </div>
          <p class="knowledge-material-table__hint">手機與窄螢幕可左右滑動查看完整比較內容。</p>
        </section>

        <section class="knowledge-copy-block" v-reveal="{ anim: 'opalMoveUp' }">
          <h2>廚房系統櫃材質如何挑選？7步驟教你輕鬆選！</h2>
          <p>為了幫助你有條不紊地為自家廚房，選出最適合的系統櫃材質，以下用7大挑選步驟說明，讓你學會如何從預算到美學，從耐用度到環保安心選擇，一次搞定！</p>

          <div v-for="step in systemCabinetSelectionSteps" :key="step.title" class="knowledge-copy-block__point">
            <h3>{{ step.title }}</h3>
            <ul>
              <template v-if="step.title.startsWith('STEP6')">
                <li>
                  色彩與紋理：根據家中風格（<template v-for="(style, styleIndex) in designStyleLinks" :key="style.label"><NuxtLink :to="style.to"><strong>{{ style.label }}</strong></NuxtLink><span v-if="styleIndex < designStyleLinks.length - 1">、</span></template>等），挑選合適的木紋、石紋、亮面或霧面烤漆材質，營造統一氛圍。
                </li>
                <li>門板造型：平面簡約、線條雕刻或格柵式鄉村風，各自展現不同氛圍，可依個人喜好與整體搭配做決定。</li>
                <li>
                  門板顏色推薦：<template v-for="(series, seriesIndex) in kitchenSeriesLinks" :key="series"><NuxtLink to="/#kitchen-series"><strong>{{ series }}</strong></NuxtLink><span v-if="seriesIndex < kitchenSeriesLinks.length - 1">、</span></template>。
                </li>
              </template>
              <template v-else>
                <li v-for="bullet in step.bullets" :key="bullet">{{ bullet }}</li>
              </template>
            </ul>
          </div>
        </section>

        <section class="knowledge-copy-block knowledge-case-section" aria-labelledby="system-cabinet-cases" v-reveal="{ anim: 'opalMoveUp' }">
          <h2 id="system-cabinet-cases">廚房系統櫃材質案例推薦</h2>

          <article v-for="(caseStudy, caseIndex) in systemCabinetCaseStudies" :key="caseStudy.title" class="knowledge-case">
            <h3>
              <a :href="caseStudy.url" target="_blank" rel="noopener noreferrer">{{ caseStudy.title }}</a>
            </h3>
            <div class="knowledge-case__grid">
              <figure v-reveal="{ anim: 'opalScaleUp', delay: 100 }">
                <InternalGuideImage :src="caseStudy.image" :alt="caseStudy.imageAlt" />
              </figure>
              <div class="knowledge-case__copy">
                <p>{{ caseStudy.introduction }}</p>
                <ul>
                  <li v-for="highlight in caseStudy.highlights" :key="highlight">{{ highlight }}</li>
                </ul>
                <p>{{ caseStudy.conclusion }}</p>
              </div>
            </div>
            <span v-if="caseIndex < systemCabinetCaseStudies.length - 1" class="knowledge-case__divider" aria-hidden="true" />
          </article>
        </section>

        <section class="knowledge-copy-block knowledge-article__closing" v-reveal="{ anim: 'opalMoveUp' }">
          <p><strong>SAKURA KITCHEN</strong>在廚房系統櫃材質的選擇上，始終堅持品質與安心兼具。從主打的MFC塑合板到頂級的FENIX奈米門板、自製的極晶門板，皆展現出對細節的高度重視。並搭配台灣櫻花自製封邊工藝與多道驗證測試，其耐用性與安全性更勝一籌。想了解更多廚房材質案例分享？那就快去看看<NuxtLink to="/catalogues/kitchenware-catalog"><strong>廚房系列型錄</strong></NuxtLink>吧！</p>
        </section>

      </div>
    </article>

    <InternalKnowledgeRelatedCarousel :articles="relatedGuideArticles" variant="home07" />
  </main>
</template>

<style scoped>
.knowledge-article-page {
  color: #59585d;
  background: #fafafa;
  font-family: var(--font-cjk-sans);
}

.knowledge-article-breadcrumb {
  position: relative;
  isolation: isolate;
  display: grid;
  min-height: 300px;
  overflow: hidden;
  grid-template-rows: var(--site-header-height) minmax(0, 1fr);
  padding: 0 30px;
  place-items: center;
  color: #fff;
  background: url('/section-3/store-songzhu.jpg') center 36% / cover no-repeat fixed;
}

.knowledge-article-breadcrumb__overlay {
  position: absolute;
  z-index: -1;
  inset: 0;
  background: #100801;
  opacity: .64;
}

.knowledge-article-breadcrumb__trail {
  display: flex;
  grid-row: 2;
  width: min(1410px, 100%);
  align-items: center;
  align-self: center;
  justify-content: center;
  gap: 10px;
  margin-inline: auto;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 22px;
  text-transform: uppercase;
}

.knowledge-article-breadcrumb__trail a {
  color: inherit;
  transition: color .3s ease;
}

.knowledge-article-breadcrumb__trail a:hover,
.knowledge-article-breadcrumb__trail a:focus-visible { color: #caa05c; }

.knowledge-article {
  padding: 100px 30px 0;
}

.knowledge-article__header,
.knowledge-article__cover,
.knowledge-article__content {
  width: min(930px, 100%);
  margin-inline: auto;
}

.knowledge-article__header { margin-bottom: 40px; }

.knowledge-article__meta {
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  gap: 15px;
  margin-bottom: 15px;
}

.knowledge-article__meta a {
  display: inline-flex;
  min-height: 30px;
  align-items: center;
  padding: 8px 15px;
  border-radius: 100px;
  color: #fff;
  background: #caa05c;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 15px;
  transition: background-color .3s ease;
}

.knowledge-article__meta a:hover,
.knowledge-article__meta a:focus-visible { background: #1c1c1d; }

.knowledge-article__meta time {
  position: relative;
  padding-right: 13px;
  color: #9f9fa4;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 24px;
  text-transform: uppercase;
}

.knowledge-article__meta time::after {
  position: absolute;
  top: 50%;
  right: 0;
  width: 3px;
  height: 3px;
  border-radius: 50%;
  background: #caa05c;
  content: "";
  transform: translateY(-50%);
}

.knowledge-article__header h1 {
  margin: 0;
  color: #1c1c1d;
  font-family: var(--font-cjk-serif);
  font-size: 30px;
  font-weight: 500;
  line-height: 41px;
}

.knowledge-article__cover {
  margin-bottom: 62px;
  overflow: hidden;
  border-radius: 24px;
  background: #e3e3e8;
}

.knowledge-article__cover :deep(.guide-image),
.knowledge-article__cover :deep(.guide-image img) {
  display: block;
  width: 100%;
  height: auto;
}

.knowledge-article__cover :deep(.guide-image img) { object-fit: contain; }

.knowledge-copy-block { margin-bottom: 54px; }

.knowledge-copy-block h2 {
  margin: 0 0 30px;
  color: #1c1c1d;
  font-family: var(--font-cjk-serif);
  font-size: 25px;
  font-weight: 500;
  line-height: 36px;
}

.knowledge-copy-block h3 {
  margin: 31px 0 12px;
  color: #1c1c1d;
  font-family: var(--font-cjk-sans);
  font-size: 20px;
  font-weight: 500;
  line-height: 30px;
}

.knowledge-copy-block p {
  margin: 0 0 20px;
  color: #59585d;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 25px;
}

.knowledge-copy-block ul {
  margin: 0;
  padding-left: 22px;
  list-style: disc;
}

.knowledge-copy-block li {
  margin-bottom: 9px;
  padding-left: 3px;
  color: #59585d;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 25px;
}

.knowledge-copy-block li:last-child { margin-bottom: 0; }

.knowledge-copy-block li a {
  color: #caa05c;
  text-decoration: underline;
  text-decoration-thickness: 1px;
  text-underline-offset: 4px;
  transition: color .3s ease;
}

.knowledge-copy-block li a:hover,
.knowledge-copy-block li a:focus-visible { color: #1c1c1d; }

.knowledge-material-table {
  width: 100%;
  overflow-x: auto;
  border: 1px solid #1c1c1d;
  background: #fff;
  overscroll-behavior-inline: contain;
  scrollbar-color: #caa05c #e3e3e8;
}

.knowledge-material-table:focus-visible {
  outline: 2px solid #caa05c;
  outline-offset: 4px;
}

.knowledge-material-table table {
  width: 100%;
  min-width: 900px;
  border-collapse: collapse;
  table-layout: fixed;
}

.knowledge-material-table caption {
  position: absolute;
  width: 1px;
  height: 1px;
  overflow: hidden;
  clip: rect(0 0 0 0);
  white-space: nowrap;
}

.knowledge-material-table th,
.knowledge-material-table td {
  padding: 16px 13px;
  border-right: 1px solid #1c1c1d;
  border-bottom: 1px solid #1c1c1d;
  color: #1c1c1d;
  font-size: 14px;
  line-height: 21px;
  text-align: center;
  vertical-align: middle;
}

.knowledge-material-table tr > :last-child { border-right: 0; }
.knowledge-material-table tbody tr:last-child > * { border-bottom: 0; }

.knowledge-material-table thead th {
  color: #1c1c1d;
  background: #f2dc62;
  font-weight: 700;
}

.knowledge-material-table tbody th {
  background: #fafafa;
  font-weight: 700;
}

.knowledge-material-table__hint {
  display: none;
  margin-top: 10px !important;
  color: #9f9fa4 !important;
  font-size: 13px !important;
}

.knowledge-case { margin-top: 52px; }
.knowledge-case:first-of-type { margin-top: 0; }

.knowledge-case h3 { margin-bottom: 24px; }

.knowledge-case__grid {
  display: grid;
  align-items: start;
  grid-template-columns: minmax(0, 1fr) minmax(0, 1fr);
  gap: 30px;
}

.knowledge-case h3 a {
  color: inherit;
  text-decoration: underline;
  text-decoration-color: #caa05c;
  text-underline-offset: 5px;
  transition: color .3s ease;
}

.knowledge-case h3 a:hover,
.knowledge-case h3 a:focus-visible { color: #caa05c; }

.knowledge-case figure {
  margin: 0;
  overflow: hidden;
  border-radius: 24px;
  background: #e3e3e8;
}

.knowledge-case figure :deep(.guide-image),
.knowledge-case figure :deep(.guide-image img) {
  display: block;
  width: 100%;
  height: auto;
}

.knowledge-case figure :deep(.guide-image img) { object-fit: contain; }

.knowledge-case__copy > p:first-child { margin-top: -5px; }
.knowledge-case__copy > p:last-child { margin-bottom: 0; }
.knowledge-case__copy ul { margin-bottom: 20px; }

.knowledge-case__divider {
  display: block;
  width: 100%;
  height: 1px;
  margin-top: 50px;
  background: #e3e3e8;
}

.knowledge-article__closing strong { color: #1c1c1d; }

.knowledge-article__closing a {
  color: #1c1c1d;
  font-weight: 600;
  text-decoration: underline;
  text-decoration-color: #caa05c;
  text-underline-offset: 4px;
}

@media (max-width: 1024px) {
  .knowledge-article { padding-top: 80px; }
}

@media (max-width: 767px) {
  .knowledge-article-breadcrumb {
    min-height: 250px;
    padding-inline: 15px;
    background-attachment: scroll;
  }

  .knowledge-article {
    padding: 60px 93px 0 15px;
  }

  .knowledge-article__header h1 { font-size: 30px; line-height: 41px; }
  .knowledge-article__cover { margin-bottom: 45px; border-radius: 18px; }
  .knowledge-copy-block { margin-bottom: 45px; }
  .knowledge-copy-block h2 { margin-bottom: 24px; font-size: 24px; line-height: 34px; }
  .knowledge-copy-block h3 { margin-top: 26px; font-size: 19px; line-height: 29px; }
  .knowledge-material-table__hint { display: block; }
  .knowledge-case { margin-top: 42px; }
  .knowledge-case__grid { grid-template-columns: 1fr; gap: 24px; }
  .knowledge-case__copy > p:first-child { margin-top: 0; }
  .knowledge-case figure { border-radius: 18px; }
}

@media (prefers-reduced-motion: reduce) {
  .knowledge-article-breadcrumb__trail a,
  .knowledge-article__meta a,
  .knowledge-copy-block li a,
  .knowledge-case h3 a { transition: none; }
}
</style>
