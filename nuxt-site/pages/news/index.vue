<script setup lang="ts">
import { newsArticles, recentNewsArticles } from '~/data/news'

const newsCategories = [
  { label: '優惠活動', to: '/news/activities' },
  { label: '最新消息', to: '/news/latest' },
  { label: '媒體影音', to: '/news/video' },
]

useSeoMeta({
  title: '優惠消息｜SAKURA 整體廚房',
  description: '瀏覽 SAKURA 整體廚房最新優惠活動、品牌消息與媒體影音。',
  ogTitle: '優惠消息｜SAKURA 整體廚房',
  ogDescription: 'SAKURA 整體廚房優惠活動、最新消息與媒體影音總覽。',
  ogImage: '/section-4/news/latest-franchise-seminar-2026.jpg',
})
</script>

<template>
  <main class="antra-news-page">
    <section class="antra-news-breadcrumb hero-includes-header" aria-labelledby="news-page-title">
      <div class="antra-news-breadcrumb__overlay" aria-hidden="true" />
      <div class="antra-news-breadcrumb__inner" v-reveal="{ anim: 'opalMoveUp' }">
        <h1 id="news-page-title">Updates</h1>
        <nav aria-label="麵包屑" class="antra-news-breadcrumb__trail">
          <NuxtLink to="/">首頁</NuxtLink><span aria-hidden="true">/</span><span aria-current="page">優惠消息</span>
        </nav>
      </div>
    </section>

    <section aria-labelledby="news-list-title" class="antra-news-index">
      <div class="antra-news-index__rail">
        <div class="antra-news-layout">
          <div class="antra-news-content">
            <h2 id="news-list-title" class="sr-only">優惠消息文章列表</h2>
            <div class="antra-news-list">
              <article
                v-for="(article, index) in newsArticles"
                :key="article.id"
                v-reveal="{ anim: 'opalMoveUp', delay: Math.min(index, 3) * 80 }"
                class="antra-news-post"
                :class="{ 'antra-news-post--featured': index === 0 }"
              >
                <NuxtLink
                  :to="article.legacyPath"
                  class="antra-news-post__thumbnail"
                  :aria-label="`閱讀文章：${article.title}`"
                >
                  <InternalNewsImage
                    :src="article.cover"
                    :alt="`${article.title}文章封面`"
                    :eager="index === 0"
                    class="antra-news-post__image"
                  />
                </NuxtLink>

                <div class="antra-news-post__content">
                  <div class="antra-news-post__meta">
                    <span class="antra-news-post__category">{{ article.categoryLabel }}</span>
                    <time :datetime="article.publishedAt">{{ article.displayDate }}</time>
                  </div>
                  <h2 class="antra-news-post__title">
                    <NuxtLink :to="article.legacyPath">{{ article.title }}</NuxtLink>
                  </h2>
                  <p class="antra-news-post__excerpt">{{ article.excerpt }}</p>
                </div>
              </article>
            </div>
          </div>

          <aside class="antra-news-sidebar" aria-label="優惠消息側欄">
            <section class="antra-news-widget antra-news-widget--tags" aria-labelledby="news-tags-title" v-reveal="{ anim: 'opalMoveLeft' }">
              <h2 id="news-tags-title">優惠消息</h2>
              <div class="antra-news-widget__tags" aria-label="文章分類標籤">
                <NuxtLink
                  v-for="category in newsCategories"
                  :key="category.label"
                  :to="category.to"
                  :aria-label="`查看${category.label}列表頁`"
                >
                  {{ category.label }}
                </NuxtLink>
              </div>
            </section>

            <section class="antra-news-widget antra-news-widget--recent" aria-labelledby="sidebar-recent-title" v-reveal="{ anim: 'opalMoveLeft', delay: 80 }">
              <h2 id="sidebar-recent-title">最新文章</h2>
              <ol>
                <li v-for="article in recentNewsArticles" :key="article.id">
                  <NuxtLink
                    :to="article.legacyPath"
                    class="antra-news-widget__recent-image"
                    :aria-label="`閱讀文章：${article.title}`"
                  >
                    <InternalNewsImage :src="article.cover" :alt="`${article.title}文章封面`" />
                  </NuxtLink>
                  <div class="antra-news-widget__recent-content">
                    <time :datetime="article.publishedAt">{{ article.displayDate }}</time>
                    <h3><NuxtLink :to="article.legacyPath">{{ article.title }}</NuxtLink></h3>
                  </div>
                </li>
              </ol>
            </section>
          </aside>
        </div>
      </div>
    </section>
  </main>
</template>

<style scoped>
.antra-news-breadcrumb {
  position: relative;
  isolation: isolate;
  min-height: 360px;
  overflow: hidden;
  color: #fff;
  background: url('/section-3/store-songzhu.jpg') center 48% / cover no-repeat fixed;
}

.antra-news-breadcrumb__overlay {
  position: absolute;
  inset: 0;
  z-index: -1;
  background: #100801;
  opacity: .64;
}

.antra-news-breadcrumb__inner {
  width: min(1410px, calc(100% - 60px));
  margin-inline: auto;
  padding: 138px 0 97px;
  text-align: center;
}

.antra-news-breadcrumb h1 {
  margin: 0 0 35px;
  color: #fff;
  font-family: var(--font-display);
  font-size: 60px;
  font-weight: 400;
  line-height: 64px;
}

.antra-news-breadcrumb__trail {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  font-weight: 400;
  line-height: 20px;
  text-transform: uppercase;
}

.antra-news-breadcrumb__trail a {
  color: #fff;
  transition: color .3s ease;
}

.antra-news-breadcrumb__trail a:hover { color: #caa05c; }

.antra-news-index {
  overflow: hidden;
  padding: 100px 30px 108px;
  background: #fafafa;
}

.antra-news-index__rail {
  width: min(1410px, 100%);
  margin-inline: auto;
}

.antra-news-layout {
  display: grid;
  grid-template-columns: minmax(0, calc(100% - 480px)) 409px;
  gap: 71px;
}

.antra-news-content {
  min-width: 0;
}

.antra-news-sidebar {
  min-width: 0;
  align-self: start;
}

.antra-news-widget {
  margin-bottom: 50px;
  color: #59585d;
  font-family: var(--font-cjk-sans);
  font-size: 14px;
  line-height: 24px;
}

.antra-news-widget:last-child { margin-bottom: 0; }

.antra-news-widget > h2 {
  margin: 0 0 30px;
  color: #1c1c1d;
  font-family: var(--font-cjk-serif);
  font-size: 25px;
  font-weight: 400;
  line-height: 31px;
}

.antra-news-widget--tags > h2 { margin-bottom: 20px; }

.antra-news-widget__tags {
  display: flex;
  flex-wrap: wrap;
  gap: 10px 7px;
}

.antra-news-widget__tags a {
  display: inline-flex;
  align-items: center;
  min-height: 36px;
  padding: 5px 14px;
  border: 1px solid #e3e3e8;
  border-radius: 100px;
  color: #59585d;
  background: transparent;
  font-size: 14px;
  font-weight: 500;
  line-height: 24px;
  transition: border-color .3s ease, color .3s ease, background-color .3s ease;
}

.antra-news-widget__tags a:hover,
.antra-news-widget__tags a:focus-visible {
  border-color: #caa05c;
  color: #fff;
  background: #caa05c;
  outline: none;
}

.antra-news-widget--recent ol {
  margin: 0;
  padding: 0;
  list-style: none;
}

.antra-news-widget--recent > h2 { margin-bottom: 28px; }

.antra-news-widget--recent li {
  display: flex;
  align-items: flex-start;
  margin-bottom: 20px;
  padding-bottom: 20px;
  border-bottom: 1px solid #e3e3e8;
}

.antra-news-widget--recent li:last-child {
  margin: 0;
  padding: 0;
  border: 0;
}

.antra-news-widget__recent-image {
  display: block;
  width: 110px;
  height: 100px;
  flex: 0 0 110px;
  margin-right: 20px;
  overflow: hidden;
  border-radius: 12px;
}

.antra-news-widget__recent-image :deep(.antra-news-image) {
  width: 100%;
  height: 100%;
}

.antra-news-widget__recent-content {
  min-width: 0;
}

.antra-news-widget__recent-content time {
  display: block;
  margin: 5px 0 7px;
  color: #9f9fa4;
  font-family: var(--font-cjk-sans);
  font-size: 12px;
  font-weight: 500;
  line-height: 18px;
  text-transform: uppercase;
}

.antra-news-widget__recent-content h3 {
  display: -webkit-box;
  margin: 0;
  overflow: hidden;
  color: #1c1c1d;
  font-family: var(--font-cjk-serif);
  font-size: 18px;
  font-weight: 600;
  line-height: 24px;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
}

.antra-news-widget__recent-content h3 a,
.antra-news-post__title a {
  color: inherit;
  transition: color .3s ease;
}

.antra-news-widget__recent-content h3 a:hover,
.antra-news-widget__recent-content h3 a:focus-visible,
.antra-news-post__title a:hover,
.antra-news-post__title a:focus-visible {
  color: #caa05c;
  outline: none;
}

.antra-news-post {
  display: flex;
  overflow: hidden;
  margin: 0 0 20px;
  padding-bottom: 49px;
  border-bottom: 1px solid #e3e3e8;
}

.antra-news-post:last-child { margin-bottom: 0; }

.antra-news-post__thumbnail {
  position: relative;
  display: block;
  width: 45.2%;
  flex: 0 0 45.2%;
  overflow: hidden;
  border-radius: 24px;
}

.antra-news-post__thumbnail:focus-visible,
.antra-news-widget__recent-image:focus-visible {
  outline: 2px solid #caa05c;
  outline-offset: 4px;
}

.antra-news-post__image { aspect-ratio: 1.4482758621; }

.antra-news-post:hover :deep(.antra-news-post__image img) { transform: scale(1.08); }

.antra-news-post__content {
  min-width: 0;
  flex: 1;
  padding-left: 50px;
}

.antra-news-post__meta {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 8px 13px;
  margin: 15px 0 13px;
  font-family: var(--font-cjk-sans);
}

.antra-news-post__category {
  display: inline-flex;
  align-items: center;
  padding: 8px 15px;
  border-radius: 100px;
  color: #fff;
  background: #caa05c;
  font-family: var(--font-cjk-sans);
  font-size: 14px;
  line-height: 14px;
}

.antra-news-post__meta time {
  position: relative;
  padding-right: 12px;
  color: #9f9fa4;
  font-size: 13px;
  font-weight: 500;
  line-height: 24px;
  text-transform: uppercase;
}

.antra-news-post__meta time::after {
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

.antra-news-post__title {
  display: -webkit-box;
  margin: 0 0 20px;
  overflow: hidden;
  color: #1c1c1d;
  font-family: var(--font-cjk-serif);
  font-size: 25px;
  font-weight: 400;
  line-height: 31px;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
}

.antra-news-post__excerpt {
  display: -webkit-box;
  margin: 0;
  overflow: hidden;
  color: #59585d;
  font-family: var(--font-cjk-sans);
  font-size: 16px;
  line-height: 24px;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
}

.antra-news-post--featured {
  display: block;
  padding-bottom: 48px;
}

.antra-news-post--featured .antra-news-post__thumbnail {
  width: 100%;
  margin-bottom: 20px;
}

.antra-news-post--featured .antra-news-post__image { aspect-ratio: 1.7884615385; }

.antra-news-post--featured .antra-news-post__content { padding: 0; }

.antra-news-post--featured .antra-news-post__meta { margin-top: 0; }

.antra-news-post--featured .antra-news-post__title {
  margin-bottom: 20px;
  font-size: 30px;
  font-weight: 600;
  line-height: 40px;
}

.antra-news-post--featured .antra-news-post__excerpt {
  max-width: 930px;
  margin-bottom: 24px;
}

@media (max-width: 1024px) {
  .antra-news-breadcrumb {
    min-height: 285px;
    background-attachment: scroll;
  }

  .antra-news-breadcrumb__inner { padding-block: 80px; }

  .antra-news-index { padding-block: 80px; }

  .antra-news-post { padding-bottom: 30px; }

  .antra-news-post__content { padding-left: 30px; }
}

@media (width: 1024px) {
  .antra-news-layout {
    grid-template-columns: minmax(0, calc(100% - 330px)) 300px;
    gap: 30px;
  }

  .antra-news-widget__recent-image {
    width: 90px;
    height: 82px;
    flex-basis: 90px;
    margin-right: 15px;
  }

  .antra-news-widget__recent-content h3 {
    font-size: 18px;
    line-height: 22px;
  }
}

@media (max-width: 1023px) {
  .antra-news-layout { grid-template-columns: minmax(0, 1fr); }
  .antra-news-sidebar { display: none; }
}

@media (max-width: 767px) {
  .antra-news-breadcrumb { min-height: 204px; }

  .antra-news-breadcrumb__inner {
    width: calc(100% - 30px);
    padding: 80px 0 60px;
  }

  .antra-news-breadcrumb h1 {
    margin-bottom: 15px;
    font-size: 30px;
    line-height: 35px;
  }

  .antra-news-index { padding: 60px 15px; }

}

@media (max-width: 568px) {
  .antra-news-post { display: block; }

  .antra-news-post__thumbnail {
    width: 100%;
    margin-bottom: 20px;
  }

  .antra-news-post__content { padding: 0; }

  .antra-news-post__meta { margin-top: 0; }

  .antra-news-post__title {
    margin-bottom: 15px;
    font-size: 25px;
    line-height: 31px;
  }

  .antra-news-post--featured .antra-news-post__title {
    font-size: 30px;
    line-height: 35px;
  }
}

@media (prefers-reduced-motion: reduce) {
  .antra-news-breadcrumb { background-attachment: scroll; }
  .antra-news-post:hover :deep(.antra-news-post__image img) { transform: none; }
}
</style>
