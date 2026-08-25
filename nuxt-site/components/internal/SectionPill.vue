<script setup lang="ts">
type SectionPillTone = 'light' | 'dark'

const props = withDefaults(defineProps<{
  tone?: SectionPillTone
}>(), {
  tone: 'light',
})
</script>

<template>
  <span class="section-pill" :class="`section-pill--${props.tone}`">
    <i aria-hidden="true" />
    <slot />
  </span>
</template>

<style scoped>
.section-pill {
  display: inline-flex;
  width: max-content;
  max-width: 100%;
  align-items: center;
  gap: 7px;
  padding: 8px 14px;
  border: 1px solid rgb(114 114 114 / 18%);
  border-radius: 26px;
  color: #1c1c1d;
  background: transparent;
  font-family: var(--font-ui);
  font-size: 12px;
  font-weight: 400;
  line-height: 14px;
  letter-spacing: 1px;
  text-transform: uppercase;
}

.section-pill--dark {
  border-color: rgb(255 255 255 / 22%);
  color: #fff;
}

.section-pill i {
  width: 5px;
  height: 5px;
  flex: 0 0 auto;
  border-radius: 50%;
  background: #caa05c;
}
</style>
