<script setup lang="ts">
const cmsCopy = await useCmsResource('view-pages-builders-sakura-kitchen', {"series":[{"name":"iChef","image":"/section-6/builders/sakura-kitchen/series-01.webp"},{"name":"iFun","image":"/section-6/builders/sakura-kitchen/series-02.webp"},{"name":"Loft Chic","image":"/section-6/builders/sakura-kitchen/series-03.webp"},{"name":"iPremium","image":"/section-6/builders/hero-kitchen.webp"},{"name":"原色系列 01","image":"/section-6/builders/sakura-kitchen/series-05.webp"},{"name":"原色系列 02","image":"/section-6/builders/sakura-kitchen/series-06.webp"}],"copy":{"field1":"/section-6/builders/sakura-kitchen/hero.webp","field2":"SAKURA KITCHEN 酒紅色櫥櫃與中島廚房","text3":"SAKURA KITCHEN 櫻花整體廚房","field4":"/section-6/builders/sakura-kitchen/logo-en.png","field5":"SAKURA KITCHEN","field6":"/section-6/builders/sakura-kitchen/logo-zh.png","field7":"櫻花整體廚房","text8":"櫻花整體廚房提供全方位廚房解決方案，一站整合品牌資源，以專業解決廚房使用痛點，以美學勾勒夢想廚房藍圖。","field9":"/builders#appointment","text10":"立即","text11":"預約","field12":"/about/advantage","field13":"/section-6/builders/sakura-kitchen/brand-advantage-link.jpg","field14":"SAKURA KITCHEN 白色整體廚房空間","text15":"Brand Commitment","text16":"源自於全台數百萬戶家庭生活研究與觀察","text17":"Our Advantages","text18":"突破未來格局","text19":"開啟廚房智高點","text20":"憑藉多年累積的數據和服務經驗，櫻花整體廚房提供全方位廚房解決方案，一站整合品牌資源，以專業解決廚房使用痛點，以美學勾勒夢想廚房藍圖。","text21":"700 萬用戶使用數據、45 萬套設計模組，海量大數據 AI 運算，深化 AI 科技的應用，精準掌握廚房使用需求打造更智能、更貼心的產品，滿足不斷變化的家庭需求。","field22":"/section-6/builders/sakura-kitchen/brand-advantage.webp","field23":"SAKURA KITCHEN 酒紅色櫥櫃與大型料理中島","field24":"/builders#appointment","text25":"立即預約","text26":"EXPLORE OUR COLLECTIONS","text27":"Creating the Ideal Kitchen","text28":"for Every Family","text29":"源自於全台數百萬戶家庭生活研究與觀察，櫻花進一步將消費者依不同的家庭型態去探究，用心找出未曾注意的生活需求，發展出不同生活行為的廚房空間及設計風格，與消費者一起打造符合每個家庭的理想廚房。","field30":"/builders#appointment","text31":"立即預約"},"cmsSettings":{"visible":true,"seoTitle":"","seoDescription":""}})

import { ArrowRight, ChevronLeft, ChevronRight, X } from 'lucide-vue-next'
import { builderSeriesImages } from '~/shared/cms/builder-series.mjs'

type BuilderKitchenSeries = { name: string; image: string; subtitle?: string; images?: string[] }
const series: BuilderKitchenSeries[] = cmsCopy.series
const seriesDialog = ref<HTMLDialogElement | null>(null)
const selectedSeries = ref<BuilderKitchenSeries>()
const activeImageIndex = ref(0)
const selectedImages = computed<string[]>(() => builderSeriesImages(selectedSeries.value))
let seriesOpener: HTMLElement | undefined

async function openSeries(item: BuilderKitchenSeries, event: MouseEvent) {
  seriesOpener = event.currentTarget as HTMLElement
  selectedSeries.value = item
  activeImageIndex.value = 0
  await nextTick()
  if (seriesDialog.value && !seriesDialog.value.open) seriesDialog.value.showModal()
}

function moveSeriesImage(direction: number) {
  const count = selectedImages.value.length
  if (count > 1) activeImageIndex.value = (activeImageIndex.value + direction + count) % count
}

function closeSeries() {
  seriesDialog.value?.close()
}

function finishSeriesClose() {
  selectedSeries.value = undefined
  if (seriesOpener?.isConnected) seriesOpener.focus({ preventScroll: true })
  seriesOpener = undefined
}

useSeoMeta({
  title: 'SAKURA KITCHEN｜建商專區',
  description: 'SAKURA KITCHEN 以數據、設計模組與品牌資源，為建案提供全方位整體廚房解決方案。',
  ogTitle: 'SAKURA KITCHEN｜建商專區',
  ogDescription: '從品牌優勢到多元廚房系列，認識 SAKURA KITCHEN 的建案整體廚房解決方案。',
  ogImage: '/section-6/builders/sakura-kitchen/hero.webp',
})
useHead(() => ({ ...(cmsCopy.cmsSettings.seoTitle ? {title:cmsCopy.cmsSettings.seoTitle}:{}), meta: cmsCopy.cmsSettings.seoDescription ? [{name:'description',content:cmsCopy.cmsSettings.seoDescription}] : [] }))
</script>

<template>
  <template v-if="cmsCopy.cmsSettings.visible">
  <main class="sakura-kitchen-page">
    <section class="sakura-kitchen-hero-shell hero-includes-header" aria-labelledby="sakura-kitchen-title">
      <div class="sakura-kitchen-hero">
        <InternalBuilderImage
          :src="cmsCopy.copy.field1"
          :alt="cmsCopy.copy.field2"
          eager
          class="sakura-kitchen-hero__image"
        />
        <span class="sakura-kitchen-hero__shade" aria-hidden="true" />

        <div class="sakura-kitchen-hero__brand">
          <h1 id="sakura-kitchen-title" class="sr-only">{{ cmsCopy.copy.text3 }}</h1>
          <img :src="cmsCopy.copy.field4" :alt="cmsCopy.copy.field5" class="sakura-kitchen-hero__logo" />
          <img :src="cmsCopy.copy.field6" :alt="cmsCopy.copy.field7" class="sakura-kitchen-hero__logo-zh" />
          <p class="sakura-kitchen-hero__description">{{ cmsCopy.copy.text8 }}</p>
        </div>

        <NuxtLink :to="cmsCopy.copy.field9" class="sakura-kitchen-hero__booking" aria-label="立即預約建商服務">
          <span>{{ cmsCopy.copy.text10 }}<br />{{ cmsCopy.copy.text11 }}</span>
        </NuxtLink>

        <NuxtLink :to="cmsCopy.copy.field12" class="sakura-kitchen-hero__project-card" aria-label="前往品牌優勢">
          <span class="sakura-kitchen-hero__project-card-thumb">
            <InternalBuilderImage
              :src="cmsCopy.copy.field13"
              :alt="cmsCopy.copy.field14"
              class="sakura-kitchen-hero__project-card-image"
            />
          </span>
          <span class="sakura-kitchen-hero__project-card-copy">
            <strong>{{ cmsCopy.copy.text15 }}</strong>
            <span>{{ cmsCopy.copy.text16 }}</span>
            <span class="sakura-kitchen-hero__project-card-link">{{ cmsCopy.copy.text17 }}</span>
          </span>
        </NuxtLink>
      </div>
    </section>

    <section id="brand-advantage" class="sakura-kitchen-advantage" aria-labelledby="sakura-kitchen-advantage-title">
      <div class="sakura-kitchen-rail">
        <header class="sakura-kitchen-heading">
          <h2 id="sakura-kitchen-advantage-title" v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="ev">{{ cmsCopy.copy.text18 }}<br /><em>{{ cmsCopy.copy.text19 }}</em></h2>
          <div v-reveal="{ anim: 'opalMoveUp', delay: 100 }" data-ev="opalMoveUp" class="sakura-kitchen-heading__copy ev" style="animation-delay:100ms">
            <p>{{ cmsCopy.copy.text20 }}</p>
            <p>{{ cmsCopy.copy.text21 }}</p>
          </div>
        </header>

        <div v-reveal="{ anim: 'opalScaleUp', delay: 120 }" data-ev="opalScaleUp" class="sakura-kitchen-panorama ev" style="animation-delay:120ms">
          <InternalBuilderImage
            :src="cmsCopy.copy.field22"
            :alt="cmsCopy.copy.field23"
          />
          <span class="sakura-kitchen-panorama__shade" aria-hidden="true" />
          <NuxtLink
            :to="cmsCopy.copy.field24"
            class="site-content-cta sakura-kitchen-content-cta sakura-kitchen-content-cta--photo"
          >
            <span>{{ cmsCopy.copy.text25 }}</span>
            <span class="site-cta-icon sakura-kitchen-content-cta__icon"><ArrowRight aria-hidden="true" /></span>
          </NuxtLink>
        </div>
      </div>
    </section>

    <section class="sakura-kitchen-series" aria-labelledby="sakura-kitchen-series-title">
      <div class="sakura-kitchen-rail internal-rail-safe">
        <header class="sakura-kitchen-heading sakura-kitchen-heading--series">
          <InternalSectionPill v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="sakura-kitchen-heading__kicker ev">{{ cmsCopy.copy.text26 }}</InternalSectionPill>
          <h2 id="sakura-kitchen-series-title" v-reveal="{ anim: 'opalMoveUp', delay: 70 }" data-ev="opalMoveUp" class="ev" style="animation-delay:70ms"><b class="sakura-kitchen-series-chinese">探索品牌系列</b>Creating the <em>Ideal Kitchen</em><br /> <em>For Every</em> Family</h2>
          <div v-reveal="{ anim: 'opalMoveUp', delay: 140 }" data-ev="opalMoveUp" class="sakura-kitchen-heading__copy ev" style="animation-delay:140ms">
            <p>{{ cmsCopy.copy.text29 }}</p>
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
            <h3><span>{{ item.name }}</span><span v-if="item.subtitle">{{ item.subtitle }}</span></h3>
            <button type="button" class="sakura-kitchen-series__open" aria-haspopup="dialog" :aria-label="`查看${item.name} ${item.subtitle || ''}系列圖片`" @click="openSeries(item, $event)" />
          </article>
        </div>

        <div v-reveal="{ anim: 'opalMoveUp', delay: 160 }" data-ev="opalMoveUp" class="sakura-kitchen-series__cta ev" style="animation-delay:160ms">
          <NuxtLink :to="cmsCopy.copy.field30" class="site-content-cta sakura-kitchen-content-cta">
            <span>{{ cmsCopy.copy.text31 }}</span>
            <span class="site-cta-icon sakura-kitchen-content-cta__icon"><ArrowRight aria-hidden="true" /></span>
          </NuxtLink>
        </div>
      </div>
    </section>
    <dialog ref="seriesDialog" class="builder-series-dialog" aria-labelledby="builder-series-dialog-title" data-lenis-prevent @click.self="closeSeries" @cancel.prevent="closeSeries" @close="finishSeriesClose" @keydown.left.prevent="moveSeriesImage(-1)" @keydown.right.prevent="moveSeriesImage(1)">
      <div v-if="selectedSeries" class="builder-series-dialog__panel">
        <header class="builder-series-dialog__header">
          <h2 id="builder-series-dialog-title">{{ selectedSeries.name }}<span v-if="selectedSeries.subtitle">{{ selectedSeries.subtitle }}</span></h2>
          <button type="button" aria-label="關閉系列圖片" autofocus @click="closeSeries"><X aria-hidden="true" /></button>
        </header>
        <InternalBuilderImage v-if="selectedImages[activeImageIndex]" :key="selectedImages[activeImageIndex]" :src="selectedImages[activeImageIndex]!" :alt="`${selectedSeries.name} ${selectedSeries.subtitle || ''} 圖片 ${activeImageIndex + 1}`" eager fit="contain" class="builder-series-dialog__image" />
        <nav class="builder-series-dialog__controls" aria-label="系列圖片切換">
          <button type="button" aria-label="上一張系列圖片" :disabled="selectedImages.length < 2" @click="moveSeriesImage(-1)"><ChevronLeft aria-hidden="true" /></button>
          <span aria-live="polite" aria-atomic="true">{{ activeImageIndex + 1 }} / {{ selectedImages.length }}</span>
          <button type="button" aria-label="下一張系列圖片" :disabled="selectedImages.length < 2" @click="moveSeriesImage(1)"><ChevronRight aria-hidden="true" /></button>
        </nav>
      </div>
    </dialog>
  </main>
</template>
</template>

<style scoped>
.sakura-kitchen-page { overflow: clip; color: #1c1c1d; background: #fafafa; }
.sakura-kitchen-rail { width: min(1410px, 100%); margin-inline: auto; box-sizing: border-box; }

.sakura-kitchen-hero-shell { padding: 80px 30px 0; background: #fafafa; }
.sakura-kitchen-hero { position: relative; width: min(1410px, 100%); aspect-ratio: 2.203125 / 1; margin-inline: auto; overflow: hidden; border-radius: 24px; color: #fff; background: #1c1c1d; }
.sakura-kitchen-hero__image { position: absolute; inset: 0; }
.sakura-kitchen-hero__image :deep(img) { object-position: center 52%; }
.sakura-kitchen-hero__shade { position: absolute; inset: 0; background: linear-gradient(90deg, rgb(16 8 1 / 66%) 0%, rgb(16 8 1 / 30%) 40%, rgb(16 8 1 / 7%) 67%, rgb(16 8 1 / 24%) 100%); }
.sakura-kitchen-hero__brand { position: absolute; z-index: 2; left: clamp(30px, 4.25vw, 60px); bottom: clamp(160px, 27%, 185px); width: min(480px, 42%); font-family: var(--font-cjk-sans); }
.sakura-kitchen-hero__logo { display: block; width: min(370px, 100%); height: auto; }
.sakura-kitchen-hero__logo-zh { display: block; width: min(292px, 79%); height: auto; margin-top: 10px; opacity: .86; }
.sakura-kitchen-hero__description { max-width: 455px; margin: 24px 0 0; color: rgb(255 255 255 / 82%); font-family: var(--font-cjk-sans); font-size: 15px; line-height: 25px; }
.sakura-kitchen-hero__booking { position: absolute; z-index: 3; left: clamp(30px, 4.25vw, 60px); bottom: 30px; display: inline-flex; width: 110px; height: 110px; align-items: center; justify-content: center; border: 1px solid #ffffff12; border-radius: 50%; color: #fff; background: #5c5c5c75; font-family: var(--font-cjk-sans); text-align: center; text-decoration: none; backdrop-filter: blur(14px); animation: sakura-kitchen-booking-radar 2.4s ease-out infinite; transition: color .35s ease, background-color .35s ease, transform .35s ease; }
.sakura-kitchen-hero__booking span { font-size: 16px; line-height: 24px; }
.sakura-kitchen-hero__booking:hover,
.sakura-kitchen-hero__booking:focus-visible { color: #caa05c; background: #5c5c5c75; transform: translateY(-3px); }
.sakura-kitchen-hero__booking:focus-visible { outline: 2px solid #caa05c; outline-offset: 4px; }
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

.sakura-kitchen-advantage { scroll-margin-top: 80px; padding: 82px 30px 112px; background: #fafafa; }
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

.sakura-kitchen-series { padding: 40px 30px 130px; background: #fff; }
.sakura-kitchen-heading--series { width: min(1020px, 100%); }
#sakura-kitchen-series-title { font-family: var(--font-display); font-size: 50px; font-weight: 400; line-height: 1.2; letter-spacing: -.02em; }
.sakura-kitchen-series-chinese { display: block; margin-bottom: 16px; color: #caa05c; font-family: var(--font-cjk-serif); font-size: 40px; font-weight: 600; line-height: 1.2; letter-spacing: 0; }
.sakura-kitchen-heading--series .sakura-kitchen-heading__kicker { margin-bottom: 40px; }
.sakura-kitchen-series__grid { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 30px; margin-top: 68px; }
.sakura-kitchen-series__card { position: relative; min-width: 0; aspect-ratio: 1.45 / 1; overflow: hidden; border-radius: 24px; background: #1c1c1d; }
.sakura-kitchen-series__card :deep(.builder-image) { position: absolute; inset: 0; }
.sakura-kitchen-series__card :deep(img) { transition: transform .65s ease; }
.sakura-kitchen-series__card:hover :deep(img) { transform: scale(1.05); }
.sakura-kitchen-series__overlay { position: absolute; inset: 0; background: rgb(16 8 1 / 30%); transition: background-color .35s ease; }
.sakura-kitchen-series__card:hover .sakura-kitchen-series__overlay { background: rgb(16 8 1 / 40%); }
.sakura-kitchen-series__card h3 { position: absolute; z-index: 2; inset: 0; display: flex; flex-direction: column; align-items: center; justify-content: center; margin: 0; padding: 24px; color: #fff; font-family: var(--font-brand-serif); font-size: 26px; font-weight: 400; line-height: 34px; text-align: center; text-shadow: 0 2px 18px rgb(0 0 0 / 55%); text-transform: none; }
.sakura-kitchen-series__open { position: absolute; z-index: 3; inset: 0; width: 100%; height: 100%; padding: 0; border: 0; border-radius: inherit; background: transparent; cursor: pointer; }
.sakura-kitchen-series__open:focus-visible { outline: 2px solid #caa05c; outline-offset: -4px; }
.builder-series-dialog { width: min(1200px, calc(100% - 30px)); max-width: none; max-height: calc(100dvh - 30px); margin: auto; padding: 0; overflow-y: auto; border: 0; border-radius: 18px; background: #1c1c1d; color: #fff; overscroll-behavior: contain; }
.builder-series-dialog::backdrop { background: rgb(16 8 1 / 80%); }
.builder-series-dialog__panel { display: flex; flex-direction: column; max-height: calc(100dvh - 30px); padding: 16px; }
.builder-series-dialog__header { display: flex; flex: none; align-items: start; justify-content: space-between; gap: 16px; margin-bottom: 16px; }
.builder-series-dialog__header h2 { margin: 0; font-family: var(--font-brand-serif); font-size: 24px; font-weight: 400; line-height: 1.4; text-transform: none; }
.builder-series-dialog__header h2 span { display: block; font-size: 18px; }
.builder-series-dialog button { display: grid; width: 44px; height: 44px; flex: none; place-items: center; border: 1px solid rgb(255 255 255 / 40%); border-radius: 50%; color: #fff; background: transparent; cursor: pointer; }
.builder-series-dialog button:focus-visible { outline: 2px solid #caa05c; outline-offset: 3px; }
.builder-series-dialog button:hover { color: #caa05c; border-color: #caa05c; }
.builder-series-dialog button:disabled { opacity: .35; cursor: default; }
.builder-series-dialog button svg { width: 22px; height: 22px; }
.builder-series-dialog__image { min-height: 0; height: min(65dvh, 700px); background: #1c1c1d; }
.builder-series-dialog__controls { display: flex; flex: none; align-items: center; justify-content: center; gap: 24px; margin-top: 16px; font-family: var(--font-cjk-sans); }
.builder-series-dialog__controls span { min-width: 48px; text-align: center; }
:global(html:has(.builder-series-dialog[open])) { overflow: hidden; }
.sakura-kitchen-series__cta { display: flex; justify-content: center; margin-top: 58px; }

.sakura-kitchen-content-cta { display: inline-flex; width: max-content; min-height: 60px; flex: none; align-items: center; gap: 8px; padding: 9px 9px 9px 30px; border: 1px solid rgb(159 159 164 / 64%); border-radius: 999px; color: #1c1c1d; background: transparent; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 22px; text-decoration: none; white-space: nowrap; transition: color .3s ease, border-color .3s ease, background-color .3s ease; }
.sakura-kitchen-content-cta:hover,
.sakura-kitchen-content-cta:focus-visible { color: #fff; border-color: #caa05c; background: #caa05c; }
.sakura-kitchen-content-cta__icon { position: relative; isolation: isolate; display: inline-flex; width: 40px; height: 40px; flex: none; align-items: center; justify-content: center; border-radius: 50%; color: #fff; background: #caa05c; transform: rotate(-45deg); transition: transform .5s ease; }
.sakura-kitchen-content-cta__icon svg { width: 20px; height: 20px; }
.sakura-kitchen-content-cta:hover .sakura-kitchen-content-cta__icon,
.sakura-kitchen-content-cta:focus-visible .sakura-kitchen-content-cta__icon { transform: rotate(0); }
.sakura-kitchen-content-cta:focus-visible { outline: 2px solid #caa05c; outline-offset: 4px; }
.sakura-kitchen-content-cta--photo { color: #fff; border-color: rgb(255 255 255 / 60%); background: rgb(28 28 29 / 48%); backdrop-filter: blur(12px); }

@media (max-width: 1024px) {
  .sakura-kitchen-hero { aspect-ratio: 1.72 / 1; }
  .sakura-kitchen-hero__brand { left: 34px; bottom: 165px; width: 52%; }
  .sakura-kitchen-hero__booking { left: 34px; }
  .sakura-kitchen-hero__project-card { right: 78px; bottom: 24px; width: min(380px, 42%); }
  .sakura-kitchen-heading h2 { font-size: 40px; line-height: 50px; }
  .sakura-kitchen-series__grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
}

@media (max-width: 1023px) {
  #sakura-kitchen-series-title { font-size: 42px; }
  .sakura-kitchen-series-chinese { font-size: 32px; }
}

@media (max-width: 767px) {
  .sakura-kitchen-hero-shell { padding: 80px 15px 0; }
  .sakura-kitchen-hero { display: flex; min-height: 720px; flex-direction: column; align-items: center; gap: 24px; aspect-ratio: auto; padding: 120px 0 20px; border-radius: 18px; }
  .sakura-kitchen-hero__image :deep(img) { object-position: 57% center; }
  .sakura-kitchen-hero__shade { background: linear-gradient(180deg, rgb(16 8 1 / 70%) 0%, rgb(16 8 1 / 24%) 46%, rgb(16 8 1 / 70%) 100%); }
  .sakura-kitchen-hero__brand { position: relative; top: auto; right: auto; bottom: auto; left: auto; width: calc(100% - 44px); text-align: center; }
  .sakura-kitchen-hero__logo { width: 260px; margin-inline: auto; }
  .sakura-kitchen-hero__logo-zh { width: 205px; margin: 8px auto 0; }
  .sakura-kitchen-hero__description { max-width: 318px; margin: 18px auto 0; font-size: 14px; line-height: 23px; }
  .sakura-kitchen-hero__booking { position: relative; bottom: auto; left: auto; width: 90px; height: 90px; flex: none; margin-top: auto; }
  .sakura-kitchen-hero__project-card { position: relative; right: auto; bottom: auto; left: auto; width: calc(100% - 40px); max-width: 330px; flex: none; aspect-ratio: auto; gap: 9px; border-radius: 18px; padding: 7px 10px 7px 7px; }
  .sakura-kitchen-hero__project-card-thumb { border-radius: 12px; }
  .sakura-kitchen-hero__project-card-copy strong { font-size: 15px; }
  .sakura-kitchen-hero__project-card-copy > span:not(.sakura-kitchen-hero__project-card-link) { margin-top: 5px; font-size: 10.5px; line-height: 13.5px; }
  .sakura-kitchen-hero__project-card-link { margin-top: 5px; font-size: 10.5px; }
  .sakura-kitchen-advantage { padding: 70px 15px 24px; }
  .sakura-kitchen-series { padding: 24px 15px 80px; }
  .sakura-kitchen-series .internal-rail-safe { padding-right: 0; }
  .sakura-kitchen-heading h2 { font-size: 34px; line-height: 43px; }
  #sakura-kitchen-series-title { font-size: 30px; line-height: 35px; }
  .sakura-kitchen-series-chinese { font-size: 28px; }
  .sakura-kitchen-heading--series .sakura-kitchen-heading__kicker { margin-bottom: 28px; }
  .sakura-kitchen-heading__copy { margin-top: 20px; text-align: left; }
  .sakura-kitchen-heading__copy p { font-size: 15px; line-height: 24px; }
  .sakura-kitchen-panorama { display: grid; grid-template-columns: minmax(0, 1fr); grid-template-rows: auto calc((100vw - 30px) / 2.2); gap: 24px; min-height: 0; aspect-ratio: auto; margin-top: 42px; overflow: visible; border-radius: 0; background: transparent; }
  .sakura-kitchen-panorama > :deep(.builder-image) { position: relative; inset: auto; grid-area: 2 / 1; height: auto; border-radius: 18px; }
  .sakura-kitchen-panorama__shade { position: relative; inset: auto; grid-area: 2 / 1; border-radius: 18px; pointer-events: none; }
  .sakura-kitchen-panorama:has([role="alert"]) { grid-template-rows: auto auto; }
  .sakura-kitchen-panorama :deep(img) { object-position: 57% center; }
  .sakura-kitchen-panorama .sakura-kitchen-content-cta { position: relative; left: auto; bottom: auto; grid-area: 1 / 1; justify-self: center; color: #1c1c1d; border-color: rgb(159 159 164 / 64%); background: transparent; backdrop-filter: none; transform: none; }
  .sakura-kitchen-panorama .sakura-kitchen-content-cta:hover,
  .sakura-kitchen-panorama .sakura-kitchen-content-cta:focus-visible { color: #fff; border-color: #caa05c; background: #caa05c; transform: none; }
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
