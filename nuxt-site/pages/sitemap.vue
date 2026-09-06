<script setup lang="ts">
const groups = [
  { title: '設計案例', links: [['品牌系列・AI 廚房', '/home-style/aikitchen'], ['設計靈感', '/design-inspiration'], ['廚房裝修指南', '/knowledge'], ['品牌系列型錄', '/catalogues/kitchenware-catalog']] },
  { title: '廚房產品', links: [['SAKURA 廚電', '/products/sakura'], ['除油煙機系列', '/products/sakura/range-hood'], ['近吸系列', '/products/sakura/range-hood/near-suction'], ['廚房商品型錄', '/catalogues/catalog']] },
  { title: '門市與服務', links: [['服務流程', '/service-process'], ['案例門市', '/gallery']] },
  { title: '優惠消息', links: [['優惠消息', '/news']] },
  { title: '品牌承諾', links: [['品牌優勢', '/about/advantage'], ['品牌館', '/about/exhibition'], ['關於櫻花', '/about/introduce']] },
  { title: '合作專區', links: [['我要加盟', '/franchising/intro'], ['加盟資料下載', '/franchising/download'], ['建商專區', '/builders'], ['建商整體廚房', '/builders/sakura-kitchen'], ['建商專區型錄', '/builders/catalogues']] },
]
useSeoMeta({ title: '網站地圖｜SAKURA 整體廚房' })
</script>

<template>
  <main>
    <InternalPageHero title="Site Map" eyebrow="網站地圖" />
    <nav aria-label="網站地圖" class="mx-auto grid max-w-[1410px] gap-10 px-[30px] py-20 sm:grid-cols-2 lg:grid-cols-3 lg:pr-[86px]">
      <section v-for="group in groups" :key="group.title">
        <h2 class="mb-5 font-cjk-serif text-[24px] text-[#1c1c1d]">{{ group.title }}</h2>
        <ul class="space-y-3">
          <li v-for="[label, to] in group.links" :key="to"><NuxtLink :to="to!" class="text-[16px] text-[#59585d] underline-offset-4 hover:text-[#caa05c] hover:underline focus-visible:outline-2">{{ label }}</NuxtLink></li>
        </ul>
      </section>
    </nav>
  </main>
</template>
