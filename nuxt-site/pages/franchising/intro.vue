<script setup lang="ts">
import { ArrowRight, Download, Minus, Plus } from 'lucide-vue-next'
import {
  FRANCHISE_FORM_URL,
  franchiseAdvantages,
  franchiseFaqItems,
  franchiseMarketingStories,
  franchiseQualifications,
  franchiseSupportHighlights,
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
const activeAdvantageGroup = ref(0)
const advantageGroups = computed(() => Array.from(
  { length: Math.ceil(franchiseAdvantages.length / 2) },
  (_, index) => franchiseAdvantages.slice(index * 2, index * 2 + 2),
))
let advantageFrame = 0
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

const updateActiveAdvantage = () => {
  cancelAnimationFrame(advantageFrame)
  advantageFrame = requestAnimationFrame(() => {
    const scenes = document.querySelectorAll<HTMLElement>('[data-advantage-group]')
    const viewportCenter = window.innerHeight * 0.5
    let closestIndex = 0
    let closestDistance = Number.POSITIVE_INFINITY

    scenes.forEach((scene) => {
      const rect = scene.getBoundingClientRect()
      const distance = Math.abs(rect.top + rect.height * 0.5 - viewportCenter)
      if (distance < closestDistance) {
        closestDistance = distance
        closestIndex = Number(scene.dataset.advantageGroup ?? 0)
      }
    })

    activeAdvantageGroup.value = closestIndex
  })
}

onMounted(() => {
  updateActiveAdvantage()
  window.addEventListener('scroll', updateActiveAdvantage, { passive: true })
  window.addEventListener('resize', updateActiveAdvantage, { passive: true })
})

onBeforeUnmount(() => {
  cancelAnimationFrame(advantageFrame)
  window.removeEventListener('scroll', updateActiveAdvantage)
  window.removeEventListener('resize', updateActiveAdvantage)
})
</script>

<template>
  <main class="franchise-page">
    <!-- Antra Home 05 / Banner Top / Elementor container 15c08dc -->
    <section id="introduction" class="franchise-hero hero-includes-header elementor-15c08dc" aria-labelledby="franchise-page-title">
      <InternalFranchiseImage src="/section-6/franchise/hero-building.jpg" alt="SAKURA KITCHEN 櫻花整體廚房門市建築外觀" eager class="franchise-hero__background" />
      <span class="franchise-hero__overlay" aria-hidden="true" />
      <div class="source-rail-wide franchise-hero__inner internal-rail-safe">
        <div class="franchise-hero__grid">
          <div v-reveal="{ anim: 'opalMoveRight' }" data-ev="opalMoveRight" class="ev">
            <InternalSectionPill tone="dark">我要加盟</InternalSectionPill>
            <h1 id="franchise-page-title">Find Your Inspired <span>Kitchen Design</span></h1>
          </div>
          <div v-reveal="{ anim: 'opalMoveLeft', delay: 120 }" data-ev="opalMoveLeft" class="franchise-hero__aside ev">
            <h2>為什麼選擇加盟櫻花整體廚房？</h2>
            <p>台灣櫻花陪伴消費者超過四十六年，在台灣家庭的滲透率超過73%，使用櫻花產品或服務的家庭總數超過700萬戶。</p>
            <p>不僅連續36年獲得理想品牌，更穩坐熱水器、除油煙機、瓦斯爐三冠王寶座。</p>
            <NuxtLink :to="FRANCHISE_FORM_URL" target="_blank" rel="noopener" class="source-round-link source-round-link--hero">立即申請加盟 <ArrowRight aria-hidden="true" /></NuxtLink>
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
          <InternalTemplateHeadingRail v-reveal="{ anim: 'opalMoveRight' }" label="Our Partners" source="home5" class="source-heading-rail">
            <template #actions>
              <NuxtLink to="/franchising/download" target="_blank" rel="noopener" class="source-round-link source-round-link--outline"><Download aria-hidden="true" /> 加盟資料下載</NuxtLink>
            </template>
          </InternalTemplateHeadingRail>

          <div class="franchise-about__content">
            <h2 id="franchise-story-title" v-reveal="{ anim: 'opalMoveLeft', delay: 100 }">We Shape <span>Kitchen Designs, Crafting</span> Timeless and Inspiring Spaces</h2>
            <div v-reveal="{ anim: 'opalScaleUp' }" data-ev="opalScaleUp" class="franchise-about__video ev">
              <InternalFranchiseVideo video-id="sAuAjtpvZYk" title="SAKURA KITCHEN Store Manager Stories" />
            </div>

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

        <div v-reveal="{ anim: 'opalScaleUp' }" class="franchise-marquees" tabindex="0" aria-label="SAKURA KITCHEN 加盟夥伴與品牌成果影像，聚焦時暫停移動">
          <div class="franchise-marquee">
            <div class="franchise-marquee__track">
              <InternalFranchiseImage src="/section-6/franchise/marquee-1.webp" alt="SAKURA KITCHEN 加盟夥伴與門市成果" fit="contain" />
              <InternalFranchiseImage src="/section-6/franchise/marquee-1.webp" alt="" fit="contain" aria-hidden="true" />
            </div>
          </div>
          <div class="franchise-marquee franchise-marquee--reverse">
            <div class="franchise-marquee__track">
              <InternalFranchiseImage src="/section-6/franchise/marquee-2.webp" alt="SAKURA KITCHEN 品牌活動與設計成果" fit="contain" />
              <InternalFranchiseImage src="/section-6/franchise/marquee-2.webp" alt="" fit="contain" aria-hidden="true" />
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Antra Home 05 / Blog silhouette / Elementor container 158f4e8 -->
    <section id="advantages" class="franchise-advantages elementor-158f4e8" aria-labelledby="franchise-advantage-title">
      <div class="source-rail internal-rail-safe">
        <div class="franchise-advantages__layout">
          <header v-reveal="{ anim: 'opalMoveRight' }" class="franchise-advantages__intro">
            <InternalSectionPill>Franchise Advantages</InternalSectionPill>
            <h2 id="franchise-advantage-title">加盟創業首選品牌</h2>
            <p>從生產、商品、品牌、展店到售後與人才培育，六大優勢建立能長期經營的完整系統。</p>
            <strong aria-hidden="true">{{ String(activeAdvantageGroup + 1).padStart(2, '0') }}</strong>
          </header>

          <div class="franchise-advantage-scenes">
            <section v-for="(group, groupIndex) in advantageGroups" :key="groupIndex" :data-advantage-group="groupIndex" class="franchise-advantage-scene" :aria-label="`加盟優勢第 ${groupIndex + 1} 組`">
              <div class="franchise-post-grid layout-post-style-1">
                <article v-for="(advantage, index) in group" :key="advantage.id" class="franchise-post post-style-1">
                  <div v-reveal="{ anim: 'opalScaleUp', delay: index * 70 }" class="franchise-post__media">
                    <InternalFranchiseImage :src="advantage.image" :alt="advantage.imageAlt" />
                    <span v-if="advantage.badge">{{ advantage.badge }}</span>
                  </div>
                  <div class="franchise-post__content">
                    <span v-reveal="{ anim: 'opalMoveUp' }">{{ advantage.number }} · SAKURA</span>
                    <h3 v-reveal="{ anim: 'opalMoveUp', delay: 60 }">{{ advantage.title }}</h3>
                    <p v-reveal="{ anim: 'opalMoveUp', delay: 100 }">{{ advantage.summary }}</p>
                    <ul v-reveal="{ anim: 'opalMoveUp', delay: 140 }" class="franchise-post__features" :aria-label="`${advantage.title}重點`">
                      <li v-for="feature in advantage.features" :key="feature.label">
                        <InternalFranchiseImage :src="feature.icon" :alt="`${feature.label}圖示`" fit="contain" />
                        <span>{{ feature.label }}</span>
                      </li>
                    </ul>
                  </div>
                </article>
              </div>
            </section>
          </div>
        </div>
      </div>
    </section>

    <!-- Antra Home 07 / Newsletter / Elementor container 8ca2535 -->
    <section class="franchise-newsletter elementor-8ca2535" aria-labelledby="franchise-conversion-title">
      <div class="franchise-newsletter__content">
        <InternalSectionPill v-reveal="{ anim: 'opalMoveUp' }" tone="dark">Subscribe To The Newsletter</InternalSectionPill>
        <h2 id="franchise-conversion-title" v-reveal="{ anim: 'opalMoveUp', delay: 70 }">Join <span>Our Newsletter</span><br /><span>Stay</span> Up To Date</h2>
        <p v-reveal="{ anim: 'opalMoveUp', delay: 120 }">從開業到經營，讓您起步沒壓力！開店補助金讓您起步沒壓力，業績獎金幫您多賺一筆，還有專業教育訓練，穩穩站穩市場！</p>
        <NuxtLink v-reveal="{ anim: 'opalScaleUp', delay: 170 }" :to="FRANCHISE_FORM_URL" target="_blank" rel="noopener" class="source-round-link source-round-link--gold">快來了解加盟金、補助金，填寫表單 <ArrowRight aria-hidden="true" /></NuxtLink>
      </div>
    </section>

    <!-- Antra Home 01 / Our Projects / Elementor container 1bcdd25 -->
    <section class="franchise-projects elementor-1bcdd25" aria-labelledby="franchise-marketing-title">
      <div class="source-rail internal-rail-safe">
        <header class="source-split-heading">
          <InternalTemplateHeadingRail v-reveal="{ anim: 'opalMoveRight' }" label="Our Projects" density="compact" source="home1" class="source-heading-rail source-heading-rail--compact" />
          <div v-reveal="{ anim: 'opalMoveLeft', delay: 100 }">
            <h2 id="franchise-marketing-title">強大廣告行銷</h2>
            <p>集團採用強勢整合行銷策略，結合多媒體廣告與數位行銷資源，持續推出高效宣傳活動，快速提升品牌影響力，為加盟店打造穩固的市場優勢。</p>
          </div>
        </header>

        <div ref="marketingTrack" class="franchise-project-track elementor-widget-antra-project" tabindex="0" aria-label="品牌行銷案例，可用左右方向鍵或觸控水平瀏覽" @keydown.left.prevent="scrollMarketing(-1)" @keydown.right.prevent="scrollMarketing(1)">
          <article v-for="(story, index) in franchiseMarketingStories" :key="story.title" v-reveal="{ anim: 'opalMoveUp', delay: (index % 3) * 80 }" class="project-block">
            <InternalFranchiseImage :src="story.image" :alt="story.title" />
            <div class="project-block__content"><h3>{{ story.title }}</h3><span>{{ String(index + 1).padStart(2, '0') }}</span></div>
          </article>
        </div>
      </div>
    </section>

    <!-- PPT 6.1 / official process artwork and HTML support details -->
    <section id="franchise-process" class="franchise-process elementor-ef444c3" aria-labelledby="franchise-process-title">
      <div class="source-rail internal-rail-safe">
        <header class="franchise-process__heading">
          <h2 id="franchise-process-title" v-reveal="{ anim: 'opalMoveUp' }">加盟流程與辦法</h2>
        </header>
        <div v-reveal="{ anim: 'opalScaleUp', delay: 70 }" class="franchise-process__rail-scroll" tabindex="0" aria-label="七步加盟流程，可橫向捲動查看">
          <InternalFranchiseImage src="/section-6/franchise/franchise-process.svg" alt="加盟諮詢、資格審核、商圈與店址評估、營運計畫確認、簽約與店面規劃、教育訓練與實習、開幕與持續輔導七步流程" fit="contain" class="franchise-process__rail" />
        </div>

        <div class="franchise-process__details">
          <article v-reveal="{ anim: 'opalMoveRight' }" class="franchise-support-panel">
            <div class="franchise-support-panel__shade" aria-hidden="true" />
            <div class="franchise-support-panel__content">
              <div v-for="(item, index) in franchiseSupportHighlights" :key="item.title" v-reveal="{ anim: 'opalMoveUp', delay: index * 65 }" class="franchise-support-item">
                <h3>
                  <template v-if="index === 0">{{ item.detail.split('！')[0] }}！</template>
                  <template v-else>{{ item.title }} <span>{{ item.detail.split('！')[0] }}！</span></template>
                </h3>
                <p>{{ item.detail.split('！').slice(1).join('！') }}</p>
              </div>
              <NuxtLink v-reveal="{ anim: 'opalScaleUp', delay: 260 }" :to="FRANCHISE_FORM_URL" target="_blank" rel="noopener" class="franchise-support-panel__cta">我要加盟</NuxtLink>
            </div>
          </article>

          <article v-reveal="{ anim: 'opalMoveLeft', delay: 90 }" class="franchise-qualification-panel">
            <h3>加盟資格與條件</h3>
            <div class="franchise-qualification-list">
              <div v-for="(item, index) in franchiseQualifications" :key="item.title" v-reveal="{ anim: 'opalMoveUp', delay: index * 65 }" class="franchise-qualification-item">
                <InternalFranchiseImage :src="item.icon" :alt="`${item.title}圖示`" fit="contain" />
                <div><h4>{{ item.title }}</h4><p>{{ item.detail }}</p></div>
              </div>
            </div>
          </article>
        </div>
      </div>
    </section>

    <!-- Antra Home 04 / FAQ / Elementor container 83319f9 -->
    <section id="franchise-faq" class="franchise-faq elementor-83319f9" aria-labelledby="franchise-faq-title">
      <div class="source-rail internal-rail-safe franchise-faq__rail">
        <header class="franchise-faq__heading">
          <InternalTemplateHeadingRail
            v-reveal="{ anim: 'opalMoveRight' }"
            label="Franchise FAQs"
            data-ev="opalMoveRight"
            class="franchise-faq__heading-rail ev"
          />
          <h2 id="franchise-faq-title" v-reveal="{ anim: 'opalMoveLeft' }" data-ev="opalMoveLeft" class="ev">
            Quick And Clear <span>Answers<br /> To Your Key</span> Questions
          </h2>
        </header>

        <div class="franchise-faq__body">
          <div v-reveal="{ anim: 'opalMoveRight' }" data-ev="opalMoveRight" class="franchise-faq__list elementor-nested-accordion ev">
            <article v-for="(item, index) in franchiseFaqItems.slice(0, 4)" :key="item.question" class="franchise-faq__item">
              <h3>
                <button type="button" :aria-expanded="openFaq === index" :aria-controls="`franchise-faq-panel-${index}`" @click="toggleFaq(index)">
                  <span class="franchise-faq__question"><span class="franchise-faq__number">{{ String(index + 1).padStart(2, '0') }}</span>{{ item.question }}</span>
                  <Minus v-if="openFaq === index" aria-hidden="true" />
                  <Plus v-else aria-hidden="true" />
                </button>
              </h3>
              <div :id="`franchise-faq-panel-${index}`" class="franchise-faq__panel" :class="{ 'is-open': openFaq === index }" role="region" :aria-hidden="openFaq !== index"><div><p>{{ item.answer }}</p></div></div>
            </article>
          </div>

          <aside v-reveal="{ anim: 'opalMoveLeft', delay: 100 }" data-ev="opalMoveLeft" class="franchise-faq__promo ev">
            <NuxtLink to="/franchising/download" target="_blank" rel="noopener" class="franchise-faq__promo-image" aria-label="在新分頁開啟加盟資料下載頁">
              <InternalFranchiseImage src="/section-6/franchise/franchise-benefits-sheet.png" alt="櫻花加盟總部八大優勢資料預覽" fit="contain" />
            </NuxtLink>
            <h3><NuxtLink to="/franchising/download" target="_blank" rel="noopener">加盟資料下載</NuxtLink></h3>
            <p>專業教育訓練與實戰支持。報名加盟培訓課程，透過專業教育訓練與實戰支持，掌握廚具銷售核心技巧，為您開啟成功創業之路！</p>
          </aside>
        </div>
      </div>
    </section>

    <!-- Antra Home 05 / Trusted Experience / Elementor container 836324d -->
    <section id="franchise-news" class="franchise-news elementor-836324d" aria-labelledby="franchise-news-title">
      <div class="source-rail internal-rail-safe">
        <InternalSectionPill>Franchise Information</InternalSectionPill>
        <h2 id="franchise-news-title" v-reveal="{ anim: 'opalMoveUp' }">Behind <span>Every Statistic Pulses</span> A Human Story</h2>
        <div class="franchise-news__list">
          <NuxtLink v-for="article in franchiseNews" :key="article.id" :to="article.legacyPath" class="franchise-news-row">
            <i aria-hidden="true" /><h3>{{ article.title }}</h3><ArrowRight aria-hidden="true" />
          </NuxtLink>
        </div>
        <div v-reveal="{ anim: 'opalScaleUp', delay: 120 }" class="franchise-news__more"><NuxtLink to="/news/latest" class="source-round-link source-round-link--news">查看更多 <ArrowRight aria-hidden="true" /></NuxtLink></div>
      </div>
    </section>
  </main>
</template>

<style scoped>
.franchise-page { overflow: clip; color: #1c1c1d; background: #f6f6f6; }
.source-rail-wide { width: min(1770px, calc(100% - 60px)); margin-inline: auto; box-sizing: border-box; }
.source-rail { width: min(1410px, calc(100% - 60px)); margin-inline: auto; box-sizing: border-box; }

.source-round-link { position: relative; isolation: isolate; display: inline-flex; min-height: 52px; width: max-content; align-items: center; justify-content: center; gap: 11px; padding: 13px 21px; border: 1px solid rgb(255 255 255 / 22%); border-radius: 999px; color: #fff; font-family: var(--font-ui); font-size: 14px; line-height: 20px; transition: color .3s ease, border-color .3s ease, background-color .3s ease, transform .3s ease; }
.source-round-link::after { position: absolute; z-index: -1; right: 11px; width: 38px; height: 38px; pointer-events: none; border: 1px solid currentcolor; border-radius: 50%; opacity: 0; content: ""; animation: franchise-radar 2.6s ease-out infinite; }
.source-round-link svg { width: 18px; height: 18px; transition: transform .3s ease; }
.source-round-link svg.lucide-arrow-right { transform: rotate(-35deg); }
.source-round-link:hover { transform: translateY(-2px); }
.source-round-link:hover svg.lucide-arrow-right { transform: rotate(0); }
.source-round-link--gold { border-color: #caa05c; color: #1c1c1d; background: #caa05c; }
.source-round-link--outline { border-color: rgb(89 88 93 / 36%); color: #1c1c1d; }
.source-round-link--outline::after { content: none; }
.source-round-link--outline:hover { border-color: #caa05c; color: #a57b38; }
.source-round-link--hero { min-height: 60px; gap: 8px; padding: 9px 9px 9px 30px; font-size: 15px; line-height: 22px; letter-spacing: .5px; }
.source-round-link--hero::after { right: 9px; width: 40px; height: 40px; }
.source-round-link--hero svg { width: 40px; height: 40px; padding: 10px; border-radius: 50%; color: #fff; background: #caa05c; }
.source-round-link--hero svg.lucide-arrow-right { transform: rotate(-45deg); }
.source-round-link--hero:hover { border-color: #caa05c; color: #fff; background: #caa05c; transform: none; }

.franchise-hero { position: relative; z-index: 0; min-height: 910px; overflow: hidden; color: #fff; background: #1c1c1d; }
.franchise-hero__background { position: absolute; z-index: -2; inset: 0; opacity: .72; }
.franchise-hero__background :deep(img) { object-position: center 52%; transform: scale(1.02); }
.franchise-hero__overlay { position: absolute; z-index: -1; inset: 0; background: rgb(16 8 1 / 72%); }
.franchise-hero__inner { padding: 158px 30px 0; }
.franchise-hero__grid { display: grid; grid-template-columns: 64% 36%; align-items: end; }
.franchise-hero h1 { max-width: 960px; margin: 20px 0 0; color: #fff; font-family: var(--font-display); font-size: 110px; font-weight: 400; line-height: 110px; letter-spacing: -1px; }
.franchise-hero h1 span { color: #caa05c; }
.franchise-hero__aside { width: min(454px, 100%); margin-left: 6px; }
.franchise-hero__aside h2 { margin: 0 0 22px; color: #fff; font-family: var(--font-ui); font-size: 16px; font-weight: 600; line-height: 25px; }
.franchise-hero__aside p { margin: 0; color: rgb(255 255 255 / 82%); font-family: var(--font-ui); font-size: 15px; line-height: 24px; }
.franchise-hero__aside p + p { margin-top: 16px; }
.franchise-hero__aside .source-round-link { margin-top: 50px; }

.franchise-hero-media { position: relative; z-index: 9; height: clamp(520px, 42.5vw, 760px); margin-top: -400px; overflow: hidden; border-radius: 24px; }
.franchise-hero-media :deep(img) { object-position: center 55%; }

.franchise-about { padding: 124px 30px 0; background: #fff url('/section-6/franchise/antra-original/h6-bg-3.png') top right / auto no-repeat; }
.franchise-about::after { position: absolute; pointer-events: none; content: ""; }
.franchise-about__grid { display: grid; grid-template-columns: 30% 70%; }
.source-heading-rail { min-height: 100%; }
.source-heading-rail > .source-round-link { position: absolute; bottom: 92px; left: 0; }
.franchise-about__content { padding: 70px 0 90px 58px; }
.franchise-about h2,
.franchise-advantages h2,
.franchise-projects h2,
.franchise-newsletter h2,
.franchise-process h2,
.franchise-news h2 { margin: 0; font-family: var(--font-display); font-size: 60px; font-weight: 400; line-height: 64px; letter-spacing: -.02em; }
.franchise-about h2 { max-width: 822px; margin-bottom: 50px; }
#franchise-advantage-title,
#franchise-marketing-title { font-family: var(--font-cjk-serif); font-weight: var(--font-cjk-serif-semibold, 600); letter-spacing: .02em; }
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
.franchise-marquees { display: grid; gap: 15px; margin-inline: calc(50% - 50vw); padding: 14px 0 88px; overflow: hidden; background: url('/section-6/franchise/antra-original/h5-bg1.png') bottom left / auto no-repeat; }
.franchise-marquee { width: 100%; overflow: hidden; }
.franchise-marquee__track { display: flex; width: max-content; align-items: center; animation: franchise-marquee 38s linear infinite; }
.franchise-marquee--reverse .franchise-marquee__track { animation-direction: reverse; animation-duration: 34s; }
.franchise-marquee__track > :deep(.franchise-image) { width: auto; height: 112px; flex: none; background: transparent; }
.franchise-marquees:hover .franchise-marquee__track,
.franchise-marquees:focus-within .franchise-marquee__track { animation-play-state: paused; }

.franchise-advantages { padding: 0 30px; background: #f6f6f6 url('/section-6/franchise/antra-original/h1-bg05.png') top right / auto no-repeat; }
.franchise-advantages__layout { display: grid; grid-template-columns: 30% 70%; gap: 0; }
.franchise-advantages__intro { position: sticky; top: var(--site-header-height, 60px); display: flex; min-height: calc(100vh - var(--site-header-height, 60px)); align-self: start; flex-direction: column; justify-content: center; padding: 38px 58px 38px 0; }
.franchise-advantages__intro h2 { margin-top: 28px; }
.franchise-advantages__intro p { max-width: 360px; margin: 24px 0 0; color: #59585d; font-size: 16px; line-height: 25px; }
.franchise-advantages__intro > strong { display: block; margin-top: 34px; color: rgb(159 159 164 / 18%); font-family: var(--font-ui); font-size: 116px; font-weight: 400; line-height: 1; transition: opacity .25s ease, transform .25s ease; }
.franchise-advantage-scenes { min-width: 0; }
.franchise-advantage-scene { display: flex; min-height: 100vh; align-items: center; padding: 46px 0; }
.franchise-post-grid { display: grid; width: 100%; grid-template-columns: repeat(2, minmax(0, 1fr)); align-items: start; gap: 30px; }
.franchise-post__media { position: relative; aspect-ratio: 1.68 / 1; overflow: hidden; border-radius: 18px; }
.franchise-post__media > span { position: absolute; top: 16px; left: 16px; padding: 7px 13px; border-radius: 999px; color: #fff; background: #caa05c; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 22px; }
.franchise-post:hover .franchise-post__media :deep(img) { transform: scale(1.045); }
.franchise-post__content { padding-top: 15px; }
.franchise-post__content > span { color: #caa05c; font-size: 12px; line-height: 20px; }
.franchise-post h3 { margin: 5px 0 0; font-family: var(--font-cjk-serif); font-size: 25px; font-weight: 600; line-height: 34px; }
.franchise-post p { margin: 11px 0 14px; color: #59585d; font-family: var(--font-ui); font-size: 15px; line-height: 23px; }
.franchise-post__features { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 10px; margin: 0; padding: 14px 0 0; border-top: 1px solid #e3e3e8; list-style: none; }
.franchise-post__features li { display: flex; min-width: 0; flex-direction: column; align-items: center; gap: 8px; text-align: center; }
.franchise-post__features > li > :deep(.franchise-image) { width: 42px; height: 42px; background: transparent; }
.franchise-post__features span { color: #59585d; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 22px; }

.franchise-projects { padding: 97px 30px 108px; background: #f6f6f6 url('/section-6/franchise/antra-original/h1-bg02.png') top right / auto no-repeat; }
.source-split-heading { display: grid; grid-template-columns: 30% 70%; margin-bottom: 59px; overflow: hidden; }
.source-split-heading > div:last-child { padding-left: 58px; }
.source-split-heading h2 { max-width: 620px; margin-top: 65px; }
.source-split-heading p { max-width: 636px; margin: 30px 0 0; color: #59585d; font-size: 16px; line-height: 25px; }
.franchise-project-track { display: flex; gap: 30px; overflow-x: auto; overscroll-behavior-inline: contain; padding: 0 0 12px; scroll-snap-type: x mandatory; scrollbar-width: none; }
.franchise-marquees:focus-visible,
.franchise-project-track:focus-visible,
.franchise-faq__item button:focus-visible { outline: 2px solid #caa05c; outline-offset: 4px; }
.franchise-project-track::-webkit-scrollbar { display: none; }
.project-block { min-width: calc((100% - 60px) / 3); overflow: hidden; scroll-snap-align: start; border-radius: 18px; background: #fff; box-shadow: 0 16px 50px rgb(28 28 29 / 5%); }
.project-block:nth-child(3n + 2) { transform: translateY(50px); }
.project-block > :deep(.franchise-image) { aspect-ratio: 1.45 / 1; border-radius: 18px; }
.project-block:hover :deep(img) { transform: scale(1.04); }
.project-block__content { position: relative; min-height: 138px; padding: 22px 62px 25px 22px; }
.project-block__content h3 { margin: 0; font-family: var(--font-display); font-size: 24px; font-weight: 400; line-height: 30px; }
.project-block__content span { position: absolute; top: 25px; right: 22px; color: #e3e3e8; font-family: var(--font-ui); font-size: 18px; }

.franchise-newsletter { position: relative; isolation: isolate; display: grid; width: min(1770px, calc(100% - 60px)); min-height: 600px; place-items: center; margin: 110px auto 0; overflow: hidden; padding: 110px 30px 120px; border-radius: 26px; color: #fff; text-align: center; background: linear-gradient(180deg, rgb(15 14 13 / 35%), rgb(15 14 13 / 88%)), url('/hero-antra-home-6.jpg') center 58% / cover no-repeat; }
.franchise-newsletter::before { position: absolute; z-index: -1; inset: 0; background: linear-gradient(180deg, rgb(255 255 255 / 3%), rgb(0 0 0 / 26%)); content: ""; }
.franchise-newsletter__content { display: flex; max-width: 760px; flex-direction: column; align-items: center; }
.franchise-newsletter h2 { max-width: 650px; margin-top: 20px; }
.franchise-newsletter p { max-width: 720px; margin: 30px 0 0; color: rgb(255 255 255 / 82%); font-family: var(--font-ui); font-size: 15px; line-height: 24px; }
.franchise-newsletter .source-round-link { margin-top: 38px; }

.franchise-process { padding: 92px 30px 118px; background: #fff url('/section-6/franchise/antra-original/h1-bg01-1.png') center / cover no-repeat; }
.franchise-process__heading { display: flex; flex-direction: column; align-items: center; text-align: center; }
.franchise-process h2 { margin: 0; font-family: var(--font-cjk-serif); font-size: 25px; font-weight: 600; line-height: 35px; letter-spacing: .04em; }
.franchise-process__rail-scroll { width: 100%; margin-top: 34px; }
.franchise-process__rail-scroll:focus-visible { outline: 2px solid #caa05c; outline-offset: 6px; }
.franchise-process__rail { width: 100%; min-height: 251px; background: transparent; }
.franchise-process__rail :deep(img) { object-position: center; }
.franchise-process__details { display: grid; grid-template-columns: minmax(0, 1fr) minmax(0, 1.12fr); width: min(1100px, 100%); min-height: 520px; margin: 42px auto 0; overflow: hidden; border: 1px solid rgb(227 227 232 / 82%); box-shadow: 0 18px 50px rgb(28 28 29 / 7%); }
.franchise-support-panel { position: relative; isolation: isolate; overflow: hidden; padding: 48px 44px 44px; color: #fff; background: url('/section-6/franchise/hero-store.jpg') center / cover no-repeat; }
.franchise-support-panel__shade { position: absolute; z-index: -1; inset: 0; background: linear-gradient(135deg, rgb(25 24 23 / 94%), rgb(28 28 29 / 78%)); }
.franchise-support-panel__content { position: relative; z-index: 1; }
.franchise-support-item + .franchise-support-item { margin-top: 24px; }
.franchise-support-item h3 { margin: 0; font-family: var(--font-cjk-serif); font-size: 18px; font-weight: 600; line-height: 27px; }
.franchise-support-item h3 span { color: #caa05c; }
.franchise-support-item p { margin: 5px 0 0; color: rgb(255 255 255 / 72%); font-family: var(--font-cjk-sans); font-size: 15px; line-height: 24px; }
.franchise-support-panel__cta { display: flex; min-height: 52px; align-items: center; justify-content: center; margin-top: 30px; padding: 12px 22px; color: #fff; background: #caa05c; box-shadow: 0 0 0 0 rgb(202 160 92 / 0%); font-family: var(--font-cjk-sans); font-size: 15px; line-height: 24px; animation: franchise-support-cta-breathe 2.8s ease-in-out infinite; transition: color .3s ease, background-color .3s ease, transform .3s ease; }
.franchise-support-panel__cta:hover { color: #1c1c1d; background: #fff; transform: translateY(-2px); }
.franchise-support-panel__cta:focus-visible { outline: 2px solid #fff; outline-offset: 4px; }
@keyframes franchise-support-cta-breathe {
  0%, 100% { box-shadow: 0 0 0 0 rgb(202 160 92 / 0%); }
  50% { box-shadow: 0 0 0 7px rgb(202 160 92 / 20%); }
}
.franchise-qualification-panel { padding: 48px 44px; background: rgb(255 255 255 / 92%); }
.franchise-qualification-panel > h3 { margin: 0 0 24px; font-family: var(--font-cjk-serif); font-size: 25px; font-weight: 600; line-height: 35px; }
.franchise-qualification-item { display: grid; grid-template-columns: 52px 1fr; gap: 20px; align-items: start; padding: 20px 0; border-top: 1px solid #e3e3e8; }
.franchise-qualification-item:first-child { border-top: 0; }
.franchise-qualification-item > :deep(.franchise-image) { width: 48px; height: 48px; background: transparent; }
.franchise-qualification-item h4 { margin: 0; font-family: var(--font-cjk-serif); font-size: 18px; font-weight: 600; line-height: 27px; }
.franchise-qualification-item p { margin: 4px 0 0; color: #59585d; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 24px; }

.franchise-faq { overflow: hidden; padding: 100px 30px 130px; background: #f6f6f6; }
.franchise-faq__heading { display: grid; grid-template-columns: 30% 66.6666%; margin-bottom: 60px; }
.franchise-faq__heading h2 { align-self: start; width: min(732px, 100%); margin: 70px 0 0; color: #1c1c1d; font-family: var(--font-display); font-size: 60px; font-weight: 400; line-height: 64px; text-transform: capitalize; }
.franchise-faq__heading h2 span { color: #caa05c; }
.franchise-faq__body { display: grid; grid-template-columns: 71% 29%; }
.franchise-faq__list { min-width: 0; }
.franchise-faq__item { border-top: 1px solid rgb(159 159 164 / 24%); }
.franchise-faq__item:first-child { border-top-color: #1c1c1d; }
.franchise-faq__item:last-child { border-bottom: 1px solid rgb(159 159 164 / 24%); }
.franchise-faq__item h3 { margin: 0; }
.franchise-faq__item button { display: flex; width: 100%; align-items: center; justify-content: space-between; gap: 24px; padding: 22px 0; border: 0; color: #1c1c1d; background: transparent; text-align: left; cursor: pointer; }
.franchise-faq__question { display: flex; min-width: 0; align-items: baseline; font-family: var(--font-cjk-serif); font-size: 20px; font-weight: 600; line-height: 30px; }
.franchise-faq__number { flex: none; margin-right: 26px; color: #9f9fa4; font-family: var(--font-cjk-sans); font-size: 16px; font-weight: 400; line-height: 30px; }
.franchise-faq__item button > svg { width: 18px; height: 18px; flex: none; color: #1c1c1d; transition: color .3s ease, transform .3s ease; }
.franchise-faq__panel { display: grid; grid-template-rows: 0fr; transition: grid-template-rows .4s ease; }
.franchise-faq__panel.is-open { grid-template-rows: 1fr; }
.franchise-faq__panel > div { overflow: hidden; }
.franchise-faq__panel p { width: min(100%, 832px); margin: 0; padding: 12px 40px 32px; color: #59585d; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 25px; }
.franchise-faq__promo { min-width: 0; padding-left: 100px; color: #1c1c1d; }
.franchise-faq__promo-image { display: block; overflow: hidden; border-radius: 24px; background: #fff; }
.franchise-faq__promo-image :deep(.franchise-image) { width: 100%; aspect-ratio: 774 / 1074; background: #fff; }
.franchise-faq__promo-image :deep(img) { transition: transform .5s ease; }
.franchise-faq__promo-image:hover :deep(img) { transform: scale(1.025); }
.franchise-faq__promo h3 { width: min(310px, 100%); margin: 30px 0 20px; font-family: var(--font-cjk-serif); font-size: 25px; font-weight: 600; line-height: 35px; }
.franchise-faq__promo h3 a { transition: color .3s ease; }
.franchise-faq__promo h3 a:hover { color: #a57b38; }
.franchise-faq__promo p { width: min(310px, 100%); margin: 0; color: #59585d; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 25px; }

.franchise-news { padding: 108px 30px 86px; background: #fff url('/section-6/franchise/antra-original/h5-bg02.png') top right / auto no-repeat; }
.franchise-news h2 { max-width: 786px; margin-top: 28px; }
.franchise-news__list { margin-top: 60px; border-top: 1px solid #e3e3e8; }
.franchise-news-row { display: grid; grid-template-columns: 14px 1fr 46px; gap: 18px; align-items: center; min-height: 84px; border-bottom: 1px solid #e3e3e8; }
.franchise-news-row > i { width: 6px; height: 6px; border-radius: 50%; background: #caa05c; }
.franchise-news-row h3 { margin: 0; font-family: var(--font-cjk-serif); font-size: 20px; font-weight: 600; line-height: 30px; transition: color .3s ease; }
.franchise-news-row > svg { width: 38px; height: 38px; padding: 10px; border: 1px solid #e3e3e8; border-radius: 50%; transition: border-color .3s ease, transform .3s ease; }
.franchise-news-row:hover h3 { color: #a57b38; }
.franchise-news-row:hover > svg { border-color: #caa05c; transform: translateX(3px); }
.franchise-news__more { display: flex; justify-content: center; margin-top: 50px; }
.source-round-link--news { min-height: 60px; gap: 8px; padding: 9px 9px 9px 30px; border-color: rgb(159 159 164 / 64%); color: #1c1c1d; background: #fff; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 22px; }
.source-round-link--news::after { right: 9px; width: 40px; height: 40px; color: #caa05c; }
.source-round-link--news svg { box-sizing: border-box; width: 40px; height: 40px; flex: none; padding: 10px; border-radius: 50%; color: #fff; background: #caa05c; }
.source-round-link--news svg.lucide-arrow-right { transform: rotate(-45deg); }
.source-round-link--news:hover { border-color: #caa05c; color: #fff; background: #caa05c; transform: none; }
.source-round-link--news:hover svg { color: #caa05c; background: #fff; }
.source-round-link--news:hover svg.lucide-arrow-right { transform: rotate(0); }

@keyframes franchise-marquee {
  to { transform: translateX(-50%); }
}

@keyframes franchise-radar {
  0% { opacity: .45; transform: scale(.62); }
  75%, 100% { opacity: 0; transform: scale(1.45); }
}

@media (max-width: 1366px) {
  .franchise-hero h1 { font-size: 90px; line-height: 110px; }
}

@media (max-width: 1200px) {
  .franchise-hero__grid { align-items: start; }
  .franchise-hero h1 { font-size: 60px; line-height: 90px; }
  .franchise-hero__aside { margin-top: 0; }
  .franchise-about h2,
  .franchise-advantages h2,
  .franchise-projects h2,
  .franchise-newsletter h2,
  .franchise-news h2 { font-size: 50px; line-height: 55px; }
  .franchise-about__content,
  .source-split-heading > div:last-child { padding-left: 30px; }
  .franchise-post h3 { font-size: 24px; line-height: 30px; }
  .franchise-advantages__intro { padding-right: 34px; }
  .franchise-advantages__intro > strong { font-size: 92px; }
}

@media (max-width: 1024px) {
  .franchise-hero { min-height: 760px; }
  .franchise-hero__inner { padding-top: 110px; }
  .franchise-hero__grid { grid-template-columns: 58% 42%; }
  .franchise-hero h1 { font-size: 42px; line-height: 60px; }
  .franchise-hero__aside { margin-top: 0; }
  .franchise-hero__aside p { font-size: 16px; line-height: 24px; }
  .franchise-hero-media { height: 500px; margin-top: -260px; }
  .franchise-about { padding-top: 80px; }
  .franchise-about__grid { grid-template-columns: 27% 73%; }
  .franchise-advantages { padding-block: 90px; }
  .franchise-advantages__layout { grid-template-columns: 1fr; }
  .franchise-advantages__intro { position: static; min-height: auto; padding: 0 0 46px; }
  .franchise-advantages__intro > strong { display: none; }
  .franchise-advantage-scene { min-height: auto; padding: 0 0 55px; }
  .franchise-advantage-scene:last-child { padding-bottom: 0; }
  .franchise-post-grid { grid-template-columns: 1fr; gap: 40px; }
  .franchise-post__features { grid-template-columns: repeat(4, minmax(0, 1fr)); }
  .project-block { min-width: calc((100% - 30px) / 2); }
  .project-block:nth-child(3n + 2) { transform: none; }
  .project-block:nth-child(even) { transform: translateY(35px); }
  .franchise-process__details { grid-template-columns: minmax(0, 1fr) minmax(0, 1fr); }
  .franchise-support-panel,
  .franchise-qualification-panel { padding: 38px 32px; }
  .franchise-faq__heading h2 { font-size: 36px; line-height: 42px; }
  .franchise-faq__promo { padding-left: 30px; }
}

@media (min-width: 768px) and (max-width: 880px) {
  .franchise-hero h1 { font-size: 36px; line-height: 40px; }
  .franchise-process__details { grid-template-columns: 1fr; }
  .franchise-faq__body { grid-template-columns: 1fr; gap: 50px; }
  .franchise-faq__promo { width: min(430px, 100%); padding-left: 0; }
}

@media (max-width: 767px) {
  .franchise-page .internal-rail-safe { padding-right: 0; }

  .franchise-process > .source-rail,
  .franchise-faq > .source-rail {
    width: 100%;
    padding-right: 0;
  }

  .source-rail,
  .source-rail-wide { width: calc(100% - 30px); }
  .source-round-link { width: 100%; }
  .franchise-hero { min-height: 660px; }
  .franchise-hero__inner { width: 100%; padding: 100px 15px 0; }
  .franchise-hero__grid { grid-template-columns: 1fr; }
  .franchise-hero h1 { margin-top: 20px; font-size: 30px; line-height: 50px; letter-spacing: 0; }
  .franchise-hero__aside { width: 100%; margin: 35px 0 0; }
  .franchise-hero__aside p { font-size: 15px; line-height: 24px; }
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
  .source-heading-rail > .source-round-link { position: static; margin-top: 22px; }
  .franchise-about__content { padding: 38px 0 50px; }
  .franchise-about h2,
  .franchise-advantages h2,
  .franchise-projects h2,
  .franchise-newsletter h2,
  .franchise-news h2 { font-size: 34px; line-height: 39px; }
  .franchise-process h2 { font-size: 25px; line-height: 35px; }
  .franchise-about h2 { margin-bottom: 34px; }
  .franchise-about__lead { margin-bottom: 28px; font-size: 16px; line-height: 24px; }
  .franchise-testimonials { grid-template-columns: 1fr; gap: 28px; }
  .franchise-testimonial blockquote { font-size: 14px; line-height: 23px; }
  .franchise-marquees { gap: 9px; padding-bottom: 0; background: none; }
  .franchise-marquee__track > :deep(.franchise-image) { height: 72px; }

  .franchise-advantages__layout { grid-template-columns: 1fr; }
  .franchise-advantages__intro { position: static; padding: 0 0 38px; }
  .franchise-advantages__intro > strong { display: none; }
  .franchise-advantage-scene { padding-bottom: 44px; }
  .franchise-post-grid { grid-template-columns: 1fr; gap: 40px; }
  .franchise-post h3 { font-size: 25px; line-height: 31px; }
  .franchise-post__features { grid-template-columns: repeat(2, minmax(0, 1fr)); }

  .source-split-heading { grid-template-columns: 1fr; margin-bottom: 38px; }
  .source-split-heading > div:last-child { padding: 0; }
  .source-split-heading h2 { margin-top: 28px; }
  .source-split-heading p { font-size: 15px; line-height: 24px; }
  .project-block { min-width: 84vw; }
  .project-block:nth-child(even) { transform: none; }
  .project-block__content h3 { font-size: 20px; line-height: 26px; }

  .franchise-newsletter { width: calc(100% - 30px); min-height: 560px; margin-top: 75px; padding: 80px 20px; border-radius: 20px; }
  .franchise-newsletter p { font-size: 15px; line-height: 24px; }
  .franchise-process__rail-scroll { overflow-x: auto; overscroll-behavior-inline: contain; padding-bottom: 10px; scrollbar-color: #caa05c #e3e3e8; scrollbar-width: thin; }
  .franchise-process__rail { width: 820px; min-height: 146px; }
  .franchise-process__details { grid-template-columns: 1fr; margin-top: 30px; }
  .franchise-support-panel,
  .franchise-qualification-panel { padding: 34px 24px; }
  .franchise-support-item + .franchise-support-item { margin-top: 20px; }
  .franchise-qualification-item { grid-template-columns: 48px 1fr; gap: 16px; }
  .franchise-qualification-item > :deep(.franchise-image) { width: 44px; height: 44px; }

  .franchise-faq__heading { grid-template-columns: 1fr; margin-bottom: 30px; text-align: center; }
  .franchise-faq__heading h2 { width: 100%; margin-top: 20px; font-size: 30px; line-height: 35px; }
  .franchise-faq__heading h2 br { display: none; }
  .franchise-faq__body { grid-template-columns: 1fr; gap: 42px; }
  .franchise-faq__promo { width: 100%; padding-left: 0; text-align: center; }
  .franchise-faq__promo-image { width: min(310px, 100%); margin-inline: auto; }
  .franchise-faq__promo h3,
  .franchise-faq__promo p { margin-inline: auto; }
  .franchise-faq__item button { padding: 20px 0 22px; }
  .franchise-faq__question { align-items: flex-start; font-size: 18px; line-height: 27px; }
  .franchise-faq__number { margin-right: 14px; font-size: 14px; line-height: 27px; }
  .franchise-faq__panel p { padding: 10px 0 26px 42px; font-size: 14px; line-height: 23px; }

  .franchise-news__list { margin-top: 40px; }
  .franchise-news-row { min-height: 76px; grid-template-columns: 10px 1fr 40px; gap: 12px; }
  .franchise-news-row h3 { font-size: 20px; line-height: 30px; }
}

@media (prefers-reduced-motion: reduce) {
  .franchise-marquee__track,
  .source-round-link::after,
  .franchise-support-panel__cta { animation: none; }
  .franchise-marquee { overflow-x: auto; scrollbar-width: none; }
  .franchise-marquee__track > :deep(.franchise-image:nth-child(2)) { display: none; }
  .source-round-link,
  .source-round-link svg,
  .franchise-support-panel__cta,
  .franchise-faq__promo-image :deep(img),
  .franchise-advantages__intro > strong,
  .franchise-faq__item button > svg,
  .franchise-faq__panel,
  .franchise-news-row h3,
  .franchise-news-row > svg { transition: none; }
  .source-round-link:hover,
  .source-round-link:hover svg,
  .franchise-news-row:hover > svg { transform: none; }
}
</style>
