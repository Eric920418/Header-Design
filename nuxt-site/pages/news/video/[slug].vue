<script setup lang="ts">
import { Camera, Images, PlaySquare } from 'lucide-vue-next'
import { mediaVideoDetails } from '~/data/mediaVideos'
import { newsArticles } from '~/data/news'

const route = useRoute()
const slug = String(route.params.slug)
const detail = mediaVideoDetails.find(entry => entry.slug === slug)
const article = detail ? newsArticles.find(entry => entry.id === detail.id) : undefined

if (!detail || !article) {
  throw createError({ statusCode: 404, message: `媒體影音「${slug}」不存在或尚未公開。` })
}

const videoArticles = newsArticles.filter(entry => entry.category === 'video')

useSeoMeta({
  title: `${article.title}｜SAKURA 整體廚房`,
  description: article.excerpt,
  ogTitle: article.title,
  ogDescription: article.excerpt,
  ogImage: article.cover,
  ogType: 'video.other',
  articlePublishedTime: article.publishedAt,
})

useHead({
  link: [{ rel: 'canonical', href: article.legacyPath }],
})
</script>

<template>
  <main class="media-detail-page">
    <section class="media-detail-breadcrumb hero-includes-header" aria-label="媒體影音麵包屑">
      <div class="media-detail-breadcrumb__overlay" aria-hidden="true" />
      <div class="media-detail-breadcrumb__inner" v-reveal="{ anim: 'opalMoveUp' }">
        <p class="media-detail-breadcrumb__title">Media</p>
        <nav aria-label="麵包屑" class="media-detail-breadcrumb__trail">
          <NuxtLink to="/">首頁</NuxtLink>
          <span aria-hidden="true">/</span>
          <NuxtLink to="/news">優惠消息</NuxtLink>
          <span aria-hidden="true">/</span>
          <NuxtLink to="/news/video" aria-current="page">媒體影音</NuxtLink>
        </nav>
      </div>
    </section>

    <article class="media-detail-article" :aria-labelledby="`media-title-${article.id}`">
      <div class="media-detail-single-content">
        <header class="media-detail-header entry-header" v-reveal="{ anim: 'opalMoveUp' }">
          <div class="media-detail-meta entry-meta-top">
            <span class="categories-link">
              <NuxtLink to="/news">優惠消息</NuxtLink>
              <NuxtLink to="/news/video">媒體影音</NuxtLink>
            </span>
            <span class="posted-on">
              <time :datetime="article.publishedAt">{{ article.displayDate }}</time>
            </span>
          </div>
          <h1 :id="`media-title-${article.id}`" class="entry-title">{{ article.title }}</h1>
        </header>

        <div class="media-detail-video" v-reveal="{ anim: 'opalScaleUp', delay: 100 }">
          <InternalMediaVideoPlayer
            :video-id="detail.videoId"
            :cover="article.cover"
            :title="article.title"
          />
        </div>

        <div class="media-detail-body entry-content">
          <section class="media-detail-copy" v-reveal="{ anim: 'opalMoveUp' }">
            <p v-for="paragraph in detail.paragraphs" :key="paragraph">{{ paragraph }}</p>
            <a :href="detail.caseLink.url" target="_blank" rel="noopener noreferrer">
              {{ detail.caseLink.label }}
            </a>
          </section>

          <nav class="media-detail-categories" aria-label="優惠消息分類" v-reveal="{ anim: 'opalMoveUp' }">
            <NuxtLink to="/news/activities"><Camera aria-hidden="true" />優惠活動</NuxtLink>
            <NuxtLink to="/news/latest"><Images aria-hidden="true" />最新消息</NuxtLink>
            <NuxtLink to="/news/video" aria-current="page"><PlaySquare aria-hidden="true" />媒體影音</NuxtLink>
          </nav>
        </div>
      </div>
    </article>

    <InternalMediaRelatedCarousel :articles="videoArticles" :current-id="article.id" />
  </main>
</template>

<style scoped>
.media-detail-page { color: #59585d; background: #f6f6f6; }

.media-detail-breadcrumb {
  position: relative;
  isolation: isolate;
  min-height: 360px;
  overflow: hidden;
  color: #fff;
  background: url('/section-3/store-songzhu.jpg') center 48% / cover no-repeat fixed;
}

.media-detail-breadcrumb__overlay {
  position: absolute;
  z-index: -1;
  inset: 0;
  background: #100801;
  opacity: .64;
}

.media-detail-breadcrumb__inner {
  width: min(1410px, calc(100% - 60px));
  margin-inline: auto;
  padding: 138px 0 97px;
  text-align: center;
}

.media-detail-breadcrumb__title {
  margin: 0 0 35px;
  color: #fff;
  font-family: var(--font-display);
  font-size: 60px;
  font-weight: 400;
  line-height: 64px;
}

.media-detail-breadcrumb__trail {
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

.media-detail-breadcrumb__trail a { color: #fff; transition: color .3s ease; }
.media-detail-breadcrumb__trail a:hover { color: #caa05c; }

.media-detail-article { padding: 100px 30px 0; }

.media-detail-header,
.media-detail-video {
  width: min(930px, 100%);
  margin-inline: auto;
}

.media-detail-header { margin-bottom: 40px; }

.media-detail-meta {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 15px;
  margin-bottom: 13px;
}

.media-detail-meta .categories-link { display: flex; flex-wrap: wrap; align-items: center; }

.media-detail-meta .categories-link a {
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

.media-detail-meta .categories-link a:hover { color: #fff; background: #1c1c1d; }

.media-detail-meta .posted-on {
  position: relative;
  margin: 0 6px 5px 0;
  padding-right: 10px;
}

.media-detail-meta .posted-on::after {
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

.media-detail-meta time {
  color: #9f9fa4;
  font-family: var(--font-cjk-sans);
  font-size: 14px;
  line-height: 24px;
  text-transform: uppercase;
}

.media-detail-header h1 {
  max-width: 1050px;
  margin: 0;
  color: #1c1c1d;
  font-family: var(--font-cjk-serif);
  font-size: 30px;
  font-weight: 400;
  line-height: 41px;
}

.media-detail-video { margin-bottom: 30px; }

.media-detail-body { width: min(930px, 100%); margin: 0 auto; }

.media-detail-copy { padding-top: 3px; }

.media-detail-copy p {
  margin: 0 0 30px;
  color: #59585d;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 26px;
}

.media-detail-copy a {
  color: #1c1c1d;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 26px;
  text-decoration: underline;
  text-decoration-color: #caa05c;
  text-underline-offset: 4px;
  transition: color .3s ease;
}

.media-detail-copy a:hover,
.media-detail-copy a:focus-visible { color: #caa05c; }

.media-detail-categories {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 10px;
  margin-top: 60px;
  padding-bottom: 60px;
}

.media-detail-categories a,
.media-detail-categories span {
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

.media-detail-categories :deep(svg) { width: 15px; height: 15px; }

.media-detail-categories a[aria-current="page"] {
  border-color: #caa05c;
  color: #fff;
  background: #caa05c;
}

.media-detail-categories a:not([aria-current="page"]) { transition: color .3s ease, border-color .3s ease; }
.media-detail-categories a:not([aria-current="page"]):hover { border-color: #caa05c; color: #caa05c; }
.media-detail-categories span[aria-disabled="true"] { cursor: not-allowed; opacity: .55; }

@media (max-width: 1024px) {
  .media-detail-breadcrumb {
    min-height: 285px;
    background-attachment: scroll;
  }

  .media-detail-breadcrumb__inner { padding-block: 80px; }

  .media-detail-article { padding-top: 80px; }
}

@media (max-width: 767px) {
  .media-detail-breadcrumb { min-height: 204px; }
  .media-detail-breadcrumb__inner { width: calc(100% - 30px); padding: 80px 0 60px; }
  .media-detail-breadcrumb__title { margin-bottom: 15px; font-size: 30px; line-height: 35px; }
  .media-detail-article { padding: 60px 15px 0; }
  .media-detail-header { margin-bottom: 30px; }
  .media-detail-header h1 { font-size: 30px; line-height: 41px; }
  .media-detail-meta .categories-link a { min-height: 28px; padding: 7px 12px; font-size: 13px; }
  .media-detail-categories { margin-top: 50px; padding-bottom: 45px; }
}

@media (prefers-reduced-motion: reduce) {
  .media-detail-breadcrumb { background-attachment: scroll; }
  .media-detail-breadcrumb__trail a,
  .media-detail-meta .categories-link a,
  .media-detail-copy a,
  .media-detail-categories a { transition: none; }
}
</style>
