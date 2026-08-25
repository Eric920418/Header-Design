<script setup lang="ts">
const primaryItem = {
  href: '/gallery',
  icon: '/floating-icons/case.png',
  label: '案例門市',
}

const serviceItems = [
  { href: 'https://www.sakura-kitchenlife.com.tw/measuring', icon: '/floating-icons/official-quick-link-2.svg', label: '免費丈量' },
  { href: 'https://icare.sakura.com.tw', icon: '/floating-icons/official-quick-link-3.svg', label: '線上客服', newTab: true },
]

const rail = ref<HTMLElement | null>(null)
const offset = ref(0)
const reduced = useReducedMotion()
const route = useRoute()
const isFocusedMobileForm = computed(() => ['/franchising/intro', '/franchising/download', '/franchising/form', '/builders', '/about/exhibition', '/about/introduce'].includes(route.path) || route.path.startsWith('/gallery/') || route.path.startsWith('/news') || route.path.startsWith('/products'))
let frame = 0

const update = () => {
  if (!rail.value || reduced.value) { offset.value = 0; return }
  const maxScroll = Math.max(1, document.documentElement.scrollHeight - window.innerHeight)
  const progress = Math.min(1, window.scrollY / maxScroll)
  const railHeight = rail.value.offsetHeight
  const startTop = window.innerHeight - railHeight - (window.innerWidth < 640 ? 70 : 36)
  const endTop = 112
  offset.value = Math.min(0, (endTop - startTop) * progress)
}

const requestUpdate = () => {
  cancelAnimationFrame(frame)
  frame = requestAnimationFrame(update)
}

onMounted(() => {
  update()
  window.addEventListener('scroll', requestUpdate, { passive: true })
  window.addEventListener('resize', requestUpdate)
})
onBeforeUnmount(() => {
  cancelAnimationFrame(frame)
  window.removeEventListener('scroll', requestUpdate)
  window.removeEventListener('resize', requestUpdate)
})
</script>

<template>
  <aside ref="rail" aria-label="快速服務" class="floating-buttons fixed right-0 bottom-[70px] z-[90] sm:bottom-9" :class="{ 'floating-buttons--focused-mobile-form': isFocusedMobileForm }" :style="{ transform: `translateY(${offset}px)` }">
    <a :href="primaryItem.href" :aria-label="primaryItem.label" class="relative mb-5 block h-[72px] w-[72px] bg-[#B79258] text-white sm:h-[74px] sm:w-[74px]">
      <img :src="primaryItem.icon" alt="" class="absolute top-[13px] left-1/2 h-[29px] w-[29px] -translate-x-1/2 sm:top-[14px] sm:h-[30px] sm:w-[30px]" />
      <span class="absolute inset-x-0 bottom-[11px] block whitespace-nowrap text-center font-['Noto_Sans_TC'] text-xs leading-3 sm:bottom-3">{{ primaryItem.label }}</span>
    </a>
    <div class="bg-[#737373]">
      <template v-for="(item, index) in serviceItems" :key="item.label">
        <div v-if="index" aria-hidden="true" class="h-px w-full bg-white/50" />
        <a :href="item.href" :aria-label="item.label" :target="item.newTab ? '_blank' : undefined" :rel="item.newTab ? 'noopener noreferrer' : undefined" class="block p-2">
          <img :src="item.icon" alt="" class="block w-14 sm:w-[58px]" />
        </a>
      </template>
    </div>
  </aside>
</template>

<style scoped>
@media (max-width: 767px) {
  .floating-buttons--focused-mobile-form { display: none; }
}
</style>
