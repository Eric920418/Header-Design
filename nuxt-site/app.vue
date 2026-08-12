<script setup lang="ts">
useHead({
  titleTemplate: title => title ? `${title}` : 'SAKURA 整體廚房',
  meta: [
    { name: 'format-detection', content: 'telephone=no' },
    { property: 'og:site_name', content: 'SAKURA 整體廚房' },
  ],
})
</script>

<template>
  <NuxtLayout>
    <NuxtPage />
  </NuxtLayout>
</template>
