<script setup lang="ts">
const cmsCopy = await useCmsResource('view-pages-builders-index', {"strengths":[{"value":["45","萬"],"lines":["設計模組","累積\n超過","多元選擇"],"background":"/section-6/builders/proposal-20261002/design-modules.webp"},{"value":["AI","智能"],"lines":["廚衛工廠","全台\n最大","供貨穩定"],"background":"/section-6/builders/proposal-20261002/ai-factory.webp"},{"value":["管理","平台"],"lines":["案件進度","獨家\n智能","精準掌握"],"background":"/section-6/builders/proposal-20261002/project-platform.webp"}],"services":[{"eyebrow":"ONE-STOP","label":"一站式服務","title":"專業銷講","copy":["舉辦住戶裝修講座","加速建案銷售"]},{"eyebrow":"NUMEROUS","label":"多樣產品選擇","title":"專屬監工","copy":["透過專屬的即時監控系統","完善管理工期"]},{"eyebrow":"EFFICIENT","label":"輕鬆擁有","title":"專人驗收","copy":["協助建案偕同驗收","住戶安心放心"]}],"copy":{"text1":"Property Developers","text2":"提供一站式整體解決方案","text3":"為建案提升價值與銷售力","text4":"一站式整體廚房解決方案，為建案提升價值與銷售力。","text5":"立即預約","field6":"/section-6/builders/builder-hero.jpg","field7":"SAKURA KITCHEN 深色現代整體廚房與中島空間","text8":"OUR BRAND","text9":"嚴選國內外優質品牌","text10":"Experts Our","text11":"打造不同定位與多元風格的理想家居空間","field12":"SAKURA KITCHEN 建商整體廚房展示空間","field13":"SAKURA KITCHEN","field14":"即將推出的廚房品牌空間","text15":"Coming","text16":"Soon","text17":"Have A Project In ","text18":"Mind?","text19":"Let’s","text20":" Make It Happen","text21":"櫻花與建商攜手打造高品質住宅，從設計模組、工廠供貨到案件管理，讓每個廚房交付節點更清楚。","text22":"美好居家生活的創造者","text23":"HOME in O.N.E","text24":"Lifetime Service","text25":"One-Click Registration ","text26":"Lifetime Service","text27":"購買 SAKURA iCare 系列產品，掃描保證書專屬 QR Code，即可啟動智能化服務，銜接產品登錄、保固與後續服務。","field28":"/section-6/builders/proposal-20261002/icare.webp","field29":"SAKURA iCare 時刻在乎・永恆守護：以智能平台整合永久免費服務，掃描產品 QR Code，享受櫻花的安心守護。","text30":"OUR CLIENTS","field31":"","field32":"","text33":"Get In Touch","text34":"Have A Project In ","text35":"Mind?","text36":"Let’s","text37":" Make It Happen","text38":"櫻花集團 品牌館","text39":"全預約制","text40":"留下您的資訊，將由專人與您聯繫，提供最適合您建案的整體廚房規劃建議。","text41":"地址","text42":"營業時間"},"cmsSettings":{"visible":true,"seoTitle":"","seoDescription":""}})

import { ArrowRight, Check, Clock3, MapPin } from 'lucide-vue-next'
import { BUILDER_APPOINTMENT_HASH as cmsSeed_BUILDER_APPOINTMENT_HASH, builderProjectCards as cmsSeed_builderProjectCards } from '~/data/builders'
import { brandPavilions as cmsSeed_brandPavilions } from '~/data/brandPavilions'
const { BUILDER_APPOINTMENT_HASH, builderProjectCards } = await useCmsResource('data-builders', { BUILDER_APPOINTMENT_HASH: cmsSeed_BUILDER_APPOINTMENT_HASH, builderProjectCards: cmsSeed_builderProjectCards })
const { brandPavilions } = await useCmsResource('data-brandPavilions', { brandPavilions: cmsSeed_brandPavilions })
const heroContactLabel = cmsCopy.copy.text5 === '專人聯繫' ? '立即預約' : cmsCopy.copy.text5


useSeoMeta({
  title: '建商專區｜SAKURA 整體廚房',
  description: 'SAKURA 整體廚房提供建案一站式整體廚房解決方案、供貨管理、專業銷講監工與預約諮詢服務。',
  ogTitle: '建商專區｜SAKURA 整體廚房',
  ogDescription: '為建案提升價值與銷售力的一站式整體廚房解決方案。',
  ogImage: '/section-6/builders/builder-hero.jpg',
})

const strengths = cmsCopy.strengths

const services = cmsCopy.services

const homeOne = ref<HTMLElement>()
const homeOneReady = ref(false)
onMounted(() => {
  if (homeOne.value?.querySelector('img')?.complete) homeOneReady.value = true
})

const strengthsCopy = ref<HTMLElement>()
let strengthsObserver: ResizeObserver | undefined
function updateStrengthsSticky() {
  const copy = strengthsCopy.value
  if (!copy) return
  if (window.innerWidth < 768) {
    copy.style.removeProperty('--strengths-sticky-top')
    return
  }
  const headerHeight = document.querySelector<HTMLElement>('[data-breadcrumb-root]')?.offsetHeight ?? 60
  const viewportHeight = window.visualViewport?.height ?? window.innerHeight
  // Oversized copy scrolls into view before pinning its bottom; never clip readable text.
  const top = Math.min(headerHeight + 15, viewportHeight - copy.offsetHeight - 20)
  copy.style.setProperty('--strengths-sticky-top', `${top}px`)
}
onMounted(() => {
  updateStrengthsSticky()
  window.addEventListener('resize', updateStrengthsSticky, { passive: true })
  window.visualViewport?.addEventListener('resize', updateStrengthsSticky, { passive: true })
  document.fonts?.addEventListener('loadingdone', updateStrengthsSticky)
  if ('ResizeObserver' in window && strengthsCopy.value) {
    strengthsObserver = new ResizeObserver(updateStrengthsSticky)
    strengthsObserver.observe(strengthsCopy.value)
    const header = document.querySelector<HTMLElement>('[data-breadcrumb-root]')
    if (header) strengthsObserver.observe(header)
  }
})
onBeforeUnmount(() => {
  strengthsObserver?.disconnect()
  window.removeEventListener('resize', updateStrengthsSticky)
  window.visualViewport?.removeEventListener('resize', updateStrengthsSticky)
  document.fonts?.removeEventListener('loadingdone', updateStrengthsSticky)
})

const moduleCounter = ref<HTMLElement>()
const moduleCount = ref(strengths[0]?.value[0] ?? '')
const reducedMotion = useReducedMotion()
let moduleObserver: IntersectionObserver | undefined
let moduleFrame: number | undefined
let moduleCounted = false

const finishModuleCount = () => {
  moduleCounted = true
  moduleObserver?.disconnect()
  if (moduleFrame !== undefined) cancelAnimationFrame(moduleFrame)
  moduleFrame = undefined
  moduleCount.value = strengths[0]?.value[0] ?? ''
}

const startModuleCount = () => {
  if (moduleCounted) return
  const total = Number(strengths[0]?.value[0])
  if (reducedMotion.value || !Number.isFinite(total) || total <= 0) {
    finishModuleCount()
    return
  }
  moduleCounted = true
  moduleObserver?.disconnect()
  moduleCount.value = '0'
  let start: number | undefined
  const tick = (time: number) => {
    start ??= time
    const progress = Math.min((time - start) / 2000, 1)
    moduleCount.value = String(Math.round(total * (1 - (1 - progress) ** 3)))
    if (progress < 1) moduleFrame = requestAnimationFrame(tick)
    else finishModuleCount()
  }
  moduleFrame = requestAnimationFrame(tick)
}

watch(reducedMotion, isReduced => { if (isReduced) finishModuleCount() })
onMounted(() => {
  if (reducedMotion.value || !('IntersectionObserver' in window)) {
    finishModuleCount()
    return
  }
  if (!moduleCounter.value) return
  moduleObserver = new IntersectionObserver(([entry]) => {
    if (entry?.isIntersecting) startModuleCount()
  }, { threshold: 0.2 })
  moduleObserver.observe(moduleCounter.value)
})
onBeforeUnmount(finishModuleCount)

const activePavilionId = ref<(typeof brandPavilions)[number]['id']>('taipei')
const activePavilion = computed(() => brandPavilions.find(item => item.id === activePavilionId.value) ?? brandPavilions[0]!)

const selectPavilion = (id: (typeof brandPavilions)[number]['id']) => {
  activePavilionId.value = id
}

const movePavilionFocus = (event: KeyboardEvent, currentIndex: number) => {
  if (!['ArrowLeft', 'ArrowRight', 'Home', 'End'].includes(event.key)) return
  event.preventDefault()

  const nextIndex = event.key === 'Home'
    ? 0
    : event.key === 'End'
      ? brandPavilions.length - 1
      : (currentIndex + (event.key === 'ArrowRight' ? 1 : -1) + brandPavilions.length) % brandPavilions.length
  const nextPavilion = brandPavilions[nextIndex]
  if (!nextPavilion) return

  selectPavilion(nextPavilion.id)
  nextTick(() => document.querySelector<HTMLElement>(`#builder-pavilion-tab-${nextPavilion.id}`)?.focus())
}
useHead(() => ({ ...(cmsCopy.cmsSettings.seoTitle ? {title:cmsCopy.cmsSettings.seoTitle}:{}), meta: cmsCopy.cmsSettings.seoDescription ? [{name:'description',content:cmsCopy.cmsSettings.seoDescription}] : [] }))
</script>

<template>
  <template v-if="cmsCopy.cmsSettings.visible">
  <main class="builders-page">
    <section class="builders-hero hero-includes-header" aria-labelledby="builders-title">
      <span class="builders-hero__deco" aria-hidden="true" />
      <div class="builders-rail-wide builders-hero__inner internal-rail-safe">
        <div v-reveal="{ anim: 'opalMoveRight' }" data-ev="opalMoveRight" class="builders-hero__headline ev">
          <InternalSectionPill tone="dark"><span>{{ cmsCopy.copy.text1 }}</span></InternalSectionPill>
          <p class="builders-hero__eyebrow">櫻花 HOME IN O.N.E</p>
          <h1 id="builders-title"><span>{{ cmsCopy.copy.text2 }}</span><br />{{ cmsCopy.copy.text3 }}</h1>
        </div>
        <div v-reveal="{ anim: 'opalMoveLeft', delay: 120 }" data-ev="opalMoveLeft" class="builders-hero__aside ev">
          <a :href="BUILDER_APPOINTMENT_HASH" class="builders-round-link">
            <span>{{ heroContactLabel }}</span>
            <span class="site-cta-icon builders-round-link__icon"><ArrowRight aria-hidden="true" /></span>
          </a>
        </div>
      </div>
    </section>

    <div v-reveal="{ anim: 'opalMoveUp', delay: 220 }" data-ev="opalMoveUp" class="builders-rail-wide builders-hero-media ev">
      <InternalBuilderImage :src="cmsCopy.copy.field6" :alt="cmsCopy.copy.field7" eager />
    </div>

    <section class="builders-team" aria-labelledby="builders-team-title">
      <div class="builders-rail internal-rail-safe">
        <header v-reveal="{ anim: 'opalMoveUp' }" class="builders-section-heading builders-section-heading--team">
          <InternalSectionPill>EXPLORE OUR COLLECTIONS</InternalSectionPill>
          <h2 id="builders-team-title"><b class="builders-brand-chinese">{{ cmsCopy.copy.text9 }}</b>Creating the <span>Ideal Kitchen</span><br /> <span>For Every</span> Family</h2>
          <p>{{ cmsCopy.copy.text9 }}，{{ cmsCopy.copy.text11 }}</p>
        </header>
        <div class="builders-team__grid">
          <template v-for="(card, index) in builderProjectCards" :key="card.image">
            <NuxtLink
              v-if="card.type === 'project'"
              :to="card.href"
              class="builders-team-card builders-team-card--project"
              aria-label="前往 SAKURA KITCHEN 建商整體廚房介紹頁"
            >
              <InternalBuilderImage :src="card.image" :alt="cmsCopy.copy.field12" />
              <span class="builders-team-card__shade" aria-hidden="true" />
              <img :src="card.logo" :alt="cmsCopy.copy.field13" class="builders-team-card__logo" />
              <span class="builders-team-card__project-status">
                <span><strong>{{ card.title }}</strong>{{ card.subtitle }}</span>
                <ArrowRight aria-hidden="true" />
              </span>
            </NuxtLink>
            <article
              v-else
              v-reveal="{ anim: 'opalMoveUp', delay: index * 90 }"
              data-ev="opalMoveUp"
              class="builders-team-card ev"
              :style="{ animationDelay: `${index * 90}ms` }"
            >
              <InternalBuilderImage :src="card.image" :alt="`Antra Home 07 Coming Soon 參考影像 ${index}`" />
              <div class="builders-team-card__status"><span>{{ card.title }}</span><strong>{{ String(index + 1).padStart(2, '0') }}</strong></div>
            </article>
          </template>
          <article
            v-for="index in 3"
            :key="`coming-soon-${index}`"
            v-reveal="{ anim: 'opalMoveUp', delay: index * 90 }"
            data-ev="opalMoveUp"
            class="builders-team-card builders-team-card--coming-soon ev"
            :style="{ animationDelay: `${index * 90}ms` }"
          >
            <InternalBuilderImage :src="`/section-6/builders/team/coming-soon-${index}.png`" :alt="cmsCopy.copy.field14" />
            <span class="builders-team-card__shade" aria-hidden="true" />
            <strong>{{ cmsCopy.copy.text15 }}<br />{{ cmsCopy.copy.text16 }}</strong>
          </article>
        </div>
      </div>
    </section>

    <section class="builders-capability" aria-labelledby="builders-capability-title">
      <div class="builders-strengths-section">
        <div id="builders-solutions" class="builders-rail builders-strengths-layout internal-rail-safe">
          <header ref="strengthsCopy" class="builders-strengths-copy">
            <div v-reveal="{ anim: 'opalMoveUp' }" class="builders-strengths-heading">
              <InternalSectionPill tone="dark">OUR STRENGTHS</InternalSectionPill>
              <h2 id="builders-capability-title"><b>智能整合，打造建築新價值</b>Smart Solutions <span>For</span><br /><span>Better Living</span></h2>
              <p>以多元設計模組、AI 智能製造與數位案件管理，<br />為建商提供從設計規劃到交付的整合服務。</p>
            </div>
            <div v-if="strengths[0]" v-reveal="{ anim: 'opalMoveUp' }" class="builders-solution__copy">
              <p class="builders-solution__lead">{{ strengths[0].lines[1].replaceAll('\n', '') }}</p>
              <p ref="moduleCounter" class="builders-solution__number" :aria-label="`${strengths[0].value[0]}+${strengths[0].value[1]}`"><span aria-hidden="true">{{ moduleCount }}+{{ strengths[0].value[1] }}</span></p>
              <h3>{{ strengths[0].lines[0] }} {{ strengths[0].lines[2] }}</h3>
            </div>
          </header>
          <div class="builders-strengths-list">
            <article
              v-for="(item, index) in strengths"
              :key="item.lines[0]"
              v-reveal="{ anim: 'opalMoveUp', duration: 'slow' }"
              class="builders-solution"
            >
              <InternalBuilderImage
                :src="item.background"
                :alt="index === 0 ? '整體家居設計模組及建案廚房規劃軟體' : index === 1 ? 'AI 智能廚衛工廠：自動化產線、生產管理看板與機械手臂' : '智能案件管理平台串接簽約、設計、工廠供貨與驗收進度'"
                :fit="index === 1 ? 'cover' : 'contain'"
                class="builders-solution__visual"
                :class="index === 0 ? 'builders-solution__visual--modules' : index === 1 ? 'builders-solution__visual--factory' : 'builders-solution__visual--platform'"
              />
              <h3 v-if="index > 0" class="builders-solution__caption">
                <span>{{ item.lines[1].replaceAll('\n', '') }}<template v-if="index === 2"> {{ item.lines[0] }}</template></span>
                <strong>{{ item.value.join('') }}</strong>
                <span><template v-if="index === 1">{{ item.lines[0] }} </template>{{ item.lines[2] }}</span>
              </h3>
            </article>
          </div>
        </div>
      </div>

      <div class="builders-rail internal-rail-safe">
        <div class="builders-capability__showcase">
          <div ref="homeOne" v-reveal="{ anim: 'fadeIn' }" class="builders-home-one" :data-image-ready="homeOneReady || undefined" @load.capture="homeOneReady = true" @error.capture="homeOneReady = true">
            <InternalBuilderImage
              src="/section-6/builders/proposal-20261002/home-in-one.webp"
              alt="HOME IN O.N.E：ONE-STOP 一站式服務、NUMEROUS 多樣產品選擇、EFFICIENT 輕鬆擁有"
              class="builders-home-one__visual"
            />
          </div>

          <div v-reveal="{ anim: 'opalMoveUp' }" class="builders-services-panel">
            <InternalBuilderImage
              src="/section-6/builders/proposal-20261002/dedicated-services.webp"
              alt="專業銷講選材、專屬監工規劃與專人驗收"
              class="builders-services-panel__visual"
              fit="contain"
            />
            <div class="builders-services">
              <article v-for="service in services" :key="service.title" class="builders-service">
                <h3><Check aria-hidden="true" />{{ service.title }}</h3>
                <p><span v-for="line in service.copy" :key="line">{{ line }}</span></p>
              </article>
            </div>
          </div>

          <section v-reveal="{ anim: 'opalMoveUp' }" class="builders-lifetime" aria-labelledby="builders-lifetime-title">
            <h3 id="builders-lifetime-title" class="sr-only">{{ cmsCopy.copy.text24 }}</h3>
            <InternalBuilderImage :src="cmsCopy.copy.field28" :alt="cmsCopy.copy.field29" class="builders-lifetime__visual" fit="contain" />
          </section>
        </div>
      </div>
    </section>

    <section id="appointment" class="builders-contact" aria-labelledby="builders-contact-title">
      <div class="builders-rail internal-rail-safe">
        <header v-reveal="{ anim: 'opalMoveUp' }" class="builders-section-heading builders-section-heading--split builders-contact__heading">
          <InternalTemplateHeadingRail :label="cmsCopy.copy.text33" />
          <div>
            <h2 id="builders-contact-title"><span class="bilingual-heading-lead"><span class="builders-contact-eyebrow">Explore Our</span><b class="builders-contact-chinese">櫻花集團品牌館</b></span>The Art <span>Of</span><br /> <span>Kitchen</span> Showrooms</h2>
          </div>
        </header>

        <div class="builders-contact__grid">
          <aside v-reveal="{ anim: 'opalMoveRight' }" data-ev="opalMoveRight" class="builders-contact__aside ev">
            <div class="builders-contact__copy">
              <h3>{{ cmsCopy.copy.text38 }}<br /><span>{{ cmsCopy.copy.text39 }}</span></h3>
              <p>{{ cmsCopy.copy.text40 }}</p>
              <dl>
                <div><dt><MapPin aria-hidden="true" />{{ cmsCopy.copy.text41 }}</dt><dd>{{ activePavilion.address }}</dd></div>
                <div><dt><Clock3 aria-hidden="true" />{{ cmsCopy.copy.text42 }}</dt><dd>{{ activePavilion.hours }}</dd></div>
              </dl>
            </div>
            <div class="builders-contact__visual">
              <div class="builders-contact__tabs" role="tablist" aria-label="選擇集團品牌館">
                <button
                  v-for="(pavilion, index) in brandPavilions"
                  :id="`builder-pavilion-tab-${pavilion.id}`"
                  :key="pavilion.id"
                  type="button"
                  role="tab"
                  :aria-selected="activePavilionId === pavilion.id"
                  :aria-controls="`builder-pavilion-panel-${pavilion.id}`"
                  :tabindex="activePavilionId === pavilion.id ? 0 : -1"
                  @click="selectPavilion(pavilion.id)"
                  @keydown="movePavilionFocus($event, index)"
                >
                  {{ pavilion.name.replace('館', '') }}
                </button>
              </div>
              <Transition name="builders-pavilion" mode="out-in">
                <div
                  :id="`builder-pavilion-panel-${activePavilion.id}`"
                  :key="activePavilion.id"
                  class="builders-contact__pavilion"
                  role="tabpanel"
                  :aria-labelledby="`builder-pavilion-tab-${activePavilion.id}`"
                >
                  <InternalBuilderImage :src="activePavilion.image" :alt="activePavilion.alt" />
                </div>
              </Transition>
            </div>
          </aside>

          <div v-reveal="{ anim: 'opalMoveLeft', delay: 120 }" data-ev="opalMoveLeft" class="builders-contact__form ev">
            <InternalBuilderAppointmentForm />
          </div>
        </div>
      </div>
    </section>
  </main>
</template>
</template>

<style scoped>
.builders-page { overflow: clip; color: #1c1c1d; background: #fff; }
.builders-rail-wide { width: min(1770px, calc(100% - 60px)); margin-inline: auto; box-sizing: border-box; }
.builders-rail { width: min(1770px, 100%); margin-inline: auto; padding-right: 56px; box-sizing: border-box; }
.builders-round-link { display: inline-flex; min-height: 60px; width: max-content; flex: none; align-items: center; justify-content: center; gap: 8px; padding: 9px 9px 9px 30px; border: 1px solid rgb(255 255 255 / 34%); border-radius: 999px; color: #fff; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 22px; transition: color .3s ease, border-color .3s ease, background-color .3s ease, transform .3s ease; }
.builders-round-link__icon { position: relative; isolation: isolate; display: inline-flex; width: 40px; height: 40px; flex: none; align-items: center; justify-content: center; border-radius: 50%; color: #fff; background: #caa05c; transform: rotate(-45deg); transition: color .35s ease, background-color .35s ease, transform .5s ease; }
.builders-round-link__icon svg { width: 20px; height: 20px; }
.builders-round-link:hover,
.builders-round-link:focus-visible { color: #1c1c1d; border-color: #caa05c; background: #caa05c; transform: translateY(-2px); }
.builders-round-link:hover .builders-round-link__icon,
.builders-round-link:focus-visible .builders-round-link__icon { color: #fff; background: #1c1c1d; transform: rotate(0); }
.builders-hero { position: relative; z-index: 0; min-height: 868px; overflow: hidden; color: #fff; background: #1c1c1d; }
.builders-hero__deco { position: absolute; z-index: -1; inset: 0; opacity: .08; background: var(--cms-image-asset_7a7fece6, url('/section-6/franchise/antra-original/h5-bg1.png')) center / cover no-repeat; filter: invert(1); }
.builders-hero__inner { display: grid; grid-template-columns: 64% 36%; padding: 142px 30px 0; }
.builders-hero__headline :deep(.section-pill) { margin-bottom: 16px; }
.builders-hero__eyebrow { margin: 0; color: #fff; font-family: var(--font-cjk-sans); font-size: clamp(20px, 2.3vw, 40px); font-weight: 700; line-height: 1.25; letter-spacing: .04em; }
.builders-hero h1 { max-width: 960px; margin: 8px 0 0; color: #fff; font-family: var(--font-cjk-sans); font-size: clamp(32px, 4.4vw, 76px); font-weight: 700; line-height: 1.6; letter-spacing: 0; text-shadow: 0 6px 18px rgb(0 0 0 / 22%); }
.builders-hero h1 span { color: #c4a574; }
.builders-hero__aside { width: 100%; min-width: 0; align-self: end; margin: 0 0 16px 6px; }
.builders-hero__aside .builders-round-link { margin-top: 42px; }
.builders-hero-media { position: relative; z-index: 9; height: clamp(520px, 42.5vw, 760px); margin-top: -360px; overflow: hidden; border-radius: 24px; }
.builders-hero-media :deep(img) { object-position: center 58%; }
.builders-hero-media.is-visible :deep(img) { transform-origin: center center; animation: hero-kenburns 5s ease-out 1.47s both; }
.builders-section-heading h2,
.builders-lifetime h2 { margin: 0; font-family: var(--font-display); font-size: 60px; font-weight: 400; line-height: 64px; letter-spacing: -.02em; }
.builders-section-heading h2 span,
.builders-lifetime h2 span { color: #caa05c; }
.builders-section-heading > p { color: #59585d; font-size: 16px; line-height: 25px; }
.builders-team { padding: 40px 30px 130px; background: #fff var(--cms-image-asset_39582b0b, url('/section-6/franchise/antra-original/h5-bg02.png')) top right / auto no-repeat; }
.builders-section-heading--team { display: flex; flex-direction: column; align-items: center; margin-bottom: 60px; text-align: center; }
.builders-section-heading--team > :deep(.section-pill) { margin-bottom: 40px; }
#builders-team-title { min-width: 0; max-width: 100%; margin: 0; color: #1c1c1d; font-size: 50px; line-height: 1.2; text-transform: none; }
.builders-brand-chinese { display: block; margin-bottom: 16px; color: #caa05c; font-family: var(--font-cjk-serif); font-size: 40px; font-weight: 600; line-height: 1.2; letter-spacing: 0; }
.builders-section-heading--team > p { max-width: 100%; margin: 28px 0 0; color: #59585d; font-size: 16px; line-height: 25px; }
.builders-team__grid { display: grid; grid-template-columns: repeat(4, minmax(0, 1fr)); gap: 30px; }
.builders-team-card { position: relative; display: block; min-width: 0; overflow: hidden; border-radius: 24px; color: inherit; background: #fafafa; text-decoration: none; }
.builders-team-card--project { grid-column: 1; }
.builders-team-card--coming-soon { display: grid; aspect-ratio: 4 / 5; place-items: center; background: #1c1c1d; }
.builders-team-card--coming-soon > :deep(.builder-image) { position: absolute; inset: 0; height: 100%; }
.builders-team-card--coming-soon strong { position: relative; z-index: 1; padding: 24px; color: #fff; font-family: var(--font-display); font-size: clamp(32px, 3vw, 44px); font-weight: 400; line-height: 1.1; text-align: center; }
.builders-team-card > :deep(.builder-image) { aspect-ratio: 4 / 5; }
.builders-team-card:hover :deep(.builder-image img) { transform: scale(1.035); }
.builders-team-card:focus-visible { outline: 2px solid #caa05c; outline-offset: 5px; }
.builders-team-card__shade { position: absolute; inset: 0; background: rgb(16 8 1 / 42%); transition: background-color .35s ease; }
.builders-team-card--coming-soon .builders-team-card__shade { background: rgb(0 0 0 / 60%); }
.builders-team-card--project:hover .builders-team-card__shade,
.builders-team-card--project:focus-visible .builders-team-card__shade { background: rgb(16 8 1 / 30%); }
.builders-team-card__logo { position: absolute; top: 50%; left: 50%; width: min(190px, 62%); height: auto; transform: translate(-50%, -50%); }
.builders-team-card__status { position: absolute; inset: auto 14px 14px; display: flex; min-height: 54px; align-items: center; justify-content: space-between; padding: 10px 12px 10px 18px; border-radius: 999px; color: #fff; background: rgb(28 28 29 / 84%); backdrop-filter: blur(14px); }
.builders-team-card__status span { font-family: var(--font-ui); font-size: 17px; }
.builders-team-card__status strong { display: flex; width: 34px; height: 34px; align-items: center; justify-content: center; border-radius: 50%; color: #1c1c1d; background: #caa05c; font-size: 12px; }
.builders-team-card__project-status { position: absolute; right: 14px; bottom: 14px; left: 14px; display: flex; min-height: 64px; align-items: center; justify-content: space-between; padding: 10px 12px 10px 18px; border-radius: 999px; color: #fff; background: rgb(28 28 29 / 84%); backdrop-filter: blur(14px); }
.builders-team-card__project-status > span { display: flex; min-width: 0; flex-direction: column; gap: 2px; font-family: var(--font-cjk-sans); font-size: 13px; line-height: 18px; }
.builders-team-card__project-status strong { overflow: hidden; font-family: var(--font-ui); font-size: 17px; font-weight: 400; line-height: 21px; text-overflow: ellipsis; white-space: nowrap; }
.builders-team-card__project-status > svg { width: 36px; height: 36px; flex: none; padding: 9px; border-radius: 50%; color: #1c1c1d; background: #caa05c; transform: rotate(-45deg); transition: transform .35s ease; }
.builders-team-card--project:hover .builders-team-card__project-status > svg,
.builders-team-card--project:focus-visible .builders-team-card__project-status > svg { transform: rotate(0); }
.builders-capability { padding: 0 0 72px; background: #fafafa; }
.builders-capability > .builders-rail { width: min(1410px, calc(100% - 60px)); }
.builders-section-heading--split { display: grid; grid-template-columns: 30% 70%; align-items: start; }
.builders-section-heading--split > div > p { max-width: 760px; margin: 25px 0 0; color: #59585d; font-size: 15px; line-height: 25px; }
.builders-strengths-section { padding: 75px 30px 105px; color: #fff; background: #241c18; }
.builders-strengths-layout { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); align-items: stretch; gap: 30px; }
.builders-strengths-copy { position: sticky; top: var(--strengths-sticky-top, calc(var(--site-header-height, 60px) + 15px)); align-self: start; display: grid; grid-template-rows: 1fr auto; gap: 48px; min-width: 0; min-height: calc(100svh - var(--site-header-height, 60px) - 65px); padding: 35px 0 6px; container-type: inline-size; }
.builders-strengths-heading h2 { max-width: 597px; margin: 24px 0 30px; font-family: var(--font-display); font-size: 60px; font-weight: 400; line-height: 1.067; letter-spacing: -.01em; text-transform: none; }
.builders-strengths-heading h2 b { display: block; margin-bottom: 16px; font-family: var(--font-cjk-serif); font-size: 40px; font-weight: 600; line-height: 1.3; letter-spacing: 0; }
.builders-strengths-heading h2 span { color: #caa05c; }
.builders-strengths-heading > p { max-width: 444px; margin: 0; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 25px; }
.builders-strengths-list { display: grid; gap: 30px; min-width: 0; }
.builders-strengths-list :deep(.builder-image) { height: auto; background: #fff; }
.builders-capability__showcase { width: min(1280px, 100%); margin: 70px auto 0; container-type: inline-size; font-family: var(--font-cjk-sans); }
.builders-capability__showcase :deep(.builder-image) { height: auto; background: transparent; }
.builders-solution { margin: 0; overflow: hidden; border-radius: 24px; }
.builders-solution__copy { margin-top: 0; }
.builders-solution__copy h3,
.builders-solution__copy p { margin: 0; font-family: var(--font-cjk-sans); font-size: 20px; font-weight: 400; line-height: 1.4; }
.builders-solution__copy .builders-solution__lead { margin-bottom: 8px; }
.builders-solution__copy .builders-solution__number { min-height: 96px; color: #c4a574; font-size: 80px; font-weight: 700; line-height: 1.2; font-variant-numeric: tabular-nums; }
.builders-solution__caption { display: flex; flex-wrap: wrap; align-items: baseline; gap: .3em; margin: 0; padding: 20px 0 6px; font-family: var(--font-cjk-sans); font-size: 20px; font-weight: 400; line-height: 1.4; }
.builders-solution__caption strong { color: #c4a574; font-size: 28px; font-weight: 700; }
.builders-solution__visual--modules { aspect-ratio: 4933 / 3946; }
.builders-solution__visual--factory { aspect-ratio: 1280 / 460; }
.builders-solution__visual--factory :deep(img) { object-position: bottom; }
.builders-solution__visual--platform { aspect-ratio: 16 / 9; }
.builders-solution__visual { overflow: hidden; border-radius: 24px; }
.builders-home-one__visual { aspect-ratio: 2.7 / 1; }
.builders-home-one:not([data-image-ready]) { animation-play-state: paused; }
@media (prefers-reduced-motion: no-preference) {
  .builders-home-one.ev.is-visible { animation-name: builders-home-one-reveal; }
}
@keyframes builders-home-one-reveal {
  from { opacity: 0; transform: scale(.97); }
  to { opacity: 1; transform: scale(1); }
}
.builders-services-panel__visual { aspect-ratio: 1280 / 391; }
.builders-services { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: .75cqw; padding: 60px 2% 120px; }
.builders-service { min-width: 0; text-align: center; }
.builders-service h3 { display: flex; align-items: center; justify-content: center; gap: .25em; margin: 0; font-family: var(--font-cjk-serif); font-size: clamp(12px, 2.8cqw, 36px); font-weight: 600; line-height: 1.4; }
.builders-service h3 svg { width: .9em; height: .9em; flex: none; color: #c4a574; }
.builders-service p { display: flex; flex-direction: column; margin: .6em 0 0; color: #59585d; font-size: clamp(10px, 1.8cqw, 22px); line-height: 1.6; }
.builders-lifetime { margin: 0; padding: 0; }
.builders-lifetime__visual { aspect-ratio: 16 / 9; border-radius: 24px; }
.builders-contact { scroll-margin-top: 60px; padding: 120px 30px 130px; background: #fafafa var(--cms-image-asset_d0922f9d, url('/section-6/franchise/antra-original/h1-bg02.png')) top right / auto no-repeat; }
.builders-contact__heading { margin-bottom: 58px; }
#builders-contact-title { min-width: 0; max-width: 100%; padding-top: 64px; font-size: 50px; line-height: 1.2; text-transform: none; }
#builders-contact-title .builders-contact-eyebrow { display: inline-block; margin-right: 16px; border-bottom: 1px solid #bdbdbd; color: #1c1c1d; font-size: 18px; line-height: 22px; letter-spacing: 0; vertical-align: baseline; }
.builders-contact-chinese { position: relative; top: -.06em; margin-right: 12px; color: #caa05c; font-family: var(--font-cjk-serif); font-size: 40px; font-weight: 600; line-height: 1.2; letter-spacing: 0; vertical-align: baseline; }
.builders-contact__grid { display: grid; grid-template-columns: 42% 58%; align-items: start; }
.builders-contact__aside { padding-right: 55px; }
.builders-contact__copy { padding: 10px 0 42px; }
.builders-contact__copy h3 { margin: 0; font-family: var(--font-cjk-serif); font-size: 34px; font-weight: var(--font-cjk-serif-semibold, 600); line-height: 42px; }
.builders-contact__copy h3 span { color: #caa05c; }
.builders-contact__copy > p { max-width: 480px; margin: 18px 0 0; color: #59585d; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 25px; }
.builders-contact__copy dl { display: grid; gap: 18px; margin: 28px 0 0; }
.builders-contact__copy dl div { display: grid; grid-template-columns: 110px minmax(0, 1fr); gap: 12px; }
.builders-contact__copy dt { display: flex; align-items: center; gap: 8px; color: #1c1c1d; font-family: var(--font-cjk-sans); font-size: 13px; }
.builders-contact__copy dt svg { width: 17px; height: 17px; color: #caa05c; }
.builders-contact__copy dd { margin: 0; color: #59585d; font-family: var(--font-cjk-sans); font-size: 14px; }
.builders-contact__tabs { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 12px; margin-bottom: 18px; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 20px; }
.builders-contact__tabs button { height: 42px; padding: 10px 16px; border: 1px solid #e3e3e8; border-radius: 999px; color: #1c1c1d; background: #fff; font: inherit; cursor: pointer; transition: color .3s ease, border-color .3s ease, background-color .3s ease, transform .3s ease; }
.builders-contact__tabs button:hover,
.builders-contact__tabs button:focus-visible,
.builders-contact__tabs button[aria-selected='true'] { border-color: #caa05c; color: #fff; background: #caa05c; transform: translateY(-2px); }
.builders-contact__tabs button:focus-visible { outline: 2px solid #caa05c; outline-offset: 5px; }
.builders-contact__pavilion { overflow: hidden; border-radius: 24px; }
.builders-contact__pavilion > :deep(.builder-image) { aspect-ratio: 1.18 / 1; border-radius: 24px; }
.builders-pavilion-enter-active,
.builders-pavilion-leave-active { transition: opacity .35s ease, transform .35s ease; }
.builders-pavilion-enter-from { opacity: 0; transform: translateY(12px); }
.builders-pavilion-leave-to { opacity: 0; transform: translateY(-8px); }
.builders-contact__form { min-width: 0; }

@media (max-width: 1199px) {
  .builders-hero__inner { grid-template-columns: 61% 39%; }
  .builders-section-heading h2,
  .builders-lifetime h2 { font-size: 52px; line-height: 57px; }
  .builders-contact__aside { padding-right: 35px; }
  .builders-strengths-heading h2 { font-size: 42px; }
  .builders-strengths-heading h2 b { font-size: 32px; }
  .builders-solution__copy .builders-solution__number { min-height: 72px; font-size: 60px; }
}

@media (max-width: 1023px) {
  .builders-rail-wide { width: calc(100% - 60px); }
  .builders-hero { min-height: 778px; }
  .builders-hero__inner { grid-template-columns: 1fr; padding-top: 115px; }
  .builders-hero__aside { margin: 42px 0 0; }
  .builders-hero-media { height: 520px; margin-top: -240px; }
  .builders-team,
  .builders-contact { padding-block: 96px; }
  .builders-capability { padding-bottom: 56px; }
  .builders-strengths-heading > p br { display: none; }
  .builders-services { padding-block: 40px 80px; }
  .builders-section-heading--split { grid-template-columns: 1fr; gap: 25px; }
  #builders-team-title { font-size: 42px; }
  .builders-brand-chinese { font-size: 32px; }
  #builders-contact-title { padding-top: 0; font-size: 42px; }
  .builders-contact__heading :deep(.template-heading-rail) { min-height: auto; padding-top: 0; text-align: left; }
  .builders-contact__heading :deep(.template-heading-rail__pill) { margin-inline: 0; }
  .builders-contact-chinese { font-size: 32px; }
  .builders-section-heading--split :deep(.template-heading-rail__line) { display: none; }
  .builders-section-heading--team > p { max-width: 680px; }
  .builders-team__grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
  .builders-contact__grid { grid-template-columns: 1fr; }
  .builders-contact__aside { display: grid; grid-template-columns: 1fr 1fr; align-items: end; gap: 30px; padding: 0 0 48px; }
}

@media (min-width: 768px) and (max-height: 899px) {
  .builders-strengths-copy { gap: clamp(16px, 3svh, 28px); padding: 16px 0 6px; }
  .builders-strengths-heading h2 { margin: 18px 0 20px; font-size: clamp(28px, min(10cqw, 6.4svh), 52px); }
  .builders-strengths-heading h2 b { margin-bottom: 12px; font-size: clamp(24px, min(6.7cqw, 4.4svh), 36px); }
  .builders-strengths-heading > p { font-size: 14px; line-height: 22px; }
  .builders-solution__copy h3, .builders-solution__copy p { font-size: 18px; }
  .builders-solution__copy .builders-solution__number { min-height: 0; font-size: clamp(48px, 9svh, 72px); }
}

@media (max-width: 767px) {
  .builders-page .internal-rail-safe { padding-right: 0; }
  .builders-rail-wide { width: calc(100% - 30px); }
  .builders-rail { width: 100%; }
  .builders-hero { min-height: 668px; }
  .builders-hero__inner { padding: 80px 0 0; }
  .builders-hero__eyebrow { font-size: 20px; }
  .builders-hero h1 { margin-top: 18px; font-size: clamp(24px, 7.3vw, 32px); line-height: 1.5; }
  .builders-hero__aside { margin: 35px 0 0; }
  .builders-hero__aside .builders-round-link { margin-top: 27px; }
  .builders-hero-media { width: calc(100% - 30px); height: 310px; margin-top: -135px; border-radius: 18px; }
  .builders-team,
  .builders-contact { padding: 72px 15px; }
  .builders-capability { padding-bottom: 40px; }
  .builders-capability > .builders-rail { width: calc(100% - 30px); }
  .builders-strengths-section { padding: 60px 15px; }
  .builders-strengths-layout { grid-template-columns: minmax(0, 1fr); gap: 30px; }
  .builders-strengths-copy { position: static; display: block; min-height: auto; padding: 0; }
  .builders-strengths-heading h2 { margin-bottom: 20px; font-size: 30px; }
  .builders-strengths-heading h2 b { font-size: 28px; }
  .builders-solution__copy { margin-top: 30px; }
  .builders-solution__copy .builders-solution__number { min-height: 58px; font-size: 48px; }
  .builders-solution__copy h3,
  .builders-solution__copy p,
  .builders-solution__caption { font-size: 18px; }
  .builders-solution__caption strong { font-size: 24px; }
  .builders-solution,
  .builders-solution__visual { border-radius: 18px; }
  .builders-services { padding-block: 30px 60px; }
  .builders-lifetime__visual { border-radius: 18px; }
  .builders-section-heading h2,
  .builders-lifetime h2 { font-size: 41px; line-height: 46px; }
  #builders-team-title { font-size: 30px; line-height: 35px; }
  .builders-brand-chinese { font-size: 28px; }
  .builders-section-heading--team > :deep(.section-pill) { margin-bottom: 28px; }
  #builders-contact-title { font-size: 34px; line-height: 39px; }
  #builders-contact-title .builders-contact-eyebrow { display: block; width: fit-content; margin: 0 0 8px; }
  .builders-contact-chinese { display: block; top: auto; margin: 0 0 8px; font-size: 28px; }
  .builders-team__grid { grid-template-columns: 1fr; gap: 20px; }
  .builders-team-card > :deep(.builder-image) { aspect-ratio: 1 / 1.12; }
  .builders-contact__aside { display: block; }
  .builders-contact__visual { margin-top: 36px; }
  .builders-contact__tabs { gap: 8px; margin-bottom: 12px; }
  .builders-contact__tabs button { padding-inline: 10px; }
  .builders-contact__copy dl div { grid-template-columns: 1fr; gap: 6px; }
}

@media (prefers-reduced-motion: reduce) {
  .builders-hero-media.is-visible :deep(img) { animation: none; transform: none; }
  .builders-round-link { transition: none; }
  .builders-round-link__icon,
  .builders-round-link__icon::after { transition: none; animation: none; }
  .builders-round-link:hover,
  .builders-round-link:focus-visible { transform: none; }
  .builders-round-link:hover .builders-round-link__icon,
  .builders-round-link:focus-visible .builders-round-link__icon { transform: rotate(-45deg); }
  .builders-team-card:hover :deep(.builder-image img) { transform: none; }
  .builders-team-card__shade,
  .builders-team-card__project-status > svg { transition: none; }
  .builders-team-card--project:hover .builders-team-card__project-status > svg,
  .builders-team-card--project:focus-visible .builders-team-card__project-status > svg { transform: rotate(-45deg); }
  .builders-contact__tabs button,
  .builders-contact__tabs button::after,
  .builders-pavilion-enter-active,
  .builders-pavilion-leave-active { transition: none; }
}

</style>
