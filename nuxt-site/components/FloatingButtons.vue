<script setup lang="ts">
const cmsCopy = await useCmsResource('view-components-FloatingButtons', {"primaryItem":{"href":"/design-inspiration","icon":"/floating-icons/case.png","label":"設計案例"},"serviceItems":[{"href":"https://www.sakura-kitchenlife.com.tw/measuring","icon":"/floating-icons/official-quick-link-2.svg","label":"到府丈量","newTab":true},{"href":"https://icare.sakura.com.tw","icon":"/floating-icons/official-quick-link-3.svg","label":"線上客服","newTab":true}],"copy":{"field1":"","field2":"","field3":"拍立配連結待提供","field4":"/floating-icons/pailipei.svg","field5":""},"cmsSettings":{"visible":true,"seoTitle":"","seoDescription":""}})

const primaryItem = cmsCopy.primaryItem

const serviceItems = cmsCopy.serviceItems

const rail = ref<HTMLElement | null>(null)
const offset = ref(0)
const RAIL_BOTTOM_PX = 88
const reduced = useReducedMotion()
let frame = 0

const update = () => {
  if (!rail.value || reduced.value) { offset.value = 0; return }
  const maxScroll = Math.max(1, document.documentElement.scrollHeight - window.innerHeight)
  const progress = Math.min(1, window.scrollY / maxScroll)
  const railHeight = rail.value.offsetHeight
  const startTop = window.innerHeight - railHeight - RAIL_BOTTOM_PX
  const endTop = 112
  offset.value = Math.min(0, (endTop - startTop) * progress)
}

const requestUpdate = () => {
  cancelAnimationFrame(frame)
  frame = requestAnimationFrame(update)
}

onMounted(() => {
  update()
  window.addEventListener('scroll', requestUpdate, { passive: true })
  window.addEventListener('resize', requestUpdate)
})
onBeforeUnmount(() => {
  cancelAnimationFrame(frame)
  window.removeEventListener('scroll', requestUpdate)
  window.removeEventListener('resize', requestUpdate)
})
useHead(() => ({ ...(cmsCopy.cmsSettings.seoTitle ? {title:cmsCopy.cmsSettings.seoTitle}:{}), meta: cmsCopy.cmsSettings.seoDescription ? [{name:'description',content:cmsCopy.cmsSettings.seoDescription}] : [] }))
</script>

<template>
  <template v-if="cmsCopy.cmsSettings.visible">
  <div class="mobile-service-spacer" aria-hidden="true" />
  <aside ref="rail" aria-label="快速服務" class="floating-buttons fixed right-0 z-[90]" :style="{ bottom: `${RAIL_BOTTOM_PX}px`, transform: `translateY(${offset}px)` }">
    <a :href="primaryItem.href" :aria-label="primaryItem.label" class="floating-primary relative mb-5 block h-[72px] w-[72px] bg-[#B79258] text-white sm:h-[74px] sm:w-[74px]">
      <img :src="primaryItem.icon" :alt="cmsCopy.copy.field1" class="absolute top-[13px] left-1/2 h-[29px] w-[29px] -translate-x-1/2 sm:top-[14px] sm:h-[30px] sm:w-[30px]" />
      <span class="absolute inset-x-0 bottom-[11px] block whitespace-nowrap text-center font-['Noto_Sans_TC'] text-xs leading-3 sm:bottom-3">{{ primaryItem.label }}</span>
    </a>
    <div class="floating-services bg-[#737373]">
      <template v-for="(item, index) in serviceItems" :key="item.label">
        <div v-if="index" aria-hidden="true" class="h-px w-full bg-white/50" />
        <a :href="item.href" :aria-label="item.label" :target="item.newTab ? '_blank' : undefined" :rel="item.newTab ? 'noopener noreferrer' : undefined" class="block p-2">
          <picture>
            <source v-if="item.icon === '/floating-icons/official-quick-link-2.svg'" media="(max-width: 767px)" srcset="/floating-icons/official-quick-link-2-mobile.svg" />
            <img :src="item.icon" :alt="cmsCopy.copy.field2" class="block w-14 sm:w-[58px]" />
          </picture>
        </a>
      </template>
      <a href="https://sakura-ai-one.vercel.app/consumer?entry=official" target="_blank" rel="noopener noreferrer" aria-label="拍立配（另開分頁）" class="flex h-[72px] w-[72px] items-center justify-center border-t border-white/50 sm:h-[74px] sm:w-[74px]"><img :src="cmsCopy.copy.field4" :alt="cmsCopy.copy.field5" class="block h-[70px] w-[70px]" /></a>
    </div>
  </aside>
</template>
</template>

<style scoped>
.mobile-service-spacer { height: var(--mobile-service-clearance, 0px); }
@media (max-width: 767px) {
  .floating-buttons {
    left: 0;
    bottom: 0 !important;
    /* Desktop scroll-following must not move the mobile service bar. */
    transform: none !important;
    padding-bottom: env(safe-area-inset-bottom, 0px);
    background: #B79258;
    box-shadow: 0 -2px 12px rgb(0 0 0 / 12%);
  }
  .floating-primary { display: none; }
  .floating-services { display: flex; background: #B79258; color: white; }
  .floating-services > div { width: 1px; height: auto; }
  .floating-services > a {
    display: flex;
    flex: 1;
    min-width: 0;
    height: 72px;
    align-items: center;
    justify-content: center;
    padding: 4px;
    border-top: 0;
  }
  .floating-services > a:last-child { border-left: 1px solid rgb(255 255 255 / 50%); }
  .floating-services img { width: 64px; height: 64px; object-fit: contain; }
  .floating-services a:focus-visible { outline: 2px solid white; outline-offset: -4px; }
}
</style>
