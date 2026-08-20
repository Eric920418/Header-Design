<script setup lang="ts">
import { ArrowRight, SlidersHorizontal } from 'lucide-vue-next'
import {
  DESIGN_FORM_OPTIONS,
  DESIGN_INSPIRATION_CASES,
  DESIGN_STYLE_OPTIONS,
} from '~/data/designInspirations'
import type { DesignInspirationForm, DesignInspirationStyle } from '~/types/content'

const route = useRoute()
const router = useRouter()
const pageSize = 9
const validForms = new Set(DESIGN_FORM_OPTIONS.map(item => item.value).filter(Boolean))
const validStyles = new Set(DESIGN_STYLE_OPTIONS.map(item => item.value).filter(Boolean))

const queryString = (value: unknown) => typeof value === 'string' ? value : ''

const selectedForm = computed<'' | DesignInspirationForm>(() => {
  const value = queryString(route.query.form) as DesignInspirationForm
  return validForms.has(value) ? value : ''
})

const selectedStyle = computed<'' | DesignInspirationStyle>(() => {
  const value = queryString(route.query.style) as DesignInspirationStyle
  return validStyles.has(value) ? value : ''
})

const draftForm = ref<'' | DesignInspirationForm>(selectedForm.value)
const draftStyle = ref<'' | DesignInspirationStyle>(selectedStyle.value)

watch([selectedForm, selectedStyle], ([form, style]) => {
  draftForm.value = form
  draftStyle.value = style
})

const filteredCases = computed(() => DESIGN_INSPIRATION_CASES.filter(item =>
  (!selectedForm.value || item.form === selectedForm.value)
  && (!selectedStyle.value || item.style === selectedStyle.value),
))

const totalPages = computed(() => Math.max(1, Math.ceil(filteredCases.value.length / pageSize)))
const requestedPage = computed(() => {
  const value = Number.parseInt(queryString(route.query.page), 10)
  return Number.isFinite(value) && value > 0 ? value : 1
})
const currentPage = computed(() => Math.min(requestedPage.value, totalPages.value))
const paginatedCases = computed(() => {
  const start = (currentPage.value - 1) * pageSize
  return filteredCases.value.slice(start, start + pageSize)
})

async function applyFilters() {
  const query = { ...route.query }
  delete query.form
  delete query.style
  delete query.page
  if (draftForm.value) query.form = draftForm.value
  if (draftStyle.value) query.style = draftStyle.value
  await router.push({ path: route.path, query })
}

async function goToPage(page: number) {
  const query = { ...route.query }
  if (page > 1) query.page = String(page)
  else delete query.page
  await router.push({ path: route.path, query })
}

onMounted(() => {
  const hasInvalidForm = Boolean(queryString(route.query.form)) && !selectedForm.value
  const hasInvalidStyle = Boolean(queryString(route.query.style)) && !selectedStyle.value
  const hasInvalidPage = requestedPage.value !== currentPage.value
  if (!hasInvalidForm && !hasInvalidStyle && !hasInvalidPage) return

  const query = { ...route.query }
  if (hasInvalidForm) delete query.form
  if (hasInvalidStyle) delete query.style
  if (hasInvalidPage || currentPage.value === 1) delete query.page
  void router.replace({ path: route.path, query })
})

useSeoMeta({
  title: '設計靈感｜SAKURA 整體廚房',
  description: '依設計型式與設計風格探索 SAKURA 整體廚房真實案例，找到適合家的廚房靈感。',
  ogTitle: '設計靈感｜SAKURA 整體廚房',
  ogDescription: '工業風、北歐風與現代風整體廚房案例。',
  ogImage: DESIGN_INSPIRATION_CASES[0]?.cover,
})
</script>

<template>
  <main class="design-inspiration-page">
    <section class="design-projects-hero" aria-labelledby="design-projects-title">
      <span class="design-projects-hero__overlay" aria-hidden="true" />
      <div class="design-projects-hero__inner" v-reveal="{ anim: 'opalMoveUp' }">
        <h1 id="design-projects-title">設計靈感</h1>
        <nav aria-label="麵包屑" class="design-projects-hero__trail">
          <NuxtLink to="/">首頁</NuxtLink>
          <span aria-hidden="true">/</span>
          <span aria-current="page">設計靈感</span>
        </nav>
      </div>
    </section>

    <section aria-labelledby="design-projects-filter-title" class="design-projects-section">
      <div class="design-projects-rail internal-rail-safe">
        <h2 id="design-projects-filter-title" class="sr-only">篩選設計靈感案例</h2>

        <form class="design-projects-filter" v-reveal="{ anim: 'opalMoveUp' }" @submit.prevent="applyFilters">
          <div class="design-projects-filter__field">
            <label for="design-form">設計型式</label>
            <div class="design-projects-filter__select">
              <select id="design-form" v-model="draftForm" name="form">
                <option v-for="option in DESIGN_FORM_OPTIONS" :key="option.label" :value="option.value">{{ option.label }}</option>
              </select>
            </div>
          </div>

          <div class="design-projects-filter__field">
            <label for="design-style">設計風格</label>
            <div class="design-projects-filter__select">
              <select id="design-style" v-model="draftStyle" name="style">
                <option v-for="option in DESIGN_STYLE_OPTIONS" :key="option.label" :value="option.value">{{ option.label }}</option>
              </select>
            </div>
          </div>

          <button type="submit" class="design-projects-filter__submit">
            <span>Filter</span>
            <span class="design-projects-filter__submit-icon"><ArrowRight aria-hidden="true" /></span>
          </button>
        </form>

        <p class="sr-only" aria-live="polite">共 {{ filteredCases.length }} 筆符合條件的設計案例</p>

        <ul
          v-if="paginatedCases.length"
          :key="`projects-${selectedForm}-${selectedStyle}-${currentPage}`"
          class="design-projects-grid"
          aria-label="設計案例"
        >
          <li
            v-for="(item, index) in paginatedCases"
            :key="item.slug"
            v-reveal="{ anim: 'opalMoveUp', delay: Math.min(index * 80, 240) }"
            class="design-project-card"
          >
            <article>
              <div class="design-project-card__transition">
                <div class="design-project-card__categories" aria-label="案例分類">
                  <span>{{ item.form }}</span>
                  <span>{{ item.style }}</span>
                </div>
                <NuxtLink :to="item.detailRoute" class="design-project-card__image-link" :aria-label="`查看案例：${item.title}`">
                  <InternalCaseImage :src="item.cover" :alt="item.coverAlt" class="design-project-card__image" />
                  <span class="design-project-card__shade" aria-hidden="true" />
                  <span class="design-project-card__view" aria-hidden="true">View</span>
                </NuxtLink>
              </div>
              <div class="design-project-card__text">
                <h2><NuxtLink :to="item.detailRoute">{{ item.title }}</NuxtLink></h2>
                <p>{{ item.storeName }}</p>
              </div>
            </article>
          </li>
        </ul>

        <div
          v-else
          :key="`empty-${selectedForm}-${selectedStyle}`"
          v-reveal="{ anim: 'opalMoveUp' }"
          class="design-projects-empty"
          role="status"
        >
          <SlidersHorizontal aria-hidden="true" />
          <h2>目前沒有符合條件的設計案例</h2>
          <p>請調整設計型式或設計風格，再重新篩選。</p>
          <button type="button" @click="draftForm = ''; draftStyle = ''; applyFilters()">查看全部案例</button>
        </div>

        <nav v-if="filteredCases.length" class="design-projects-pagination" aria-label="案例分頁">
          <button
            v-for="page in totalPages"
            :key="page"
            type="button"
            :aria-current="page === currentPage ? 'page' : undefined"
            :disabled="page === currentPage"
            :class="{ 'is-current': page === currentPage }"
            @click="goToPage(page)"
          >
            {{ page }}
          </button>
        </nav>
      </div>
    </section>
  </main>
</template>

<style scoped>
.design-projects-hero {
  position: relative;
  isolation: isolate;
  min-height: 360px;
  overflow: hidden;
  color: #fff;
  background: url('/section-3/service-process/breadcrumb-df.jpg') center / cover no-repeat fixed;
}

.design-projects-hero__overlay {
  position: absolute;
  inset: 0;
  z-index: -1;
  background: #100801;
  opacity: .64;
}

.design-projects-hero__inner {
  width: min(1410px, calc(100% - 60px));
  margin-inline: auto;
  padding: 138px 0 97px;
  text-align: center;
}

.design-projects-hero h1 {
  margin: 0 0 35px;
  color: #fff;
  font-family: var(--font-display);
  font-size: 80px;
  font-weight: 400;
  line-height: .9523809524;
}

.design-projects-hero__trail {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  font-family: var(--font-ui);
  font-size: 13px;
  line-height: 14px;
  text-transform: uppercase;
}

.design-projects-hero__trail a { color: #fff; transition: color .3s ease; }
.design-projects-hero__trail a:hover { color: #caa05c; }

.design-projects-section {
  overflow: hidden;
  padding: 100px 30px 130px;
  background: #f6f6f6;
}

.design-projects-rail {
  width: min(1410px, 100%);
  margin-inline: auto;
}

.design-projects-rail.internal-rail-safe {
  padding-inline: 43px;
}

.design-projects-filter {
  display: flex;
  align-items: flex-end;
  gap: 20px;
  margin-bottom: 40px;
}

.design-projects-filter__field {
  display: flex;
  min-width: 0;
  flex: 1 1 0;
  flex-direction: column;
  gap: 20px;
}

.design-projects-filter label {
  color: #1c1c1d;
  font-family: var(--font-ui);
  font-size: 24px;
  font-weight: 400;
  line-height: 1.15;
}

.design-projects-filter__select { position: relative; }
.design-projects-filter__select::after {
  position: absolute;
  top: 50%;
  right: 17px;
  width: 7px;
  height: 7px;
  border-right: 1.5px solid #59585d;
  border-bottom: 1.5px solid #59585d;
  content: "";
  pointer-events: none;
  transform: translateY(-70%) rotate(45deg);
}

.design-projects-filter select {
  width: 100%;
  min-width: 300px;
  min-height: 58px;
  appearance: none;
  border: 1px solid transparent;
  border-radius: 100px;
  padding: 17px 46px 17px 15px;
  color: #59585d;
  background: #fff;
  font-size: 16px;
  font-weight: 500;
  line-height: 24px;
}

.design-projects-filter select:focus-visible { border-color: #caa05c; outline: 0; }

.design-projects-filter__submit {
  display: inline-flex;
  align-items: center;
  overflow: hidden;
  border: 1px solid rgba(159, 159, 164, .64);
  border-radius: 100px;
  padding: 9px 9px 9px 30px;
  color: #1c1c1d;
  background: transparent;
  font-size: 18px;
  font-weight: 400;
  line-height: 24px;
  transition: color .5s ease, border-color .5s ease, background-color .5s ease;
}

.design-projects-filter__submit-icon {
  display: flex;
  width: 40px;
  height: 40px;
  align-items: center;
  justify-content: center;
  margin-left: 8px;
  border-radius: 50%;
  color: #fff;
  background: #caa05c;
  transform: rotate(-45deg);
  transition: transform .5s ease;
}

.design-projects-filter__submit-icon svg { width: 20px; height: 20px; }
.design-projects-filter__submit:hover { border-color: #caa05c; color: #fff; background: #caa05c; }
.design-projects-filter__submit:hover .design-projects-filter__submit-icon { transform: rotate(0); }

.design-projects-grid {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 30px;
  margin: 0;
  padding: 0;
  list-style: none;
}

.design-project-card { min-width: 0; margin-bottom: 20px; }
.design-project-card__transition { position: relative; overflow: hidden; border-radius: 24px; }

.design-project-card__image-link {
  position: relative;
  display: block;
  overflow: hidden;
  border-radius: 24px;
}

.design-project-card__image {
  width: 100%;
  aspect-ratio: .8333333333;
  border-radius: 24px;
}

.design-project-card__image :deep(img) {
  transition: transform .5s ease;
}

.design-project-card__shade {
  position: absolute;
  inset: 0;
  z-index: 1;
  background: rgba(0, 0, 0, .15);
  transition: background-color .5s ease;
}

.design-project-card__categories {
  position: absolute;
  top: 31px;
  left: 30px;
  z-index: 2;
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}

.design-project-card__categories span {
  border: 1px solid rgba(255, 255, 255, .46);
  border-radius: 100px;
  padding: 5px 14px;
  color: #fff;
  font-family: var(--font-ui);
  font-size: 13px;
  line-height: 14px;
}

.design-project-card__view {
  position: absolute;
  top: 50%;
  left: 50%;
  z-index: 2;
  display: flex;
  width: 80px;
  height: 80px;
  align-items: center;
  justify-content: center;
  border: 1px solid rgba(255, 255, 255, .07);
  border-radius: 50%;
  color: #fff;
  background: rgba(0, 0, 0, .46);
  font-family: var(--font-ui);
  font-size: 16px;
  line-height: 24px;
  opacity: 0;
  visibility: hidden;
  backdrop-filter: blur(58px);
  transform: translate(-50%, -50%);
  transition: color .5s ease, opacity .5s ease, visibility .5s ease;
}

.design-project-card__image-link:hover .design-project-card__shade,
.design-project-card__image-link:focus-visible .design-project-card__shade { background: rgba(0, 0, 0, .25); }
.design-project-card__image-link:hover :deep(img),
.design-project-card__image-link:focus-visible :deep(img) { transform: scale(1.05); }
.design-project-card__image-link:hover .design-project-card__view,
.design-project-card__image-link:focus-visible .design-project-card__view { opacity: 1; visibility: visible; }
.design-project-card__view:hover { color: #caa05c; }

.design-project-card__text { padding-top: 23px; }
.design-project-card__text h2 {
  min-height: 68px;
  margin: 0 0 14px;
  font-family: var(--font-display);
  font-size: 30px;
  font-weight: 400;
  line-height: 34px;
}

.design-project-card__text h2 a {
  display: -webkit-box;
  overflow: hidden;
  color: #1c1c1d;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  transition: color .3s ease;
}

.design-project-card__text h2 a:hover { color: #caa05c; }
.design-project-card__text p { margin: 0; color: #59585d; font-size: 16px; line-height: 24px; }

.design-projects-empty {
  display: flex;
  min-height: 360px;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 12px;
  border: 1px solid #e3e3e8;
  border-radius: 24px;
  padding: 40px;
  color: #59585d;
  background: #fff;
  text-align: center;
}

.design-projects-empty svg { width: 36px; height: 36px; color: #caa05c; }
.design-projects-empty h2 { margin: 0; color: #1c1c1d; font-family: var(--font-display); font-size: 30px; font-weight: 400; line-height: 34px; }
.design-projects-empty p { margin: 0; font-size: 16px; line-height: 24px; }
.design-projects-empty button { margin-top: 12px; border-bottom: 1px solid #caa05c; padding: 4px 0; color: #1c1c1d; }

.design-projects-pagination {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  margin-top: 41px;
}

.design-projects-pagination button {
  display: flex;
  min-width: 40px;
  min-height: 40px;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  color: #1c1c1d;
  font-size: 16px;
  line-height: 24px;
  transition: color .3s ease, background-color .3s ease;
}

.design-projects-pagination button:hover,
.design-projects-pagination button.is-current { color: #fff; background: #caa05c; }
.design-projects-pagination button:disabled { cursor: default; opacity: 1; }

@media (max-width: 1023px) {
  .design-projects-section { padding-block: 80px; }
  .design-projects-filter select { min-width: 0; }
  .design-projects-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
}

@media (max-width: 767px) {
  .design-projects-hero { min-height: 288px; background-attachment: scroll; }
  .design-projects-hero__inner { width: calc(100% - 30px); padding: 80px 0 60px; }
  .design-projects-hero h1 { margin-bottom: 25px; font-size: 48px; line-height: 52px; }
  .design-projects-section { padding: 60px 15px; }
  .design-projects-rail.internal-rail-safe { padding-inline: 0; }
  .design-projects-filter { flex-direction: column; align-items: flex-start; gap: 30px; }
  .design-projects-filter__field { width: 100%; gap: 10px; }
  .design-projects-filter select { width: 100%; min-width: 0; }
  .design-projects-filter__submit { font-size: 15px; }
  .design-projects-grid { grid-template-columns: 1fr; gap: 30px; }
  .design-project-card__categories { top: 20px; left: 15px; }
  .design-project-card__text h2 { min-height: 0; font-size: 26px; line-height: 30px; }
  .design-projects-pagination { margin-top: 30px; }
}

@media (prefers-reduced-motion: reduce) {
  .design-project-card__image :deep(img),
  .design-project-card__shade,
  .design-project-card__view,
  .design-projects-filter__submit,
  .design-projects-filter__submit-icon { transition: none; }
  .design-project-card__image-link:hover :deep(img),
  .design-project-card__image-link:focus-visible :deep(img) { transform: none; }
}
</style>
