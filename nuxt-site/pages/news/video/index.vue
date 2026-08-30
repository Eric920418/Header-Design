<script setup lang="ts">
import { newsArticles } from '~/data/news'

const videoArticles = newsArticles.filter(article => article.category === 'video')

useSeoMeta({
  title: '媒體影音｜SAKURA 整體廚房',
  description: '瀏覽 SAKURA 整體廚房空間案例、收納規劃與社交型廚房媒體內容。',
  ogTitle: '媒體影音｜SAKURA 整體廚房',
  ogDescription: 'SAKURA 整體廚房媒體影音列表。',
  ogImage: videoArticles[0]?.cover,
})
</script>

<template>
  <main class="antra-video-page">
    <section class="antra-video-breadcrumb hero-includes-header" aria-labelledby="video-page-title">
      <div class="antra-video-breadcrumb__overlay" aria-hidden="true" />
      <div class="antra-video-breadcrumb__inner" v-reveal="{ anim: 'opalMoveUp' }">
        <h1 id="video-page-title">Media</h1>
        <nav aria-label="麵包屑" class="antra-video-breadcrumb__trail">
          <NuxtLink to="/">首頁</NuxtLink>
          <span aria-hidden="true">/</span>
          <NuxtLink to="/news">優惠消息</NuxtLink>
          <span aria-hidden="true">/</span>
          <span aria-current="page">媒體影音</span>
        </nav>
      </div>
    </section>

    <section aria-labelledby="video-list-title" class="antra-video-index">
      <div class="antra-video-index__rail">
        <h2 id="video-list-title" class="sr-only">媒體影音文章列表</h2>
        <div class="antra-video-grid">
          <article
            v-for="(article, index) in videoArticles"
            :key="article.id"
            v-reveal="{ anim: 'opalMoveUp', delay: index * 100 }"
            class="antra-video-post"
          >
            <NuxtLink :to="article.legacyPath" class="antra-video-post__link">
              <div class="antra-video-post__thumbnail">
                <InternalNewsImage
                  :src="article.cover"
                  :alt="`${article.title}媒體影音封面`"
                  :eager="index === 0"
                  class="antra-video-post__image"
                />
                <span class="antra-video-post__category">{{ article.categoryLabel }}</span>
              </div>

              <div class="antra-video-post__content">
                <div class="antra-video-post__meta">
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
.antra-video-breadcrumb {
  position: relative;
  isolation: isolate;
  min-height: 360px;
  overflow: hidden;
  color: #fff;
  background: url('/section-3/store-songzhu.jpg') center 48% / cover no-repeat fixed;
}

.antra-video-breadcrumb__overlay {
  position: absolute;
  z-index: -1;
  inset: 0;
  background: #100801;
  opacity: .64;
}

.antra-video-breadcrumb__inner {
  width: min(1410px, calc(100% - 60px));
  margin-inline: auto;
  padding: 138px 0 97px;
  text-align: center;
}

.antra-video-breadcrumb h1 {
  margin: 0 0 35px;
  color: #fff;
  font-family: var(--font-display);
  font-size: 60px;
  font-weight: 400;
  line-height: 64px;
}

.antra-video-breadcrumb__trail {
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

.antra-video-breadcrumb__trail a {
  color: #fff;
  transition: color .3s ease;
}

.antra-video-breadcrumb__trail a:hover { color: #caa05c; }

.antra-video-index {
  overflow: hidden;
  padding: 100px 30px 108px;
  background: #f6f6f6;
}

.antra-video-index__rail {
  width: min(1410px, 100%);
  margin-inline: auto;
}

.antra-video-grid {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  column-gap: 30px;
  row-gap: 50px;
}

.antra-video-post { min-width: 0; }
.antra-video-post__link { display: block; color: inherit; }

.antra-video-post__link:focus-visible {
  border-radius: 24px;
  outline: 2px solid #caa05c;
  outline-offset: 6px;
}

.antra-video-post__thumbnail {
  position: relative;
  display: flex;
  margin-bottom: 19px;
  overflow: hidden;
  border-radius: 24px;
}

.antra-video-post__image {
  width: 100%;
  aspect-ratio: 1.40625;
}

.antra-video-post:hover :deep(.antra-video-post__image img) { transform: scale(1.1); }

.antra-video-post__category {
  position: absolute;
  top: 20px;
  left: 20px;
  z-index: 2;
  display: inline-flex;
  min-height: 30px;
  align-items: center;
  padding: 8px 15px;
  border-radius: 100px;
  color: #fff;
  background: #caa05c;
  font-family: var(--font-cjk-sans);
  font-size: 14px;
  line-height: 14px;
}

.antra-video-post__content { width: 90%; }

.antra-video-post__meta {
  display: flex;
  align-items: center;
  margin-bottom: 3px;
}

.antra-video-post__meta time {
  position: relative;
  padding-right: 13px;
  color: #9f9fa4;
  font-family: var(--font-cjk-sans);
  font-size: 14px;
  font-weight: 500;
  line-height: 24px;
  text-transform: uppercase;
}

.antra-video-post__meta time::after {
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

.antra-video-post h2 {
  display: -webkit-box;
  margin: 0 0 19px;
  overflow: hidden;
  color: #1c1c1d;
  font-family: var(--font-cjk-serif);
  font-size: 20px;
  font-weight: 600;
  line-height: 30px;
  transition: color .3s ease;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
}

.antra-video-post__link:hover h2,
.antra-video-post__link:focus-visible h2 { color: #caa05c; }

.antra-video-post p {
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
  .antra-video-breadcrumb {
    min-height: 285px;
    background-attachment: scroll;
  }

  .antra-video-breadcrumb__inner { padding-block: 80px; }
  .antra-video-index { padding-block: 80px; }
  .antra-video-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
  .antra-video-post__content { width: 100%; }
}

@media (max-width: 767px) {
  .antra-video-breadcrumb { min-height: 204px; }

  .antra-video-breadcrumb__inner {
    width: calc(100% - 30px);
    padding: 80px 0 60px;
  }

  .antra-video-breadcrumb h1 {
    margin-bottom: 15px;
    font-size: 30px;
    line-height: 35px;
  }

  .antra-video-index { padding: 60px 15px; }
  .antra-video-grid { grid-template-columns: minmax(0, 1fr); }

}

@media (prefers-reduced-motion: reduce) {
  .antra-video-breadcrumb { background-attachment: scroll; }
  .antra-video-breadcrumb__trail a { transition: none; }
  .antra-video-post h2 { transition: none; }
  .antra-video-post:hover :deep(.antra-video-post__image img) { transform: none; }
}
</style>
