<script setup lang="ts">
const cmsCopy = await useCmsResource('view-components-home-LogoMarquee', {"logos":[{"name":"SAKURA","src":"/home-2026/logos/sakura.svg","to":"/products/sakura"},{"name":"TEKA","src":"/home-2026/logos/teka.svg","to":"/products/teka"},{"name":"SVAGO","src":"/home-2026/logos/svago.svg","to":"/products/svago"},{"name":"SAKURA KITCHEN","src":"/home-2026/logos/sakura-kitchen-horizontal.svg","to":"/home-style/aikitchen"}],"cmsSettings":{"visible":true,"seoTitle":"","seoDescription":""}})

import { NuxtLink } from '#components'

const logos = cmsCopy.logos
useHead(() => ({ ...(cmsCopy.cmsSettings.seoTitle ? {title:cmsCopy.cmsSettings.seoTitle}:{}), meta: cmsCopy.cmsSettings.seoDescription ? [{name:'description',content:cmsCopy.cmsSettings.seoDescription}] : [] }))
</script>

<template>
  <template v-if="cmsCopy.cmsSettings.visible">
  <div class="select-none overflow-hidden py-[40px]" role="region" aria-label="集團品牌"><div class="flex w-max animate-marquee"><div v-for="group in 5" :key="group" class="flex shrink-0" :aria-hidden="group > 1 ? true : undefined"><component :is="logo.to ? NuxtLink : 'span'" v-for="logo in logos" :key="logo.name" :to="logo.to || undefined" :tabindex="group > 1 ? -1 : undefined" class="inline-flex h-[50px] w-[310px] shrink-0 items-center justify-center px-[70px]" :class="logo.to ? 'cursor-pointer' : ''"><img :src="logo.src" :alt="group === 1 ? logo.name : ''" draggable="false" class="max-h-[50px] w-[170px] object-contain" /></component></div></div></div>
</template>
</template>
