<script setup lang="ts">
import { newsArticles } from '~/data/news'

const latestArticles = newsArticles.filter(article => article.category === 'latest')

useSeoMeta({
  title: '最新消息｜SAKURA 整體廚房',
  description: '瀏覽 SAKURA 整體廚房品牌館、加盟說明會與品牌最新動態。',
  ogTitle: '最新消息｜SAKURA 整體廚房',
  ogDescription: 'SAKURA 整體廚房最新消息列表。',
  ogImage: latestArticles[0]?.cover,
})
</script>

<template>
  <main class="antra-latest-page">
    <section class="antra-latest-breadcrumb" aria-labelledby="latest-page-title">
      <div class="antra-latest-breadcrumb__overlay" aria-hidden="true" />
      <div class="antra-latest-breadcrumb__inner" v-reveal="{ anim: 'opalMoveUp' }">
        <h1 id="latest-page-title">最新消息</h1>
        <nav aria-label="麵包屑" class="antra-latest-breadcrumb__trail">
          <NuxtLink to="/">首頁</NuxtLink>
          <span aria-hidden="true">/</span>
          <NuxtLink to="/news">優惠消息</NuxtLink>
          <span aria-hidden="true">/</span>
          <span aria-current="page">最新消息</span>
        </nav>
      </div>
    </section>

    <section aria-labelledby="latest-list-title" class="antra-latest-index">
      <div class="antra-latest-index__rail">
        <h2 id="latest-list-title" class="sr-only">最新消息文章列表</h2>
        <div class="antra-latest-grid">
          <article
            v-for="(article, index) in latestArticles"
            :key="article.id"
            v-reveal="{ anim: 'opalMoveUp', delay: index * 100 }"
            class="antra-latest-post"
          >
            <NuxtLink :to="article.legacyPath" class="antra-latest-post__link">
              <div class="antra-latest-post__thumbnail">
                <InternalNewsImage
                  :src="article.cover"
                  :alt="`${article.title}文章封面`"
                  :eager="index === 0"
                  class="antra-latest-post__image"
                />
                <span class="antra-latest-post__category">{{ article.categoryLabel }}</span>
              </div>

              <div class="antra-latest-post__content">
                <div class="antra-latest-post__meta">
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
.antra-latest-breadcrumb {
  position: relative;
  isolation: isolate;
  min-height: 360px;
  overflow: hidden;
  color: #fff;
  background: url('/section-3/service-process/breadcrumb-df.jpg') center / cover no-repeat fixed;
}

.antra-latest-breadcrumb__overlay {
  position: absolute;
  inset: 0;
  z-index: -1;
  background: #100801;
  opacity: .64;
}

.antra-latest-breadcrumb__inner {
  width: min(1410px, calc(100% - 60px));
  margin-inline: auto;
  padding: 138px 0 97px;
  text-align: center;
}

.antra-latest-breadcrumb h1 {
  margin: 0 0 35px;
  color: #fff;
  font-family: "Cal Sans", sans-serif;
  font-size: 80px;
  font-weight: 400;
  line-height: .9523809524;
}

.antra-latest-breadcrumb__trail {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: center;
  gap: 10px;
  font-family: "Cal Sans", sans-serif;
  font-size: 13px;
  font-weight: 400;
  line-height: 14px;
  text-transform: uppercase;
}

.antra-latest-breadcrumb__trail a {
  color: #fff;
  transition: color .3s ease;
}

.antra-latest-breadcrumb__trail a:hover { color: #caa05c; }

.antra-latest-index {
  overflow: hidden;
  padding: 100px 30px 108px;
  background: #f6f6f6;
}

.antra-latest-index__rail {
  width: min(1410px, 100%);
  margin-inline: auto;
}

.antra-latest-grid {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  column-gap: 30px;
  row-gap: 50px;
}

.antra-latest-post { min-width: 0; }

.antra-latest-post__link {
  display: block;
  color: inherit;
}

.antra-latest-post__link:focus-visible {
  outline: 2px solid #caa05c;
  outline-offset: 6px;
  border-radius: 24px;
}

.antra-latest-post__thumbnail {
  position: relative;
  display: flex;
  margin-bottom: 19px;
  overflow: hidden;
  border-radius: 24px;
}

.antra-latest-post__image {
  width: 100%;
  aspect-ratio: 1.40625;
}

.antra-latest-post:hover :deep(.antra-latest-post__image img) {
  transform: scale(1.1);
}

.antra-latest-post__category {
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
  font-family: "Cal Sans", sans-serif;
  font-size: 14px;
  line-height: 14px;
}

.antra-latest-post__content { width: 90%; }

.antra-latest-post__meta {
  display: flex;
  align-items: center;
  margin-bottom: 3px;
}

.antra-latest-post__meta time {
  position: relative;
  padding-right: 13px;
  color: #9f9fa4;
  font-size: 14px;
  font-weight: 500;
  line-height: 24px;
  text-transform: uppercase;
}

.antra-latest-post__meta time::after {
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

.antra-latest-post h2 {
  display: -webkit-box;
  margin: 0 0 19px;
  overflow: hidden;
  color: #1c1c1d;
  font-family: "Cal Sans", sans-serif;
  font-size: 30px;
  font-weight: 400;
  line-height: 34px;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
}

.antra-latest-post p {
  display: -webkit-box;
  margin: 0;
  overflow: hidden;
  color: #59585d;
  font-size: 16px;
  line-height: 24px;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
}

@media (max-width: 1024px) {
  .antra-latest-breadcrumb {
    min-height: 285px;
    background-attachment: scroll;
  }

  .antra-latest-breadcrumb__inner { padding-block: 80px; }
  .antra-latest-index { padding-block: 80px; }
  .antra-latest-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
  .antra-latest-post__content { width: 100%; }
}

@media (max-width: 767px) {
  .antra-latest-breadcrumb { min-height: 204px; }

  .antra-latest-breadcrumb__inner {
    width: calc(100% - 30px);
    padding: 80px 0 60px;
  }

  .antra-latest-breadcrumb h1 {
    margin-bottom: 15px;
    font-size: 30px;
    line-height: 35px;
  }

  .antra-latest-index { padding: 60px 15px; }
  .antra-latest-grid { grid-template-columns: minmax(0, 1fr); }

  .antra-latest-post h2 {
    font-size: 22px;
    line-height: 28px;
  }
}

@media (prefers-reduced-motion: reduce) {
  .antra-latest-breadcrumb { background-attachment: scroll; }
  .antra-latest-post:hover :deep(.antra-latest-post__image img) { transform: none; }
}
</style>
