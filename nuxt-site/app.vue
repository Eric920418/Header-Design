<script setup lang="ts">
const route = useRoute()
const previewExpiresAt = useCookie<number | string | null>('sakura_preview_expires_at')
let previewExpiryTimer: ReturnType<typeof setTimeout> | undefined

useHead({
  titleTemplate: title => title ? `${title}` : 'SAKURA 整體廚房',
  meta: [
    { name: 'format-detection', content: 'telephone=no' },
    { property: 'og:site_name', content: 'SAKURA 整體廚房' },
  ],
})

const enforcePreviewExpiry = () => {
  if (previewExpiryTimer) clearTimeout(previewExpiryTimer)
  if (route.path === '/preview-access') return

  const remaining = Number(previewExpiresAt.value) - Date.now()
  if (!Number.isFinite(remaining) || remaining <= 0) {
    window.location.replace(`/preview-access?redirect=${encodeURIComponent(route.fullPath)}`)
    return
  }

  previewExpiryTimer = setTimeout(enforcePreviewExpiry, remaining)
}

onMounted(() => {
  enforcePreviewExpiry()
  window.addEventListener('focus', enforcePreviewExpiry)
  document.addEventListener('visibilitychange', enforcePreviewExpiry)
})

watch(() => route.fullPath, enforcePreviewExpiry)

onBeforeUnmount(() => {
  if (previewExpiryTimer) clearTimeout(previewExpiryTimer)
  window.removeEventListener('focus', enforcePreviewExpiry)
  document.removeEventListener('visibilitychange', enforcePreviewExpiry)
})
</script>

<template>
  <NuxtLayout>
    <NuxtPage />
  </NuxtLayout>
</template>
