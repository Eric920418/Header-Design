<script setup lang="ts">
const cmsCopy = await useCmsResource('view-pages-design-inspiration-id-', {"copy":{"text1":"此案例尚未提供圖片。","text2":"案例規格","text3":"返回設計靈感"},"cmsSettings":{"visible":true,"seoTitle":"","seoDescription":""}})

import { ArrowLeft } from 'lucide-vue-next'
import type { DesignCaseDetail } from '~/types/designCloud'

const route = useRoute()
const router = useRouter()
const url = computed(() => `/api/design-inspiration/cases/${encodeURIComponent(String(route.params.id))}`)
const { data: item, error, status, refresh } = await useFetch<DesignCaseDetail>(url,{query:computed(()=>route.query.cmsPreview?{cmsPreview:route.query.cmsPreview}:{})})
const listRoute = computed(() => router.resolve({ path: '/design-inspiration', query: Object.fromEntries(
  ['form', 'style', 'page'].flatMap(key => typeof route.query[key] === 'string' ? [[key, route.query[key]]] : []),
) }).fullPath)
const paragraphs = computed(() => item.value?.description.split(/\r?\n/).filter(line => line.trim()) ?? [])
if (import.meta.server && error.value) setResponseStatus(error.value.statusCode ?? 500)
useSeoMeta({
  title: () => `${item.value?.title ?? '設計案例'}｜SAKURA 整體廚房`,
  description: () => item.value?.description,
  ogImage: () => item.value?.cover ?? undefined,
})
useHead(() => ({ ...(cmsCopy.cmsSettings.seoTitle ? {title:cmsCopy.cmsSettings.seoTitle}:{}), meta: cmsCopy.cmsSettings.seoDescription ? [{name:'description',content:cmsCopy.cmsSettings.seoDescription}] : [] }))
</script>

<template>
  <template v-if="cmsCopy.cmsSettings.visible">
  <main class="design-case-page">
    <InternalCaseBreadcrumbHero :design-list-url="listRoute" />
    <section class="design-case-content">
      <div class="design-case-rail internal-rail-safe">
        <InternalDesignLoadState :pending="status === 'pending'" :error="error" @retry="refresh()" />
        <div v-if="item && !error && status !== 'pending'" class="design-case-layout">
          <h1>{{ item.title }}</h1>
          <div class="design-case-images">
            <InternalCaseCarousel v-if="item.images.length" :images="item.images" :title="item.title" />
            <p v-else role="status">{{ cmsCopy.copy.text1 }}</p>
          </div>
          <aside v-if="item.specs.length" aria-labelledby="design-case-specs-title">
            <h2 id="design-case-specs-title">{{ cmsCopy.copy.text2 }}</h2>
            <dl><div v-for="spec in item.specs" :key="spec.name"><dt>{{ spec.name }}</dt><dd>{{ spec.value }}</dd></div></dl>
          </aside>
          <article v-if="paragraphs.length" aria-label="案例設計說明">
            <p v-for="(paragraph, index) in paragraphs" :key="index">{{ paragraph }}</p>
          </article>
        </div>
        <NuxtLink :to="listRoute" class="design-case-return"><ArrowLeft aria-hidden="true" />{{ cmsCopy.copy.text3 }}</NuxtLink>
      </div>
    </section>
  </main>
</template>
</template>

<style scoped>
.design-case-content { padding: 100px 30px 130px; background: #fafafa; }
.design-case-rail { width: min(1410px, 100%); margin-inline: auto; padding-inline: 43px; }
.design-case-layout { display: grid; grid-template-columns: minmax(0, 2fr) minmax(0, 1fr); grid-template-areas: 'title specs' 'images specs' 'story specs'; column-gap: 60px; }
h1 { grid-area: title; margin-bottom: 40px; font-family: var(--font-cjk-serif); font-size: 30px; font-weight: 600; line-height: 40px; }
.design-case-images { grid-area: images; min-width: 0; }
aside { grid-area: specs; min-width: 0; }
h2 { margin-bottom: 25px; font-size: 25px; line-height: 31px; }
dl { border-top: 1px solid #e3e3e8; }
dl > div { display: grid; grid-template-columns: 112px minmax(0, 1fr); gap: 16px; min-height: 55px; padding: 12px 0; align-items: center; border-bottom: 1px solid #e3e3e8; }
dt { color: #9f9fa4; font-size: 15px; }
dd { color: #1c1c1d; font-family: var(--font-cjk-serif); font-weight: 600; overflow-wrap: anywhere; }
article { grid-area: story; margin-top: 62px; color: #59585d; font-size: 16px; line-height: 1.8; }
article p + p { margin-top: 16px; }
.design-case-return { display: inline-flex; align-items: center; gap: 12px; margin-top: 60px; padding: 16px 24px; border: 1px solid #caa05c; border-radius: 99px; color: #1c1c1d; }
@media (max-width: 1024px) { .design-case-content { padding-block: 80px; } .design-case-layout { display: flex; flex-direction: column; gap: 40px; } h1 { margin-bottom: 0; } article { margin-top: 0; } }
@media (max-width: 767px) { .design-case-content { padding: 60px 15px 68px; } .design-case-rail { padding-inline: 0; } h1 { font-size: 25px; line-height: 34px; } }
</style>
