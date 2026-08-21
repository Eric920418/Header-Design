<script setup lang="ts">
import { ArrowLeft, Download, ExternalLink, FileText } from 'lucide-vue-next'
import { FRANCHISE_BROCHURE_URL } from '~/data/franchise'

useSeoMeta({
  title: '加盟資料下載｜SAKURA 整體廚房',
  description: '預覽並下載 SAKURA KITCHEN 櫻花整體廚房官方加盟簡介，了解品牌優勢、加盟辦法與申請流程。',
  ogTitle: '加盟資料下載｜SAKURA 整體廚房',
  ogDescription: 'SAKURA KITCHEN 官方加盟簡介 PDF，完整收錄品牌優勢、加盟條件與申請流程。',
  ogImage: '/section-6/franchise/franchising-info-outside.webp',
})

const brochureStatus = ref<'checking' | 'ready' | 'error'>('checking')
const brochureError = ref('')

const brochurePages = [
  {
    number: '01',
    label: '封面與外頁',
    image: '/section-6/franchise/franchising-info-outside.webp',
    alt: '櫻花整體廚房加盟簡介封面、封底與外頁',
  },
  {
    number: '02',
    label: '品牌優勢與加盟辦法',
    image: '/section-6/franchise/franchising-info-inside.webp',
    alt: '櫻花整體廚房加盟簡介內頁，包含總部優勢、加盟辦法與流程',
  },
]

const verifyBrochure = async () => {
  brochureStatus.value = 'checking'
  brochureError.value = ''

  try {
    const response = await fetch(FRANCHISE_BROCHURE_URL, { method: 'HEAD', cache: 'no-store' })
    if (!response.ok) throw new Error(`HTTP ${response.status} ${response.statusText}`)
    brochureStatus.value = 'ready'
  }
  catch (error) {
    brochureStatus.value = 'error'
    brochureError.value = error instanceof Error ? error.message : String(error)
  }
}

const guardBrochureLink = (event: MouseEvent) => {
  if (brochureStatus.value === 'ready') return
  event.preventDefault()
  if (brochureStatus.value === 'checking') brochureError.value = 'PDF 檔案仍在檢查中，請稍候再試。'
}

onMounted(verifyBrochure)
</script>

<template>
  <main class="franchise-download-page">
    <section class="download-hero hero-includes-header" aria-labelledby="franchise-download-title">
      <InternalFranchiseImage
        src="/section-6/franchise/hero-store.jpg"
        alt="SAKURA KITCHEN 櫻花整體廚房加盟門市"
        eager
        class="download-hero__image"
      />
      <span class="download-hero__overlay" aria-hidden="true" />
      <div v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="download-hero__inner ev">
        <span class="download-pill"><i aria-hidden="true" />Franchise Information</span>
        <h1 id="franchise-download-title">加盟資料下載</h1>
        <nav aria-label="麵包屑" class="download-hero__trail">
          <NuxtLink to="/">首頁</NuxtLink>
          <span aria-hidden="true">/</span>
          <NuxtLink to="/franchising/intro">我要加盟</NuxtLink>
          <span aria-hidden="true">/</span>
          <span aria-current="page">加盟資料下載</span>
        </nav>
      </div>
    </section>

    <section class="download-document" aria-labelledby="franchise-document-title">
      <div class="download-rail">
        <header class="download-document__header">
          <div v-reveal="{ anim: 'opalMoveRight' }" data-ev="opalMoveRight" class="download-document__heading ev">
            <span class="download-pill download-pill--dark"><i aria-hidden="true" />Official Brochure</span>
            <h2 id="franchise-document-title">櫻花整體廚房<br /><span>加盟簡介</span></h2>
          </div>

          <div v-reveal="{ anim: 'opalMoveLeft', delay: 100 }" data-ev="opalMoveLeft" class="download-document__summary ev">
            <p>兩頁雙面六折頁，完整收錄櫻花品牌實力、總部支援、加盟準備金、資格條件與七階段加盟流程。</p>
            <dl class="download-document__meta">
              <div><dt>格式</dt><dd>PDF</dd></div>
              <div><dt>頁數</dt><dd>2 頁</dd></div>
              <div><dt>檔案大小</dt><dd>8.0 MB</dd></div>
            </dl>

            <div class="download-document__actions">
              <a
                :href="FRANCHISE_BROCHURE_URL"
                target="_blank"
                rel="noopener noreferrer"
                class="download-action download-action--primary"
                :class="{ 'is-disabled': brochureStatus !== 'ready' }"
                :aria-disabled="brochureStatus !== 'ready'"
                @click="guardBrochureLink"
              >
                <FileText aria-hidden="true" />線上預覽<ExternalLink aria-hidden="true" />
              </a>
              <a
                :href="FRANCHISE_BROCHURE_URL"
                download="SAKURA-KITCHEN-加盟簡介.pdf"
                class="download-action download-action--outline"
                :class="{ 'is-disabled': brochureStatus !== 'ready' }"
                :aria-disabled="brochureStatus !== 'ready'"
                @click="guardBrochureLink"
              >
                <Download aria-hidden="true" />下載 PDF
              </a>
            </div>

            <p v-if="brochureStatus === 'checking'" class="download-document__status" role="status">正在確認 PDF 檔案…</p>
            <div v-else-if="brochureStatus === 'error'" class="download-document__error" role="alert">
              <strong>加盟資料 PDF 載入失敗</strong>
              <span>{{ brochureError }}</span>
              <code>{{ FRANCHISE_BROCHURE_URL }}</code>
              <button type="button" @click="verifyBrochure">重新檢查檔案</button>
            </div>
          </div>
        </header>

        <div class="download-preview" aria-label="加盟簡介雙面預覽">
          <article
            v-for="(page, index) in brochurePages"
            :key="page.number"
            v-reveal="{ anim: 'opalMoveUp', delay: index * 100 }"
            data-ev="opalMoveUp"
            class="download-preview__page ev"
          >
            <div class="download-preview__sheet">
              <InternalFranchiseImage :src="page.image" :alt="page.alt" fit="contain" />
            </div>
            <div class="download-preview__caption"><span>PAGE {{ page.number }}</span><strong>{{ page.label }}</strong></div>
          </article>
        </div>

        <div class="download-document__back">
          <NuxtLink to="/franchising/intro"><ArrowLeft aria-hidden="true" />返回我要加盟</NuxtLink>
        </div>
      </div>
    </section>
  </main>
</template>

<style scoped>
.franchise-download-page { overflow: clip; color: #1c1c1d; background: #f6f6f6; }

.download-hero {
  position: relative;
  isolation: isolate;
  min-height: 360px;
  overflow: hidden;
  color: #fff;
  background: #1c1c1d;
}

.download-hero__image,
.download-hero__overlay { position: absolute; inset: 0; }
.download-hero__image { z-index: -2; }
.download-hero__image :deep(img) { object-position: center 58%; }
.download-hero__overlay { z-index: -1; background: linear-gradient(90deg, rgb(20 15 11 / 82%), rgb(20 15 11 / 52%) 55%, rgb(20 15 11 / 35%)); }

.download-hero__inner {
  width: min(1410px, calc(100% - 60px));
  margin-inline: auto;
  padding: 86px 86px 76px 0;
}

.download-pill {
  display: inline-flex;
  align-items: center;
  gap: 10px;
  min-height: 36px;
  padding: 8px 16px;
  border: 1px solid rgb(255 255 255 / 28%);
  border-radius: 100px;
  font-family: var(--font-ui);
  font-size: 12px;
  letter-spacing: .14em;
  text-transform: uppercase;
}

.download-pill i { width: 7px; height: 7px; border-radius: 50%; background: #caa05c; }
.download-pill--dark { border-color: #d0d0d5; color: #59585d; }

.download-hero h1 {
  margin: 28px 0 30px;
  color: #fff;
  font-family: var(--font-display);
  font-size: clamp(58px, 7vw, 96px);
  font-weight: 400;
  line-height: .98;
  letter-spacing: -.035em;
}

.download-hero__trail { display: flex; flex-wrap: wrap; align-items: center; gap: 10px; font-size: 14px; color: rgb(255 255 255 / 72%); }
.download-hero__trail a { color: inherit; transition: color .25s ease; }
.download-hero__trail a:hover,
.download-hero__trail a:focus-visible { color: #caa05c; }
.download-hero__trail span[aria-current="page"] { color: #fff; }

.download-document {
  padding: 110px 30px 126px;
  background: #f6f6f6 url('/section-6/franchise/antra-original/h1-bg05.png') top right / auto no-repeat;
}

.download-rail { width: min(1410px, 100%); margin-inline: auto; padding-right: 86px; }

.download-document__header {
  display: grid;
  grid-template-columns: minmax(300px, 38%) minmax(0, 1fr);
  gap: 72px;
  align-items: start;
  padding-bottom: 72px;
  border-bottom: 1px solid #d0d0d5;
}

.download-document__heading h2 {
  margin: 28px 0 0;
  font-family: var(--font-display);
  font-size: clamp(52px, 5.4vw, 78px);
  font-weight: 400;
  line-height: 1.02;
  letter-spacing: -.035em;
}

.download-document__heading h2 span { color: #caa05c; }
.download-document__summary > p { max-width: 700px; margin: 4px 0 0; color: #59585d; font-size: 18px; line-height: 31px; }

.download-document__meta {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 20px;
  margin: 38px 0 0;
}

.download-document__meta div { padding-top: 16px; border-top: 1px solid #d0d0d5; }
.download-document__meta dt { margin-bottom: 7px; color: #9f9fa4; font-size: 12px; letter-spacing: .12em; }
.download-document__meta dd { margin: 0; font-family: var(--font-ui); font-size: 22px; }

.download-document__actions { display: flex; flex-wrap: wrap; gap: 14px; margin-top: 40px; }
.download-action {
  display: inline-flex;
  min-height: 58px;
  align-items: center;
  justify-content: center;
  gap: 10px;
  padding: 12px 24px;
  border: 1px solid #1c1c1d;
  border-radius: 100px;
  font-size: 15px;
  font-weight: 600;
  transition: color .25s ease, background-color .25s ease, border-color .25s ease, opacity .25s ease;
}

.download-action svg { width: 18px; height: 18px; }
.download-action--primary { color: #fff; border-color: #1c1c1d; background: #1c1c1d; }
.download-action--primary svg:last-child { width: 15px; height: 15px; margin-left: 4px; opacity: .65; }
.download-action--outline { color: #1c1c1d; background: transparent; }
.download-action:hover,
.download-action:focus-visible { color: #fff; border-color: #caa05c; background: #caa05c; }
.download-action.is-disabled { cursor: wait; opacity: .52; }

.download-document__status { margin-top: 18px !important; color: #9f9fa4 !important; font-size: 13px !important; line-height: 20px !important; }
.download-document__error { display: flex; flex-direction: column; gap: 7px; margin-top: 20px; padding: 18px 20px; border: 1px solid #efb8ad; border-radius: 16px; color: #59585d; background: #fff4f1; }
.download-document__error strong { color: #9f2f1f; }
.download-document__error span,
.download-document__error code { overflow-wrap: anywhere; font-size: 13px; }
.download-document__error code { color: #9f2f1f; }
.download-document__error button { align-self: flex-start; margin-top: 4px; color: #9f2f1f; text-decoration: underline; text-underline-offset: 3px; }

.download-preview { display: grid; gap: 52px; padding-top: 72px; }
.download-preview__sheet { overflow: hidden; aspect-ratio: 2.1132867133; border: 1px solid #e3e3e8; border-radius: 24px; background: #fff; box-shadow: 0 24px 70px rgb(28 28 29 / 10%); }
.download-preview__caption { display: flex; align-items: baseline; justify-content: space-between; gap: 24px; padding: 22px 4px 0; }
.download-preview__caption span { color: #9f9fa4; font-family: var(--font-ui); font-size: 12px; letter-spacing: .13em; }
.download-preview__caption strong { font-family: var(--font-ui); font-size: 24px; font-weight: 400; }

.download-document__back { display: flex; justify-content: center; padding-top: 72px; }
.download-document__back a { display: inline-flex; align-items: center; gap: 10px; color: #59585d; font-size: 14px; transition: color .25s ease; }
.download-document__back a:hover,
.download-document__back a:focus-visible { color: #caa05c; }
.download-document__back svg { width: 17px; height: 17px; }

@media (max-width: 1023px) {
  .download-hero__inner,
  .download-rail { padding-right: 0; }
  .download-document { padding-block: 86px 100px; }
  .download-document__header { grid-template-columns: 1fr; gap: 42px; }
  .download-document__heading h2 { max-width: 680px; }
}

@media (max-width: 767px) {
  .download-hero { min-height: 288px; }
  .download-hero__inner { width: calc(100% - 30px); padding-block: 54px 48px; }
  .download-hero h1 { margin-block: 24px; font-size: 48px; line-height: 52px; }
  .download-pill { font-size: 10px; }
  .download-document { padding: 64px 15px 76px; background-size: 52%; }
  .download-document__header { gap: 34px; padding-bottom: 52px; }
  .download-document__heading h2 { margin-top: 22px; font-size: 43px; line-height: 47px; }
  .download-document__summary > p { font-size: 16px; line-height: 27px; }
  .download-document__meta { gap: 10px; margin-top: 30px; }
  .download-document__meta dd { font-size: 18px; }
  .download-document__actions { display: grid; grid-template-columns: 1fr; margin-top: 32px; }
  .download-action { width: 100%; }
  .download-preview { gap: 38px; padding-top: 52px; }
  .download-preview__sheet { border-radius: 14px; box-shadow: 0 14px 36px rgb(28 28 29 / 10%); }
  .download-preview__caption { align-items: flex-start; padding-top: 15px; }
  .download-preview__caption strong { font-size: 19px; text-align: right; }
  .download-document__back { padding-top: 54px; }
}

@media (prefers-reduced-motion: reduce) {
  .download-action,
  .download-document__back a { transition: none; }
}
</style>
