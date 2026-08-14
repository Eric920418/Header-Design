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
  <div class="knowledge-video-player">
    <template v-if="state === 'idle'">
      <InternalGuideImage :src="cover" :alt="`${title}影片封面`" eager class="knowledge-video-player__cover" />
      <span class="knowledge-video-player__shade" aria-hidden="true" />
      <div class="knowledge-video-player__copy" aria-hidden="true">
        <span>Unlock Your Dream</span>
        <span>Home Today!</span>
      </div>
      <button type="button" :aria-label="`播放：${title}`" class="knowledge-video-player__button" @click="play">
        <span class="knowledge-video-player__radar" aria-hidden="true" />
        <Play class="relative ml-1 h-8 w-8 fill-current" aria-hidden="true" />
      </button>
    </template>

    <template v-else-if="state === 'loading' || state === 'playing'">
      <iframe
        :src="embedUrl"
        :title="title"
        class="knowledge-video-player__iframe"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share; fullscreen"
        allowfullscreen
        @load="loaded"
        @error="failed"
      />
      <div v-if="state === 'loading'" class="knowledge-video-player__loading" aria-live="polite">
        <span class="knowledge-video-player__spinner" aria-hidden="true" />
        <span>影片載入中</span>
      </div>
    </template>

    <div v-else role="alert" class="knowledge-video-player__error">
      <strong>影片載入失敗</strong>
      <p>無法載入 YouTube 影片（ID：{{ videoId }}）。可能是網路連線或瀏覽器隱私設定阻擋。</p>
      <a :href="youtubeUrl" target="_blank" rel="noopener noreferrer">前往 YouTube 觀看</a>
    </div>
  </div>
</template>

<style scoped>
.knowledge-video-player {
  position: relative;
  aspect-ratio: 16 / 9;
  overflow: hidden;
  border-radius: 24px;
  background: #1c1c1d;
}

.knowledge-video-player__cover,
.knowledge-video-player__cover :deep(.guide-image),
.knowledge-video-player__cover :deep(img) { width: 100%; height: 100%; }

.knowledge-video-player__cover :deep(img) { object-fit: cover; }

.knowledge-video-player__shade {
  position: absolute;
  inset: 0;
  background: linear-gradient(90deg, rgb(0 0 0 / 50%), rgb(0 0 0 / 8%) 68%);
}

.knowledge-video-player__copy {
  position: absolute;
  bottom: 44px;
  left: 45px;
  z-index: 2;
  display: flex;
  flex-direction: column;
  color: #fff;
  font-family: "Cal Sans", sans-serif;
  font-size: 44px;
  line-height: 44px;
}

.knowledge-video-player__button {
  position: absolute;
  top: 50%;
  left: 50%;
  z-index: 3;
  display: inline-flex;
  width: 96px;
  height: 96px;
  align-items: center;
  justify-content: center;
  border: 1px solid rgb(255 255 255 / 11%);
  border-radius: 50%;
  color: #fff;
  background: rgb(255 255 255 / 36%);
  backdrop-filter: blur(29px);
  transform: translate(-50%, -50%);
  transition: background-color .3s ease, transform .3s ease;
}

.knowledge-video-player__button:hover {
  background: #caa05c;
  transform: translate(-50%, -50%) scale(1.06);
}

.knowledge-video-player__radar {
  position: absolute;
  z-index: -1;
  inset: 0;
  border-radius: 50%;
  box-shadow: 0 0 0 1px #fff;
  animation: knowledge-video-radar 2s infinite;
  pointer-events: none;
}

.knowledge-video-player__iframe { position: absolute; inset: 0; width: 100%; height: 100%; border: 0; }

.knowledge-video-player__loading,
.knowledge-video-player__error {
  position: absolute;
  z-index: 4;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #fff;
  background: #1c1c1d;
}

.knowledge-video-player__loading { flex-direction: column; gap: 14px; }

.knowledge-video-player__spinner {
  width: 42px;
  height: 42px;
  border: 2px solid rgb(255 255 255 / 30%);
  border-top-color: #caa05c;
  border-radius: 50%;
  animation: knowledge-video-spin .8s linear infinite;
}

.knowledge-video-player__error { flex-direction: column; padding: 30px; text-align: center; }
.knowledge-video-player__error strong { font-family: "Cal Sans", sans-serif; font-size: 28px; font-weight: 400; }
.knowledge-video-player__error p { max-width: 540px; margin: 12px 0 0; color: rgb(255 255 255 / 72%); font-size: 15px; line-height: 24px; }
.knowledge-video-player__error a { margin-top: 22px; padding: 10px 20px; border: 1px solid #caa05c; border-radius: 100px; color: #caa05c; font-size: 14px; }

@keyframes knowledge-video-radar {
  from { opacity: 1; transform: scale(1); }
  to { opacity: 0; transform: scale(1.5); }
}

@keyframes knowledge-video-spin { to { transform: rotate(360deg); } }

@media (max-width: 767px) {
  .knowledge-video-player { border-radius: 18px; }
  .knowledge-video-player__copy { bottom: 20px; left: 20px; font-size: 28px; line-height: 29px; }
  .knowledge-video-player__button { width: 72px; height: 72px; }
  .knowledge-video-player__button :deep(svg) { width: 25px; height: 25px; }
  .knowledge-video-player__error { padding: 18px; }
  .knowledge-video-player__error strong { font-size: 22px; }
  .knowledge-video-player__error p { font-size: 13px; line-height: 20px; }
}

@media (prefers-reduced-motion: reduce) {
  .knowledge-video-player__button { transition: none; }
  .knowledge-video-player__button:hover { transform: translate(-50%, -50%); }
  .knowledge-video-player__radar,
  .knowledge-video-player__spinner { animation: none; }
}
</style>
