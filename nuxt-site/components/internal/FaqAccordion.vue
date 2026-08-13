<script setup lang="ts">
import { faqGroups } from '~/data/service'
import type { FaqGroup } from '~/types/content'

const props = withDefaults(defineProps<{
  groups?: FaqGroup[]
  sectionId?: string
}>(), {
  groups: () => faqGroups,
  sectionId: 'faq-title',
})

const openId = ref<string | null>(props.groups[0] ? `${props.groups[0].id}-0` : null)
const toggle = (id: string) => openId.value = openId.value === id ? null : id
</script>

<template>
  <section :aria-labelledby="sectionId" class="antra-faq-section">
    <div class="antra-faq-rail">
      <header class="antra-faq-heading">
        <div v-reveal="{ anim: 'opalMoveRight' }" data-ev="opalMoveRight" class="antra-faq-heading__aside ev">
          <span class="antra-faq-pill"><span aria-hidden="true" />Popular Queries</span>
          <span class="antra-faq-deco antra-faq-deco--horizontal" aria-hidden="true" />
          <span class="antra-faq-deco antra-faq-deco--vertical" aria-hidden="true" />
        </div>
        <h2 :id="sectionId" v-reveal="{ anim: 'opalMoveLeft' }" data-ev="opalMoveLeft" class="antra-faq-title ev">
          Quick And Clear <span>Answers<br />To Your Key</span> Questions
        </h2>
      </header>

      <div v-reveal="{ anim: 'opalMoveRight' }" data-ev="opalMoveRight" class="antra-faq-list ev">
        <section v-for="group in groups" :key="group.id" :aria-labelledby="`${sectionId}-${group.id}`" class="antra-faq-group">
          <h3 :id="`${sectionId}-${group.id}`" class="antra-faq-group__title">{{ group.title }}</h3>
          <div>
            <article v-for="(item, index) in group.items" :key="item.question" class="antra-faq-item">
              <h4>
                <button
                  type="button"
                  class="antra-faq-button"
                  :aria-expanded="openId === `${group.id}-${index}`"
                  :aria-controls="`faq-panel-${group.id}-${index}`"
                  @click="toggle(`${group.id}-${index}`)"
                >
                  <span class="antra-faq-question"><span class="antra-faq-number">{{ String(index + 1).padStart(2, '0') }}</span>{{ item.question }}</span>
                  <span class="antra-faq-symbol" aria-hidden="true">{{ openId === `${group.id}-${index}` ? '−' : '+' }}</span>
                </button>
              </h4>
              <div
                :id="`faq-panel-${group.id}-${index}`"
                role="region"
                :aria-hidden="openId !== `${group.id}-${index}`"
                class="antra-faq-panel"
                :class="{ 'is-open': openId === `${group.id}-${index}` }"
              >
                <div><p>{{ item.answer }}</p></div>
              </div>
            </article>
          </div>
        </section>
      </div>
    </div>
  </section>
</template>

<style scoped>
.antra-faq-section {
  overflow: hidden;
  padding: 100px 30px 130px;
  background: #f6f6f6;
}

.antra-faq-rail {
  width: min(1410px, 100%);
  margin-inline: auto;
}

.antra-faq-heading {
  display: grid;
  grid-template-columns: 30% 66.6666%;
  column-gap: 0;
  margin-bottom: 60px;
}

.antra-faq-heading__aside {
  position: relative;
  min-height: 198px;
  padding-top: 70px;
}

.antra-faq-pill {
  display: inline-flex;
  align-items: center;
  gap: 5px;
  padding: 8px 14px;
  border: 1px solid rgb(114 114 114 / 18%);
  border-radius: 26px;
  color: #1c1c1d;
  font-family: "Cal Sans", sans-serif;
  font-size: 12px;
  font-weight: 400;
  line-height: 14px;
  letter-spacing: 1px;
  text-transform: uppercase;
}

.antra-faq-pill > span {
  width: 5px;
  height: 5px;
  border-radius: 50%;
  background: #caa05c;
}

.antra-faq-deco {
  position: absolute;
  display: block;
  border-color: #e3e3e8;
}

.antra-faq-deco--horizontal {
  top: 121px;
  left: 30px;
  width: 300px;
  border-bottom: 1px solid #e3e3e8;
}

.antra-faq-deco--vertical {
  top: 50px;
  right: 61px;
  height: 200px;
  border-right: 1px solid #e3e3e8;
}

.antra-faq-title {
  align-self: start;
  width: min(732px, 100%);
  margin: 70px 0 0;
  color: #1c1c1d;
  font-family: "Cal Sans", sans-serif;
  font-size: 60px;
  font-weight: 400;
  line-height: 64px;
  text-transform: capitalize;
}

.antra-faq-title span { color: #caa05c; }

.antra-faq-list { width: 100%; }
.antra-faq-group + .antra-faq-group { margin-top: 48px; }

.antra-faq-group__title {
  margin: 0 0 12px;
  color: #caa05c;
  font-family: "Cal Sans", sans-serif;
  font-size: 18px;
  font-weight: 400;
  line-height: 24px;
}

.antra-faq-item {
  border-top: 1px solid rgb(159 159 164 / 24%);
}

.antra-faq-item:last-child {
  border-bottom: 1px solid rgb(159 159 164 / 24%);
}

.antra-faq-button {
  display: flex;
  width: 100%;
  align-items: center;
  justify-content: space-between;
  gap: 24px;
  padding: 22px 0;
  border: 0;
  background: transparent;
  color: #1c1c1d;
  text-align: left;
  cursor: pointer;
}

.antra-faq-question {
  display: flex;
  min-width: 0;
  align-items: baseline;
  font-family: "Cal Sans", sans-serif;
  font-size: 28px;
  font-weight: 400;
  line-height: 34px;
}

.antra-faq-number {
  flex: none;
  margin-right: 26px;
  color: #9f9fa4;
  font-family: "Golos Text", sans-serif;
  font-size: 16px;
  line-height: 34px;
}

.antra-faq-symbol {
  flex: none;
  color: #1c1c1d;
  font-family: "Cal Sans", sans-serif;
  font-size: 22px;
  line-height: 1;
}

.antra-faq-panel {
  display: grid;
  grid-template-rows: 0fr;
  transition: grid-template-rows .45s ease;
}

.antra-faq-panel.is-open { grid-template-rows: 1fr; }
.antra-faq-panel > div { overflow: hidden; }

.antra-faq-panel p {
  width: min(100%, 832px);
  margin: -6px 0 0;
  padding: 0 40px 30px;
  color: #59585d;
  font-size: 16px;
  line-height: 24px;
}

@media (max-width: 1024px) {
  .antra-faq-section { padding-block: 80px; }
  .antra-faq-title { font-size: 36px; line-height: 42px; }
  .antra-faq-question { font-size: 24px; line-height: 34px; }
  .antra-faq-deco--horizontal { width: 220px; }
  .antra-faq-deco--vertical { right: 30px; height: 100px; }
}

@media (max-width: 767px) {
  .antra-faq-section { padding: 60px 15px; }
  .antra-faq-heading { grid-template-columns: 1fr; margin-bottom: 30px; text-align: center; }
  .antra-faq-heading__aside { min-height: auto; padding: 0; }
  .antra-faq-deco { display: none; }
  .antra-faq-title { width: 100%; margin-top: 20px; font-size: 30px; line-height: 35px; }
  .antra-faq-title br { display: none; }
  .antra-faq-group + .antra-faq-group { margin-top: 36px; }
  .antra-faq-question { font-size: 20px; line-height: 30px; }
  .antra-faq-number { margin-right: 14px; font-size: 14px; line-height: 30px; }
  .antra-faq-button { align-items: flex-start; gap: 16px; }
  .antra-faq-symbol { padding-top: 5px; }
  .antra-faq-panel p { margin-top: 0; padding: 0 0 26px 44px; }
}

@media (prefers-reduced-motion: reduce) {
  .antra-faq-panel { transition: none; }
}
</style>
