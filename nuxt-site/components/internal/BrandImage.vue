<script setup lang="ts">
defineOptions({ inheritAttrs: false })

const props = withDefaults(defineProps<{
  src: string
  alt: string
  eager?: boolean
  fit?: 'cover' | 'contain'
}>(), {
  eager: false,
  fit: 'cover',
})

const failed = ref(false)
const emit = defineEmits<{ error: [] }>()
watch(() => props.src, () => { failed.value = false })

function handleError() {
  failed.value = true
  emit('error')
}
</script>

<template>
  <div v-bind="$attrs" class="brand-image-frame">
    <img
      v-if="!failed"
      :src="src"
      :alt="alt"
      :loading="eager ? 'eager' : 'lazy'"
      :fetchpriority="eager ? 'high' : 'auto'"
      :class="fit === 'contain' ? 'object-contain' : 'object-cover'"
      class="h-full w-full"
      @error="handleError"
    />
    <div v-else role="alert" class="brand-image-error">
      <strong>品牌頁面圖片載入失敗</strong>
      <span>{{ alt }}</span>
      <code>{{ src }}</code>
    </div>
  </div>
</template>

<style scoped>
.brand-image-frame { position: relative; overflow: hidden; background: #e3e3e8; }
.brand-image-error {
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
.brand-image-error strong { color: #1c1c1d; font-family: "Cal Sans", sans-serif; font-size: 18px; font-weight: 400; }
.brand-image-error span,
.brand-image-error code { max-width: 100%; overflow-wrap: anywhere; font-size: 13px; line-height: 20px; }
</style>
