import { nextTick } from 'vue'

export default defineNuxtPlugin(() => {
  const router = useRouter()
  const positions = new Map<string, { left: number, top: number }>()
  let historyNavigation = false

  window.addEventListener('popstate', () => {
    historyNavigation = true
  })

  router.beforeEach((_to, from) => {
    positions.set(from.fullPath, {
      left: window.scrollX,
      top: window.scrollY,
    })
  })

  router.afterEach((to, from, failure) => {
    const restorePosition = historyNavigation ? positions.get(to.fullPath) : undefined
    historyNavigation = false
    if (failure) return

    const fromHash = from.hash
    const toPath = to.path.replace(/\/$/, '')
    const fromPath = from.path.replace(/\/$/, '')
    if (toPath === fromPath && !to.hash && !fromHash) return

    nextTick(() => {
      requestAnimationFrame(() => {
        if (to.hash) {
          const target = document.querySelector<HTMLElement>(to.hash)
          if (!target) return

          const headerHeight = Number.parseFloat(getComputedStyle(document.documentElement).getPropertyValue('--site-header-height')) || 0
          const top = Math.max(0, target.getBoundingClientRect().top + window.scrollY - headerHeight)
          window.scrollTo({ left: 0, top, behavior: 'smooth' })
          return
        }

        const position = restorePosition ?? { left: 0, top: 0 }
        window.scrollTo({
          ...position,
          behavior: 'instant' as ScrollBehavior,
        })
      })
    })
  })
})
