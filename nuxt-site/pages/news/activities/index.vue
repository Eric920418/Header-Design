<script setup lang="ts">
import { newsArticles } from '~/data/news'

const activityArticles = newsArticles.filter(article => article.category === 'activities')

useSeoMeta({
  title: '優惠活動｜SAKURA 整體廚房',
  description: '瀏覽 SAKURA 整體廚房期間限定優惠、廚房健檢與廚房升級活動。',
  ogTitle: '優惠活動｜SAKURA 整體廚房',
  ogDescription: 'SAKURA 整體廚房優惠活動列表。',
  ogImage: activityArticles[0]?.cover,
})
</script>

<template>
  <main class="antra-activity-page">
    <section class="antra-activity-breadcrumb hero-includes-header" aria-labelledby="activity-page-title">
      <div class="antra-activity-breadcrumb__overlay" aria-hidden="true" />
      <div class="antra-activity-breadcrumb__inner" v-reveal="{ anim: 'opalMoveUp' }">
        <h1 id="activity-page-title">Promotions</h1>
        <nav aria-label="麵包屑" class="antra-activity-breadcrumb__trail">
          <NuxtLink to="/">首頁</NuxtLink>
          <span aria-hidden="true">/</span>
          <NuxtLink to="/news">優惠消息</NuxtLink>
          <span aria-hidden="true">/</span>
          <span aria-current="page">優惠活動</span>
        </nav>
      </div>
    </section>

    <section aria-labelledby="activity-list-title" class="antra-activity-index">
      <div class="antra-activity-index__rail">
        <h2 id="activity-list-title" class="sr-only">優惠活動文章列表</h2>
        <div class="antra-activity-grid">
          <article
            v-for="(article, index) in activityArticles"
            :key="article.id"
            v-reveal="{ anim: 'opalMoveUp', delay: index * 100 }"
            class="antra-activity-post"
          >
            <NuxtLink :to="article.legacyPath" class="antra-activity-post__link">
              <div class="antra-activity-post__thumbnail">
                <InternalNewsImage
                  :src="article.cover"
                  :alt="`${article.title}文章封面`"
                  :eager="index === 0"
                  class="antra-activity-post__image"
                />
                <span class="antra-activity-post__category">{{ article.categoryLabel }}</span>
              </div>

              <div class="antra-activity-post__content">
                <div class="antra-activity-post__meta">
                  <time :datetime="article.publishedAt">{{ article.displayDate }}</time>
                </div>
                <h2>{{ article.title }}</h2>
                <p>{{ article.excerpt }}</p>
              </div>
            </NuxtLink>
          </article>
        </div>
      </div>
    </section>
  </main>
</template>

<style scoped>
.antra-activity-breadcrumb {
  position: relative;
  isolation: isolate;
  min-height: 360px;
  overflow: hidden;
  color: #fff;
  background: url('/section-3/store-songzhu.jpg') center 48% / cover no-repeat fixed;
}

.antra-activity-breadcrumb__overlay {
  position: absolute;
  inset: 0;
  z-index: -1;
  background: #100801;
  opacity: .64;
}

.antra-activity-breadcrumb__inner {
  width: min(1410px, calc(100% - 60px));
  margin-inline: auto;
  padding: 138px 0 97px;
  text-align: center;
}

.antra-activity-breadcrumb h1 {
  margin: 0 0 35px;
  color: #fff;
  font-family: var(--font-display);
  font-size: 60px;
  font-weight: 400;
  line-height: 64px;
}

.antra-activity-breadcrumb__trail {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: center;
  gap: 10px;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  font-weight: 400;
  line-height: 20px;
  text-transform: uppercase;
}

.antra-activity-breadcrumb__trail a {
  color: #fff;
  transition: color .3s ease;
}

.antra-activity-breadcrumb__trail a:hover { color: #caa05c; }

.antra-activity-index {
  overflow: hidden;
  padding: 100px 30px 108px;
  background: #f6f6f6;
}

.antra-activity-index__rail {
  width: min(1410px, 100%);
  margin-inline: auto;
}

.antra-activity-grid {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  column-gap: 30px;
  row-gap: 50px;
}

.antra-activity-post {
  min-width: 0;
}

.antra-activity-post__link {
  display: block;
  color: inherit;
}

.antra-activity-post__link:focus-visible {
  outline: 2px solid #caa05c;
  outline-offset: 6px;
  border-radius: 24px;
}

.antra-activity-post__thumbnail {
  position: relative;
  display: flex;
  margin-bottom: 19px;
  overflow: hidden;
  border-radius: 24px;
}

.antra-activity-post__image {
  width: 100%;
  aspect-ratio: 1.40625;
}

.antra-activity-post:hover :deep(.antra-activity-post__image img) {
  transform: scale(1.1);
}

.antra-activity-post__category {
  position: absolute;
  top: 20px;
  left: 20px;
  z-index: 2;
  display: inline-flex;
  align-items: center;
  min-height: 30px;
  padding: 8px 15px;
  border-radius: 100px;
  color: #fff;
  background: #caa05c;
  font-family: var(--font-cjk-sans);
  font-size: 14px;
  line-height: 14px;
}

.antra-activity-post__content {
  width: 90%;
}

.antra-activity-post__meta {
  display: flex;
  align-items: center;
  margin-bottom: 3px;
}

.antra-activity-post__meta time {
  position: relative;
  padding-right: 13px;
  color: #9f9fa4;
  font-family: var(--font-cjk-sans);
  font-size: 14px;
  font-weight: 500;
  line-height: 24px;
  text-transform: uppercase;
}

.antra-activity-post__meta time::after {
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

.antra-activity-post h2 {
  display: -webkit-box;
  margin: 0 0 19px;
  overflow: hidden;
  color: #1c1c1d;
  font-family: var(--font-cjk-serif);
  font-size: 20px;
  font-weight: 600;
  line-height: 30px;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
}

.antra-activity-post p {
  display: -webkit-box;
  margin: 0;
  overflow: hidden;
  color: #59585d;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 22px;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
}

@media (max-width: 1024px) {
  .antra-activity-breadcrumb {
    min-height: 285px;
    background-attachment: scroll;
  }

  .antra-activity-breadcrumb__inner { padding-block: 80px; }
  .antra-activity-index { padding-block: 80px; }
  .antra-activity-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
  .antra-activity-post__content { width: 100%; }
}

@media (max-width: 767px) {
  .antra-activity-breadcrumb { min-height: 204px; }

  .antra-activity-breadcrumb__inner {
    width: calc(100% - 30px);
    padding: 80px 0 60px;
  }

  .antra-activity-breadcrumb h1 {
    margin-bottom: 15px;
    font-size: 30px;
    line-height: 35px;
  }

  .antra-activity-index { padding: 60px 15px; }
  .antra-activity-grid { grid-template-columns: minmax(0, 1fr); }

}

@media (prefers-reduced-motion: reduce) {
  .antra-activity-breadcrumb { background-attachment: scroll; }
  .antra-activity-post:hover :deep(.antra-activity-post__image img) { transform: none; }
}
</style>
