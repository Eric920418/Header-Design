<script setup lang="ts">
import { Camera, Images, PlaySquare } from 'lucide-vue-next'
import { latestArticleDetails } from '~/data/latestArticles'
import { newsArticles } from '~/data/news'

const route = useRoute()
const slug = String(route.params.slug)
const detail = latestArticleDetails.find(entry => entry.slug === slug)
const article = detail ? newsArticles.find(entry => entry.id === detail.id) : undefined

if (!detail || !article) {
  throw createError({ statusCode: 404, message: `最新消息「${slug}」不存在或尚未公開。` })
}

const latestArticles = newsArticles.filter(entry => entry.category === 'latest')
const isFranchiseSeminar = detail.id === 'franchise-seminar-2026'
const isKaohsiungBrandHall = detail.id === 'kaohsiung-brand-hall'

useSeoMeta({
  title: `${article.title}｜SAKURA 整體廚房`,
  description: article.excerpt,
  ogTitle: article.title,
  ogDescription: article.excerpt,
  ogImage: detail.cover.src,
  ogType: 'article',
  articlePublishedTime: article.publishedAt,
})

useHead({
  link: [{ rel: 'canonical', href: article.legacyPath }],
})
</script>

<template>
  <main
    class="latest-detail-page"
    :class="{
      'latest-detail-page--franchise-seminar': isFranchiseSeminar,
      'latest-detail-page--kaohsiung-brand-hall': isKaohsiungBrandHall,
    }"
  >
    <section class="latest-detail-breadcrumb hero-includes-header" aria-label="最新消息麵包屑">
      <div class="latest-detail-breadcrumb__overlay" aria-hidden="true" />
      <div class="latest-detail-breadcrumb__inner" v-reveal="{ anim: 'opalMoveUp' }">
        <p class="latest-detail-breadcrumb__title">NEWS</p>
        <nav aria-label="麵包屑" class="latest-detail-breadcrumb__trail">
          <NuxtLink to="/">首頁</NuxtLink>
          <span aria-hidden="true">/</span>
          <NuxtLink to="/news">優惠消息</NuxtLink>
          <span aria-hidden="true">/</span>
          <NuxtLink to="/news/latest" aria-current="page">最新消息</NuxtLink>
        </nav>
      </div>
    </section>

    <article class="latest-detail-article has-post-thumbnail" :aria-labelledby="`latest-title-${article.id}`">
      <div class="latest-detail-single-content">
        <header class="latest-detail-header entry-header" v-reveal="{ anim: 'opalMoveUp' }">
          <div class="latest-detail-meta entry-meta-top">
            <span class="categories-link">
              <NuxtLink to="/news">優惠消息</NuxtLink>
              <NuxtLink to="/news/latest">最新消息</NuxtLink>
            </span>
            <span class="posted-on">
              <time :datetime="article.publishedAt">{{ article.displayDate }}</time>
            </span>
          </div>
          <h1 :id="`latest-title-${article.id}`" class="entry-title">{{ article.title }}</h1>
        </header>

        <div class="latest-detail-cover post-thumbnail" v-reveal="{ anim: 'opalScaleUp', delay: 100 }">
          <InternalNewsImage :src="detail.cover.src" :alt="detail.cover.alt" eager />
        </div>

        <div class="latest-detail-body entry-content">
          <template
            v-for="(section, sectionIndex) in detail.sections"
            :key="section.heading ?? `section-${sectionIndex}`"
          >
            <section
              class="latest-detail-section"
              :class="{
                'latest-detail-section--franchise-register': isFranchiseSeminar && sectionIndex === 3,
                'latest-detail-section--franchise-session': isFranchiseSeminar && sectionIndex < 3,
                'latest-detail-section--two-column': isKaohsiungBrandHall && sectionIndex === 1,
              }"
              v-reveal="{ anim: 'opalMoveUp' }"
            >
              <h4 v-if="section.heading">{{ section.heading }}</h4>
              <p v-for="paragraph in section.paragraphs" :key="paragraph">{{ paragraph }}</p>
              <ul v-if="section.bullets?.length">
                <li v-for="bullet in section.bullets" :key="bullet">{{ bullet }}</li>
              </ul>

              <div
                v-if="section.links?.length"
                class="latest-detail-links"
              >
                <a
                  v-for="link in section.links"
                  :key="link.url"
                  :href="link.url"
                  target="_blank"
                  rel="noopener noreferrer"
                >
                  {{ link.label }}
                </a>
              </div>

              <div
                v-if="section.images?.length"
                class="latest-detail-media-reveal"
                v-reveal="{ anim: 'opalScaleUp', delay: 100 }"
              >
                <div
                  class="latest-detail-media"
                  :class="{ 'latest-detail-media--pair': section.images.length === 2 }"
                >
                  <figure v-for="image in section.images" :key="image.src">
                    <InternalNewsImage :src="image.src" :alt="image.alt" />
                  </figure>
                </div>
              </div>
              <p
                v-if="isFranchiseSeminar && sectionIndex === 3"
                class="latest-detail-franchise-qr-label"
              >
                報名QR code
              </p>
            </section>
          </template>

          <nav class="latest-detail-categories" aria-label="優惠消息分類" v-reveal="{ anim: 'opalMoveUp' }">
            <NuxtLink to="/news/activities"><Camera aria-hidden="true" />優惠活動</NuxtLink>
            <NuxtLink to="/news/latest" aria-current="page"><Images aria-hidden="true" />最新消息</NuxtLink>
            <NuxtLink to="/news/video"><PlaySquare aria-hidden="true" />媒體影音</NuxtLink>
          </nav>
        </div>
      </div>
    </article>

    <InternalLatestRelatedCarousel :articles="latestArticles" :current-id="article.id" />
  </main>
</template>

<style scoped>
.latest-detail-page { color: #59585d; background: #fafafa; }

.latest-detail-breadcrumb {
  position: relative;
  isolation: isolate;
  min-height: 360px;
  overflow: hidden;
  color: #fff;
  background: url('/section-5/brand-pavilion/pavilion-taichung.jpg') center 88% / cover no-repeat;
}

.latest-detail-breadcrumb__overlay {
  position: absolute;
  z-index: -1;
  inset: 0;
  background: #100801;
  opacity: .64;
}

.latest-detail-breadcrumb__inner {
  width: min(1410px, calc(100% - 60px));
  margin-inline: auto;
  padding: 138px 0 97px;
  text-align: center;
}

.latest-detail-breadcrumb__title {
  margin: 0 0 35px;
  color: #fff;
  font-family: var(--font-display);
  font-size: 60px;
  font-weight: 400;
  line-height: 64px;
}

.latest-detail-breadcrumb__trail {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: center;
  gap: 10px;
  width: min(1410px, 100%);
  margin-inline: auto;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 20px;
  letter-spacing: .04em;
  text-transform: uppercase;
}

.latest-detail-breadcrumb__trail a { color: #fff; transition: color .3s ease; }
.latest-detail-breadcrumb__trail a:hover { color: #caa05c; }

.latest-detail-article { padding: 100px 30px 0; }

.latest-detail-header,
.latest-detail-cover {
  width: min(930px, 100%);
  margin-inline: auto;
}

.latest-detail-header { margin-bottom: 40px; }

.latest-detail-meta {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 15px;
  margin-bottom: 13px;
}

.latest-detail-meta .categories-link { display: flex; flex-wrap: wrap; align-items: center; }

.latest-detail-meta .categories-link a {
  display: inline-flex;
  min-height: 30px;
  align-items: center;
  margin: 0 9px 5px 0;
  padding: 8px 15px;
  border-radius: 100px;
  color: #fff;
  background: #caa05c;
  font-family: var(--font-cjk-sans);
  font-size: 14px;
  line-height: 14px;
  transition: color .3s ease, background-color .3s ease;
}

.latest-detail-meta .categories-link a:hover { color: #fff; background: #1c1c1d; }

.latest-detail-meta .posted-on {
  position: relative;
  margin: 0 6px 5px 0;
  padding-right: 10px;
}

.latest-detail-meta .posted-on::after {
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

.latest-detail-meta time {
  color: #9f9fa4;
  font-family: var(--font-cjk-sans);
  font-size: 14px;
  line-height: 24px;
  text-transform: uppercase;
}

.latest-detail-header h1 {
  max-width: 1050px;
  margin: 0;
  color: #1c1c1d;
  font-family: var(--font-cjk-serif);
  font-size: 30px;
  font-weight: 400;
  line-height: 41px;
}

.latest-detail-cover {
  margin-bottom: 30px;
  overflow: hidden;
  border-radius: 24px;
  background: #e3e3e8;
}

.latest-detail-cover :deep(.antra-news-image),
.latest-detail-cover :deep(.antra-news-image img) {
  width: 100%;
  height: auto;
}

.latest-detail-cover :deep(.antra-news-image img) { display: block; object-fit: contain; }

.latest-detail-body { width: min(930px, 100%); margin: 0 auto; }

.latest-detail-section { margin: 0; }

.latest-detail-section h4 {
  margin: 60px 0 32px;
  color: #1c1c1d;
  font-family: var(--font-cjk-serif);
  font-size: 25px;
  font-weight: 400;
  line-height: 32px;
}

.latest-detail-section p {
  margin: 0 0 30px;
  color: #59585d;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 26px;
}

.latest-detail-section ul {
  margin: 0 0 30px;
  padding-left: 22px;
  list-style: disc;
}

.latest-detail-section li {
  margin-bottom: 8px;
  padding-left: 3px;
  color: #59585d;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 26px;
}

.latest-detail-section li:last-child { margin-bottom: 0; }

.latest-detail-links {
  display: flex;
  flex-wrap: wrap;
  gap: 8px 18px;
  margin-top: 12px;
}

.latest-detail-links a {
  color: #1c1c1d;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 26px;
  text-decoration: underline;
  text-decoration-color: #caa05c;
  text-underline-offset: 4px;
  transition: color .3s ease;
}

.latest-detail-links a:hover,
.latest-detail-links a:focus-visible { color: #caa05c; }

.latest-detail-media-reveal { width: 100%; }

.latest-detail-media {
  display: grid;
  width: 100%;
  gap: 30px;
  margin: 35px 0 30px;
}

.latest-detail-media--pair { grid-template-columns: repeat(2, minmax(0, 1fr)); }

.latest-detail-media figure {
  display: flex;
  overflow: hidden;
  border-radius: 24px;
  background: #e3e3e8;
}

.latest-detail-media :deep(.antra-news-image),
.latest-detail-media :deep(.antra-news-image img) {
  width: 100%;
  height: auto;
}

.latest-detail-media :deep(.antra-news-image img) { object-fit: contain; }

.latest-detail-section--franchise-register .latest-detail-media,
.latest-detail-section--franchise-session .latest-detail-media {
  width: min(500px, 100%);
  margin-inline: auto;
}

.latest-detail-section--franchise-register .latest-detail-media {
  width: min(128px, 100%);
  margin-block: 0 6px;
}

.latest-detail-section--franchise-register .latest-detail-media figure,
.latest-detail-section--franchise-session .latest-detail-media figure {
  border-radius: 0;
}

.latest-detail-section .latest-detail-franchise-qr-label {
  margin: 0 0 30px;
  color: #9f9fa4;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 26px;
  text-align: center;
}

.latest-detail-section--franchise-session h4 {
  margin: 40px 0 14px;
  font-size: 20px;
  font-weight: 600;
  line-height: 30px;
  text-align: center;
}

.latest-detail-section--franchise-session .latest-detail-media { margin-block: 0 30px; }

.latest-detail-section--two-column {
  display: grid;
  grid-template-columns: minmax(0, .9fr) minmax(0, 1.1fr);
  grid-template-areas: "media copy";
  align-items: center;
  gap: 40px;
  margin: 35px 0 40px;
}

.latest-detail-section--two-column > p {
  grid-area: copy;
  margin: 0;
}

.latest-detail-section--two-column > .latest-detail-media-reveal { grid-area: media; }
.latest-detail-section--two-column .latest-detail-media { margin: 0; }

.latest-detail-categories {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 10px;
  margin-top: 60px;
  padding-bottom: 60px;
}

.latest-detail-categories a,
.latest-detail-categories span {
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
}

.latest-detail-categories :deep(svg) { width: 15px; height: 15px; }

.latest-detail-categories a[aria-current="page"] {
  border-color: #caa05c;
  color: #fff;
  background: #caa05c;
}

.latest-detail-categories a:not([aria-current="page"]) { transition: color .3s ease, border-color .3s ease; }
.latest-detail-categories a:not([aria-current="page"]):hover { border-color: #caa05c; color: #caa05c; }
.latest-detail-categories span[aria-disabled="true"] { cursor: not-allowed; opacity: .55; }

@media (max-width: 1024px) {
  .latest-detail-breadcrumb {
    min-height: 285px;
    background-attachment: scroll;
  }

  .latest-detail-breadcrumb__inner { padding-block: 80px; }

  .latest-detail-article { padding-top: 80px; }
}

@media (max-width: 767px) {
  .latest-detail-breadcrumb { min-height: 204px; }
  .latest-detail-breadcrumb__inner { width: calc(100% - 30px); padding: 80px 0 60px; }
  .latest-detail-breadcrumb__title { margin-bottom: 15px; font-size: 30px; line-height: 35px; }
  .latest-detail-article { padding: 60px 15px 0; }
  .latest-detail-header { margin-bottom: 30px; }

  .latest-detail-header h1 { font-size: 30px; line-height: 41px; }
  .latest-detail-meta .categories-link a { min-height: 28px; padding: 7px 12px; font-size: 13px; }
  .latest-detail-cover { border-radius: 18px; }

  .latest-detail-section h4 {
    margin: 45px 0 24px;
    font-size: 25px;
    line-height: 32px;
  }

  .latest-detail-media {
    grid-template-columns: minmax(0, 1fr);
    gap: 15px;
    margin-top: 28px;
  }

  .latest-detail-media figure { border-radius: 18px; }

  .latest-detail-section--franchise-register .latest-detail-media figure,
  .latest-detail-section--franchise-session .latest-detail-media figure { border-radius: 0; }

  .latest-detail-section--franchise-session h4 {
    margin: 40px 0 14px;
    font-size: 20px;
    line-height: 30px;
  }

  .latest-detail-section--two-column {
    grid-template-columns: minmax(0, 1fr);
    grid-template-areas:
      "media"
      "copy";
    gap: 22px;
    margin: 28px 0 35px;
  }

  .latest-detail-categories { margin-top: 50px; padding-bottom: 45px; }
}

@media (prefers-reduced-motion: reduce) {
  .latest-detail-breadcrumb { background-attachment: scroll; }
  .latest-detail-breadcrumb__trail a,
  .latest-detail-meta .categories-link a,
  .latest-detail-links a,
  .latest-detail-categories a { transition: none; }
}
</style>
