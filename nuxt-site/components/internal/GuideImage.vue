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
  <div v-bind="$attrs" class="guide-image">
    <img
      v-if="!failed"
      :src="src"
      :alt="alt"
      :loading="eager ? 'eager' : 'lazy'"
      :fetchpriority="eager ? 'high' : 'auto'"
      @error="failed = true"
    >
    <div v-else class="guide-image__error" role="alert">
      <strong>廚房裝修指南圖片載入失敗</strong>
      <span>{{ alt }}</span>
      <code>{{ src }}</code>
    </div>
  </div>
</template>

<style scoped>
.guide-image {
  position: relative;
  overflow: hidden;
  background: #e3e3e8;
}

.guide-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform .5s ease;
}

.guide-image__error {
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

.guide-image__error strong {
  color: #1c1c1d;
  font-family: "Cal Sans", sans-serif;
  font-size: 18px;
  font-weight: 400;
}

.guide-image__error span,
.guide-image__error code {
  max-width: 100%;
  overflow-wrap: anywhere;
  font-size: 13px;
  line-height: 20px;
}

@media (prefers-reduced-motion: reduce) {
  .guide-image img { transition: none; }
}
</style>
