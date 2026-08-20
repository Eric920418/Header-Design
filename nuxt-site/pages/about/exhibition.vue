<script setup lang="ts">
import { Clock3, MapPin } from 'lucide-vue-next'
import { brandPavilions, pavilionNotice } from '~/data/brandPavilions'

const activePavilionId = ref<(typeof brandPavilions)[number]['id']>('taipei')
const activePavilion = computed(() => brandPavilions.find(item => item.id === activePavilionId.value) ?? brandPavilions[0]!)

useSeoMeta({
  title: '集團品牌館｜SAKURA 整體廚房',
  description: '認識 SAKURA 集團品牌館以享受、交流、體驗為核心的空間設計，並查看台北館、台中館與高雄館資訊。',
  ogTitle: '集團品牌館｜SAKURA 整體廚房',
  ogDescription: '查看 SAKURA 集團品牌館的空間理念、三館地址、營業時間與預約參觀注意事項。',
  ogImage: '/section-5/brand-pavilion/banner.jpg',
})
</script>

<template>
  <main class="pavilion-single-page">
    <InternalBrandPavilionHero />

    <article class="pavilion-single-post antra-style-post-2">
      <div class="single-content">
        <div class="entry-content">
          <p v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="pavilion-lead ev">
            透過鏡面延伸感打破空間框架限制、以天花格柵創造無邊際之視覺效果，創造空間通透感，營造宛如現代美術館般之空間氛圍。
          </p>

          <section v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="pavilion-copy-block ev" aria-labelledby="pavilion-fundamentals-title">
            <h2 id="pavilion-fundamentals-title">Understanding The Fundamentals</h2>
            <h3>享受、交流、體驗</h3>
            <p>以人為主的體驗融入整體空間設計中，完整打造家庭生活場域，讓家人間的生活交流互動體現於居家空間內，空間氛圍以「六感體驗」為主軸，體驗生活就是一門藝術的感官饗宴。</p>
          </section>

          <div class="image-content pavilion-image-row" data-elementor-columns-tablet="2" data-elementor-columns-mobile="1">
            <div v-reveal="{ anim: 'opalScaleUp' }" data-ev="opalScaleUp" class="column-item ev">
              <InternalBrandImage src="/section-5/brand-pavilion/interior-main.jpg" alt="集團品牌館客廳與廚房展示空間" />
            </div>
            <div v-reveal="{ anim: 'opalScaleUp', delay: 100 }" data-ev="opalScaleUp" class="column-item ev" style="animation-delay:100ms">
              <InternalBrandImage src="/section-5/brand-pavilion/interior-gallery.png" alt="集團品牌館多元空間展示" fit="contain" />
            </div>
          </div>

          <section class="pavilion-gallery" aria-labelledby="pavilion-gallery-title">
            <header v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="pavilion-gallery-heading ev">
              <span class="pavilion-gallery-kicker"><i aria-hidden="true" />Our Gallery</span>
              <h2 id="pavilion-gallery-title">Gallery Of Inspiring <span>Interior</span> Designs</h2>
            </header>

            <div v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="pavilion-filter ev" role="tablist" aria-label="選擇集團品牌館">
              <button
                v-for="pavilion in brandPavilions"
                :id="`pavilion-tab-${pavilion.id}`"
                :key="pavilion.id"
                type="button"
                role="tab"
                :aria-selected="activePavilionId === pavilion.id"
                :aria-controls="`pavilion-panel-${pavilion.id}`"
                @click="activePavilionId = pavilion.id"
              >
                {{ pavilion.name }}
              </button>
            </div>

            <div
              :id="`pavilion-panel-${activePavilion.id}`"
              :key="activePavilion.id"
              class="pavilion-project project-style-1"
              role="tabpanel"
              :aria-labelledby="`pavilion-tab-${activePavilion.id}`"
            >
              <div v-reveal="{ anim: 'opalScaleUp' }" data-ev="opalScaleUp" class="project-block ev">
                <div class="project-transition">
                  <InternalBrandImage :src="activePavilion.image" :alt="activePavilion.alt" class="project-image" />
                </div>
              </div>
              <div class="project-text-box">
                <h3>{{ activePavilion.name }}</h3>
                <dl>
                  <div><dt><MapPin aria-hidden="true" />地址</dt><dd>{{ activePavilion.address }}</dd></div>
                  <div><dt><Clock3 aria-hidden="true" />營業時間</dt><dd>{{ activePavilion.hours }}</dd></div>
                </dl>
              </div>
            </div>
          </section>

          <section class="pavilion-copy-block pavilion-copy-block--last" aria-labelledby="pavilion-styles-title">
            <h2 id="pavilion-styles-title">Exploring Design Styles</h2>
            <h3 class="pavilion-notes-title">注意事項</h3>
            <ol class="pavilion-notes">
              <li v-for="(notice, index) in pavilionNotice" :key="notice">
                <span>{{ String(index + 1).padStart(2, '0') }}</span>
                <p>{{ notice }}</p>
              </li>
            </ol>
          </section>
        </div>
      </div>
    </article>
  </main>
</template>

<style scoped>
.pavilion-single-page { background: #f6f6f6; }
.pavilion-single-post { overflow: hidden; padding: 0 30px 118px; background: #f6f6f6; }
.single-content { width: min(930px, 100%); margin-inline: auto; }
.entry-content { overflow: visible; }
.entry-content p { margin: 0 0 30px; color: #59585d; font-size: 16px; line-height: 24px; }
.pavilion-lead { padding-top: 10px; }
.pavilion-copy-block h2 { margin: 0 0 23px; color: #1c1c1d; font-family: var(--font-display); font-size: 40px; font-weight: 400; line-height: 44px; text-transform: capitalize; }
.pavilion-copy-block h3 { margin: 0 0 13px; color: #caa05c; font-size: 19px; font-weight: 500; line-height: 27px; }
.pavilion-copy-block--last { padding-top: 50px; }
.pavilion-copy-block--last p { margin-bottom: 0; }

.image-content { position: relative; left: 50%; width: 100vw; max-width: 1290px; transform: translateX(-50%); }
.pavilion-image-row { display: flex; gap: 30px; padding: 0 0 30px; margin-top: 30px; }
.pavilion-image-row .column-item { min-width: 0; flex: 0 0 calc(50% - 15px); overflow: hidden; border-radius: 24px; }
.pavilion-image-row :deep(.brand-image-frame) { width: 100%; aspect-ratio: 1.4516129032; border-radius: 24px; }
.pavilion-image-row .column-item:last-child :deep(.brand-image-frame) { background: #000; }

.pavilion-gallery { position: relative; left: 50%; width: 100vw; max-width: 1290px; padding: 52px 0 0; transform: translateX(-50%); }
.pavilion-gallery-heading { display: grid; grid-template-columns: 30% 70%; align-items: start; margin-bottom: 38px; }
.pavilion-gallery-kicker { display: inline-flex; width: fit-content; align-items: center; gap: 7px; padding: 7px 14px; border: 1px solid #7272722e; border-radius: 24px; color: #1c1c1d; font-family: var(--font-ui); font-size: 12px; line-height: 14px; text-transform: uppercase; }
.pavilion-gallery-kicker i { width: 6px; height: 6px; border-radius: 50%; background: #caa05c; }
.pavilion-gallery-heading h2 { margin: 0; color: #1c1c1d; font-family: var(--font-display); font-size: 60px; font-weight: 400; line-height: 64px; text-transform: capitalize; }
.pavilion-gallery-heading h2 span { color: #caa05c; }
.pavilion-filter { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 30px; margin-bottom: 30px; }
.pavilion-filter button { min-height: 46px; padding: 9px 18px; border: 1px solid #e3e3e8; border-radius: 100px; color: #59585d; background: #fff; font-size: 15px; line-height: 24px; text-align: left; cursor: pointer; transition: color .3s ease, border-color .3s ease, background .3s ease; }
.pavilion-filter button::after { content: "+"; float: right; color: #9f9fa4; }
.pavilion-filter button[aria-selected="true"] { border-color: #caa05c; color: #fff; background: #caa05c; }
.pavilion-filter button[aria-selected="true"]::after { content: "−"; color: #fff; }

.pavilion-project { display: grid; grid-template-columns: minmax(0, 42.5%) minmax(0, 57.5%); align-items: start; gap: 30px; padding: 0 0 42px; }
.project-block { min-width: 0; }
.project-transition { position: relative; overflow: hidden; border-radius: 24px; }
.project-transition::after { position: absolute; inset: 0; content: ""; pointer-events: none; background: rgb(0 0 0 / 15%); transition: background .5s ease; }
.project-image { width: 100%; aspect-ratio: 1.4516129032; border-radius: 24px; }
.project-image :deep(img) { transition: transform .5s ease; }
.project-block:hover .project-transition::after { background: rgb(0 0 0 / 25%); }
.project-block:hover .project-image :deep(img) { transform: scale(1.05); }
.project-text-box { min-width: 0; padding: 3px 0 0; }
.project-text-box h3 { margin: 0 0 18px; color: #1c1c1d; font-family: var(--font-display); font-size: 30px; font-weight: 400; line-height: 34px; }
.project-text-box dl { display: grid; grid-template-columns: 1fr 1fr; gap: 22px; margin: 0 0 22px; }
.project-text-box dl div { border-top: 1px solid #e3e3e8; padding-top: 12px; }
.project-text-box dt { display: flex; align-items: center; gap: 7px; color: #1c1c1d; font-size: 13px; font-weight: 500; line-height: 20px; }
.project-text-box dt svg { width: 15px; height: 15px; color: #caa05c; }
.project-text-box dd { margin: 6px 0 0; color: #59585d; font-size: 14px; line-height: 21px; }
.pavilion-copy-block .pavilion-notes-title { margin: 0 0 8px; color: #1c1c1d; font-size: 20px; font-weight: 600; line-height: 28px; }
.pavilion-notes { margin: 0; padding: 0; list-style: none; }
.pavilion-notes li { display: grid; grid-template-columns: 34px minmax(0, 1fr); gap: 14px; padding: 14px 0; border-top: 1px solid #e3e3e8; }
.pavilion-notes span { color: #caa05c; font-family: var(--font-ui); font-size: 14px; line-height: 24px; }
.pavilion-notes p { margin: 0; color: #1c1c1d; font-size: 14px; font-weight: 500; line-height: 24px; }

@media (min-width: 768px) and (max-width: 1410px) {
  .image-content,
  .pavilion-gallery { max-width: calc(100vw - 60px); }
}

@media (max-width: 1024px) {
  .pavilion-gallery-heading h2 { font-size: 48px; line-height: 52px; }
  .pavilion-project { grid-template-columns: minmax(0, 42%) minmax(0, 58%); gap: 24px; }
  .project-text-box dl { grid-template-columns: 1fr; gap: 10px; }
}

@media (max-width: 767px) {
  .pavilion-single-post { padding: 0 15px 60px; }
  .pavilion-lead { padding-top: 0; }
  .pavilion-copy-block h2 { margin-bottom: 18px; font-size: 30px; line-height: 33px; }
  .pavilion-copy-block h3 { font-size: 18px; line-height: 26px; }
  .entry-content p { font-size: 15px; line-height: 24px; }
  .image-content,
  .pavilion-gallery { max-width: calc(100vw - 30px); }
  .pavilion-image-row { display: block; margin-top: 15px; padding-bottom: 0; }
  .pavilion-image-row .column-item { margin-bottom: 30px; }
  .pavilion-gallery { padding-top: 30px; }
  .pavilion-gallery-heading { display: block; margin-bottom: 30px; text-align: center; }
  .pavilion-gallery-kicker { margin-inline: auto; }
  .pavilion-gallery-heading h2 { margin-top: 20px; font-size: 30px; line-height: 35px; }
  .pavilion-filter { grid-template-columns: 1fr; gap: 10px; margin-bottom: 25px; }
  .pavilion-project { grid-template-columns: 1fr; gap: 25px; padding-bottom: 20px; }
  .project-text-box h3 { font-size: 26px; line-height: 30px; }
  .pavilion-copy-block--last { padding-top: 35px; }
}

@media (prefers-reduced-motion: reduce) {
  .pavilion-filter button,
  .project-transition::after,
  .project-image :deep(img) { transition: none; }
}
</style>
