// PREVIEW_URL=http://127.0.0.1:3027 PREVIEW_PASSWORD=... node scripts/check-route-scroll.cjs
const assert = require('node:assert/strict')
const { chromium } = require('playwright')

async function main() {
  assert(process.env.PREVIEW_PASSWORD, '請設定 PREVIEW_PASSWORD')
  const base = process.env.PREVIEW_URL || 'http://127.0.0.1:3027'
  const browser = await chromium.launch({ headless: true })
  const failures = []
  try {
    for (const [width, reducedMotion] of [[1440, 'no-preference'], [390, 'no-preference'], [1440, 'reduce']]) {
      const mode = `${width}px ${reducedMotion}`
      const context = await browser.newContext({ viewport: { width, height: 1000 }, reducedMotion })
      assert.equal((await context.request.post(base + '/api/preview-access', { data: { password: process.env.PREVIEW_PASSWORD } })).status(), 200)
      const page = await context.newPage()
      page.on('pageerror', error => failures.push(`${mode}: ${error.message}`))
      page.on('console', message => {
        if (/hydration.*mismatch/i.test(message.text())) failures.push(`${mode}: ${message.text()}`)
      })
      const settled = async () => {
        await page.waitForFunction(() => {
          const app = document.querySelector('#__nuxt')?.__vue_app__?.config.globalProperties.$nuxt
          return app?.isHydrating === false && app._route.fullPath === location.pathname + location.search + location.hash
        })
        await page.waitForTimeout(100)
      }
      const atTop = async label => {
        // Check immediately and after the full 1.2s Lenis animation could have pulled us back.
        const positions = [await page.evaluate(() => scrollY)]
        await page.waitForTimeout(1400)
        positions.push(await page.evaluate(() => scrollY))
        if (positions.some(y => y > 1)) {
          const message = `${mode} ${label}: scrollY=${positions.join(' → ')}`
          failures.push(message)
          console.error('FAIL', message)
        }
        const error = await page.evaluate(() => document.querySelector('#__nuxt')?.__vue_app__?.config.globalProperties.$nuxt?.payload.error)
        if (error) failures.push(`${mode} ${label}: ${JSON.stringify(error)}`)
      }
      const push = async path => {
        // Observe navigation like a click; don't keep a remote Vue promise alive through CDP.
        await page.evaluate(path => { void document.querySelector('#__nuxt').__vue_app__.config.globalProperties.$router.push(path) }, path)
        await page.waitForURL(base + path, { waitUntil: 'domcontentloaded' })
        await settled()
      }
      const wheel = async () => {
        await page.mouse.move(Math.min(width / 2, 700), 450)
        await page.mouse.wheel(0, 160)
        await page.waitForTimeout(60)
        if (width > 992 && reducedMotion === 'no-preference') {
          assert(await page.evaluate(() => document.documentElement.classList.contains('lenis-smooth')), '必須在慣性動畫進行中測試跳轉')
        }
      }
      const click = async (selector, label) => {
        await page.keyboard.press('Shift') // A new user interaction precedes setup scrolling.
        const current = new URL(page.url()).pathname
        const links = page.locator(selector).and(page.locator(`a:not([href="${current}"])`))
        // Ignore display:none desktop/mobile duplicates, but allow offscreen reveal animations.
        const index = await links.evaluateAll(elements => elements.findIndex(el => el.getClientRects().length > 0))
        assert(index >= 0, `${mode} 找不到可排版的連結: ${selector}`)
        const link = links.nth(index)
        await link.scrollIntoViewIfNeeded()
        await page.waitForTimeout(800) // Allow reveal animations, not the wheel below, to settle.
        const before = page.url()
        const keyboard = selector.startsWith('nav[')
        if (keyboard) await link.focus()
        await wheel()
        // Force avoids Playwright waiting for the scrolling element to become stable.
        if (keyboard) await page.keyboard.press('Enter')
        else await link.click({ force: true })
        await page.waitForURL(url => url.href !== before)
        await settled()
        await atTop(label)
        console.log(`CHECK ${mode} ${label}`)
      }
      await page.goto(base + '/', { waitUntil: 'domcontentloaded' })
      await settled()
      // All static routes, plus concrete dynamic routes discovered from the site's own links.
      const routes = new Set(process.env.SCROLL_FLOWS_ONLY ? [] : await page.evaluate(() => document.querySelector('#__nuxt').__vue_app__.config.globalProperties.$router.getRoutes()
        .map(route => route.path).filter(path => !path.includes(':') && !['/preview-access', '/sitemap'].includes(path))))
      for (const path of routes) {
        if (new URL(page.url()).pathname === path) await push(path === '/' ? '/privacy' : '/')
        await page.keyboard.press('Shift')
        await page.evaluate(() => scrollTo({ top: 600, behavior: 'instant' }))
        await page.waitForTimeout(80)
        await wheel()
        await push(path)
        await atTop(path)
        for (const linked of await page.evaluate(() => {
          const router = document.querySelector('#__nuxt').__vue_app__.config.globalProperties.$router
          return [...document.querySelectorAll('a[href]')].map(a => new URL(a.href)).filter(url => url.origin === location.origin
            && !['/preview-access', '/sitemap'].includes(url.pathname) && router.resolve(url.pathname).matched.length).map(url => url.pathname)
        })) routes.add(linked)
        console.log(`CHECK ${mode} ${path}`)
      }
      if (process.env.SCROLL_ROUTES_ONLY) {
        console.log(`CHECK ${mode}: ${routes.size} 頁路由掃描完成`)
        await context.close()
        continue
      }

      const product = '/products/sakura/range-hood/near-suction'
      await push(product)
      await click('.near-suction-product-card[href$="/r7615"]', '商品列表 → R7615')
      await click('.related-product-card[href$="/r7600"]', '推薦商品 → R7600')
      await click('.related-product-card[href$="/r7615"]', '推薦商品 → R7615')
      await click('nav[aria-label="麵包屑"] a[href$="/r7600"]', '商品麵包屑返回')
      await wheel(); await page.goForward(); await settled(); await atTop('商品瀏覽器前進')
      await click('.product-catalogue__cta', '商品型錄下載入口')
      await push('/news/activities')
      await click('.antra-activity-post__link', '優惠活動卡片')
      await click('.activity-related__card', '優惠活動推薦文章')
      await click('nav[aria-label="麵包屑"] a:not([href="/"])', '優惠活動麵包屑返回')
      await push('/knowledge')
      await click('main a[href="/knowledge/design/systemcabinet"]', '指南卡片')
      await click('.knowledge-related-home07__card, .knowledge-related__card', '指南推薦文章')
      await push('/gallery')
      await click('.antra-store-grid a', '案例門市卡片')
      await click('.case-detail-navigation__next', '案例下一篇')
      for (const selector of ['#kitchen-series a[href="/home-style/aikitchen"]', '[aria-labelledby="services-heading"] a[href="/products/sakura"]', '#brand-promise a']) {
        await push('/')
        await click(selector, `首頁 ${selector}`)
      }
      // Query-only filters retain their position; explicit anchors retain their destination.
      await push('/gallery')
      await page.keyboard.press('Shift')
      await page.evaluate(() => scrollTo({ top: 300, behavior: 'instant' }))
      const filter = page.getByRole('button', { name: '北部', exact: true })
      await filter.scrollIntoViewIfNeeded()
      await page.waitForTimeout(400)
      const beforeFilter = await page.evaluate(() => scrollY)
      await filter.click()
      await settled()
      const afterFilter = await page.evaluate(() => scrollY)
      assert(Math.abs(afterFilter - beforeFilter) <= 1, `列表篩選不應強制回頂: ${beforeFilter} → ${afterFilter}`)
      await push('/gallery#footer-navigation')
      await page.waitForTimeout(1400)
      assert(await page.evaluate(() => scrollY > 0 && document.querySelector('#footer-navigation').getBoundingClientRect().top < innerHeight), '明確錨點必須仍可抵達')
      await push('/franchising/intro#advantages')
      await page.waitForTimeout(1400)
      const anchorTop = await page.locator('#advantages').evaluate(el => el.getBoundingClientRect().top)
      if (Math.abs(anchorTop - 60) > 1) failures.push(`${mode} 跨頁加盟錨點: top=${anchorTop}`)
      console.log(`CHECK ${mode}: ${routes.size} 頁及操作情境完成，跨頁錨點 top=${anchorTop}`)
      await context.close()
    }
    assert.deepEqual(failures, [], failures.join('\n'))
    console.log('PASS 全部模式捲動回歸，無前端或 hydration 錯誤')
  } finally { await browser.close() }
}
main().catch(error => { console.error(error); process.exitCode = 1 })
