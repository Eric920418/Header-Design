<script setup lang="ts">
import { ArrowUpRight, ChevronDown, ChevronRight, Minus, Plus } from 'lucide-vue-next'
import { PRODUCT_CARE_CATEGORIES, PRODUCT_CATALOGUES } from '~/data/productCatalogues'

const activeCategoryIndex = ref(1)
const activeQuestionIndex = ref(0)

const activeCategory = computed(() => PRODUCT_CARE_CATEGORIES[activeCategoryIndex.value] ?? PRODUCT_CARE_CATEGORIES[0]!)
const activeQuestion = computed(() => activeCategory.value.questions[activeQuestionIndex.value] ?? activeCategory.value.questions[0]!)
const activeFeatureImage = computed(() => activeQuestion.value.image || activeCategory.value.questions.find(question => question.image)?.image || '')
const activeFeatureImageAlt = computed(() => activeQuestion.value.imageAlt || `${activeCategory.value.label}產品保養圖解`)
const activeFeatureDescription = computed(() => (
  activeQuestion.value.intro
  || activeQuestion.value.details?.[0]?.body
  || activeQuestion.value.steps?.[0]
  || activeQuestion.value.tip
  || '查看本題的產品保養重點與使用注意事項。'
))

function selectCategory(index: number) {
  activeCategoryIndex.value = index
  activeQuestionIndex.value = 0
}

function selectQuestion(index: number) {
  activeQuestionIndex.value = index
}

function selectQuestionFromCategory(categoryIndex: number, event: Event) {
  const select = event.target as HTMLSelectElement
  const questionIndex = Number(select.value)
  if (!Number.isInteger(questionIndex)) return

  activeCategoryIndex.value = categoryIndex
  activeQuestionIndex.value = questionIndex
  select.value = ''
}

useSeoMeta({
  title: '廚房商品型錄｜SAKURA 整體廚房',
  description: '下載櫻花整體廚房、五金收納、櫻花石英石、SAKURA 廚電與進口廚電型錄，並查看廚房產品保養重點。',
  ogTitle: '廚房商品型錄｜SAKURA 整體廚房',
  ogDescription: '五大廚房商品型錄與瓦斯爐、除油煙機、烘碗機及洗碗機保養指南。',
  ogImage: PRODUCT_CATALOGUES[0]?.cover,
})
</script>

<template>
  <main class="product-catalogue-page">
    <section class="product-catalogue-hero" aria-labelledby="product-catalogue-title">
      <span class="product-catalogue-hero__overlay" aria-hidden="true" />
      <div v-reveal="{ anim: 'opalMoveUp' }" class="product-catalogue-hero__inner">
        <h1 id="product-catalogue-title">廚房商品型錄</h1>
        <nav aria-label="麵包屑" class="product-catalogue-hero__trail">
          <NuxtLink to="/">首頁</NuxtLink>
          <span aria-hidden="true">/</span>
          <span aria-current="page">廚房商品型錄</span>
        </nav>
      </div>
    </section>

    <section class="product-catalogue-projects" aria-labelledby="product-catalogue-list-title">
      <div class="product-catalogue-rail internal-rail-safe">
        <h2 id="product-catalogue-list-title" class="sr-only">五大廚房商品型錄</h2>
        <ul class="product-catalogue-grid" aria-label="廚房商品型錄清單">
          <li
            v-for="(catalogue, index) in PRODUCT_CATALOGUES"
            :key="catalogue.id"
            v-reveal="{ anim: 'opalMoveUp', delay: Math.min(index * 80, 240) }"
            class="product-catalogue-card"
          >
            <article>
              <a
                :href="catalogue.pdfUrl"
                target="_blank"
                rel="noopener noreferrer"
                class="product-catalogue-card__link"
                :aria-label="`開啟 PDF：${catalogue.title}`"
              >
                <span class="product-catalogue-card__visual">
                  <span class="product-catalogue-card__image">
                    <InternalProductCatalogueAsset :src="catalogue.cover" :alt="`${catalogue.title}封面`" />
                  </span>
                  <span class="product-catalogue-card__shade" aria-hidden="true" />
                  <span class="product-catalogue-card__action" aria-hidden="true">
                    <span>下載型錄</span>
                    <span class="product-catalogue-card__arrow"><ArrowUpRight /></span>
                  </span>
                </span>
                <span class="product-catalogue-card__text">
                  <strong>{{ catalogue.title }}</strong>
                  <span>{{ catalogue.description }}</span>
                </span>
              </a>
            </article>
          </li>
        </ul>
      </div>
    </section>

    <section class="product-care" aria-labelledby="product-care-title">
      <div class="product-catalogue-rail internal-rail-safe">
        <header v-reveal="{ anim: 'opalMoveUp' }" class="product-care__header">
          <span class="product-care__eyebrow"><i aria-hidden="true" />Product Care Tips</span>
          <h2 id="product-care-title">廚房產品保養</h2>
          <p>從選購、安裝到日常清潔，依產品分類快速查看實用重點。</p>
        </header>

        <div class="product-care__layout">
          <div class="product-care__faq">
            <div class="product-care__filters" aria-label="產品保養問題分類">
          <label
            v-for="(category, index) in PRODUCT_CARE_CATEGORIES"
            :key="category.id"
            class="product-care__filter"
            :class="{ 'is-active': activeCategoryIndex === index }"
          >
            <span class="sr-only">{{ category.label }}問題</span>
            <select
              value=""
              :aria-label="`${category.label}問題`"
              @focus="selectCategory(index)"
              @change="selectQuestionFromCategory(index, $event)"
            >
              <option value="" disabled selected>{{ category.label }}</option>
              <option v-for="(question, questionIndex) in category.questions" :key="question.id" :value="questionIndex">
                {{ question.question }}
              </option>
            </select>
            <ChevronDown aria-hidden="true" />
              </label>
            </div>

            <div
              :id="`product-care-panel-${activeCategory.id}`"
              class="product-care__panel"
              :aria-label="`${activeCategory.label}保養問答`"
            >
              <div class="product-care__questions">
            <article
              v-for="(question, index) in activeCategory.questions"
              :key="question.id"
              class="product-care-question"
              :class="{ 'is-active': activeQuestionIndex === index }"
            >
              <button
                type="button"
                :aria-expanded="activeQuestionIndex === index"
                :aria-controls="`product-care-answer-${activeCategory.id}-${question.id}`"
                @click="selectQuestion(index)"
              >
                <span>Q{{ String(index + 1).padStart(2, '0') }}</span>
                <strong>{{ question.question }}</strong>
                <i aria-hidden="true">
                  <Minus v-if="activeQuestionIndex === index" />
                  <Plus v-else />
                </i>
              </button>
              <div
                v-show="activeQuestionIndex === index"
                :id="`product-care-answer-${activeCategory.id}-${question.id}`"
                class="product-care-question__answer"
              >
                <p v-if="question.intro">{{ question.intro }}</p>
                <ul v-if="question.details?.length">
                  <li v-for="detail in question.details" :key="`${detail.title}-${detail.body}`">
                    <strong v-if="detail.title">{{ detail.title }}</strong>
                    <span>{{ detail.body }}</span>
                  </li>
                </ul>
                <ol v-if="question.steps?.length">
                  <li v-for="(step, stepIndex) in question.steps" :key="step">
                    <span>Step {{ stepIndex + 1 }}</span>{{ step }}
                  </li>
                </ol>
                <p v-if="question.tip" class="product-care-question__tip"><strong>清潔小撇步</strong>{{ question.tip }}</p>
              </div>
                </article>
              </div>
          </div>
          </div>

          <aside class="product-care__feature" aria-live="polite">
            <a
              v-if="activeFeatureImage"
              :href="activeFeatureImage"
              target="_blank"
              rel="noopener noreferrer"
              class="product-care__media"
              :aria-label="`開啟完整圖片：${activeQuestion.question}`"
            >
              <InternalProductCatalogueAsset
                :src="activeFeatureImage"
                :alt="activeFeatureImageAlt"
                fit="cover"
                error-title="產品保養圖片載入失敗"
              />
              <span class="product-care__media-arrow" aria-hidden="true"><ChevronRight /></span>
            </a>
            <h3>{{ activeQuestion.question }}</h3>
            <p>{{ activeFeatureDescription }}</p>
          </aside>
        </div>
      </div>
    </section>
  </main>
</template>

<style scoped>
.product-catalogue-page { overflow: clip; color: #59585d; background: #f6f6f6; }
.product-catalogue-rail { width: min(1410px, 100%); margin-inline: auto; box-sizing: border-box; }

.product-catalogue-hero {
  position: relative;
  isolation: isolate;
  min-height: 360px;
  overflow: hidden;
  color: #fff;
  background: url('/section-3/store-songzhu.jpg') center 68% / cover no-repeat fixed;
}

.product-catalogue-hero__overlay { position: absolute; z-index: -1; inset: 0; background: #100801; opacity: .64; }
.product-catalogue-hero__inner { width: min(1410px, calc(100% - 60px)); margin-inline: auto; padding: 138px 0 97px; text-align: center; }
.product-catalogue-hero h1 { margin: 0 0 31px; color: #fff; font-family: var(--font-cjk-serif); font-size: 80px; font-weight: 500; line-height: 1; }
.product-catalogue-hero__trail { display: flex; align-items: center; justify-content: center; gap: 10px; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 22px; }
.product-catalogue-hero__trail a { color: inherit; transition: color .3s ease; }
.product-catalogue-hero__trail a:hover,
.product-catalogue-hero__trail a:focus-visible { color: #caa05c; }

.product-catalogue-projects { padding: 100px 30px 130px; background: #f6f6f6; }
.product-catalogue-projects .internal-rail-safe { padding-inline: 43px; }
.product-catalogue-grid { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 50px 30px; margin: 0; padding: 0; list-style: none; }
.product-catalogue-card,
.product-catalogue-card article { min-width: 0; }
.product-catalogue-card__link { display: block; color: inherit; }
.product-catalogue-card__visual { position: relative; display: block; overflow: hidden; border-radius: 24px; background: #e3e3e8; }
.product-catalogue-card__image { display: block; width: 100%; aspect-ratio: .8333333333; overflow: hidden; }
.product-catalogue-card__image :deep(img) { transition: transform .55s ease; }
.product-catalogue-card__shade { position: absolute; z-index: 1; inset: 0; background: linear-gradient(180deg, rgb(16 8 1 / 11%) 0%, rgb(16 8 1 / 2%) 78%); transition: opacity .45s ease; }
.product-catalogue-card__action { position: absolute; z-index: 3; right: 24px; bottom: 24px; display: flex; align-items: center; gap: 12px; color: #fff; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 22px; opacity: 0; visibility: hidden; transform: translateY(16px); transition: opacity .5s ease, visibility .5s ease, transform .5s ease; }
.product-catalogue-card__arrow { display: flex; width: 64px; height: 64px; align-items: center; justify-content: center; border: 1px solid rgb(255 255 255 / 16%); border-radius: 50%; color: #fff; background: rgb(0 0 0 / 58%); backdrop-filter: blur(28px); }
.product-catalogue-card__arrow svg { width: 24px; height: 24px; }
.product-catalogue-card__text { display: block; padding-top: 19px; }
.product-catalogue-card__text strong { display: block; min-height: 72px; margin-bottom: 9px; color: #1c1c1d; font-family: var(--font-cjk-serif); font-size: 25px; font-weight: 500; line-height: 36px; transition: color .3s ease; }
.product-catalogue-card__text > span { display: block; color: #737278; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 23px; }
.product-catalogue-card__link:hover .product-catalogue-card__shade,
.product-catalogue-card__link:focus-visible .product-catalogue-card__shade { background: linear-gradient(180deg, rgb(16 8 1 / 38%) 0%, rgb(16 8 1 / 8%) 78%); }
.product-catalogue-card__link:hover .product-catalogue-card__image :deep(img),
.product-catalogue-card__link:focus-visible .product-catalogue-card__image :deep(img) { transform: scale(1.035); }
.product-catalogue-card__link:hover .product-catalogue-card__action,
.product-catalogue-card__link:focus-visible .product-catalogue-card__action { opacity: 1; visibility: visible; transform: translateY(0); }
.product-catalogue-card__link:hover .product-catalogue-card__text strong,
.product-catalogue-card__link:focus-visible .product-catalogue-card__text strong { color: #caa05c; }
.product-catalogue-card__link:focus-visible { outline: 2px solid #caa05c; outline-offset: 6px; border-radius: 24px; }

.product-care { padding: 116px 30px 138px; background: #f6f6f6; }
.product-care .internal-rail-safe { padding-inline: 43px; }
.product-care__header { display: grid; grid-template-columns: 270px minmax(0, 1fr) minmax(260px, 300px); align-items: start; gap: 34px; margin-bottom: 52px; }
.product-care__eyebrow { position: relative; display: inline-flex; width: fit-content; align-items: center; gap: 8px; border: 1px solid rgb(114 114 114 / 18%); border-radius: 26px; padding: 8px 14px; color: #1c1c1d; font-family: var(--font-ui); font-size: 12px; font-weight: 400; line-height: 14px; letter-spacing: .08em; text-transform: uppercase; }
.product-care__eyebrow i { width: 8px; height: 8px; border-radius: 50%; background: #caa05c; }
.product-care__eyebrow::after { position: absolute; top: 50%; left: calc(100% + 16px); width: 104px; height: 1px; background: #e3e3e8; content: ''; }
.product-care__header h2 { max-width: 650px; margin: -5px 0 0; color: #1c1c1d; font-family: var(--font-cjk-sans); font-size: 56px; font-weight: 500; line-height: 66px; }
.product-care__header > p { margin: 4px 0 0; color: #59585d; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 25px; }
.product-care__layout { display: grid; grid-template-columns: minmax(0, 1fr) 260px; gap: 70px; align-items: start; }
.product-care__filters { display: grid; width: 100%; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 18px; }
.product-care__filter { position: relative; display: block; min-width: 0; }
.product-care__filter select { width: 100%; height: 64px; appearance: none; border: 1px solid transparent; border-radius: 999px; padding: 0 52px 0 24px; color: #59585d; background: #fff; font-family: var(--font-ui); font-size: 15px; line-height: 1; outline: 0; transition: border-color .3s ease, box-shadow .3s ease, color .3s ease; }
.product-care__filter > svg { position: absolute; top: 50%; right: 22px; width: 17px; height: 17px; color: #59585d; pointer-events: none; transform: translateY(-50%); transition: color .3s ease, transform .3s ease; }
.product-care__filter:hover select,
.product-care__filter.is-active select { color: #1c1c1d; border-color: rgba(202,160,92,.5); }
.product-care__filter:focus-within select { border-color: #caa05c; box-shadow: 0 0 0 3px rgba(202,160,92,.17); }
.product-care__filter:focus-within > svg { color: #caa05c; transform: translateY(-50%) rotate(180deg); }
.product-care__panel { padding-top: 54px; }
.product-care__questions { border-top: 1px solid #e3e3e8; }
.product-care-question { border-bottom: 1px solid #e3e3e8; }
.product-care-question > button { display: grid; width: 100%; min-height: 78px; grid-template-columns: 48px minmax(0, 1fr) 40px; align-items: center; border: 0; padding: 0; color: #1c1c1d; background: transparent; text-align: left; }
.product-care-question > button > span { color: #9f9fa4; font-family: var(--font-cjk-sans); font-size: 16px; line-height: 30px; }
.product-care-question > button > strong { font-family: var(--font-cjk-sans); font-size: 20px; font-weight: 500; line-height: 30px; }
.product-care-question > button > i { display: flex; width: 36px; height: 36px; align-items: center; justify-content: flex-end; color: #1c1c1d; transition: color .3s ease; }
.product-care-question > button > i svg { width: 18px; height: 18px; stroke-width: 1.5; }
.product-care-question.is-active > button > i { color: #caa05c; }
.product-care-question > button:hover > strong,
.product-care-question > button:focus-visible > strong { color: #caa05c; }
.product-care-question > button:focus-visible { outline: 2px solid #caa05c; outline-offset: 5px; }
.product-care-question__answer { padding: 0 40px 32px 48px; color: #59585d; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 25px; }
.product-care-question__answer > p { margin: 0; }
.product-care-question__answer ul,
.product-care-question__answer ol { display: grid; gap: 9px; margin: 0; padding: 0; list-style: none; }
.product-care-question__answer li { display: grid; gap: 2px; }
.product-care-question__answer li strong { color: #1c1c1d; }
.product-care-question__answer li span { display: block; }
.product-care-question__answer ol li { grid-template-columns: 56px minmax(0, 1fr); gap: 10px; }
.product-care-question__answer ol li > span { color: #caa05c; font-size: 10px; font-weight: 700; letter-spacing: .06em; text-transform: uppercase; }
.product-care-question__tip { display: grid; gap: 4px; margin-top: 18px !important; padding: 15px 17px; border-left: 2px solid #caa05c; background: #f6f6f6; }
.product-care-question__tip strong { color: #1c1c1d; }
.product-care__feature { position: sticky; top: 90px; min-width: 0; }
.product-care__media { position: relative; display: block; width: 100%; aspect-ratio: .8; overflow: hidden; border-radius: 22px; background: #e9e9ec; }
.product-care__media :deep(.product-catalogue-asset) { width: 100%; height: 100%; }
.product-care__media :deep(img) { object-position: top center; transition: transform .55s ease; }
.product-care__media-arrow { position: absolute; right: 50%; bottom: 28px; display: flex; width: 58px; height: 58px; align-items: center; justify-content: center; border: 1px solid rgba(255,255,255,.22); border-radius: 50%; color: #fff; background: rgba(28,28,29,.58); box-shadow: 0 8px 22px rgba(0,0,0,.18); backdrop-filter: blur(10px); transform: translateX(50%); transition: transform .35s ease, background-color .3s ease; }
.product-care__media-arrow svg { width: 34px; height: 34px; stroke-width: 2.2; }
.product-care__media:hover :deep(img),
.product-care__media:focus-visible :deep(img) { transform: scale(1.035); }
.product-care__media:hover .product-care__media-arrow,
.product-care__media:focus-visible .product-care__media-arrow { background: #caa05c; transform: translateX(58%); }
.product-care__media:focus-visible { outline: 2px solid #caa05c; outline-offset: 5px; }
.product-care__feature h3 { margin: 30px 0 14px; color: #1c1c1d; font-family: var(--font-cjk-sans); font-size: 20px; font-weight: 500; line-height: 30px; }
.product-care__feature > p { margin: 0; color: #737278; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 25px; }

@media (max-width: 1199px) {
  .product-care__layout { gap: 42px; }
}

@media (max-width: 1023px) {
  .product-catalogue-projects { padding-block: 80px 105px; }
  .product-catalogue-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
  .product-care { padding-block: 100px 115px; }
  .product-care__header { grid-template-columns: 150px minmax(0, 1fr); gap: 24px 30px; }
  .product-care__header > p { grid-column: 2; }
  .product-care__header h2 { font-size: 60px; line-height: 64px; }
  .product-care__layout { grid-template-columns: 1fr; }
  .product-care__feature { position: static; }
}

@media (max-width: 767px) {
  .product-catalogue-hero { min-height: 288px; background-attachment: scroll; }
  .product-catalogue-hero__inner { width: calc(100% - 30px); padding: 80px 0 60px; }
  .product-catalogue-hero h1 { margin-bottom: 25px; font-size: 46px; line-height: 50px; }
  .product-catalogue-projects { padding: 60px 93px 80px 15px; }
  .product-catalogue-projects .internal-rail-safe,
  .product-care .internal-rail-safe { padding-inline: 0; }
  .product-catalogue-grid { grid-template-columns: 1fr; gap: 44px; }
  .product-catalogue-card__action { right: 18px; bottom: 18px; gap: 9px; opacity: 1; visibility: visible; transform: none; }
  .product-catalogue-card__arrow { width: 54px; height: 54px; }
  .product-catalogue-card__text strong { min-height: 0; font-size: 26px; line-height: 31px; }
  .product-care { padding: 82px 93px 92px 15px; }
  .product-care__header { grid-template-columns: 1fr; gap: 0; margin-bottom: 38px; }
  .product-care__header > p { grid-column: auto; }
  .product-care__eyebrow::after { display: none; }
  .product-care__header h2 { margin-top: 20px; font-size: 46px; line-height: 54px; }
  .product-care__header > p { font-size: 15px; line-height: 24px; }
  .product-care__filters { grid-template-columns: 1fr; gap: 12px; }
  .product-care__filter select { height: 58px; padding-inline: 20px 48px; font-size: 14px; }
  .product-care__layout { gap: 38px; }
  .product-care__panel { padding-top: 42px; }
  .product-care-question > button { min-height: 78px; grid-template-columns: 42px minmax(0, 1fr) 34px; }
  .product-care-question > button > span { font-size: 14px; }
  .product-care-question > button > strong { font-size: 18px; line-height: 28px; }
  .product-care-question > button > i { width: 31px; height: 31px; }
  .product-care-question__answer { padding: 0 5px 25px 42px; }
  .product-care__media { border-radius: 18px; }
  .product-care__feature h3 { margin-top: 26px; font-size: 20px; line-height: 30px; }
}

@media (prefers-reduced-motion: reduce) {
  .product-catalogue-card__image :deep(img),
  .product-catalogue-card__shade,
  .product-catalogue-card__action,
  .product-catalogue-card__text strong,
  .product-care__filter select,
  .product-care__filter > svg,
  .product-care-question > button > i,
  .product-care__media :deep(img),
  .product-care__media-arrow { transition: none; }
  .product-catalogue-card__link:hover .product-catalogue-card__image :deep(img),
  .product-catalogue-card__link:focus-visible .product-catalogue-card__image :deep(img) { transform: none; }
}
</style>
