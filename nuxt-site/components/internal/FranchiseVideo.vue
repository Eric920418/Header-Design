<script setup lang="ts">
import { Play } from 'lucide-vue-next'

const props = defineProps<{
  videoId: string
  title: string
}>()

const state = ref<'idle' | 'loading' | 'playing' | 'error'>('idle')
let timeout: ReturnType<typeof setTimeout> | undefined

const cover = computed(() => `https://i.ytimg.com/vi/${props.videoId}/maxresdefault.jpg`)
const youtubeUrl = computed(() => `https://www.youtube.com/watch?v=${props.videoId}`)
const embedUrl = computed(() => `https://www.youtube-nocookie.com/embed/${props.videoId}?autoplay=1&rel=0&playsinline=1`)

const play = () => {
  state.value = 'loading'
  if (import.meta.client) {
    timeout = setTimeout(() => {
      if (state.value === 'loading') state.value = 'error'
    }, 12000)
  }
}

const loaded = () => {
  if (timeout) clearTimeout(timeout)
  state.value = 'playing'
}

const failed = () => {
  if (timeout) clearTimeout(timeout)
  state.value = 'error'
}

onBeforeUnmount(() => timeout && clearTimeout(timeout))
</script>

<template>
  <div class="franchise-video">
    <template v-if="state === 'idle'">
      <InternalFranchiseImage :src="cover" :alt="`${title}影片封面`" eager class="franchise-video__cover" @click="play" />
      <span class="franchise-video__shade" aria-hidden="true" />
      <div class="franchise-video__label" aria-hidden="true">
        <span>Partner Stories</span>
        <strong>店經理的創業故事</strong>
      </div>
      <button type="button" :aria-label="`播放：${title}`" class="franchise-video__play" @click="play">
        <span aria-hidden="true" />
        <Play class="relative ml-1 h-7 w-7 fill-current" aria-hidden="true" />
      </button>
    </template>

    <template v-else-if="state === 'loading' || state === 'playing'">
      <iframe
        :src="embedUrl"
        :title="title"
        class="franchise-video__iframe"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share; fullscreen"
        allowfullscreen
        @load="loaded"
        @error="failed"
      />
      <div v-if="state === 'loading'" class="franchise-video__loading" aria-live="polite">
        <span aria-hidden="true" />
        <strong>影片載入中</strong>
      </div>
    </template>

    <div v-else class="franchise-video__error" role="alert">
      <strong>加盟創業故事影片載入失敗</strong>
      <p>無法載入 YouTube 影片（ID：{{ videoId }}）。可能是網路連線、YouTube 權限或瀏覽器隱私設定阻擋。</p>
      <a :href="youtubeUrl" target="_blank" rel="noopener noreferrer">前往 YouTube 觀看</a>
    </div>
  </div>
</template>

<style scoped>
.franchise-video { position: relative; aspect-ratio: 16 / 9; overflow: hidden; border-radius: 24px; background: #1c1c1d; }
.franchise-video__cover,
.franchise-video__cover :deep(img) { width: 100%; height: 100%; }
.franchise-video__cover :deep(img) { object-fit: cover; }
.franchise-video__shade { position: absolute; inset: 0; background: linear-gradient(90deg, rgb(0 0 0 / 70%), rgb(0 0 0 / 7%) 72%); }
.franchise-video__label { position: absolute; bottom: 38px; left: 40px; z-index: 2; color: #fff; }
.franchise-video__label span { display: block; margin-bottom: 7px; color: #caa05c; font-size: 12px; line-height: 14px; letter-spacing: .16em; text-transform: uppercase; }
.franchise-video__label strong { display: block; font-family: "Cal Sans", sans-serif; font-size: 32px; font-weight: 400; line-height: 36px; }

.franchise-video__play {
  position: absolute;
  top: 50%;
  left: 50%;
  z-index: 3;
  display: inline-flex;
  width: 92px;
  height: 92px;
  align-items: center;
  justify-content: center;
  border: 1px solid rgb(255 255 255 / 18%);
  border-radius: 50%;
  color: #fff;
  background: rgb(255 255 255 / 30%);
  backdrop-filter: blur(24px);
  transform: translate(-50%, -50%);
  transition: background-color .3s ease, transform .3s ease;
}

.franchise-video__play:hover { background: #caa05c; transform: translate(-50%, -50%) scale(1.06); }
.franchise-video__play > span { position: absolute; inset: 0; z-index: -1; border-radius: 50%; box-shadow: 0 0 0 1px #fff; animation: franchise-video-radar 2s infinite; }
.franchise-video__iframe { position: absolute; inset: 0; width: 100%; height: 100%; border: 0; }

.franchise-video__loading,
.franchise-video__error { position: absolute; z-index: 4; inset: 0; display: flex; align-items: center; justify-content: center; color: #fff; background: #1c1c1d; }
.franchise-video__loading { flex-direction: column; gap: 14px; }
.franchise-video__loading > span { width: 42px; height: 42px; border: 2px solid rgb(255 255 255 / 28%); border-top-color: #caa05c; border-radius: 50%; animation: franchise-video-spin .8s linear infinite; }
.franchise-video__error { flex-direction: column; padding: 30px; text-align: center; }
.franchise-video__error strong { font-family: "Cal Sans", sans-serif; font-size: 27px; font-weight: 400; }
.franchise-video__error p { max-width: 560px; margin: 12px 0 0; color: rgb(255 255 255 / 70%); font-size: 15px; line-height: 24px; }
.franchise-video__error a { margin-top: 22px; padding: 10px 20px; border: 1px solid #caa05c; border-radius: 999px; color: #caa05c; font-size: 14px; }

@keyframes franchise-video-radar { from { opacity: 1; transform: scale(1); } to { opacity: 0; transform: scale(1.5); } }
@keyframes franchise-video-spin { to { transform: rotate(360deg); } }

@media (max-width: 767px) {
  .franchise-video { border-radius: 18px; }
  .franchise-video__label { bottom: 20px; left: 20px; }
  .franchise-video__label strong { font-size: 23px; line-height: 27px; }
  .franchise-video__play { width: 70px; height: 70px; }
}

@media (prefers-reduced-motion: reduce) {
  .franchise-video__play { transition: none; }
  .franchise-video__play:hover { transform: translate(-50%, -50%); }
  .franchise-video__play > span,
  .franchise-video__loading > span { animation: none; }
}
</style>
