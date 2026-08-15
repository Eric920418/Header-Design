<script setup lang="ts">
import { ArrowRight, Boxes, CircleCheckBig, Clock3, Factory, MapPin, QrCode, ShieldCheck, Smartphone, Workflow } from 'lucide-vue-next'
import { BUILDER_APPOINTMENT_HASH, builderPartners, builderTeamImages } from '~/data/builders'

useSeoMeta({
  title: '建商專區｜SAKURA 整體廚房',
  description: 'SAKURA 整體廚房提供建案一站式整體廚房解決方案、供貨管理、專業銷講監工與預約諮詢服務。',
  ogTitle: '建商專區｜SAKURA 整體廚房',
  ogDescription: '為建案提升價值與銷售力的一站式整體廚房解決方案。',
  ogImage: '/section-6/builders/hero-kitchen.jpeg',
})

const strengths = [
  { icon: Boxes, value: '45萬+', title: '設計模組', copy: '累積超過 45 萬組設計模組，提供建案多元選擇。' },
  { icon: Factory, value: 'AI 智能', title: '廚衛工廠', copy: '全台大型 AI 智能廚衛工廠，強化量產與供貨穩定。' },
  { icon: Workflow, value: '管理平台', title: '案件進度', copy: '獨家智能管理平台，讓案件進度與節點精準掌握。' },
]

const services = [
  { icon: CircleCheckBig, eyebrow: 'ONE-STOP', title: '專業銷講', copy: '從樣品屋到銷售話術，建立一致的廚房價值溝通。' },
  { icon: ShieldCheck, eyebrow: 'NUMEROUS', title: '專業監工', copy: '串接丈量、排程與安裝，降低多方協作的資訊落差。' },
  { icon: QrCode, eyebrow: 'EFFICIENT', title: '專人驗收', copy: '依案件節點完成驗收，並銜接後續產品服務。' },
]
</script>

<template>
  <main class="builders-page">
    <section class="builders-hero" aria-labelledby="builders-title">
      <span class="builders-hero__deco" aria-hidden="true" />
      <div class="builders-rail-wide builders-hero__inner internal-rail-safe">
        <div v-reveal="{ anim: 'opalMoveRight' }" data-ev="opalMoveRight" class="builders-hero__headline ev">
          <span class="builders-pill builders-pill--dark"><i aria-hidden="true" />建商專區</span>
          <h1 id="builders-title">Find Your Inspired<br /><span>Interior Design</span></h1>
        </div>
        <div v-reveal="{ anim: 'opalMoveLeft', delay: 120 }" data-ev="opalMoveLeft" class="builders-hero__aside ev">
          <p>一站式整體廚房解決方案，為建案提升價值與銷售力。</p>
          <a :href="BUILDER_APPOINTMENT_HASH" class="builders-round-link">專人聯繫 <ArrowRight aria-hidden="true" /></a>
        </div>
      </div>
    </section>

    <div v-reveal="{ anim: 'opalMoveUp', delay: 220 }" data-ev="opalMoveUp" class="builders-rail-wide builders-hero-media ev">
      <InternalBuilderImage src="/section-6/builders/hero-kitchen.jpeg" alt="深色現代整體廚房與中島空間" eager />
    </div>

    <section class="builders-team" aria-labelledby="builders-team-title">
      <div class="builders-rail internal-rail-safe">
        <header class="builders-section-heading builders-section-heading--team">
          <span class="builders-pill"><i aria-hidden="true" />Our Team</span>
          <h2 id="builders-team-title">Meet The <span>Experts Our</span><br />Interior Designers</h2>
          <p>專業團隊資訊即將公開。人物影像依 PPT 指定的 Antra Home 07 視覺呈現，正式人員姓名與職稱待甲方提供。</p>
        </header>
        <div class="builders-team__grid">
          <article v-for="(image, index) in builderTeamImages" :key="image" v-reveal="{ anim: 'opalMoveUp', delay: index * 90 }" data-ev="opalMoveUp" class="builders-team-card ev">
            <InternalBuilderImage :src="image" :alt="`Antra Home 07 團隊人物參考影像 ${index + 1}`" />
            <div class="builders-team-card__status"><span>Coming Soon</span><strong>{{ String(index + 1).padStart(2, '0') }}</strong></div>
          </article>
        </div>
      </div>
    </section>

    <section class="builders-capability" aria-labelledby="builders-capability-title">
      <div class="builders-rail internal-rail-safe">
        <header class="builders-section-heading builders-section-heading--split">
          <span class="builders-pill"><i aria-hidden="true" />Built For Projects</span>
          <div>
            <h2 id="builders-capability-title">Have A Project In <span>Mind? Let’s</span><br />Make It Happen</h2>
            <p>櫻花與建商攜手打造高品質住宅，從設計模組、工廠供貨到案件管理，讓每個廚房交付節點更清楚。</p>
          </div>
        </header>

        <div class="builders-strengths">
          <article v-for="(item, index) in strengths" :key="item.title" v-reveal="{ anim: 'opalScaleUp', delay: index * 100 }" data-ev="opalScaleUp" class="builders-strength ev">
            <component :is="item.icon" aria-hidden="true" />
            <span>{{ item.value }}</span>
            <h3>{{ item.title }}</h3>
            <p>{{ item.copy }}</p>
          </article>
        </div>

        <div class="builders-one">
          <p>美好居家生活的創造者</p>
          <strong>HOME in O.N.E.</strong>
        </div>

        <div class="builders-services">
          <article v-for="(service, index) in services" :key="service.title" v-reveal="{ anim: 'opalMoveUp', delay: index * 100 }" data-ev="opalMoveUp" class="builders-service ev">
            <component :is="service.icon" aria-hidden="true" />
            <span>{{ service.eyebrow }}</span>
            <h3>{{ service.title }}</h3>
            <p>{{ service.copy }}</p>
          </article>
        </div>
      </div>
    </section>

    <section class="builders-lifetime" aria-labelledby="builders-lifetime-title">
      <div class="builders-rail internal-rail-safe builders-lifetime__grid">
        <div v-reveal="{ anim: 'opalMoveRight' }" data-ev="opalMoveRight" class="builders-lifetime__visual ev">
          <InternalBuilderImage src="/section-6/builders/sakura-kitchen-white.png" alt="SAKURA KITCHEN 品牌標誌" fit="contain" />
          <div class="builders-lifetime__icons" aria-label="數位服務三項流程">
            <span><QrCode aria-hidden="true" />掃碼登錄</span>
            <span><Smartphone aria-hidden="true" />手機查詢</span>
            <span><ShieldCheck aria-hidden="true" />服務銜接</span>
          </div>
        </div>
        <div v-reveal="{ anim: 'opalMoveLeft', delay: 120 }" data-ev="opalMoveLeft" class="builders-lifetime__content ev">
          <span class="builders-pill"><i aria-hidden="true" />Lifetime Service</span>
          <h2 id="builders-lifetime-title">一鍵登錄<br /><span>終身服務</span></h2>
          <p>建案交屋後，可透過櫻花既有產品服務機制銜接使用者需求，讓廚房不只完成安裝，也具備後續服務的可追蹤性。</p>
          <ul>
            <li><CircleCheckBig aria-hidden="true" />批次登錄與資料彙整</li>
            <li><CircleCheckBig aria-hidden="true" />售後需求快速銜接</li>
            <li><CircleCheckBig aria-hidden="true" />建案服務流程更完整</li>
          </ul>
        </div>
      </div>
    </section>

    <section class="builders-partners" aria-labelledby="builders-partners-title">
      <div class="builders-rail internal-rail-safe">
        <header class="builders-partners__heading">
          <span>Our Website 75000+ VIP Customer</span>
          <h2 id="builders-partners-title">合作建設</h2>
        </header>
        <div class="builders-partners__grid">
          <div v-for="partner in builderPartners" :key="partner.name" class="builders-partner">
            <InternalBuilderImage :src="partner.logo" :alt="partner.name" fit="contain" />
          </div>
        </div>
      </div>
    </section>

    <section id="appointment" class="builders-contact" aria-labelledby="builders-contact-title">
      <div class="builders-rail internal-rail-safe">
        <header class="builders-section-heading builders-section-heading--split builders-contact__heading">
          <span class="builders-pill"><i aria-hidden="true" />Get In Touch</span>
          <div>
            <h2 id="builders-contact-title">Have A Project In <span>Mind? Let’s</span><br />Make It Happen</h2>
          </div>
        </header>

        <div class="builders-contact__grid">
          <aside v-reveal="{ anim: 'opalMoveRight' }" data-ev="opalMoveRight" class="builders-contact__aside ev">
            <div class="builders-contact__copy">
              <h3>櫻花集團 品牌館<br /><span>全預約制</span></h3>
              <p>留下您的資訊，將由專人與您聯繫，提供最適合您建案的整體廚房規劃建議。</p>
              <dl>
                <div><dt><MapPin aria-hidden="true" />地址</dt><dd>114 台北市內湖區新湖一路 303 號</dd></div>
                <div><dt><Clock3 aria-hidden="true" />服務時間</dt><dd>週一至週五 8:30 - 17:30</dd></div>
              </dl>
              <strong>台北市・台中市・高雄市</strong>
            </div>
            <InternalBuilderImage src="/section-6/builders/contact-kitchen.jpg" alt="建案整體廚房空間示意" />
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
.builders-pill { display: inline-flex; width: max-content; align-items: center; gap: 7px; padding: 8px 14px; border: 1px solid rgb(159 159 164 / 28%); border-radius: 26px; color: #1c1c1d; font-family: "Cal Sans", sans-serif; font-size: 12px; line-height: 14px; letter-spacing: 1px; text-transform: uppercase; }
.builders-pill i { width: 5px; height: 5px; flex: none; border-radius: 50%; background: #caa05c; }
.builders-pill--dark { border-color: rgb(255 255 255 / 24%); color: #fff; }
.builders-round-link { display: inline-flex; min-height: 52px; width: max-content; align-items: center; justify-content: center; gap: 11px; padding: 13px 21px; border: 1px solid rgb(255 255 255 / 24%); border-radius: 999px; color: #fff; font-family: "Cal Sans", sans-serif; font-size: 14px; line-height: 20px; transition: color .3s ease, border-color .3s ease, background-color .3s ease, transform .3s ease; }
.builders-round-link svg { width: 18px; height: 18px; }
.builders-round-link:hover,
.builders-round-link:focus-visible { color: #1c1c1d; border-color: #caa05c; background: #caa05c; transform: translateY(-2px); }
.builders-hero { position: relative; z-index: 0; min-height: 820px; overflow: hidden; color: #fff; background: #1c1c1d; }
.builders-hero__deco { position: absolute; z-index: -1; inset: 0; opacity: .08; background: url('/section-6/franchise/antra-original/h5-bg1.png') center / cover no-repeat; filter: invert(1); }
.builders-hero__inner { display: grid; grid-template-columns: 64% 36%; padding: 142px 30px 0; }
.builders-hero h1 { max-width: 960px; margin: 22px 0 0; font-family: "Cal Sans", sans-serif; font-size: clamp(72px, 7.28vw, 110px); font-weight: 400; line-height: 1; letter-spacing: -1px; }
.builders-hero h1 span { color: #caa05c; }
.builders-hero__aside { width: min(430px, 100%); margin: 102px 0 0 6px; }
.builders-hero__aside p { margin: 0; color: rgb(255 255 255 / 82%); font-size: 20px; line-height: 31px; }
.builders-hero__aside .builders-round-link { margin-top: 42px; }
.builders-hero-media { position: relative; z-index: 9; height: clamp(520px, 42.5vw, 760px); margin-top: -360px; overflow: hidden; border-radius: 24px; }
.builders-hero-media :deep(img) { object-position: center 58%; }
.builders-section-heading h2,
.builders-lifetime h2,
.builders-partners h2 { margin: 0; font-family: "Cal Sans", sans-serif; font-size: 60px; font-weight: 400; line-height: 64px; letter-spacing: -.02em; }
.builders-section-heading h2 span,
.builders-lifetime h2 span { color: #caa05c; }
.builders-section-heading > p { color: #59585d; font-size: 16px; line-height: 25px; }
.builders-team { padding: 125px 30px 130px; background: #fff url('/section-6/franchise/antra-original/h5-bg02.png') top right / auto no-repeat; }
.builders-section-heading--team { display: grid; grid-template-columns: 25% 48% 27%; align-items: end; margin-bottom: 60px; }
.builders-section-heading--team > p { margin: 0 0 4px; }
.builders-team__grid { display: grid; grid-template-columns: repeat(4, minmax(0, 1fr)); gap: 30px; }
.builders-team-card { position: relative; min-width: 0; overflow: hidden; border-radius: 24px; background: #f6f6f6; }
.builders-team-card > :deep(.builder-image) { aspect-ratio: 4 / 5; }
.builders-team-card:hover :deep(img) { transform: scale(1.035); }
.builders-team-card__status { position: absolute; inset: auto 14px 14px; display: flex; min-height: 54px; align-items: center; justify-content: space-between; padding: 10px 12px 10px 18px; border-radius: 999px; color: #fff; background: rgb(28 28 29 / 84%); backdrop-filter: blur(14px); }
.builders-team-card__status span { font-family: "Cal Sans", sans-serif; font-size: 17px; }
.builders-team-card__status strong { display: flex; width: 34px; height: 34px; align-items: center; justify-content: center; border-radius: 50%; color: #1c1c1d; background: #caa05c; font-size: 12px; }
.builders-capability { padding: 130px 30px 140px; background: #f6f6f6 url('/section-6/franchise/antra-original/h1-bg01-1.png') bottom center / 100% auto no-repeat; }
.builders-section-heading--split { display: grid; grid-template-columns: 30% 70%; align-items: start; }
.builders-section-heading--split > div > p { max-width: 760px; margin: 25px 0 0; color: #59585d; font-size: 17px; line-height: 27px; }
.builders-strengths { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 40px; margin-top: 90px; }
.builders-strength { display: flex; aspect-ratio: 1; flex-direction: column; align-items: center; justify-content: center; padding: 48px; border: 1px solid #caa05c; border-radius: 50%; text-align: center; background: rgb(255 255 255 / 86%); }
.builders-strength > svg { width: 42px; height: 42px; color: #caa05c; stroke-width: 1.3; }
.builders-strength > span { margin-top: 20px; color: #caa05c; font-family: "Cal Sans", sans-serif; font-size: 44px; line-height: 48px; }
.builders-strength h3 { margin: 5px 0 0; font-family: "Cal Sans", sans-serif; font-size: 25px; font-weight: 400; }
.builders-strength p { max-width: 280px; margin: 15px 0 0; color: #59585d; font-size: 15px; line-height: 24px; }
.builders-one { display: flex; flex-direction: column; align-items: center; margin-top: 72px; }
.builders-one p { margin: 0 0 10px; color: #9f9fa4; font-size: 14px; letter-spacing: .08em; }
.builders-one strong { display: inline-flex; min-height: 44px; align-items: center; padding: 9px 34px; border-radius: 999px; color: #fff; background: #caa05c; font-family: "Cal Sans", sans-serif; font-size: 18px; font-weight: 400; letter-spacing: .16em; }
.builders-services { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 30px; margin-top: 44px; }
.builders-service { padding: 40px; border-top: 1px solid #caa05c; background: #fff; }
.builders-service > svg { width: 34px; height: 34px; color: #caa05c; stroke-width: 1.4; }
.builders-service > span { display: block; margin-top: 30px; color: #9f9fa4; font-size: 11px; letter-spacing: .14em; }
.builders-service h3 { margin: 8px 0 0; font-family: "Cal Sans", sans-serif; font-size: 28px; font-weight: 400; }
.builders-service p { margin: 13px 0 0; color: #59585d; font-size: 15px; line-height: 24px; }
.builders-lifetime { padding: 135px 30px; color: #fff; background: #1c1c1d; }
.builders-lifetime__grid { display: grid; grid-template-columns: 54% 46%; align-items: center; }
.builders-lifetime__visual { min-height: 520px; padding: 64px; border-radius: 24px; background: #caa05c url('/section-6/franchise/antra-original/h5-bg1.png') bottom left / 90% auto no-repeat; }
.builders-lifetime__visual > :deep(.builder-image) { width: 170px; height: 170px; margin-inline: auto; background: transparent; }
.builders-lifetime__icons { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 16px; margin-top: 72px; }
.builders-lifetime__icons span { display: flex; min-height: 120px; flex-direction: column; align-items: center; justify-content: center; gap: 12px; border: 1px solid rgb(255 255 255 / 55%); border-radius: 18px; font-size: 14px; }
.builders-lifetime__icons svg { width: 30px; height: 30px; }
.builders-lifetime__content { padding-left: 85px; }
.builders-lifetime__content .builders-pill { border-color: rgb(255 255 255 / 20%); color: #fff; }
.builders-lifetime__content h2 { margin-top: 28px; font-size: 72px; line-height: 76px; }
.builders-lifetime__content > p { max-width: 500px; margin: 30px 0 0; color: rgb(255 255 255 / 72%); font-size: 16px; line-height: 27px; }
.builders-lifetime__content ul { display: grid; gap: 14px; margin: 32px 0 0; padding: 0; list-style: none; }
.builders-lifetime__content li { display: flex; align-items: center; gap: 11px; color: rgb(255 255 255 / 88%); }
.builders-lifetime__content li svg { width: 18px; height: 18px; color: #caa05c; }
.builders-partners { padding: 105px 30px 112px; background: #fff; }
.builders-partners__heading { display: flex; align-items: end; justify-content: space-between; margin-bottom: 54px; }
.builders-partners__heading > span { color: #9f9fa4; font-size: 12px; letter-spacing: .04em; }
.builders-partners__grid { display: grid; grid-template-columns: repeat(5, minmax(0, 1fr)); border-top: 1px solid #e3e3e8; border-left: 1px solid #e3e3e8; }
.builders-partner { height: 150px; padding: 30px; border-right: 1px solid #e3e3e8; border-bottom: 1px solid #e3e3e8; background: #fff; }
.builders-partner > :deep(.builder-image) { background: transparent; }
.builders-partner :deep(img) { max-width: 100%; max-height: 100%; }
.builders-contact { scroll-margin-top: 60px; padding: 120px 30px 130px; background: #f6f6f6 url('/section-6/franchise/antra-original/h1-bg02.png') top right / auto no-repeat; }
.builders-contact__heading { margin-bottom: 58px; }
.builders-contact__grid { display: grid; grid-template-columns: 42% 58%; align-items: start; }
.builders-contact__aside { padding-right: 55px; }
.builders-contact__copy { padding: 10px 0 42px; }
.builders-contact__copy h3 { margin: 0; font-family: "Cal Sans", sans-serif; font-size: 34px; font-weight: 400; line-height: 42px; }
.builders-contact__copy h3 span { color: #caa05c; }
.builders-contact__copy > p { max-width: 480px; margin: 18px 0 0; color: #59585d; font-size: 15px; line-height: 25px; }
.builders-contact__copy dl { display: grid; gap: 18px; margin: 28px 0 0; }
.builders-contact__copy dl div { display: grid; grid-template-columns: 110px minmax(0, 1fr); gap: 12px; }
.builders-contact__copy dt { display: flex; align-items: center; gap: 8px; color: #1c1c1d; font-size: 13px; }
.builders-contact__copy dt svg { width: 17px; height: 17px; color: #caa05c; }
.builders-contact__copy dd { margin: 0; color: #59585d; font-size: 14px; }
.builders-contact__copy > strong { display: block; margin-top: 28px; color: #caa05c; font-family: "Cal Sans", sans-serif; font-size: 18px; font-weight: 400; letter-spacing: .08em; }
.builders-contact__aside > :deep(.builder-image) { aspect-ratio: 1.18 / 1; border-radius: 24px; }
.builders-contact__form { min-width: 0; }

@media (max-width: 1199px) {
  .builders-hero__inner { grid-template-columns: 61% 39%; }
  .builders-hero h1 { font-size: clamp(64px, 7.4vw, 88px); }
  .builders-section-heading--team { grid-template-columns: 23% 52% 25%; }
  .builders-section-heading h2,
  .builders-lifetime h2 { font-size: 52px; line-height: 57px; }
  .builders-strength { padding: 34px; }
  .builders-lifetime__content { padding-left: 55px; }
  .builders-contact__aside { padding-right: 35px; }
}

@media (max-width: 1023px) {
  .builders-rail-wide,
  .builders-rail { width: calc(100% - 60px); }
  .builders-hero { min-height: 730px; }
  .builders-hero__inner { grid-template-columns: 1fr; padding-top: 115px; }
  .builders-hero__aside { margin-top: 42px; }
  .builders-hero-media { height: 520px; margin-top: -240px; }
  .builders-team,
  .builders-capability,
  .builders-lifetime,
  .builders-partners,
  .builders-contact { padding-block: 96px; }
  .builders-section-heading--team,
  .builders-section-heading--split { grid-template-columns: 1fr; gap: 25px; }
  .builders-section-heading--team > p { max-width: 680px; }
  .builders-team__grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
  .builders-strengths { gap: 22px; }
  .builders-strength { padding: 25px; }
  .builders-strength > span { font-size: 36px; line-height: 40px; }
  .builders-services { gap: 20px; }
  .builders-service { padding: 30px 25px; }
  .builders-lifetime__grid,
  .builders-contact__grid { grid-template-columns: 1fr; }
  .builders-lifetime__content { padding: 64px 0 0; }
  .builders-partners__grid { grid-template-columns: repeat(3, minmax(0, 1fr)); }
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
  .builders-section-heading h2,
  .builders-lifetime h2,
  .builders-partners h2 { font-size: 41px; line-height: 46px; }
  .builders-team__grid { grid-template-columns: 1fr; gap: 20px; }
  .builders-team-card > :deep(.builder-image) { aspect-ratio: 1 / 1.12; }
  .builders-strengths { grid-template-columns: 1fr; margin-top: 56px; }
  .builders-strength { width: min(100%, 345px); margin-inline: auto; padding: 50px; }
  .builders-services { grid-template-columns: 1fr; }
  .builders-lifetime__visual { min-height: 430px; padding: 44px 22px; }
  .builders-lifetime__visual > :deep(.builder-image) { width: 140px; height: 140px; }
  .builders-lifetime__icons { gap: 9px; margin-top: 60px; }
  .builders-lifetime__icons span { min-height: 102px; gap: 9px; font-size: 12px; }
  .builders-lifetime__icons svg { width: 24px; height: 24px; }
  .builders-lifetime__content { padding-top: 48px; }
  .builders-lifetime__content h2 { font-size: 52px; line-height: 57px; }
  .builders-partners__heading { display: block; }
  .builders-partners__heading > span { display: block; margin-bottom: 10px; }
  .builders-partners__grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
  .builders-partner { height: 122px; padding: 24px; }
  .builders-contact__aside { display: block; }
  .builders-contact__aside > :deep(.builder-image) { margin-top: 36px; }
  .builders-contact__copy dl div { grid-template-columns: 1fr; gap: 6px; }
}

@media (prefers-reduced-motion: reduce) {
  .builders-round-link { transition: none; }
  .builders-round-link:hover,
  .builders-round-link:focus-visible { transform: none; }
  .builders-team-card:hover :deep(img) { transform: none; }
}
</style>
