import { START_LOCATION, type RouterScrollBehavior } from 'vue-router'
import { useNuxtApp, useRouter } from '#app'

let pendingScrollReset: AbortController | undefined

const scrollBehavior: RouterScrollBehavior = async (to, from) => {
  pendingScrollReset?.abort()
  const toPath = to.path.replace(/\/$/, '')
  const fromPath = from.path.replace(/\/$/, '')
  const productListChanged = toPath.startsWith('/products/') && (to.query.page !== from.query.page || to.query.q !== from.query.q)
  const listPageChanged = ['/design-inspiration', '/gallery', '/news/activities', '/news/latest', '/news/video'].includes(toPath) && to.query.page !== from.query.page
  if (toPath === fromPath && !to.hash && !from.hash && !productListChanged && !listPageChanged) return false

  const router = useRouter()
  // Async CMS pages may not have rendered the target anchor at navigation time.
  if (to.hash && toPath !== fromPath && from !== START_LOCATION) {
    await new Promise<void>(resolve => useNuxtApp().hooks.hookOnce('page:loading:end', () => resolve()))
  }
  // Page-mounted effects (including ScrollTrigger.refresh) must finish before the final position.
  await new Promise<void>(resolve => requestAnimationFrame(() => requestAnimationFrame(() => resolve())))
  if (router.currentRoute.value.fullPath !== to.fullPath) return false

  if (to.hash) {
    const top = Number.parseFloat(getComputedStyle(document.documentElement).getPropertyValue('--site-header-height')) || 0
    // Native smooth scrolling can be interrupted by Lenis/page layout refresh.
    return { el: to.hash, top, behavior: 'instant' as ScrollBehavior }
  }

  // Wheel momentum and late layout effects can resume after an instant scroll.
  // Hold the landing position only until the user's next interaction/navigation.
  const controller = new AbortController()
  pendingScrollReset = controller
  const options = { signal: controller.signal, passive: true }
  window.addEventListener('scroll', () => {
    if (window.scrollY !== 0) window.scrollTo({ top: 0, behavior: 'instant' })
  }, options)
  for (const event of ['wheel', 'touchstart', 'pointerdown', 'keydown', 'focusin']) {
    window.addEventListener(event, () => controller.abort(), { ...options, once: true, capture: true })
  }

  return { left: 0, top: 0, behavior: 'instant' as ScrollBehavior }
}

export default { scrollBehavior }
