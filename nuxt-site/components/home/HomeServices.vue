<script setup lang="ts">
const cmsCopy = await useCmsResource('view-components-home-HomeServices', {"services":[{"n":"01","img":"/services/sakura-product.png","logo":"/services/sakura-logo-white.png","alt":"SAKURA","logoClass":"h-[24px] sm:h-[26px] antra:h-[28px]","captionTop":false,"excerpt":"享受智能 樂在生活 以科技預判需求，讓廚衛設備主動貼心 成就更輕鬆的便利生活廚房空間"},{"n":"02","img":"/services/svago-product.png","logo":"/services/svago-logo-white.png","alt":"SVAGO","logoClass":"h-[31px] sm:h-[35px] antra:h-[38px]","captionTop":true,"excerpt":"歐洲品牌 高質感美學 台灣櫻花獨家銷售 設計師好評推薦 引領歐式廚房美學 享樂高效料理生活"},{"n":"03","img":"/services/teka-product.png","logo":"/services/teka-logo-white.svg","alt":"TEKA","logoClass":"h-[32px] sm:h-[36px] antra:h-[39px]","captionTop":false,"excerpt":"德國百年品味不凡 全球知名歐洲廚房電器製造商 秉承德系精工品質 全球累計超過1億家庭使用"}],"copy":{"text1":"廚房","text2":"產品","field3":""},"cmsSettings":{"visible":true,"seoTitle":"","seoDescription":""}})

import { NuxtLink } from '#components'
import emblaCarouselVue from 'embla-carousel-vue'

const services = cmsCopy.services
const [emblaRef, emblaApi] = emblaCarouselVue({ loop: true, align: 'start' })
const paused = ref(false)
const reduced = useReducedMotion()
let timer: ReturnType<typeof setInterval> | undefined
watch([emblaApi, reduced], ([api, isReduced]) => {
  if (timer) clearInterval(timer)
  if (api && !isReduced) timer = setInterval(() => { if (!paused.value) api.scrollNext() }, 4000)
}, { immediate: true })
onBeforeUnmount(() => timer && clearInterval(timer))
useHead(() => ({ ...(cmsCopy.cmsSettings.seoTitle ? {title:cmsCopy.cmsSettings.seoTitle}:{}), meta: cmsCopy.cmsSettings.seoDescription ? [{name:'description',content:cmsCopy.cmsSettings.seoDescription}] : [] }))
</script>

<template>
  <template v-if="cmsCopy.cmsSettings.visible">
  <section aria-labelledby="services-heading" class="relative overflow-hidden bg-[var(--cms-image-asset_73c853de, url('/services/h6-bg-2.jpg'))] bg-cover bg-top bg-no-repeat px-[15px] pt-[60px] min-[768px]:px-[30px] min-[768px]:pt-[80px] min-[1025px]:pt-[100px] min-[1201px]:pt-[125px]">
    <div aria-hidden class="absolute inset-0 bg-black/[.76]" />
    <div class="relative z-10 mx-auto max-w-[1410px]">
      <div class="home-services-heading relative mx-auto mb-[30px] grid max-w-[1410px] grid-cols-1 min-[768px]:mb-[60px] min-[768px]:grid-cols-[30%_70%]">
        <InternalTemplateHeadingRail v-reveal="{ anim: 'opalMoveRight' }" label="KITCHEN PRODUCTS" tone="dark" source="home6" class="home-services-heading__rail" />
        <div v-reveal="{ anim: 'opalMoveLeft', delay: 100 }" class="home-services-heading__copy">
          <h2 id="services-heading" class="w-full max-w-[769px] text-center font-cjk-serif text-[30px] font-semibold leading-[1.2] tracking-[.02em] text-white min-[768px]:text-left min-[768px]:text-[45px] min-[881px]:text-[60px]">{{ cmsCopy.copy.text1 }}<span class="text-[#CAA05C]">{{ cmsCopy.copy.text2 }}</span></h2>
        </div>
      </div>
      <div ref="emblaRef" class="cursor-grab overflow-hidden active:cursor-grabbing" @focusin="paused = true" @focusout="paused = false"><div class="-ml-[30px] flex">
        <div v-for="(service, index) in services" :key="service.n" v-reveal="{ anim: 'opalMoveUp', delay: index * 100 }" class="min-w-0 flex-[0_0_100%] pl-[30px] min-[768px]:flex-[0_0_50%] min-[1201px]:flex-[0_0_33.333%]">
          <component :is="NuxtLink" :to="`/products/${service.alt.toLowerCase()}`" class="group/svc flex flex-col overflow-hidden rounded-[24px] bg-white p-[10px]" :class="service.captionTop ? 'min-[569px]:flex-col-reverse' : ''">
            <div class="relative h-[250px] overflow-hidden rounded-[24px] md:h-[310px]"><img :src="service.img" :alt="service.alt" draggable="false" class="h-full w-full object-cover transition-transform duration-300 group-hover/svc:scale-110" /><span class="absolute inset-0 bg-black/[.11]" /></div>
            <div class="services-card-caption px-0 pb-[30px] pt-[20px] min-[768px]:px-[20px] min-[768px]:pb-[35px] min-[768px]:pt-[30px]"><div class="flex items-start justify-between"><h3 :aria-label="service.alt" class="mr-[30px] flex flex-1 items-center min-[768px]:mr-[10px] min-[881px]:mr-[30px] min-[1201px]:mr-[80px]"><img :src="service.logo" :alt="cmsCopy.copy.field3" :class="service.logoClass" class="max-w-full shrink-0 brightness-0 opacity-[.89]" /></h3><span class="font-display text-[30px] leading-none text-[#E3E3E8]">{{ service.n }}</span></div><p class="mr-[72px] mt-[10px] text-[16px] leading-[24px] text-[#59585D] min-[768px]:mr-[70px] min-[768px]:mt-[23px]">{{ service.excerpt }}</p></div>
          </component>
        </div>
      </div></div>
    </div>
    <div class="relative z-10 -mx-[15px] mt-24 border-t border-white/20 md:-mx-[30px]"><HomeLogoMarquee /></div>
  </section>
</template>
</template>

<style scoped>
@media (min-width: 768px) {
  .home-services-heading__rail {
    grid-column: 1 / -1;
    grid-row: 1;
  }

  .home-services-heading__copy {
    z-index: 1;
    grid-column: 2;
    grid-row: 1;
    padding-top: 38px;
  }
}

@media (min-width: 768px) and (max-width: 880px) {
  .home-services-heading {
    grid-template-columns: 1fr;
  }

  .home-services-heading__rail,
  .home-services-heading__copy {
    grid-column: 1;
  }

  .home-services-heading__rail {
    grid-row: 1;
  }

  .home-services-heading__copy {
    grid-row: 2;
    padding-top: 30px;
  }

  .home-services-heading__copy h2 {
    margin-inline: auto;
    text-align: center;
  }
}
</style>
