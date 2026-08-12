<script setup lang="ts">
import { Play } from 'lucide-vue-next'

const props = defineProps<{
  videoId: string
  cover: string
  title: string
}>()

const state = ref<'idle' | 'loading' | 'playing' | 'error'>('idle')
let timeout: ReturnType<typeof setTimeout> | undefined

const youtubeUrl = computed(() => `https://www.youtube.com/watch?v=${props.videoId}`)
const embedUrl = computed(() => `https://www.youtube-nocookie.com/embed/${props.videoId}?autoplay=1&rel=0&playsinline=1`)

watch(() => props.videoId, () => {
  if (timeout) clearTimeout(timeout)
  state.value = 'idle'
})

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
  <div class="media-video-player">
    <template v-if="state === 'idle'">
      <InternalNewsImage :src="cover" :alt="`${title}影片封面`" eager class="media-video-player__cover" />
      <span class="media-video-player__shade" aria-hidden="true" />
      <button type="button" :aria-label="`播放：${title}`" class="media-video-player__button" @click="play">
        <span class="media-video-player__radar" aria-hidden="true" />
        <Play class="relative ml-1 h-8 w-8 fill-current" aria-hidden="true" />
      </button>
    </template>

    <template v-else-if="state === 'loading' || state === 'playing'">
      <iframe
        :src="embedUrl"
        :title="title"
        class="media-video-player__iframe"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share; fullscreen"
        allowfullscreen
        @load="loaded"
        @error="failed"
      />
      <div v-if="state === 'loading'" class="media-video-player__loading" aria-live="polite">
        <span class="media-video-player__spinner" aria-hidden="true" />
        <span>影片載入中</span>
      </div>
    </template>

    <div v-else role="alert" class="media-video-player__error">
      <strong>影片載入失敗</strong>
      <p>無法載入 YouTube 影片（ID：{{ videoId }}）。可能是網路連線或瀏覽器隱私設定阻擋。</p>
      <a :href="youtubeUrl" target="_blank" rel="noopener noreferrer">前往 YouTube 觀看</a>
    </div>
  </div>
</template>

<style scoped>
.media-video-player {
  position: relative;
  aspect-ratio: 16 / 9;
  overflow: hidden;
  border-radius: 24px;
  background: #1c1c1d;
}

.media-video-player__cover,
.media-video-player__cover :deep(.antra-news-image),
.media-video-player__cover :deep(img) { width: 100%; height: 100%; }

.media-video-player__shade {
  position: absolute;
  inset: 0;
  background: rgba(0, 0, 0, .18);
}

.media-video-player__button {
  position: absolute;
  top: 50%;
  left: 50%;
  z-index: 2;
  display: inline-flex;
  width: 96px;
  height: 96px;
  align-items: center;
  justify-content: center;
  border: 1px solid rgba(255, 255, 255, .11);
  border-radius: 50%;
  color: #fff;
  background: rgba(255, 255, 255, .36);
  backdrop-filter: blur(29px);
  transform: translate(-50%, -50%);
  transition: background-color .3s ease, transform .3s ease;
}

.media-video-player__button:hover {
  background: #caa05c;
  transform: translate(-50%, -50%) scale(1.06);
}

.media-video-player__radar {
  position: absolute;
  z-index: -1;
  inset: 0;
  border-radius: 50%;
  box-shadow: 0 0 0 1px #fff;
  animation: media-video-radar 2s infinite;
  pointer-events: none;
}

.media-video-player__iframe { position: absolute; inset: 0; width: 100%; height: 100%; border: 0; }

.media-video-player__loading,
.media-video-player__error {
  position: absolute;
  z-index: 3;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #fff;
  background: #1c1c1d;
}

.media-video-player__loading { flex-direction: column; gap: 14px; }

.media-video-player__spinner {
  width: 42px;
  height: 42px;
  border: 2px solid rgba(255, 255, 255, .3);
  border-top-color: #caa05c;
  border-radius: 50%;
  animation: media-video-spin .8s linear infinite;
}

.media-video-player__error { flex-direction: column; padding: 30px; text-align: center; }
.media-video-player__error strong { font-family: "Cal Sans", sans-serif; font-size: 28px; font-weight: 400; }
.media-video-player__error p { max-width: 540px; margin: 12px 0 0; color: rgba(255, 255, 255, .72); font-size: 15px; line-height: 24px; }
.media-video-player__error a { margin-top: 22px; padding: 10px 20px; border: 1px solid #caa05c; border-radius: 100px; color: #caa05c; font-size: 14px; }

@keyframes media-video-radar {
  from { opacity: 1; transform: scale(1); }
  to { opacity: 0; transform: scale(1.5); }
}

@keyframes media-video-spin { to { transform: rotate(360deg); } }

@media (max-width: 767px) {
  .media-video-player { border-radius: 18px; }
  .media-video-player__button { width: 72px; height: 72px; }
  .media-video-player__button :deep(svg) { width: 25px; height: 25px; }
  .media-video-player__error { padding: 18px; }
  .media-video-player__error strong { font-size: 22px; }
  .media-video-player__error p { font-size: 13px; line-height: 20px; }
}

@media (prefers-reduced-motion: reduce) {
  .media-video-player__button { transition: none; }
  .media-video-player__button:hover { transform: translate(-50%, -50%); }
  .media-video-player__radar { animation: none; }
  .media-video-player__spinner { animation: none; }
}
</style>
