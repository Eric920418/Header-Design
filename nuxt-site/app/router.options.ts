import { START_LOCATION, type RouterScrollBehavior } from 'vue-router'
import { useNuxtApp, useRouter } from '#app'

let pendingScrollReset: AbortController | undefined

const scrollBehavior: RouterScrollBehavior = async (to, from, savedPosition) => {
  pendingScrollReset?.abort()
  const controller = new AbortController()
  pendingScrollReset = controller
  // A fresh URL/reload must not resume an old entry; Back/Forward must.
  const restoredPosition = from !== START_LOCATION ? savedPosition : null
  const toPath = to.path.replace(/\/$/, '')
  const fromPath = from.path.replace(/\/$/, '')
  const productListChanged = toPath.startsWith('/products/') && (to.query.page !== from.query.page || to.query.q !== from.query.q)
  const listPageChanged = ['/design-inspiration', '/gallery', '/news/activities', '/news/latest', '/news/video'].includes(toPath) && to.query.page !== from.query.page
  if (!restoredPosition && from !== START_LOCATION && toPath === fromPath && !to.hash && !from.hash && !productListChanged && !listPageChanged) return false

  const router = useRouter()
  // Async CMS pages may not have rendered the target anchor at navigation time.
  if (toPath !== fromPath && from !== START_LOCATION) {
    await new Promise<void>(resolve => {
      const unhook = useNuxtApp().hooks.hookOnce('page:loading:end', () => {
        controller.signal.removeEventListener('abort', cancel)
        resolve()
      })
      const cancel = () => { unhook(); resolve() }
      controller.signal.addEventListener('abort', cancel, { once: true })
    })
  }
  // Page-mounted effects (including ScrollTrigger.refresh) must finish before the final position.
  await new Promise<void>(resolve => requestAnimationFrame(() => requestAnimationFrame(() => resolve())))
  if (controller.signal.aborted || router.currentRoute.value.fullPath !== to.fullPath) return false

  if (!restoredPosition && to.hash) {
    // Direct anchor access must not wait for observers tied to the previous viewport.
    const target = document.getElementById(to.hash.slice(1))
    if (target) {
      for (const element of [target, ...target.querySelectorAll<HTMLElement>('.ev')]) {
        element.setAttribute('data-reveal-direct', '')
      }
    }
    const top = Number.parseFloat(getComputedStyle(document.documentElement).getPropertyValue('--site-header-height')) || 0
    // Native smooth scrolling can be interrupted by Lenis/page layout refresh.
    return { el: to.hash, top, behavior: 'instant' as ScrollBehavior }
  }

  // Wheel momentum and late layout effects can resume after an instant scroll.
  // Hold the landing position only until the user's next interaction/navigation.
  const position = restoredPosition ?? { left: 0, top: 0 }
  const options = { signal: controller.signal, passive: true }
  const holdPosition = () => {
    const top = Math.max(0, Math.min(position.top, document.documentElement.scrollHeight - window.innerHeight))
    if (Math.abs(window.scrollY - top) > 1 || Math.abs(window.scrollX - position.left) > 1) {
      window.scrollTo({ left: position.left, top, behavior: 'instant' })
    }
  }
  window.addEventListener('scroll', holdPosition, options)
  if (restoredPosition) {
    // Late images/CMS layout can increase the initially clamped scroll range.
    const observer = new ResizeObserver(holdPosition)
    observer.observe(document.body)
    controller.signal.addEventListener('abort', () => observer.disconnect(), { once: true })
  }
  for (const event of ['wheel', 'touchstart', 'pointerdown', 'keydown', 'focusin']) {
    window.addEventListener(event, () => controller.abort(), { ...options, once: true, capture: true })
  }

  return { ...position, behavior: 'instant' as ScrollBehavior }
}

export default { scrollBehavior }
