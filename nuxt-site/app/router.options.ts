import type { RouterScrollBehavior } from 'vue-router'

const scrollBehavior: RouterScrollBehavior = (to, from) => {
  const toPath = to.path.replace(/\/$/, '')
  const fromPath = from.path.replace(/\/$/, '')
  if (toPath === fromPath && !to.hash && !from.hash) return false

  if (to.hash) {
    const top = Number.parseFloat(getComputedStyle(document.documentElement).getPropertyValue('--site-header-height')) || 0
    return { el: to.hash, top, behavior: 'smooth' }
  }

  return { left: 0, top: 0, behavior: 'instant' as ScrollBehavior }
}

export default { scrollBehavior }
