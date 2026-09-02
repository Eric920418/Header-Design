<script setup lang="ts">
import { onBeforeUnmount, onMounted, ref } from 'vue'
import { brandBenefits } from '~/data/brandAdvantage'

const storyRef = ref<HTMLElement | null>(null)
const scrollStoryActive = ref(false)
let stopScrollStory: (() => void) | undefined

onMounted(() => {
  const media = window.matchMedia('(min-width: 1201px) and (prefers-reduced-motion: no-preference)')
  let frame = 0

  const update = () => {
    frame = 0
    const story = storyRef.value
    scrollStoryActive.value = media.matches
    if (!story || !media.matches) {
      story?.style.removeProperty('--reveal-2')
      story?.style.removeProperty('--reveal-3')
      return
    }

    const rect = story.getBoundingClientRect()
    const range = Math.max(story.offsetHeight - window.innerHeight + 80, 1)
    const progress = Math.min(Math.max((80 - rect.top) / range, 0), 1)
    const reveal = (start: number) => Math.min(Math.max((progress - start) / .24, 0), 1)
    story.style.setProperty('--reveal-2', String(reveal(.18)))
    story.style.setProperty('--reveal-3', String(reveal(.5)))
  }

  const requestUpdate = () => {
    if (!frame) frame = window.requestAnimationFrame(update)
  }

  window.addEventListener('scroll', requestUpdate, { passive: true })
  window.addEventListener('resize', requestUpdate)
  media.addEventListener('change', requestUpdate)
  update()

  stopScrollStory = () => {
    if (frame) window.cancelAnimationFrame(frame)
    window.removeEventListener('scroll', requestUpdate)
    window.removeEventListener('resize', requestUpdate)
    media.removeEventListener('change', requestUpdate)
  }
})

onBeforeUnmount(() => stopScrollStory?.())
</script>

<template>
  <section class="brand-benefits" aria-labelledby="brand-benefits-title">
    <div class="brand-benefits-rail internal-rail-safe">
      <header v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="brand-benefits-heading ev">
        <h2 id="brand-benefits-title">Take A Look At <span>Our Latest<br />Blog</span> &amp; Articles.</h2>
        <p>櫻花整體廚房擁有近百家門市，第一線接觸消費者的設計師皆受過專業的產品力及設計力之培訓、及廚藝大學之認證，提供給消費者最符合其需求的廚房規劃。</p>
      </header>

      <div ref="storyRef" class="brand-benefit-story" :class="{ 'is-scroll-story': scrollStoryActive }">
        <div class="brand-benefit-stage">
          <div class="brand-benefit-grid">
            <article
              v-for="(benefit, index) in brandBenefits"
              :key="benefit.id"
              v-reveal="{ anim: 'opalMoveUp', delay: index * 100 }"
              data-ev="opalMoveUp"
              class="brand-benefit-card ev"
              :style="{ animationDelay: `${index * 100}ms` }"
            >
              <InternalBrandImage :src="benefit.image" :alt="`${benefit.number} ${benefit.title}`" class="brand-benefit-image" />
              <div class="brand-benefit-copy">
                <div class="brand-benefit-eyebrow"><strong>{{ benefit.number }}</strong><span>{{ benefit.englishTitle }}</span></div>
                <h3>{{ benefit.title }}</h3>
                <p>{{ benefit.description }}</p>
                <span class="brand-benefit-number" aria-hidden="true">{{ benefit.number }}</span>
              </div>
            </article>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.brand-benefits { overflow: clip; padding: 100px 30px 60px; background: linear-gradient(180deg, #fff 0%, #fafafa 72.12%); }
.brand-benefits-rail { width: min(1410px, 100%); margin-inline: auto; }
.brand-benefits-heading { width: min(900px, 100%); margin: 0 auto 60px; text-align: center; }
.brand-benefits-heading h2 { margin: 0; color: #1c1c1d; font-family: var(--font-display); font-size: 60px; font-weight: 400; line-height: 64px; text-transform: capitalize; }
.brand-benefits-heading h2 span { color: #caa05c; }
.brand-benefits-heading > p { max-width: 830px; margin: 24px auto 0; color: #59585d; font-size: 16px; line-height: 26px; }
.brand-benefit-story { position: relative; }
.brand-benefit-grid { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 30px; }
.brand-benefit-card { position: relative; min-width: 0; min-height: 590px; overflow: hidden; border-radius: 28px; background: #fff; box-shadow: 0 24px 70px rgb(28 28 29 / 8%); }
.brand-benefit-image { width: calc(100% - 32px); margin: 16px; aspect-ratio: 1.62 / 1; border-radius: 20px; }
.brand-benefit-copy { min-height: 240px; padding: 24px 28px 58px; }
.brand-benefit-eyebrow { display: flex; align-items: baseline; gap: 7px; margin-bottom: 12px; color: #1c1c1d; font-family: var(--font-ui); }
.brand-benefit-eyebrow strong { color: #caa05c; font-size: 18px; font-weight: 600; line-height: 24px; }
.brand-benefit-eyebrow span { font-size: 15px; font-weight: 600; line-height: 22px; }
.brand-benefit-copy h3 { margin: 0 0 14px; color: #1c1c1d; font-family: var(--font-cjk-serif); font-size: 25px; font-weight: 500; line-height: 36px; }
.brand-benefit-copy p { position: relative; z-index: 1; margin: 0; color: #59585d; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 25px; }
.brand-benefit-number { position: absolute; right: 24px; bottom: 18px; color: #e3e3e8; font-family: var(--font-ui); font-size: 80px; font-weight: 400; line-height: 1; }

@media (min-width: 1201px) and (prefers-reduced-motion: no-preference) {
  .brand-benefit-story.is-scroll-story { height: calc(100vh + 1050px); }
  .brand-benefit-story.is-scroll-story .brand-benefit-stage { position: sticky; top: 80px; }
  .brand-benefit-story.is-scroll-story .brand-benefit-card { visibility: visible !important; animation: none !important; transition: opacity .08s linear, transform .08s linear; }
  .brand-benefit-story.is-scroll-story .brand-benefit-card:first-child { opacity: 1; transform: none; }
  .brand-benefit-story.is-scroll-story .brand-benefit-card:nth-child(2) { opacity: var(--reveal-2, 0); transform: translate3d(0, calc((1 - var(--reveal-2, 0)) * 110px), 0) scale(calc(.96 + var(--reveal-2, 0) * .04)); }
  .brand-benefit-story.is-scroll-story .brand-benefit-card:nth-child(3) { opacity: var(--reveal-3, 0); transform: translate3d(0, calc((1 - var(--reveal-3, 0)) * 110px), 0) scale(calc(.96 + var(--reveal-3, 0) * .04)); }
}

@media (max-width: 1200px) {
  .brand-benefit-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
}

@media (max-width: 1024px) {
  .brand-benefits { padding-block: 80px; }
  .brand-benefits-heading h2 { font-size: 48px; line-height: 52px; }
}

@media (max-width: 767px) {
  .brand-benefits { padding: 60px 15px; }
  .brand-benefits-rail.internal-rail-safe { padding-right: 72px; }
  .brand-benefits-heading { margin-bottom: 45px; }
  .brand-benefits-heading h2 { font-size: 30px; line-height: 35px; }
  .brand-benefits-heading > p { font-size: 15px; line-height: 24px; text-align: left; }
  .brand-benefit-grid { grid-template-columns: 1fr; gap: 45px; }
  .brand-benefit-card { min-height: auto; }
  .brand-benefit-copy { min-height: auto; padding: 24px 24px 80px; }
  .brand-benefit-copy h3 { font-size: 22px; line-height: 32px; }
  .brand-benefit-copy p { font-size: 15px; line-height: 24px; }
}
</style>
