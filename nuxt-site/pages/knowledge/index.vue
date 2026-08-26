<script setup lang="ts">
import { KITCHEN_GUIDE_ARTICLES } from '~/data/kitchenGuides'

const featuredArticle = KITCHEN_GUIDE_ARTICLES[0]!

useSeoMeta({
  title: '廚房裝修指南｜SAKURA 整體廚房',
  description: '從系統櫃材質、廚房插座到中島餐桌規劃，閱讀 SAKURA 整體廚房精選裝修指南。',
  ogTitle: '廚房裝修指南｜SAKURA 整體廚房',
  ogDescription: '廚房系統櫃、插座配置與中島餐桌的實用規劃知識。',
  ogImage: featuredArticle.cover,
})
</script>

<template>
  <main class="kitchen-guide-page">
    <section class="kitchen-guide-hero hero-includes-header" aria-labelledby="kitchen-guide-page-title">
      <span class="kitchen-guide-hero__overlay" aria-hidden="true" />
      <div class="kitchen-guide-hero__inner" v-reveal="{ anim: 'opalMoveUp' }">
        <h1 id="kitchen-guide-page-title">Kitchen Knowledge</h1>
        <nav aria-label="麵包屑" class="kitchen-guide-hero__trail">
          <NuxtLink to="/">首頁</NuxtLink>
          <span aria-hidden="true">/</span>
          <span aria-current="page">廚房裝修指南</span>
        </nav>
      </div>
    </section>

    <section class="kitchen-guide-newsroom" aria-labelledby="kitchen-guide-heading">
      <div class="kitchen-guide-newsroom__rail">
        <header class="kitchen-guide-heading">
          <InternalTemplateHeadingRail v-reveal="{ anim: 'opalMoveRight' }" label="Straight From The Newsroom" class="kitchen-guide-heading__label" />
          <h2 id="kitchen-guide-heading" v-reveal="{ anim: 'opalMoveLeft', delay: 100 }">
            Take A Look At <span>Our Latest Blog</span> &amp; Articles.
          </h2>
        </header>

        <div class="kitchen-guide-posts">
          <article v-reveal="{ anim: 'opalMoveUp' }" class="kitchen-guide-featured">
            <NuxtLink :to="featuredArticle.detailRoute ?? featuredArticle.legacyUrl" class="kitchen-guide-featured__image-link" :aria-label="`閱讀文章：${featuredArticle.title}`">
              <InternalGuideImage :src="featuredArticle.cover" :alt="`${featuredArticle.title}文章封面`" eager class="kitchen-guide-featured__image" />
            </NuxtLink>
            <div class="kitchen-guide-featured__content">
              <div class="kitchen-guide-meta">
                <span>{{ featuredArticle.categoryLabel }}</span>
                <time :datetime="featuredArticle.publishedAt">{{ featuredArticle.displayDate }}</time>
              </div>
              <h3><NuxtLink :to="featuredArticle.detailRoute ?? featuredArticle.legacyUrl">{{ featuredArticle.title }}</NuxtLink></h3>
              <p>{{ featuredArticle.excerpt }}</p>
            </div>
          </article>

          <div v-reveal="{ anim: 'opalMoveUp', delay: 100 }" class="kitchen-guide-list">
            <article v-for="article in KITCHEN_GUIDE_ARTICLES" :key="article.id" class="kitchen-guide-list-item">
              <NuxtLink :to="article.detailRoute ?? article.legacyUrl" class="kitchen-guide-list-item__image-link" :aria-label="`閱讀文章：${article.title}`">
                <InternalGuideImage :src="article.cover" :alt="`${article.title}文章封面`" class="kitchen-guide-list-item__image" />
              </NuxtLink>
              <div class="kitchen-guide-list-item__content">
                <div class="kitchen-guide-meta">
                  <span>{{ article.categoryLabel }}</span>
                  <time :datetime="article.publishedAt">{{ article.displayDate }}</time>
                </div>
                <h3><NuxtLink :to="article.detailRoute ?? article.legacyUrl">{{ article.title }}</NuxtLink></h3>
                <p>{{ article.excerpt }}</p>
              </div>
            </article>
          </div>
        </div>
      </div>
    </section>
  </main>
</template>

<style scoped>
.kitchen-guide-page {
  color: #59585d;
  background: #f6f6f6;
  font-family: var(--font-cjk-sans);
}

.kitchen-guide-hero {
  position: relative;
  isolation: isolate;
  min-height: 360px;
  overflow: hidden;
  color: #fff;
  background: url('/section-3/store-songzhu.jpg') center 36% / cover no-repeat fixed;
}

.kitchen-guide-hero__overlay {
  position: absolute;
  inset: 0;
  z-index: -1;
  background: #100801;
  opacity: .64;
}

.kitchen-guide-hero__inner {
  width: min(1410px, calc(100% - 60px));
  margin-inline: auto;
  padding: 138px 0 97px;
  text-align: center;
}

.kitchen-guide-hero h1 {
  margin: 0 0 35px;
  color: #fff;
  font-family: var(--font-display);
  font-size: 60px;
  font-weight: 500;
  line-height: 72px;
}

.kitchen-guide-hero__trail {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 22px;
}

.kitchen-guide-hero__trail a {
  color: inherit;
  transition: color .3s ease;
}

.kitchen-guide-hero__trail a:hover { color: #caa05c; }

.kitchen-guide-newsroom {
  overflow: hidden;
  padding: 125px 30px 130px;
}

.kitchen-guide-newsroom__rail {
  width: min(1410px, 100%);
  margin-inline: auto;
  padding-inline: 46px;
}

.kitchen-guide-heading {
  display: grid;
  width: min(1083px, 100%);
  margin: 0 auto 60px;
  grid-template-columns: 30% 70%;
}

.kitchen-guide-heading__label {
  z-index: 1;
  grid-column: 1;
  grid-row: 1;
}

.kitchen-guide-heading h2 {
  grid-column: 2;
  grid-row: 1;
  max-width: 760px;
  margin: 64px 0 0;
  color: #1c1c1d;
  font-family: var(--font-display);
  font-size: 60px;
  font-weight: 400;
  line-height: 64px;
  justify-self: start;
  text-align: left;
  text-transform: capitalize;
}

.kitchen-guide-heading h2 span { color: #caa05c; }

.kitchen-guide-posts {
  display: grid;
  grid-template-columns: minmax(0, 49fr) minmax(0, 51.3fr);
  gap: 60px;
}

.kitchen-guide-featured,
.kitchen-guide-list-item {
  min-width: 0;
}

.kitchen-guide-featured__image-link,
.kitchen-guide-list-item__image-link {
  display: block;
  overflow: hidden;
  border-radius: 24px;
}

.kitchen-guide-featured__image {
  width: 100%;
  height: 500px;
}

.kitchen-guide-featured:hover :deep(.guide-image img),
.kitchen-guide-list-item:hover :deep(.guide-image img) {
  transform: scale(1.1);
}

.kitchen-guide-featured__content {
  padding-top: 24px;
}

.kitchen-guide-meta {
  display: flex;
  align-items: center;
  gap: 11px;
  margin-bottom: 4px;
  color: #9f9fa4;
  font-family: var(--font-cjk-sans);
  font-size: 13px;
  line-height: 20px;
  text-transform: uppercase;
}

.kitchen-guide-meta span { color: #caa05c; }

.kitchen-guide-featured h3,
.kitchen-guide-list-item h3 {
  margin: 0;
  color: #1c1c1d;
  font-family: var(--font-cjk-serif);
  font-size: 25px;
  font-weight: 500;
  line-height: 36px;
}

.kitchen-guide-featured h3 {
  margin: 4px 0 19px;
}

.kitchen-guide-featured h3 a,
.kitchen-guide-list-item h3 a {
  color: inherit;
  transition: color .5s ease;
}

.kitchen-guide-featured h3 a:hover,
.kitchen-guide-list-item h3 a:hover {
  color: #caa05c;
}

.kitchen-guide-featured p,
.kitchen-guide-list-item p {
  margin: 0;
  color: #59585d;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 26px;
}

.kitchen-guide-featured p {
  display: -webkit-box;
  overflow: hidden;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
}

.kitchen-guide-list {
  min-width: 0;
}

.kitchen-guide-list-item {
  display: flex;
  padding-bottom: 29px;
  border-bottom: 1px solid #e3e3e8;
}

.kitchen-guide-list-item + .kitchen-guide-list-item { padding-top: 29px; }
.kitchen-guide-list-item:last-child { padding-bottom: 0; border-bottom: 0; }

.kitchen-guide-list-item__image-link {
  width: 46%;
  flex: 0 0 46%;
  margin-right: 30px;
}

.kitchen-guide-list-item__image {
  width: 100%;
  aspect-ratio: 1.4;
}

.kitchen-guide-list-item__content {
  width: 62%;
  min-width: 0;
}

.kitchen-guide-list-item h3 {
  display: -webkit-box;
  overflow: hidden;
  margin: 0 0 20px;
  text-overflow: ellipsis;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
}

.kitchen-guide-list-item p {
  display: -webkit-box;
  overflow: hidden;
  text-overflow: ellipsis;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
}

@media (max-width: 1366px) {
  .kitchen-guide-newsroom { padding-top: 100px; padding-bottom: 100px; }
  .kitchen-guide-posts { gap: 30px; }
  .kitchen-guide-featured__image { height: 440px; }
}

@media (max-width: 1024px) {
  .kitchen-guide-newsroom { padding-top: 80px; padding-bottom: 80px; }
  .kitchen-guide-heading { margin-bottom: 45px; }
  .kitchen-guide-heading h2 { font-size: 45px; line-height: 50px; }
  .kitchen-guide-featured { display: none; }
  .kitchen-guide-posts { display: block; }
  .kitchen-guide-list { width: 100%; }
}

@media (max-width: 767px) {
  .kitchen-guide-hero {
    min-height: 288px;
    background-attachment: scroll;
  }

  .kitchen-guide-hero__inner {
    width: calc(100% - 30px);
    padding: 80px 0 60px;
  }

  .kitchen-guide-hero h1 {
    margin-bottom: 25px;
    font-size: 48px;
    line-height: 52px;
  }

  .kitchen-guide-newsroom { padding: 60px 93px 60px 15px; }
  .kitchen-guide-newsroom__rail { padding-inline: 0; }

  .kitchen-guide-heading {
    display: block;
    margin-bottom: 35px;
  }

  .kitchen-guide-heading__label {
    margin-bottom: 25px;
  }

  .kitchen-guide-heading h2 {
    margin: 20px 0 0;
    padding: 0;
    font-size: 30px;
    line-height: 35px;
    text-align: center;
  }

  .kitchen-guide-list-item {
    display: block;
    padding-bottom: 29px;
  }

  .kitchen-guide-list-item + .kitchen-guide-list-item { padding-top: 29px; }

  .kitchen-guide-list-item__image-link,
  .kitchen-guide-list-item__content {
    width: 100%;
  }

  .kitchen-guide-list-item__image-link { margin: 0; }
  .kitchen-guide-list-item__content { margin-top: 15px; }

  .kitchen-guide-list-item h3 {
    font-size: 25px;
    line-height: 36px;
  }
}

@media (prefers-reduced-motion: reduce) {
  .kitchen-guide-featured h3 a,
  .kitchen-guide-list-item h3 a { transition: none; }

  .kitchen-guide-featured:hover :deep(.guide-image img),
  .kitchen-guide-list-item:hover :deep(.guide-image img) { transform: none; }
}
</style>
