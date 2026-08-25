<script setup lang="ts">
type HeadingRailTone = 'light' | 'dark'
type HeadingRailDensity = 'standard' | 'compact'
type HeadingRailSource = 'home4' | 'home9' | 'home6' | 'home5' | 'home1'

const props = withDefaults(defineProps<{
  label: string
  tone?: HeadingRailTone
  density?: HeadingRailDensity
  source?: HeadingRailSource
}>(), {
  tone: 'light',
  density: 'standard',
  source: 'home4',
})

const slots = useSlots()
</script>

<template>
  <aside
    class="template-heading-rail"
    :class="[
      `template-heading-rail--${props.tone}`,
      `template-heading-rail--${props.density}`,
      `template-heading-rail--${props.source}`,
    ]"
  >
    <InternalSectionPill :tone="props.tone" class="template-heading-rail__pill">{{ props.label }}</InternalSectionPill>
    <span class="template-heading-rail__line template-heading-rail__line--horizontal" aria-hidden="true">
      <svg viewBox="0 0 15 15" focusable="false">
        <path d="M15 15L3 11L0 11L12 15L15 15Z" fill="currentColor" />
      </svg>
    </span>
    <span class="template-heading-rail__line template-heading-rail__line--vertical" aria-hidden="true">
      <svg viewBox="0 0 15 15" focusable="false">
        <path d="M15 15L11 3L11 0L15 12L15 15Z" fill="currentColor" />
      </svg>
    </span>
    <div v-if="slots.actions" class="template-heading-rail__actions">
      <slot name="actions" />
    </div>
  </aside>
</template>

<style scoped>
.template-heading-rail {
  --rail-ink: #1c1c1d;
  --rail-border: rgb(114 114 114 / 18%);
  --rail-line: var(--template-heading-line, #e3e3e8);
  --rail-min-height: 198px;
  --rail-padding-top: 64px;
  --rail-horizontal-top: 33px;
  --rail-horizontal-left: 0px;
  --rail-horizontal-width: 540px;
  --rail-vertical-top: -20px;
  --rail-vertical-left: auto;
  --rail-vertical-right: 61px;
  --rail-vertical-height: 215px;
  position: relative;
  box-sizing: border-box;
  min-width: 0;
  min-height: var(--rail-min-height);
  padding-top: var(--rail-padding-top);
  color: var(--rail-ink);
}

.template-heading-rail--dark {
  --rail-ink: #fff;
  --rail-border: rgb(255 255 255 / 22%);
  --rail-line: rgb(255 255 255 / 18%);
}

.template-heading-rail--compact {
  --rail-min-height: 220px;
  --rail-padding-top: 64px;
}

/* Antra Home 09 / Featured Projects: Elementor a8d62ad, 2f2dbc6, b73ea1d. */
.template-heading-rail--home9 {
  --rail-padding-top: 70px;
  --rail-horizontal-left: 10px;
}

/* Antra Home 06 / Our Services: Elementor be62ebc, b22e367, 796fd1b. */
.template-heading-rail--home6 {
  --rail-min-height: 164px;
  --rail-padding-top: 46px;
  --rail-horizontal-top: 15px;
  --rail-horizontal-width: 502px;
  --rail-vertical-left: 345px;
  --rail-vertical-right: auto;
  --rail-vertical-height: 179px;
}

/* Antra Home 05 / About Antra: Elementor 1f7680d, 8799dea, 15daaab. */
.template-heading-rail--home5 {
  --rail-padding-top: 70px;
  --rail-horizontal-top: 39px;
  --rail-horizontal-left: 10px;
  --rail-vertical-top: 0px;
  --rail-vertical-right: 0px;
}

/* Antra Home 01 / Our Projects uses the Home 04 rail geometry with a 64px label offset. */
.template-heading-rail--home1 {
  --rail-min-height: 220px;
  --rail-padding-top: 64px;
}

.template-heading-rail__line {
  position: absolute;
  display: block;
  pointer-events: none;
  box-sizing: border-box;
  color: var(--rail-line);
  background: transparent;
}

.template-heading-rail__line svg {
  position: absolute;
  right: 0;
  bottom: 0;
  display: block;
  width: 15px;
  height: 15px;
}

.template-heading-rail__line--horizontal {
  top: calc(var(--rail-horizontal-top) - 14px);
  left: var(--rail-horizontal-left);
  width: var(--rail-horizontal-width);
  height: 15px;
  border-bottom: 1px solid var(--rail-line);
}

.template-heading-rail__line--vertical {
  top: var(--rail-vertical-top);
  left: var(--rail-vertical-left);
  right: calc(var(--rail-vertical-right) - 14px);
  width: 15px;
  height: var(--rail-vertical-height);
  border-right: 1px solid var(--rail-line);
}

.template-heading-rail__actions {
  position: absolute;
  bottom: 92px;
  left: 0;
}

@media (max-width: 1366px) {
  .template-heading-rail--home4,
  .template-heading-rail--home1 {
    --rail-horizontal-width: 415px;
  }
}

@media (max-width: 1200px) {
  .template-heading-rail--home1 {
    --rail-vertical-right: 30px;
  }
}

@media (max-width: 1024px) {
  .template-heading-rail--home4,
  .template-heading-rail--home1 {
    --rail-horizontal-width: 355px;
  }

  .template-heading-rail--home6 {
    --rail-horizontal-width: 315px;
    --rail-vertical-left: 200px;
    --rail-vertical-right: auto;
  }

  .template-heading-rail--home5 {
    --rail-horizontal-width: 315px;
    --rail-vertical-right: 60px;
    --rail-vertical-height: 115px;
  }
}

@media (max-width: 880px) {
  .template-heading-rail--home4 {
    --rail-vertical-height: 175px;
  }

  .template-heading-rail--home6 {
    --rail-min-height: 100px;
    --rail-horizontal-width: 165px;
    --rail-vertical-top: -40px;
    --rail-vertical-left: 100px;
    --rail-vertical-height: 115px;
    text-align: center;
  }

  .template-heading-rail--home6 .template-heading-rail__pill {
    margin-inline: auto;
  }
}

@media (max-width: 767px) {
  .template-heading-rail,
  .template-heading-rail--compact {
    --rail-min-height: auto;
    --rail-padding-top: 0px;
    min-height: auto;
    padding-top: 0;
    text-align: center;
  }

  .template-heading-rail__pill {
    margin-inline: auto;
  }

  .template-heading-rail__line {
    display: none;
  }

  .template-heading-rail__actions {
    position: static;
    margin-top: 20px;
  }
}
</style>
