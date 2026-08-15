<script setup lang="ts">
import { Download, FilePenLine } from 'lucide-vue-next'
import { FRANCHISE_BROCHURE_URL } from '~/data/franchise'

useSeoMeta({
  title: '加盟申請表｜SAKURA 整體廚房',
  description: '填寫 SAKURA KITCHEN 櫻花整體廚房加盟申請資料，留下聯絡方式、預算、開店地區與創業規劃。',
  ogTitle: '加盟申請表｜SAKURA 整體廚房',
  ogDescription: '留下您的聯絡方式與加盟規劃，了解 SAKURA KITCHEN 加盟資訊。',
  ogImage: '/section-6/franchise/hero-store.jpg',
})
</script>

<template>
  <main class="franchise-application-page">
    <div class="franchise-context-nav">
      <nav aria-label="我要加盟頁面導覽" class="franchise-context-nav__inner">
        <div class="franchise-context-nav__sections">
          <NuxtLink to="/franchising/intro#introduction">加盟介紹</NuxtLink>
          <NuxtLink to="/franchising/intro#advantages">加盟優勢</NuxtLink>
          <NuxtLink to="/franchising/intro#franchise-process">加盟金與流程</NuxtLink>
          <NuxtLink to="/franchising/intro#franchise-faq">加盟 Q&amp;A</NuxtLink>
        </div>
        <div class="franchise-context-nav__actions">
          <NuxtLink to="/franchising/download">加盟資料下載</NuxtLink>
          <span aria-current="page">立即申請加盟</span>
        </div>
      </nav>
    </div>

    <section class="franchise-application" aria-labelledby="franchise-application-title">
      <div class="franchise-application__rail">
        <header v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="franchise-application__header ev">
          <span class="franchise-application__pill"><i aria-hidden="true" /><FilePenLine aria-hidden="true" />Franchise Application</span>
          <h1 id="franchise-application-title">申請加盟</h1>
          <p>請留下您的聯絡方式，我們會立即提供您完整的加盟資訊。</p>
          <NuxtLink to="/franchising/download" class="franchise-application__download">
            加盟資料下載 <Download aria-hidden="true" />
          </NuxtLink>
        </header>

        <div v-reveal="{ anim: 'opalMoveUp', delay: 120 }" data-ev="opalMoveUp" class="franchise-application__form ev">
          <InternalFranchiseApplicationForm />
        </div>
      </div>
    </section>
  </main>
</template>

<style scoped>
.franchise-application-page { overflow: clip; color: #1c1c1d; background: #f6f6f6; }

.franchise-context-nav {
  position: sticky;
  top: 60px;
  z-index: 45;
  overflow-x: auto;
  color: #fff;
  background: #1c1c1d;
  scrollbar-width: thin;
}

.franchise-context-nav__inner { display: flex; width: min(1410px, calc(100% - 60px)); min-width: max-content; min-height: 62px; align-items: center; justify-content: space-between; gap: 52px; margin-inline: auto; padding-right: 86px; }
.franchise-context-nav__sections,
.franchise-context-nav__actions { display: flex; align-items: center; }
.franchise-context-nav__sections { gap: 38px; }
.franchise-context-nav__sections a { color: rgb(255 255 255 / 75%); font-size: 14px; white-space: nowrap; transition: color .25s ease; }
.franchise-context-nav__sections a:hover,
.franchise-context-nav__sections a:focus-visible { color: #caa05c; }
.franchise-context-nav__actions { gap: 14px; }
.franchise-context-nav__actions a,
.franchise-context-nav__actions span { display: flex; min-height: 38px; align-items: center; justify-content: center; padding: 8px 20px; border: 1px solid rgb(255 255 255 / 55%); font-size: 14px; white-space: nowrap; }
.franchise-context-nav__actions a { color: #fff; transition: color .25s ease, border-color .25s ease, background-color .25s ease; }
.franchise-context-nav__actions a:hover,
.franchise-context-nav__actions a:focus-visible { color: #1c1c1d; border-color: #fff; background: #fff; }
.franchise-context-nav__actions span { color: #fff; border-color: #caa05c; background: #caa05c; }

.franchise-application {
  min-height: 1150px;
  padding: 96px 30px 130px;
  background: #f6f6f6 url('/section-6/franchise/antra-original/h1-bg05.png') top right / auto no-repeat;
}

.franchise-application__rail { width: min(930px, 100%); margin-inline: auto; }
.franchise-application__header { display: flex; flex-direction: column; align-items: center; text-align: center; }
.franchise-application__pill { display: inline-flex; align-items: center; gap: 7px; padding: 8px 14px; border: 1px solid rgb(159 159 164 / 28%); border-radius: 26px; color: #59585d; font-family: "Cal Sans", sans-serif; font-size: 11px; line-height: 14px; letter-spacing: 1px; text-transform: uppercase; }
.franchise-application__pill i { width: 7px; height: 7px; border-radius: 50%; background: #caa05c; }
.franchise-application__pill svg { width: 14px; height: 14px; }

.franchise-application__header h1 { margin: 28px 0 0; font-family: "Cal Sans", sans-serif; font-size: 64px; font-weight: 400; line-height: 68px; letter-spacing: -.025em; }
.franchise-application__header p { max-width: 620px; margin: 18px 0 0; color: #59585d; font-size: 16px; line-height: 26px; }
.franchise-application__download { display: inline-flex; min-height: 52px; align-items: center; justify-content: center; gap: 11px; margin-top: 30px; padding: 13px 23px; border: 1px solid #caa05c; border-radius: 999px; color: #fff; background: #caa05c; font-size: 14px; transition: color .3s ease, background-color .3s ease, transform .3s ease; }
.franchise-application__download:hover,
.franchise-application__download:focus-visible { color: #caa05c; background: transparent; transform: translateY(-2px); }
.franchise-application__download svg { width: 18px; height: 18px; }
.franchise-application__form { margin-top: 60px; }

@media (max-width: 1023px) {
  .franchise-context-nav__inner { width: max-content; margin: 0; padding: 0 30px; }
  .franchise-application { padding-block: 80px 105px; }
}

@media (max-width: 767px) {
  .franchise-context-nav__inner { min-height: 56px; gap: 28px; padding-inline: 15px; }
  .franchise-context-nav__sections { gap: 24px; }
  .franchise-context-nav__sections a,
  .franchise-context-nav__actions a,
  .franchise-context-nav__actions span { font-size: 13px; }
  .franchise-context-nav__actions a,
  .franchise-context-nav__actions span { min-height: 34px; padding: 7px 14px; }
  .franchise-application { min-height: 0; padding: 66px 15px 78px; background-size: 50%; }
  .franchise-application__header h1 { margin-top: 23px; font-size: 48px; line-height: 52px; }
  .franchise-application__header p { margin-top: 15px; font-size: 15px; line-height: 24px; }
  .franchise-application__download { margin-top: 25px; }
  .franchise-application__form { margin-top: 42px; }
}

@media (prefers-reduced-motion: reduce) {
  .franchise-context-nav__sections a,
  .franchise-context-nav__actions a,
  .franchise-application__download { transition: none; }
  .franchise-application__download:hover,
  .franchise-application__download:focus-visible { transform: none; }
}
</style>
