<script setup lang="ts">
import { splitHeadingText } from '~/utils/headingText'
const props = defineProps<{ text?: string | number | null }>()
const parts = computed(() => splitHeadingText(props.text))
</script>

<template>
  <span v-for="(part, index) in parts" :key="index" class="content-heading-text" :class="part.english ? 'content-heading-text--english' : 'content-heading-text--chinese'">{{ part.text }}</span>
</template>

<style scoped>
/* Only color text runs; existing heading line boxes, type and spacing stay on their original elements. */
.content-heading-text { display: contents !important; font: inherit !important; letter-spacing: inherit !important; }
.content-heading-text--chinese { color: #1c1c1d !important; }
.content-heading-text--english { color: #caa05c !important; }
</style>
