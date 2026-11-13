<script setup lang="ts">
const cmsCopy = await useCmsResource('view-pages-design-inspiration-id-', {"copy":{"text1":"此案例尚未提供圖片。","text2":"案例規格","text3":"返回設計靈感"},"cmsSettings":{"visible":true,"seoTitle":"","seoDescription":""}})

import { ArrowLeft, ArrowRight } from 'lucide-vue-next'
import type { DesignCaseDetail } from '~/types/designCloud'

const { copy: galleryCopy } = await useCmsResource('view-pages-gallery-slug-', { copy: { field1: 'https://pse.is/9kq37z', text2: '到店預約' } })

const route = useRoute()
const router = useRouter()
const url = computed(() => `/api/design-inspiration/cases/${encodeURIComponent(String(route.params.id))}`)
const { data: item, error, status, refresh } = await useFetch<DesignCaseDetail>(url,{query:computed(()=>route.query.cmsPreview?{cmsPreview:route.query.cmsPreview,...(route.query.cmsDraft?{cmsDraft:route.query.cmsDraft}:{})}:{})})
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
  <main class="case-detail-page">
    <InternalCaseBreadcrumbHero :design-list-url="listRoute" />
    <section class="case-detail-content">
      <div class="case-detail-rail internal-rail-safe">
        <InternalDesignLoadState :pending="status === 'pending'" :error="error" @retry="refresh()" />
        <div v-if="item && !error && status !== 'pending'" class="case-detail-layout">
          <header class="case-detail-header"><h1><InternalHeadingText :text="item.title" /></h1></header>
          <div class="case-detail-carousel">
            <InternalCaseCarousel v-if="item.images.length" :images="item.images" :title="item.title" />
            <p v-else role="status">{{ cmsCopy.copy.text1 }}</p>
          </div>
          <aside class="case-detail-sidebar">
            <div class="case-detail-sidebar__sticky">
              <a :href="galleryCopy.field1" target="_blank" rel="noopener noreferrer" class="case-detail-booking site-content-cta group/cta">
                <span>{{ galleryCopy.text2 }}</span><span class="site-cta-icon"><ArrowRight aria-hidden="true" /></span>
              </a>
              <section v-if="item.specs.length" class="case-detail-widget" aria-labelledby="design-case-specs-title">
                <h2 id="design-case-specs-title"><InternalHeadingText :text="cmsCopy.copy.text2" /></h2>
                <dl class="case-detail-specs"><div v-for="spec in item.specs" :key="spec.name"><dt>{{ spec.name }}</dt><dd>{{ spec.value }}</dd></div></dl>
              </section>
            </div>
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

<style scoped src="~/assets/css/case-detail-layout.css"></style>

<style scoped>
article { grid-area: story; min-width: 0; margin-top: 62px; font-size: 16px; line-height: 24px; }
article p + p { margin-top: 16px; }
.case-detail-specs dd { overflow-wrap: anywhere; }
.design-case-return { display: inline-flex; align-items: center; gap: 12px; margin-top: 60px; padding: 16px 24px; border: 1px solid #caa05c; border-radius: 99px; color: #1c1c1d; }
@media (max-width: 1024px) { article { order: 4; width: 100%; } }
@media (max-width: 767px) { article { margin-top: 50px; } }
</style>
