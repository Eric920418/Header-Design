<script setup lang="ts">
import emblaCarouselVue from 'embla-carousel-vue'
import { Check, ChevronLeft, ChevronRight, Plus } from 'lucide-vue-next'
import { AI_KITCHEN_PAGE } from '~/data/kitchenSeries'
import { KITCHEN_STYLES } from '~/data/kitchenStyles'

const data = AI_KITCHEN_PAGE
const reducedMotion = useReducedMotion()
const currentHero = ref(0)
const previousHero = ref(0)
const heroTransition = ref(0)
const activeSuiteIndex = ref(0)
const activeSuiteImageIndex = ref(0)
const casesPaused = ref(false)
const casesInteracted = ref(false)
const seriesOpen = ref(false)
const [casesViewport, casesApi] = emblaCarouselVue({ loop: true, align: 'start', skipSnaps: false, duration: 32 })

const heroStories = [
  {
    eyebrow: 'AI Cabinet',
    title: '感應閘門櫃',
    description: '輕鬆省力地開啟與下降，不需費力即可操作；同時隱藏調味料與餐具，維持廚房整潔有序。',
  },
  {
    eyebrow: 'AI Faucet',
    title: 'AI 智能感應龍頭',
    description: 'AI 感應開關即時監控水溫，三段光氛辨識冷暖；伸縮磁吸回歸，單手切換花灑與水柱。',
  },
  {
    eyebrow: 'AI Light',
    title: '廚下手掃可調光 LED 照明',
    description: '輕輕揮手即可控制燈光開關與亮度，讓備餐、清潔與夜間使用更直覺便利。',
  },
]

const activeSuite = computed(() => data.suites[activeSuiteIndex.value]!)
const activeSuiteImages = computed(() => activeSuite.value.images)
const activeSuitePrimaryImage = computed(() => activeSuiteImages.value[activeSuiteImageIndex.value]!)
const activeSuiteSecondaryImage = computed(() => activeSuiteImages.value[(activeSuiteImageIndex.value + 1) % activeSuiteImages.value.length]!)
const activeHeroStory = computed(() => heroStories[currentHero.value]!)
const visibleEquipment = data.equipment.slice(0, 5)
const casesLoop = computed(() => [...data.cases, ...data.cases])
let heroTimer: ReturnType<typeof setInterval> | undefined
let casesTimer: ReturnType<typeof setInterval> | undefined
let stopMotionWatch: (() => void) | undefined
let caseMorphFrame: number | undefined

function showHero(index: number) {
  previousHero.value = currentHero.value
  currentHero.value = (index + data.heroSlides.length) % data.heroSlides.length
  heroTransition.value += 1
}

function changeHero() {
  showHero(currentHero.value + 1)
}

function activateSuite(index: number) {
  if (index === activeSuiteIndex.value) return
  activeSuiteIndex.value = index
  activeSuiteImageIndex.value = 0
}

function showPreviousSuiteImage() {
  const imageCount = activeSuiteImages.value.length
  if (imageCount < 2) return
  activeSuiteImageIndex.value = (activeSuiteImageIndex.value - 1 + imageCount) % imageCount
}

function showNextSuiteImage() {
  const imageCount = activeSuiteImages.value.length
  if (imageCount < 2) return
  activeSuiteImageIndex.value = (activeSuiteImageIndex.value + 1) % imageCount
}

function formatGalleryNumber(value: number) {
  return String(value).padStart(2, '0')
}

function handleCasesKeydown(event: KeyboardEvent) {
  if (event.key === 'ArrowRight') {
    casesInteracted.value = true
    casesApi.value?.scrollNext()
  }
  if (event.key === 'ArrowLeft') {
    casesInteracted.value = true
    casesApi.value?.scrollPrev()
  }
}

function stopCasesAutoplay() {
  casesInteracted.value = true
}

function updateCaseMorph() {
  const viewport = casesViewport.value
  if (!(viewport instanceof HTMLElement)) return

  const viewportRect = viewport.getBoundingClientRect()
  const slides = viewport.querySelectorAll<HTMLElement>('.ai-cases__slide')
  const firstSlide = slides.item(0)
  const slidePitch = firstSlide?.getBoundingClientRect().width || 1
  const targetCenter = viewportRect.left + viewportRect.width / 2
  const morphEnabled = window.innerWidth > 1024

  slides.forEach((slide) => {
    const card = slide.querySelector<HTMLElement>('.ai-case-card')
    if (!card) return

    const cardRect = card.getBoundingClientRect()
    const distance = Math.abs(cardRect.left + cardRect.width / 2 - targetCenter)
    const focus = morphEnabled ? Math.max(0, Math.min(1, 1 - distance / slidePitch)) : 0
    const geometryFocus = 1 - Math.pow(1 - focus, 6)
    const sideImageHeight = cardRect.width / 1.40625
    const imageHeight = sideImageHeight + (560 - sideImageHeight) * geometryFocus

    card.style.setProperty('--case-focus', focus.toFixed(4))
    card.style.setProperty('--case-image-height', `${imageHeight.toFixed(2)}px`)
    card.style.setProperty('--case-image-radius', `${(24 * (1 - geometryFocus)).toFixed(2)}px`)
  })
}

function scheduleCaseMorph() {
  if (caseMorphFrame !== undefined) return
  caseMorphFrame = window.requestAnimationFrame(() => {
    caseMorphFrame = undefined
    updateCaseMorph()
  })
}

watch(casesApi, (api, _oldApi, onCleanup) => {
  if (!api) return
  nextTick(scheduleCaseMorph)
  api.on('scroll', scheduleCaseMorph)
  api.on('select', scheduleCaseMorph)
  api.on('settle', scheduleCaseMorph)
  api.on('reInit', scheduleCaseMorph)
  api.on('pointerDown', stopCasesAutoplay)
  onCleanup(() => {
    api.off('scroll', scheduleCaseMorph)
    api.off('select', scheduleCaseMorph)
    api.off('settle', scheduleCaseMorph)
    api.off('reInit', scheduleCaseMorph)
    api.off('pointerDown', stopCasesAutoplay)
  })
}, { immediate: true })

onMounted(() => {
  window.addEventListener('resize', scheduleCaseMorph, { passive: true })
  stopMotionWatch = watch(reducedMotion, (reduced) => {
    if (heroTimer) clearInterval(heroTimer)
    if (casesTimer) clearInterval(casesTimer)
    heroTimer = undefined
    casesTimer = undefined
    if (!reduced) {
      heroTimer = setInterval(changeHero, 5000)
      casesTimer = setInterval(() => {
        if (!casesPaused.value && !casesInteracted.value) casesApi.value?.scrollNext()
      }, 5000)
    }
  }, { immediate: true })
})
onBeforeUnmount(() => {
  if (heroTimer) clearInterval(heroTimer)
  if (casesTimer) clearInterval(casesTimer)
  if (caseMorphFrame !== undefined) window.cancelAnimationFrame(caseMorphFrame)
  window.removeEventListener('resize', scheduleCaseMorph)
  stopMotionWatch?.()
})

useSeoMeta({
  title: 'AI Kitchen AI廚房｜櫻花整體廚房',
  description: 'SAKURA AI KITCHEN，以智能科技、創新美學與便利機能，翻轉廚房烹飪體驗。',
  ogTitle: 'AI Kitchen AI廚房｜櫻花整體廚房',
  ogDescription: '突破未來格局，開啟廚房智高點。探索 i Fun、i Chef、i Loft Chic、i Premium 四套系。',
  ogImage: data.heroSlides[2],
})
</script>

<template>
  <main class="ai-kitchen-page">
    <section aria-labelledby="ai-kitchen-hero-title" class="ai-hero hero-includes-header">
      <div class="hidden" aria-hidden="true">
        <img v-for="image in data.heroSlides" :key="image" :src="image" alt="" loading="eager" decoding="async">
      </div>
      <div class="absolute inset-0 bg-[#6f6d69]" aria-hidden="true" />
      <div v-if="heroTransition > 0" class="absolute inset-0 overflow-hidden">
        <InternalBrandImage :src="data.heroSlides[previousHero]" alt="AI Kitchen 廚房空間" eager class="hero-page1-image-settled h-full w-full" />
      </div>
      <div :key="`mask-${heroTransition}-${currentHero}`" class="hero-page1-image-layer hero-page1-image-layer-masked">
        <InternalBrandImage :src="data.heroSlides[currentHero]" alt="AI Kitchen 輪播轉場圖片" eager class="hero-page1-image-active h-full w-full" />
        <span class="absolute inset-0 bg-[rgba(16,8,1,.46)]" aria-hidden="true" />
      </div>
      <div :key="`final-${heroTransition}-${currentHero}`" class="hero-page1-image-layer hero-page1-image-layer-final">
        <InternalBrandImage :src="data.heroSlides[currentHero]" alt="AI Kitchen 廚房空間" eager class="hero-page1-image-active h-full w-full" />
      </div>
      <span class="absolute inset-0 z-[3] bg-gradient-to-r from-black/55 via-black/15 to-black/10" aria-hidden="true" />
      <span class="absolute inset-x-0 bottom-0 z-[3] h-[45%] bg-gradient-to-t from-black/70 via-black/20 to-transparent" aria-hidden="true" />

      <div class="ai-hero__inner">
        <InternalSectionPill v-reveal="{ anim: 'opalMoveRight' }" tone="dark" class="ai-hero__eyebrow">Trusted Design Partner</InternalSectionPill>
        <h1 id="ai-kitchen-hero-title" v-reveal="{ anim: 'opalMoveUp', delay: 100 }" class="ai-hero__title">
          Design
        </h1>

        <NuxtLink to="/design-inspiration" aria-label="前往設計靈感" v-reveal="{ anim: 'opalScaleUp', delay: 220 }" class="hero-start-project ai-hero__cta">
          <span>Start<br>Project</span>
          <span class="ai-hero__cta-label--hover" aria-hidden="true">設計靈感</span>
        </NuxtLink>

        <div class="ai-hero__bottom">
          <span :key="`story-thumb-${currentHero}`" class="ai-hero__story-thumb">
            <InternalBrandImage :src="data.heroSlides[currentHero]" :alt="`${activeHeroStory.title}預覽`" class="h-full w-full" />
          </span>
          <div :key="`story-copy-${currentHero}`" class="ai-hero__story-copy">
            <span>{{ activeHeroStory.eyebrow }}</span>
            <strong>{{ activeHeroStory.title }}</strong>
            <p>{{ activeHeroStory.description }}</p>
          </div>
          <NuxtLink to="/catalogues/kitchenware-catalog" class="ai-hero__catalogue-link" aria-label="前往品牌系列型錄列表頁">
            <span>品牌系列<br>型錄</span>
          </NuxtLink>
          <div class="ai-hero__story-controls" aria-label="AI Kitchen 功能輪播控制">
            <button type="button" aria-label="上一項 AI Kitchen 功能" @click="showHero(currentHero - 1)"><ChevronLeft /></button>
            <button type="button" aria-label="下一項 AI Kitchen 功能" @click="showHero(currentHero + 1)"><ChevronRight /></button>
          </div>
        </div>
      </div>
      <span class="ai-hero__watermark" aria-hidden="true">Interior</span>
    </section>

    <aside class="ai-series-drawer" :class="{ 'is-open': seriesOpen }" aria-label="品牌系列快速選單">
      <div class="ai-series-drawer__panel">
        <NuxtLink
          v-for="style in KITCHEN_STYLES"
          :key="style.slug"
          :to="style.route || '/#kitchen-series'"
          :aria-current="style.slug === data.slug ? 'page' : undefined"
          :class="{ 'is-active': style.slug === data.slug }"
        >
          {{ style.zh }}
        </NuxtLink>
      </div>
      <button type="button" :aria-expanded="seriesOpen" :aria-label="seriesOpen ? '收合品牌系列選單' : '展開品牌系列選單'" @click="seriesOpen = !seriesOpen">
        <ChevronRight aria-hidden="true" />
        <span>品牌系列</span>
      </button>
    </aside>

    <section id="ai-kitchen-intro" aria-labelledby="ai-intro-title" class="ai-intro">
      <div class="page-container">
        <div class="ai-section-heading">
          <InternalTemplateHeadingRail v-reveal="{ anim: 'opalMoveRight' }" label="Kitchen Collections" />
          <h2 v-reveal="{ anim: 'opalMoveLeft', delay: 100 }">Creative Projects That<br><span>Define Our Style</span></h2>
        </div>
        <div class="ai-intro__content">
          <h3 id="ai-intro-title" v-reveal="{ anim: 'opalMoveRight' }">{{ data.intro.title }}</h3>
          <div v-reveal="{ anim: 'opalMoveLeft', delay: 120 }" class="ai-intro__paragraphs">
            <p v-for="paragraph in data.intro.paragraphs" :key="paragraph">{{ paragraph }}</p>
          </div>
        </div>

        <div v-reveal="{ anim: 'opalMoveUp' }" class="ai-suite-stage">
          <div :key="`${activeSuite.id}-${activeSuiteImageIndex}-left`" class="ai-suite-image ai-suite-image--left-top">
            <InternalBrandImage :src="activeSuitePrimaryImage" :alt="`${activeSuite.name} 套系空間 ${activeSuiteImageIndex + 1}`" class="h-full w-full" />
          </div>
          <div :key="`${activeSuite.id}-${activeSuiteImageIndex}-right`" class="ai-suite-image ai-suite-image--right-top">
            <InternalBrandImage :src="activeSuiteSecondaryImage" :alt="`${activeSuite.name} 套系空間 ${(activeSuiteImageIndex + 1) % activeSuiteImages.length + 1}`" class="h-full w-full" />
          </div>

          <div class="ai-suite-center">
            <div class="ai-suite-tabs" role="tablist" aria-label="AI Kitchen 四套系">
              <button
                v-for="(suite, index) in data.suites"
                :id="`suite-tab-${suite.id}`"
                :key="suite.id"
                type="button"
                role="tab"
                :aria-selected="activeSuiteIndex === index"
                :aria-controls="`suite-panel-${suite.id}`"
                :tabindex="activeSuiteIndex === index ? 0 : -1"
                :class="{ 'is-active': activeSuiteIndex === index }"
                @focus="activateSuite(index)"
                @click="activateSuite(index)"
              >
                <span class="ai-suite-tabs__icon"><Check v-if="activeSuiteIndex === index" /></span>
                <span>{{ suite.name }}</span>
              </button>
            </div>
            <div class="ai-suite-controls" aria-label="AI Kitchen 套系圖片切換">
              <button type="button" :disabled="activeSuiteImages.length < 2" :aria-label="`上一張 ${activeSuite.name} 圖片`" @click="showPreviousSuiteImage"><ChevronLeft aria-hidden="true" /></button>
              <span aria-live="polite">{{ formatGalleryNumber(activeSuiteImageIndex + 1) }} / {{ formatGalleryNumber(activeSuiteImages.length) }}</span>
              <button type="button" :disabled="activeSuiteImages.length < 2" :aria-label="`下一張 ${activeSuite.name} 圖片`" @click="showNextSuiteImage"><ChevronRight aria-hidden="true" /></button>
            </div>
          </div>
        </div>

        <div
          :id="`suite-panel-${activeSuite.id}`"
          :key="`${activeSuite.id}-details`"
          role="tabpanel"
          :aria-labelledby="`suite-tab-${activeSuite.id}`"
          class="ai-suite-details"
        >
          <div>
            <span class="ai-suite-details__number">0{{ activeSuiteIndex + 1 }}</span>
            <p class="ai-suite-details__name">{{ activeSuite.name }}</p>
            <h3 v-for="headline in activeSuite.headlines" :key="headline">{{ headline }}</h3>
          </div>
          <div>
            <p v-for="description in activeSuite.descriptions" :key="description" class="ai-suite-details__description">{{ description }}</p>
          </div>
          <div>
            <p class="ai-suite-details__equipment-title">廚電配備</p>
            <ul>
              <li v-for="item in activeSuite.equipment" :key="item">{{ item }}</li>
            </ul>
          </div>
        </div>
      </div>
    </section>

    <section aria-labelledby="finish-heading" class="ai-finishes">
      <div class="page-container">
        <div class="ai-centered-heading">
          <p v-reveal="{ anim: 'opalMoveUp' }">Material Selection</p>
          <h2 id="finish-heading" v-reveal="{ anim: 'opalMoveUp', delay: 90 }">Gallery Of Inspiring<br><span>Interior Designs</span></h2>
        </div>
        <div class="ai-finishes__grid">
          <article v-for="(finish, index) in data.finishes" :key="finish.code" v-reveal="{ anim: 'opalMoveUp', delay: index * 70 }">
            <InternalBrandImage
              :src="finish.image"
              :alt="`${finish.code} ${finish.name} 門板`"
              class="ai-finishes__image"
              :class="{ 'ai-finishes__image--light': finish.code === 'D0032' }"
            />
            <div class="ai-finishes__caption">
              <p>{{ finish.code }}</p>
              <h3>{{ finish.name }}</h3>
            </div>
          </article>
        </div>
      </div>
    </section>

    <section aria-labelledby="equipment-heading" class="ai-equipment">
      <div class="page-container">
        <div class="ai-centered-heading ai-centered-heading--compact">
          <p v-reveal="{ anim: 'opalMoveUp' }">Kitchen Appliances</p>
          <h2 id="equipment-heading" v-reveal="{ anim: 'opalMoveUp', delay: 90 }">Join Our Newsletter<br><span>Stay Up To Date</span></h2>
        </div>
        <div v-reveal="{ anim: 'opalMoveUp', delay: 160 }" class="ai-equipment__grid" aria-label="AI Kitchen 推薦廚電">
          <article v-for="equipment in visibleEquipment" :key="equipment.model" class="ai-equipment__item">
            <NuxtLink :to="equipment.route" class="ai-equipment__card" :aria-label="`查看 ${equipment.model} ${equipment.name}`">
              <InternalBrandImage :src="equipment.image" :alt="`${equipment.model} ${equipment.name}`" fit="contain" class="ai-equipment__image" />
              <h3><span>{{ equipment.model }}</span>{{ equipment.name }}</h3>
              <span class="ai-equipment__action" aria-hidden="true"><Plus /></span>
            </NuxtLink>
          </article>
        </div>
      </div>
    </section>

    <section aria-labelledby="cases-heading" class="ai-cases">
      <div class="page-container">
        <div class="ai-cases__heading">
          <InternalTemplateHeadingRail v-reveal="{ anim: 'opalMoveRight' }" label="Recommended Cases" class="ai-cases__heading-label" />
          <h2 id="cases-heading" v-reveal="{ anim: 'opalMoveLeft', delay: 90 }">Take A Look At <span>Our Latest Blog</span> &amp; Articles.</h2>
        </div>
        <div
          ref="casesViewport"
          class="ai-cases__viewport"
          aria-roledescription="carousel"
          aria-label="推薦設計案例"
          tabindex="0"
          @mouseenter="casesPaused = true"
          @mouseleave="casesPaused = false"
          @focusin="casesPaused = true"
          @focusout="casesPaused = false"
          @keydown="handleCasesKeydown"
        >
          <div class="ai-cases__track">
            <div v-for="(item, index) in casesLoop" :key="`${item.url}-${index}`" class="ai-cases__slide">
              <a :href="item.url" target="_blank" rel="noopener noreferrer" class="ai-case-card" :class="{ 'ai-case-card--initial-center': index === 1 }">
                <div class="ai-case-card__image"><InternalBrandImage :src="item.image" :alt="item.title" class="h-full w-full" /></div>
                <div class="ai-case-card__body ai-case-card__body--side">
                  <h3>{{ item.title }}</h3>
                  <p>{{ item.excerpt }}</p>
                </div>
                <div class="ai-case-card__body ai-case-card__body--featured" aria-hidden="true">
                  <h3>{{ item.title }}</h3>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
</template>

<style scoped>
.ai-kitchen-page { overflow: clip; background: #fff; color: #1c1c1d; }
.ai-hero { position: relative; height: 840px; overflow: hidden; background: #6f6d69; color: #fff; }
.ai-hero__inner { position: relative; z-index: 5; width: min(1584px, calc(100% - 60px)); height: 100%; margin-inline: auto; padding-top: 118px; }
.ai-hero__title { margin-top: 24px; max-width: 1100px; font-size: clamp(74px, 7.9vw, 130px); line-height: .93; letter-spacing: -.035em; text-transform: none; }
.ai-hero__cta { position: relative; display: inline-flex; width: 120px; height: 120px; overflow: hidden; align-items: center; justify-content: center; margin: 30px 0 0 30px; border: 1px solid rgb(255 255 255 / 25%); border-radius: 50%; background: rgb(255 255 255 / 10%); color: #fff; text-align: center; backdrop-filter: blur(12px); transition: background .4s, border-color .4s; }
.ai-hero__cta > span { position: absolute; z-index: 2; inset: 0; display: flex; align-items: center; justify-content: center; font-family: var(--font-display); font-size: 15px; line-height: 19px; transition: opacity .3s ease; }
.ai-hero__cta > .ai-hero__cta-label--hover { opacity: 0; font-family: var(--font-cjk-sans); }
.ai-hero__cta:hover, .ai-hero__cta:focus-visible { border-color: #caa05c; background: #caa05c; }
.ai-hero__cta:hover > span:first-child, .ai-hero__cta:focus-visible > span:first-child { opacity: 0; }
.ai-hero__cta:hover > .ai-hero__cta-label--hover, .ai-hero__cta:focus-visible > .ai-hero__cta-label--hover { opacity: 1; }
.ai-hero__bottom { position: absolute; right: 86px; bottom: 28px; left: 0; display: grid; min-height: 142px; grid-template-columns: 84px minmax(0, 1fr) 108px 94px; align-items: center; gap: 22px; border: 1px solid rgb(255 255 255 / 15%); border-radius: 24px; background: rgb(37 35 35 / 48%); padding: 14px 18px; backdrop-filter: blur(18px); }
.ai-hero__story-thumb { display: block; width: 78px; height: 78px; overflow: hidden; border: 1px solid rgb(255 255 255 / 32%); border-radius: 50%; animation: ai-story-in .55s ease both; }
.ai-hero__story-copy { min-width: 0; font-family: var(--font-cjk-sans); animation: ai-story-in .55s ease both; }
.ai-hero__story-copy > span { display: block; color: #caa05c; font-size: 12px; font-weight: 500; line-height: 18px; letter-spacing: .08em; text-transform: uppercase; }
.ai-hero__story-copy > strong { display: block; margin-top: 2px; color: #fff; font-size: 18px; font-weight: 500; line-height: 26px; }
.ai-hero__story-copy > p { display: -webkit-box; overflow: hidden; max-width: 700px; margin: 6px 0 0; color: rgb(255 255 255 / 78%); font-size: 15px; line-height: 23px; -webkit-box-orient: vertical; -webkit-line-clamp: 2; }
.ai-hero__catalogue-link { display: inline-flex; width: 98px; height: 98px; align-items: center; justify-content: center; border: 1px solid rgb(202 160 92 / 72%); border-radius: 50%; color: #fff; font-family: var(--font-cjk-sans); font-size: 13px; line-height: 18px; text-align: center; transition: color .3s ease, background-color .3s ease, transform .3s ease; }
.ai-hero__catalogue-link:hover, .ai-hero__catalogue-link:focus-visible { color: #1c1c1d; background: #caa05c; transform: translateY(-3px); }
.ai-hero__story-controls { display: flex; justify-content: flex-end; gap: 8px; }
.ai-hero__story-controls button { display: flex; width: 40px; height: 40px; align-items: center; justify-content: center; border: 1px solid rgb(255 255 255 / 24%); border-radius: 50%; color: #fff; transition: color .3s ease, border-color .3s ease, background-color .3s ease; }
.ai-hero__story-controls button:hover, .ai-hero__story-controls button:focus-visible { border-color: #caa05c; color: #1c1c1d; background: #caa05c; }
.ai-hero__story-controls svg { width: 17px; height: 17px; }
.ai-hero__watermark { position: absolute; z-index: 4; right: max(30px, calc((100vw - 1584px) / 2)); bottom: -90px; color: rgb(255 255 255 / 10%); font-family: var(--font-display); font-size: clamp(190px, 18vw, 320px); line-height: .8; pointer-events: none; }
@keyframes ai-story-in { from { opacity: 0; transform: translateY(12px); } to { opacity: 1; transform: none; } }

.ai-series-drawer { position: fixed; top: 50%; left: 0; z-index: 80; display: flex; align-items: flex-start; transform: translate(-190px, -50%); transition: transform .45s ease; }
.ai-series-drawer.is-open { transform: translate(0, -50%); }
.ai-series-drawer__panel { width: 190px; border-block: 1px solid rgb(255 255 255 / 12%); background: rgb(28 28 29 / 78%); padding-block: 10px; backdrop-filter: blur(14px); }
.ai-series-drawer__panel a { display: block; border-left: 2px solid transparent; padding: 8px 20px; color: rgb(255 255 255 / 80%); font-family: var(--font-cjk-sans); font-size: 15px; line-height: 22px; white-space: nowrap; transition: color .3s ease, border-color .3s ease, background-color .3s ease; }
.ai-series-drawer__panel a:hover, .ai-series-drawer__panel a:focus-visible, .ai-series-drawer__panel a.is-active { border-left-color: #caa05c; color: #caa05c; background: rgb(255 255 255 / 6%); }
.ai-series-drawer > button { display: flex; width: 42px; height: 146px; flex-direction: column; align-items: center; justify-content: center; gap: 9px; border: 1px solid rgb(255 255 255 / 12%); border-radius: 0 17px 17px 0; color: rgb(255 255 255 / 88%); background: rgb(28 28 29 / 72%); backdrop-filter: blur(14px); transition: color .3s ease, background-color .3s ease; }
.ai-series-drawer > button:hover, .ai-series-drawer > button:focus-visible { color: #caa05c; background: rgb(28 28 29 / 88%); }
.ai-series-drawer > button svg { width: 18px; height: 18px; transition: transform .45s ease; }
.ai-series-drawer.is-open > button svg { transform: rotate(180deg); }
.ai-series-drawer > button span { font-family: var(--font-cjk-sans); font-size: 15px; line-height: 18px; letter-spacing: .28em; writing-mode: vertical-rl; }

.ai-intro { padding: 100px 0; background: #f6f6f6; }
.ai-section-heading { display: grid; grid-template-columns: 30% 70%; align-items: start; }
.ai-section-heading h2 { max-width: 900px; margin: 70px 0 0; font-size: 60px; line-height: 64px; text-transform: none; }
.ai-section-heading h2 span, .ai-centered-heading h2 span { color: #caa05c; }
.ai-intro__content { display: grid; grid-template-columns: minmax(0, 1fr) 190px minmax(0, 1fr); gap: 24px; margin-top: 64px; padding-top: 44px; border-top: 1px solid #e3e3e8; }
.ai-intro__content h3 { grid-column: 1; max-width: 520px; margin: 0; font-family: var(--font-cjk-serif); font-size: 25px; font-weight: 500; line-height: 36px; letter-spacing: .02em; text-transform: none; }
.ai-intro__paragraphs { display: grid; grid-column: 3; gap: 14px; align-content: start; padding-top: 5px; color: #59585d; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 25px; }
.ai-intro__paragraphs p { margin: 0; }

.ai-suite-stage { display: grid; grid-template-columns: minmax(0, 1fr) 190px minmax(0, 1fr); grid-template-rows: 420px; gap: 24px; margin-top: 60px; }
.ai-suite-image { position: relative; overflow: hidden; border-radius: 24px; animation: ai-suite-image-in .8s cubic-bezier(.25,.46,.45,.94) both; }
.ai-suite-image::after { position: absolute; inset: 0; background: linear-gradient(to top, rgb(0 0 0 / 16%), transparent 55%); content: ''; pointer-events: none; }
.ai-suite-image--left-top { grid-column: 1; grid-row: 1; }
.ai-suite-image--right-top { grid-column: 3; grid-row: 1; }
.ai-suite-center { grid-column: 2; grid-row: 1; display: flex; min-width: 0; flex-direction: column; align-self: center; gap: 18px; }
.ai-suite-tabs { display: flex; flex-direction: column; }
.ai-suite-tabs button { position: relative; display: grid; grid-template-columns: 26px 1fr; align-items: center; gap: 9px; width: 100%; min-height: 56px; border-bottom: 1px solid #e3e3e8; color: #9f9fa4; text-align: left; transition: color .35s; }
.ai-suite-tabs button:first-child { border-top: 1px solid #e3e3e8; }
.ai-suite-tabs button::after { position: absolute; right: 0; bottom: -1px; left: 0; height: 1px; transform: scaleX(0); transform-origin: left; background: #caa05c; content: ''; transition: transform .8s cubic-bezier(.25,.46,.45,.94); }
.ai-suite-tabs button.is-active { color: #1c1c1d; }
.ai-suite-tabs button.is-active::after { transform: scaleX(1); }
.ai-suite-tabs__icon { display: flex; width: 24px; height: 24px; align-items: center; justify-content: center; border-radius: 7px; background: #caa05c; color: #fff; }
.ai-suite-tabs__icon svg { width: 14px; height: 14px; }
.ai-suite-tabs button > span:last-child { font-family: "Bodoni Moda", serif; font-size: 18px; line-height: 24px; }
.ai-suite-controls { display: flex; align-items: center; justify-content: center; gap: 10px; }
.ai-suite-controls button { display: inline-flex; width: 42px; height: 42px; flex: 0 0 auto; align-items: center; justify-content: center; border: 1px solid #d8d8dc; border-radius: 50%; color: #1c1c1d; background: #fff; transition: color .3s ease, border-color .3s ease, background-color .3s ease, transform .3s ease; }
.ai-suite-controls button:hover, .ai-suite-controls button:focus-visible { border-color: #caa05c; color: #fff; background: #caa05c; transform: translateY(-2px); }
.ai-suite-controls button:disabled { border-color: #e3e3e8; color: #c6c6ca; background: #f6f6f6; cursor: not-allowed; transform: none; }
.ai-suite-controls button svg { width: 17px; height: 17px; }
.ai-suite-controls > span { min-width: 48px; color: #9f9fa4; font-family: var(--font-cjk-sans); font-size: 12px; line-height: 18px; letter-spacing: .08em; text-align: center; }
.ai-suite-details { display: grid; grid-template-columns: 1.05fr 1fr 1fr; gap: 50px; margin-top: 22px; border-radius: 24px; background: #fff; padding: 42px 50px; box-shadow: 0 28px 80px -48px rgb(0 0 0 / 45%); animation: ai-suite-content-in .8s ease both; }
.ai-suite-details__number { color: #e3e3e8; font-family: var(--font-display); font-size: 54px; line-height: 1; }
.ai-suite-details__name { margin: -18px 0 20px 42px; color: #caa05c; font-family: var(--font-cjk-serif); font-size: 25px; font-weight: 500; line-height: 36px; }
.ai-suite-details h3 { margin: 6px 0 0; font-family: var(--font-cjk-serif); font-size: 20px; font-weight: 500; line-height: 30px; text-transform: none; }
.ai-suite-details > div:nth-child(2) { display: flex; flex-direction: column; align-self: start; justify-content: flex-start; padding-top: 92px; text-align: left; }
.ai-suite-details__description { margin: 0 0 12px; color: #59585d; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 25px; text-wrap: pretty; }
.ai-suite-details__equipment-title { margin: 0 0 14px; color: #caa05c; font-family: var(--font-cjk-serif); font-size: 20px; font-weight: 500; line-height: 28px; }
.ai-suite-details ul { margin: 0; padding: 0; list-style: none; }
.ai-suite-details li { padding: 7px 0; border-bottom: 1px solid #e3e3e8; color: #59585d; font-family: var(--font-cjk-sans); font-size: 14px; line-height: 21px; }
@keyframes ai-suite-image-in { from { clip-path: inset(0 0 100% 0); opacity: .2; } to { clip-path: inset(0); opacity: 1; } }
@keyframes ai-suite-content-in { from { opacity: 0; transform: translateY(22px); } to { opacity: 1; transform: none; } }

.ai-finishes, .ai-equipment, .ai-cases { padding: 120px 0; }
.ai-finishes { background: #fff; }
.ai-centered-heading { text-align: center; }
.ai-centered-heading > p { margin: 0 0 17px; color: #9f9fa4; font-family: var(--font-cjk-sans); font-size: 12px; letter-spacing: 1px; text-transform: uppercase; }
.ai-centered-heading h2 { margin: 0; font-size: 60px; line-height: 64px; text-transform: none; }
.ai-centered-heading--compact h2 { font-size: 52px; line-height: 58px; }
.ai-finishes__grid { display: grid; grid-template-columns: repeat(6, minmax(0, 1fr)); gap: 20px; margin-top: 55px; }
.ai-finishes__grid article { min-width: 0; }
.ai-finishes__image { aspect-ratio: 1; border-radius: 24px; transition: transform .5s; }
.ai-finishes__image--light { border: 1px solid #e3e3e8; background: #fff; }
.ai-finishes__image--light :deep(img) { transform: scale(1.012); }
.ai-finishes__grid article:hover .ai-finishes__image { transform: translateY(-7px); }
.ai-finishes__caption { width: calc(100% - 8px); margin: -2px auto 0; border: 1px solid #e3e3e8; background: #fff; padding: 10px 14px 13px; }
.ai-finishes__caption p { margin: 0; color: #9f9fa4; font-family: var(--font-cjk-sans); font-size: 13px; line-height: 18px; }
.ai-finishes__caption h3 { margin: 2px 0 0; font-family: var(--font-cjk-sans); font-size: 18px; font-weight: 400; line-height: 24px; text-transform: none; }

.ai-equipment { position: relative; overflow: hidden; background: #f6f6f6; }
.ai-equipment::before { position: absolute; inset: 0; opacity: .035; background-image: linear-gradient(#1c1c1d 1px, transparent 1px), linear-gradient(90deg, #1c1c1d 1px, transparent 1px); background-size: 46px 46px; content: ''; pointer-events: none; }
.ai-equipment .page-container { position: relative; }
.ai-equipment__grid { display: grid; grid-template-columns: repeat(5, minmax(0, 1fr)); gap: 24px; margin-top: 60px; }
.ai-equipment__item { min-width: 0; }
.ai-equipment__card { position: relative; display: block; color: inherit; }
.ai-equipment__image { aspect-ratio: 1.2; background: transparent; }
.ai-equipment__item h3 { margin: 20px auto 0; max-width: 220px; color: #59585d; font-family: var(--font-cjk-sans); font-size: 15px; font-weight: 400; line-height: 22px; text-align: center; text-transform: none; }
.ai-equipment__item h3 span { display: block; margin-bottom: 3px; color: #1c1c1d; font-family: var(--font-cjk-sans); font-size: 18px; font-weight: 500; }
.ai-equipment__action { position: absolute; top: 46%; right: 12px; display: flex; width: 44px; height: 44px; align-items: center; justify-content: center; border-radius: 50%; color: #fff; background: rgb(28 28 29 / 62%); opacity: 0; transform: translateY(10px); transition: opacity .3s ease, transform .3s ease, background-color .3s ease; }
.ai-equipment__action svg { width: 20px; height: 20px; }
.ai-equipment__card:hover .ai-equipment__action, .ai-equipment__card:focus-visible .ai-equipment__action { opacity: 1; transform: none; }
.ai-equipment__card:hover .ai-equipment__action { background: #caa05c; }

.ai-cases { background: #fff; }
.ai-cases__heading { display: grid; grid-template-columns: 30% 70%; }
.ai-cases__heading > h2 { max-width: 688px; margin: 0; padding: 64px 0 60px; font-size: 60px; line-height: 64px; text-transform: none; }
.ai-cases__heading > h2 span { color: #caa05c; }
.ai-cases__viewport { overflow: hidden; cursor: grab; outline: none; }
.ai-cases__viewport:focus-visible { box-shadow: 0 0 0 2px #caa05c inset; }
.ai-cases__viewport:active { cursor: grabbing; }
.ai-cases__track { display: flex; margin-left: -30px; touch-action: pan-y pinch-zoom; }
.ai-cases__slide { min-width: 0; flex: 0 0 33.333333%; padding-left: 30px; }
.ai-case-card { --case-focus: 0; --case-image-radius: 24px; position: relative; display: block; min-width: 0; height: 560px; overflow: hidden; border-radius: 24px; color: #1c1c1d; background: #fff; }
.ai-case-card--initial-center { --case-focus: 1; --case-image-height: 560px; --case-image-radius: 0px; }
.ai-case-card__image { position: relative; width: 100%; height: var(--case-image-height, auto); aspect-ratio: 1.40625; overflow: hidden; border-radius: 24px 24px var(--case-image-radius) var(--case-image-radius); will-change: height, border-radius; }
.ai-case-card__image::after { position: absolute; inset: 32% 0 0; background: linear-gradient(180deg, transparent, rgb(53 52 49 / 56%) 30%, #353431 100%); content: ''; opacity: var(--case-focus); pointer-events: none; will-change: opacity; }
.ai-case-card__image :deep(img) { transition: transform .5s; }
.ai-case-card:hover .ai-case-card__image :deep(img) { transform: scale(1.1); }
.ai-case-card__body { padding-top: 22px; }
.ai-case-card__body h3 { display: -webkit-box; overflow: hidden; margin: 0 0 19px; font-family: var(--font-cjk-serif); font-size: 20px; font-weight: 500; line-height: 30px; text-transform: none; -webkit-box-orient: vertical; -webkit-line-clamp: 2; }
.ai-case-card__body p { display: -webkit-box; overflow: hidden; margin: 0; color: #59585d; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 25px; -webkit-box-orient: vertical; -webkit-line-clamp: 3; }
.ai-case-card__body--side { opacity: calc(1 - var(--case-focus)); transform: translateY(calc(var(--case-focus) * 18px)); will-change: opacity, transform; }
.ai-case-card__body--featured { position: absolute; inset-inline: 0; bottom: 0; z-index: 2; padding: 40px 50px 44px; color: #fff; opacity: var(--case-focus); pointer-events: none; transform: translateY(calc((1 - var(--case-focus)) * 24px)); will-change: opacity, transform; }
.ai-case-card__body--featured h3 { margin: 0; }

@media (min-width: 1025px) {
  .ai-hero__inner { padding-left: clamp(0px, calc(70px - (100vw - 1584px) / 2), 40px); }
}

@media (max-width: 1200px) {
  .ai-hero { height: 760px; }
  .ai-hero__inner { padding-top: 95px; }
  .ai-hero__bottom { grid-template-columns: 72px minmax(0, 1fr) 98px 88px; gap: 16px; }
  .ai-hero__story-thumb { width: 68px; height: 68px; }
  .ai-intro__content { grid-template-columns: minmax(0, 1fr) 164px minmax(0, 1fr); gap: 18px; }
  .ai-suite-stage { grid-template-columns: minmax(0, 1fr) 164px minmax(0, 1fr); grid-template-rows: 360px; gap: 18px; }
  .ai-suite-tabs button { min-height: 50px; }
  .ai-suite-tabs button > span:last-child { font-size: 17px; line-height: 22px; }
  .ai-suite-controls { gap: 7px; }
  .ai-suite-controls button { width: 38px; height: 38px; }
  .ai-suite-details { gap: 30px; padding: 36px; }
  .ai-finishes__grid { gap: 14px; }
  .ai-finishes__caption { padding-inline: 10px; }
}

@media (max-width: 1024px) {
  .ai-hero { height: 720px; }
  .ai-hero__inner { padding-top: 80px; }
  .ai-hero__title { font-size: clamp(64px, 9.5vw, 96px); }
  .ai-hero__cta { width: 105px; height: 105px; margin-top: 24px; }
  .ai-series-drawer { display: none; }
  .ai-section-heading h2, .ai-centered-heading h2 { font-size: 48px; line-height: 53px; }
  .ai-intro__content { grid-template-columns: minmax(0, 1fr) 148px minmax(0, 1fr); gap: 14px; }
  .ai-suite-stage { grid-template-columns: minmax(0, 1fr) 148px minmax(0, 1fr); grid-template-rows: 320px; gap: 14px; }
  .ai-suite-tabs button { min-height: 48px; }
  .ai-suite-tabs button > span:last-child { font-size: 16px; line-height: 21px; }
  .ai-suite-controls button { width: 36px; height: 36px; }
  .ai-suite-controls > span { min-width: 42px; font-size: 11px; }
  .ai-suite-details { grid-template-columns: 1fr 1fr; }
  .ai-suite-details > div:last-child { grid-column: 1 / -1; }
  .ai-finishes__grid { grid-template-columns: repeat(3, 1fr); gap: 24px; }
  .ai-cases__heading > h2 { font-size: 50px; line-height: 56px; }
  .ai-cases__slide { flex-basis: 50%; }
  .ai-case-card { height: auto; overflow: visible; border-radius: 0; }
  .ai-case-card__image { height: auto !important; aspect-ratio: 1.40625; border-radius: 24px; }
  .ai-case-card__image::after { display: none; }
  .ai-case-card__body--side { opacity: 1; transform: none; }
  .ai-case-card__body--featured { display: none; }
}

@media (max-width: 767px) {
  .ai-hero { height: 760px; }
  .ai-hero__inner { width: auto; margin: 0 93px 0 15px; padding-top: 66px; }
  .ai-hero__title { margin-top: 18px; font-size: clamp(44px, 13vw, 68px); line-height: .98; }
  .ai-hero__cta { width: 82px; height: 82px; margin-top: 22px; margin-left: 15px; }
  .ai-hero__cta > span { font-size: 13px; line-height: 16px; }
  .ai-hero__bottom { right: 0; bottom: 18px; min-height: 236px; grid-template-columns: 76px minmax(0, 1fr); gap: 12px; border-radius: 18px; padding: 14px; }
  .ai-hero__story-thumb { width: 64px; height: 64px; }
  .ai-hero__story-copy > strong { font-size: 16px; line-height: 23px; }
  .ai-hero__story-copy > p { font-size: 13px; line-height: 20px; -webkit-line-clamp: 3; }
  .ai-hero__catalogue-link { width: 70px; height: 70px; font-size: 11px; line-height: 15px; }
  .ai-hero__story-controls { justify-content: flex-start; }
  .ai-hero__watermark { right: 15px; bottom: -26px; font-size: 100px; }
  .ai-intro, .ai-finishes, .ai-equipment, .ai-cases { padding: 60px 0; }
  .ai-section-heading { display: flex; flex-direction: column; align-items: center; gap: 24px; text-align: center; }
  .ai-section-heading h2 { margin-top: 0; }
  .ai-section-heading h2, .ai-centered-heading h2, .ai-centered-heading--compact h2 { font-size: 32px; line-height: 37px; }
  .ai-intro__content { display: block; margin-top: 40px; padding-top: 32px; text-align: center; }
  .ai-intro__content h3 { margin-inline: auto; }
  .ai-intro__paragraphs { margin-top: 28px; }
  .ai-suite-stage { display: grid; grid-template-columns: 1fr 1fr; grid-template-rows: auto 240px; gap: 12px; margin-top: 40px; }
  .ai-suite-center { grid-column: 1 / -1; grid-row: 1; gap: 14px; }
  .ai-suite-tabs { display: grid; grid-template-columns: 1fr 1fr; }
  .ai-suite-tabs button { min-height: 50px; border: 1px solid #e3e3e8; padding: 0 10px; }
  .ai-suite-tabs button:first-child { border-top: 1px solid #e3e3e8; }
  .ai-suite-tabs button > span:last-child { font-size: 16px; }
  .ai-suite-image--left-top { grid-column: 1; grid-row: 2; }
  .ai-suite-image--right-top { grid-column: 2; grid-row: 2; }
  .ai-suite-image { border-radius: 16px; }
  .ai-suite-details { display: block; margin-top: 16px; padding: 28px 22px; }
  .ai-suite-details > div:nth-child(2) { padding-top: 0; }
  .ai-suite-details > div + div { margin-top: 28px; }
  .ai-suite-details h3 { font-size: 20px; line-height: 30px; }
  .ai-finishes__grid { grid-template-columns: repeat(2, 1fr); gap: 20px 14px; margin-top: 38px; }
  .ai-finishes__image { border-radius: 16px; }
  .ai-equipment__grid { grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 24px 14px; margin-top: 38px; }
  .ai-cases__heading { display: block; text-align: center; }
  .ai-cases__heading > h2 { margin-inline: auto; padding: 24px 0 30px; font-size: 32px; line-height: 37px; }
  .ai-cases__viewport { margin-top: 38px; }
  .ai-cases__slide { flex-basis: 100%; }
  .ai-case-card__body { min-height: 0; padding-top: 18px; }
  .ai-case-card__body h3 { font-size: 20px; line-height: 30px; }
}

@media (max-width: 390px) {
  .ai-hero__title { font-size: 42px; }
  .ai-suite-stage { grid-template-rows: auto 220px; }
  .ai-suite-tabs button { grid-template-columns: 24px 1fr; gap: 7px; }
  .ai-suite-tabs__icon { width: 22px; height: 22px; }
}

@media (prefers-reduced-motion: reduce) {
  .ai-hero__story-thumb, .ai-hero__story-copy, .ai-suite-image, .ai-suite-details { animation: none; }
  .ai-series-drawer, .ai-finishes__image, .ai-equipment__action, .ai-case-card :deep(img) { transition: none; }
}
</style>
