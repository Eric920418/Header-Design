<script setup lang="ts">
import emblaCarouselVue from 'embla-carousel-vue'
import { ArrowUpRight } from 'lucide-vue-next'
import type { KitchenGuideArticle, NewsArticleSummary } from '~/types/content'

type RelatedArticle = KitchenGuideArticle | NewsArticleSummary

const props = withDefaults(defineProps<{
  articles: RelatedArticle[]
  variant?: 'cards' | 'home07'
}>(), {
  variant: 'cards',
})

const home07Articles = computed(() => props.articles.slice(0, 2))
const articleRoute = (article: RelatedArticle) => 'legacyPath' in article
  ? article.legacyPath
  : article.detailRoute || '/knowledge'
const isKitchenGuide = (article: RelatedArticle): article is KitchenGuideArticle => 'detailRoute' in article

const [viewport] = emblaCarouselVue({ loop: false, align: 'start', duration: 24 })
</script>

<template>
  <section v-if="variant === 'home07'" class="knowledge-related knowledge-related--home07" aria-label="延伸文章">
    <header class="knowledge-related-home07__intro" v-reveal="{ anim: 'opalMoveRight' }">
      <InternalSectionPill>Straight From The Newsroom</InternalSectionPill>
      <h2>Take A Look At<br><em>Our Latest Blog</em><br>&amp; Articles!</h2>
      <p>Check out our latest blog posts and industry insights to stay informed about the latest trends, technologies, and project updates.</p>
      <NuxtLink to="/knowledge" class="knowledge-related-home07__cta">
        <span>Explore Blogs</span>
        <i><ArrowUpRight aria-hidden="true" /></i>
      </NuxtLink>
    </header>

    <article
      v-for="(article, index) in home07Articles"
      :key="article.id"
      class="knowledge-related-home07__article"
      v-reveal="{ anim: 'opalMoveUp', delay: 80 + index * 80 }"
    >
      <NuxtLink :to="articleRoute(article)" class="knowledge-related-home07__card">
        <div class="knowledge-related-home07__media">
          <InternalGuideImage v-if="isKitchenGuide(article)" :src="article.cover" :alt="`${article.title}文章封面`" />
          <InternalNewsImage v-else :src="article.cover" :alt="`${article.title}文章封面`" />
          <span>{{ article.categoryLabel }}</span>
        </div>
        <h3>{{ article.title }}</h3>
        <p class="knowledge-related-home07__excerpt">{{ article.excerpt }}</p>
      </NuxtLink>
    </article>
  </section>

  <section v-else class="knowledge-related" aria-label="延伸優惠消息文章" v-reveal="{ anim: 'opalMoveUp' }">
    <div ref="viewport" class="knowledge-related__viewport" aria-roledescription="carousel" aria-label="延伸優惠消息文章">
      <div class="knowledge-related__track">
        <article v-for="article in articles" :key="article.id" class="knowledge-related__slide">
          <NuxtLink :to="articleRoute(article)" class="knowledge-related__card">
            <div class="knowledge-related__transition">
              <div class="knowledge-related__media">
                <InternalGuideImage v-if="isKitchenGuide(article)" :src="article.cover" :alt="`${article.title}文章封面`" />
                <InternalNewsImage v-else :src="article.cover" :alt="`${article.title}文章封面`" />
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

.knowledge-related__media :deep(.antra-news-image),
.knowledge-related__media :deep(.guide-image) { width: 100%; height: 100%; }

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
  font-family: var(--font-ui);
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
  font-family: var(--font-display);
  font-size: 30px;
  font-weight: 400;
  line-height: 34px;
  transition: color .3s ease;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
}

.knowledge-related__card:hover :deep(.antra-news-image img),
.knowledge-related__card:hover :deep(.guide-image img) { transform: scale(1.05); }
.knowledge-related__card:hover .knowledge-related__transition::after { background: rgb(0 0 0 / 25%); }
.knowledge-related__card:hover h3,
.knowledge-related__card:focus-visible h3 { color: #caa05c; }

.knowledge-related__card:focus-visible {
  border-radius: 24px;
  outline: 2px solid #caa05c;
  outline-offset: 6px;
}

.knowledge-related--home07 {
  position: relative;
  display: grid;
  width: min(1410px, calc(100% - 60px));
  align-items: start;
  grid-template-columns: minmax(0, 1.02fr) repeat(2, minmax(0, 1fr));
  gap: 28px;
  overflow: hidden;
  padding: 70px 30px 108px;
  background:
    linear-gradient(30deg, transparent 49.7%, rgb(227 227 232 / 20%) 50%, transparent 50.3%) 0 0 / 180px 180px,
    linear-gradient(150deg, transparent 49.7%, rgb(227 227 232 / 20%) 50%, transparent 50.3%) 0 0 / 180px 180px;
}

.knowledge-related-home07__intro { padding: 0 26px 0 0; }


.knowledge-related-home07__intro h2 {
  margin: 31px 0 29px;
  color: #1c1c1d;
  font-family: var(--font-display);
  font-size: 52px;
  font-style: normal;
  font-weight: 400;
  line-height: 1.06;
  letter-spacing: -.02em;
}

.knowledge-related-home07__intro h2 em {
  color: #caa05c;
  font-style: normal;
}

.knowledge-related-home07__intro > p {
  max-width: 370px;
  margin: 0;
  color: #59585d;
  font-family: var(--font-sans);
  font-size: 15px;
  line-height: 24px;
}

.knowledge-related-home07__cta {
  display: inline-flex;
  min-height: 54px;
  align-items: center;
  gap: 12px;
  margin-top: 44px;
  padding: 4px 5px 4px 24px;
  border: 1px solid #9f9fa4;
  border-radius: 999px;
  color: #1c1c1d;
  font-family: var(--font-ui);
  font-size: 14px;
  line-height: 20px;
  transition: color .3s ease, border-color .3s ease;
}

.knowledge-related-home07__cta i {
  display: grid;
  width: 44px;
  height: 44px;
  border-radius: 50%;
  color: #fff;
  background: #caa05c;
  place-items: center;
  transition: background-color .3s ease, transform .3s ease;
}

.knowledge-related-home07__cta svg { width: 18px; height: 18px; }
.knowledge-related-home07__cta:hover,
.knowledge-related-home07__cta:focus-visible { border-color: #caa05c; color: #caa05c; }
.knowledge-related-home07__cta:hover i { background: #1c1c1d; transform: translate(2px, -2px); }

.knowledge-related-home07__card {
  display: block;
  color: inherit;
}

.knowledge-related-home07__media {
  position: relative;
  aspect-ratio: 1.4;
  overflow: hidden;
  border-radius: 24px;
  background: #e3e3e8;
}

.knowledge-related-home07__media :deep(.antra-news-image),
.knowledge-related-home07__media :deep(.guide-image) { width: 100%; height: 100%; }

.knowledge-related-home07__media > span {
  position: absolute;
  top: 20px;
  left: 20px;
  z-index: 2;
  display: inline-flex;
  min-height: 30px;
  align-items: center;
  padding: 7px 14px;
  border-radius: 999px;
  color: #fff;
  background: #caa05c;
  font-family: var(--font-cjk-sans);
  font-size: 12px;
  line-height: 16px;
}

.knowledge-related-home07__article h3 {
  display: -webkit-box;
  margin: 0;
  overflow: hidden;
  color: #1c1c1d;
  font-family: var(--font-cjk-serif);
  margin-top: 18px;
  font-size: 20px;
  font-weight: 500;
  line-height: 30px;
  transition: color .3s ease;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
}

.knowledge-related-home07__excerpt {
  display: -webkit-box;
  margin: 16px 0 0;
  overflow: hidden;
  color: #59585d;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  line-height: 25px;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
}

.knowledge-related-home07__card:hover :deep(.antra-news-image img),
.knowledge-related-home07__card:hover :deep(.guide-image img) { transform: scale(1.05); }
.knowledge-related-home07__card:hover h3,
.knowledge-related-home07__card:focus-visible h3 { color: #caa05c; }

.knowledge-related-home07__card:focus-visible {
  border-radius: 24px;
  outline: 2px solid #caa05c;
  outline-offset: 6px;
}

@media (max-width: 1024px) {
  .knowledge-related { padding-bottom: 80px; }
  .knowledge-related__slide { flex-basis: 50%; }
  .knowledge-related--home07 { grid-template-columns: repeat(2, minmax(0, 1fr)); }
  .knowledge-related-home07__intro { grid-column: 1 / -1; padding: 0 0 25px; }
  .knowledge-related-home07__intro h2 { font-size: 48px; }
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

  .knowledge-related--home07 {
    width: calc(100% - 108px);
    grid-template-columns: 1fr;
    gap: 38px;
    margin-right: auto;
    margin-left: 15px;
    padding: 55px 15px 60px;
  }

  .knowledge-related-home07__intro { padding-bottom: 3px; }
  .knowledge-related-home07__intro h2 { margin-block: 26px 22px; font-size: 40px; }
  .knowledge-related-home07__intro > p { max-width: 100%; }
  .knowledge-related-home07__cta { margin-top: 32px; }
  .knowledge-related-home07__media { border-radius: 18px; }
  .knowledge-related-home07__article h3 { font-size: 20px; line-height: 30px; }
}

@media (prefers-reduced-motion: reduce) {
  .knowledge-related__transition::after,
  .knowledge-related__text-box h3,
  .knowledge-related-home07__cta,
  .knowledge-related-home07__cta i,
  .knowledge-related-home07__article h3 { transition: none; }

  .knowledge-related__card:hover :deep(.antra-news-image img),
  .knowledge-related__card:hover :deep(.guide-image img),
  .knowledge-related-home07__card:hover :deep(.antra-news-image img),
  .knowledge-related-home07__card:hover :deep(.guide-image img) { transform: none; }
}
</style>
