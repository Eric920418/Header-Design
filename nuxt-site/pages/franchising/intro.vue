<script setup lang="ts">
import { ArrowRight, Download, Plus } from 'lucide-vue-next'
import {
  FRANCHISE_FORM_URL,
  franchiseAdvantages,
  franchiseFaqItems,
  franchiseMarketingStories,
  franchiseTestimonials,
} from '~/data/franchise'
import { newsArticles } from '~/data/news'

useSeoMeta({
  title: '我要加盟｜SAKURA 整體廚房',
  description: '了解 SAKURA 整體廚房加盟優勢、總部支援、加盟流程與申請條件，加入全台專業廚房服務網絡。',
  ogTitle: '我要加盟｜SAKURA 整體廚房',
  ogDescription: '從自有工廠、品牌行銷、商圈評估到廚藝大學訓練，完整認識 SAKURA KITCHEN 加盟支援。',
  ogImage: '/section-6/franchise/hero-store.jpg',
})

const openFaq = ref(0)
const marketingTrack = ref<HTMLElement | null>(null)
const franchiseNewsIds = ['franchise-seminar-2026', 'kaohsiung-brand-hall', 'franchise-expo-2025']
const franchiseNews = franchiseNewsIds
  .map(id => newsArticles.find(article => article.id === id))
  .filter(article => article !== undefined)

const toggleFaq = (index: number) => {
  openFaq.value = openFaq.value === index ? -1 : index
}

const scrollMarketing = (direction: -1 | 1) => {
  const track = marketingTrack.value
  if (!track) return
  track.scrollBy({ left: direction * Math.min(track.clientWidth * 0.82, 780), behavior: 'smooth' })
}
</script>

<template>
  <main class="franchise-page">
    <!-- Antra Home 05 / Banner Top / Elementor container 15c08dc -->
    <section id="introduction" class="franchise-hero elementor-15c08dc" aria-labelledby="franchise-page-title">
      <InternalFranchiseImage src="/section-6/franchise/hero-building.jpg" alt="SAKURA KITCHEN 櫻花整體廚房門市建築外觀" eager class="franchise-hero__background" />
      <span class="franchise-hero__overlay" aria-hidden="true" />
      <div class="source-rail-wide franchise-hero__inner internal-rail-safe">
        <div class="franchise-hero__grid">
          <div v-reveal="{ anim: 'opalMoveRight' }" data-ev="opalMoveRight" class="ev">
            <span class="source-pill source-pill--dark"><i aria-hidden="true" />我要加盟</span>
            <h1 id="franchise-page-title">Find Your Inspired<br /><span>Interior Design</span></h1>
          </div>
          <div v-reveal="{ anim: 'opalMoveLeft', delay: 120 }" data-ev="opalMoveLeft" class="franchise-hero__aside ev">
            <p>台灣櫻花陪伴消費者超過四十六年，在台灣家庭的滲透率超過 73%，使用櫻花產品或服務的家庭總數超過 700 萬戶。</p>
            <p>不僅連續 36 年獲得理想品牌，更穩坐熱水器、除油煙機、瓦斯爐三冠王寶座。</p>
            <NuxtLink :to="FRANCHISE_FORM_URL" class="source-round-link">立即申請加盟 <ArrowRight aria-hidden="true" /></NuxtLink>
          </div>
        </div>
      </div>
    </section>

    <!-- Antra Home 05 / Image Top / Elementor container 729c843 -->
    <div v-reveal="{ anim: 'opalMoveUp', delay: 260 }" data-ev="opalMoveUp" class="source-rail-wide franchise-hero-media elementor-729c843 ev">
      <InternalFranchiseImage src="/section-6/franchise/hero-store.jpg" alt="SAKURA KITCHEN 櫻花整體廚房加盟門市" eager />
    </div>

    <!-- Antra Home 05 / About Antra / Elementor container df512f3 -->
    <section class="franchise-about elementor-df512f3" aria-labelledby="franchise-story-title">
      <div class="source-rail-wide internal-rail-safe">
        <div class="franchise-about__grid">
          <aside class="source-heading-rail">
            <span class="source-pill"><i aria-hidden="true" />About SAKURA</span>
            <span class="source-heading-rail__line" aria-hidden="true" />
            <NuxtLink to="/franchising/download" class="source-round-link source-round-link--outline"><Download aria-hidden="true" /> 加盟資料下載</NuxtLink>
          </aside>

          <div class="franchise-about__content">
            <h2 id="franchise-story-title">We Shape <span>Interior Designs, Crafting</span> Timeless And Inspiring Spaces</h2>
            <div v-reveal="{ anim: 'opalScaleUp' }" data-ev="opalScaleUp" class="franchise-about__video ev">
              <InternalFranchiseVideo video-id="sAuAjtpvZYk" title="SAKURA KITCHEN 店經理的創業故事" />
            </div>

            <p class="franchise-about__lead">聽聽加盟店經理如何從零開始，在品牌、訓練與總部資源的支持下，把廚房專業經營成一份能長久投入的事業。</p>
            <div class="franchise-testimonials">
              <article v-for="(testimonial, index) in franchiseTestimonials" :key="testimonial.name" v-reveal="{ anim: 'opalMoveUp', delay: index * 100 }" data-ev="opalMoveUp" class="franchise-testimonial ev">
                <blockquote>「{{ testimonial.quote }}」</blockquote>
                <div class="franchise-testimonial__person">
                  <InternalFranchiseImage :src="testimonial.portrait" :alt="`${testimonial.name}${testimonial.role}`" />
                  <div><strong>{{ testimonial.name }} {{ testimonial.role }}</strong><span>{{ testimonial.tenure }} · {{ testimonial.store }}</span></div>
                </div>
              </article>
            </div>
          </div>
        </div>

        <div class="franchise-story-strip">
          <InternalFranchiseImage src="/section-6/franchise/story-strip.png" alt="SAKURA KITCHEN 加盟品牌績效、廚房設計與服務成果" fit="contain" />
        </div>
      </div>
    </section>

    <!-- Antra Home 05 / Blog silhouette / Elementor container 158f4e8 -->
    <section id="advantages" class="franchise-advantages elementor-158f4e8" aria-labelledby="franchise-advantage-title">
      <div class="source-rail internal-rail-safe">
        <div class="franchise-advantages__layout">
          <header class="franchise-advantages__intro">
            <span class="source-pill"><i aria-hidden="true" />Franchise Advantages</span>
            <h2 id="franchise-advantage-title">Take A Look At<br /><span>Our Latest Blog</span><br />&amp; Articles.</h2>
            <p>加盟創業首選品牌。從生產、商品、品牌、展店到售後與人才培育，六大優勢建立能長期經營的完整系統。</p>
            <strong aria-hidden="true">01</strong>
          </header>

          <div class="franchise-post-grid layout-post-style-1">
            <article v-for="(advantage, index) in franchiseAdvantages" :key="advantage.id" v-reveal="{ anim: 'opalMoveUp', delay: (index % 2) * 90 }" data-ev="opalMoveUp" class="franchise-post post-style-1 ev">
              <div class="franchise-post__media">
                <InternalFranchiseImage :src="advantage.image" :alt="advantage.imageAlt" />
                <span v-if="advantage.badge">{{ advantage.badge }}</span>
              </div>
              <div class="franchise-post__content">
                <span>{{ advantage.number }} · SAKURA</span>
                <h3>{{ advantage.title }}</h3>
                <p>{{ advantage.summary }}</p>
                <InternalFranchiseImage :src="advantage.iconStrip" :alt="advantage.iconAlt" fit="contain" class="franchise-post__icons" />
              </div>
            </article>
          </div>
        </div>
      </div>
    </section>

    <!-- Antra Home 01 / Our Projects / Elementor container 1bcdd25 -->
    <section class="franchise-projects elementor-1bcdd25" aria-labelledby="franchise-marketing-title">
      <div class="source-rail internal-rail-safe">
        <header class="source-split-heading">
          <div class="source-heading-rail source-heading-rail--compact">
            <span class="source-pill"><i aria-hidden="true" />Our Projects</span>
            <span class="source-heading-rail__line" aria-hidden="true" />
          </div>
          <div>
            <h2 id="franchise-marketing-title">Creative <span>Projects That Define</span> Our Style</h2>
            <p>集團採用強勢整合行銷策略，結合多媒體廣告與數位行銷資源，持續推出高效宣傳活動，快速提升品牌影響力，為加盟店打造穩固的市場優勢。</p>
          </div>
        </header>

        <div ref="marketingTrack" class="franchise-project-track elementor-widget-antra-project" tabindex="0" aria-label="品牌行銷案例，可用左右方向鍵或觸控水平瀏覽" @keydown.left.prevent="scrollMarketing(-1)" @keydown.right.prevent="scrollMarketing(1)">
          <article v-for="(story, index) in franchiseMarketingStories" :key="story.title" class="project-block">
            <InternalFranchiseImage :src="story.image" :alt="story.title" />
            <div class="project-block__content"><h3>{{ story.title }}</h3><span>{{ String(index + 1).padStart(2, '0') }}</span></div>
          </article>
        </div>
      </div>
    </section>

    <!-- Antra Footer 1 / Newsletter / Elementor container 8ca2535 -->
    <section class="franchise-newsletter elementor-8ca2535" aria-labelledby="franchise-conversion-title">
      <div v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="franchise-newsletter__content ev">
        <span class="source-pill"><i aria-hidden="true" />Subscribe To The Newsletter</span>
        <h2 id="franchise-conversion-title">Join <span>Our Newsletter</span><br /><span>Stay</span> Up To Date</h2>
        <p>開店補助金讓您起步沒壓力、業績獎金幫您多賺一筆，還有專業教育訓練，協助門市穩穩站穩市場。</p>
        <NuxtLink :to="FRANCHISE_FORM_URL" class="source-round-link source-round-link--gold">快來了解加盟金、補助金，填寫表單 <ArrowRight aria-hidden="true" /></NuxtLink>
      </div>
    </section>

    <!-- Antra Home 01 spacing + the official client process/qualification artwork -->
    <section id="franchise-process" class="franchise-process elementor-ef444c3" aria-labelledby="franchise-process-title">
      <div class="source-rail internal-rail-safe">
        <header class="franchise-process__heading">
          <span class="source-pill"><i aria-hidden="true" />How To Join</span>
          <h2 id="franchise-process-title">Join <span>Our Newsletter</span><br /><span>Stay</span> Up To Date</h2>
          <p>加盟流程與辦法｜送出申請後，總部會依資格、店址與商圈條件進行評估，每一步都有專人協助。</p>
        </header>
        <div v-reveal="{ anim: 'opalMoveUp' }" data-ev="opalMoveUp" class="franchise-process__art elementor-antra-process-wrapper ev">
          <InternalFranchiseImage src="/section-6/franchise/franchise-overview.png" alt="櫻花整體廚房七步加盟流程、創業補助與加盟資格條件" fit="contain" />
        </div>
      </div>
    </section>

    <!-- Antra Service Detail / Elementor container 7179c4a -->
    <section id="franchise-faq" class="franchise-faq elementor-7179c4a" aria-labelledby="franchise-faq-title">
      <div class="source-rail internal-rail-safe franchise-faq__grid">
        <aside v-reveal="{ anim: 'opalMoveRight' }" data-ev="opalMoveRight" class="franchise-faq__promo ev">
          <InternalFranchiseImage src="/section-6/franchise/hero-building.jpg" alt="SAKURA KITCHEN 櫻花整體廚房加盟據點" />
          <span class="franchise-faq__shade" aria-hidden="true" />
          <div><span>加盟諮詢專線</span><strong>0800-455-997</strong></div>
          <NuxtLink :to="FRANCHISE_FORM_URL"><span>我要加盟</span><ArrowRight aria-hidden="true" /></NuxtLink>
        </aside>

        <div v-reveal="{ anim: 'opalMoveLeft' }" data-ev="opalMoveLeft" class="franchise-faq__content ev">
          <p>加盟前的常見疑問，從經驗、資金、選址到總部支援，一次了解申請前需要準備的資訊。</p>
          <h2 id="franchise-faq-title">Frequently Asked Questions</h2>
          <div class="franchise-faq__list elementor-nested-accordion">
            <article v-for="(item, index) in franchiseFaqItems.slice(0, 4)" :key="item.question" class="franchise-faq__item">
              <h3>
                <button type="button" :aria-expanded="openFaq === index" :aria-controls="`franchise-faq-panel-${index}`" @click="toggleFaq(index)">
                  <span>{{ item.question }}</span><Plus aria-hidden="true" :class="{ 'is-open': openFaq === index }" />
                </button>
              </h3>
              <div :id="`franchise-faq-panel-${index}`" class="franchise-faq__panel" :class="{ 'is-open': openFaq === index }" role="region" :aria-hidden="openFaq !== index"><div><p>{{ item.answer }}</p></div></div>
            </article>
          </div>
        </div>
      </div>
    </section>

    <!-- Antra Home 05 / Trusted Experience / Elementor container 836324d -->
    <section id="franchise-news" class="franchise-news elementor-836324d" aria-labelledby="franchise-news-title">
      <div class="source-rail internal-rail-safe">
        <span class="source-pill"><i aria-hidden="true" />招商訊息</span>
        <h2 id="franchise-news-title">Behind <span>Every Statistic Pulses</span> A Human Story</h2>
        <div class="franchise-news__list">
          <NuxtLink v-for="article in franchiseNews" :key="article.id" :to="article.legacyPath" class="franchise-news-row">
            <i aria-hidden="true" /><h3>{{ article.title }}</h3><ArrowRight aria-hidden="true" />
          </NuxtLink>
        </div>
        <div class="franchise-news__more"><NuxtLink to="/news/latest" class="source-round-link source-round-link--outline">查看更多 <ArrowRight aria-hidden="true" /></NuxtLink></div>
      </div>
    </section>
  </main>
</template>

<style scoped>
.franchise-page { overflow: clip; color: #1c1c1d; background: #f6f6f6; }
.source-rail-wide { width: min(1770px, calc(100% - 60px)); margin-inline: auto; box-sizing: border-box; }
.source-rail { width: min(1410px, calc(100% - 60px)); margin-inline: auto; box-sizing: border-box; }

.source-pill { display: inline-flex; width: max-content; align-items: center; gap: 7px; padding: 8px 14px; border: 1px solid rgb(159 159 164 / 28%); border-radius: 26px; color: #1c1c1d; font-family: var(--font-ui); font-size: 12px; line-height: 14px; letter-spacing: 1px; text-transform: uppercase; }
.source-pill i { width: 5px; height: 5px; flex: none; border-radius: 50%; background: #caa05c; }
.source-pill--dark { border-color: rgb(255 255 255 / 24%); color: #fff; }
.source-round-link { display: inline-flex; min-height: 52px; width: max-content; align-items: center; justify-content: center; gap: 11px; padding: 13px 21px; border: 1px solid rgb(255 255 255 / 22%); border-radius: 999px; color: #fff; font-family: var(--font-ui); font-size: 14px; line-height: 20px; transition: color .3s ease, border-color .3s ease, background-color .3s ease, transform .3s ease; }
.source-round-link svg { width: 18px; height: 18px; }
.source-round-link:hover { transform: translateY(-2px); }
.source-round-link--gold { border-color: #caa05c; color: #1c1c1d; background: #caa05c; }
.source-round-link--outline { border-color: rgb(89 88 93 / 36%); color: #1c1c1d; }
.source-round-link--outline:hover { border-color: #caa05c; color: #a57b38; }

.franchise-hero { position: relative; z-index: 0; min-height: 910px; overflow: hidden; color: #fff; background: #1c1c1d; }
.franchise-hero__background { position: absolute; z-index: -2; inset: 0; opacity: .72; }
.franchise-hero__background :deep(img) { object-position: center 52%; transform: scale(1.02); }
.franchise-hero__overlay { position: absolute; z-index: -1; inset: 0; background: rgb(16 8 1 / 72%); }
.franchise-hero__inner { padding: 158px 30px 0; }
.franchise-hero__grid { display: grid; grid-template-columns: 64% 36%; align-items: start; }
.franchise-hero h1 { max-width: 960px; margin: 20px 0 0; color: #fff; font-family: var(--font-display); font-size: clamp(76px, 7.28vw, 110px); font-weight: 400; line-height: 1; letter-spacing: -1px; }
.franchise-hero h1 span { color: #caa05c; }
.franchise-hero__aside { width: min(454px, 100%); margin: 89px 0 0 6px; }
.franchise-hero__aside p { margin: 0; color: rgb(255 255 255 / 82%); font-size: 20px; line-height: 24px; }
.franchise-hero__aside p + p { margin-top: 16px; }
.franchise-hero__aside .source-round-link { margin-top: 50px; }

.franchise-hero-media { position: relative; z-index: 9; height: clamp(520px, 42.5vw, 760px); margin-top: -400px; overflow: hidden; border-radius: 24px; }
.franchise-hero-media :deep(img) { object-position: center 55%; }

.franchise-about { padding: 124px 30px 0; background: #fff url('/section-6/franchise/antra-original/h6-bg-3.png') top right / auto no-repeat; }
.franchise-about::after { position: absolute; pointer-events: none; content: ""; }
.franchise-about__grid { display: grid; grid-template-columns: 30% 70%; }
.source-heading-rail { position: relative; min-height: 100%; padding-top: 70px; }
.source-heading-rail__line { position: absolute; top: 138px; left: 30px; width: min(300px, calc(100% - 60px)); border-top: 1px solid #e3e3e8; }
.source-heading-rail__line::after { position: absolute; top: -68px; right: 0; height: 200px; border-right: 1px solid #e3e3e8; content: ""; }
.source-heading-rail > .source-round-link { position: absolute; bottom: 92px; left: 0; }
.franchise-about__content { padding: 70px 0 90px 58px; }
.franchise-about h2,
.franchise-advantages h2,
.franchise-projects h2,
.franchise-newsletter h2,
.franchise-process h2,
.franchise-news h2 { margin: 0; font-family: var(--font-display); font-size: 60px; font-weight: 400; line-height: 64px; letter-spacing: -.02em; }
.franchise-about h2 { max-width: 822px; margin-bottom: 50px; }
.franchise-about h2 span,
.franchise-advantages h2 span,
.franchise-projects h2 span,
.franchise-newsletter h2 span,
.franchise-process h2 span,
.franchise-news h2 span { color: #caa05c; }
.franchise-about__video { width: 100%; margin-bottom: 44px; }
.franchise-about__lead { max-width: 766px; margin: 0 0 44px; color: #1c1c1d; font-size: 20px; font-weight: 500; line-height: 24px; }
.franchise-testimonials { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 35px; }
.franchise-testimonial { padding-top: 25px; border-top: 1px solid #e3e3e8; }
.franchise-testimonial blockquote { margin: 0; color: #59585d; font-size: 16px; line-height: 25px; }
.franchise-testimonial__person { display: flex; align-items: center; gap: 14px; margin-top: 24px; }
.franchise-testimonial__person > :deep(.franchise-image) { width: 54px; height: 54px; flex: none; border-radius: 50%; }
.franchise-testimonial__person strong,
.franchise-testimonial__person span { display: block; }
.franchise-testimonial__person strong { font-family: var(--font-ui); font-size: 16px; font-weight: 400; }
.franchise-testimonial__person span { margin-top: 4px; color: #9f9fa4; font-size: 12px; }
.franchise-story-strip { height: auto; margin: 0 0 0; padding: 0 0 88px; background: url('/section-6/franchise/antra-original/h5-bg1.png') bottom left / auto no-repeat; }
.franchise-story-strip > :deep(.franchise-image) { aspect-ratio: 964 / 272; background: transparent; }

.franchise-advantages { padding: 97px 30px 110px; background: #f6f6f6 url('/section-6/franchise/antra-original/h1-bg05.png') top right / auto no-repeat; }
.franchise-advantages__layout { display: grid; grid-template-columns: 30% 70%; gap: 0; }
.franchise-advantages__intro { position: sticky; top: 92px; align-self: start; padding: 15px 58px 0 0; }
.franchise-advantages__intro h2 { margin-top: 28px; }
.franchise-advantages__intro p { max-width: 360px; margin: 24px 0 0; color: #59585d; font-size: 16px; line-height: 25px; }
.franchise-advantages__intro > strong { display: block; margin-top: 55px; color: rgb(159 159 164 / 18%); font-family: var(--font-ui); font-size: 116px; font-weight: 400; line-height: 1; }
.franchise-post-grid { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 56px 30px; }
.franchise-post__media { position: relative; aspect-ratio: 1.52 / 1; overflow: hidden; border-radius: 18px; }
.franchise-post__media > span { position: absolute; top: 16px; left: 16px; padding: 7px 13px; border-radius: 999px; color: #fff; background: #caa05c; font-size: 11px; }
.franchise-post:hover .franchise-post__media :deep(img) { transform: scale(1.045); }
.franchise-post__content { padding-top: 18px; }
.franchise-post__content > span { color: #caa05c; font-size: 12px; line-height: 20px; }
.franchise-post h3 { margin: 6px 0 0; font-family: var(--font-display); font-size: 28px; font-weight: 400; line-height: 34px; }
.franchise-post p { margin: 15px 0 18px; color: #59585d; font-size: 14px; line-height: 23px; }
.franchise-post__icons { height: 62px; padding-top: 12px; border-top: 1px solid #e3e3e8; background: transparent; }
.franchise-post__icons :deep(img) { object-position: left center; }

.franchise-projects { padding: 97px 30px 108px; background: #f6f6f6 url('/section-6/franchise/antra-original/h1-bg02.png') top right / auto no-repeat; }
.source-split-heading { display: grid; grid-template-columns: 30% 70%; margin-bottom: 59px; overflow: hidden; }
.source-heading-rail--compact { min-height: 220px; padding-top: 18px; }
.source-heading-rail--compact .source-heading-rail__line { top: 65px; }
.source-split-heading > div:last-child { padding-left: 58px; }
.source-split-heading h2 { max-width: 620px; margin-top: 65px; }
.source-split-heading p { max-width: 636px; margin: 30px 0 0; color: #59585d; font-size: 16px; line-height: 25px; }
.franchise-project-track { display: flex; gap: 30px; overflow-x: auto; overscroll-behavior-inline: contain; padding: 0 0 12px; scroll-snap-type: x mandatory; scrollbar-width: none; }
.franchise-project-track::-webkit-scrollbar { display: none; }
.project-block { min-width: calc((100% - 60px) / 3); overflow: hidden; scroll-snap-align: start; border-radius: 18px; background: #fff; box-shadow: 0 16px 50px rgb(28 28 29 / 5%); }
.project-block:nth-child(3n + 2) { transform: translateY(50px); }
.project-block > :deep(.franchise-image) { aspect-ratio: 1.45 / 1; border-radius: 18px; }
.project-block:hover :deep(img) { transform: scale(1.04); }
.project-block__content { position: relative; min-height: 138px; padding: 22px 62px 25px 22px; }
.project-block__content h3 { margin: 0; font-family: var(--font-display); font-size: 24px; font-weight: 400; line-height: 30px; }
.project-block__content span { position: absolute; top: 25px; right: 22px; color: #e3e3e8; font-family: var(--font-ui); font-size: 18px; }

.franchise-newsletter { position: relative; isolation: isolate; overflow: hidden; padding: 126px 30px 135px; text-align: center; background: #f6f6f6; }
.franchise-newsletter::before,
.franchise-newsletter::after { position: absolute; z-index: -1; bottom: 0; width: 52%; height: 100%; opacity: .16; background: url('/section-6/franchise/antra-original/footer-demo1.png') bottom left / auto 88% no-repeat; content: ""; }
.franchise-newsletter::before { left: 0; }
.franchise-newsletter::after { right: 0; transform: scaleX(-1); }
.franchise-newsletter__content { display: flex; flex-direction: column; align-items: center; }
.franchise-newsletter h2 { max-width: 650px; margin-top: 20px; }
.franchise-newsletter p { max-width: 682px; margin: 30px 0 0; color: #59585d; font-size: 16px; line-height: 25px; }
.franchise-newsletter .source-round-link { margin-top: 38px; }

.franchise-process { padding: 130px 30px 114px; background: #fff url('/section-6/franchise/antra-original/h1-bg01-1.png') bottom center / cover no-repeat; }
.franchise-process__heading { display: flex; flex-direction: column; align-items: center; text-align: center; }
.franchise-process h2 { max-width: 650px; margin-top: 22px; }
.franchise-process__heading p { max-width: 690px; margin: 26px 0 0; color: #59585d; font-size: 16px; line-height: 25px; }
.franchise-process__art { width: min(1100px, 100%); margin: 54px auto 0; }
.franchise-process__art > :deep(.franchise-image) { aspect-ratio: 968 / 676; background: transparent; }

.franchise-faq { padding: 100px 30px 130px; background: #f6f6f6; }
.franchise-faq__grid { display: grid; grid-template-columns: 32% 68%; gap: 60px; }
.franchise-faq__promo { position: relative; min-height: 520px; overflow: hidden; border-radius: 18px; color: #fff; }
.franchise-faq__promo > :deep(.franchise-image) { position: absolute; inset: 0; }
.franchise-faq__promo :deep(img) { object-position: 58% center; }
.franchise-faq__shade { position: absolute; inset: 0; background: linear-gradient(180deg, rgb(0 0 0 / 22%), rgb(0 0 0 / 84%)); }
.franchise-faq__promo > div { position: absolute; z-index: 1; top: 38px; left: 38px; }
.franchise-faq__promo > div span,
.franchise-faq__promo > div strong { display: block; }
.franchise-faq__promo > div span { color: rgb(255 255 255 / 70%); font-size: 12px; letter-spacing: 1px; }
.franchise-faq__promo > div strong { margin-top: 8px; font-family: var(--font-ui); font-size: 27px; font-weight: 400; }
.franchise-faq__promo > a { position: absolute; z-index: 1; bottom: 38px; left: 38px; display: inline-flex; width: 118px; height: 118px; flex-direction: column; align-items: center; justify-content: center; gap: 8px; border-radius: 50%; color: #fff; background: rgb(255 255 255 / 22%); backdrop-filter: blur(16px); font-family: var(--font-ui); font-size: 14px; }
.franchise-faq__promo > a svg { width: 20px; }
.franchise-faq__content { padding-top: 8px; }
.franchise-faq__content > p { max-width: 760px; margin: 0 0 24px; color: #59585d; font-size: 16px; line-height: 25px; }
.franchise-faq__content h2 { margin: 0 0 30px; font-family: var(--font-display); font-size: 42px; font-weight: 400; line-height: 48px; }
.franchise-faq__item { border-top: 1px solid rgb(159 159 164 / 48%); }
.franchise-faq__item:last-child { border-bottom: 1px solid rgb(159 159 164 / 48%); }
.franchise-faq__item h3 { margin: 0; }
.franchise-faq__item button { display: flex; width: 100%; align-items: center; justify-content: space-between; gap: 25px; padding: 23px 0 26px; text-align: left; }
.franchise-faq__item button > span { font-family: var(--font-ui); font-size: 26px; line-height: 30px; }
.franchise-faq__item button > svg { width: 20px; flex: none; transition: color .3s ease, transform .3s ease; }
.franchise-faq__item button > svg.is-open { color: #caa05c; transform: rotate(45deg); }
.franchise-faq__panel { display: grid; grid-template-rows: 0fr; transition: grid-template-rows .4s ease; }
.franchise-faq__panel.is-open { grid-template-rows: 1fr; }
.franchise-faq__panel > div { overflow: hidden; }
.franchise-faq__panel p { max-width: 835px; margin: -2px 0 32px; color: #59585d; font-size: 15px; line-height: 24px; }

.franchise-news { padding: 108px 30px 86px; background: #fff url('/section-6/franchise/antra-original/h5-bg02.png') top right / auto no-repeat; }
.franchise-news h2 { max-width: 786px; margin-top: 28px; }
.franchise-news__list { margin-top: 60px; border-top: 1px solid #e3e3e8; }
.franchise-news-row { display: grid; grid-template-columns: 14px 1fr 46px; gap: 18px; align-items: center; min-height: 84px; border-bottom: 1px solid #e3e3e8; }
.franchise-news-row > i { width: 6px; height: 6px; border-radius: 50%; background: #caa05c; }
.franchise-news-row h3 { margin: 0; font-family: var(--font-display); font-size: 25px; font-weight: 400; line-height: 31px; transition: color .3s ease; }
.franchise-news-row > svg { width: 38px; height: 38px; padding: 10px; border: 1px solid #e3e3e8; border-radius: 50%; transition: border-color .3s ease, transform .3s ease; }
.franchise-news-row:hover h3 { color: #a57b38; }
.franchise-news-row:hover > svg { border-color: #caa05c; transform: translateX(3px); }
.franchise-news__more { display: flex; justify-content: center; margin-top: 50px; }

@media (max-width: 1200px) {
  .franchise-hero h1 { font-size: 76px; }
  .franchise-about h2,
  .franchise-advantages h2,
  .franchise-projects h2,
  .franchise-newsletter h2,
  .franchise-process h2,
  .franchise-news h2 { font-size: 50px; line-height: 55px; }
  .franchise-about__content,
  .source-split-heading > div:last-child { padding-left: 30px; }
  .franchise-post h3 { font-size: 24px; line-height: 30px; }
}

@media (max-width: 1024px) {
  .franchise-hero { min-height: 760px; }
  .franchise-hero__inner { padding-top: 110px; }
  .franchise-hero__grid { grid-template-columns: 58% 42%; }
  .franchise-hero h1 { font-size: 62px; }
  .franchise-hero__aside { margin-top: 68px; }
  .franchise-hero__aside p { font-size: 16px; line-height: 24px; }
  .franchise-hero-media { height: 500px; margin-top: -260px; }
  .franchise-about { padding-top: 80px; }
  .franchise-about__grid { grid-template-columns: 27% 73%; }
  .source-heading-rail__line { left: 0; width: calc(100% - 30px); }
  .franchise-advantages__layout { grid-template-columns: 32% 68%; }
  .franchise-post-grid { gap: 40px 22px; }
  .project-block { min-width: calc((100% - 30px) / 2); }
  .project-block:nth-child(3n + 2) { transform: none; }
  .project-block:nth-child(even) { transform: translateY(35px); }
  .franchise-faq__grid { grid-template-columns: 36% 64%; gap: 35px; }
  .franchise-faq__content h2 { font-size: 36px; line-height: 42px; }
  .franchise-faq__item button > span { font-size: 21px; line-height: 27px; }
}

@media (max-width: 767px) {
  .source-rail,
  .source-rail-wide { width: calc(100% - 30px); }
  .source-round-link { width: 100%; }
  .franchise-hero { min-height: 660px; }
  .franchise-hero__inner { width: 100%; padding: 100px 15px 0; }
  .franchise-hero__grid { grid-template-columns: 1fr; }
  .franchise-hero h1 { margin-top: 20px; font-size: 42px; line-height: 46px; letter-spacing: 0; }
  .franchise-hero__aside { width: 100%; margin: 35px 0 0; }
  .franchise-hero__aside p { font-size: 15px; line-height: 24px; }
  .franchise-hero__aside p + p { display: none; }
  .franchise-hero__aside .source-round-link { margin-top: 28px; }
  .franchise-hero-media { height: 280px; margin-top: -60px; border-radius: 18px; }

  .franchise-about,
  .franchise-advantages,
  .franchise-projects,
  .franchise-newsletter,
  .franchise-process,
  .franchise-faq,
  .franchise-news { padding: 75px 15px 80px; }
  .franchise-about { background-size: 70% auto; }
  .franchise-about__grid { grid-template-columns: 1fr; }
  .source-heading-rail { min-height: auto; padding: 0; }
  .source-heading-rail__line { display: none; }
  .source-heading-rail > .source-round-link { position: static; margin-top: 22px; }
  .franchise-about__content { padding: 38px 0 50px; }
  .franchise-about h2,
  .franchise-advantages h2,
  .franchise-projects h2,
  .franchise-newsletter h2,
  .franchise-process h2,
  .franchise-news h2 { font-size: 34px; line-height: 39px; }
  .franchise-about h2 { margin-bottom: 34px; }
  .franchise-about__lead { margin-bottom: 28px; font-size: 16px; line-height: 24px; }
  .franchise-testimonials { grid-template-columns: 1fr; gap: 28px; }
  .franchise-testimonial blockquote { font-size: 14px; line-height: 23px; }
  .franchise-story-strip { padding-bottom: 0; background: none; }

  .franchise-advantages__layout { grid-template-columns: 1fr; }
  .franchise-advantages__intro { position: static; padding: 0 0 38px; }
  .franchise-advantages__intro > strong { display: none; }
  .franchise-post-grid { grid-template-columns: 1fr; gap: 40px; }
  .franchise-post h3 { font-size: 25px; line-height: 31px; }

  .source-split-heading { grid-template-columns: 1fr; margin-bottom: 38px; }
  .source-heading-rail--compact { min-height: auto; }
  .source-split-heading > div:last-child { padding: 0; }
  .source-split-heading h2 { margin-top: 28px; }
  .source-split-heading p { font-size: 15px; line-height: 24px; }
  .project-block { min-width: 84vw; }
  .project-block:nth-child(even) { transform: none; }
  .project-block__content h3 { font-size: 20px; line-height: 26px; }

  .franchise-newsletter::before,
  .franchise-newsletter::after { width: 100%; opacity: .1; background-size: auto 72%; }
  .franchise-newsletter p,
  .franchise-process__heading p { font-size: 15px; line-height: 24px; }
  .franchise-process__art { margin-top: 38px; }

  .franchise-faq__grid { grid-template-columns: 1fr; gap: 42px; }
  .franchise-faq__promo { min-height: 420px; }
  .franchise-faq__content h2 { font-size: 34px; line-height: 39px; }
  .franchise-faq__item button { padding: 20px 0 22px; }
  .franchise-faq__item button > span { font-size: 19px; line-height: 25px; }
  .franchise-faq__panel p { font-size: 14px; line-height: 23px; }

  .franchise-news__list { margin-top: 40px; }
  .franchise-news-row { min-height: 76px; grid-template-columns: 10px 1fr 40px; gap: 12px; }
  .franchise-news-row h3 { font-size: 19px; line-height: 25px; }
}

@media (prefers-reduced-motion: reduce) {
  .source-round-link,
  .franchise-faq__item button > svg,
  .franchise-faq__panel,
  .franchise-news-row h3,
  .franchise-news-row > svg { transition: none; }
  .source-round-link:hover,
  .franchise-news-row:hover > svg { transform: none; }
}
</style>
