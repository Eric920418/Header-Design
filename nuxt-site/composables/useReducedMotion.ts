export function useReducedMotion() {
  const reduced = ref(false)
  let media: MediaQueryList | undefined

  const update = () => {
    reduced.value = Boolean(media?.matches)
  }

  onMounted(() => {
    media = window.matchMedia('(prefers-reduced-motion: reduce)')
    update()
    media.addEventListener('change', update)
  })

  onBeforeUnmount(() => media?.removeEventListener('change', update))
  return readonly(reduced)
}
