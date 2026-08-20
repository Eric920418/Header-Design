<script setup lang="ts">
import { serviceSteps } from '~/data/service'

const expanded = ref<string | null>(null)

const toggle = (step: (typeof serviceSteps)[number]) => {
  if (!step.expandedDescription) return
  expanded.value = expanded.value === step.number ? null : step.number
}
</script>

<template>
  <div class="service-flow-block">
    <header class="service-flow-block__heading" v-reveal="{ anim: 'opalMoveUp' }">
      <h2>服務流程</h2>
      <span aria-hidden="true" />
    </header>

    <ol class="service-flow" aria-label="櫻花整體廚房八步服務流程">
      <li
        v-for="(step, index) in serviceSteps"
        :key="step.number"
        v-reveal="{ anim: 'opalMoveUp', delay: (index % 4) * 100 }"
        class="service-flow__item"
        :class="{ 'is-expandable': step.expandedDescription, 'is-expanded': expanded === step.number }"
      >
        <button
          type="button"
          class="service-flow__content"
          :disabled="!step.expandedDescription"
          :aria-expanded="step.expandedDescription ? expanded === step.number : undefined"
          :aria-controls="step.expandedDescription ? `service-step-${step.number}` : undefined"
          @click="toggle(step)"
        >
          <span class="service-flow__icon-wrap">
            <img :src="step.icon" :alt="step.title" class="service-flow__icon" />
            <span class="service-flow__icon-hover" aria-hidden="true">影片<br />待上架</span>
          </span>

          <span class="service-flow__title">
            <span>{{ step.number }}.</span>{{ step.title }}
            <span v-if="step.emphasized" class="service-flow__plus" aria-hidden="true">＋</span>
          </span>

          <span :id="`service-step-${step.number}`" class="service-flow__description">
            <span
              v-for="line in expanded === step.number && step.expandedDescription ? step.expandedDescription : step.description"
              :key="line"
            >{{ line }}</span>
          </span>
        </button>

        <span v-if="index % 4 !== 3" class="service-flow__arrow" aria-hidden="true">▶</span>
      </li>
    </ol>
  </div>
</template>

<style scoped>
.service-flow-block {
  width: 100%;
  margin-top: 0;
  font-family: var(--font-cjk-sans);
}

.service-flow-block__heading {
  margin-bottom: 46px;
  text-align: center;
}

.service-flow-block__heading h2 {
  margin: 0;
  color: #59585d;
  font-family: var(--font-cjk-serif);
  font-size: 38px;
  font-weight: 500;
  line-height: 50px;
  letter-spacing: .08em;
}

.service-flow-block__heading > span {
  display: block;
  width: 580px;
  max-width: 58%;
  height: 1px;
  margin: 18px auto 0;
  background: #caa05c;
}

.service-flow {
  display: grid;
  grid-template-columns: repeat(4, minmax(0, 1fr));
  column-gap: 46px;
  row-gap: 62px;
  width: min(1120px, 100%);
  margin: 0 auto;
  padding: 0;
  list-style: none;
}

.service-flow__item {
  position: relative;
  min-width: 0;
  text-align: center;
}

.service-flow__content {
  display: flex;
  width: 100%;
  flex-direction: column;
  align-items: center;
  border: 0;
  background: transparent;
  color: inherit;
  text-align: center;
}

.service-flow__content:disabled {
  opacity: 1;
  cursor: default;
}

.service-flow__item.is-expandable .service-flow__content { cursor: pointer; }

.service-flow__icon-wrap {
  position: relative;
  display: flex;
  width: 104px;
  height: 104px;
  align-items: center;
  justify-content: center;
  margin-inline: auto;
  overflow: hidden;
  border-radius: 50%;
}

.service-flow__icon {
  display: block;
  width: 104px;
  height: 104px;
  object-fit: contain;
  transition: opacity .25s ease;
}

.service-flow__icon-hover {
  position: absolute;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  background: #caa05c;
  color: #fff;
  font-size: 17px;
  font-weight: 500;
  line-height: 1.4;
  letter-spacing: .05em;
  opacity: 0;
  transition: opacity .25s ease;
}

.service-flow__icon-wrap:hover .service-flow__icon { opacity: 0; }
.service-flow__icon-wrap:hover .service-flow__icon-hover { opacity: 1; }

.service-flow__title {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 1px;
  margin: 15px auto 0;
  padding: 0 2px 5px;
  border-bottom: 4px solid #59585d;
  color: #1c1c1d;
  font-family: var(--font-cjk-sans);
  font-size: 23px;
  font-weight: 700;
  line-height: 29px;
  white-space: nowrap;
}

.service-flow__plus {
  display: inline-flex;
  width: 22px;
  height: 22px;
  align-items: center;
  justify-content: center;
  margin-left: 3px;
  border-radius: 50%;
  background: #caa05c;
  color: #fff;
  font-size: 20px;
  font-weight: 400;
  line-height: 22px;
  transition: transform .25s ease;
}

.service-flow__item.is-expanded .service-flow__plus { transform: rotate(45deg); }

.service-flow__description {
  margin: 12px 0 0;
  color: #1c1c1d;
  font-family: var(--font-cjk-sans);
  font-size: 17px;
  font-weight: 400;
  line-height: 24px;
}

.service-flow__description > span { display: block; }

.service-flow__arrow {
  position: absolute;
  top: 44px;
  right: -34px;
  color: #b8b8b8;
  font-size: 26px;
  line-height: 1;
}

@media (max-width: 1200px) {
  .service-flow {
    column-gap: 28px;
    width: min(980px, 100%);
  }

  .service-flow__title {
    font-size: 20px;
    line-height: 26px;
  }

  .service-flow__description {
    font-size: 15px;
    line-height: 22px;
  }

  .service-flow__arrow { right: -22px; }
}

@media (max-width: 880px) {
  .service-flow-block { margin-top: 0; }
  .service-flow-block__heading { margin-bottom: 40px; }

  .service-flow {
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 54px 34px;
  }

  .service-flow__item:nth-child(2n) .service-flow__arrow { display: none; }
  .service-flow__arrow { right: -26px; }
}

@media (max-width: 560px) {
  .service-flow-block { margin-top: 0; }
  .service-flow-block__heading { margin-bottom: 36px; }

  .service-flow-block__heading h2 {
    font-size: 24px;
    line-height: 32px;
  }

  .service-flow-block__heading > span {
    max-width: 72%;
    margin-top: 12px;
  }

  .service-flow {
    grid-template-columns: 1fr;
    gap: 50px;
  }

  .service-flow__arrow { display: none; }
  .service-flow__title { font-size: 21px; }

  .service-flow__description {
    font-size: 16px;
    line-height: 23px;
  }
}

@media (prefers-reduced-motion: reduce) {
  .service-flow__icon,
  .service-flow__icon-hover,
  .service-flow__plus { transition: none; }
}
</style>
