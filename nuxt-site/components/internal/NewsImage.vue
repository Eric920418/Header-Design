<script setup lang="ts">
defineOptions({ inheritAttrs: false })

const props = withDefaults(defineProps<{
  src: string
  alt: string
  eager?: boolean
}>(), {
  eager: false,
})

const failed = ref(false)
watch(() => props.src, () => { failed.value = false })
</script>

<template>
  <div v-bind="$attrs" class="antra-news-image">
    <img
      v-if="!failed"
      :src="src"
      :alt="alt"
      :loading="eager ? 'eager' : 'lazy'"
      :fetchpriority="eager ? 'high' : 'auto'"
      @error="failed = true"
    />
    <div v-else class="antra-news-image__error" role="alert">
      <strong>優惠消息圖片載入失敗</strong>
      <span>{{ alt }}</span>
      <code>{{ src }}</code>
    </div>
  </div>
</template>

<style scoped>
.antra-news-image {
  position: relative;
  overflow: hidden;
  background: #e3e3e8;
}

.antra-news-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform .5s ease;
}

.antra-news-image__error {
  display: flex;
  width: 100%;
  height: 100%;
  min-height: 180px;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 24px;
  color: #59585d;
  background: #f6f6f6;
  text-align: center;
}

.antra-news-image__error strong {
  color: #1c1c1d;
  font-family: "Cal Sans", sans-serif;
  font-size: 18px;
  font-weight: 400;
}

.antra-news-image__error span,
.antra-news-image__error code {
  max-width: 100%;
  overflow-wrap: anywhere;
  font-size: 13px;
  line-height: 20px;
}

@media (prefers-reduced-motion: reduce) {
  .antra-news-image img { transition: none; }
}
</style>
