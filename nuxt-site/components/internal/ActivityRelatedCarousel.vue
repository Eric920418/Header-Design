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
  <section class="activity-related" aria-label="優惠活動文章輪播" v-reveal="{ anim: 'opalMoveUp' }">
    <div ref="viewport" class="activity-related__viewport" aria-roledescription="carousel" aria-label="優惠活動文章輪播">
      <div class="activity-related__track">
        <article v-for="article in articles" :key="article.id" class="activity-related__slide">
          <NuxtLink
            :to="article.legacyPath"
            class="activity-related__card"
            :aria-current="article.id === currentId ? 'page' : undefined"
          >
            <div class="activity-related__transition">
              <div class="activity-related__media">
                <InternalNewsImage :src="article.cover" :alt="`${article.title}文章封面`" />
              </div>
              <span class="activity-related__category">{{ article.categoryLabel }}</span>
            </div>
            <div class="activity-related__text-box">
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
.activity-related {
  width: min(1410px, calc(100% - 60px));
  margin-inline: auto;
  padding: 0 0 108px;
}

.activity-related__viewport { overflow: hidden; }

.activity-related__track {
  display: flex;
  margin-left: -40px;
  touch-action: pan-y pinch-zoom;
}

.activity-related__slide {
  min-width: 0;
  flex: 0 0 33.333333%;
  padding-left: 40px;
}

.activity-related__card {
  display: block;
  color: inherit;
}

.activity-related__transition {
  position: relative;
  overflow: hidden;
  border-radius: 24px;
}

.activity-related__media {
  aspect-ratio: 1.40625;
  background: #e3e3e8;
}

.activity-related__media :deep(.antra-news-image) { width: 100%; height: 100%; }

.activity-related__category {
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

.activity-related__card:hover :deep(.antra-news-image img) { transform: scale(1.1); }

.activity-related__text-box {
  width: 90%;
  padding-top: 19px;
}

.activity-related__card time {
  display: block;
  margin-bottom: 3px;
  color: #9f9fa4;
  font-family: var(--font-cjk-sans);
  font-size: 14px;
  font-weight: 500;
  line-height: 24px;
}

.activity-related__card h3 {
  display: -webkit-box;
  margin: 0;
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

.activity-related__card:hover h3,
.activity-related__card:focus-visible h3 { color: #caa05c; }

.activity-related__card:focus-visible {
  outline: 2px solid #caa05c;
  outline-offset: 6px;
  border-radius: 24px;
}

@media (max-width: 1024px) {
  .activity-related { padding: 0 0 80px; }
  .activity-related__slide { flex-basis: 50%; }
}

@media (max-width: 767px) {
  .activity-related {
    width: calc(100% - 30px);
    padding: 0 0 60px;
  }

  .activity-related__track { margin-left: -15px; }
  .activity-related__slide { flex-basis: 88%; padding-left: 15px; }
  .activity-related__transition { border-radius: 18px; }
  .activity-related__category { top: 20px; left: 15px; }
  .activity-related__text-box { width: 100%; }
  .activity-related__card h3 { font-size: 20px; line-height: 30px; }
}

@media (prefers-reduced-motion: reduce) {
  .activity-related__card h3 { transition: none; }

  .activity-related__card:hover :deep(.antra-news-image img) { transform: none; }
}
</style>
