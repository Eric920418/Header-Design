<script setup lang="ts">
import emblaCarouselVue from 'embla-carousel-vue'
import { ArrowRight, Check, ChevronLeft, ChevronRight, Plus } from 'lucide-vue-next'
import { AI_KITCHEN_PAGE } from '~/data/kitchenSeries'
import { KITCHEN_STYLES } from '~/data/kitchenStyles'

const data = AI_KITCHEN_PAGE
const reducedMotion = useReducedMotion()
const currentHero = ref(0)
const previousHero = ref(0)
const heroTransition = ref(0)
const activeSuiteIndex = ref(0)
const equipmentPaused = ref(false)
const casesPaused = ref(false)
const seriesOpen = ref(false)
const [equipmentViewport, equipmentApi] = emblaCarouselVue({ loop: true, align: 'start', duration: 28 })
const [casesViewport, casesApi] = emblaCarouselVue({ loop: true, align: 'start', duration: 18 })

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
const activeHeroStory = computed(() => heroStories[currentHero.value]!)
const equipmentLoop = computed(() => [...data.equipment, ...data.equipment])
const casesLoop = computed(() => [...data.cases, ...data.cases])
let heroTimer: ReturnType<typeof setInterval> | undefined
let equipmentTimer: ReturnType<typeof setInterval> | undefined
let casesTimer: ReturnType<typeof setInterval> | undefined
let stopMotionWatch: (() => void) | undefined

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
}

function activateSuiteFromHover(index: number) {
  if (!import.meta.client) return
  if (window.innerWidth >= 768 && window.matchMedia('(hover: hover) and (pointer: fine)').matches) {
    activateSuite(index)
  }
}

onMounted(() => {
  stopMotionWatch = watch(reducedMotion, (reduced) => {
    if (heroTimer) clearInterval(heroTimer)
    if (equipmentTimer) clearInterval(equipmentTimer)
    if (casesTimer) clearInterval(casesTimer)
    heroTimer = undefined
    equipmentTimer = undefined
    casesTimer = undefined
    if (!reduced) {
      heroTimer = setInterval(changeHero, 5000)
      equipmentTimer = setInterval(() => {
        if (!equipmentPaused.value) equipmentApi.value?.scrollNext()
      }, 4000)
      casesTimer = setInterval(() => {
        if (!casesPaused.value) casesApi.value?.scrollNext()
      }, 2600)
    }
  }, { immediate: true })
})
onBeforeUnmount(() => {
  if (heroTimer) clearInterval(heroTimer)
  if (equipmentTimer) clearInterval(equipmentTimer)
  if (casesTimer) clearInterval(casesTimer)
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
    <section aria-labelledby="ai-kitchen-hero-title" class="ai-hero">
      <div class="absolute inset-0 bg-[#6f6d69]" aria-hidden="true" />
      <div class="absolute inset-0">
        <InternalBrandImage :src="data.heroSlides[previousHero]" alt="AI Kitchen 廚房空間" eager class="h-full w-full" />
      </div>
      <template v-if="heroTransition > 0">
        <div :key="`mask-${heroTransition}`" class="hero-page1-image-layer hero-page1-image-layer-masked">
          <InternalBrandImage :src="data.heroSlides[currentHero]" alt="AI Kitchen 輪播轉場圖片" eager class="h-full w-full" />
          <span class="absolute inset-0 bg-[rgba(16,8,1,.46)]" aria-hidden="true" />
        </div>
        <div :key="`final-${heroTransition}`" class="hero-page1-image-layer hero-page1-image-layer-final">
          <InternalBrandImage :src="data.heroSlides[currentHero]" alt="AI Kitchen 廚房空間" eager class="h-full w-full" />
        </div>
      </template>
      <span class="absolute inset-0 z-[3] bg-gradient-to-r from-black/55 via-black/15 to-black/10" aria-hidden="true" />
      <span class="absolute inset-x-0 bottom-0 z-[3] h-[45%] bg-gradient-to-t from-black/70 via-black/20 to-transparent" aria-hidden="true" />

      <div class="ai-hero__inner">
        <div v-reveal="{ anim: 'opalMoveRight' }" class="ai-hero__eyebrow">
          <span aria-hidden="true" />
          Trusted Design Partner
        </div>
        <h1 id="ai-kitchen-hero-title" v-reveal="{ anim: 'opalMoveUp', delay: 100 }" class="ai-hero__title">
          Find Your <span>Inspired</span><br>
          <span>Interior</span> Design
        </h1>

        <a href="#ai-kitchen-intro" v-reveal="{ anim: 'opalScaleUp', delay: 220 }" class="hero-start-project ai-hero__cta">
          <span>Start<br>Project</span>
          <ArrowRight aria-hidden="true" />
        </a>

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
            <ArrowRight aria-hidden="true" />
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
          <span v-reveal="{ anim: 'opalMoveRight' }" class="ai-section-kicker"><i /> Kitchen Collections</span>
          <h2 v-reveal="{ anim: 'opalMoveLeft', delay: 100 }">Creative Projects That<br><span>Define Our Style</span></h2>
        </div>
        <div class="ai-intro__content">
          <h3 id="ai-intro-title" v-reveal="{ anim: 'opalMoveRight' }">{{ data.intro.title }}</h3>
          <div v-reveal="{ anim: 'opalMoveLeft', delay: 120 }" class="ai-intro__paragraphs">
            <p v-for="paragraph in data.intro.paragraphs" :key="paragraph">{{ paragraph }}</p>
          </div>
        </div>

        <div v-reveal="{ anim: 'opalMoveUp' }" class="ai-suite-stage">
          <div :key="`${activeSuite.id}-left-top`" class="ai-suite-image ai-suite-image--left-top">
            <InternalBrandImage :src="activeSuite.images[0]" :alt="`${activeSuite.name} 套系空間一`" class="h-full w-full" />
          </div>
          <div :key="`${activeSuite.id}-right-top`" class="ai-suite-image ai-suite-image--right-top">
            <InternalBrandImage :src="activeSuite.images[1]" :alt="`${activeSuite.name} 套系空間二`" class="h-full w-full" />
          </div>
          <div :key="`${activeSuite.id}-left-bottom`" class="ai-suite-image ai-suite-image--left-bottom">
            <InternalBrandImage :src="activeSuite.images[1]" :alt="`${activeSuite.name} 套系空間二延伸視角`" class="h-full w-full" />
          </div>
          <div :key="`${activeSuite.id}-right-bottom`" class="ai-suite-image ai-suite-image--right-bottom">
            <InternalBrandImage :src="activeSuite.images[0]" :alt="`${activeSuite.name} 套系空間一延伸視角`" class="h-full w-full" />
          </div>

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
              @mouseenter="activateSuiteFromHover(index)"
              @focus="activateSuite(index)"
              @click="activateSuite(index)"
            >
              <span class="ai-suite-tabs__icon"><Check v-if="activeSuiteIndex === index" /></span>
              <span>{{ suite.name }}</span>
            </button>
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
            <InternalBrandImage :src="finish.image" :alt="`${finish.code} ${finish.name} 門板`" class="ai-finishes__image" />
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
        <div v-reveal="{ anim: 'opalMoveUp', delay: 160 }">
          <div
            ref="equipmentViewport"
            class="ai-equipment__viewport"
            aria-roledescription="carousel"
            aria-label="AI Kitchen 推薦廚電"
            @mouseenter="equipmentPaused = true"
            @mouseleave="equipmentPaused = false"
            @focusin="equipmentPaused = true"
            @focusout="equipmentPaused = false"
          >
            <div class="ai-equipment__track">
              <article v-for="(equipment, index) in equipmentLoop" :key="`${equipment.model}-${index}`" class="ai-equipment__slide" :aria-hidden="index >= data.equipment.length ? 'true' : undefined">
                <NuxtLink :to="equipment.route" class="ai-equipment__card" :tabindex="index < data.equipment.length ? 0 : -1" :aria-label="`查看 ${equipment.model} ${equipment.name}`">
                  <InternalBrandImage :src="equipment.image" :alt="`${equipment.model} ${equipment.name}`" fit="contain" class="ai-equipment__image" />
                  <h3><span>{{ equipment.model }}</span>{{ equipment.name }}</h3>
                  <span class="ai-equipment__action" aria-hidden="true"><Plus /></span>
                </NuxtLink>
              </article>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section aria-labelledby="cases-heading" class="ai-cases">
      <div class="page-container">
        <div class="ai-cases__heading">
          <div class="ai-cases__heading-label">
            <p v-reveal="{ anim: 'opalMoveRight' }"><span aria-hidden="true"></span>Recommended Cases</p>
            <i class="ai-cases__rule ai-cases__rule--horizontal" aria-hidden="true"></i>
            <i class="ai-cases__rule ai-cases__rule--vertical" aria-hidden="true"></i>
          </div>
          <h2 id="cases-heading" v-reveal="{ anim: 'opalMoveLeft', delay: 90 }">Take A Look At <span>Our Latest Blog</span> &amp; Articles.</h2>
        </div>
        <div
          ref="casesViewport"
          class="ai-cases__viewport"
          aria-roledescription="carousel"
          aria-label="推薦設計案例"
          @mouseenter="casesPaused = true"
          @mouseleave="casesPaused = false"
          @focusin="casesPaused = true"
          @focusout="casesPaused = false"
        >
          <div class="ai-cases__track">
            <a v-for="(item, index) in casesLoop" :key="`${item.url}-${index}`" :href="item.url" target="_blank" rel="noopener noreferrer" class="ai-case-card ai-cases__slide" :class="{ 'ai-case-card--featured': index % data.cases.length === 1 }" :aria-hidden="index >= data.cases.length ? 'true' : undefined" :tabindex="index < data.cases.length ? 0 : -1">
              <div class="ai-case-card__image"><InternalBrandImage :src="item.image" :alt="item.title" class="h-full w-full" /></div>
              <div class="ai-case-card__body">
                <h3>{{ item.title }}</h3>
                <p>{{ item.excerpt }}</p>
              </div>
            </a>
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
.ai-hero__eyebrow { display: inline-flex; align-items: center; gap: 10px; font-family: var(--font-display); font-size: 13px; line-height: 18px; letter-spacing: 1px; text-transform: uppercase; }
.ai-hero__eyebrow span { width: 7px; height: 7px; border-radius: 50%; background: #caa05c; }
.ai-hero__title { margin-top: 24px; max-width: 1100px; font-size: clamp(74px, 7.9vw, 130px); line-height: .93; letter-spacing: -.035em; text-transform: none; }
.ai-hero__title span { color: #caa05c; }
.ai-hero__cta { position: absolute; top: 250px; right: 4%; display: inline-flex; width: 120px; height: 120px; align-items: center; justify-content: center; border: 1px solid rgb(255 255 255 / 25%); border-radius: 50%; background: rgb(255 255 255 / 10%); color: #fff; text-align: center; backdrop-filter: blur(12px); transition: background .4s, border-color .4s; }
.ai-hero__cta > span { position: relative; z-index: 2; font-family: var(--font-display); font-size: 15px; line-height: 19px; }
.ai-hero__cta svg { position: relative; z-index: 2; width: 18px; margin-left: 5px; transform: rotate(-45deg); transition: transform .4s; }
.ai-hero__cta:hover { border-color: #caa05c; background: #caa05c; }
.ai-hero__cta:hover svg { transform: rotate(0); }
.ai-hero__bottom { position: absolute; right: 86px; bottom: 28px; left: 0; display: grid; min-height: 142px; grid-template-columns: 84px minmax(0, 1fr) 108px 94px; align-items: center; gap: 22px; border: 1px solid rgb(255 255 255 / 15%); border-radius: 24px; background: rgb(37 35 35 / 48%); padding: 14px 18px; backdrop-filter: blur(18px); }
.ai-hero__story-thumb { display: block; width: 78px; height: 78px; overflow: hidden; border: 1px solid rgb(255 255 255 / 32%); border-radius: 50%; animation: ai-story-in .55s ease both; }
.ai-hero__story-copy { min-width: 0; font-family: var(--font-cjk-sans); animation: ai-story-in .55s ease both; }
.ai-hero__story-copy > span { display: block; color: #caa05c; font-size: 12px; font-weight: 500; line-height: 18px; letter-spacing: .08em; text-transform: uppercase; }
.ai-hero__story-copy > strong { display: block; margin-top: 2px; color: #fff; font-size: 18px; font-weight: 500; line-height: 26px; }
.ai-hero__story-copy > p { display: -webkit-box; overflow: hidden; max-width: 700px; margin: 6px 0 0; color: rgb(255 255 255 / 78%); font-size: 15px; line-height: 23px; -webkit-box-orient: vertical; -webkit-line-clamp: 2; }
.ai-hero__catalogue-link { display: inline-flex; width: 98px; height: 98px; align-items: center; justify-content: center; border: 1px solid rgb(202 160 92 / 72%); border-radius: 50%; color: #fff; font-family: var(--font-cjk-sans); font-size: 13px; line-height: 18px; text-align: center; transition: color .3s ease, background-color .3s ease, transform .3s ease; }
.ai-hero__catalogue-link svg { width: 15px; height: 15px; margin-left: 3px; transform: rotate(-45deg); transition: transform .3s ease; }
.ai-hero__catalogue-link:hover, .ai-hero__catalogue-link:focus-visible { color: #1c1c1d; background: #caa05c; transform: translateY(-3px); }
.ai-hero__catalogue-link:hover svg, .ai-hero__catalogue-link:focus-visible svg { transform: none; }
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

.ai-intro { padding: 120px 0; background: #f6f6f6; }
.ai-section-heading { display: grid; grid-template-columns: 30% 70%; align-items: start; }
.ai-section-kicker { display: inline-flex; width: fit-content; align-items: center; gap: 8px; margin-top: 10px; border: 1px solid #e3e3e8; border-radius: 24px; padding: 7px 13px 7px 10px; font-family: var(--font-cjk-sans); font-size: 12px; letter-spacing: 1px; text-transform: uppercase; }
.ai-section-kicker i { width: 6px; height: 6px; border-radius: 50%; background: #caa05c; }
.ai-section-heading h2 { max-width: 900px; margin: 0; font-size: 60px; line-height: 64px; text-transform: none; }
.ai-section-heading h2 span, .ai-centered-heading h2 span { color: #caa05c; }
.ai-intro__content { display: grid; grid-template-columns: minmax(0, 44%) minmax(0, 56%); gap: 70px; margin-top: 80px; padding-top: 50px; border-top: 1px solid #e3e3e8; }
.ai-intro__content h3 { max-width: 520px; margin: 0; font-family: var(--font-cjk-serif); font-size: 25px; font-weight: 500; line-height: 36px; letter-spacing: .02em; text-transform: none; }
.ai-intro__paragraphs { display: grid; gap: 14px; align-content: start; padding-top: 5px; color: #59585d; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 25px; }
.ai-intro__paragraphs p { margin: 0; }

.ai-suite-stage { display: grid; grid-template-columns: minmax(0, 1fr) 250px minmax(0, 1fr); grid-template-rows: 265px 265px; gap: 30px; margin-top: 90px; }
.ai-suite-image { position: relative; overflow: hidden; border-radius: 24px; animation: ai-suite-image-in .8s cubic-bezier(.25,.46,.45,.94) both; }
.ai-suite-image::after { position: absolute; inset: 0; background: linear-gradient(to top, rgb(0 0 0 / 16%), transparent 55%); content: ''; pointer-events: none; }
.ai-suite-image--left-top { grid-column: 1; grid-row: 1; }
.ai-suite-image--right-top { grid-column: 3; grid-row: 1; }
.ai-suite-image--left-bottom { grid-column: 1; grid-row: 2; }
.ai-suite-image--right-bottom { grid-column: 3; grid-row: 2; }
.ai-suite-tabs { grid-column: 2; grid-row: 1 / 3; display: flex; flex-direction: column; justify-content: center; padding: 0 14px; }
.ai-suite-tabs button { position: relative; display: grid; grid-template-columns: 30px 1fr; align-items: center; gap: 10px; width: 100%; min-height: 74px; border-bottom: 1px solid #e3e3e8; color: #9f9fa4; text-align: left; transition: color .35s; }
.ai-suite-tabs button:first-child { border-top: 1px solid #e3e3e8; }
.ai-suite-tabs button::after { position: absolute; right: 0; bottom: -1px; left: 0; height: 1px; transform: scaleX(0); transform-origin: left; background: #caa05c; content: ''; transition: transform .8s cubic-bezier(.25,.46,.45,.94); }
.ai-suite-tabs button.is-active { color: #1c1c1d; }
.ai-suite-tabs button.is-active::after { transform: scaleX(1); }
.ai-suite-tabs__icon { display: flex; width: 26px; height: 26px; align-items: center; justify-content: center; border-radius: 7px; background: #caa05c; color: #fff; }
.ai-suite-tabs__icon svg { width: 15px; height: 15px; }
.ai-suite-tabs button > span:last-child { font-family: "Bodoni Moda", serif; font-size: 20px; line-height: 28px; }
.ai-suite-details { display: grid; grid-template-columns: 1.05fr 1fr 1fr; gap: 50px; margin-top: 40px; border-radius: 24px; background: #fff; padding: 42px 50px; box-shadow: 0 28px 80px -48px rgb(0 0 0 / 45%); animation: ai-suite-content-in .8s ease both; }
.ai-suite-details__number { color: #e3e3e8; font-family: var(--font-display); font-size: 54px; line-height: 1; }
.ai-suite-details__name { margin: -18px 0 20px 42px; color: #caa05c; font-family: var(--font-cjk-serif); font-size: 25px; font-weight: 500; line-height: 36px; }
.ai-suite-details h3 { margin: 6px 0 0; font-family: var(--font-cjk-serif); font-size: 25px; font-weight: 500; line-height: 36px; text-transform: none; }
.ai-suite-details__description { margin: 0 0 12px; color: #59585d; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 25px; }
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
.ai-finishes__grid article:hover .ai-finishes__image { transform: translateY(-7px); }
.ai-finishes__caption { width: calc(100% - 8px); margin: -2px auto 0; border: 1px solid #e3e3e8; background: #fff; padding: 10px 14px 13px; }
.ai-finishes__caption p { margin: 0; color: #9f9fa4; font-family: var(--font-cjk-sans); font-size: 13px; line-height: 18px; }
.ai-finishes__caption h3 { margin: 2px 0 0; font-family: var(--font-cjk-sans); font-size: 18px; font-weight: 400; line-height: 24px; text-transform: none; }

.ai-equipment { position: relative; overflow: hidden; background: #f6f6f6; }
.ai-equipment::before { position: absolute; inset: 0; opacity: .035; background-image: linear-gradient(#1c1c1d 1px, transparent 1px), linear-gradient(90deg, #1c1c1d 1px, transparent 1px); background-size: 46px 46px; content: ''; pointer-events: none; }
.ai-equipment .page-container { position: relative; }
.ai-equipment__viewport { margin-top: 60px; overflow: hidden; cursor: grab; }
.ai-equipment__viewport:active { cursor: grabbing; }
.ai-equipment__track { display: flex; margin-left: -24px; touch-action: pan-y pinch-zoom; }
.ai-equipment__slide { min-width: 0; flex: 0 0 50%; padding-left: 24px; }
.ai-equipment__card { position: relative; display: block; color: inherit; }
.ai-equipment__image { aspect-ratio: 1.2; background: transparent; }
.ai-equipment__slide h3 { margin: 20px auto 0; max-width: 220px; color: #59585d; font-family: var(--font-cjk-sans); font-size: 15px; font-weight: 400; line-height: 22px; text-align: center; text-transform: none; }
.ai-equipment__slide h3 span { display: block; margin-bottom: 3px; color: #1c1c1d; font-family: var(--font-cjk-sans); font-size: 18px; font-weight: 500; }
.ai-equipment__action { position: absolute; top: 46%; right: 12px; display: flex; width: 44px; height: 44px; align-items: center; justify-content: center; border-radius: 50%; color: #fff; background: rgb(28 28 29 / 62%); opacity: 0; transform: translateY(10px); transition: opacity .3s ease, transform .3s ease, background-color .3s ease; }
.ai-equipment__action svg { width: 20px; height: 20px; }
.ai-equipment__card:hover .ai-equipment__action, .ai-equipment__card:focus-visible .ai-equipment__action { opacity: 1; transform: none; }
.ai-equipment__card:hover .ai-equipment__action { background: #caa05c; }

.ai-cases { background: #fff; }
.ai-cases__heading { display: grid; grid-template-columns: 30% 70%; }
.ai-cases__heading-label { position: relative; padding-top: 70px; }
.ai-cases__heading-label > p { display: inline-flex; align-items: center; gap: 8px; margin: 0; border: 1px solid #e3e3e8; border-radius: 26px; padding: 8px 14px; font-family: var(--font-cjk-sans); font-size: 12px; line-height: 14px; letter-spacing: 1px; text-transform: uppercase; }
.ai-cases__heading-label > p span { width: 5px; height: 5px; flex: 0 0 auto; border-radius: 50%; background: #caa05c; }
.ai-cases__heading > h2 { max-width: 688px; margin: 0; padding: 70px 0 60px; font-size: 60px; line-height: 64px; text-transform: none; }
.ai-cases__heading > h2 span { color: #caa05c; }
.ai-cases__rule { position: absolute; display: block; border-color: #e3e3e8; pointer-events: none; }
.ai-cases__rule--horizontal { top: 118px; left: 30px; width: 525px; border-top: 1px solid #e3e3e8; }
.ai-cases__rule--horizontal::after { position: absolute; top: -8px; right: -1px; width: 15px; height: 15px; border: 1px solid #e3e3e8; border-radius: 50%; background: #fff; content: ''; }
.ai-cases__rule--vertical { top: 50px; right: 61px; height: 200px; border-right: 1px solid #e3e3e8; }
.ai-cases__viewport { overflow: hidden; cursor: grab; }
.ai-cases__viewport:active { cursor: grabbing; }
.ai-cases__track { display: flex; margin-left: -30px; touch-action: pan-y pinch-zoom; }
.ai-cases__slide { min-width: 0; flex: 0 0 33.333%; padding-left: 30px; }
.ai-case-card { position: relative; display: flex; min-width: 0; height: 560px; flex-direction: column; color: #1c1c1d; }
.ai-case-card__image { position: relative; aspect-ratio: 1.40625; flex: 0 0 auto; overflow: hidden; border-radius: 24px; }
.ai-case-card__image :deep(img) { transition: transform .5s; }
.ai-case-card:hover .ai-case-card__image :deep(img) { transform: scale(1.1); }
.ai-case-card__body { padding-top: 22px; }
.ai-case-card__body h3 { display: -webkit-box; overflow: hidden; margin: 0 0 19px; font-family: var(--font-cjk-serif); font-size: 25px; font-weight: 500; line-height: 36px; text-transform: none; -webkit-box-orient: vertical; -webkit-line-clamp: 2; }
.ai-case-card__body p { display: -webkit-box; overflow: hidden; margin: 0; color: #59585d; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 25px; -webkit-box-orient: vertical; -webkit-line-clamp: 3; }
.ai-case-card--featured { overflow: hidden; border-radius: 24px; }
.ai-case-card--featured .ai-case-card__image { position: absolute; inset: 0; aspect-ratio: auto; border-radius: 0; }
.ai-case-card--featured .ai-case-card__image::after { position: absolute; inset: 40% 0 0; background: linear-gradient(180deg, transparent, rgb(53 52 49 / 56%) 30%, #353431 100%); content: ''; }
.ai-case-card--featured .ai-case-card__body { position: absolute; inset-inline: 0; bottom: 0; z-index: 2; padding: 40px 50px 44px; color: #fff; }
.ai-case-card--featured .ai-case-card__body h3 { margin: 0; }
.ai-case-card--featured .ai-case-card__body p { display: none; }

@media (min-width: 569px) { .ai-equipment__slide { flex-basis: 33.333%; } }
@media (min-width: 768px) { .ai-equipment__slide { flex-basis: 25%; } }
@media (min-width: 881px) { .ai-equipment__slide { flex-basis: 20%; } }
@media (min-width: 1201px) { .ai-equipment__slide { flex-basis: 20%; } }

@media (max-width: 1200px) {
  .ai-hero { height: 760px; }
  .ai-hero__inner { padding-top: 95px; }
  .ai-hero__cta { top: 220px; right: 0; }
  .ai-hero__bottom { grid-template-columns: 72px minmax(0, 1fr) 98px 88px; gap: 16px; }
  .ai-hero__story-thumb { width: 68px; height: 68px; }
  .ai-suite-stage { grid-template-columns: minmax(0, 1fr) 220px minmax(0, 1fr); grid-template-rows: 230px 230px; gap: 24px; }
  .ai-suite-details { gap: 30px; padding: 36px; }
  .ai-finishes__grid { gap: 14px; }
  .ai-finishes__caption { padding-inline: 10px; }
}

@media (max-width: 1024px) {
  .ai-hero { height: 720px; }
  .ai-hero__inner { padding-top: 80px; }
  .ai-hero__title { font-size: clamp(64px, 9.5vw, 96px); }
  .ai-hero__cta { top: 250px; width: 105px; height: 105px; }
  .ai-series-drawer { display: none; }
  .ai-section-heading h2, .ai-centered-heading h2 { font-size: 48px; line-height: 53px; }
  .ai-intro__content { gap: 40px; }
  .ai-suite-stage { grid-template-columns: 1fr 210px 1fr; grid-template-rows: 200px 200px; gap: 18px; }
  .ai-suite-tabs button { min-height: 68px; }
  .ai-suite-details { grid-template-columns: 1fr 1fr; }
  .ai-suite-details > div:last-child { grid-column: 1 / -1; }
  .ai-finishes__grid { grid-template-columns: repeat(3, 1fr); gap: 24px; }
  .ai-cases__heading > h2 { font-size: 50px; line-height: 56px; }
  .ai-cases__rule--horizontal { width: 300px; }
  .ai-cases__slide { flex-basis: 50%; }
  .ai-case-card { height: auto; }
  .ai-case-card--featured { overflow: visible; border-radius: 0; }
  .ai-case-card--featured .ai-case-card__image { position: relative; inset: auto; aspect-ratio: 1.40625; border-radius: 24px; }
  .ai-case-card--featured .ai-case-card__image::after { display: none; }
  .ai-case-card--featured .ai-case-card__body { position: relative; inset: auto; padding: 22px 0 0; color: #1c1c1d; }
  .ai-case-card--featured .ai-case-card__body h3 { margin-bottom: 19px; }
  .ai-case-card--featured .ai-case-card__body p { display: -webkit-box; }
}

@media (max-width: 767px) {
  .ai-hero { height: 760px; }
  .ai-hero__inner { width: auto; margin: 0 93px 0 15px; padding-top: 66px; }
  .ai-hero__eyebrow { font-size: 11px; }
  .ai-hero__title { margin-top: 18px; font-size: clamp(44px, 13vw, 68px); line-height: .98; }
  .ai-hero__cta { top: 300px; right: 0; width: 82px; height: 82px; }
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
  .ai-section-heading h2, .ai-centered-heading h2, .ai-centered-heading--compact h2 { font-size: 32px; line-height: 37px; }
  .ai-intro__content { display: block; margin-top: 45px; padding-top: 35px; text-align: center; }
  .ai-intro__content h3 { margin-inline: auto; }
  .ai-intro__paragraphs { margin-top: 28px; }
  .ai-suite-stage { display: grid; grid-template-columns: 1fr 1fr; grid-template-rows: auto 180px 180px; gap: 12px; margin-top: 55px; }
  .ai-suite-tabs { grid-column: 1 / -1; grid-row: 1; display: grid; grid-template-columns: 1fr 1fr; padding: 0; }
  .ai-suite-tabs button { min-height: 58px; border: 1px solid #e3e3e8; padding: 0 10px; }
  .ai-suite-tabs button:first-child { border-top: 1px solid #e3e3e8; }
  .ai-suite-tabs button > span:last-child { font-size: 16px; }
  .ai-suite-image--left-top { grid-column: 1; grid-row: 2; }
  .ai-suite-image--right-top { grid-column: 2; grid-row: 2; }
  .ai-suite-image--left-bottom { grid-column: 1; grid-row: 3; }
  .ai-suite-image--right-bottom { grid-column: 2; grid-row: 3; }
  .ai-suite-image { border-radius: 16px; }
  .ai-suite-details { display: block; margin-top: 20px; padding: 28px 22px; }
  .ai-suite-details > div + div { margin-top: 28px; }
  .ai-suite-details h3 { font-size: 23px; line-height: 30px; }
  .ai-finishes__grid { grid-template-columns: repeat(2, 1fr); gap: 20px 14px; margin-top: 38px; }
  .ai-finishes__image { border-radius: 16px; }
  .ai-equipment__viewport { margin-top: 38px; }
  .ai-cases__heading { display: block; text-align: center; }
  .ai-cases__heading-label { padding-top: 0; }
  .ai-cases__heading > h2 { margin-inline: auto; padding: 24px 0 30px; font-size: 32px; line-height: 37px; }
  .ai-cases__rule { display: none; }
  .ai-cases__viewport { margin-top: 38px; }
  .ai-cases__slide { flex-basis: 100%; }
  .ai-case-card__body { min-height: 0; padding-top: 18px; }
  .ai-case-card__body h3 { font-size: 22px; line-height: 29px; }
}

@media (max-width: 390px) {
  .ai-hero__title { font-size: 42px; }
  .ai-suite-tabs button { grid-template-columns: 24px 1fr; gap: 7px; }
  .ai-suite-tabs__icon { width: 22px; height: 22px; }
}

@media (prefers-reduced-motion: reduce) {
  .ai-hero__story-thumb, .ai-hero__story-copy, .ai-suite-image, .ai-suite-details { animation: none; }
  .ai-series-drawer, .ai-finishes__image, .ai-equipment__action, .ai-case-card :deep(img) { transition: none; }
}
</style>
