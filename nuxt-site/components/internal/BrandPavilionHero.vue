<script setup lang="ts">
import { Play, X } from 'lucide-vue-next'

const videoOpen = ref(false)

function closeVideo() {
  videoOpen.value = false
}

function handleEscape(event: KeyboardEvent) {
  if (event.key === 'Escape' && videoOpen.value) closeVideo()
}

onMounted(() => window.addEventListener('keydown', handleEscape))
onBeforeUnmount(() => window.removeEventListener('keydown', handleEscape))
</script>

<template>
  <section class="pavilion-single-hero hero-includes-header" aria-labelledby="pavilion-hero-title">
    <div v-reveal="{ anim: 'opalScaleUp' }" data-ev="opalScaleUp" class="pavilion-single-hero__rail ev">
      <InternalBrandImage
        src="/section-5/brand-pavilion/banner.jpg"
        alt="SAKURA 集團品牌館外觀"
        eager
        class="pavilion-single-hero__image"
      />
      <div class="pavilion-single-hero__shade" aria-hidden="true" />
      <div class="pavilion-single-hero__copy">
        <small>集團品牌館<br />SAKURA Brand Pavilion</small>
        <h1 id="pavilion-hero-title">Creative <span>Projects That<br />Define</span> Our Style</h1>
      </div>
      <button type="button" class="pavilion-single-hero__video-card" aria-haspopup="dialog" aria-label="播放集團品牌館影片" @click="videoOpen = true">
        <span class="pavilion-single-hero__video-title">Watch a Video About Us</span>
        <span class="pavilion-single-hero__video-preview" aria-hidden="true">
          <span class="pavilion-single-hero__video-play"><Play /></span>
        </span>
      </button>
    </div>

    <Teleport to="body">
      <div v-if="videoOpen" class="pavilion-video-modal" role="dialog" aria-modal="true" aria-label="SAKURA 品牌承諾影片" @click.self="closeVideo">
        <button type="button" aria-label="關閉影片" class="pavilion-video-modal__close" @click="closeVideo"><X aria-hidden="true" /></button>
        <div class="pavilion-video-modal__content">
          <InternalBrandVideo autoplay flat />
        </div>
      </div>
    </Teleport>
  </section>
</template>

<style scoped>
.pavilion-single-hero { padding: 20px 30px 38px; background: #fafafa; }
.pavilion-single-hero__rail { position: relative; width: min(1410px, 100%); aspect-ratio: 2.203125 / 1; margin-inline: auto; overflow: hidden; border-radius: 24px; color: #fff; }
.pavilion-single-hero__image { position: absolute; inset: 0; width: 100%; height: 100%; }
.pavilion-single-hero__shade { position: absolute; inset: 0; background: linear-gradient(90deg, rgb(16 8 1 / 58%) 0%, rgb(16 8 1 / 12%) 61%, rgb(16 8 1 / 28%) 100%); }
.pavilion-single-hero__copy { position: absolute; left: 30px; bottom: 200px; width: min(665px, 55%); }
.pavilion-single-hero__copy small { display: block; margin-bottom: 20px; color: rgb(255 255 255 / 75%); font-family: var(--font-ui); font-size: 11px; line-height: 16px; letter-spacing: .12em; text-transform: uppercase; }
.pavilion-single-hero__copy h1 { margin: 0; font-family: var(--font-display); font-size: 60px; font-weight: 400; line-height: 58px; text-transform: capitalize; }
.pavilion-single-hero__copy h1 span { color: #caa05c; }
.pavilion-single-hero__video-card { position: absolute; right: 104px; bottom: 30px; display: flex; width: 560px; max-width: calc(100% - 134px); align-items: center; justify-content: space-between; border: 0; border-radius: 24px; padding: 10px 10px 10px 33px; color: #fff; background: rgb(255 255 255 / 30%); backdrop-filter: blur(58px); cursor: pointer; animation: opalMoveLeft .8s ease .5s both; }
.pavilion-single-hero__video-title { width: 176px; font-family: var(--font-display); font-size: 26px; font-weight: 400; line-height: 34px; text-align: left; }
.pavilion-single-hero__video-preview { display: flex; width: 170px; min-height: 130px; align-items: center; justify-content: center; border-radius: 11px; background: linear-gradient(rgb(16 8 1 / 18%), rgb(16 8 1 / 18%)), url('/section-5/brand-pavilion/banner.jpg') center / cover no-repeat; }
.pavilion-single-hero__video-play { position: relative; z-index: 0; display: flex; width: 70px; height: 70px; align-items: center; justify-content: center; border-radius: 50%; color: #caa05c; background: #fff; transition: color .3s ease, transform .3s ease; }
.pavilion-single-hero__video-play::after { position: absolute; inset: 0; z-index: -1; border-radius: 50%; box-shadow: 0 0 0 1px #fff; content: ""; animation: pavilion-video-radar 2s infinite; }
.pavilion-single-hero__video-play svg { width: 35px; height: 35px; fill: currentcolor; stroke-width: 0; }
.pavilion-single-hero__video-card:hover .pavilion-single-hero__video-play { color: #fff; background: #caa05c; transform: scale(1.04); }
.pavilion-single-hero__video-card:focus-visible { outline: 2px solid #fff; outline-offset: -4px; }
.pavilion-video-modal { position: fixed; inset: 0; z-index: 300; display: flex; align-items: center; justify-content: center; padding: 60px 30px; background: rgb(0 0 0 / 82%); backdrop-filter: blur(10px); }
.pavilion-video-modal__content { width: min(1100px, 100%); }
.pavilion-video-modal__close { position: absolute; top: 22px; right: 22px; display: flex; width: 46px; height: 46px; align-items: center; justify-content: center; border: 1px solid rgb(255 255 255 / 35%); border-radius: 50%; color: #fff; background: transparent; cursor: pointer; }
.pavilion-video-modal__close svg { width: 22px; height: 22px; }
.pavilion-video-modal__close:focus-visible { outline: 2px solid #caa05c; outline-offset: 4px; }

@media (max-width: 1024px) {
  .pavilion-single-hero__rail { aspect-ratio: 1.72 / 1; }
  .pavilion-single-hero__copy h1 { font-size: 48px; line-height: 48px; }
  .pavilion-single-hero__video-card { width: 470px; }
  .pavilion-single-hero__video-title { font-size: 20px; line-height: 28px; }
}

@media (max-width: 767px) {
  .pavilion-single-hero { padding: 20px 15px 30px; }
  .pavilion-single-hero__rail { min-height: 520px; aspect-ratio: auto; }
  .pavilion-single-hero__copy { left: 20px; bottom: 190px; width: calc(100% - 40px); }
  .pavilion-single-hero__copy small { margin-bottom: 14px; }
  .pavilion-single-hero__copy h1 { font-size: 38px; line-height: 38px; }
  .pavilion-single-hero__video-card { right: 20px; bottom: 20px; left: 20px; width: auto; max-width: none; padding-left: 20px; }
  .pavilion-single-hero__video-title { width: 150px; font-size: 18px; line-height: 24px; }
  .pavilion-single-hero__video-preview { width: 130px; min-height: 100px; }
  .pavilion-single-hero__video-play { width: 58px; height: 58px; }
  .pavilion-single-hero__video-play svg { width: 28px; height: 28px; }
  .pavilion-video-modal { padding: 60px 15px; }
}

@keyframes pavilion-video-radar {
  0% { opacity: 1; transform: scale(1); }
  100% { opacity: 0; transform: scale(1.3); }
}

@media (prefers-reduced-motion: reduce) {
  .pavilion-single-hero__video-card { animation: none; }
  .pavilion-single-hero__video-play,
  .pavilion-single-hero__video-play::after { animation: none; transition: none; }
}
</style>
