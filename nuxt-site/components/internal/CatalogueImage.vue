<script setup lang="ts">
const props = defineProps<{
  src: string
  alt: string
}>()

const failed = ref(false)
</script>

<template>
  <div class="catalogue-image" :class="{ 'is-error': failed }">
    <img v-if="!failed" :src="props.src" :alt="props.alt" loading="lazy" @error="failed = true">
    <div v-else class="catalogue-image__error" role="status">
      <strong>品牌系列型錄圖片載入失敗</strong>
      <span>{{ props.alt }}</span>
      <code>{{ props.src }}</code>
      <small>請確認素材路徑、檔名與部署後的 public 檔案是否一致。</small>
    </div>
  </div>
</template>

<style scoped>
.catalogue-image,
.catalogue-image img {
  display: block;
  width: 100%;
  height: 100%;
}

.catalogue-image { background: #e3e3e8; }
.catalogue-image img { object-fit: cover; object-position: center; }

.catalogue-image__error {
  display: flex;
  height: 100%;
  min-height: 280px;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 28px;
  color: #59585d;
  background: #fff4f1;
  text-align: center;
}

.catalogue-image__error strong { color: #9f2f1f; font-size: 18px; }
.catalogue-image__error span { color: #1c1c1d; }
.catalogue-image__error code { max-width: 100%; overflow-wrap: anywhere; color: #9f2f1f; font-size: 12px; }
.catalogue-image__error small { max-width: 330px; line-height: 1.5; }
</style>
