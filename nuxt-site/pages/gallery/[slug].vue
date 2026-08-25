<script setup lang="ts">
import emblaCarouselVue from 'embla-carousel-vue'
import { ArrowLeft, ArrowRight, CalendarClock, MapPin, Phone } from 'lucide-vue-next'
import { getStoreCase, storeCases } from '~/data/storeCases'

const route = useRoute()
const slug = String(route.params.slug)
const item = getStoreCase(slug)

if (!item) {
  throw createError({ statusCode: 404, message: `案例「${slug}」不存在或尚未公開。` })
}

const index = storeCases.findIndex(entry => entry.slug === item.slug)
const previous = storeCases[(index - 1 + storeCases.length) % storeCases.length]!
const next = storeCases[(index + 1) % storeCases.length]!

const metaLabels: Record<string, string> = {
  style: '設計風格',
  color: '設計顏色',
  series: '設計系列',
  form: '設計形式',
  size: '設計尺寸',
  kitchenArea: '廚房坪數',
  budget: '廚具預算',
  countertop: '檯面材質',
  household: '家的組成',
  designer: '設計師',
}

const metaOrder = ['style', 'color', 'series', 'form', 'size', 'kitchenArea', 'budget', 'countertop', 'household', 'designer']
const metaEntries = metaOrder
  .map(key => [key, item.meta?.[key as keyof typeof item.meta]] as const)
  .filter((entry): entry is readonly [string, string] => Boolean(entry[1]))
const description = item.article?.[0]?.paragraphs[0] ?? `${item.storeName}設計案例，設計師 ${item.designer}。`
const fromDesignInspiration = computed(() => route.query.from === 'inspiration')
const detailRoute = (slug: string) => fromDesignInspiration.value
  ? { path: `/gallery/${slug}`, query: { from: 'inspiration' } }
  : `/gallery/${slug}`
const [relatedViewport] = emblaCarouselVue({ loop: true, align: 'start', duration: 18 })

useSeoMeta({
  title: `${item.title}｜SAKURA 整體廚房`,
  description,
  ogTitle: item.title,
  ogDescription: description,
  ogImage: item.images[0],
  ogType: 'article',
})

useHead({
  link: [{ rel: 'canonical', href: `/gallery/${item.slug}` }],
})
</script>

<template>
  <main class="case-detail-page">
    <InternalCaseBreadcrumbHero />

    <section class="case-detail-content" :aria-labelledby="`case-title-${item.slug}`">
      <div class="case-detail-rail internal-rail-safe">
        <div class="case-detail-layout">
          <header class="case-detail-header" v-reveal="{ anim: 'opalMoveUp' }">
            <h1 :id="`case-title-${item.slug}`">{{ item.title }}</h1>
          </header>

          <div class="case-detail-carousel" v-reveal="{ anim: 'opalScaleUp', delay: 100 }">
            <InternalCaseCarousel :images="item.images" :title="item.title" />
          </div>

          <aside v-if="item.meta || item.contact" class="case-detail-sidebar" aria-label="案例規格與門市資訊">
            <div class="case-detail-sidebar__sticky">
              <a
                :href="item.contact?.reservationUrl ?? item.reservationUrl"
                target="_blank"
                rel="noopener noreferrer"
                class="case-detail-booking site-content-cta group/cta"
                v-reveal="{ anim: 'opalMoveLeft' }"
              >
                <span>到店預約</span>
                <span class="site-cta-icon"><ArrowRight aria-hidden="true" /></span>
              </a>

              <section v-if="metaEntries.length" class="case-detail-widget" aria-labelledby="case-spec-title" v-reveal="{ anim: 'opalMoveLeft', delay: 80 }">
                <h2 id="case-spec-title">案例規格</h2>
                <dl class="case-detail-specs">
                  <div v-for="([key, value]) in metaEntries" :key="key">
                    <dt>{{ metaLabels[key] ?? key }}</dt>
                    <dd>{{ value }}</dd>
                  </div>
                </dl>
              </section>

              <section v-if="item.contact" class="case-detail-widget" aria-labelledby="case-store-title" v-reveal="{ anim: 'opalMoveLeft', delay: 160 }">
                <h2 id="case-store-title">門市資訊</h2>
                <h3>{{ item.contact.name }}</h3>
                <ul class="case-detail-contact-list">
                  <li v-if="item.contact.hours"><CalendarClock aria-hidden="true" /><span>{{ item.contact.hours }}</span></li>
                  <li v-if="item.contact.phone"><Phone aria-hidden="true" /><a :href="`tel:${item.contact.phone.replace(/[^\d+]/g, '')}`">{{ item.contact.phone }}</a></li>
                  <li v-if="item.contact.address"><MapPin aria-hidden="true" /><span>{{ item.contact.address }}</span></li>
                </ul>
                <div class="case-detail-contact-links">
                  <a v-if="item.contact.lineUrl" :href="item.contact.lineUrl" target="_blank" rel="noopener noreferrer">LINE 諮詢</a>
                  <a v-if="item.contact.mapUrl" :href="item.contact.mapUrl" target="_blank" rel="noopener noreferrer">Google Map</a>
                </div>

                <InternalCaseMap
                  v-if="item.contact.address && item.contact.mapUrl"
                  :address="item.contact.address"
                  :fallback-url="item.contact.mapUrl"
                  :store-name="item.contact.name"
                  class="case-detail-map"
                />
              </section>
            </div>
          </aside>

          <article v-if="item.article?.length" class="case-detail-story" aria-label="案例設計故事">
            <section
              v-for="(block, blockIndex) in item.article"
              :key="block.title ?? `intro-${blockIndex}`"
              class="case-detail-story-block"
              v-reveal="{ anim: 'opalMoveUp' }"
            >
              <h2 v-if="block.title">{{ block.title }}</h2>
              <p v-for="paragraph in block.paragraphs" :key="paragraph">{{ paragraph }}</p>
              <div
                v-if="block.images?.length"
                class="case-detail-story-media"
                :class="{ 'case-detail-story-media--pair': block.imageLayout === 'pair' }"
                v-reveal="{ anim: 'opalScaleUp', delay: 100 }"
              >
                <InternalCaseImage
                  v-for="(image, imageIndex) in block.images"
                  :key="image"
                  :src="image"
                  :alt="`${item.title}文章照片 ${blockIndex + 1}-${imageIndex + 1}`"
                  class="case-detail-story-image"
                />
              </div>
              <div v-if="block.links?.length" class="case-detail-story-links">
                <a v-for="link in block.links" :key="link.url" :href="link.url" target="_blank" rel="noopener noreferrer">{{ link.label }}</a>
              </div>
            </section>
          </article>

          <nav aria-label="前後案例" class="case-detail-navigation" v-reveal="{ anim: 'opalMoveUp' }">
            <NuxtLink :to="detailRoute(previous.slug)" class="case-detail-navigation__previous">
              <span><ArrowLeft aria-hidden="true" />Previous Post</span>
              <strong>{{ previous.title }}</strong>
            </NuxtLink>
            <NuxtLink :to="detailRoute(next.slug)" class="case-detail-navigation__next">
              <span>Next Post<ArrowRight aria-hidden="true" /></span>
              <strong>{{ next.title }}</strong>
            </NuxtLink>
          </nav>

          <section v-if="item.reviews?.length" class="case-detail-reviews" aria-labelledby="case-reviews-title" v-reveal="{ anim: 'opalMoveUp' }">
            <h2 id="case-reviews-title">顧客評論</h2>
            <ol class="case-detail-review-list">
              <li v-for="(review, reviewIndex) in item.reviews" :key="reviewIndex">
                <blockquote>{{ review }}</blockquote>
              </li>
            </ol>
          </section>
        </div>

        <section class="case-detail-related" aria-labelledby="related-cases-title">
          <div class="case-detail-related__heading">
            <InternalTemplateHeadingRail v-reveal="{ anim: 'opalMoveRight' }" label="straight from the newsroom" class="case-detail-related__label-wrap" />
            <h2 id="related-cases-title" v-reveal="{ anim: 'opalMoveLeft' }">Take a look at our latest blog &amp; articles.</h2>
          </div>
          <div ref="relatedViewport" class="case-detail-related__viewport" aria-label="相關案例輪播">
            <div class="case-detail-related__track">
              <div v-for="(related, relatedIndex) in storeCases" :key="related.slug" class="case-detail-related__slide">
                <InternalCaseRecommendationCard
                  :item="related"
                  :featured="relatedIndex === 1"
                  :reveal-delay="relatedIndex * 100"
                  :source="fromDesignInspiration ? 'inspiration' : undefined"
                />
              </div>
            </div>
          </div>
        </section>
      </div>
    </section>
  </main>
</template>

<style scoped>
.case-detail-page { color: #59585d; background: #f6f6f6; }
.case-detail-content { padding: 100px 30px 108px; overflow: clip; }
.case-detail-rail { box-sizing: border-box; width: min(1496px, 100%); margin-inline: auto; }
.case-detail-rail.internal-rail-safe { padding-inline: 43px; }

.case-detail-layout {
  display: grid;
  grid-template-columns: minmax(0, 2.273fr) minmax(300px, 1fr);
  grid-template-areas:
    "header sidebar"
    "carousel sidebar"
    "story sidebar"
    "navigation sidebar"
    "reviews sidebar";
  column-gap: clamp(30px, 4.7vw, 71px);
  align-items: start;
}

.case-detail-header { grid-area: header; padding-bottom: 40px; }
.case-detail-header h1 { max-width: 900px; color: #1c1c1d; font-family: var(--font-display); font-size: 38px; font-weight: 400; line-height: 50px; }
.case-detail-carousel { grid-area: carousel; min-width: 0; }

.case-detail-sidebar { grid-area: sidebar; min-width: 0; align-self: stretch; }
.case-detail-sidebar__sticky { position: sticky; top: 96px; }
.case-detail-booking { display: flex; width: 100%; height: 60px; align-items: center; justify-content: space-between; gap: 8px; padding: 9px 9px 9px 30px; border: 1px solid rgba(159,159,164,.64); border-radius: 999px; color: #1c1c1d; background: transparent; font-size: 15px; line-height: 22px; transition: color .3s ease, border-color .3s ease, background-color .3s ease; }
.case-detail-booking:hover { border-color: #caa05c; color: #fff; background: #caa05c; }
.case-detail-booking .site-cta-icon { display: flex; width: 40px; height: 40px; flex: 0 0 auto; align-items: center; justify-content: center; border-radius: 50%; color: #fff; background: #caa05c; transform: rotate(-45deg); transition: transform .5s ease; }
.case-detail-booking:hover .site-cta-icon { transform: rotate(0); }
.case-detail-booking :deep(svg) { width: 20px; height: 20px; }

.case-detail-widget { margin-top: 49px; }
.case-detail-widget h2 { margin-bottom: 25px; color: #1c1c1d; font-family: var(--font-display); font-size: 25px; font-weight: 400; line-height: 31px; }
.case-detail-widget h3 { color: #1c1c1d; font-family: var(--font-display); font-size: 20px; font-weight: 400; line-height: 26px; }
.case-detail-specs { border-top: 1px solid #e3e3e8; }
.case-detail-specs > div { display: grid; grid-template-columns: 112px minmax(0, 1fr); gap: 16px; align-items: center; min-height: 55px; padding: 12px 0; border-bottom: 1px solid #e3e3e8; }
.case-detail-specs dt { color: #9f9fa4; font-size: 15px; line-height: 22px; }
.case-detail-specs dd { color: #1c1c1d; font-family: var(--font-display); font-size: 16px; line-height: 24px; }
.case-detail-contact-list { display: grid; gap: 14px; margin-top: 20px; }
.case-detail-contact-list li { display: grid; grid-template-columns: 20px minmax(0, 1fr); gap: 11px; align-items: start; font-size: 15px; line-height: 23px; }
.case-detail-contact-list :deep(svg) { width: 19px; height: 19px; margin-top: 2px; color: #caa05c; }
.case-detail-contact-list a { color: #1c1c1d; transition: color .3s ease; }
.case-detail-contact-list a:hover { color: #caa05c; }
.case-detail-contact-links { display: flex; flex-wrap: wrap; gap: 10px 20px; margin-top: 21px; }
.case-detail-contact-links a { color: #1c1c1d; font-size: 14px; line-height: 22px; text-decoration: underline; text-underline-offset: 4px; transition: color .3s ease; }
.case-detail-contact-links a:hover { color: #caa05c; }
.case-detail-map { margin-top: 27px; }

.case-detail-story { grid-area: story; min-width: 0; margin-top: 62px; }
.case-detail-story-block + .case-detail-story-block { margin-top: 54px; }
.case-detail-story-block h2 { margin-bottom: 21px; color: #1c1c1d; font-family: var(--font-display); font-size: 25px; font-weight: 400; line-height: 31px; }
.case-detail-story-block p { color: #59585d; font-size: 16px; line-height: 24px; }
.case-detail-story-block p + p { margin-top: 16px; }
.case-detail-story-media { display: grid; grid-template-columns: 1fr; gap: 20px; margin-top: 31px; }
.case-detail-story-media--pair { grid-template-columns: repeat(2, minmax(0, 1fr)); }
.case-detail-story-image { width: 100%; aspect-ratio: 1.452 / 1; border-radius: 24px; }
.case-detail-story-media:not(.case-detail-story-media--pair) .case-detail-story-image { aspect-ratio: 16 / 9; }
.case-detail-story-links { display: grid; gap: 10px; margin-top: 24px; }
.case-detail-story-links a { width: fit-content; color: #1c1c1d; font-size: 15px; line-height: 24px; text-decoration: underline; text-decoration-color: #caa05c; text-underline-offset: 5px; transition: color .3s ease; }
.case-detail-story-links a:hover { color: #caa05c; }

.case-detail-navigation { grid-area: navigation; display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); margin-top: 61px; padding: 31px 0 29px; border-top: 1px solid #e3e3e8; border-bottom: 1px solid #e3e3e8; }
.case-detail-navigation a { min-width: 0; color: #1c1c1d; }
.case-detail-navigation__previous { padding-right: 30px; }
.case-detail-navigation__next { padding-left: 30px; border-left: 1px solid #e3e3e8; text-align: right; }
.case-detail-navigation span { display: flex; align-items: center; gap: 8px; color: #9f9fa4; font-family: var(--font-ui); font-size: 15px; line-height: 20px; }
.case-detail-navigation__next span { justify-content: flex-end; }
.case-detail-navigation span :deep(svg) { width: 16px; height: 16px; }
.case-detail-navigation strong { display: -webkit-box; overflow: hidden; margin-top: 12px; font-family: var(--font-display); font-size: 25px; font-weight: 400; line-height: 31px; transition: color .3s ease; -webkit-box-orient: vertical; -webkit-line-clamp: 2; }
.case-detail-navigation a:hover strong { color: #caa05c; }

.case-detail-reviews { grid-area: reviews; margin-top: 61px; }
.case-detail-reviews > h2 { color: #1c1c1d; font-family: var(--font-display); font-size: 25px; font-weight: 400; line-height: 31px; }
.case-detail-review-list { margin-top: 26px; border-top: 1px solid #e3e3e8; }
.case-detail-review-list li { padding: 24px 0; border-bottom: 1px solid #e3e3e8; }
.case-detail-review-list blockquote { color: #59585d; font-size: 16px; line-height: 26px; }

.case-detail-related { margin-top: 108px; padding-top: 100px; border-top: 1px solid #e3e3e8; }
.case-detail-related__heading { display: grid; grid-template-columns: 30% 70%; align-items: start; }
.case-detail-related__heading > h2 { padding: 64px 0 60px; color: #1c1c1d; font-family: var(--font-display); font-size: 60px; font-weight: 400; line-height: 64px; }
.case-detail-related__viewport { overflow: hidden; }
.case-detail-related__track { display: flex; gap: 30px; touch-action: pan-y pinch-zoom; }
.case-detail-related__slide { min-width: 0; flex: 0 0 calc((100% - 60px) / 3); }

@media (max-width: 1200px) and (min-width: 1025px) {
  .case-detail-content { padding-top: 80px; padding-bottom: 88px; }
  .case-detail-layout { column-gap: 30px; }
  .case-detail-sidebar { padding-right: 0; }
  .case-detail-header h1 { font-size: 38px; line-height: 50px; }
  .case-detail-story-block h2 { font-size: 25px; line-height: 31px; }
}

@media (max-width: 1024px) {
  .case-detail-content { padding: 80px 30px 88px; }
  .case-detail-layout { display: flex; flex-direction: column; }
  .case-detail-header { order: 1; width: 100%; }
  .case-detail-carousel { order: 2; width: 100%; }
  .case-detail-sidebar { order: 3; width: 100%; padding-right: 0; align-self: auto; }
  .case-detail-story { order: 4; width: 100%; }
  .case-detail-navigation { order: 5; width: 100%; }
  .case-detail-reviews { order: 6; width: 100%; }
  .case-detail-sidebar__sticky { position: static; display: grid; grid-template-columns: minmax(0, .8fr) minmax(0, 1.2fr); gap: 30px; margin-top: 60px; }
  .case-detail-booking { grid-column: 1 / -1; }
  .case-detail-widget { margin-top: 0; }
  .case-detail-related { margin-top: 88px; padding-top: 80px; }
  .case-detail-related__heading > h2 { padding: 50px 0 30px; font-size: 50px; line-height: 56px; }
  .case-detail-related__slide { flex-basis: calc((100% - 30px) / 2); }
}

@media (max-width: 767px) {
  .case-detail-content { padding: 60px 15px 68px; }
  .case-detail-rail.internal-rail-safe { padding-inline: 0; }
  .case-detail-header { padding-bottom: 30px; }
  .case-detail-header h1 { font-size: 25px; line-height: 34px; }
  .case-detail-sidebar__sticky { grid-template-columns: 1fr; gap: 42px; margin-top: 46px; }
  .case-detail-booking { grid-column: auto; }
  .case-detail-story { margin-top: 50px; }
  .case-detail-story-block + .case-detail-story-block { margin-top: 44px; }
  .case-detail-story-block h2 { margin-bottom: 17px; font-size: 25px; line-height: 31px; }
  .case-detail-story-media--pair { grid-template-columns: 1fr; }
  .case-detail-story-image,
  .case-detail-story-media:not(.case-detail-story-media--pair) .case-detail-story-image { aspect-ratio: 4 / 3; border-radius: 18px; }
  .case-detail-navigation { grid-template-columns: 1fr; margin-top: 50px; padding: 0; }
  .case-detail-navigation a { padding: 24px 0; }
  .case-detail-navigation__next { border-top: 1px solid #e3e3e8; border-left: 0; }
  .case-detail-reviews { margin-top: 50px; }
  .case-detail-reviews > h2 { font-size: 25px; line-height: 31px; }
  .case-detail-related { margin-top: 68px; padding-top: 60px; }
  .case-detail-related__heading { grid-template-columns: 1fr; }
  .case-detail-related__label-wrap { text-align: center; }
  .case-detail-related__heading > h2 { padding: 20px 0 30px; font-size: 40px; line-height: 46px; text-align: center; }
  .case-detail-related__viewport { margin-top: 38px; }
  .case-detail-related__track { gap: 15px; }
  .case-detail-related__slide { flex-basis: 100%; }
}

@media (min-width: 1600px) {
  .case-detail-sidebar { padding-right: 0; }
}

@media (prefers-reduced-motion: reduce) {
  .case-detail-booking,
  .case-detail-booking .site-cta-icon,
  .case-detail-contact-list a,
  .case-detail-contact-links a,
  .case-detail-story-links a,
  .case-detail-navigation strong { transition: none; }
}
</style>
