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
  <div v-bind="$attrs" class="franchise-image" :class="`franchise-image--${fit}`">
    <img
      v-if="!failed"
      :src="src"
      :alt="alt"
      :loading="eager ? 'eager' : 'lazy'"
      :fetchpriority="eager ? 'high' : 'auto'"
      @error="failed = true"
    />
    <div v-else class="franchise-image__error" role="alert">
      <strong>加盟專區圖片載入失敗</strong>
      <span>{{ alt }}</span>
      <code>{{ src }}</code>
      <small>請確認 PPT 正式素材已放入 public/section-6/franchise，且部署時保留原檔名。</small>
    </div>
  </div>
</template>

<style scoped>
.franchise-image,
.franchise-image img { display: block; width: 100%; height: 100%; }
.franchise-image { position: relative; overflow: hidden; background: #e3e3e8; }
.franchise-image img { object-position: center; transition: transform .55s ease; }
.franchise-image--cover img { object-fit: cover; }
.franchise-image--contain img { object-fit: contain; }

.franchise-image__error {
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

.franchise-image__error strong { color: #9f2f1f; font-family: "Cal Sans", sans-serif; font-size: 18px; font-weight: 400; }
.franchise-image__error span,
.franchise-image__error code { max-width: 100%; overflow-wrap: anywhere; font-size: 13px; line-height: 20px; }
.franchise-image__error code { color: #9f2f1f; }
.franchise-image__error small { max-width: 420px; line-height: 1.5; }

@media (prefers-reduced-motion: reduce) {
  .franchise-image img { transition: none; }
}
</style>
