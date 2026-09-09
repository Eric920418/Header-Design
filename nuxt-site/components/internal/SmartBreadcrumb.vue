<script setup lang="ts">
import type { BreadcrumbLink } from '~/composables/useBreadcrumbSource'

const props = defineProps<{ fallback: BreadcrumbLink[], preserveHierarchy?: boolean }>()
const route = useRoute()
const router = useRouter()
const entry = useBreadcrumbSource()
// Nuxt's root can mount before an async page finishes hydrating.
const mounted = ref(false)
onMounted(() => { mounted.value = true })
// History may restore a known parent's filters, never define the page hierarchy or labels.
const source = computed(() => {
  const previous = !props.preserveHierarchy && mounted.value && entry.value?.current === route.fullPath ? entry.value.source : null
  return previous && props.fallback.some(item => item.to && item.to !== '/' && router.resolve(item.to).path === router.resolve(previous.to).path)
    ? previous : null
})
const items = computed<BreadcrumbLink[]>(() => {
  const previous = source.value
  return props.fallback.map(item => previous && item.to && item.to !== '/' && router.resolve(item.to).path === router.resolve(previous.to).path
    ? { ...item, to: previous.to } : item)
})

function follow(event: MouseEvent, item: BreadcrumbLink) {
  // Preserve Home, keyboard modifiers, new tabs and ordinary fallback links.
  if (!source.value || item.to === '/' || item.to !== source.value.to || event.defaultPrevented
    || event.button !== 0 || event.metaKey || event.ctrlKey || event.shiftKey || event.altKey) return
  const position = window.history.state?.position
  const delta = source.value.position - position
  if (Number.isSafeInteger(position) && delta < 0 && -delta < window.history.length) {
    event.preventDefault()
    router.go(delta)
  }
}
</script>

<template>
  <!-- Each page owns its hierarchy and keeps its existing scoped layout. -->
  <slot :items="items" :follow="follow" />
</template>

<style>
/* Long current-page labels still need to fit narrow screens. */
nav[aria-label="麵包屑"] { flex-wrap: wrap; }
nav[aria-label="麵包屑"] > a,
nav[aria-label="麵包屑"] > span { max-width: 100%; overflow-wrap: anywhere; }
</style>
