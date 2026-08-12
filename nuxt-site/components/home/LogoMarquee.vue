<script setup lang="ts">
const logos = [
  { name: 'SAKURA', src: '/home-2026/logos/sakura.svg' },
  { name: 'TLK Kitchens', src: '/home-2026/logos/tlk.svg' },
  { name: 'TEKA', src: '/home-2026/logos/teka.svg' },
  { name: 'SVAGO', src: '/home-2026/logos/svago.svg' },
  { name: 'SAKURA Home', src: '/home-2026/logos/sakura-home.png' },
]
</script>

<template>
  <div class="select-none overflow-hidden py-[40px]" role="region" aria-label="集團品牌"><div class="flex w-max animate-marquee"><div v-for="group in 4" :key="group" class="flex shrink-0" :aria-hidden="group > 1 ? true : undefined"><span v-for="logo in logos" :key="logo.name" class="mx-[70px] inline-flex h-[50px] w-[170px] shrink-0 items-center justify-center"><img :src="logo.src" :alt="group === 1 ? logo.name : ''" draggable="false" class="max-h-[50px] w-[170px] object-contain" /></span></div></div></div>
</template>
