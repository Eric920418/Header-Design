<script setup lang="ts">
import { ArrowRight } from 'lucide-vue-next'

const series = [
  { name: 'iChef', image: '/section-6/builders/sakura-kitchen/series-01.jpeg' },
  { name: 'iFun', image: '/section-6/builders/sakura-kitchen/series-02.jpeg' },
  { name: 'Loft Chic', image: '/section-6/builders/sakura-kitchen/series-03.jpeg' },
  { name: 'iPremium', image: '/section-6/builders/hero-kitchen.jpeg' },
  { name: '原色系列 01', image: '/section-6/builders/sakura-kitchen/series-05.jpeg' },
  { name: '原色系列 02', image: '/section-6/builders/sakura-kitchen/series-06.jpeg' },
]

useSeoMeta({
  title: 'SAKURA KITCHEN｜建商專區',
  description: 'SAKURA KITCHEN 以數據、設計模組與品牌資源，為建案提供全方位整體廚房解決方案。',
  ogTitle: 'SAKURA KITCHEN｜建商專區',
  ogDescription: '從品牌優勢到多元廚房系列，認識 SAKURA KITCHEN 的建案整體廚房解決方案。',
  ogImage: '/section-6/builders/sakura-kitchen/hero.jpeg',
})
</script>

<template>
  <main class="sakura-kitchen-page">
    <section class="sakura-kitchen-hero-shell hero-includes-header" aria-labelledby="sakura-kitchen-title">
      <div v-reveal="{ anim: 'opalScaleUp' }" data-ev="opalScaleUp" class="sakura-kitchen-hero ev">
        <InternalBuilderImage
          src="/section-6/builders/sakura-kitchen/hero.jpeg"
          alt="SAKURA KITCHEN 酒紅色櫥櫃與中島廚房"
          eager
          class="sakura-kitchen-hero__image"
        />
        <span class="sakura-kitchen-hero__shade" aria-hidden="true" />

        <div class="sakura-kitchen-hero__brand">
          <h1 id="sakura-kitchen-title" class="sr-only">SAKURA KITCHEN 櫻花整體廚房</h1>
          <img src="/section-6/builders/sakura-kitchen/logo-en.png" alt="SAKURA KITCHEN" class="sakura-kitchen-hero__logo" />
          <img src="/section-6/builders/sakura-kitchen/logo-zh.png" alt="櫻花整體廚房" class="sakura-kitchen-hero__logo-zh" />
          <p class="sakura-kitchen-hero__description">櫻花整體廚房提供全方位廚房解決方案，一站整合品牌資源，以專業解決廚房使用痛點，以美學勾勒夢想廚房藍圖。</p>
        </div>

        <NuxtLink to="/builders#appointment" class="sakura-kitchen-hero__booking" aria-label="立即預約建商服務">
          <span>立即<br />預約</span>
        </NuxtLink>

        <NuxtLink to="/about/advantage" class="sakura-kitchen-hero__project-card" aria-label="前往品牌優勢">
          <span class="sakura-kitchen-hero__project-card-thumb">
            <InternalBuilderImage
              src="/section-6/builders/sakura-kitchen/brand-advantage-link.jpg"
              alt="SAKURA KITCHEN 白色整體廚房空間"
              class="sakura-kitchen-hero__project-card-image"
            />
          </span>
          <span class="sakura-kitchen-hero__project-card-copy">
            <strong>Project Excellence</strong>
            <span>源自於全台數百萬戶家庭生活研究與觀察</span>
            <span class="sakura-kitchen-hero__project-card-link">Our Advantages</span>
          </span>
        </NuxtLink>
      </div>
    </section>

    <section id="brand-advantage" class="sakura-kitchen-advantage" aria-labelledby="sakura-kitchen-advantage-title">
      <div class="sakura-kitchen-rail">
        <header class="sakura-kitchen-heading">
          <h2 id="sakura-kitchen-advantage-title" v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="ev">突破未來格局，<br /><em>開啟廚房智高點</em></h2>
          <div v-reveal="{ anim: 'opalMoveUp', delay: 100 }" data-ev="opalMoveUp" class="sakura-kitchen-heading__copy ev" style="animation-delay:100ms">
            <p>憑藉多年累積的數據和服務經驗，櫻花整體廚房提供全方位廚房解決方案，一站整合品牌資源，以專業解決廚房使用痛點，以美學勾勒夢想廚房藍圖。</p>
            <p>700 萬用戶使用數據、45 萬套設計模組，海量大數據 AI 運算，深化 AI 科技的應用，精準掌握廚房使用需求打造更智能、更貼心的產品，滿足不斷變化的家庭需求。</p>
          </div>
        </header>

        <div v-reveal="{ anim: 'opalScaleUp', delay: 120 }" data-ev="opalScaleUp" class="sakura-kitchen-panorama ev" style="animation-delay:120ms">
          <InternalBuilderImage
            src="/section-6/builders/sakura-kitchen/brand-advantage.jpeg"
            alt="SAKURA KITCHEN 酒紅色櫥櫃與大型料理中島"
          />
          <span class="sakura-kitchen-panorama__shade" aria-hidden="true" />
          <NuxtLink
            to="/builders/catalogues"
            target="_blank"
            rel="noopener noreferrer"
            class="site-content-cta sakura-kitchen-content-cta sakura-kitchen-content-cta--photo"
          >
            <span>產品型錄</span>
            <span class="site-cta-icon sakura-kitchen-content-cta__icon"><ArrowRight aria-hidden="true" /></span>
          </NuxtLink>
        </div>
      </div>
    </section>

    <section class="sakura-kitchen-series" aria-labelledby="sakura-kitchen-series-title">
      <div class="sakura-kitchen-rail internal-rail-safe">
        <header class="sakura-kitchen-heading sakura-kitchen-heading--series">
          <InternalSectionPill v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="sakura-kitchen-heading__kicker ev">EXPLORE OUR COLLECTIONS</InternalSectionPill>
          <h2 id="sakura-kitchen-series-title" v-reveal="{ anim: 'opalMoveUp', delay: 70 }" data-ev="opalMoveUp" class="ev" style="animation-delay:70ms">Creating the Ideal Kitchen<br /><em>for Every Family</em></h2>
          <div v-reveal="{ anim: 'opalMoveUp', delay: 140 }" data-ev="opalMoveUp" class="sakura-kitchen-heading__copy ev" style="animation-delay:140ms">
            <p>源自於全台數百萬戶家庭生活研究與觀察，櫻花進一步將消費者依不同的家庭型態去探究，用心找出未曾注意的生活需求，發展出不同生活行為的廚房空間及設計風格，與消費者一起打造符合每個家庭的理想廚房。</p>
          </div>
        </header>

        <div class="sakura-kitchen-series__grid">
          <article
            v-for="(item, index) in series"
            :key="item.name"
            v-reveal="{ anim: 'opalMoveUp', delay: index * 80 }"
            data-ev="opalMoveUp"
            class="sakura-kitchen-series__card ev"
            :style="{ animationDelay: `${index * 80}ms` }"
          >
            <InternalBuilderImage :src="item.image" :alt="`${item.name} 廚房系列空間`" />
            <span class="sakura-kitchen-series__overlay" aria-hidden="true" />
            <h3>{{ item.name }}</h3>
          </article>
        </div>

        <div v-reveal="{ anim: 'opalMoveUp', delay: 160 }" data-ev="opalMoveUp" class="sakura-kitchen-series__cta ev" style="animation-delay:160ms">
          <NuxtLink to="/builders#appointment" class="site-content-cta sakura-kitchen-content-cta">
            <span>立即預約</span>
            <span class="site-cta-icon sakura-kitchen-content-cta__icon"><ArrowRight aria-hidden="true" /></span>
          </NuxtLink>
        </div>
      </div>
    </section>
  </main>
</template>

<style scoped>
.sakura-kitchen-page { overflow: clip; color: #1c1c1d; background: #f6f6f6; }
.sakura-kitchen-rail { width: min(1410px, 100%); margin-inline: auto; box-sizing: border-box; }

.sakura-kitchen-hero-shell { padding: 80px 30px 0; background: #f6f6f6; }
.sakura-kitchen-hero { position: relative; width: min(1410px, 100%); aspect-ratio: 2.203125 / 1; margin-inline: auto; overflow: hidden; border-radius: 24px; color: #fff; background: #1c1c1d; }
.sakura-kitchen-hero__image { position: absolute; inset: 0; }
.sakura-kitchen-hero__image :deep(img) { object-position: center 52%; }
.sakura-kitchen-hero__shade { position: absolute; inset: 0; background: linear-gradient(90deg, rgb(16 8 1 / 66%) 0%, rgb(16 8 1 / 30%) 40%, rgb(16 8 1 / 7%) 67%, rgb(16 8 1 / 24%) 100%); }
.sakura-kitchen-hero__brand { position: absolute; z-index: 2; left: clamp(30px, 4.25vw, 60px); bottom: clamp(160px, 27%, 185px); width: min(480px, 42%); font-family: var(--font-cjk-sans); }
.sakura-kitchen-hero__logo { display: block; width: min(370px, 100%); height: auto; }
.sakura-kitchen-hero__logo-zh { display: block; width: min(292px, 79%); height: auto; margin-top: 10px; opacity: .86; }
.sakura-kitchen-hero__description { max-width: 455px; margin: 24px 0 0; color: rgb(255 255 255 / 82%); font-family: var(--font-cjk-sans); font-size: 15px; line-height: 25px; }
.sakura-kitchen-hero__booking { position: absolute; z-index: 3; left: clamp(30px, 4.25vw, 60px); bottom: 30px; display: inline-flex; width: 110px; height: 110px; align-items: center; justify-content: center; border: 1px solid rgb(255 255 255 / 18%); border-radius: 50%; color: #fff; background: rgb(28 28 29 / 64%); font-family: var(--font-cjk-sans); text-align: center; text-decoration: none; backdrop-filter: blur(14px); animation: sakura-kitchen-booking-radar 2.4s ease-out infinite; transition: color .35s ease, background-color .35s ease, transform .35s ease; }
.sakura-kitchen-hero__booking span { font-size: 15px; line-height: 21px; }
.sakura-kitchen-hero__booking:hover,
.sakura-kitchen-hero__booking:focus-visible { color: #1c1c1d; background: #caa05c; transform: translateY(-3px); }
.sakura-kitchen-hero__booking:focus-visible { outline: 2px solid #fff; outline-offset: 4px; }
@keyframes sakura-kitchen-booking-radar { 0% { box-shadow: 0 0 0 0 rgb(202 160 92 / 38%); } 72%, 100% { box-shadow: 0 0 0 18px rgb(202 160 92 / 0%); } }
.sakura-kitchen-hero__project-card { position: absolute; z-index: 3; right: 85px; bottom: 30px; display: grid; width: min(420px, 34%); aspect-ratio: 542 / 228; grid-template-columns: 46% minmax(0, 1fr); align-items: stretch; gap: clamp(10px, 1.25vw, 18px); overflow: hidden; border: 1px solid rgb(255 255 255 / 18%); border-radius: 24px; padding: clamp(8px, 1.1vw, 16px); color: #fff; background: rgb(170 167 166 / 68%); box-shadow: 0 16px 40px rgb(0 0 0 / 14%); text-decoration: none; backdrop-filter: blur(18px); transition: filter .35s ease, transform .35s ease; }
.sakura-kitchen-hero__project-card:hover,
.sakura-kitchen-hero__project-card:focus-visible { filter: brightness(1.08); transform: translateY(-4px); }
.sakura-kitchen-hero__project-card:focus-visible { outline: 2px solid #fff; outline-offset: 3px; }
.sakura-kitchen-hero__project-card-thumb { display: block; min-width: 0; overflow: hidden; border-radius: clamp(12px, 1.3vw, 18px); }
.sakura-kitchen-hero__project-card-image { width: 100%; height: 100%; background: #d8d5d1; }
.sakura-kitchen-hero__project-card-copy { display: flex; min-width: 0; flex-direction: column; justify-content: center; font-family: var(--font-cjk-sans); }
.sakura-kitchen-hero__project-card-copy strong { font-family: var(--font-cjk-sans); font-size: clamp(15px, 1.45vw, 21px); font-weight: 600; line-height: 1.1; }
.sakura-kitchen-hero__project-card-copy > span:not(.sakura-kitchen-hero__project-card-link) { margin-top: clamp(7px, .8vw, 11px); color: rgb(255 255 255 / 88%); font-size: clamp(11px, 1.04vw, 15px); line-height: 1.35; }
.sakura-kitchen-hero__project-card-link { width: fit-content; margin-top: clamp(7px, .8vw, 11px); font-family: var(--font-cjk-sans); font-size: clamp(11px, .95vw, 14px); line-height: 1.25; text-decoration: underline; text-decoration-thickness: 1px; text-underline-offset: 3px; }

.sakura-kitchen-advantage { scroll-margin-top: 80px; padding: 82px 30px 112px; background: #f6f6f6; }
.sakura-kitchen-heading { width: min(1040px, 100%); margin-inline: auto; text-align: center; }
.sakura-kitchen-heading h2 { margin: 0; font-family: var(--font-cjk-serif); font-size: 40px; font-weight: var(--font-cjk-serif-semibold, 600); line-height: 50px; letter-spacing: 0; text-transform: none; }
.sakura-kitchen-heading h2 em { color: #caa05c; font-style: normal; }
.sakura-kitchen-heading__copy { display: grid; max-width: 970px; gap: 10px; margin: 24px auto 0; color: #59585d; font-family: var(--font-cjk-sans); }
.sakura-kitchen-advantage .sakura-kitchen-heading__copy { max-width: 760px; }
.sakura-kitchen-heading__copy p { margin: 0; font-size: 15px; line-height: 26px; }
.sakura-kitchen-heading__kicker { margin: 0 0 15px; }
.sakura-kitchen-panorama { position: relative; width: 100%; aspect-ratio: 4 / 1; margin: 68px auto 0; overflow: hidden; border-radius: 24px; background: #1c1c1d; }
.sakura-kitchen-panorama > :deep(.builder-image) { position: absolute; inset: 0; }
.sakura-kitchen-panorama :deep(img) { object-position: center 54%; }
.sakura-kitchen-panorama__shade { position: absolute; inset: 0; background: linear-gradient(180deg, rgb(0 0 0 / 4%), rgb(0 0 0 / 38%)); }
.sakura-kitchen-panorama .sakura-kitchen-content-cta { position: absolute; left: 50%; bottom: 28px; transform: translateX(-50%); }
.sakura-kitchen-panorama .sakura-kitchen-content-cta:hover,
.sakura-kitchen-panorama .sakura-kitchen-content-cta:focus-visible { transform: translateX(-50%); }

.sakura-kitchen-series { padding: 112px 30px 130px; background: #fff; }
.sakura-kitchen-heading--series { width: min(1020px, 100%); }
.sakura-kitchen-series__grid { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 30px; margin-top: 68px; }
.sakura-kitchen-series__card { position: relative; min-width: 0; aspect-ratio: 1.45 / 1; overflow: hidden; border-radius: 24px; background: #1c1c1d; }
.sakura-kitchen-series__card :deep(.builder-image) { position: absolute; inset: 0; }
.sakura-kitchen-series__card :deep(img) { transition: transform .65s ease; }
.sakura-kitchen-series__card:hover :deep(img) { transform: scale(1.05); }
.sakura-kitchen-series__overlay { position: absolute; inset: 0; background: rgb(16 8 1 / 30%); transition: background-color .35s ease; }
.sakura-kitchen-series__card:hover .sakura-kitchen-series__overlay { background: rgb(16 8 1 / 40%); }
.sakura-kitchen-series__card h3 { position: absolute; z-index: 2; inset: 0; display: flex; align-items: center; justify-content: center; margin: 0; padding: 24px; color: #fff; font-family: var(--font-brand-serif); font-size: 26px; font-weight: 400; line-height: 34px; text-align: center; text-shadow: 0 2px 18px rgb(0 0 0 / 55%); text-transform: none; }
.sakura-kitchen-series__cta { display: flex; justify-content: center; margin-top: 58px; }

.sakura-kitchen-content-cta { display: inline-flex; width: max-content; min-height: 60px; flex: none; align-items: center; gap: 8px; padding: 9px 9px 9px 30px; border: 1px solid rgb(159 159 164 / 64%); border-radius: 999px; color: #1c1c1d; background: transparent; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 22px; text-decoration: none; white-space: nowrap; transition: color .3s ease, border-color .3s ease, background-color .3s ease; }
.sakura-kitchen-content-cta:hover,
.sakura-kitchen-content-cta:focus-visible { color: #fff; border-color: #caa05c; background: #caa05c; }
.sakura-kitchen-content-cta__icon { position: relative; isolation: isolate; display: inline-flex; width: 40px; height: 40px; flex: none; align-items: center; justify-content: center; border-radius: 50%; color: #fff; background: #caa05c; transform: rotate(-45deg); transition: transform .5s ease; }
.sakura-kitchen-content-cta__icon::after { position: absolute; z-index: -1; inset: 0; border-radius: 50%; content: ''; background: #caa05c; animation: sakura-kitchen-cta-radar 2s ease-out infinite; }
.sakura-kitchen-content-cta__icon svg { width: 20px; height: 20px; }
.sakura-kitchen-content-cta:hover .sakura-kitchen-content-cta__icon,
.sakura-kitchen-content-cta:focus-visible .sakura-kitchen-content-cta__icon { transform: rotate(0); }
.sakura-kitchen-content-cta:hover .sakura-kitchen-content-cta__icon::after,
.sakura-kitchen-content-cta:focus-visible .sakura-kitchen-content-cta__icon::after { animation: none; opacity: 0; }
.sakura-kitchen-content-cta:focus-visible { outline: 2px solid #caa05c; outline-offset: 4px; }
@keyframes sakura-kitchen-cta-radar { from { opacity: .55; transform: scale(1); } to { opacity: 0; transform: scale(1.55); } }
.sakura-kitchen-content-cta--photo { color: #fff; border-color: rgb(255 255 255 / 60%); background: rgb(28 28 29 / 48%); backdrop-filter: blur(12px); }

@media (max-width: 1024px) {
  .sakura-kitchen-hero { aspect-ratio: 1.72 / 1; }
  .sakura-kitchen-hero__brand { left: 34px; bottom: 165px; width: 52%; }
  .sakura-kitchen-hero__booking { left: 34px; }
  .sakura-kitchen-hero__project-card { right: 78px; bottom: 24px; width: min(380px, 42%); }
  .sakura-kitchen-heading h2 { font-size: 40px; line-height: 50px; }
  .sakura-kitchen-series__grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
}

@media (max-width: 767px) {
  :global(.floating-buttons) { display: none !important; }
  .sakura-kitchen-hero-shell { padding: 80px 15px 0; }
  .sakura-kitchen-hero { min-height: 720px; aspect-ratio: auto; border-radius: 18px; }
  .sakura-kitchen-hero__image :deep(img) { object-position: 57% center; }
  .sakura-kitchen-hero__shade { background: linear-gradient(180deg, rgb(16 8 1 / 70%) 0%, rgb(16 8 1 / 24%) 46%, rgb(16 8 1 / 70%) 100%); }
  .sakura-kitchen-hero__brand { top: 38px; right: 22px; bottom: auto; left: 22px; width: auto; }
  .sakura-kitchen-hero__logo { width: 260px; }
  .sakura-kitchen-hero__logo-zh { width: 205px; margin-top: 8px; }
  .sakura-kitchen-hero__description { max-width: 318px; margin-top: 18px; font-size: 14px; line-height: 23px; }
  .sakura-kitchen-hero__booking { bottom: 158px; left: 20px; width: 90px; height: 90px; }
  .sakura-kitchen-hero__project-card { right: 70px; bottom: 20px; left: 20px; width: auto; max-width: 330px; gap: 9px; border-radius: 18px; padding: 7px 10px 7px 7px; }
  .sakura-kitchen-hero__project-card-thumb { border-radius: 12px; }
  .sakura-kitchen-hero__project-card-copy strong { font-size: 15px; }
  .sakura-kitchen-hero__project-card-copy > span:not(.sakura-kitchen-hero__project-card-link) { margin-top: 5px; font-size: 10.5px; line-height: 13.5px; }
  .sakura-kitchen-hero__project-card-link { margin-top: 5px; font-size: 10.5px; }
  .sakura-kitchen-advantage { padding: 70px 15px 80px; }
  .sakura-kitchen-series { padding: 78px 15px 80px; }
  .sakura-kitchen-heading h2 { font-size: 34px; line-height: 43px; }
  .sakura-kitchen-heading__copy { margin-top: 20px; text-align: left; }
  .sakura-kitchen-heading__copy p { font-size: 15px; line-height: 24px; }
  .sakura-kitchen-panorama { min-height: 330px; aspect-ratio: auto; margin-top: 42px; border-radius: 18px; }
  .sakura-kitchen-panorama :deep(img) { object-position: 57% center; }
  .sakura-kitchen-panorama .sakura-kitchen-content-cta { bottom: 22px; }
  .sakura-kitchen-series__grid { grid-template-columns: 1fr; gap: 18px; margin-top: 42px; }
  .sakura-kitchen-series__card { border-radius: 18px; }
  .sakura-kitchen-series__card h3 { font-size: 23px; line-height: 30px; }
  .sakura-kitchen-series__cta { justify-content: flex-start; margin-top: 42px; }
}

@media (prefers-reduced-motion: reduce) {
  .sakura-kitchen-hero__booking,
  .sakura-kitchen-hero__project-card,
  .sakura-kitchen-series__card :deep(img),
  .sakura-kitchen-series__overlay,
  .sakura-kitchen-content-cta,
  .sakura-kitchen-content-cta__icon,
  .sakura-kitchen-content-cta__icon::after { transition: none; animation: none; }

  .sakura-kitchen-hero__booking { animation: none; }

  .sakura-kitchen-hero__booking:hover,
  .sakura-kitchen-hero__booking:focus-visible,
  .sakura-kitchen-hero__project-card:hover,
  .sakura-kitchen-hero__project-card:focus-visible,
  .sakura-kitchen-series__card:hover :deep(img) { transform: none; }
}
</style>
