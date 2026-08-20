<script setup lang="ts">
import { ArrowDown } from 'lucide-vue-next'
</script>

<template>
  <section class="brand-h8-hero" aria-labelledby="brand-h8-title">
    <div class="brand-h8-intro">
      <div class="brand-h8-intro__rail">
        <div v-reveal="{ anim: 'opalMoveRight' }" data-ev="opalMoveRight" class="brand-h8-copy ev">
          <span class="brand-h8-pill"><i aria-hidden="true" />品牌優勢</span>
          <h1 id="brand-h8-title">Find Your<br /><span>Inspired<br />Interior</span> Design</h1>
          <nav class="brand-h8-nav" aria-label="品牌承諾頁面">
            <NuxtLink to="/about/advantage" aria-current="page"><b aria-hidden="true">。</b><span>品牌優勢</span></NuxtLink>
            <NuxtLink to="/about/exhibition"><b aria-hidden="true">。</b><span>集團品牌館</span></NuxtLink>
            <NuxtLink to="/about/introduce"><b aria-hidden="true">。</b><span>關於我們</span></NuxtLink>
          </nav>
          <a href="#brand-family-title" class="brand-h8-scroll" aria-label="向下查看品牌優勢內容">
            <ArrowDown aria-hidden="true" />
          </a>
        </div>

        <div v-reveal="{ anim: 'opalMoveLeft', delay: 120 }" data-ev="opalMoveLeft" class="brand-h8-aside ev" style="animation-delay:120ms">
          <InternalBrandImage
            src="/section-5/brand-advantage/banner.jpg"
            alt="SAKURA 品牌優勢廚房局部空間"
            eager
            class="brand-h8-aside__image"
          />
          <p>源自全台家庭生活研究與觀察，從真正的使用需求出發，打造符合每個家庭的理想廚房。</p>
        </div>
      </div>
    </div>

    <div v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="brand-h8-stage ev">
      <InternalBrandImage
        src="/section-5/brand-advantage/banner.jpg"
        alt="SAKURA 品牌優勢廚房空間"
        eager
        class="brand-h8-stage__image"
      />
    </div>
  </section>
</template>

<style scoped>
.brand-h8-hero { overflow: hidden; background: #f6f6f6; }
.brand-h8-intro { padding: 165px 30px 376px; background: linear-gradient(90deg, #eae9e7 0 50%, #f6f6f6 50% 100%); }
.brand-h8-intro__rail { display: grid; width: min(1770px, 100%); margin-inline: auto; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 30px; }
.brand-h8-copy { min-width: 0; }
.brand-h8-pill { display: inline-flex; align-items: center; gap: 7px; padding: 7px 13px 7px 10px; border: 1px solid rgb(114 114 114 / 18%); border-radius: 24px; color: #1c1c1d; font-family: var(--font-ui); font-size: 12px; line-height: 14px; letter-spacing: 1px; }
.brand-h8-pill i { width: 6px; height: 6px; border-radius: 50%; background: #caa05c; }
.brand-h8-copy h1 { max-width: 850px; margin: 20px 0 42px; color: #1c1c1d; font-family: var(--font-display); font-size: 100px; font-weight: 400; line-height: 100px; letter-spacing: -.01em; text-transform: capitalize; }
.brand-h8-copy h1 span { color: #caa05c; }
.brand-h8-nav { display: flex; max-width: 570px; border-top: 1px solid #d2d1cf; }
.brand-h8-nav > * { display: flex; min-width: 0; flex: 1; align-items: baseline; gap: 8px; padding: 16px 8px 0 0; color: #9f9fa4; text-decoration: none; }
.brand-h8-nav > * + * { padding-left: 16px; border-left: 1px solid #d2d1cf; }
.brand-h8-nav b,
.brand-h8-nav span { font-family: var(--font-cjk-sans); font-size: 16px; font-weight: 400; line-height: 22px; }
.brand-h8-nav b { color: #caa05c; }
.brand-h8-nav a[aria-current="page"] span { color: #1c1c1d; }
.brand-h8-nav > span[aria-disabled="true"] { opacity: .55; }
.brand-h8-scroll { display: inline-flex; width: 54px; height: 54px; align-items: center; justify-content: center; margin-top: 38px; border: 1px solid rgb(202 160 92 / 35%); border-radius: 50%; background: #caa05c; color: #fff; box-shadow: 0 14px 30px rgb(28 28 29 / 12%); transition: transform .35s ease, box-shadow .35s ease; }
.brand-h8-scroll svg { width: 18px; height: 18px; stroke-width: 1.8; }
.brand-h8-scroll:hover { transform: translateY(4px); box-shadow: 0 8px 18px rgb(28 28 29 / 16%); }
.brand-h8-aside { display: flex; min-width: 0; flex-direction: column; align-items: flex-end; gap: 30px; }
.brand-h8-aside__image { width: min(510px, 100%); height: 267px; border-radius: 28px; }
.brand-h8-aside__image :deep(img) { object-position: 62% 45%; }
.brand-h8-aside p { width: min(510px, 100%); margin: 0; color: #59585d; font-size: 18px; font-weight: 500; line-height: 24px; }
.brand-h8-stage { position: relative; width: min(1770px, calc(100% - 60px)); margin: -300px auto 0; overflow: hidden; border-radius: 24px; }
.brand-h8-stage__image { width: 100%; aspect-ratio: 2 / 1; border-radius: 24px; }

@media (max-width: 1366px) {
  .brand-h8-intro { padding-top: 140px; padding-bottom: 350px; }
  .brand-h8-copy h1 { font-size: 70px; line-height: 70px; }
}

@media (max-width: 1024px) {
  .brand-h8-intro { padding: 100px 30px 0; background: #f6f6f6; }
  .brand-h8-intro__rail { grid-template-columns: 1fr; }
  .brand-h8-copy { text-align: center; }
  .brand-h8-copy h1 { margin-inline: auto; font-size: 60px; line-height: 60px; }
  .brand-h8-nav { margin-inline: auto; text-align: left; }
  .brand-h8-scroll { margin-inline: auto; }
  .brand-h8-aside { align-items: center; }
  .brand-h8-aside p { text-align: center; }
  .brand-h8-stage { width: calc(100% - 60px); margin-top: 60px; }
}

@media (max-width: 767px) {
  .brand-h8-intro { padding: 90px 15px 0; }
  .brand-h8-copy h1 { margin-bottom: 30px; font-size: 40px; line-height: 45px; }
  .brand-h8-nav { display: grid; grid-template-columns: 1fr; }
  .brand-h8-nav > * { padding: 10px 0; }
  .brand-h8-nav > * + * { padding-left: 0; border-left: 0; border-top: 1px solid #d2d1cf; }
  .brand-h8-aside { gap: 20px; }
  .brand-h8-aside__image { height: 250px; }
  .brand-h8-aside p { font-size: 15px; line-height: 24px; }
  .brand-h8-stage { width: calc(100% - 30px); margin-top: 30px; }
  .brand-h8-stage__image { min-height: 260px; aspect-ratio: auto; }
}
</style>
