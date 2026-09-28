<script setup lang="ts">
import { isProductBrand } from '~/data/productBrands'
definePageMeta({ key: route => route.path })
const brand = useRoute().params.brand
if (!isProductBrand(brand)) throw createError({ statusCode: 404, message: '找不到指定的產品品牌', fatal: true })
</script>
<template><InternalProductBrandPage :brand="brand" /></template>
