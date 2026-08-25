<script setup lang="ts">
import { ArrowUp } from 'lucide-vue-next'

const footerSocialRight = ref('112px')
const footerSocialLinks = ref<HTMLElement | null>(null)
const reducedMotion = useReducedMotion()
let headerResizeObserver: ResizeObserver | null = null

function scrollToTop() {
  window.scrollTo({
    top: 0,
    behavior: reducedMotion.value ? 'auto' : 'smooth',
  })
}

function alignSocialLinksWithHeader() {
  if (!import.meta.client || window.innerWidth < 1024) return

  const anchor = document.querySelector<HTMLElement>('[data-footer-align-anchor="sakura-group"]')
  if (!anchor) return

  const anchorRect = anchor.getBoundingClientRect()
  const anchorPaddingRight = Number.parseFloat(window.getComputedStyle(anchor).paddingRight) || 0
  const glyphRight = anchorRect.right - anchorPaddingRight
  const containingBlock = footerSocialLinks.value?.offsetParent
  const containingBlockRight = containingBlock instanceof HTMLElement
    ? containingBlock.getBoundingClientRect().right
    : window.innerWidth

  footerSocialRight.value = `${Math.max(0, containingBlockRight - glyphRight)}px`
}

onMounted(() => {
  nextTick(() => {
    alignSocialLinksWithHeader()
    window.addEventListener('resize', alignSocialLinksWithHeader, { passive: true })

    const header = document.querySelector('header')
    if (header) {
      headerResizeObserver = new ResizeObserver(alignSocialLinksWithHeader)
      headerResizeObserver.observe(header)
    }

    document.fonts?.ready.then(alignSocialLinksWithHeader)
  })
})

onBeforeUnmount(() => {
  window.removeEventListener('resize', alignSocialLinksWithHeader)
  headerResizeObserver?.disconnect()
})
</script>

<template>
  <footer class="relative h-[390px] w-full overflow-hidden bg-[#1C1C1D] text-white lg:h-[600px]">
    <div aria-hidden class="absolute inset-0 bg-[url('/footer-antra-bg.jpg')] bg-cover bg-center opacity-20" />
    <div class="relative z-10 mx-auto flex h-[220px] max-w-[1410px] items-start justify-between pt-12 pr-[96px] pl-[15px] md:pr-[104px] md:pl-[30px] lg:pt-[60px] lg:pr-[112px]">
      <nav aria-label="頁尾連結" class="flex flex-wrap items-center gap-x-10 gap-y-4 font-cjk-sans text-[15px] text-white/80 md:text-[18px]">
        <NuxtLink to="#">網站地圖</NuxtLink>
        <NuxtLink to="/privacy">隱私權政策</NuxtLink>
      </nav>
      <div
        ref="footerSocialLinks"
        class="footer-social-links flex h-10 items-center gap-12 lg:absolute lg:top-[60px] lg:right-[var(--footer-social-right)]"
        :style="{ '--footer-social-right': footerSocialRight }"
      >
        <a href="#" aria-label="數位展板" class="flex h-10 items-center"><img src="/icons/digital-board.png" alt="" class="h-[35px] w-auto" /></a>
        <a href="#" aria-label="YouTube" class="flex h-10 items-center"><img src="/icons/youtube.png" alt="" class="h-[40px] w-auto translate-y-[7px]" /></a>
      </div>
    </div>
    <div class="relative z-10 flex h-[70px] items-center justify-center whitespace-nowrap border-y border-white/10 px-[10px] text-center font-cjk-sans text-[11px] text-white/65 sm:px-[85px] sm:text-[13px] md:text-[16px]">
      <span>Copyright ©&nbsp;</span><span class="text-[#CAA05C]">Taiwan Sakura Corporation.</span><span>&nbsp;All rights reserved</span>
    </div>
    <img src="/home-2026/footer/sakura-kitchen.png" alt="SAKURA Kitchen" class="absolute bottom-[30px] left-1/2 z-10 w-[calc(100%-30px)] max-w-[1410px] -translate-x-1/2 object-contain object-bottom" />
  </footer>
  <button
    type="button"
    aria-label="回到頂端"
    class="fixed right-3 bottom-[20px] z-[95] flex h-12 w-12 items-center justify-center rounded-full border border-white/45 bg-white/80 text-[#1C1C1D] shadow-[0_8px_24px_rgba(0,0,0,.16)] backdrop-blur-md transition-[background-color,color,transform] duration-300 hover:-translate-y-1 hover:bg-[#CAA05C] hover:text-white sm:right-[13px]"
    @click="scrollToTop"
  >
    <ArrowUp class="h-5 w-5" aria-hidden="true" />
  </button>
</template>
