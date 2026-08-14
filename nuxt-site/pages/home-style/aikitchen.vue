<script setup lang="ts">
import emblaCarouselVue from 'embla-carousel-vue'
import { ArrowRight, Check, Play, X } from 'lucide-vue-next'
import { AI_KITCHEN_PAGE } from '~/data/kitchenSeries'

const data = AI_KITCHEN_PAGE
const reducedMotion = useReducedMotion()
const currentHero = ref(0)
const previousHero = ref(0)
const heroTransition = ref(0)
const activeSuiteIndex = ref(0)
const equipmentPaused = ref(false)
const videoOpen = ref(false)
const [equipmentViewport, equipmentApi] = emblaCarouselVue({ loop: true, align: 'start', duration: 28 })

const activeSuite = computed(() => data.suites[activeSuiteIndex.value]!)
const equipmentLoop = computed(() => [...data.equipment, ...data.equipment])
let heroTimer: ReturnType<typeof setInterval> | undefined
let equipmentTimer: ReturnType<typeof setInterval> | undefined
let stopMotionWatch: (() => void) | undefined

function changeHero() {
  previousHero.value = currentHero.value
  currentHero.value = (currentHero.value + 1) % data.heroSlides.length
  heroTransition.value += 1
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

function closeVideo() {
  videoOpen.value = false
}

function handleEscape(event: KeyboardEvent) {
  if (event.key === 'Escape' && videoOpen.value) closeVideo()
}

onMounted(() => {
  stopMotionWatch = watch(reducedMotion, (reduced) => {
    if (heroTimer) clearInterval(heroTimer)
    if (equipmentTimer) clearInterval(equipmentTimer)
    heroTimer = undefined
    equipmentTimer = undefined
    if (!reduced) {
      heroTimer = setInterval(changeHero, 5000)
      equipmentTimer = setInterval(() => {
        if (!equipmentPaused.value) equipmentApi.value?.scrollNext()
      }, 4000)
    }
  }, { immediate: true })
  window.addEventListener('keydown', handleEscape)
})
onBeforeUnmount(() => {
  if (heroTimer) clearInterval(heroTimer)
  if (equipmentTimer) clearInterval(equipmentTimer)
  stopMotionWatch?.()
  window.removeEventListener('keydown', handleEscape)
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
          <p v-reveal="{ anim: 'opalMoveRight', delay: 280 }">
            We specialize in transforming visions into reality, creating intelligent kitchens where technology, aesthetics, and everyday life become one.
          </p>
          <button type="button" v-reveal="{ anim: 'opalMoveLeft', delay: 340 }" class="ai-hero__video-card" aria-label="播放 SAKURA 品牌影片" @click="videoOpen = true">
            <span class="ai-hero__video-copy">Watch A Video<br>About Us</span>
            <span class="ai-hero__video-thumb">
              <InternalBrandImage :src="data.heroSlides[0]" alt="SAKURA 品牌影片預覽" class="h-full w-full" />
              <span class="ai-hero__play"><Play class="ml-0.5 h-5 w-5 fill-current" /></span>
            </span>
          </button>
        </div>
      </div>
      <span class="ai-hero__watermark" aria-hidden="true">Interior</span>
    </section>

    <section id="ai-kitchen-intro" aria-labelledby="ai-intro-title" class="ai-intro">
      <div class="page-container">
        <div class="ai-section-heading">
          <span v-reveal="{ anim: 'opalMoveRight' }" class="ai-section-kicker"><i /> AI Kitchen</span>
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
          <p v-reveal="{ anim: 'opalMoveUp' }">Recommended Equipment</p>
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
              <article v-for="(equipment, index) in equipmentLoop" :key="`${equipment.model}-${index}`" class="ai-equipment__slide" :aria-hidden="index >= data.equipment.length ? 'true' : undefined" :tabindex="index < data.equipment.length ? 0 : -1">
                <InternalBrandImage :src="equipment.image" :alt="`${equipment.model} ${equipment.name}`" fit="contain" class="ai-equipment__image" />
                <h3><span>{{ equipment.model }}</span>{{ equipment.name }}</h3>
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
        <div class="ai-cases__grid">
          <a v-for="(item, index) in data.cases" :key="item.url" :href="item.url" target="_blank" rel="noopener noreferrer" v-reveal="{ anim: 'opalMoveUp', delay: index * 100 }" class="ai-case-card" :class="{ 'ai-case-card--featured': index === 1 }">
            <div class="ai-case-card__image"><InternalBrandImage :src="item.image" :alt="item.title" class="h-full w-full" /></div>
            <div class="ai-case-card__body">
              <h3>{{ item.title }}</h3>
              <p>{{ item.excerpt }}</p>
            </div>
          </a>
        </div>
      </div>
    </section>

    <Teleport to="body">
      <div v-if="videoOpen" class="ai-video-modal" role="dialog" aria-modal="true" aria-label="SAKURA 品牌影片" @click.self="closeVideo">
        <button type="button" aria-label="關閉影片" class="ai-video-modal__close" @click="closeVideo"><X /></button>
        <div class="ai-video-modal__content"><InternalBrandVideo :cover="data.heroSlides[0]" /></div>
      </div>
    </Teleport>
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
.ai-hero__bottom { position: absolute; inset-inline: 0; bottom: 55px; display: flex; align-items: end; justify-content: space-between; gap: 40px; }
.ai-hero__bottom > p { width: 420px; margin: 0; color: rgb(255 255 255 / 78%); font-size: 16px; line-height: 24px; }
.ai-hero__video-card { display: flex; width: 560px; height: 150px; align-items: center; justify-content: space-between; overflow: hidden; border: 1px solid rgb(255 255 255 / 18%); border-radius: 24px; background: rgb(255 255 255 / 18%); padding: 10px 10px 10px 30px; color: #fff; text-align: left; backdrop-filter: blur(18px); }
.ai-hero__video-copy { font-family: var(--font-display); font-size: 26px; line-height: 31px; }
.ai-hero__video-thumb { position: relative; width: 170px; height: 130px; overflow: hidden; border-radius: 18px; }
.ai-hero__video-thumb::after { position: absolute; inset: 0; background: rgb(0 0 0 / 18%); content: ''; }
.ai-hero__play { position: absolute; top: 50%; left: 50%; z-index: 3; display: flex; width: 52px; height: 52px; align-items: center; justify-content: center; transform: translate(-50%, -50%); border-radius: 50%; background: rgb(255 255 255 / 38%); backdrop-filter: blur(10px); }
.ai-hero__watermark { position: absolute; z-index: 4; right: max(30px, calc((100vw - 1584px) / 2)); bottom: -90px; color: rgb(255 255 255 / 10%); font-family: var(--font-display); font-size: clamp(190px, 18vw, 320px); line-height: .8; pointer-events: none; }

.ai-intro { padding: 120px 0; background: #f6f6f6; }
.ai-section-heading { display: grid; grid-template-columns: 30% 70%; align-items: start; }
.ai-section-kicker { display: inline-flex; width: fit-content; align-items: center; gap: 8px; margin-top: 10px; border: 1px solid #e3e3e8; border-radius: 24px; padding: 7px 13px 7px 10px; font-family: var(--font-display); font-size: 12px; letter-spacing: 1px; text-transform: uppercase; }
.ai-section-kicker i { width: 6px; height: 6px; border-radius: 50%; background: #caa05c; }
.ai-section-heading h2 { max-width: 900px; margin: 0; font-size: 60px; line-height: 64px; text-transform: none; }
.ai-section-heading h2 span, .ai-centered-heading h2 span { color: #caa05c; }
.ai-intro__content { display: grid; grid-template-columns: minmax(0, 44%) minmax(0, 56%); gap: 70px; margin-top: 80px; padding-top: 50px; border-top: 1px solid #e3e3e8; }
.ai-intro__content h3 { max-width: 520px; margin: 0; font-size: 48px; line-height: 56px; letter-spacing: .02em; text-transform: none; }
.ai-intro__paragraphs { display: grid; gap: 18px; align-content: start; padding-top: 5px; color: #59585d; font-size: 18px; line-height: 28px; }
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
.ai-suite-tabs button > span:last-child { font-family: var(--font-display); font-size: 20px; line-height: 26px; }
.ai-suite-details { display: grid; grid-template-columns: 1.05fr 1fr 1fr; gap: 50px; margin-top: 40px; border-radius: 24px; background: #fff; padding: 42px 50px; box-shadow: 0 28px 80px -48px rgb(0 0 0 / 45%); animation: ai-suite-content-in .8s ease both; }
.ai-suite-details__number { color: #e3e3e8; font-family: var(--font-display); font-size: 54px; line-height: 1; }
.ai-suite-details__name { margin: -18px 0 20px 42px; color: #caa05c; font-family: var(--font-display); font-size: 18px; }
.ai-suite-details h3 { margin: 6px 0 0; font-size: 27px; line-height: 35px; text-transform: none; }
.ai-suite-details__description { margin: 0 0 12px; color: #59585d; font-size: 16px; line-height: 25px; }
.ai-suite-details__equipment-title { margin: 0 0 14px; color: #caa05c; font-family: var(--font-display); font-size: 18px; }
.ai-suite-details ul { margin: 0; padding: 0; list-style: none; }
.ai-suite-details li { padding: 7px 0; border-bottom: 1px solid #e3e3e8; color: #59585d; font-size: 14px; line-height: 21px; }
@keyframes ai-suite-image-in { from { clip-path: inset(0 0 100% 0); opacity: .2; } to { clip-path: inset(0); opacity: 1; } }
@keyframes ai-suite-content-in { from { opacity: 0; transform: translateY(22px); } to { opacity: 1; transform: none; } }

.ai-finishes, .ai-equipment, .ai-cases { padding: 120px 0; }
.ai-finishes { background: #fff; }
.ai-centered-heading { text-align: center; }
.ai-centered-heading > p { margin: 0 0 17px; color: #9f9fa4; font-family: var(--font-display); font-size: 12px; letter-spacing: 1px; text-transform: uppercase; }
.ai-centered-heading h2 { margin: 0; font-size: 60px; line-height: 64px; text-transform: none; }
.ai-centered-heading--compact h2 { font-size: 52px; line-height: 58px; }
.ai-finishes__grid { display: grid; grid-template-columns: repeat(6, minmax(0, 1fr)); gap: 20px; margin-top: 55px; }
.ai-finishes__grid article { min-width: 0; }
.ai-finishes__image { aspect-ratio: 1; border-radius: 24px; transition: transform .5s; }
.ai-finishes__grid article:hover .ai-finishes__image { transform: translateY(-7px); }
.ai-finishes__caption { width: calc(100% - 8px); margin: -2px auto 0; border: 1px solid #e3e3e8; background: #fff; padding: 10px 14px 13px; }
.ai-finishes__caption p { margin: 0; color: #9f9fa4; font-size: 13px; line-height: 18px; }
.ai-finishes__caption h3 { margin: 2px 0 0; font-size: 18px; line-height: 24px; text-transform: none; }

.ai-equipment { position: relative; overflow: hidden; background: #f6f6f6; }
.ai-equipment::before { position: absolute; inset: 0; opacity: .035; background-image: linear-gradient(#1c1c1d 1px, transparent 1px), linear-gradient(90deg, #1c1c1d 1px, transparent 1px); background-size: 46px 46px; content: ''; pointer-events: none; }
.ai-equipment .page-container { position: relative; }
.ai-equipment__viewport { margin-top: 60px; overflow: hidden; cursor: grab; }
.ai-equipment__viewport:active { cursor: grabbing; }
.ai-equipment__track { display: flex; margin-left: -24px; touch-action: pan-y pinch-zoom; }
.ai-equipment__slide { min-width: 0; flex: 0 0 50%; padding-left: 24px; }
.ai-equipment__image { aspect-ratio: 1.2; background: transparent; }
.ai-equipment__slide h3 { margin: 20px auto 0; max-width: 220px; color: #59585d; font-family: var(--font-sans); font-size: 15px; font-weight: 400; line-height: 22px; text-align: center; text-transform: none; }
.ai-equipment__slide h3 span { display: block; margin-bottom: 3px; color: #1c1c1d; font-family: var(--font-display); font-size: 18px; }

.ai-cases { background: #fff; }
.ai-cases__heading { display: grid; grid-template-columns: 30% 70%; }
.ai-cases__heading-label { position: relative; padding-top: 70px; }
.ai-cases__heading-label > p { display: inline-flex; align-items: center; gap: 8px; margin: 0; border: 1px solid #e3e3e8; border-radius: 26px; padding: 8px 14px; font-family: var(--font-display); font-size: 12px; line-height: 14px; letter-spacing: 1px; text-transform: uppercase; }
.ai-cases__heading-label > p span { width: 5px; height: 5px; flex: 0 0 auto; border-radius: 50%; background: #caa05c; }
.ai-cases__heading > h2 { max-width: 688px; margin: 0; padding: 70px 0 60px; font-size: 60px; line-height: 64px; text-transform: none; }
.ai-cases__heading > h2 span { color: #caa05c; }
.ai-cases__rule { position: absolute; display: block; border-color: #e3e3e8; pointer-events: none; }
.ai-cases__rule--horizontal { top: 118px; left: 30px; width: 525px; border-top: 1px solid #e3e3e8; }
.ai-cases__rule--horizontal::after { position: absolute; top: -8px; right: -1px; width: 15px; height: 15px; border: 1px solid #e3e3e8; border-radius: 50%; background: #fff; content: ''; }
.ai-cases__rule--vertical { top: 50px; right: 61px; height: 200px; border-right: 1px solid #e3e3e8; }
.ai-cases__grid { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 30px; }
.ai-case-card { position: relative; display: flex; min-width: 0; height: 560px; flex-direction: column; color: #1c1c1d; }
.ai-case-card__image { position: relative; aspect-ratio: 1.40625; flex: 0 0 auto; overflow: hidden; border-radius: 24px; }
.ai-case-card__image :deep(img) { transition: transform .5s; }
.ai-case-card:hover .ai-case-card__image :deep(img) { transform: scale(1.1); }
.ai-case-card__body { padding-top: 22px; }
.ai-case-card__body h3 { display: -webkit-box; overflow: hidden; margin: 0 0 19px; font-size: 30px; line-height: 34px; text-transform: none; -webkit-box-orient: vertical; -webkit-line-clamp: 2; }
.ai-case-card__body p { display: -webkit-box; overflow: hidden; margin: 0; color: #59585d; font-size: 16px; line-height: 24px; -webkit-box-orient: vertical; -webkit-line-clamp: 3; }
.ai-case-card--featured { overflow: hidden; border-radius: 24px; }
.ai-case-card--featured .ai-case-card__image { position: absolute; inset: 0; aspect-ratio: auto; border-radius: 0; }
.ai-case-card--featured .ai-case-card__image::after { position: absolute; inset: 40% 0 0; background: linear-gradient(180deg, transparent, rgb(53 52 49 / 56%) 30%, #353431 100%); content: ''; }
.ai-case-card--featured .ai-case-card__body { position: absolute; inset-inline: 0; bottom: 0; z-index: 2; padding: 40px 50px 44px; color: #fff; }
.ai-case-card--featured .ai-case-card__body h3 { margin: 0; }
.ai-case-card--featured .ai-case-card__body p { display: none; }

.ai-video-modal { position: fixed; inset: 0; z-index: 300; display: flex; align-items: center; justify-content: center; background: rgb(0 0 0 / 82%); padding: 60px 30px; backdrop-filter: blur(10px); }
.ai-video-modal__content { width: min(1100px, 100%); }
.ai-video-modal__close { position: absolute; top: 22px; right: 22px; display: flex; width: 46px; height: 46px; align-items: center; justify-content: center; border: 1px solid rgb(255 255 255 / 35%); border-radius: 50%; color: #fff; }

@media (min-width: 569px) { .ai-equipment__slide { flex-basis: 33.333%; } }
@media (min-width: 768px) { .ai-equipment__slide { flex-basis: 25%; } }
@media (min-width: 881px) { .ai-equipment__slide { flex-basis: 20%; } }
@media (min-width: 1201px) { .ai-equipment__slide { flex-basis: 16.6667%; } }

@media (max-width: 1200px) {
  .ai-hero { height: 760px; }
  .ai-hero__inner { padding-top: 95px; }
  .ai-hero__cta { top: 220px; right: 0; }
  .ai-hero__video-card { width: 480px; }
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
  .ai-hero__video-card { width: 400px; height: 128px; }
  .ai-hero__video-copy { font-size: 22px; line-height: 27px; }
  .ai-hero__video-thumb { width: 145px; height: 108px; }
  .ai-section-heading h2, .ai-centered-heading h2 { font-size: 48px; line-height: 53px; }
  .ai-intro__content { gap: 40px; }
  .ai-intro__content h3 { font-size: 38px; line-height: 47px; }
  .ai-suite-stage { grid-template-columns: 1fr 210px 1fr; grid-template-rows: 200px 200px; gap: 18px; }
  .ai-suite-tabs button { min-height: 68px; }
  .ai-suite-details { grid-template-columns: 1fr 1fr; }
  .ai-suite-details > div:last-child { grid-column: 1 / -1; }
  .ai-finishes__grid { grid-template-columns: repeat(3, 1fr); gap: 24px; }
  .ai-cases__heading > h2 { font-size: 50px; line-height: 56px; }
  .ai-cases__rule--horizontal { width: 300px; }
  .ai-cases__grid { grid-template-columns: repeat(2, 1fr); }
  .ai-case-card { height: auto; }
  .ai-case-card--featured { overflow: visible; border-radius: 0; }
  .ai-case-card--featured .ai-case-card__image { position: relative; inset: auto; aspect-ratio: 1.40625; border-radius: 24px; }
  .ai-case-card--featured .ai-case-card__image::after { display: none; }
  .ai-case-card--featured .ai-case-card__body { position: relative; inset: auto; padding: 22px 0 0; color: #1c1c1d; }
  .ai-case-card--featured .ai-case-card__body h3 { margin-bottom: 19px; }
  .ai-case-card--featured .ai-case-card__body p { display: -webkit-box; }
  .ai-case-card:last-child { grid-column: 1 / -1; width: calc(50% - 15px); }
}

@media (max-width: 767px) {
  .ai-hero { height: 680px; }
  .ai-hero__inner { width: calc(100% - 30px); padding-top: 66px; }
  .ai-hero__eyebrow { font-size: 11px; }
  .ai-hero__title { margin-top: 18px; font-size: clamp(44px, 13vw, 68px); line-height: .98; }
  .ai-hero__cta { top: 280px; right: 6px; width: 90px; height: 90px; }
  .ai-hero__cta > span { font-size: 13px; line-height: 16px; }
  .ai-hero__bottom { bottom: 30px; display: grid; gap: 20px; }
  .ai-hero__bottom > p { width: min(100%, 410px); font-size: 14px; line-height: 21px; }
  .ai-hero__video-card { width: min(100%, 390px); height: 106px; padding: 8px 8px 8px 20px; }
  .ai-hero__video-copy { font-size: 18px; line-height: 22px; }
  .ai-hero__video-thumb { width: 124px; height: 90px; border-radius: 14px; }
  .ai-hero__play { width: 42px; height: 42px; }
  .ai-hero__watermark { right: 15px; bottom: -26px; font-size: 100px; }
  .ai-intro, .ai-finishes, .ai-equipment, .ai-cases { padding: 60px 0; }
  .ai-section-heading { display: flex; flex-direction: column; align-items: center; gap: 24px; text-align: center; }
  .ai-section-heading h2, .ai-centered-heading h2, .ai-centered-heading--compact h2 { font-size: 32px; line-height: 37px; }
  .ai-intro__content { display: block; margin-top: 45px; padding-top: 35px; text-align: center; }
  .ai-intro__content h3 { margin-inline: auto; font-size: 30px; line-height: 39px; }
  .ai-intro__paragraphs { margin-top: 28px; font-size: 16px; line-height: 25px; }
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
  .ai-cases__grid { grid-template-columns: 1fr; gap: 20px; margin-top: 38px; }
  .ai-case-card:last-child { grid-column: auto; width: auto; }
  .ai-case-card__body { min-height: 0; padding-top: 18px; }
  .ai-case-card__body h3 { font-size: 22px; line-height: 29px; }
  .ai-video-modal { padding: 60px 15px; }
}

@media (max-width: 390px) {
  .ai-hero__title { font-size: 42px; }
  .ai-suite-tabs button { grid-template-columns: 24px 1fr; gap: 7px; }
  .ai-suite-tabs__icon { width: 22px; height: 22px; }
}

@media (prefers-reduced-motion: reduce) {
  .ai-suite-image, .ai-suite-details { animation: none; }
  .ai-finishes__image, .ai-case-card :deep(img) { transition: none; }
}
</style>
