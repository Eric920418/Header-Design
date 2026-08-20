<script setup lang="ts">
import { MapPin } from 'lucide-vue-next'
import { regionCities, storeCaseSummaries } from '~/data/storeCases'

const route = useRoute()
const router = useRouter()
const regions = Object.keys(regionCities)

const queryString = (value: unknown) => typeof value === 'string' ? value : ''

const selectedRegion = computed(() => {
  const value = queryString(route.query.region)
  return regions.includes(value) ? value : ''
})

const selectedCity = computed(() => {
  const value = queryString(route.query.city)
  return selectedRegion.value && regionCities[selectedRegion.value]?.includes(value) ? value : ''
})

const availableCities = computed(() => selectedRegion.value ? regionCities[selectedRegion.value] ?? [] : [])

const filteredCases = computed(() => storeCaseSummaries.filter(item =>
  (!selectedRegion.value || item.region === selectedRegion.value)
  && (!selectedCity.value || item.city === selectedCity.value),
))

const updateFilters = async (region = '', city = '') => {
  const query = { ...route.query }
  delete query.region
  delete query.city
  if (region) query.region = region
  if (city) query.city = city
  await router.push({ query })
}

const selectRegion = (region: string) => updateFilters(region)
const selectCity = (city: string) => updateFilters(selectedRegion.value, city)

useSeoMeta({
  title: '案例門市｜SAKURA 整體廚房',
  description: '依區域與縣市探索 SAKURA 整體廚房安康店、承德店與松竹店案例。',
  ogTitle: '案例門市｜SAKURA 整體廚房',
  ogDescription: '安康店、承德店與松竹店的真實整體廚房案例。',
})
</script>

<template>
  <main>
    <section class="antra-gallery-breadcrumb" aria-labelledby="gallery-page-title">
      <div class="antra-gallery-breadcrumb__overlay" aria-hidden="true" />
      <div class="antra-gallery-breadcrumb__inner" v-reveal="{ anim: 'opalMoveUp' }">
        <h1 id="gallery-page-title">案例門市</h1>
        <nav aria-label="麵包屑" class="antra-gallery-breadcrumb__trail">
          <NuxtLink to="/">首頁</NuxtLink><span aria-hidden="true">/</span><span aria-current="page">案例門市</span>
        </nav>
      </div>
    </section>

    <section aria-labelledby="gallery-filter-title" class="antra-store-gallery">
      <div class="antra-store-gallery__rail internal-rail-safe">
        <h2 id="gallery-filter-title" class="sr-only">依地區篩選案例門市</h2>

        <div class="antra-store-filter" aria-label="案例門市篩選" v-reveal="{ anim: 'opalMoveUp' }">
          <div class="antra-store-filter__row">
            <span class="antra-store-filter__label">區域</span>
            <div class="antra-store-filter__options" role="group" aria-label="選擇區域">
              <button type="button" :aria-pressed="selectedRegion === ''" :class="{ 'is-active': selectedRegion === '' }" @click="selectRegion('')">全部</button>
              <button v-for="region in regions" :key="region" type="button" :aria-pressed="selectedRegion === region" :class="{ 'is-active': selectedRegion === region }" @click="selectRegion(region)">{{ region }}</button>
            </div>
          </div>

          <div v-if="selectedRegion" class="antra-store-filter__row antra-store-filter__row--cities">
            <span class="antra-store-filter__label">縣市</span>
            <div class="antra-store-filter__options" role="group" :aria-label="`${selectedRegion}縣市`">
              <button type="button" :aria-pressed="selectedCity === ''" :class="{ 'is-active': selectedCity === '' }" @click="selectCity('')">全部縣市</button>
              <button v-for="city in availableCities" :key="city" type="button" :aria-pressed="selectedCity === city" :class="{ 'is-active': selectedCity === city }" @click="selectCity(city)">{{ city }}</button>
            </div>
          </div>
        </div>

        <div aria-live="polite" class="antra-store-gallery__result-count" v-reveal="{ anim: 'opalMoveUp', delay: 80 }">{{ filteredCases.length }} 間案例門市</div>

        <div
          v-if="filteredCases.length"
          :key="`grid-${selectedRegion}-${selectedCity}`"
          class="antra-store-grid"
          v-reveal="{ anim: 'opalMoveUp', delay: 100 }"
        >
          <InternalStoreCard v-for="item in filteredCases" :key="item.slug" :item="item" />
        </div>

        <div
          v-else
          :key="`empty-${selectedRegion}-${selectedCity}`"
          class="antra-store-empty"
          role="status"
          v-reveal="{ anim: 'opalMoveUp', delay: 100 }"
        >
          <MapPin aria-hidden="true" />
          <div>
            <h2>此區域尚無案例資料</h2>
            <p>目前沒有符合條件的正式案例，請選擇其他區域或縣市。</p>
          </div>
          <button type="button" @click="updateFilters()">查看全部案例</button>
        </div>
      </div>
    </section>
  </main>
</template>

<style scoped>
.antra-gallery-breadcrumb {
  position: relative;
  isolation: isolate;
  min-height: 360px;
  overflow: hidden;
  background: url('/section-3/service-process/breadcrumb-df.jpg') center / cover no-repeat fixed;
  color: #fff;
}

.antra-gallery-breadcrumb__overlay {
  position: absolute;
  inset: 0;
  z-index: -1;
  background: #100801;
  opacity: .64;
}

.antra-gallery-breadcrumb__inner {
  width: min(1410px, calc(100% - 60px));
  margin-inline: auto;
  padding: 138px 0 97px;
  text-align: center;
}

.antra-gallery-breadcrumb h1 {
  margin: 0 0 35px;
  color: #fff;
  font-family: var(--font-display);
  font-size: 80px;
  font-weight: 400;
  line-height: .9523809524;
}

.antra-gallery-breadcrumb__trail {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  font-family: var(--font-ui);
  font-size: 13px;
  font-weight: 400;
  line-height: 14px;
  text-transform: uppercase;
}

.antra-gallery-breadcrumb__trail a {
  color: #fff;
  transition: color .3s ease;
}

.antra-gallery-breadcrumb__trail a:hover { color: #caa05c; }

.antra-store-gallery {
  overflow: hidden;
  padding: 100px 30px 108px;
  background: #f6f6f6;
}

.antra-store-gallery__rail {
  width: min(1410px, 100%);
  margin-inline: auto;
}

.antra-store-filter {
  border-top: 1px solid #e3e3e8;
  border-bottom: 1px solid #e3e3e8;
}

.antra-store-filter__row {
  display: grid;
  grid-template-columns: 112px minmax(0, 1fr);
  min-height: 74px;
  align-items: center;
}

.antra-store-filter__row--cities { border-top: 1px solid #e3e3e8; }

.antra-store-filter__label {
  color: #9f9fa4;
  font-family: var(--font-ui);
  font-size: 16px;
  line-height: 24px;
}

.antra-store-filter__options {
  display: flex;
  flex-wrap: wrap;
  gap: 10px 26px;
  padding-block: 14px;
}

.antra-store-filter button {
  position: relative;
  min-height: 34px;
  padding: 5px 14px;
  border: 1px solid transparent;
  border-radius: 24px;
  color: #59585d;
  background: transparent;
  font-size: 15px;
  line-height: 22px;
  cursor: pointer;
  transition: color .3s ease, border-color .3s ease, background-color .3s ease;
}

.antra-store-filter button:hover {
  border-color: rgba(202, 160, 92, .45);
  color: #1c1c1d;
}

.antra-store-filter button.is-active {
  border-color: #caa05c;
  color: #fff;
  background: #caa05c;
}

.antra-store-gallery__result-count {
  margin-top: 36px;
  color: #9f9fa4;
  font-size: 15px;
  line-height: 24px;
}

.antra-store-grid {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 30px;
  margin-top: 30px;
}

.antra-store-empty {
  display: grid;
  grid-template-columns: auto 1fr auto;
  gap: 22px;
  align-items: center;
  min-height: 180px;
  margin-top: 30px;
  padding: 36px 0;
  border-top: 1px solid #e3e3e8;
  border-bottom: 1px solid #e3e3e8;
}

.antra-store-empty > svg {
  width: 38px;
  height: 38px;
  color: #caa05c;
}

.antra-store-empty h2 {
  margin: 0;
  color: #1c1c1d;
  font-family: var(--font-display);
  font-size: 28px;
  font-weight: 400;
  line-height: 34px;
}

.antra-store-empty p {
  margin: 7px 0 0;
  color: #59585d;
  font-size: 16px;
  line-height: 24px;
}

.antra-store-empty button {
  min-height: 48px;
  padding: 11px 24px;
  border: 1px solid #9f9fa4;
  border-radius: 30px;
  color: #1c1c1d;
  background: transparent;
  font-size: 15px;
  line-height: 24px;
  white-space: nowrap;
  transition: color .3s ease, border-color .3s ease, background-color .3s ease;
}

.antra-store-empty button:hover {
  border-color: #caa05c;
  color: #fff;
  background: #caa05c;
}

@media (max-width: 1024px) {
  .antra-gallery-breadcrumb {
    min-height: 285px;
    background-attachment: scroll;
  }

  .antra-gallery-breadcrumb__inner { padding-block: 80px; }
  .antra-store-gallery { padding-block: 80px; }
  .antra-store-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
}

@media (max-width: 767px) {
  .antra-gallery-breadcrumb { min-height: 204px; }

  .antra-gallery-breadcrumb__inner {
    width: calc(100% - 30px);
    padding: 80px 0 60px;
  }

  .antra-gallery-breadcrumb h1 {
    margin-bottom: 15px;
    font-size: 30px;
    line-height: 35px;
  }

  .antra-store-gallery { padding: 60px 15px; }

  .antra-store-filter__row {
    grid-template-columns: 1fr;
    gap: 4px;
    padding-block: 14px;
  }

  .antra-store-filter__row--cities { padding-top: 18px; }
  .antra-store-filter__label { font-size: 14px; }

  .antra-store-filter__options {
    gap: 8px;
    padding-block: 0;
  }

  .antra-store-filter button {
    min-height: 32px;
    padding: 4px 12px;
    font-size: 14px;
  }

  .antra-store-gallery__result-count { margin-top: 28px; }

  .antra-store-grid {
    grid-template-columns: 1fr;
    margin-top: 24px;
  }

  .antra-store-empty {
    grid-template-columns: 1fr;
    gap: 16px;
    padding: 32px 0;
  }

  .antra-store-empty h2 { font-size: 24px; line-height: 30px; }
  .antra-store-empty button { justify-self: start; }
}

@media (prefers-reduced-motion: reduce) {
  .antra-gallery-breadcrumb { background-attachment: scroll; }

  .antra-store-filter button,
  .antra-store-empty button,
  .antra-gallery-breadcrumb__trail a {
    transition: none;
  }
}
</style>
