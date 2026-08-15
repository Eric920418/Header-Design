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
watch(() => props.src, () => { failed.value = false })
</script>

<template>
  <div v-bind="$attrs" class="builder-image" :class="`builder-image--${fit}`">
    <img
      v-if="!failed"
      :src="src"
      :alt="alt"
      :loading="eager ? 'eager' : 'lazy'"
      :fetchpriority="eager ? 'high' : 'auto'"
      @error="failed = true"
    />
    <div v-else class="builder-image__error" role="alert">
      <strong>建商專區圖片載入失敗</strong>
      <span>{{ alt }}</span>
      <code>{{ src }}</code>
      <small>請確認 PPT 正式素材已放入 public/section-6/builders，且部署時保留原檔名。</small>
    </div>
  </div>
</template>

<style scoped>
.builder-image,
.builder-image img { display: block; width: 100%; height: 100%; }
.builder-image { position: relative; overflow: hidden; background: #e3e3e8; }
.builder-image img { object-position: center; transition: transform .55s ease; }
.builder-image--cover img { object-fit: cover; }
.builder-image--contain img { object-fit: contain; }

.builder-image__error {
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
  background: #fff4f1;
  text-align: center;
}

.builder-image__error strong { color: #9f2f1f; font-family: "Cal Sans", sans-serif; font-size: 18px; font-weight: 400; }
.builder-image__error span,
.builder-image__error code { max-width: 100%; overflow-wrap: anywhere; font-size: 13px; line-height: 20px; }
.builder-image__error code { color: #9f2f1f; }
.builder-image__error small { max-width: 420px; line-height: 1.5; }

@media (prefers-reduced-motion: reduce) {
  .builder-image img { transition: none; }
}
</style>
