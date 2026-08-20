<script setup lang="ts">
import emblaCarouselVue from 'embla-carousel-vue'
import type { NewsArticleSummary } from '~/types/content'

defineProps<{
  articles: NewsArticleSummary[]
  currentId: string
}>()

const [viewport] = emblaCarouselVue({ loop: true, align: 'start', duration: 24 })
</script>

<template>
  <section class="media-related" aria-label="媒體影音文章輪播" v-reveal="{ anim: 'opalMoveUp' }">
    <div ref="viewport" class="media-related__viewport" aria-roledescription="carousel" aria-label="媒體影音文章輪播">
      <div class="media-related__track">
        <article v-for="article in articles" :key="article.id" class="media-related__slide">
          <NuxtLink
            :to="article.legacyPath"
            class="media-related__card"
            :aria-current="article.id === currentId ? 'page' : undefined"
          >
            <div class="media-related__transition">
              <div class="media-related__media">
                <InternalNewsImage :src="article.cover" :alt="`${article.title}影片封面`" />
              </div>
              <span class="media-related__category">{{ article.categoryLabel }}</span>
            </div>
            <div class="media-related__text-box">
              <time :datetime="article.publishedAt">{{ article.displayDate }}</time>
              <h3>{{ article.title }}</h3>
            </div>
          </NuxtLink>
        </article>
      </div>
    </div>
  </section>
</template>

<style scoped>
.media-related {
  width: min(1410px, calc(100% - 60px));
  margin-inline: auto;
  padding: 0 0 108px;
}

.media-related__viewport { overflow: hidden; }

.media-related__track {
  display: flex;
  margin-left: -40px;
  touch-action: pan-y pinch-zoom;
}

.media-related__slide {
  min-width: 0;
  flex: 0 0 33.333333%;
  padding-left: 40px;
}

.media-related__card { display: block; color: inherit; }

.media-related__transition {
  position: relative;
  overflow: hidden;
  border-radius: 24px;
}

.media-related__media {
  aspect-ratio: 1.40625;
  background: #e3e3e8;
}

.media-related__media :deep(.antra-news-image) { width: 100%; height: 100%; }

.media-related__category {
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
  font-family: var(--font-cjk-serif);
  font-size: 14px;
  line-height: 14px;
}

.media-related__card:hover :deep(.antra-news-image img) { transform: scale(1.1); }

.media-related__text-box {
  width: 90%;
  padding-top: 19px;
}

.media-related__card time {
  display: block;
  margin-bottom: 3px;
  color: #9f9fa4;
  font-family: var(--font-cjk-sans);
  font-size: 14px;
  font-weight: 500;
  line-height: 24px;
}

.media-related__card h3 {
  display: -webkit-box;
  margin: 0;
  overflow: hidden;
  color: #1c1c1d;
  font-family: var(--font-cjk-serif);
  font-size: 25px;
  font-weight: 400;
  line-height: 32px;
  transition: color .3s ease;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
}

.media-related__card:hover h3,
.media-related__card:focus-visible h3 { color: #caa05c; }

.media-related__card:focus-visible {
  border-radius: 24px;
  outline: 2px solid #caa05c;
  outline-offset: 6px;
}

@media (max-width: 1024px) {
  .media-related { padding-bottom: 80px; }
  .media-related__slide { flex-basis: 50%; }
}

@media (max-width: 767px) {
  .media-related {
    width: calc(100% - 30px);
    padding-bottom: 60px;
  }

  .media-related__track { margin-left: -15px; }
  .media-related__slide { flex-basis: 88%; padding-left: 15px; }
  .media-related__transition { border-radius: 18px; }
  .media-related__category { top: 20px; left: 15px; }
  .media-related__text-box { width: 100%; }
  .media-related__card h3 { font-size: 22px; line-height: 28px; }
}

@media (prefers-reduced-motion: reduce) {
  .media-related__card h3 { transition: none; }

  .media-related__card:hover :deep(.antra-news-image img) { transform: none; }
}
</style>
