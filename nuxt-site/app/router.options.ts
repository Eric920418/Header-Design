import type { RouterScrollBehavior } from 'vue-router'
import { useRouter } from '#app'

let pendingScrollReset: AbortController | undefined

const scrollBehavior: RouterScrollBehavior = async (to, from) => {
  pendingScrollReset?.abort()
  const toPath = to.path.replace(/\/$/, '')
  const fromPath = from.path.replace(/\/$/, '')
  if (toPath === fromPath && !to.hash && !from.hash) return false

  const router = useRouter()
  // Page-mounted effects (including ScrollTrigger.refresh) must finish before the final position.
  await new Promise<void>(resolve => requestAnimationFrame(() => requestAnimationFrame(() => resolve())))
  if (router.currentRoute.value.fullPath !== to.fullPath) return false

  if (to.hash) {
    const top = Number.parseFloat(getComputedStyle(document.documentElement).getPropertyValue('--site-header-height')) || 0
    return { el: to.hash, top, behavior: 'smooth' }
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
