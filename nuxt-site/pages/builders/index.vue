<script setup lang="ts">
import { ArrowRight, Check, Clock3, MapPin, Triangle } from 'lucide-vue-next'
import { BUILDER_APPOINTMENT_HASH, builderPartners, builderProjectCards } from '~/data/builders'
import { brandPavilions } from '~/data/brandPavilions'

useSeoMeta({
  title: '建商專區｜SAKURA 整體廚房',
  description: 'SAKURA 整體廚房提供建案一站式整體廚房解決方案、供貨管理、專業銷講監工與預約諮詢服務。',
  ogTitle: '建商專區｜SAKURA 整體廚房',
  ogDescription: '為建案提升價值與銷售力的一站式整體廚房解決方案。',
  ogImage: '/section-6/builders/builder-hero.jpg',
})

const builderPartnerLoop = [...builderPartners, ...builderPartners]

const strengths = [
  { value: ['45萬+'], lines: ['設計模組', '累積超過', '多元選擇'], background: '/section-6/builders/capability-banners/catalog-background.png' },
  { value: ['AI', '智能'], lines: ['廚衛工廠', '全台最大', '供貨穩定'], background: '/section-6/builders/capability-banners/factory-background.png' },
  { value: ['管理', '平台'], lines: ['案件進度', '獨家智能', '精準掌握'], background: '/section-6/builders/capability-banners/management-background.png' },
]

const services = [
  { eyebrow: 'ONE-STOP', label: '一站式服務', title: '專業銷講', copy: ['舉辦住戶裝修講座', '加速建案銷售'] },
  { eyebrow: 'NUMEROUS', label: '多樣產品選擇', title: '專屬監工', copy: ['透過專屬的即時監控系統', '完善管理工期'] },
  { eyebrow: 'EFFICIENT', label: '輕鬆擁有', title: '專人驗收', copy: ['協助建案偕同驗收', '住戶安心放心'] },
]

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
</script>

<template>
  <main class="builders-page">
    <section class="builders-hero hero-includes-header" aria-labelledby="builders-title">
      <span class="builders-hero__deco" aria-hidden="true" />
      <div class="builders-rail-wide builders-hero__inner internal-rail-safe">
        <div v-reveal="{ anim: 'opalMoveRight' }" data-ev="opalMoveRight" class="builders-hero__headline ev">
          <InternalSectionPill tone="dark">Property Developers</InternalSectionPill>
          <h1 id="builders-title">Find Your Inspired<br /><span>Kitchen Design</span></h1>
        </div>
        <div v-reveal="{ anim: 'opalMoveLeft', delay: 120 }" data-ev="opalMoveLeft" class="builders-hero__aside ev">
          <p>一站式整體廚房解決方案，為建案提升價值與銷售力。</p>
          <a :href="BUILDER_APPOINTMENT_HASH" class="builders-round-link">
            <span>專人聯繫</span>
            <span class="builders-round-link__icon"><ArrowRight aria-hidden="true" /></span>
          </a>
        </div>
      </div>
    </section>

    <div v-reveal="{ anim: 'opalMoveUp', delay: 220 }" data-ev="opalMoveUp" class="builders-rail-wide builders-hero-media ev">
      <InternalBuilderImage src="/section-6/builders/builder-hero.jpg" alt="SAKURA KITCHEN 深色現代整體廚房與中島空間" eager />
    </div>

    <section class="builders-team" aria-labelledby="builders-team-title">
      <div class="builders-rail internal-rail-safe">
        <header v-reveal="{ anim: 'opalMoveUp' }" class="builders-section-heading builders-section-heading--team">
          <InternalSectionPill>Our Team</InternalSectionPill>
          <h2 id="builders-team-title">Meet The <span>Experts Our</span><br />Kitchen Designers</h2>
        </header>
        <div class="builders-team__grid">
          <template v-for="(card, index) in builderProjectCards" :key="card.image">
            <NuxtLink
              v-if="card.type === 'project'"
              :to="card.href"
              class="builders-team-card builders-team-card--project"
              aria-label="前往 SAKURA KITCHEN 建商整體廚房介紹頁"
            >
              <InternalBuilderImage :src="card.image" alt="SAKURA KITCHEN 建商整體廚房展示空間" />
              <span class="builders-team-card__shade" aria-hidden="true" />
              <img :src="card.logo" alt="SAKURA KITCHEN" class="builders-team-card__logo" />
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
            <strong>Coming Soon</strong>
          </article>
        </div>
      </div>
    </section>

    <section class="builders-capability" aria-labelledby="builders-capability-title">
      <div class="builders-rail internal-rail-safe">
        <header class="builders-section-heading builders-section-heading--split">
          <InternalTemplateHeadingRail v-reveal="{ anim: 'opalMoveRight' }" label="Our Brands" />
          <div v-reveal="{ anim: 'opalMoveLeft', delay: 100 }">
            <h2 id="builders-capability-title">Have A Project In <span>Mind?</span><br /><span>Let’s</span> Make It Happen</h2>
            <p>櫻花與建商攜手打造高品質住宅，從設計模組、工廠供貨到案件管理，讓每個廚房交付節點更清楚。</p>
          </div>
        </header>

        <div class="builders-capability__showcase">
          <div class="builders-strengths">
            <article
              v-for="(item, index) in strengths"
              :key="item.lines[0]"
              v-reveal="{ anim: 'opalMoveUp', delay: index * 100 }"
              data-ev="opalMoveUp"
              class="builders-strength ev"
              :style="{ backgroundImage: `url(${item.background})` }"
            >
              <div class="builders-strength__content">
                <h3>
                  <span v-for="line in item.lines" :key="line">{{ line }}</span>
                </h3>
              </div>
              <p class="builders-strength__slogan">
                <span v-for="line in item.value" :key="line">{{ line }}</span>
              </p>
            </article>
          </div>

          <div class="builders-home-one">
            <div class="builders-one">
              <p>美好居家生活的創造者</p>
              <strong>HOME in O.N.E</strong>
            </div>

            <div class="builders-services">
              <article v-for="(service, index) in services" :key="service.title" v-reveal="{ anim: 'opalMoveUp', delay: index * 100 }" data-ev="opalMoveUp" class="builders-service ev">
                <div class="builders-service__label">
                  <Triangle aria-hidden="true" />
                  <strong>{{ service.eyebrow }}</strong>
                  <span>{{ service.label }}</span>
                </div>
                <h3><Check aria-hidden="true" />{{ service.title }}</h3>
                <p><span v-for="line in service.copy" :key="line">{{ line }}</span></p>
              </article>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="builders-lifetime" aria-labelledby="builders-lifetime-title">
      <div class="builders-rail internal-rail-safe">
        <header v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="builders-lifetime__heading ev">
          <InternalSectionPill class="builders-lifetime__pill">Lifetime Service</InternalSectionPill>
          <h2 id="builders-lifetime-title">One-Click Registration <span>Lifetime Service</span></h2>
          <p>購買 SAKURA iCare 系列產品，掃描保證書專屬 QR Code，即可啟動智能化服務，銜接產品登錄、保固與後續服務。</p>
        </header>
        <div v-reveal="{ anim: 'opalScaleUp', delay: 120 }" data-ev="opalScaleUp" class="builders-lifetime__visual ev" style="animation-delay:120ms">
          <InternalBuilderImage
            src="/section-6/builders/i-care-service.png"
            alt="SAKURA KITCHEN 一鍵登錄終身服務、保證書與手機產品服務示意"
            fit="contain"
          />
        </div>
      </div>
    </section>

    <section class="builders-partners" aria-labelledby="builders-partners-title">
      <div class="builders-partners__rail">
        <h2 id="builders-partners-title" v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="ev">OUR CLIENTS</h2>
        <ul class="sr-only">
          <li v-for="partner in builderPartners" :key="partner.name">{{ partner.name }}</li>
        </ul>
        <div class="builders-partners__viewport" tabindex="0" aria-label="合作建商 Logo 輪播，取得鍵盤焦點後暫停">
          <div class="builders-partners__row">
            <div class="builders-partners__track">
              <div v-for="(partner, index) in builderPartnerLoop" :key="`top-${partner.name}-${index}`" class="builders-partner" :class="{ 'builders-partner--clone': index >= builderPartners.length }">
                <InternalBuilderImage :src="partner.logo" alt="" fit="contain" />
              </div>
            </div>
          </div>
          <div class="builders-partners__row builders-partners__row--reverse">
            <div class="builders-partners__track">
              <div v-for="(partner, index) in builderPartnerLoop" :key="`bottom-${partner.name}-${index}`" class="builders-partner" :class="{ 'builders-partner--clone': index >= builderPartners.length }">
                <InternalBuilderImage :src="partner.logo" alt="" fit="contain" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="appointment" class="builders-contact" aria-labelledby="builders-contact-title">
      <div class="builders-rail internal-rail-safe">
        <header v-reveal="{ anim: 'opalMoveUp' }" class="builders-section-heading builders-section-heading--split builders-contact__heading">
          <InternalSectionPill>Get In Touch</InternalSectionPill>
          <div>
            <h2 id="builders-contact-title">Have A Project In <span>Mind?</span><br /><span>Let’s</span> Make It Happen</h2>
          </div>
        </header>

        <div class="builders-contact__grid">
          <aside v-reveal="{ anim: 'opalMoveRight' }" data-ev="opalMoveRight" class="builders-contact__aside ev">
            <div class="builders-contact__copy">
              <h3>櫻花集團 品牌館<br /><span>全預約制</span></h3>
              <p>留下您的資訊，將由專人與您聯繫，提供最適合您建案的整體廚房規劃建議。</p>
              <dl>
                <div><dt><MapPin aria-hidden="true" />地址</dt><dd>{{ activePavilion.address }}</dd></div>
                <div><dt><Clock3 aria-hidden="true" />營業時間</dt><dd>{{ activePavilion.hours }}</dd></div>
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

<style scoped>
.builders-page { overflow: clip; color: #1c1c1d; background: #fff; }
.builders-rail-wide { width: min(1770px, calc(100% - 60px)); margin-inline: auto; box-sizing: border-box; }
.builders-rail { width: min(1410px, calc(100% - 60px)); margin-inline: auto; box-sizing: border-box; }
.builders-round-link { display: inline-flex; min-height: 60px; width: max-content; flex: none; align-items: center; justify-content: center; gap: 8px; padding: 9px 9px 9px 30px; border: 1px solid rgb(255 255 255 / 34%); border-radius: 999px; color: #fff; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 22px; transition: color .3s ease, border-color .3s ease, background-color .3s ease, transform .3s ease; }
.builders-round-link__icon { position: relative; isolation: isolate; display: inline-flex; width: 40px; height: 40px; flex: none; align-items: center; justify-content: center; border-radius: 50%; color: #fff; background: #caa05c; transform: rotate(-45deg); transition: color .35s ease, background-color .35s ease, transform .5s ease; }
.builders-round-link__icon::after { position: absolute; z-index: -1; inset: 0; border-radius: 50%; content: ''; background: #caa05c; animation: builders-cta-radar 2s ease-out infinite; }
.builders-round-link__icon svg { width: 20px; height: 20px; }
.builders-round-link:hover,
.builders-round-link:focus-visible { color: #1c1c1d; border-color: #caa05c; background: #caa05c; transform: translateY(-2px); }
.builders-round-link:hover .builders-round-link__icon,
.builders-round-link:focus-visible .builders-round-link__icon { color: #fff; background: #1c1c1d; transform: rotate(0); }
.builders-round-link:hover .builders-round-link__icon::after,
.builders-round-link:focus-visible .builders-round-link__icon::after { animation: none; opacity: 0; }
@keyframes builders-cta-radar { from { opacity: .6; transform: scale(1); } to { opacity: 0; transform: scale(1.55); } }
.builders-hero { position: relative; z-index: 0; min-height: 820px; overflow: hidden; color: #fff; background: #1c1c1d; }
.builders-hero__deco { position: absolute; z-index: -1; inset: 0; opacity: .08; background: url('/section-6/franchise/antra-original/h5-bg1.png') center / cover no-repeat; filter: invert(1); }
.builders-hero__inner { display: grid; grid-template-columns: 64% 36%; padding: 142px 30px 0; }
.builders-hero h1 { max-width: 960px; margin: 22px 0 0; font-family: var(--font-display); font-size: clamp(72px, 7.28vw, 110px); font-weight: 400; line-height: 1; letter-spacing: -1px; }
.builders-hero h1 span { color: #caa05c; }
.builders-hero__aside { width: min(430px, 100%); align-self: end; margin: 0 0 16px 6px; }
.builders-hero__aside p { margin: 0; color: rgb(255 255 255 / 82%); font-size: 20px; line-height: 31px; }
.builders-hero__aside .builders-round-link { margin-top: 42px; }
.builders-hero-media { position: relative; z-index: 9; height: clamp(520px, 42.5vw, 760px); margin-top: -360px; overflow: hidden; border-radius: 24px; }
.builders-hero-media :deep(img) { object-position: center 58%; }
.builders-section-heading h2,
.builders-lifetime h2 { margin: 0; font-family: var(--font-display); font-size: 60px; font-weight: 400; line-height: 64px; letter-spacing: -.02em; }
.builders-section-heading h2 span,
.builders-lifetime h2 span { color: #caa05c; }
.builders-section-heading > p { color: #59585d; font-size: 16px; line-height: 25px; }
.builders-team { padding: 125px 30px 130px; background: #fff url('/section-6/franchise/antra-original/h5-bg02.png') top right / auto no-repeat; }
.builders-section-heading--team { display: grid; grid-template-columns: 25% 48% 27%; align-items: end; margin-bottom: 60px; }
.builders-section-heading--team > p { margin: 0 0 4px; }
.builders-team__grid { display: grid; grid-template-columns: repeat(4, minmax(0, 1fr)); gap: 30px; }
.builders-team-card { position: relative; display: block; min-width: 0; overflow: hidden; border-radius: 24px; color: inherit; background: #fafafa; text-decoration: none; }
.builders-team-card--project { grid-column: 1; }
.builders-team-card--coming-soon { display: grid; aspect-ratio: 4 / 5; place-items: center; border: 1px solid #e3e3e8; background: #fafafa url('/section-6/franchise/antra-original/h5-bg02.png') center / cover no-repeat; }
.builders-team-card--coming-soon strong { padding: 24px; font-family: var(--font-display); font-size: clamp(24px, 2vw, 34px); font-weight: 400; text-align: center; }
.builders-team-card > :deep(.builder-image) { aspect-ratio: 4 / 5; }
.builders-team-card:hover :deep(img) { transform: scale(1.035); }
.builders-team-card:focus-visible { outline: 2px solid #caa05c; outline-offset: 5px; }
.builders-team-card__shade { position: absolute; inset: 0; background: rgb(16 8 1 / 42%); transition: background-color .35s ease; }
.builders-team-card--project:hover .builders-team-card__shade,
.builders-team-card--project:focus-visible .builders-team-card__shade { background: rgb(16 8 1 / 30%); }
.builders-team-card__logo { position: absolute; top: 50%; left: 50%; width: min(190px, 62%); height: auto; transform: translate(-50%, -64%); }
.builders-team-card__status { position: absolute; inset: auto 14px 14px; display: flex; min-height: 54px; align-items: center; justify-content: space-between; padding: 10px 12px 10px 18px; border-radius: 999px; color: #fff; background: rgb(28 28 29 / 84%); backdrop-filter: blur(14px); }
.builders-team-card__status span { font-family: var(--font-ui); font-size: 17px; }
.builders-team-card__status strong { display: flex; width: 34px; height: 34px; align-items: center; justify-content: center; border-radius: 50%; color: #1c1c1d; background: #caa05c; font-size: 12px; }
.builders-team-card__project-status { position: absolute; right: 14px; bottom: 14px; left: 14px; display: flex; min-height: 64px; align-items: center; justify-content: space-between; padding: 10px 12px 10px 18px; border-radius: 999px; color: #fff; background: rgb(28 28 29 / 84%); backdrop-filter: blur(14px); }
.builders-team-card__project-status > span { display: flex; min-width: 0; flex-direction: column; gap: 2px; font-family: var(--font-cjk-sans); font-size: 13px; line-height: 18px; }
.builders-team-card__project-status strong { overflow: hidden; font-family: var(--font-ui); font-size: 17px; font-weight: 400; line-height: 21px; text-overflow: ellipsis; white-space: nowrap; }
.builders-team-card__project-status > svg { width: 36px; height: 36px; flex: none; padding: 9px; border-radius: 50%; color: #1c1c1d; background: #caa05c; transform: rotate(-45deg); transition: transform .35s ease; }
.builders-team-card--project:hover .builders-team-card__project-status > svg,
.builders-team-card--project:focus-visible .builders-team-card__project-status > svg { transform: rotate(0); }
.builders-capability { padding: 130px 30px 72px; background: #fafafa; }
.builders-section-heading--split { display: grid; grid-template-columns: 30% 70%; align-items: start; }
.builders-capability .builders-section-heading--split > div h2 { margin-top: 70px; }
.builders-section-heading--split > div > p { max-width: 760px; margin: 25px 0 0; color: #59585d; font-size: 17px; line-height: 27px; }
.builders-capability__showcase { display: grid; gap: 32px; margin-top: 48px; }
.builders-strengths { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 30px; padding: 30px; border: 1px solid rgb(202 160 92 / 16%); border-radius: 36px; background: rgb(255 255 255 / 92%); box-shadow: 0 28px 90px rgb(28 28 29 / 8%); }
.builders-strength { position: relative; display: flex; min-height: 186px; align-items: center; justify-content: space-between; gap: 24px; overflow: hidden; padding: 30px 28px 32px; border: 1px solid rgb(202 160 92 / 12%); border-radius: 22px; background-color: #f9f9f9; background-position: center; background-repeat: no-repeat; background-size: cover; box-shadow: 0 14px 36px rgb(28 28 29 / 5%); }
.builders-strength__content,
.builders-strength__slogan { position: relative; z-index: 1; }
.builders-strength h3 { display: flex; flex-direction: column; margin: 0; font-family: var(--font-cjk-sans); font-size: 22px; font-weight: 700; line-height: 1.12; white-space: nowrap; }
.builders-strength h3 span:nth-child(2) { color: #caa05c; }
.builders-strength__slogan { display: flex; min-width: 112px; flex-direction: column; margin: 0; color: #caa05c; font-family: var(--font-cjk-serif); font-size: 44px; font-weight: var(--font-cjk-serif-semibold, 600); line-height: .98; white-space: nowrap; }
.builders-home-one { width: 100%; margin: 0; padding: 54px 30px 64px; border: 1px solid rgb(202 160 92 / 16%); border-radius: 36px; background: rgb(255 255 255 / 92%); box-shadow: 0 28px 90px rgb(28 28 29 / 8%); }
.builders-one { display: flex; flex-direction: column; align-items: center; }
.builders-one p { margin: 0 0 16px; color: #caa05c; font-family: var(--font-cjk-sans); font-size: 42px; font-weight: 700; line-height: 1.25; }
.builders-one strong { display: inline-flex; width: min(420px, 100%); min-height: 64px; align-items: center; justify-content: center; padding: 10px 28px; border-radius: 999px; color: #fff; background: #caa05c; font-family: var(--font-ui); font-size: 28px; font-weight: 400; letter-spacing: .18em; white-space: nowrap; }
.builders-services { display: grid; width: min(706px, 100%); grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 32px; margin: 38px auto 0; }
.builders-service { text-align: center; }
.builders-service__label { position: relative; display: flex; min-height: 92px; flex-direction: column; align-items: center; justify-content: center; border: 2px solid rgb(202 160 92 / 72%); border-radius: 14px; color: #b99864; background: #fff; font-family: var(--font-cjk-sans); line-height: 1.12; }
.builders-service__label > svg { position: absolute; top: -18px; left: 50%; width: 24px; height: 21px; color: #c4a574; fill: #c4a574; stroke-width: 0; transform: translateX(-50%); }
.builders-service__label strong { font-size: 21px; font-weight: 500; }
.builders-service__label span { margin-top: 4px; font-size: 19px; }
.builders-service h3 { display: flex; align-items: center; justify-content: center; gap: 10px; margin: 36px 0 0; font-family: var(--font-cjk-sans); font-size: 32px; font-weight: 700; line-height: 1.2; }
.builders-service h3 > svg { width: 25px; height: 25px; flex: none; color: #c4a574; stroke-width: 4.5; }
.builders-service p { display: flex; flex-direction: column; gap: 10px; margin: 13px 0 0; color: #1c1c1d; font-family: var(--font-cjk-sans); font-size: 21px; line-height: 1.45; }
.builders-service p span { white-space: nowrap; }
.builders-lifetime { padding: 72px 30px 140px; color: #1c1c1d; background: #fafafa url('/section-6/franchise/antra-original/h1-bg01-1.png') bottom center / 100% auto no-repeat; }
.builders-lifetime__heading { width: min(920px, 100%); margin-inline: auto; text-align: center; }
.builders-lifetime__pill { margin-inline: auto; }
.builders-lifetime__heading h2 { margin-top: 24px; font-family: var(--font-display); font-weight: 400; }
.builders-lifetime__heading h2 span { display: inline-block; color: #caa05c; white-space: nowrap; }
.builders-lifetime__heading p { max-width: 690px; margin: 24px auto 0; color: #59585d; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 25px; }
.builders-lifetime__visual { margin-top: 58px; overflow: hidden; border: 1px solid #e3e3e8; border-radius: 24px; background: #fff; box-shadow: 0 24px 70px rgb(28 28 29 / 8%); }
.builders-lifetime__visual > :deep(.builder-image) { aspect-ratio: 16 / 9; background: #fff; }
.builders-partners { overflow: hidden; padding: 86px 0 102px; background: #fff url('/section-6/franchise/antra-original/h1-bg02.png') bottom center / 100% auto no-repeat; }
.builders-partners__rail { width: 100%; }
.builders-partners h2 { margin: 0; color: #1c1c1d; font-family: var(--font-ui); font-size: 12px; font-weight: 400; line-height: 18px; letter-spacing: .01em; text-align: center; }
.builders-partners h2 span { color: #caa05c; }
.builders-partners__viewport { display: grid; gap: 0; margin-top: 36px; border-block: 1px solid #e3e3e8; }
.builders-partners__row { min-width: 0; overflow: hidden; border-bottom: 1px solid #e3e3e8; }
.builders-partners__row:last-child { border-bottom: 0; }
.builders-partners__track { display: flex; width: max-content; animation: builders-partners-marquee 34s linear infinite; will-change: transform; }
.builders-partners__row--reverse .builders-partners__track { animation-direction: reverse; animation-duration: 39s; }
.builders-partners__viewport:hover .builders-partners__track,
.builders-partners__viewport:focus-within .builders-partners__track { animation-play-state: paused; }
.builders-partners__viewport:focus-visible { outline: 2px solid #caa05c; outline-offset: 5px; }
.builders-partner { width: clamp(210px, 16.6vw, 300px); height: 118px; flex: none; padding: 24px 34px; border-right: 1px solid #e3e3e8; background: rgb(255 255 255 / 82%); }
.builders-partner > :deep(.builder-image) { background: transparent; }
.builders-partner :deep(img) { max-width: 100%; max-height: 100%; opacity: .42; filter: grayscale(1); }
@keyframes builders-partners-marquee { to { transform: translateX(-50%); } }
.builders-contact { scroll-margin-top: 60px; padding: 120px 30px 130px; background: #fafafa url('/section-6/franchise/antra-original/h1-bg02.png') top right / auto no-repeat; }
.builders-contact__heading { margin-bottom: 58px; }
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
.builders-contact__tabs { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 12px; margin-bottom: 18px; font-family: var(--font-cjk-sans); font-size: 14px; line-height: 20px; }
.builders-contact__tabs button { min-height: 44px; padding: 10px 16px; border: 1px solid #e3e3e8; border-radius: 999px; color: #1c1c1d; background: #fff; font: inherit; cursor: pointer; transition: color .3s ease, border-color .3s ease, background-color .3s ease, transform .3s ease; }
.builders-contact__tabs button:hover,
.builders-contact__tabs button:focus-visible,
.builders-contact__tabs button[aria-selected='true'] { border-color: #caa05c; color: #1c1c1d; background: #caa05c; transform: translateY(-2px); }
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
  .builders-hero h1 { font-size: clamp(64px, 7.4vw, 88px); }
  .builders-section-heading--team { grid-template-columns: 23% 52% 25%; }
  .builders-section-heading h2,
  .builders-lifetime h2 { font-size: 52px; line-height: 57px; }
  .builders-strength { min-height: 186px; gap: 18px; padding: 28px 24px 30px; }
  .builders-strength h3 { font-size: 20px; }
  .builders-strength__slogan { min-width: 100px; font-size: 38px; }
  .builders-contact__aside { padding-right: 35px; }
}

@media (max-width: 1023px) {
  .builders-rail-wide,
  .builders-rail { width: calc(100% - 60px); }
  .builders-hero { min-height: 730px; }
  .builders-hero__inner { grid-template-columns: 1fr; padding-top: 115px; }
  .builders-hero__aside { margin: 42px 0 0; }
  .builders-hero-media { height: 520px; margin-top: -240px; }
  .builders-team,
  .builders-capability,
  .builders-lifetime,
  .builders-partners,
  .builders-contact { padding-block: 96px; }
  .builders-capability { padding-bottom: 56px; }
  .builders-lifetime { padding-top: 56px; }
  .builders-section-heading--team,
  .builders-section-heading--split { grid-template-columns: 1fr; gap: 25px; }
  .builders-section-heading--team > p { max-width: 680px; }
  .builders-team__grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
  .builders-strengths { gap: 22px; }
  .builders-strength { gap: 12px; padding: 24px 18px 26px; }
  .builders-strength h3 { font-size: 18px; }
  .builders-strength__slogan { min-width: 88px; font-size: 32px; }
  .builders-home-one { width: 100%; }
  .builders-services { gap: 24px; }
  .builders-one p { font-size: 32px; }
  .builders-service__label strong { font-size: 18px; }
  .builders-service__label span { font-size: 16px; }
  .builders-service h3 { font-size: 25px; }
  .builders-service p { font-size: 17px; }
  .builders-contact__grid { grid-template-columns: 1fr; }
  .builders-contact__aside { display: grid; grid-template-columns: 1fr 1fr; align-items: end; gap: 30px; padding: 0 0 48px; }
}

@media (max-width: 767px) {
  .builders-page .internal-rail-safe { padding-right: 0; }
  .builders-rail-wide,
  .builders-rail { width: calc(100% - 30px); }
  .builders-hero { min-height: 620px; }
  .builders-hero__inner { padding: 80px 0 0; }
  .builders-hero h1 { margin-top: 18px; font-size: clamp(47px, 13.8vw, 58px); line-height: 1.02; letter-spacing: -.02em; }
  .builders-hero__aside { margin: 35px 0 0; }
  .builders-hero__aside p { font-size: 17px; line-height: 27px; }
  .builders-hero__aside .builders-round-link { margin-top: 27px; }
  .builders-hero-media { width: calc(100% - 30px); height: 310px; margin-top: -135px; border-radius: 18px; }
  .builders-team,
  .builders-capability,
  .builders-lifetime,
  .builders-partners,
  .builders-contact { padding: 72px 15px; }
  .builders-capability { padding-bottom: 40px; }
  .builders-lifetime { padding-top: 48px; }
  .builders-section-heading h2,
  .builders-lifetime h2 { font-size: 41px; line-height: 46px; }
  .builders-capability .builders-section-heading--split > div h2 { margin-top: 20px; }
  .builders-team__grid { grid-template-columns: 1fr; gap: 20px; }
  .builders-team-card > :deep(.builder-image) { aspect-ratio: 1 / 1.12; }
  .builders-strengths { grid-template-columns: 1fr; margin-top: 56px; }
  .builders-capability__showcase { gap: 20px; }
  .builders-capability__showcase .builders-strengths { margin-top: 0; padding: 18px; border-radius: 26px; }
  .builders-strength { width: 100%; min-height: 170px; gap: 12px; margin-inline: auto; padding: 24px 16px 26px; }
  .builders-strength h3 { font-size: 22px; }
  .builders-strength__slogan { min-width: 104px; font-size: 42px; }
  .builders-home-one { margin: 0; padding: 42px 18px 48px; border-radius: 26px; }
  .builders-one p { font-size: 27px; text-align: center; }
  .builders-one strong { min-height: 58px; padding-inline: 14px; font-size: 18px; letter-spacing: .12em; }
  .builders-services { grid-template-columns: 1fr; gap: 46px; margin-top: 36px; }
  .builders-service { width: min(330px, 100%); margin-inline: auto; }
  .builders-lifetime__visual { margin-top: 40px; border-radius: 18px; }
  .builders-partners { padding: 64px 0 72px; }
  .builders-partners__viewport { margin-top: 28px; }
  .builders-partner { width: 184px; height: 98px; padding: 20px 26px; }
  .builders-contact__aside { display: block; }
  .builders-contact__visual { margin-top: 36px; }
  .builders-contact__tabs { gap: 8px; margin-bottom: 12px; font-size: 13px; }
  .builders-contact__tabs button { min-height: 38px; padding: 8px 10px; }
  .builders-contact__copy dl div { grid-template-columns: 1fr; gap: 6px; }
}

@media (prefers-reduced-motion: reduce) {
  .builders-round-link { transition: none; }
  .builders-round-link__icon,
  .builders-round-link__icon::after { transition: none; animation: none; }
  .builders-round-link:hover,
  .builders-round-link:focus-visible { transform: none; }
  .builders-round-link:hover .builders-round-link__icon,
  .builders-round-link:focus-visible .builders-round-link__icon { transform: rotate(-45deg); }
  .builders-team-card:hover :deep(img) { transform: none; }
  .builders-team-card__shade,
  .builders-team-card__project-status > svg { transition: none; }
  .builders-team-card--project:hover .builders-team-card__project-status > svg,
  .builders-team-card--project:focus-visible .builders-team-card__project-status > svg { transform: rotate(-45deg); }
  .builders-partners__row { overflow: visible; }
  .builders-partners__row--reverse { display: none; }
  .builders-partners__track { display: grid; width: 100%; grid-template-columns: repeat(5, minmax(0, 1fr)); animation: none; }
  .builders-partner { width: auto; }
  .builders-partner--clone { display: none; }
  .builders-contact__tabs button,
  .builders-contact__tabs button::after,
  .builders-pavilion-enter-active,
  .builders-pavilion-leave-active { transition: none; }
}

@media (max-width: 767px) and (prefers-reduced-motion: reduce) {
  .builders-partners__track { grid-template-columns: repeat(2, minmax(0, 1fr)); }
}
</style>
