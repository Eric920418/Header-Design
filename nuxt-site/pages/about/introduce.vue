<script setup lang="ts">
import { Plus } from 'lucide-vue-next'
import { brandHistory, brandIdentities, brandValues } from '~/data/aboutUs'

const activeHistoryYear = ref<(typeof brandHistory)[number]['year']>('1978')
const activeHistory = computed(() => brandHistory.find(item => item.year === activeHistoryYear.value) ?? brandHistory[0]!)
useSeoMeta({
  title: '關於我們｜SAKURA 整體廚房',
  description: '認識 SAKURA 整體廚房自 1978 年以來的品牌歷程、核心承諾與專屬品牌辨識。',
  ogTitle: '關於我們｜SAKURA 整體廚房',
  ogDescription: '從專業設計、品牌整合到永久免費安心健檢，了解 SAKURA 整體廚房如何陪伴台灣家庭打造理想廚房。',
  ogImage: '/section-5/about-us/banner-kitchen.jpg',
})
</script>

<template>
  <main class="about-us-page">
    <InternalAboutUsHero />

    <section class="about-services" aria-labelledby="about-services-title">
      <div class="about-rail">
        <header class="about-services__heading">
          <div v-reveal="{ anim: 'opalMoveRight' }" data-ev="opalMoveRight" class="ev">
            <span class="about-pill"><i aria-hidden="true" />關於我們</span>
          </div>
          <h2 id="about-services-title" v-reveal="{ anim: 'opalMoveLeft' }" data-ev="opalMoveLeft" class="ev">
            Explore Our Comprehensive<br /><span>Interior Design</span> Services
          </h2>
        </header>

        <div class="about-services__panel">
          <div v-reveal="{ anim: 'opalScaleUp' }" data-ev="opalScaleUp" class="about-services__visual ev">
            <InternalBrandImage
              :key="activeHistory.year"
              :src="activeHistory.image"
              :alt="`${activeHistory.year} ${activeHistory.summary}`"
              class="about-services__visual-image"
            />
            <div class="about-services__visual-shade" aria-hidden="true" />
            <div class="about-services__visual-copy">
              <span>{{ activeHistory.year }}</span>
            </div>
          </div>

          <div v-reveal="{ anim: 'opalMoveLeft', delay: 100 }" data-ev="opalMoveLeft" class="about-services__list ev" style="animation-delay:100ms">
            <div
              v-for="item in brandHistory"
              :key="item.year"
              class="about-services__item"
              :class="{ 'is-open': activeHistoryYear === item.year }"
            >
              <button
                :id="`history-trigger-${item.year}`"
                type="button"
                :aria-expanded="activeHistoryYear === item.year"
                :aria-controls="`history-panel-${item.year}`"
                @click="activeHistoryYear = item.year"
              >
                <span class="about-services__year">{{ item.year }}</span>
                <span class="about-services__question">{{ item.templateQuestion }}</span>
                <span class="about-services__plus" aria-hidden="true"><Plus /></span>
              </button>
              <Transition name="service-answer">
                <div
                  v-if="activeHistoryYear === item.year"
                  :id="`history-panel-${item.year}`"
                  class="about-services__answer"
                  role="region"
                  :aria-labelledby="`history-trigger-${item.year}`"
                >
                  {{ item.description }}
                </div>
              </Transition>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="about-history" aria-label="櫻花整體廚房品牌紀事">
      <div class="about-rail">
        <div class="about-history__grid">
          <article
            v-for="(item, index) in brandHistory"
            :key="item.year"
            v-reveal="{ anim: 'opalMoveUp', delay: index * 100 }"
            data-ev="opalMoveUp"
            class="about-history__card ev"
            :style="{ animationDelay: `${index * 100}ms` }"
          >
            <InternalBrandImage :src="item.image" :alt="`${item.year} 年品牌記事`" class="about-history__image" />
            <div class="about-history__content">
              <img :src="item.icon" alt="" aria-hidden="true" class="about-history__icon" />
              <span>{{ item.year }}</span>
              <p>{{ item.description }}</p>
            </div>
          </article>
        </div>
      </div>
    </section>

    <section class="about-values elementor-widget-antra-banner-process" aria-labelledby="about-values-title">
      <h2 id="about-values-title" class="sr-only">SAKURA 品牌承諾</h2>
      <div data-ev="opalScaleUp">
        <div class="about-values__stage">
          <div class="about-values__image-list" aria-hidden="true">
            <InternalBrandImage
              :src="brandValues[0]!.image"
              :alt="brandValues[0]!.title.replace('\n', ' ')"
              class="about-values__image is-active"
            />
          </div>
          <div class="about-values__shade" aria-hidden="true" />
          <div class="about-values__columns">
            <article
              v-for="(value, index) in brandValues"
              :key="value.id"
              class="about-values__card elementor-banner-process-item"
              tabindex="0"
            >
              <div class="about-values__copy banner-process-caption">
                <span class="number">{{ String(index + 1).padStart(2, '0') }}</span>
                <span class="about-values__eyebrow">{{ value.eyebrow }}</span>
                <h3 class="banner-process-title">{{ value.title }}</h3>
                <p
                  class="banner-process-content"
                  :class="{ 'is-empty': !value.description }"
                  :aria-hidden="!value.description"
                >{{ value.description || '\u00a0' }}</p>
              </div>
            </article>
          </div>
        </div>
      </div>
    </section>

    <section class="about-identity" aria-labelledby="about-identity-title">
      <div class="about-identity__rail">
        <header class="about-identity__heading">
          <div v-reveal="{ anim: 'opalMoveRight' }" data-ev="opalMoveRight" class="ev">
            <span class="about-pill"><i aria-hidden="true" />專屬品牌辨識</span>
          </div>
          <h2 id="about-identity-title" v-reveal="{ anim: 'opalMoveLeft' }" data-ev="opalMoveLeft" class="ev">
            Gallery Of Inspiring<br /><span>Interior</span> Designs
          </h2>
        </header>

        <div class="about-identity__grid">
          <article
            v-for="(identity, index) in brandIdentities"
            :key="identity.id"
            v-reveal="{ anim: 'opalMoveUp', delay: Math.min(index * 80, 240) }"
            data-ev="opalMoveUp"
            class="about-identity__card ev"
            :style="{ animationDelay: `${Math.min(index * 80, 240)}ms` }"
          >
            <div class="about-identity__media">
              <InternalBrandImage :src="identity.image" :alt="identity.title" class="about-identity__image" />
              <span class="about-identity__zoom" aria-hidden="true">＋</span>
            </div>
            <h3>{{ identity.title }}</h3>
          </article>
        </div>
      </div>
    </section>
  </main>
</template>

<style scoped>
.about-us-page { overflow: hidden; color: #1c1c1d; background: #f6f6f6; }
.about-rail { width: min(1410px, 100%); margin-inline: auto; }
.about-pill { display: inline-flex; width: fit-content; align-items: center; gap: 7px; padding: 7px 14px 7px 10px; border: 1px solid #7272722e; border-radius: 24px; color: #1c1c1d; font-family: "Cal Sans", sans-serif; font-size: 12px; line-height: 14px; letter-spacing: 1px; text-transform: uppercase; }
.about-pill i { width: 6px; height: 6px; border-radius: 50%; background: #caa05c; }

.about-services { padding: 100px 30px 110px; background: #f6f6f6; }
.about-services__heading { display: grid; grid-template-columns: 30% 70%; align-items: start; margin-bottom: 58px; }
.about-services__heading h2 { margin: 0; font-family: "Cal Sans", sans-serif; font-size: 60px; font-weight: 400; line-height: 64px; text-transform: capitalize; }
.about-services__heading h2 span { color: #caa05c; }
.about-services__panel { display: grid; grid-template-columns: minmax(0, 1fr) minmax(0, 1fr); gap: 30px; }
.about-services__visual { position: relative; min-height: 610px; overflow: hidden; border-radius: 24px; background: #1c1c1d; }
.about-services__visual-image { position: absolute; inset: 0; width: 100%; height: 100%; }
.about-services__visual-image :deep(img) { transition: opacity .45s ease, transform .75s ease; }
.about-services__visual-shade { position: absolute; inset: 0; background: linear-gradient(180deg, transparent 35%, rgb(0 0 0 / 78%) 100%); }
.about-services__visual-copy { position: absolute; inset-inline: 35px; bottom: 35px; color: #fff; }
.about-services__visual-copy span { display: block; color: #fff; font-family: "Cal Sans", sans-serif; font-size: 38px; line-height: 42px; }
.about-services__list { align-self: center; padding-left: 40px; }
.about-services__item { border-bottom: 1px solid #d7d7db; }
.about-services__list button { display: grid; width: 100%; grid-template-columns: 68px minmax(0, 1fr) 42px; align-items: center; gap: 16px; padding: 25px 0; border: 0; color: #1c1c1d; background: transparent; text-align: left; cursor: pointer; }
.about-services__year { color: #caa05c; font-family: "Cal Sans", sans-serif; font-size: 15px; }
.about-services__question { font-family: "Cal Sans", sans-serif; font-size: 24px; line-height: 30px; }
.about-services__plus { display: flex; width: 42px; height: 42px; align-items: center; justify-content: center; border: 1px solid #d7d7db; border-radius: 50%; transition: color .3s ease, transform .4s ease, background .3s ease; }
.about-services__plus svg { width: 17px; height: 17px; }
.about-services__list button[aria-expanded="true"] .about-services__plus { color: #fff; background: #caa05c; transform: rotate(45deg); }
.about-services__answer { padding: 0 58px 24px 84px; color: #59585d; font-size: 15px; line-height: 24px; }
.service-answer-enter-active,
.service-answer-leave-active { overflow: hidden; transition: max-height .45s ease, padding-bottom .45s ease, opacity .3s ease, transform .45s ease; }
.service-answer-enter-from,
.service-answer-leave-to { max-height: 0; padding-bottom: 0; opacity: 0; transform: translateY(-8px); }
.service-answer-enter-to,
.service-answer-leave-from { max-height: 480px; opacity: 1; transform: none; }

.about-history { padding: 0 30px 120px; background: #f6f6f6; }
.about-history__grid { display: grid; grid-template-columns: repeat(4, minmax(0, 1fr)); gap: 30px; }
.about-history__card { min-width: 0; }
.about-history__image { width: 130px; height: 130px; border-radius: 24px; }
.about-history__content { position: relative; padding: 28px 0 0; }
.about-history__icon { width: 25px; height: 25px; margin-bottom: 20px; filter: invert(68%) sepia(23%) saturate(865%) hue-rotate(358deg) brightness(93%); }
.about-history__content > span { display: block; margin-bottom: 13px; color: #caa05c; font-family: "Cal Sans", sans-serif; font-size: 30px; line-height: 34px; }
.about-history__content p { margin: 0; color: #59585d; font-size: 14px; line-height: 22px; }

.about-values { padding: 0; background: #1c1c1d; }
.about-values__stage { position: relative; min-height: 820px; overflow: hidden; color: #fff; background: #1c1c1d; }
.about-values__image-list,
.about-values__shade,
.about-values__columns { position: absolute; inset: 0; }
.about-values__image { position: absolute; inset: 0; width: 100%; height: 100%; opacity: 0; transition: opacity .5s ease, transform 1.2s ease; transform: scale(1.03); }
.about-values__image.is-active { opacity: 1; transform: scale(1); }
.about-values__shade { z-index: 1; background: linear-gradient(180deg, rgb(185 183 174 / 0%) 0%, rgb(134 132 126 / 54%) 19.25%, rgb(0 0 0 / 64%) 64%); pointer-events: none; }
.about-values__columns { z-index: 2; display: grid; grid-template-columns: repeat(4, minmax(0, 1fr)); }
.about-values__card { position: relative; min-width: 0; overflow: hidden; border-right: 1px solid rgb(255 255 255 / 24%); color: #fff; cursor: pointer; outline-offset: -3px; }
.about-values__copy { position: absolute; inset-inline: 0; bottom: 0; padding: 0 27px 57px 57px; transition: transform .5s ease; transform: translateY(68px); }
.about-values__copy.active,
.about-values__card:hover .about-values__copy,
.about-values__card:focus-visible .about-values__copy { transform: translateY(0); }
.about-values__copy .number { display: block; margin: 0 0 8px; color: #e3e3e8; font-family: "Cal Sans", sans-serif; font-size: 30px; line-height: 34px; opacity: .1; }
.about-values__copy.active .number,
.about-values__card:hover .number,
.about-values__card:focus-visible .number { color: #caa05c; opacity: 1; }
.about-values__eyebrow { display: block; margin-bottom: 7px; color: #caa05c; font-family: "Cal Sans", sans-serif; font-size: 12px; line-height: 18px; letter-spacing: .1em; text-transform: uppercase; }
.about-values__copy h3 { width: min(258px, 100%); min-height: 88px; margin: 0; padding: 8px 0 20px; color: #fff; font-family: "Cal Sans", sans-serif; font-size: 30px; font-weight: 400; line-height: 34px; white-space: pre-line; }
.about-values__copy p { width: min(286px, 100%); min-height: 72px; margin: 0; color: #fff; font-size: 14px; line-height: 22px; opacity: 0; visibility: hidden; transition: opacity .5s ease; }
.about-values__copy p.is-empty { opacity: 0; visibility: hidden; }
.about-values__copy.active p,
.about-values__card:hover p,
.about-values__card:focus-visible p { opacity: 1; visibility: visible; }
.about-values__copy.active p.is-empty,
.about-values__card:hover p.is-empty,
.about-values__card:focus-visible p.is-empty { opacity: 0; visibility: hidden; }

.about-identity { padding: 120px 30px 124px; background: #fff; }
.about-identity__rail { width: min(1770px, 100%); margin-inline: auto; }
.about-identity__heading { display: grid; grid-template-columns: 30% 70%; margin-bottom: 55px; }
.about-identity__heading h2 { margin: 0; font-family: "Cal Sans", sans-serif; font-size: 60px; font-weight: 400; line-height: 64px; text-transform: capitalize; }
.about-identity__heading h2 span { color: #caa05c; }
.about-identity__grid { display: flex; gap: 30px; overflow-x: auto; padding-bottom: 15px; scrollbar-width: thin; scrollbar-color: #caa05c #e3e3e8; scroll-snap-type: x mandatory; }
.about-identity__card { min-width: 0; flex: 0 0 calc((100% - 120px) / 5); scroll-snap-align: start; }
.about-identity__media { position: relative; overflow: hidden; border-radius: 24px; background: #e3e3e8; }
.about-identity__media::after { position: absolute; inset: 0; content: ""; background: rgb(0 0 0 / 50%); opacity: 0; transition: opacity .5s ease; }
.about-identity__image { width: 100%; aspect-ratio: 660 / 800; border-radius: 24px; }
.about-identity__image :deep(img) { transition: transform .5s ease; }
.about-identity__zoom { position: absolute; z-index: 2; top: 50%; left: 50%; display: grid; width: 60px; height: 60px; place-items: center; border: 1px solid rgb(255 255 255 / 60%); border-radius: 50%; color: #fff; font-family: "Cal Sans", sans-serif; font-size: 32px; opacity: 0; transition: opacity .5s ease, transform .5s ease; transform: translate(-50%, -50%) scale(.75); }
.about-identity__card:hover .about-identity__media::after,
.about-identity__card:hover .about-identity__zoom { opacity: 1; }
.about-identity__card:hover .about-identity__zoom { transform: translate(-50%, -50%) scale(1); }
.about-identity__card:hover .about-identity__image :deep(img) { transform: scale(1.2); }
.about-identity__card h3 { margin: 17px 0 0; font-family: "Cal Sans", sans-serif; font-size: 18px; font-weight: 400; line-height: 24px; }

@media (max-width: 1366px) {
  .about-services__heading h2,
  .about-identity__heading h2 { font-size: 52px; line-height: 56px; }
  .about-services__visual { min-height: 540px; }
  .about-services__list { padding-left: 15px; }
  .about-services__question { font-size: 21px; line-height: 27px; }
  .about-values__stage { min-height: 680px; }
  .about-values__copy { padding: 0 22px 42px 28px; }
  .about-values__copy h3 { font-size: 23px; line-height: 29px; }
  .about-identity__grid { gap: 24px; }
  .about-identity__card { flex-basis: calc((100% - 96px) / 5); }
}

@media (max-width: 1024px) {
  .about-services,
  .about-identity { padding-block: 80px; }
  .about-services__heading,
  .about-identity__heading { grid-template-columns: 27% 73%; }
  .about-services__heading h2,
  .about-identity__heading h2 { font-size: 44px; line-height: 48px; }
  .about-services__panel { grid-template-columns: minmax(0, 44%) minmax(0, 56%); }
  .about-services__visual { min-height: 500px; }
  .about-services__visual-copy { inset-inline: 25px; bottom: 25px; }
  .about-services__list { padding-left: 0; }
  .about-services__list button { grid-template-columns: 54px minmax(0, 1fr) 38px; gap: 10px; padding: 20px 0; }
  .about-services__question { font-size: 18px; line-height: 24px; }
  .about-services__answer { padding-right: 48px; padding-left: 64px; }
  .about-history { padding-bottom: 80px; }
  .about-history__grid { grid-template-columns: repeat(2, minmax(0, 1fr)); row-gap: 50px; }
  .about-values__stage { min-height: 820px; }
  .about-values__columns { grid-template-columns: repeat(2, minmax(0, 1fr)); }
  .about-values__card:nth-child(-n+2) { border-bottom: 1px solid rgb(255 255 255 / 24%); }
  .about-values__copy { padding: 0 24px 32px; transform: translateY(68px); }
  .about-identity__grid { gap: 24px; }
  .about-identity__card { flex-basis: calc((100% - 48px) / 3); }
}

@media (max-width: 767px) {
  .about-services { padding: 60px 15px 65px; }
  .about-services__heading,
  .about-identity__heading { display: block; margin-bottom: 30px; text-align: center; }
  .about-services__heading .about-pill,
  .about-identity__heading .about-pill { margin-inline: auto; }
  .about-services__heading h2,
  .about-identity__heading h2 { margin-top: 20px; font-size: 30px; line-height: 35px; }
  .about-services__panel { display: block; }
  .about-services__visual { min-height: 420px; }
  .about-services__visual-copy span { font-size: 30px; line-height: 35px; }
  .about-services__list { padding-top: 20px; }
  .about-services__list button { grid-template-columns: 45px minmax(0, 1fr) 36px; padding: 17px 0; }
  .about-services__question { font-size: 16px; line-height: 22px; }
  .about-services__answer { padding: 0 36px 20px 45px; }
  .about-history { padding: 0 15px 65px; }
  .about-history__grid { grid-template-columns: 1fr; gap: 45px; }
  .about-history__image { width: 150px; height: 150px; }
  .about-values__stage { min-height: 1600px; }
  .about-values__columns { grid-template-columns: 1fr; }
  .about-values__card { min-height: 400px; border-right: 0; border-bottom: 1px solid rgb(255 255 255 / 24%); }
  .about-values__copy { padding: 0 20px 30px; text-align: center; transform: none; }
  .about-values__copy .number { color: #caa05c; opacity: 1; }
  .about-values__copy h3 { width: 100%; min-height: 0; padding-bottom: 12px; }
  .about-values__copy p { width: 100%; min-height: 0; opacity: 1; visibility: visible; }
  .about-identity { padding: 65px 15px 70px; }
  .about-identity__grid { gap: 14px; margin-right: -15px; padding-right: 15px; }
  .about-identity__card { flex-basis: min(76vw, 285px); }
  .about-identity__card h3 { margin-top: 12px; font-size: 15px; line-height: 21px; }
}

@media (prefers-reduced-motion: reduce) {
  .about-services__plus,
  .about-services__visual-image :deep(img),
  .about-values__image,
  .about-values__copy,
  .about-values__copy p,
  .about-identity__media::after,
  .about-identity__zoom,
  .about-identity__image :deep(img) { transition: none; }
  .service-answer-enter-active,
  .service-answer-leave-active { transition: none; }
}
</style>
