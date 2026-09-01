<script setup lang="ts">
import emblaCarouselVue from 'embla-carousel-vue'
import { KITCHEN_STYLES, type KitchenStyle } from '~/data/kitchenStyles'

const [emblaRef, emblaApi] = emblaCarouselVue({ loop: true, align: 'start', skipSnaps: false })
const dragging = ref(false)
const paused = ref(false)
const reduced = useReducedMotion()
let timer: ReturnType<typeof setInterval> | undefined
let resume: ReturnType<typeof setTimeout> | undefined

watch(emblaApi, (api) => {
  if (!api) return
  api.on('pointerDown', () => dragging.value = true)
  api.on('pointerUp', () => dragging.value = false)
}, { immediate: true })

watch([emblaApi, reduced], ([api, isReduced]) => {
  if (timer) clearInterval(timer)
  if (!api || isReduced) return
  timer = setInterval(() => {
    if (!paused.value) api.scrollNext()
  }, 3200)
}, { immediate: true })

function pause() {
  if (resume) clearTimeout(resume)
  paused.value = true
}

function unpause() {
  if (resume) clearTimeout(resume)
  resume = setTimeout(() => paused.value = false, 560)
}

function handleStyleClick(style: KitchenStyle, event: MouseEvent) {
  if (!style.available || !style.route) event.preventDefault()
}

function handleCarouselKeydown(event: KeyboardEvent) {
  if (event.key === 'ArrowLeft') emblaApi.value?.scrollPrev()
  if (event.key === 'ArrowRight') emblaApi.value?.scrollNext()
}

onBeforeUnmount(() => {
  if (timer) clearInterval(timer)
  if (resume) clearTimeout(resume)
})
</script>

<template>
  <section id="kitchen-series" aria-labelledby="home-project-heading" class="home-project-section relative z-10 bg-[#F6F6F6]">
    <div class="home-project-heading mx-auto grid max-w-[1470px] grid-cols-1 px-[15px] md:px-[30px] min-[768px]:grid-cols-[30%_70%]">
      <div v-reveal="{ anim: 'opalMoveRight' }">
        <InternalTemplateHeadingRail label="FEATURED PROJECTS" source="home9" />
      </div>
      <div v-reveal="{ anim: 'opalMoveLeft' }" class="home-project-heading-copy">
        <h2 id="home-project-heading" class="home-project-title">
          Creative <span class="text-[#CAA05C]">Projects That Define</span> Our Style
        </h2>
        <p class="home-project-heading-description">
          We specialize in transforming visions into reality. Explore our portfolio of innovative architectural and kitchen design projects crafted with precision.
        </p>
      </div>
    </div>

    <div v-reveal="{ anim: 'opalMoveLeft', delay: 400 }" class="home-project-carousel-reveal">
      <div
        ref="emblaRef"
        role="region"
        aria-label="廚房系列輪播"
        tabindex="0"
        class="home-project-carousel cursor-grab overflow-hidden bg-transparent outline-none active:cursor-grabbing"
        @mouseenter="pause"
        @mouseleave="unpause"
        @focusin="pause"
        @focusout="unpause"
        @keydown="handleCarouselKeydown"
      >
        <div class="home-project-track flex">
          <NuxtLink
            v-for="style in KITCHEN_STYLES"
            :key="style.slug"
            :to="style.route || '#kitchen-series'"
            :tabindex="style.available && style.route ? 0 : -1"
            :aria-disabled="style.available && style.route ? undefined : true"
            class="home-project-slide group shrink-0"
            :class="dragging ? 'is-dragging' : ''"
            @click="handleStyleClick(style, $event)"
          >
            <article class="home-project-card relative overflow-hidden">
              <img :src="style.image" :alt="`${style.en} ${style.zh}`" draggable="false" class="absolute inset-0 h-full w-full object-cover object-center transition-transform duration-700 group-hover:scale-[1.035]" />
              <span class="pointer-events-none absolute inset-0 bg-[linear-gradient(180deg,rgba(0,0,0,.06)_20%,rgba(0,0,0,.86)_100%)]" />
              <span class="absolute left-6 top-6 z-[2] rounded-full border border-white/50 px-4 py-1.5 text-[15px] font-semibold text-white backdrop-blur-sm">{{ style.en }}</span>
              <div class="absolute inset-x-0 bottom-0 z-[2] px-6 pb-8 min-[1201px]:px-8 min-[1201px]:pb-9">
                <h3 class="w-fit font-display text-[30px] leading-[38px] text-white transition-colors group-hover:text-[#CAA05C]">{{ style.zh }}</h3>
                <p class="home-project-description overflow-hidden text-[15px] leading-[23px] text-white/90">{{ style.desc }}</p>
              </div>
            </article>
          </NuxtLink>
        </div>
      </div>
    </div>
  </section>
</template>
