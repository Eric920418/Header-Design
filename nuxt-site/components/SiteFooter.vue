<script setup lang="ts">
import { ArrowUp } from 'lucide-vue-next'
</script>

<template>
  <footer class="relative h-[390px] w-full overflow-hidden bg-[#1C1C1D] text-white lg:h-[600px]">
    <div aria-hidden class="absolute inset-0 bg-[url('/footer-antra-bg.jpg')] bg-cover bg-center opacity-20" />
    <div class="relative z-10 mx-auto flex h-[220px] max-w-[1410px] items-start justify-between px-[15px] pt-12 md:px-[30px] lg:pt-[60px]">
      <nav aria-label="頁尾連結" class="flex flex-wrap items-center gap-x-10 gap-y-4 font-cjk-sans text-[15px] text-white/80 md:text-[18px]">
        <NuxtLink to="#">網站地圖</NuxtLink>
        <NuxtLink to="/privacy">隱私權政策</NuxtLink>
      </nav>
      <div class="flex items-center gap-12">
        <a href="#" aria-label="數位展板"><img src="/icons/digital-board.png" alt="" class="h-[35px] w-auto" /></a>
        <a href="#" aria-label="YouTube"><img src="/icons/youtube.png" alt="" class="h-[40px] w-auto" /></a>
      </div>
    </div>
    <div class="relative z-10 flex h-[70px] items-center justify-center whitespace-nowrap border-y border-white/10 px-[10px] text-center font-cjk-sans text-[11px] text-white/65 sm:px-[85px] sm:text-[13px] md:text-[16px]">
      <span>Copyright ©&nbsp;</span><span class="text-[#CAA05C]">Taiwan Sakura Corporation.</span><span>&nbsp;All rights reserved</span>
    </div>
    <img src="/home-2026/footer/sakura-kitchen.png" alt="SAKURA Kitchen" class="absolute bottom-[30px] left-1/2 z-10 w-[calc(100%-30px)] max-w-[1410px] -translate-x-1/2 object-contain object-bottom" />
    <a href="#top" aria-label="回到頂端" class="absolute bottom-5 right-[88px] z-20 flex h-12 w-12 items-center justify-center rounded-full bg-white/70 text-[#1C1C1D] backdrop-blur"><ArrowUp /></a>
  </footer>
</template>
