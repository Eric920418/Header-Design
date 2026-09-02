<script setup lang="ts">
import { Camera, Images, PlaySquare } from 'lucide-vue-next'
import { activityArticleDetails } from '~/data/activityArticles'
import { newsArticles } from '~/data/news'

const route = useRoute()
const slug = String(route.params.slug)
const detail = activityArticleDetails.find(entry => entry.slug === slug)
const article = detail ? newsArticles.find(entry => entry.id === detail.id) : undefined

if (!detail || !article) {
  throw createError({ statusCode: 404, message: `優惠活動「${slug}」不存在或尚未公開。` })
}

const activityArticles = newsArticles.filter(entry => entry.category === 'activities')

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
  link: [{ rel: 'canonical', href: article.legacyPath }],
})
</script>

<template>
  <main class="activity-detail-page">
    <section class="activity-detail-breadcrumb hero-includes-header" aria-label="優惠活動麵包屑">
      <div class="activity-detail-breadcrumb__overlay" aria-hidden="true" />
      <div class="activity-detail-breadcrumb__inner" v-reveal="{ anim: 'opalMoveUp' }">
        <p class="activity-detail-breadcrumb__title">Promotions</p>
        <nav aria-label="麵包屑" class="activity-detail-breadcrumb__trail">
          <NuxtLink to="/">首頁</NuxtLink>
          <span aria-hidden="true">/</span>
          <NuxtLink to="/news">優惠消息</NuxtLink>
          <span aria-hidden="true">/</span>
          <NuxtLink to="/news/activities" aria-current="page">優惠活動</NuxtLink>
        </nav>
      </div>
    </section>

    <article class="activity-detail-article has-post-thumbnail" :aria-labelledby="`activity-title-${article.id}`">
      <div class="activity-detail-single-content">
        <header class="activity-detail-header entry-header" v-reveal="{ anim: 'opalMoveUp' }">
          <div class="activity-detail-meta entry-meta-top">
            <span class="categories-link">
              <NuxtLink to="/news">優惠消息</NuxtLink>
              <NuxtLink to="/news/activities">優惠活動</NuxtLink>
            </span>
            <span class="posted-on">
              <time :datetime="article.publishedAt">{{ article.displayDate }}</time>
            </span>
          </div>
          <h1 :id="`activity-title-${article.id}`" class="entry-title">{{ article.title }}</h1>
        </header>

        <div class="activity-detail-cover post-thumbnail" v-reveal="{ anim: 'opalScaleUp', delay: 100 }">
          <InternalNewsImage :src="article.cover" :alt="`${article.title}文章主圖`" eager />
        </div>

        <div class="activity-detail-body entry-content" v-reveal="{ anim: 'opalMoveUp' }">
          <template
            v-for="(section, sectionIndex) in detail.sections"
            :key="section.heading ?? `section-${sectionIndex}`"
          >
            <h4 v-if="section.heading">{{ section.heading }}</h4>
            <p v-for="paragraph in section.paragraphs" :key="paragraph">{{ paragraph }}</p>
            <ul v-if="section.bullets?.length">
              <li v-for="bullet in section.bullets" :key="bullet">{{ bullet }}</li>
            </ul>

            <div v-if="section.links?.length" class="activity-detail-links">
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
              class="activity-detail-media"
              :class="{ 'activity-detail-media--pair': section.images.length === 2 }"
              v-reveal="{ anim: 'opalScaleUp', delay: 100 }"
            >
              <figure v-for="image in section.images" :key="image.src">
                <InternalNewsImage :src="image.src" :alt="image.alt" />
              </figure>
            </div>
          </template>

          <nav class="activity-detail-categories" aria-label="優惠消息分類" v-reveal="{ anim: 'opalMoveUp' }">
            <NuxtLink to="/news/activities" aria-current="page"><Camera aria-hidden="true" />優惠活動</NuxtLink>
            <NuxtLink to="/news/latest"><Images aria-hidden="true" />最新消息</NuxtLink>
            <NuxtLink to="/news/video"><PlaySquare aria-hidden="true" />媒體影音</NuxtLink>
          </nav>
        </div>
      </div>
    </article>

    <InternalActivityRelatedCarousel :articles="activityArticles" :current-id="article.id" />
  </main>
</template>

<style scoped>
.activity-detail-page {
  color: #59585d;
  background: #fafafa;
}

.activity-detail-breadcrumb {
  position: relative;
  isolation: isolate;
  min-height: 360px;
  overflow: hidden;
  color: #fff;
  background: url('/section-3/store-songzhu.jpg') center 48% / cover no-repeat fixed;
}

.activity-detail-breadcrumb__overlay {
  position: absolute;
  z-index: -1;
  inset: 0;
  background: #100801;
  opacity: .64;
}

.activity-detail-breadcrumb__inner {
  width: min(1410px, calc(100% - 60px));
  margin-inline: auto;
  padding: 138px 0 97px;
  text-align: center;
}

.activity-detail-breadcrumb__title {
  margin: 0 0 35px;
  color: #fff;
  font-family: var(--font-display);
  font-size: 60px;
  font-weight: 400;
  line-height: 64px;
}

.activity-detail-breadcrumb__trail {
  display: flex;
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

.activity-detail-breadcrumb__trail a {
  color: #fff;
  transition: color .3s ease;
}

.activity-detail-breadcrumb__trail a:hover { color: #caa05c; }

.activity-detail-article { padding: 100px 30px 0; }

.activity-detail-header,
.activity-detail-cover {
  width: min(930px, 100%);
  margin-inline: auto;
}

.activity-detail-header { margin-bottom: 40px; }

.activity-detail-meta {
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  gap: 15px;
  margin-bottom: 13px;
}

.activity-detail-meta .categories-link {
  display: flex;
  align-items: center;
  flex-wrap: wrap;
}

.activity-detail-meta .categories-link a {
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

.activity-detail-meta .categories-link a:hover { color: #fff; background: #1c1c1d; }

.activity-detail-meta .posted-on {
  position: relative;
  margin: 0 6px 5px 0;
  padding-right: 10px;
}

.activity-detail-meta .posted-on::after {
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

.activity-detail-meta time {
  color: #9f9fa4;
  font-family: var(--font-cjk-sans);
  font-size: 14px;
  line-height: 24px;
  text-transform: uppercase;
}

.activity-detail-header h1 {
  max-width: 1050px;
  margin: 0;
  color: #1c1c1d;
  font-family: var(--font-cjk-serif);
  font-size: 30px;
  font-weight: 400;
  line-height: 41px;
}

.activity-detail-cover {
  margin-bottom: 30px;
  overflow: hidden;
  border-radius: 24px;
  background: #e3e3e8;
}

.activity-detail-cover :deep(.antra-news-image) {
  width: 100%;
  height: auto;
}

.activity-detail-cover :deep(.antra-news-image img) {
  display: block;
  width: 100%;
  height: auto;
  object-fit: contain;
}

.activity-detail-body {
  width: min(930px, 100%);
  margin: 0 auto;
}

.activity-detail-body h4 {
  margin: 60px 0 32px;
  color: #1c1c1d;
  font-family: var(--font-cjk-serif);
  font-size: 25px;
  font-weight: 400;
  line-height: 32px;
}

.activity-detail-body p {
  margin: 0 0 30px;
  color: #59585d;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 26px;
}

.activity-detail-body ul {
  margin: 0 0 30px;
  padding-left: 22px;
  list-style: disc;
}

.activity-detail-body li {
  margin-bottom: 8px;
  padding-left: 3px;
  color: #59585d;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 26px;
}

.activity-detail-body li:last-child { margin-bottom: 0; }

.activity-detail-links {
  display: flex;
  flex-wrap: wrap;
  gap: 8px 18px;
  margin-top: 12px;
}

.activity-detail-links a {
  color: #1c1c1d;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 26px;
  text-decoration: underline;
  text-decoration-color: #caa05c;
  text-underline-offset: 4px;
  transition: color .3s ease;
}

.activity-detail-links a:hover,
.activity-detail-links a:focus-visible {
  color: #caa05c;
}

.activity-detail-media {
  display: grid;
  gap: 30px;
  margin-top: 35px;
}

.activity-detail-media--pair { grid-template-columns: repeat(2, minmax(0, 1fr)); }

.activity-detail-media figure {
  overflow: hidden;
  border-radius: 24px;
  background: #e3e3e8;
}

.activity-detail-media :deep(.antra-news-image) { width: 100%; height: auto; }
.activity-detail-media :deep(.antra-news-image img) { height: auto; object-fit: contain; }

.activity-detail-categories {
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  gap: 10px;
  margin-top: 60px;
  padding-bottom: 60px;
}

.activity-detail-categories a,
.activity-detail-categories span {
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

.activity-detail-categories :deep(svg) { width: 15px; height: 15px; }

.activity-detail-categories a[aria-current="page"] {
  border-color: #caa05c;
  color: #fff;
  background: #caa05c;
}

.activity-detail-categories a:not([aria-current="page"]) {
  transition: color .3s ease, border-color .3s ease;
}

.activity-detail-categories a:not([aria-current="page"]):hover {
  border-color: #caa05c;
  color: #caa05c;
}

.activity-detail-categories span[aria-disabled="true"] { cursor: not-allowed; opacity: .55; }

@media (max-width: 1024px) {
  .activity-detail-breadcrumb {
    min-height: 285px;
    background-attachment: scroll;
  }

  .activity-detail-breadcrumb__inner { padding-block: 80px; }

  .activity-detail-article { padding-top: 80px; }
}

@media (max-width: 767px) {
  .activity-detail-breadcrumb { min-height: 204px; }
  .activity-detail-breadcrumb__inner { width: calc(100% - 30px); padding: 80px 0 60px; }
  .activity-detail-breadcrumb__title { margin-bottom: 15px; font-size: 30px; line-height: 35px; }
  .activity-detail-article { padding: 60px 15px 0; }
  .activity-detail-header { margin-bottom: 30px; }

  .activity-detail-header h1 {
    font-size: 30px;
    line-height: 41px;
  }

  .activity-detail-meta .categories-link a { min-height: 28px; padding: 7px 12px; font-size: 13px; }
  .activity-detail-cover { border-radius: 18px; }

  .activity-detail-body h4 {
    margin: 45px 0 24px;
    font-size: 25px;
    line-height: 32px;
  }

  .activity-detail-media { gap: 15px; margin-top: 28px; }
  .activity-detail-media--pair { grid-template-columns: minmax(0, 1fr); }
  .activity-detail-media figure { border-radius: 18px; }
  .activity-detail-categories { margin-top: 50px; padding-bottom: 45px; }
}

@media (prefers-reduced-motion: reduce) {
  .activity-detail-breadcrumb { background-attachment: scroll; }
  .activity-detail-breadcrumb__trail a,
  .activity-detail-meta .categories-link a,
  .activity-detail-links a { transition: none; }
}
</style>
