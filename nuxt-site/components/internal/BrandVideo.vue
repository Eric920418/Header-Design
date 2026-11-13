<script setup lang="ts">
const cmsVisuals=await useCmsResource('site-visuals',{"images":{"asset_7692def0":"/section-3/store-songzhu.jpg","asset_7a7fece6":"/section-6/franchise/antra-original/h5-bg1.png","asset_39582b0b":"/section-6/franchise/antra-original/h5-bg02.png","asset_18ed1982":"/section-6/franchise/antra-original/h1-bg01.png","asset_52e702e4":"/section-6/franchise/antra-original/h1-bg01-1.png","asset_d0922f9d":"/section-6/franchise/antra-original/h1-bg02.png","asset_82b9dd3e":"/section-6/franchise/antra-original/h1-bg05.png","asset_38bb39f2":"/section-6/franchise/antra-original/h6-bg-3.png","asset_b3dcb152":"/section-6/builders/builder-hero.jpg","asset_1795db00":"/section-6/franchise/hero-store.jpg","asset_98d304fd":"/section-3/service-process/breadcrumb-df.jpg","asset_44761f00":"/section-5/brand-pavilion/pavilion-taichung.jpg","asset_9b0c0f62":"/home-2026/footer/kitchen-background.webp","asset_73c853de":"/services/h6-bg-2.jpg","asset_809f4bbe":"/section-3/store-chengde.jpg","asset_daa09d8d":"/section-5/brand-pavilion/banner.jpg","asset_10b5a86c":"/home-2026/brand-commitment-opening-frame.webp"},"brandVideoId":"wH374AF9wLI","franchiseVideoId":"sAuAjtpvZYk"})

import { Play } from 'lucide-vue-next'

const props = withDefaults(defineProps<{
  cover?: string
  aspect?: string
  flat?: boolean
  alt?: string
  autoplay?: boolean
  comingSoon?: boolean
  src?: string
  title?: string
}>(), {
  cover: '',
  aspect: '16 / 9',
  flat: false,
  alt: 'SAKURA 品牌承諾影片縮圖',
  autoplay: false,
  comingSoon: false,
  src: '',
  title: 'SAKURA 品牌承諾影片',
})

const videoId = cmsVisuals.brandVideoId
const state = ref<'idle' | 'loading' | 'playing' | 'error'>(props.autoplay ? 'loading' : 'idle')
const nativeVideo = ref<HTMLVideoElement | null>(null)
const playbackError = ref('')
let timeout: ReturnType<typeof setTimeout> | undefined

const startTimeout = () => {
  if (import.meta.client) {
    timeout = setTimeout(() => {
      if (state.value === 'loading') state.value = 'error'
    }, 12000)
  }
}

const play = () => {
  playbackError.value = ''
  state.value = 'loading'
  startTimeout()
  if (props.src && nativeVideo.value) {
    if (nativeVideo.value.error) nativeVideo.value.load()
    nativeVideo.value.play().catch(error => {
      playbackError.value = error instanceof Error ? error.message : String(error)
      failed()
    })
  }
}

const loaded = () => {
  if (timeout) clearTimeout(timeout)
  state.value = 'playing'
}

const failed = () => {
  if (timeout) clearTimeout(timeout)
  nativeVideo.value?.pause()
  state.value = 'error'
}

const nativeFailed = () => {
  const error = nativeVideo.value?.error
  playbackError.value = error ? `播放錯誤 ${error.code}：${error.message || '影片連線、格式或解碼失敗。'}` : '無法載入影片。'
  failed()
}

onMounted(() => props.autoplay && (props.src ? play() : startTimeout()))
onBeforeUnmount(() => timeout && clearTimeout(timeout))
</script>

<template>
  <div
    class="group relative overflow-hidden rounded-[24px] bg-[#1C1C1D]"
    :class="{ 'shadow-[0_28px_80px_-30px_rgba(0,0,0,.55)]': !flat }"
    :style="{ aspectRatio: aspect }"
  >
    <video
      v-if="src"
      v-show="state !== 'idle' && state !== 'error'"
      ref="nativeVideo"
      :src="src"
      :poster="cover"
      :aria-label="title"
      controls
      playsinline
      preload="none"
      class="absolute inset-0 h-full w-full object-contain"
      @playing="loaded"
      @error="nativeFailed"
    />
    <template v-if="state === 'idle'">
      <img :src="cover || `https://i.ytimg.com/vi/${videoId}/maxresdefault.jpg`" :alt="alt" class="h-full w-full object-cover" @error="failed" />
      <button type="button" :disabled="comingSoon" :aria-label="comingSoon ? '影片即將推出' : `播放 ${title}`" class="antra-source-video-popup" @click="play">
        <span class="antra-source-video-popup__radar" aria-hidden="true" />
        <Play class="relative ml-1 h-7 w-7 fill-current sm:h-8 sm:w-8" />
      </button>
      <p v-if="comingSoon" class="absolute top-[calc(50%+34px)] sm:top-[calc(50%+66px)] left-0 w-full text-center font-display text-[clamp(24px,4vw,60px)] leading-none font-semibold text-white drop-shadow-lg">Coming Soon</p>
    </template>
    <template v-else-if="state === 'loading' || state === 'playing'">
      <iframe v-if="!src" :src="`https://www.youtube-nocookie.com/embed/${videoId}?autoplay=1&rel=0`" :title="title" class="absolute inset-0 h-full w-full" allow="autoplay; encrypted-media; picture-in-picture; fullscreen" allowfullscreen @load="loaded" @error="failed" />
      <div v-if="state === 'loading'" class="pointer-events-none absolute inset-0 flex items-center justify-center bg-[#1C1C1D] text-white"><span class="h-10 w-10 animate-spin rounded-full border-2 border-white/30 border-t-[#CAA05C]" /><span class="sr-only">影片載入中</span></div>
    </template>
    <div v-else role="alert" class="absolute inset-0 flex flex-col items-center justify-center bg-[#1C1C1D] px-6 text-center text-white">
      <p class="text-lg font-medium">影片載入失敗</p>
      <p v-if="src" class="mt-2 max-w-md break-all text-sm leading-6 text-white/70">來源：{{ src }}。{{ playbackError || '影片載入逾時，請檢查網路後重試。' }}</p>
      <p v-else class="mt-2 max-w-md text-sm leading-6 text-white/70">無法載入 YouTube 影片（ID：{{ videoId }}）。可能是網路或瀏覽器隱私設定阻擋。</p>
      <button v-if="src" type="button" class="mt-4 rounded-full border border-[#CAA05C] px-5 py-2.5 text-sm text-[#CAA05C]" @click="play">重新播放</button>
      <a :href="src || `https://www.youtube.com/watch?v=${videoId}`" target="_blank" rel="noopener noreferrer" class="mt-5 rounded-full border border-[#CAA05C] px-5 py-2.5 text-sm text-[#CAA05C]">{{ src ? '另開影片' : '前往 YouTube 觀看' }}</a>
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

@media (max-width: 639px) {
  .antra-source-video-popup:disabled { width: 48px; height: 48px; }
}
</style>
