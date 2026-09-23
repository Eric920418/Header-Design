<script setup lang="ts">
const props = defineProps<{ src: string; alt: string }>()
const failed = ref(false)
const image = ref<HTMLImageElement>()
onMounted(() => {
  // SSR images can fail before Vue attaches the error listener.
  if (image.value?.complete && image.value.naturalWidth === 0) failed.value = true
})
watch(() => props.src, () => { failed.value = false })
</script>

<template>
  <div v-if="failed" class="cms-image-error" role="alert">圖片載入失敗：{{ alt }}<br />{{ src }}</div>
  <img v-else ref="image" :src="src" :alt="alt" @error="failed = true" />
</template>
