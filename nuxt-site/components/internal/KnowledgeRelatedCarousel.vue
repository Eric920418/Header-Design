<script setup lang="ts">
import emblaCarouselVue from 'embla-carousel-vue'
import type { NewsArticleSummary } from '~/types/content'

defineProps<{
  articles: NewsArticleSummary[]
}>()

const [viewport] = emblaCarouselVue({ loop: false, align: 'start', duration: 24 })
</script>

<template>
  <section class="knowledge-related" aria-label="延伸優惠消息文章" v-reveal="{ anim: 'opalMoveUp' }">
    <div ref="viewport" class="knowledge-related__viewport" aria-roledescription="carousel" aria-label="延伸優惠消息文章">
      <div class="knowledge-related__track">
        <article v-for="article in articles" :key="article.id" class="knowledge-related__slide">
          <NuxtLink :to="article.legacyPath" class="knowledge-related__card">
            <div class="knowledge-related__transition">
              <div class="knowledge-related__media">
                <InternalNewsImage :src="article.cover" :alt="`${article.title}文章封面`" />
              </div>
              <span class="knowledge-related__category">{{ article.categoryLabel }}</span>
            </div>
            <div class="knowledge-related__text-box">
              <h3>{{ article.title }}</h3>
              <span>{{ article.categoryLabel }}</span>
              <time :datetime="article.publishedAt">{{ article.publishedAt.slice(0, 4) }}</time>
            </div>
          </NuxtLink>
        </article>
      </div>
    </div>
  </section>
</template>

<style scoped>
.knowledge-related {
  width: min(1410px, calc(100% - 60px));
  margin-inline: auto;
  padding: 0 0 108px;
}

.knowledge-related__viewport { overflow: hidden; }

.knowledge-related__track {
  display: flex;
  margin-left: -30px;
  touch-action: pan-y pinch-zoom;
}

.knowledge-related__slide {
  min-width: 0;
  flex: 0 0 33.333333%;
  padding-left: 30px;
}

.knowledge-related__card {
  display: block;
  color: inherit;
}

.knowledge-related__transition {
  position: relative;
  overflow: hidden;
  border-radius: 24px;
}

.knowledge-related__transition::after {
  position: absolute;
  z-index: 1;
  inset: 0;
  border-radius: inherit;
  background: rgb(0 0 0 / 15%);
  content: "";
  transition: background-color .5s ease;
}

.knowledge-related__media {
  aspect-ratio: .8333333333;
  background: #e3e3e8;
}

.knowledge-related__media :deep(.antra-news-image) { width: 100%; height: 100%; }

.knowledge-related__category {
  position: absolute;
  top: 31px;
  left: 30px;
  z-index: 2;
  display: inline-flex;
  min-height: 30px;
  align-items: center;
  padding: 8px 15px;
  border: 1px solid rgb(255 255 255 / 46%);
  border-radius: 100px;
  color: #fff;
  font-family: "Cal Sans", sans-serif;
  font-size: 13px;
  line-height: 14px;
  text-transform: uppercase;
}

.knowledge-related__text-box { padding-top: 23px; }

.knowledge-related__text-box > span,
.knowledge-related__text-box time {
  display: block;
  color: #59585d;
  font-size: 16px;
  line-height: 24px;
}

.knowledge-related__text-box h3 {
  display: -webkit-box;
  margin: 0 0 14px;
  overflow: hidden;
  color: #1c1c1d;
  font-family: "Cal Sans", sans-serif;
  font-size: 30px;
  font-weight: 400;
  line-height: 34px;
  transition: color .3s ease;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
}

.knowledge-related__card:hover :deep(.antra-news-image img) { transform: scale(1.05); }
.knowledge-related__card:hover .knowledge-related__transition::after { background: rgb(0 0 0 / 25%); }
.knowledge-related__card:hover h3,
.knowledge-related__card:focus-visible h3 { color: #caa05c; }

.knowledge-related__card:focus-visible {
  border-radius: 24px;
  outline: 2px solid #caa05c;
  outline-offset: 6px;
}

@media (max-width: 1024px) {
  .knowledge-related { padding-bottom: 80px; }
  .knowledge-related__slide { flex-basis: 50%; }
}

@media (max-width: 767px) {
  .knowledge-related {
    width: calc(100% - 30px);
    padding-bottom: 60px;
  }

  .knowledge-related__track { margin-left: -15px; }
  .knowledge-related__slide { flex-basis: 88%; padding-left: 15px; }
  .knowledge-related__transition { border-radius: 18px; }
  .knowledge-related__category { top: 20px; left: 15px; }
  .knowledge-related__text-box h3 { font-size: 26px; line-height: 28px; }
}

@media (prefers-reduced-motion: reduce) {
  .knowledge-related__transition::after,
  .knowledge-related__text-box h3 { transition: none; }

  .knowledge-related__card:hover :deep(.antra-news-image img) { transform: none; }
}
</style>
