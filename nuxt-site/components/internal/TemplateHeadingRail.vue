<script setup lang="ts">
type HeadingRailTone = 'light' | 'dark'
type HeadingRailDensity = 'standard' | 'compact'

const props = withDefaults(defineProps<{
  label: string
  tone?: HeadingRailTone
  density?: HeadingRailDensity
}>(), {
  tone: 'light',
  density: 'standard',
})

const slots = useSlots()
</script>

<template>
  <aside
    class="template-heading-rail"
    :class="[
      `template-heading-rail--${props.tone}`,
      `template-heading-rail--${props.density}`,
    ]"
  >
    <span class="template-heading-rail__pill">
      <i aria-hidden="true" />
      {{ props.label }}
    </span>
    <span class="template-heading-rail__line template-heading-rail__line--horizontal" aria-hidden="true" />
    <span class="template-heading-rail__line template-heading-rail__line--vertical" aria-hidden="true" />
    <div v-if="slots.actions" class="template-heading-rail__actions">
      <slot name="actions" />
    </div>
  </aside>
</template>

<style scoped>
.template-heading-rail {
  --rail-ink: #1c1c1d;
  --rail-border: rgb(114 114 114 / 18%);
  --rail-line: var(--template-heading-line);
  position: relative;
  box-sizing: border-box;
  min-width: 0;
  min-height: 198px;
  padding-top: 70px;
  color: var(--rail-ink);
}

.template-heading-rail--dark {
  --rail-ink: #fff;
  --rail-border: rgb(255 255 255 / 22%);
  --rail-line: rgb(255 255 255 / 22%);
}

.template-heading-rail--compact {
  min-height: 128px;
  padding-top: 18px;
}

.template-heading-rail__pill {
  display: inline-flex;
  width: max-content;
  max-width: 100%;
  align-items: center;
  gap: 7px;
  padding: 8px 14px;
  border: 1px solid var(--rail-border);
  border-radius: 26px;
  color: var(--rail-ink);
  font-family: var(--font-ui);
  font-size: 12px;
  font-weight: 400;
  line-height: 14px;
  letter-spacing: 1px;
  text-transform: uppercase;
}

.template-heading-rail__pill i {
  width: var(--template-heading-dot-size);
  height: var(--template-heading-dot-size);
  flex: 0 0 auto;
  border-radius: 50%;
  background: var(--template-heading-dot);
}

.template-heading-rail__line {
  position: absolute;
  display: block;
  background: var(--rail-line);
}

.template-heading-rail__line--horizontal {
  top: 121px;
  left: 30px;
  width: min(300px, calc(100% - 61px));
  height: 1px;
}

.template-heading-rail__line--vertical {
  top: 50px;
  right: 61px;
  width: 1px;
  height: 200px;
}

.template-heading-rail--compact .template-heading-rail__line--horizontal {
  top: 68px;
}

.template-heading-rail--compact .template-heading-rail__line--vertical {
  top: 0;
  height: 128px;
}

.template-heading-rail__actions {
  position: absolute;
  bottom: 92px;
  left: 0;
}

@media (max-width: 1024px) {
  .template-heading-rail__line--horizontal {
    width: min(220px, calc(100% - 31px));
  }

  .template-heading-rail__line--vertical {
    right: 30px;
    height: 100px;
  }

}

@media (max-width: 767px) {
  .template-heading-rail,
  .template-heading-rail--compact {
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
