<script setup lang="ts">
definePageMeta({ key: route => route.path })
const identifier = `model:${String(useRoute().params.product)}`
</script>
<template><InternalProductDetailPage brand="sakura" :identifier="identifier" /></template>
