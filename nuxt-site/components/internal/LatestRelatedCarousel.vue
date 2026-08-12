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
  <section class="latest-related" aria-label="最新消息文章輪播" v-reveal="{ anim: 'opalMoveUp' }">
    <div ref="viewport" class="latest-related__viewport" aria-roledescription="carousel" aria-label="最新消息文章輪播">
      <div class="latest-related__track">
        <article v-for="article in articles" :key="article.id" class="latest-related__slide">
          <NuxtLink
            :to="article.legacyPath"
            class="latest-related__card"
            :aria-current="article.id === currentId ? 'page' : undefined"
          >
            <div class="latest-related__transition">
              <div class="latest-related__media">
                <InternalNewsImage :src="article.cover" :alt="`${article.title}文章封面`" />
              </div>
              <span class="latest-related__category">{{ article.categoryLabel }}</span>
            </div>
            <div class="latest-related__text-box">
              <h3>{{ article.title }}</h3>
              <span class="latest-related__location">{{ article.categoryLabel }}</span>
              <time :datetime="article.publishedAt">{{ article.publishedAt.slice(0, 4) }}</time>
            </div>
          </NuxtLink>
        </article>
      </div>
    </div>
  </section>
</template>

<style scoped>
.latest-related {
  width: min(1410px, calc(100% - 60px));
  margin-inline: auto;
  padding: 0 0 108px;
}

.latest-related__viewport { overflow: hidden; }

.latest-related__track {
  display: flex;
  margin-left: -30px;
  touch-action: pan-y pinch-zoom;
}

.latest-related__slide {
  min-width: 0;
  flex: 0 0 33.333333%;
  padding-left: 30px;
}

.latest-related__card { display: block; color: inherit; }

.latest-related__transition {
  position: relative;
  overflow: hidden;
  border-radius: 24px;
}

.latest-related__transition::after {
  position: absolute;
  z-index: 1;
  inset: 0;
  border-radius: inherit;
  background: rgba(0,0,0,.15);
  content: "";
  transition: background-color .5s ease;
}

.latest-related__media {
  aspect-ratio: .8333333333;
  background: #e3e3e8;
}

.latest-related__media :deep(.antra-news-image) { width: 100%; height: 100%; }

.latest-related__category {
  position: absolute;
  top: 31px;
  left: 30px;
  z-index: 2;
  display: inline-flex;
  min-height: 30px;
  align-items: center;
  padding: 8px 15px;
  border: 1px solid rgba(255,255,255,.46);
  border-radius: 100px;
  color: #fff;
  background: transparent;
  font-family: "Cal Sans", sans-serif;
  font-size: 13px;
  line-height: 14px;
  text-transform: uppercase;
}

.latest-related__card:hover :deep(.antra-news-image img) { transform: scale(1.05); }
.latest-related__card:hover .latest-related__transition::after { background: rgba(0,0,0,.25); }

.latest-related__text-box { padding-top: 23px; }

.latest-related__location,
.latest-related__card time {
  display: block;
  color: #59585d;
  font-size: 16px;
  line-height: 24px;
}

.latest-related__card h3 {
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

.latest-related__card:hover h3,
.latest-related__card:focus-visible h3 { color: #caa05c; }

.latest-related__card:focus-visible {
  outline: 2px solid #caa05c;
  outline-offset: 6px;
  border-radius: 24px;
}

@media (max-width: 1024px) {
  .latest-related { padding-bottom: 80px; }
  .latest-related__slide { flex-basis: 50%; }
}

@media (max-width: 767px) {
  .latest-related {
    width: calc(100% - 30px);
    padding-bottom: 60px;
  }

  .latest-related__track { margin-left: -15px; }
  .latest-related__slide { flex-basis: 88%; padding-left: 15px; }
  .latest-related__transition { border-radius: 18px; }
  .latest-related__category { top: 20px; left: 15px; }
  .latest-related__card h3 { font-size: 26px; line-height: 26px; }
}

@media (prefers-reduced-motion: reduce) {
  .latest-related__transition::after,
  .latest-related__card h3 { transition: none; }

  .latest-related__card:hover :deep(.antra-news-image img) { transform: none; }
}
</style>
