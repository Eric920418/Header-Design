<script setup lang="ts">
const items = [
  { href: '/gallery', icon: '/floating-icons/case.png', label: '案例門市', primary: true },
  { href: 'https://www.sakura-kitchenlife.com.tw/measuring', icon: '/floating-icons/measure.png', label: '到府丈量' },
  { href: 'https://icare.sakura.com.tw', icon: '/floating-icons/service.png', label: '客服中心' },
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
  <aside ref="rail" aria-label="快速服務" class="floating-buttons fixed bottom-[70px] right-0 z-[90] flex w-[72px] flex-col sm:bottom-9 sm:w-[74px]" :class="{ 'floating-buttons--focused-mobile-form': isFocusedMobileForm }" :style="{ transform: `translateY(${offset}px)` }">
    <a v-for="(item, index) in items" :key="item.label" :href="item.href" :target="item.href.startsWith('http') ? '_blank' : undefined" :rel="item.href.startsWith('http') ? 'noopener noreferrer' : undefined" class="flex h-[72px] flex-col items-center justify-center text-center text-[12px] leading-[14px] text-white sm:h-[74px]" :class="[item.primary ? 'mb-5 bg-[#B79258]' : 'bg-[#737373]', !item.primary && index > 1 ? 'border-t border-white/50' : '']">
      <img :src="item.icon" alt="" class="mb-1 h-9 w-9 object-contain" />{{ item.label }}
    </a>
  </aside>
</template>

<style scoped>
@media (max-width: 767px) {
  .floating-buttons--focused-mobile-form { display: none; }
}
</style>
