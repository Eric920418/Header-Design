<script setup lang="ts">
import type { BreadcrumbLink } from '~/composables/useBreadcrumbSource'

const props = defineProps<{ fallback: BreadcrumbLink[], preserveHierarchy?: boolean }>()
const route = useRoute()
const router = useRouter()
const entry = useBreadcrumbSource()
// Nuxt's root can mount before an async page finishes hydrating.
const mounted = ref(false)
onMounted(() => { mounted.value = true })
const source = computed(() => mounted.value && entry.value?.current === route.fullPath ? entry.value.source : null)
const items = computed<BreadcrumbLink[]>(() => {
  const current = props.fallback.at(-1)
  if (props.preserveHierarchy || !source.value || !current) return props.fallback
  return [
    { label: '首頁', to: '/' },
    ...(router.resolve(source.value.to).path === '/' ? [] : [{ label: source.value.label, to: source.value.to }]),
    ...(source.value.label === current.label && source.value.to !== '/' ? [] : [{ label: current.label }]),
  ]
})
// A previous article is a return destination, not a parent category.
const separateReturn = computed(() => {
  const previous = source.value
  if (!props.preserveHierarchy || !previous) return null
  return props.fallback.some(item => item.to && router.resolve(item.to).path === router.resolve(previous.to).path)
    ? null : previous
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
  <!-- Existing navs keep their scoped layout; an opt-in return is separate from the hierarchy. -->
  <slot :items="items" :follow="follow" />
  <NuxtLink v-if="separateReturn" class="breadcrumb-source-return" :to="separateReturn.to"
    :title="`返回：${separateReturn.label}`" @click.capture="follow($event, separateReturn)">
    <span aria-hidden="true">← </span>返回上一頁
  </NuxtLink>
</template>

<style>
/* Actual article names can be longer than the former fixed category labels. */
nav[aria-label="麵包屑"] { flex-wrap: wrap; }
nav[aria-label="麵包屑"] > a,
nav[aria-label="麵包屑"] > span { max-width: 100%; overflow-wrap: anywhere; }
.breadcrumb-source-return { margin-inline-start: 1em; color: inherit; }
.breadcrumb-source-return:hover,
.breadcrumb-source-return:focus-visible { color: #caa05c; }
</style>
