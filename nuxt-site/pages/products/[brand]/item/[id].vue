<script setup lang="ts">
import { isProductBrand } from '~/data/productBrands'
definePageMeta({ key: route => route.path })
const route = useRoute()
const brand = route.params.brand
if (!isProductBrand(brand)) throw createError({ statusCode: 404, message: '找不到指定的產品品牌', fatal: true })
const identifier = String(route.params.id)
</script>
<template><InternalProductDetailPage :brand="brand" :identifier="identifier" /></template>
