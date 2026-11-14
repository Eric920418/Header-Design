<script setup lang="ts">
import {thumbnailPlaceholder} from '~/shared/cms/workbench.mjs'
const props=defineProps<{src?:string;alt:string}>()
const placeholder=computed(()=>thumbnailPlaceholder(props.alt))
const mark=computed(()=>!!props.src&&/(?:\.svg(?:$|[?#])|logo|(?:[-_/])white(?:[-_.]))/i.test(props.src))
</script>
<template><AdminImage class="cms-thumbnail" :class="{'is-mark':mark,'is-schematic':!src}" :src="src||placeholder" :fallback-src="placeholder" :alt="src?alt:alt+'（位置示意）'" /></template>
