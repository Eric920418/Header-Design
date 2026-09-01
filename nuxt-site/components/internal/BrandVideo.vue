<script setup lang="ts">
import { Play } from 'lucide-vue-next'

const props = withDefaults(defineProps<{
  cover?: string
  aspect?: string
  flat?: boolean
  alt?: string
  autoplay?: boolean
}>(), {
  cover: '',
  aspect: '16 / 9',
  flat: false,
  alt: 'SAKURA 品牌承諾影片縮圖',
  autoplay: false,
})

const videoId = 'wH374AF9wLI'
const state = ref<'idle' | 'loading' | 'playing' | 'error'>(props.autoplay ? 'loading' : 'idle')
let timeout: ReturnType<typeof setTimeout> | undefined

const startTimeout = () => {
  if (import.meta.client) {
    timeout = setTimeout(() => {
      if (state.value === 'loading') state.value = 'error'
    }, 12000)
  }
}

const play = () => {
  state.value = 'loading'
  startTimeout()
}

const loaded = () => {
  if (timeout) clearTimeout(timeout)
  state.value = 'playing'
}

const failed = () => {
  if (timeout) clearTimeout(timeout)
  state.value = 'error'
}

onMounted(() => props.autoplay && startTimeout())
onBeforeUnmount(() => timeout && clearTimeout(timeout))
</script>

<template>
  <div
    class="group relative overflow-hidden rounded-[24px] bg-[#1C1C1D]"
    :class="{ 'shadow-[0_28px_80px_-30px_rgba(0,0,0,.55)]': !flat }"
    :style="{ aspectRatio: aspect }"
  >
    <template v-if="state === 'idle'">
      <img :src="cover || `https://i.ytimg.com/vi/${videoId}/maxresdefault.jpg`" :alt="alt" class="h-full w-full object-cover" @error="failed" />
      <button type="button" aria-label="播放 SAKURA 品牌承諾影片" class="antra-source-video-popup" @click="play">
        <span class="antra-source-video-popup__radar" aria-hidden="true" />
        <Play class="relative ml-1 h-7 w-7 fill-current sm:h-8 sm:w-8" />
      </button>
    </template>
    <template v-else-if="state === 'loading' || state === 'playing'">
      <iframe :src="`https://www.youtube-nocookie.com/embed/${videoId}?autoplay=1&rel=0`" title="SAKURA 品牌承諾影片" class="absolute inset-0 h-full w-full" allow="autoplay; encrypted-media; picture-in-picture; fullscreen" allowfullscreen @load="loaded" @error="failed" />
      <div v-if="state === 'loading'" class="pointer-events-none absolute inset-0 flex items-center justify-center bg-[#1C1C1D] text-white"><span class="h-10 w-10 animate-spin rounded-full border-2 border-white/30 border-t-[#CAA05C]" /><span class="sr-only">影片載入中</span></div>
    </template>
    <div v-else role="alert" class="absolute inset-0 flex flex-col items-center justify-center bg-[#1C1C1D] px-6 text-center text-white">
      <p class="text-lg font-medium">影片載入失敗</p>
      <p class="mt-2 max-w-md text-sm leading-6 text-white/70">無法載入 YouTube 影片（ID：{{ videoId }}）。可能是網路或瀏覽器隱私設定阻擋。</p>
      <a :href="`https://www.youtube.com/watch?v=${videoId}`" target="_blank" rel="noopener noreferrer" class="mt-5 rounded-full border border-[#CAA05C] px-5 py-2.5 text-sm text-[#CAA05C]">前往 YouTube 觀看</a>
    </div>
  </div>
</template>

<style scoped>
.antra-source-video-popup {
  position: absolute;
  top: 50%;
  left: 50%;
  z-index: 10;
  display: inline-flex;
  width: 80px;
  height: 80px;
  align-items: center;
  justify-content: center;
  transform: translate(-50%, -50%);
  border: 1px solid rgb(255 255 255 / 11%);
  border-radius: 100%;
  background: rgb(255 255 255 / 36%);
  color: #fff;
  backdrop-filter: blur(29px);
}

.antra-source-video-popup__radar {
  position: absolute;
  inset: 0;
  z-index: -1;
  border-radius: 200%;
  box-shadow: 0 0 0 1px #fff;
  animation: antra-video-radar 2s infinite;
  pointer-events: none;
}

@keyframes antra-video-radar {
  0% { opacity: 1; transform: scale(1); }
  100% { opacity: 0; transform: scale(1.5); }
}

@media (min-width: 768px) {
  .antra-source-video-popup {
    width: 96px;
    height: 96px;
  }
}

@media (prefers-reduced-motion: reduce) {
  .antra-source-video-popup__radar { animation: none; }
}
</style>
