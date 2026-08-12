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
              <h3>{{ article.title }}</h3>
              <span class="media-related__location">{{ article.categoryLabel }}</span>
              <time :datetime="article.publishedAt">{{ article.publishedAt.slice(0, 4) }}</time>
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
  margin-left: -30px;
  touch-action: pan-y pinch-zoom;
}

.media-related__slide {
  min-width: 0;
  flex: 0 0 33.333333%;
  padding-left: 30px;
}

.media-related__card { display: block; color: inherit; }

.media-related__transition {
  position: relative;
  overflow: hidden;
  border-radius: 24px;
}

.media-related__transition::after {
  position: absolute;
  z-index: 1;
  inset: 0;
  border-radius: inherit;
  background: rgba(0, 0, 0, .15);
  content: "";
  transition: background-color .5s ease;
}

.media-related__media {
  aspect-ratio: .8333333333;
  background: #e3e3e8;
}

.media-related__media :deep(.antra-news-image) { width: 100%; height: 100%; }

.media-related__category {
  position: absolute;
  top: 31px;
  left: 30px;
  z-index: 2;
  display: inline-flex;
  min-height: 30px;
  align-items: center;
  padding: 8px 15px;
  border: 1px solid rgba(255, 255, 255, .46);
  border-radius: 100px;
  color: #fff;
  background: transparent;
  font-family: "Cal Sans", sans-serif;
  font-size: 13px;
  line-height: 14px;
  text-transform: uppercase;
}

.media-related__card:hover :deep(.antra-news-image img) { transform: scale(1.05); }
.media-related__card:hover .media-related__transition::after { background: rgba(0, 0, 0, .25); }

.media-related__text-box { padding-top: 23px; }

.media-related__location,
.media-related__card time {
  display: block;
  color: #59585d;
  font-size: 16px;
  line-height: 24px;
}

.media-related__card h3 {
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
  .media-related__card h3 { font-size: 26px; line-height: 30px; }
}

@media (prefers-reduced-motion: reduce) {
  .media-related__transition::after,
  .media-related__card h3 { transition: none; }

  .media-related__card:hover :deep(.antra-news-image img) { transform: none; }
}
</style>
