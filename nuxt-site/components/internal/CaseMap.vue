<script setup lang="ts">
const props = defineProps<{
  address: string
  fallbackUrl: string
  storeName: string
}>()

const loaded = ref(false)
const errorMessage = ref('')
let timer: ReturnType<typeof setTimeout> | undefined

const embedUrl = computed(() =>
  `https://www.google.com/maps?q=${encodeURIComponent(props.address)}&output=embed`,
)

const startTimeout = () => {
  loaded.value = false
  errorMessage.value = ''
  if (timer) clearTimeout(timer)
  timer = setTimeout(() => {
    if (!loaded.value) {
      errorMessage.value = `Google Maps 在 12 秒內沒有完成載入。門市地址：${props.address}`
    }
  }, 12000)
}

const markLoaded = () => {
  loaded.value = true
  errorMessage.value = ''
  if (timer) clearTimeout(timer)
}

watch(embedUrl, startTimeout)
onMounted(startTimeout)
onBeforeUnmount(() => { if (timer) clearTimeout(timer) })
</script>

<template>
  <div class="case-map">
    <div class="case-map__viewport">
      <iframe
        :src="embedUrl"
        :title="`${storeName} Google 地圖`"
        loading="lazy"
        allowfullscreen
        referrerpolicy="no-referrer-when-downgrade"
        @load="markLoaded"
      />
      <div v-if="!loaded && !errorMessage" class="case-map__loading" role="status">Google Maps 載入中…</div>
      <div v-if="errorMessage" class="case-map__error" role="alert">
        <strong>地圖載入失敗</strong>
        <p>{{ errorMessage }}</p>
      </div>
    </div>
    <a :href="fallbackUrl" target="_blank" rel="noopener noreferrer" class="case-map__fallback">前往 Google Maps 查看完整位置</a>
  </div>
</template>

<style scoped>
.case-map__viewport {
  position: relative;
  height: 300px;
  overflow: hidden;
  border-radius: 24px;
  background: #e3e3e8;
}

.case-map iframe {
  width: 100%;
  height: 100%;
  border: 0;
}

.case-map__loading,
.case-map__error {
  position: absolute;
  display: grid;
  inset: 0;
  place-content: center;
  padding: 30px;
  color: #59585d;
  background: #f6f6f6;
  text-align: center;
}

.case-map__error { gap: 10px; }
.case-map__error strong { color: #1c1c1d; font-family: var(--font-ui); font-size: 20px; font-weight: 400; }
.case-map__error p { font-size: 14px; line-height: 22px; }

.case-map__fallback {
  display: inline-block;
  margin-top: 13px;
  color: #59585d;
  font-size: 14px;
  line-height: 22px;
  text-decoration: underline;
  text-underline-offset: 4px;
  transition: color .3s ease;
}

.case-map__fallback:hover { color: #caa05c; }
</style>
