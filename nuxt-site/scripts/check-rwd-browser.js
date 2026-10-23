// Run in the existing authenticated browser; no form submissions or CMS writes.
(() => {
  const allowed = ['http://localhost:3100', 'http://127.0.0.1:3100', 'https://sakura-demo-vanlantech.com', 'https://header-design-two.vercel.app']
  if (!allowed.includes(location.origin)) throw Error('RWD audit requires an existing project origin')
  const pause = ms => new Promise(resolve => setTimeout(resolve, ms))
  const app = () => document.querySelector('#__nuxt')?.__vue_app__?.config.globalProperties.$nuxt
  const selector = element => element.id ? '#' + element.id : element.tagName.toLowerCase() + [...element.classList].slice(0, 3).map(value => '.' + value).join('')
  const ignored = element => {
    for (let node = element; node && node !== document.body; node = node.parentElement) {
      const style = getComputedStyle(node)
      if (style.display === 'none' || style.visibility === 'hidden' || node.getAttribute('aria-hidden') === 'true' || node.classList.contains('sr-only')) return true
      if (/(?:marquee|swiper|carousel|embla|(?:^|[-_\s])(?:track|viewport)(?:$|[-_\s])|gallery-column|cursor-grab)/i.test(node.className)) return true
      if (['auto', 'scroll'].includes(style.overflowX) && node.scrollWidth > node.clientWidth + 2) return true
    }
    return false
  }
  const inspect = () => {
    const issues = [], seen = new Set(), width = document.documentElement.clientWidth
    const add = (element, kind, extra = {}) => {
      const key = kind + ':' + selector(element)
      if (seen.has(key)) return
      seen.add(key)
      const rect = element.getBoundingClientRect()
      issues.push({kind, selector: selector(element), text: element.textContent.trim().replace(/\s+/g, ' ').slice(0, 100), left: Math.round(rect.left), right: Math.round(rect.right), width: Math.round(rect.width), ...extra})
    }
    if (document.documentElement.scrollWidth > width + 2) add(document.documentElement, 'page-overflow', {scrollWidth: document.documentElement.scrollWidth})
    const root = document.querySelector('main') || document.querySelector('#top > .min-w-0') || document.querySelector('#__nuxt')
    for (const element of root.querySelectorAll('h1,h2,h3,h4,p,dt,dd,button,label,legend,th,td,summary')) {
      if (ignored(element)) continue
      const rect = element.getBoundingClientRect(), style = getComputedStyle(element)
      if (!rect.width || !rect.height || style.opacity === '0') continue
      if (rect.left < -2 || rect.right > width + 2) add(element, 'element-outside-viewport')
      const walker = document.createTreeWalker(element, NodeFilter.SHOW_TEXT)
      let textOverflowsBox = false
      for (let node = walker.nextNode(); node; node = walker.nextNode()) {
        if (!node.textContent.trim() || ignored(node.parentElement)) continue
        const range = document.createRange(); range.selectNodeContents(node)
        const boxes = [...range.getClientRects()].filter(box => box.width > 0)
        if (boxes.some(box => box.left < -2 || box.right > width + 2)) add(element, 'text-outside-viewport')
        if (boxes.some(box => box.left < rect.left - 2 || box.right > rect.right + 2)) textOverflowsBox = true
      }
      if (textOverflowsBox && element.clientWidth > 0 && element.scrollWidth > element.clientWidth + 3 && style.textOverflow !== 'ellipsis' && !(parseInt(style.webkitLineClamp) > 0)) add(element, 'content-overflows-box', {scrollWidth: element.scrollWidth, clientWidth: element.clientWidth})
    }
    return {path: location.pathname + location.search, viewport: [innerWidth, innerHeight], issues, alerts: [...document.querySelectorAll('[role="alert"]')].filter(e => e.getClientRects().length).map(e => e.textContent.trim().slice(0, 160)), error: app()?.payload.error?.message || null}
  }
  const scan = async paths => {
    const results = []
    for (const path of paths) {
      if (!path.startsWith('/') || path.startsWith('//') || /^\/(?:api|admin|preview-access|media)(?:\/|\?|$)/.test(path)) throw Error('Not a public page: ' + path)
      const previous = location.pathname + location.search
      let cancel, timer
      const finished = new Promise((resolve, reject) => {
        cancel = app().hook('page:finish', resolve)
        timer = setTimeout(() => reject(Error('Page did not finish: ' + path)), 25000)
      })
      try {
        await app().$router.push(path)
        if (previous !== location.pathname + location.search) await finished
      } finally { clearTimeout(timer); cancel() }
      const deadline = Date.now() + 25000
      while (app().isHydrating || app()._route.fullPath !== location.pathname + location.search + location.hash) {
        if (Date.now() > deadline) throw Error('Page did not settle: ' + path)
        await pause(25)
      }
      await document.fonts.ready
      await pause(100)
      // Measure the settled reveal state, not its temporary 100px entrance offset.
      let stable = document.querySelector('#rwd-audit-stable')
      if (!stable) {
        stable = document.createElement('style'); stable.id = 'rwd-audit-stable'
        document.head.append(stable)
      }
      stable.textContent = '.ev,.hero-slide-copy{animation:none!important;transform:none!important;opacity:1!important;visibility:visible!important}'
      await new Promise(resolve => requestAnimationFrame(() => requestAnimationFrame(resolve)))
      results.push(inspect())
    }
    return results
  }
  const selfCheck = () => {
    const root = document.querySelector('main') || document.querySelector('#top > .min-w-0') || document.querySelector('#__nuxt')
    const fixture = document.createElement('div')
    fixture.innerHTML = '<h2 id="rwd-test-overflow" style="position:absolute;left:0;width:20px;white-space:nowrap">Overflow verification</h2><div class="rwd-test-viewport"><h2 id="rwd-test-carousel" style="position:absolute;left:-500px">Intentional slide</h2></div>'
    root.append(fixture)
    try {
      const issues = inspect().issues
      if (!issues.some(issue => issue.selector === '#rwd-test-overflow' && issue.kind === 'content-overflows-box')) throw Error('Missed overflowing text')
      if (issues.some(issue => issue.selector === '#rwd-test-carousel')) throw Error('Misclassified intentional carousel')
      return {passed: true}
    } finally { fixture.remove() }
  }
  window.rwdAudit = {inspect, scan, selfCheck, restore: () => document.querySelector('#rwd-audit-stable')?.remove()}
})()
