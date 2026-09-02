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
  <div v-bind="$attrs" class="case-image-frame">
    <img
      v-if="!failed"
      :src="src"
      :alt="alt"
      :loading="eager ? 'eager' : 'lazy'"
      :fetchpriority="eager ? 'high' : 'auto'"
      class="h-full w-full object-cover"
      @error="failed = true"
    />
    <div v-else class="case-image-frame__error" role="alert">
      <strong>案例圖片載入失敗</strong>
      <span>{{ alt }}</span>
      <code>{{ src }}</code>
    </div>
  </div>
</template>

<style scoped>
.case-image-frame {
  position: relative;
  overflow: hidden;
  background: #e3e3e8;
}

.case-image-frame__error {
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
  background: #fafafa;
  text-align: center;
}

.case-image-frame__error strong {
  color: #1c1c1d;
  font-family: var(--font-ui);
  font-size: 18px;
  font-weight: 400;
}

.case-image-frame__error span,
.case-image-frame__error code {
  max-width: 100%;
  overflow-wrap: anywhere;
  font-size: 13px;
  line-height: 20px;
}
</style>
