<script setup lang="ts">
import { KITCHEN_SERIES_PAGES } from '~/data/kitchenSeries'

definePageMeta({ key: route => route.path })
const route = useRoute()
const data = KITCHEN_SERIES_PAGES.find(series => series.slug === route.params.slug)
if (!data) throw createError({ statusCode: 404, statusMessage: '品牌系列不存在', fatal: true })
</script>

<template>
  <InternalKitchenSeriesPage v-if="data" :key="data.slug" :data="data" />
</template>
