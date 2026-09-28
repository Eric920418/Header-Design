<script setup lang="ts">
import { isProductBrand } from '~/data/productBrands'
definePageMeta({ key: route => route.path })
const route = useRoute()
const brand = route.params.brand
if (!isProductBrand(brand)) throw createError({ statusCode: 404, message: '找不到指定的產品品牌', fatal: true })
if (!/^[1-9]\d{0,8}$/.test(String(route.params.category))) throw createError({ statusCode: 400, message: '分類 ID 不正確', fatal: true })
const category = Number(route.params.category)
</script>
<template><InternalProductListPage :brand="brand" :category="category" /></template>
