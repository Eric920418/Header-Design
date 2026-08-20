<script setup lang="ts">
import { Camera, Images, PanelsTopLeft, PlaySquare } from 'lucide-vue-next'
import { KITCHEN_GUIDE_DETAILS } from '~/data/kitchenGuideDetails'
import { KITCHEN_GUIDE_ARTICLES } from '~/data/kitchenGuides'
import { newsArticles } from '~/data/news'

const route = useRoute()
const slug = String(route.params.slug)
const detail = KITCHEN_GUIDE_DETAILS.find(entry => entry.slug === slug)
const article = detail ? KITCHEN_GUIDE_ARTICLES.find(entry => entry.id === detail.articleId) : undefined

if (!detail || !article) {
  throw createError({ statusCode: 404, message: `廚房裝修指南「${slug}」不存在或尚未公開。` })
}

const relatedNewsArticles = ['cash-subsidy-2025', 'franchise-seminar-2026', 'american-urban']
  .map(id => newsArticles.find(entry => entry.id === id))
  .filter((entry): entry is (typeof newsArticles)[number] => Boolean(entry))

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
  link: [{ rel: 'canonical', href: article.legacyUrl }],
})
</script>

<template>
  <main class="knowledge-detail-page">
    <section class="knowledge-detail-breadcrumb" aria-label="廚房裝修指南麵包屑">
      <span class="knowledge-detail-breadcrumb__overlay" aria-hidden="true" />
      <nav class="knowledge-detail-breadcrumb__trail" aria-label="麵包屑" v-reveal="{ anim: 'opalMoveUp' }">
        <NuxtLink to="/">首頁</NuxtLink>
        <span aria-hidden="true">/</span>
        <NuxtLink to="/knowledge" aria-current="page">廚房裝修指南</NuxtLink>
      </nav>
    </section>

    <article class="knowledge-detail" :aria-labelledby="`knowledge-detail-title-${article.id}`">
      <header class="knowledge-detail__header" v-reveal="{ anim: 'opalMoveUp' }">
        <div class="knowledge-detail__meta">
          <NuxtLink to="/knowledge">廚房裝修指南</NuxtLink>
          <time :datetime="article.publishedAt">{{ article.displayDate }}</time>
        </div>
        <h1 :id="`knowledge-detail-title-${article.id}`">{{ article.title }}</h1>
      </header>

      <figure class="knowledge-detail__cover" v-reveal="{ anim: 'opalScaleUp', delay: 100 }">
        <InternalGuideImage :src="detail.cover.src" :alt="detail.cover.alt" eager />
      </figure>

      <div class="knowledge-detail__content">
        <section
          v-for="(section, sectionIndex) in detail.sections"
          :key="section.heading ?? `section-${sectionIndex}`"
          class="knowledge-detail-section"
          v-reveal="{ anim: 'opalMoveUp' }"
        >
          <h2 v-if="section.heading">{{ section.heading }}</h2>
          <p v-for="paragraph in section.paragraphs" :key="paragraph">{{ paragraph }}</p>

          <figure v-if="section.image" class="knowledge-detail-section__media" v-reveal="{ anim: 'opalScaleUp', delay: 100 }">
            <InternalGuideImage :src="section.image.src" :alt="section.image.alt" />
          </figure>

          <div v-for="point in section.points" :key="point.title" class="knowledge-detail-point">
            <h3>
              <a v-if="point.url" :href="point.url" target="_blank" rel="noopener noreferrer">{{ point.title }}</a>
              <template v-else>{{ point.title }}</template>
            </h3>
            <figure v-if="point.image" class="knowledge-detail-point__media" v-reveal="{ anim: 'opalScaleUp', delay: 100 }">
              <InternalGuideImage :src="point.image.src" :alt="point.image.alt" />
            </figure>
            <p v-for="paragraph in point.paragraphs" :key="paragraph">{{ paragraph }}</p>
          </div>
        </section>

        <section v-if="detail.video" class="knowledge-detail-video" aria-labelledby="knowledge-detail-video-title" v-reveal="{ anim: 'opalScaleUp' }">
          <h2 id="knowledge-detail-video-title" class="sr-only">{{ detail.video.title }}</h2>
          <InternalKnowledgeVideoPlayer
            :video-id="detail.video.id"
            :cover="detail.video.cover"
            :title="detail.video.title"
          />
        </section>

        <section class="knowledge-detail-section knowledge-detail-closing" v-reveal="{ anim: 'opalMoveUp' }">
          <p>{{ detail.closing }}</p>
          <div class="knowledge-detail-links">
            <a v-for="link in detail.links" :key="link.url" :href="link.url" target="_blank" rel="noopener noreferrer">
              {{ link.label }}
            </a>
          </div>
        </section>

        <nav class="knowledge-detail-categories" aria-label="文章分類" v-reveal="{ anim: 'opalMoveUp' }">
          <NuxtLink to="/news/activities"><Camera aria-hidden="true" />優惠活動</NuxtLink>
          <NuxtLink to="/news/latest"><Images aria-hidden="true" />最新消息</NuxtLink>
          <NuxtLink to="/news/video"><PlaySquare aria-hidden="true" />媒體影音</NuxtLink>
          <NuxtLink to="/knowledge" aria-current="page"><PanelsTopLeft aria-hidden="true" />廚房裝修指南</NuxtLink>
        </nav>
      </div>
    </article>

    <InternalKnowledgeRelatedCarousel :articles="relatedNewsArticles" />
  </main>
</template>

<style scoped>
.knowledge-detail-page {
  color: #59585d;
  background: #f6f6f6;
}

.knowledge-detail-breadcrumb {
  position: relative;
  isolation: isolate;
  display: grid;
  min-height: 185px;
  overflow: hidden;
  padding: 30px;
  place-items: center;
  color: #fff;
  background: url('/section-3/service-process/breadcrumb-df.jpg') center / cover no-repeat fixed;
}

.knowledge-detail-breadcrumb__overlay {
  position: absolute;
  z-index: -1;
  inset: 0;
  background: #100801;
  opacity: .64;
}

.knowledge-detail-breadcrumb__trail {
  display: flex;
  width: min(1410px, 100%);
  align-items: center;
  justify-content: center;
  gap: 10px;
  margin-inline: auto;
  font-family: var(--font-ui);
  font-size: 13px;
  line-height: 14px;
  text-transform: uppercase;
}

.knowledge-detail-breadcrumb__trail a {
  color: inherit;
  transition: color .3s ease;
}

.knowledge-detail-breadcrumb__trail a:hover,
.knowledge-detail-breadcrumb__trail a:focus-visible { color: #caa05c; }

.knowledge-detail { padding: 100px 30px 0; }

.knowledge-detail__header,
.knowledge-detail__cover,
.knowledge-detail__content {
  width: min(930px, 100%);
  margin-inline: auto;
}

.knowledge-detail__header { margin-bottom: 30px; }

.knowledge-detail__meta {
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  gap: 14px;
  margin-bottom: 13px;
}

.knowledge-detail__meta a {
  display: inline-flex;
  min-height: 30px;
  align-items: center;
  padding: 8px 15px;
  border-radius: 100px;
  color: #fff;
  background: #caa05c;
  font-family: var(--font-ui);
  font-size: 14px;
  line-height: 14px;
  transition: background-color .3s ease;
}

.knowledge-detail__meta a:hover,
.knowledge-detail__meta a:focus-visible { background: #1c1c1d; }

.knowledge-detail__meta time {
  position: relative;
  padding-right: 13px;
  color: #9f9fa4;
  font-size: 14px;
  line-height: 24px;
  text-transform: uppercase;
}

.knowledge-detail__meta time::after {
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

.knowledge-detail__header h1 {
  margin: 0;
  color: #1c1c1d;
  font-family: var(--font-display);
  font-size: 50px;
  font-weight: 400;
  line-height: 54px;
}

.knowledge-detail__cover {
  margin-bottom: 62px;
  overflow: hidden;
  border-radius: 24px;
  background: #e3e3e8;
}

.knowledge-detail__cover :deep(.guide-image),
.knowledge-detail__cover :deep(.guide-image img),
.knowledge-detail-section__media :deep(.guide-image),
.knowledge-detail-section__media :deep(.guide-image img),
.knowledge-detail-point__media :deep(.guide-image),
.knowledge-detail-point__media :deep(.guide-image img) {
  display: block;
  width: 100%;
  height: auto;
}

.knowledge-detail__cover :deep(.guide-image img),
.knowledge-detail-section__media :deep(.guide-image img),
.knowledge-detail-point__media :deep(.guide-image img) { object-fit: contain; }

.knowledge-detail-section { margin-bottom: 54px; }

.knowledge-detail-section h2 {
  margin: 0 0 30px;
  color: #1c1c1d;
  font-family: var(--font-display);
  font-size: 40px;
  font-weight: 400;
  line-height: 44px;
}

.knowledge-detail-section h3 {
  margin: 31px 0 12px;
  color: #1c1c1d;
  font-family: var(--font-display);
  font-size: 25px;
  font-weight: 400;
  line-height: 30px;
}

.knowledge-detail-section h3 a {
  color: inherit;
  text-decoration: underline;
  text-decoration-color: #caa05c;
  text-underline-offset: 5px;
  transition: color .3s ease;
}

.knowledge-detail-section h3 a:hover,
.knowledge-detail-section h3 a:focus-visible { color: #caa05c; }

.knowledge-detail-section p {
  margin: 0 0 20px;
  color: #59585d;
  font-size: 16px;
  line-height: 24px;
}

.knowledge-detail-section__media,
.knowledge-detail-point__media {
  margin: 30px 0;
  overflow: hidden;
  border-radius: 24px;
  background: #e3e3e8;
}

.knowledge-detail-point { margin-top: 31px; }
.knowledge-detail-point h3 { margin-top: 0; }

.knowledge-detail-video {
  margin: 6px 0 54px;
}

.knowledge-detail-links {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 10px;
  margin-top: 25px;
}

.knowledge-detail-links a {
  color: #1c1c1d;
  font-size: 15px;
  line-height: 24px;
  text-decoration: underline;
  text-decoration-color: #caa05c;
  text-underline-offset: 4px;
  transition: color .3s ease;
}

.knowledge-detail-links a:hover,
.knowledge-detail-links a:focus-visible { color: #caa05c; }

.knowledge-detail-categories {
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  gap: 10px;
  padding: 4px 0 60px;
}

.knowledge-detail-categories a {
  display: inline-flex;
  min-height: 34px;
  align-items: center;
  gap: 7px;
  padding: 5px 14px;
  border: 1px solid #e3e3e8;
  border-radius: 24px;
  color: #59585d;
  font-size: 14px;
  font-weight: 500;
  line-height: 24px;
  transition: color .3s ease, border-color .3s ease, background-color .3s ease;
}

.knowledge-detail-categories :deep(svg) { width: 15px; height: 15px; }

.knowledge-detail-categories a:hover,
.knowledge-detail-categories a:focus-visible,
.knowledge-detail-categories a[aria-current="page"] {
  border-color: #caa05c;
  color: #fff;
  background: #caa05c;
}

@media (max-width: 1024px) {
  .knowledge-detail { padding-top: 80px; }
  .knowledge-detail__header h1 { font-size: 40px; line-height: 45px; }
  .knowledge-detail-section h2 { font-size: 36px; line-height: 41px; }
}

@media (max-width: 767px) {
  .knowledge-detail-breadcrumb {
    min-height: 150px;
    padding-inline: 15px;
    background-attachment: scroll;
  }

  .knowledge-detail { padding: 60px 15px 0; }
  .knowledge-detail__header h1 { font-size: 30px; line-height: 35px; }
  .knowledge-detail__cover { margin-bottom: 45px; border-radius: 18px; }
  .knowledge-detail-section { margin-bottom: 45px; }
  .knowledge-detail-section h2 { margin-bottom: 24px; font-size: 30px; line-height: 35px; }
  .knowledge-detail-section h3 { font-size: 22px; line-height: 27px; }
  .knowledge-detail-section__media,
  .knowledge-detail-point__media { border-radius: 18px; }
  .knowledge-detail-categories { padding-bottom: 45px; }
}

@media (prefers-reduced-motion: reduce) {
  .knowledge-detail-breadcrumb__trail a,
  .knowledge-detail__meta a,
  .knowledge-detail-section h3 a,
  .knowledge-detail-links a,
  .knowledge-detail-categories a { transition: none; }
}
</style>
