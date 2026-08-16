<script setup lang="ts">
const props = withDefaults(defineProps<{
  src: string
  alt: string
  fit?: 'cover' | 'contain'
  errorTitle?: string
}>(), {
  fit: 'contain',
  errorTitle: '型錄素材載入失敗',
})

const failed = ref(false)

watch(() => props.src, () => {
  failed.value = false
})
</script>

<template>
  <div class="product-catalogue-asset" :class="`is-${props.fit}`">
    <img
      v-if="!failed"
      :src="props.src"
      :alt="props.alt"
      loading="lazy"
      decoding="async"
      @error="failed = true"
    >
    <div v-else class="product-catalogue-asset__error" role="alert">
      <strong>{{ props.errorTitle }}</strong>
      <span>{{ props.alt }}</span>
      <code>{{ props.src }}</code>
      <small>請確認素材路徑、檔名與部署後的 public 檔案是否一致。</small>
    </div>
  </div>
</template>

<style scoped>
.product-catalogue-asset,
.product-catalogue-asset img {
  display: block;
  width: 100%;
  height: 100%;
}

.product-catalogue-asset { background: #ececef; }
.product-catalogue-asset img { object-position: center; }
.product-catalogue-asset.is-cover img { object-fit: cover; }
.product-catalogue-asset.is-contain img { object-fit: contain; }

.product-catalogue-asset__error {
  display: flex;
  height: 100%;
  min-height: 260px;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 28px;
  color: #59585d;
  background: #fff4f1;
  text-align: center;
}

.product-catalogue-asset__error strong { color: #9f2f1f; font-size: 18px; }
.product-catalogue-asset__error span { color: #1c1c1d; }
.product-catalogue-asset__error code { max-width: 100%; overflow-wrap: anywhere; color: #9f2f1f; font-size: 12px; }
.product-catalogue-asset__error small { max-width: 330px; line-height: 1.5; }
</style>
