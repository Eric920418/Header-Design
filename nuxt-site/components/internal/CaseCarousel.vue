<script setup lang="ts">
import emblaCarouselVue from 'embla-carousel-vue'
import { ArrowLeft, ArrowRight } from 'lucide-vue-next'

const props = defineProps<{ images: string[]; title: string }>()
const [viewport, api] = emblaCarouselVue({ loop: true, align: 'start', duration: 26 })
const selected = ref(0)
const thumbnailList = ref<HTMLElement | null>(null)

const update = () => {
  selected.value = api.value?.selectedScrollSnap() ?? 0
  const button = thumbnailList.value?.querySelector<HTMLElement>(`[data-thumbnail="${selected.value}"]`)
  button?.scrollIntoView({ behavior: 'smooth', block: 'nearest', inline: 'nearest' })
}

watch(api, (value, oldValue) => {
  oldValue?.off('select', update)
  oldValue?.off('reInit', update)
  if (!value) return
  update()
  value.on('select', update)
  value.on('reInit', update)
})

watch(() => props.images, async () => {
  selected.value = 0
  await nextTick()
  api.value?.reInit()
  api.value?.scrollTo(0, true)
})

onBeforeUnmount(() => {
  api.value?.off('select', update)
  api.value?.off('reInit', update)
})
</script>

<template>
  <section class="case-carousel" aria-roledescription="carousel" aria-label="案例圖片輪播">
    <div ref="viewport" class="case-carousel__viewport">
      <div class="case-carousel__track">
        <figure v-for="(image, index) in images" :key="image" class="case-carousel__slide" role="group" :aria-label="`${index + 1} / ${images.length}`">
          <InternalCaseImage :src="image" :alt="`${title} 案例照片 ${index + 1}`" :eager="index === 0" class="case-carousel__main-image" />
        </figure>
      </div>
    </div>

    <div class="case-carousel__controls">
      <div ref="thumbnailList" class="case-carousel__thumbnails" role="tablist" aria-label="選擇案例照片">
        <button
          v-for="(image, index) in images"
          :key="image"
          type="button"
          role="tab"
          :data-thumbnail="index"
          :aria-selected="selected === index"
          :aria-label="`顯示第 ${index + 1} 張案例照片`"
          :class="{ 'is-active': selected === index }"
          @click="api?.scrollTo(index)"
        >
          <InternalCaseImage :src="image" alt="" class="case-carousel__thumbnail-image" />
        </button>
      </div>
      <div class="case-carousel__arrows">
        <button type="button" aria-label="上一張案例照片" @click="api?.scrollPrev()"><ArrowLeft aria-hidden="true" /></button>
        <button type="button" aria-label="下一張案例照片" @click="api?.scrollNext()"><ArrowRight aria-hidden="true" /></button>
      </div>
    </div>
    <p class="sr-only" aria-live="polite">目前顯示第 {{ selected + 1 }} 張，共 {{ images.length }} 張。</p>
  </section>
</template>

<style scoped>
.case-carousel__viewport {
  overflow: hidden;
  border-radius: 24px;
  background: #e3e3e8;
}

.case-carousel__track { display: flex; touch-action: pan-y pinch-zoom; }
.case-carousel__slide { min-width: 0; flex: 0 0 100%; }
.case-carousel__main-image { width: 100%; height: 520px; }

.case-carousel__controls {
  display: flex;
  align-items: flex-end;
  justify-content: space-between;
  gap: 20px;
  margin-top: 20px;
}

.case-carousel__thumbnails {
  display: flex;
  min-width: 0;
  flex: 1;
  gap: 20px;
  overflow-x: auto;
  padding: 2px 2px 7px;
  scrollbar-width: thin;
  scrollbar-color: #caa05c #e3e3e8;
}

.case-carousel__thumbnails button {
  position: relative;
  height: 150px;
  min-width: 0;
  flex: 0 0 calc((100% - 40px) / 3);
  overflow: hidden;
  border: 2px solid transparent;
  border-radius: 18px;
  background: #e3e3e8;
  cursor: pointer;
  opacity: .62;
  transition: border-color .3s ease, opacity .3s ease;
}

.case-carousel__thumbnails button:hover,
.case-carousel__thumbnails button.is-active {
  border-color: #caa05c;
  opacity: 1;
}

.case-carousel__thumbnail-image { width: 100%; height: 100%; }
.case-carousel__arrows { display: flex; flex: 0 0 auto; gap: 10px; padding-bottom: 7px; }

.case-carousel__arrows button {
  display: flex;
  width: 48px;
  height: 48px;
  align-items: center;
  justify-content: center;
  border: 1px solid #e3e3e8;
  border-radius: 50%;
  color: #1c1c1d;
  background: transparent;
  transition: color .3s ease, border-color .3s ease, background-color .3s ease;
}

.case-carousel__arrows button:hover { border-color: #caa05c; color: #fff; background: #caa05c; }
.case-carousel__arrows :deep(svg) { width: 20px; height: 20px; }

@media (max-width: 1024px) {
  .case-carousel__main-image { height: auto; aspect-ratio: 16 / 9; }
  .case-carousel__thumbnails button { height: 120px; flex-basis: calc((100% - 20px) / 2.3); }
  .case-carousel__arrows { margin-right: 76px; }
}

@media (max-width: 767px) {
  .case-carousel__viewport { border-radius: 18px; }
  .case-carousel__controls { align-items: center; flex-wrap: wrap; }
  .case-carousel__thumbnails { order: 2; width: 100%; flex-basis: 100%; gap: 12px; }
  .case-carousel__thumbnails button { height: 92px; flex-basis: calc((100% - 12px) / 1.4); border-radius: 12px; }
  .case-carousel__arrows { margin-left: auto; padding-bottom: 0; }
  .case-carousel__arrows button { width: 44px; height: 44px; }
}

@media (prefers-reduced-motion: reduce) {
  .case-carousel__thumbnails button,
  .case-carousel__arrows button { transition: none; }
}
</style>
