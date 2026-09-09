import { readBreadcrumbSource, type BreadcrumbEntry, type BreadcrumbSource } from '~/composables/useBreadcrumbSource'
import { isNavigationFailure, NavigationFailureType } from 'vue-router'

export default defineNuxtPlugin((nuxtApp) => {
  const router = useRouter()
  const entry = useBreadcrumbSource()
  const key = 'sakuraBreadcrumb'
  let ready = false
  let traversing = false
  let leaving: BreadcrumbSource | null = null
  let previous: BreadcrumbSource | null = null
  let position = 0

  const allowed = (to: string) => {
    const route = router.resolve(to)
    const path = route.path.replace(/\/+$/, '')
    return route.matched.length > 0 && path !== '/preview-access' && path !== '/sitemap'
  }
  const restore = (current: string): BreadcrumbSource | null => {
    // Older entries did not distinguish global navigation from content links.
    const saved = window.history.state?.sakuraBreadcrumbVersion === 2
      ? window.history.state[key] as BreadcrumbEntry | undefined : undefined
    const source = saved?.current === current ? readBreadcrumbSource(saved.source) : null
    return source && allowed(source.to) && router.resolve(source.to).path !== router.resolve(current).path ? source : null
  }
  const save = (current: string, source: BreadcrumbSource | null) => {
    const value = { current, source: readBreadcrumbSource(source) }
    window.history.replaceState({ ...window.history.state, sakuraBreadcrumbVersion: 2, [key]: value }, '')
    entry.value = value
  }

  // Restore after hydration so server HTML and the first client render stay identical.
  nuxtApp.hook('app:mounted', () => {
    const current = router.currentRoute.value.fullPath
    save(current, allowed(current) ? restore(current) : null)
    ready = true
  })
  window.addEventListener('popstate', () => { traversing = true })

  // Store the entry kind with this navigation, not in a timing-dependent "next click" flag.
  document.addEventListener('click', (event) => {
    if (!ready || event.defaultPrevented || event.button !== 0
      || event.metaKey || event.ctrlKey || event.shiftKey || event.altKey) return
    const link = event.target instanceof Element ? event.target.closest('a') : null
    if (!link?.closest('[data-breadcrumb-root]') || link.hasAttribute('download')
      || (link.target && link.target !== '_self') || link.getAttribute('href')?.startsWith('#')) return
    const url = new URL(link.href)
    if (url.origin !== window.location.origin) return
    const destination = router.resolve(url.pathname + url.search + url.hash)
    if (!allowed(destination.fullPath)) return
    event.preventDefault()
    router.push({ path: destination.path, query: destination.query, hash: destination.hash, state: { sakuraBreadcrumbRoot: true } })
      .then((failure) => {
        // Clicking the current page in the menu should also discard its old content source.
        if (isNavigationFailure(failure, NavigationFailureType.duplicated)) {
          window.history.replaceState({ ...window.history.state, sakuraBreadcrumbRoot: true }, '')
          save(router.currentRoute.value.fullPath, null)
        }
      })
      .catch(error => { showError(error) })
  }, true)

  router.beforeEach((_to, from) => {
    if (!ready) return
    position = window.history.state?.position ?? 0
    previous = entry.value?.current === from.fullPath ? entry.value.source : null
    const label = document.title.split('｜')[0]?.trim()
      || document.querySelector('nav[aria-label="麵包屑"] [aria-current="page"]')?.textContent
    leaving = from.matched.length && allowed(from.fullPath)
      ? readBreadcrumbSource({ to: from.fullPath, label, position }) : null
  })
  router.afterEach((to, from, failure) => {
    if (!ready) return
    const wasTraversal = traversing
    traversing = false
    if (failure || !from.matched.length) return
    let source: BreadcrumbSource | null = null
    if (allowed(to.fullPath)) {
      if (wasTraversal) source = restore(to.fullPath)
      else if (window.history.state?.sakuraBreadcrumbRoot === true) source = null
      // Filters, anchors and replace() aren't a new preceding page.
      else if (to.path === from.path || window.history.state?.position === position) source = previous
      else source = leaving
    }
    save(to.fullPath, source)
  })
})
