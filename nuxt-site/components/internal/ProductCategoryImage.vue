<script setup lang="ts">
const props = defineProps<{
  src: string
  alt: string
}>()

const failed = ref(false)

watch(() => props.src, () => {
  failed.value = false
})
</script>

<template>
  <img
    v-if="!failed"
    :src="src"
    :alt="alt"
    loading="lazy"
    decoding="async"
    @error="failed = true"
  >
  <span v-else class="product-category-image-error" role="alert">
    <strong>商品分類圖片載入失敗</strong>
    <span>{{ alt }}</span>
    <code>{{ src }}</code>
  </span>
</template>

<style scoped>
img {
  display: block;
  width: 100%;
  height: 100%;
  object-fit: contain;
}

.product-category-image-error {
  display: flex;
  width: 100%;
  height: 100%;
  min-height: 220px;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  gap: 8px;
  padding: 24px;
  color: #1c1c1d;
  background: #fff;
  text-align: center;
}

.product-category-image-error strong { color: #caa05c; font-weight: 700; }
.product-category-image-error span { font-size: 14px; }
.product-category-image-error code { max-width: 100%; overflow-wrap: anywhere; color: #59585d; font-size: 11px; }
</style>
