// Run with PREVIEW_PASSWORD and Playwright available in NODE_PATH.
const assert = require('node:assert/strict')
const { chromium } = require('playwright')

async function main() {
  assert(process.env.PREVIEW_PASSWORD, '請設定 PREVIEW_PASSWORD')
  const base = process.env.PREVIEW_URL || 'http://127.0.0.1:3018'
  const browser = await chromium.launch({ headless: true })
  try {
    const context = await browser.newContext({ viewport: { width: 1440, height: 1000 }, reducedMotion: 'reduce' })
    assert.equal((await context.request.post(base + '/api/preview-access', { data: { password: process.env.PREVIEW_PASSWORD } })).status(), 200)
    const page = await context.newPage()
    const errors = []
    page.on('pageerror', error => errors.push(error.message))
    page.on('console', message => { if (/hydration.*mismatch/i.test(message.text())) errors.push(message.text()) })
    const nav = () => page.locator('nav[aria-label="麵包屑"]')
    const state = () => page.evaluate(() => ({ ...history.state, length: history.length }))
    const settled = async () => {
      await page.waitForFunction(() => {
        const app = document.querySelector('#__nuxt')?.__vue_app__?.config.globalProperties.$nuxt
        const current = location.pathname + location.search + location.hash
        return app?.isHydrating === false && app._route.fullPath === current && history.state?.sakuraBreadcrumb?.current === current
      })
      await page.waitForTimeout(500)
    }
    const go = async path => {
      assert.equal((await page.goto(base + path, { waitUntil: 'domcontentloaded' })).status(), 200, path)
      await settled()
    }
    const click = async locator => {
      const before = page.url()
      await locator.click()
      await page.waitForURL(url => url.href !== before)
      await settled()
    }
    const scrollToBottom = async () => {
      await page.keyboard.press('Shift') // Start a new interaction before setup scrolling.
      await page.evaluate(() => scrollTo(0, document.documentElement.scrollHeight))
      await page.waitForTimeout(100)
      assert(await page.evaluate(() => scrollY > 1), '測試頁面必須能向下捲動')
    }
    const assertAtTop = async label => {
      const top = await page.evaluate(() => scrollY)
      assert(top <= 1, `${label} 應從頁面頂端開始，實際 scrollY=${top}`)
    }
    const footer = async path => {
      const toggle = page.getByRole('button', { name: '網站地圖', exact: true })
      if (await toggle.getAttribute('aria-expanded') !== 'true') await toggle.click()
      await click(page.locator(`#footer-sitemap a[href="${path}"]`).first())
    }
    const sourceIs = async (to, label) => {
      await page.waitForFunction(to => document.querySelector('nav[aria-label="麵包屑"] a:nth-of-type(2)')?.getAttribute('href') === to, to)
      assert.equal((await state()).sakuraBreadcrumb.source?.to, to)
      assert.equal(await nav().locator('a').nth(1).getAttribute('href'), to)
      if (label) assert.equal(await nav().locator('a').nth(1).textContent(), label)
    }

    const header = async (menu, path, keyboard = false) => {
      await page.evaluate(() => scrollTo(0, 0))
      // Header intentionally closes menus on scroll; finish scrolling before opening one.
      await page.waitForTimeout(300)
      const root = page.locator('header.fixed')
      if (page.viewportSize().width < 1024) await root.getByRole('button', { name: '開啟選單', exact: true }).click()
      await root.getByRole('button', { name: menu, exact: true }).click()
      const link = root.locator(`a[href="${path}"]:visible`).first()
      if (keyboard) { await link.focus(); await page.keyboard.press('Enter') }
      else await link.click()
      await page.waitForURL(base + path)
      await settled()
    }
    const rootIs = async label => {
      await nav().locator('span[aria-current="page"]').filter({ hasText: label }).waitFor()
      assert.equal((await state()).sakuraBreadcrumb.source, null, '主選單進入不應記錄剛才瀏覽的頁面')
      assert.deepEqual(await nav().locator('a, span:not([aria-hidden])').allTextContents(), ['首頁', label])
    }
    const trail = () => nav().locator('a, span:not([aria-hidden])').evaluateAll(elements => elements.map(el => ({ label: el.textContent, to: el.getAttribute('href') })))
    const push = async path => {
      await page.evaluate(path => { void document.querySelector('#__nuxt').__vue_app__.config.globalProperties.$router.push(path) }, path)
      await page.waitForURL(base + path)
      await settled()
    }
    for (const width of [1440, 390]) {
      await page.setViewportSize({ width, height: 1000 })
      await go('/knowledge/design/systemcabinet')
      await page.keyboard.press('Shift')
      await click(page.locator('main a[href="/catalogues/kitchenware-catalog"]').first())
      assert.deepEqual((await trail()).map(item => item.label), ['首頁', '品牌系列型錄'], '文章正文連到型錄不能把文章當成父分類')
      await go('/about/advantage')
      await click(page.locator('main a[href="/about/introduce"]').first())
      assert.deepEqual((await trail()).map(item => item.label), ['首頁', '關於我們'], '品牌優勢不是關於我們的父分類')
      console.log(`PASS ${width}px 指南正文至型錄、品牌優勢至關於我們維持分類`)
    }
    for (const width of [1440, 390]) {
      await page.setViewportSize({ width, height: 1000 })
      for (const [parent, label, suffix] of [['/design-inspiration', '設計靈感', '?from=inspiration'], ['/gallery', '案例門市', '']]) {
        const assertListTrail = async () => assert.deepEqual(await trail(), [{ label: '首頁', to: '/' }, { label, to: null }], '案例返回列表不得插入案例長標題')
        await go('/gallery/case10' + suffix)
        await click(nav().locator(`a[href="${parent}"]`))
        await assertListTrail(); await assertAtTop('案例返回列表')
        await page.reload(); await settled(); await assertListTrail()
        await page.goBack(); await settled()
        await page.goForward(); await settled(); await assertListTrail()
      }
      console.log(`PASS ${width}px 案例返回設計靈感／案例門市列表、重整與前進後退不帶案例標題`)
      await go('/design-inspiration')
      await page.locator('#design-style').selectOption('工業風')
      await click(page.locator('.design-projects-filter__submit'))
      const filteredInspiration = new URL(page.url()).pathname + new URL(page.url()).search
      await click(page.locator('main .design-project-card__image-link').first())
      await sourceIs(filteredInspiration, '設計靈感')
      const beforeReturn = await state()
      await click(nav().locator('a').nth(1))
      assert.equal(page.url(), base + filteredInspiration)
      assert.equal(await page.locator('#design-style').inputValue(), '工業風')
      assert.deepEqual((await trail()).map(item => item.label), ['首頁', '設計靈感'])
      assert.equal((await state()).length, beforeReturn.length, '篩選列表返回不能新增歷史')
      console.log(`PASS ${width}px 設計靈感篩選後案例返回保留風格、分類與歷史`)
    }
    await go('/knowledge/design/kitchen-outlet-planning')
    await click(page.locator('.knowledge-detail__meta a[href="/knowledge"]'))
    assert.deepEqual((await trail()).map(item => item.label), ['首頁', '廚房裝修指南'], '文章返回列表不得插入文章標題')
    for (const width of [1440, 390]) {
      await page.setViewportSize({ width, height: 1000 })
      for (const suffix of ['', '?from=inspiration']) {
        const parent = suffix ? '/design-inspiration' : '/gallery'
        const expected = ['首頁', suffix ? '設計靈感' : '案例門市', '門市案例']
        const assertCaseTrail = async () => {
          assert.deepEqual((await trail()).map(item => item.label), expected)
          assert.equal(await nav().locator('a').nth(1).getAttribute('href'), parent)
          assert.equal(await page.locator('.breadcrumb-source-return').count(), 0)
        }
        await go('/gallery/case10' + suffix)
        await assertCaseTrail()
        for (const slug of ['case56', 'case35', 'case10']) {
          await scrollToBottom()
          const target = '/gallery/' + slug + suffix
          await click(page.locator(`.case-recommendation-card h3 a[href="${target}"]`).first())
          assert((await state()).sakuraBreadcrumb.source?.to.startsWith('/gallery/case'), '必須由另一案例進入')
          await assertCaseTrail()
          await assertAtTop('推薦案例跳轉')
          await page.reload(); await settled(); await assertCaseTrail()
          await page.goBack(); await settled()
          await page.goForward(); await settled(); await assertCaseTrail()
        }
        await scrollToBottom()
        await click(page.locator('.case-detail-navigation__next'))
        await assertCaseTrail()
        await click(nav().locator(`a[href="${parent}"]`))
        assert.equal(page.url(), base + parent)
        assert.deepEqual((await trail()).map(item => item.label), expected.slice(0, 2), '推薦案例返回列表不得插入案例長標題')
        await assertAtTop('案例分類返回')
      }
      console.log(`PASS ${width}px 三案例推薦／下一篇固定分類、設計靈感來源、重整與前進後退`)
    }
    const newsSource = '/news/activities/2025_ro_water_sp'
    const productRoot = '/products/sakura/range-hood/near-suction'
    const fixedRoutes = ['/news', '/news/activities', '/news/activities/2025KC', '/news/latest', '/news/latest/kaohsiung_opening', '/news/video', '/news/video/american_urban', '/products/sakura', '/products/sakura/range-hood', productRoot, productRoot + '/r7615', '/catalogues/catalog', '/knowledge', '/knowledge/design/systemcabinet', '/knowledge/design/kitchen-outlet-planning', '/knowledge/design/knowledge31']
    for (const width of [1440, 390]) {
      await page.setViewportSize({ width, height: 1000 })
      for (const path of fixedRoutes) {
        await go(path)
        const original = await trail()
        const isProduct = path === productRoot + '/r7615'
        await go(isProduct ? productRoot + '/r7600' : newsSource)
        if (isProduct || path === '/news/activities/2025KC') {
          await scrollToBottom()
          await click(page.locator(isProduct ? '.related-product-card[href$="/r7615"]' : '.activity-related__card[href$="/2025KC"]').first())
        } else {
          await page.evaluate(path => { void document.querySelector('#__nuxt').__vue_app__.config.globalProperties.$router.push(path) }, path)
          await page.waitForURL(base + path, { waitUntil: 'domcontentloaded' })
          await settled()
        }
        assert((await state()).sakuraBreadcrumb.source, '必須帶有上一頁來源才能驗證分類不受影響')
        assert.deepEqual(await trail(), original, `${width}px ${path} 必須維持原本分類與連結`)
        assert.equal(await page.locator('.breadcrumb-source-return').count(), 0)
        await assertAtTop('固定分類頁面跳轉')
        if (isProduct || path === '/news/activities/2025KC') {
          if (!isProduct) assert.deepEqual(original.map(item => item.label), ['首頁', '優惠消息', '優惠活動'])
          await page.reload(); await settled()
          assert.deepEqual(await trail(), original)
          await page.goBack(); await settled()
          await page.goForward(); await settled()
          assert.deepEqual(await trail(), original)
          const category = isProduct ? productRoot : '/news/activities'
          await click(nav().locator(`a[href="${category}"]`))
          assert.equal(page.url(), base + category)
          await assertAtTop('固定分類麵包屑')
        }
      }
      console.log(`PASS ${width}px 消息／商品／型錄／指南 ${fixedRoutes.length} 頁固定分類；推薦卡、重新整理、前進後退與分類返回`)
    }
    for (const width of [1440, 390]) {
      await page.setViewportSize({ width, height: 1000 })
      await go('/products/sakura/range-hood/near-suction/r7600')
      await header('廚房產品', '/products/sakura')
      await rootIs('SAKURA 廚電')
      await header('設計案例', '/knowledge', width === 1440)
      await rootIs('廚房裝修指南')
      await page.reload(); await settled(); await rootIs('廚房裝修指南')
      await page.goBack(); await settled(); await rootIs('SAKURA 廚電')
      await page.goForward(); await settled(); await rootIs('廚房裝修指南')
      console.log(`PASS ${width}px Header 新入口、重新整理、前進後退`)
    }
    await page.setViewportSize({ width: 1440, height: 1000 })

    for (const width of [1440, 390]) {
      await page.setViewportSize({ width, height: 1000 })
      await go('/knowledge')
      await scrollToBottom()
      await click(page.locator('main a[href="/knowledge/design/systemcabinet"]:visible').first())
      await assertAtTop('文章卡片跳轉')
      const firstArticle = new URL(page.url()).pathname
      const hierarchy = ['首頁', '廚房裝修指南']
      const articleTrail = async () => {
        assert.deepEqual(await nav().locator('a:not(.breadcrumb-source-return), span:not([aria-hidden])').allTextContents(), hierarchy)
        assert.equal(await nav().getByRole('link', { name: '廚房裝修指南', exact: true }).getAttribute('href'), '/knowledge')
        assert.equal(await page.locator('.breadcrumb-source-return').count(), 0, '指南只保留原分類，不新增上一頁連結')
      }
      await articleTrail()
      assert.equal(await nav().locator('.breadcrumb-source-return').count(), 0)
      await scrollToBottom()
      await click(page.locator('a.knowledge-related-home07__card, a.knowledge-related__card').first())
      await assertAtTop('推薦文章跳轉')
      const secondArticle = page.url()
      await articleTrail()
      await page.reload(); await settled(); await articleTrail()
      const beforeReturn = await state()
      await page.goBack()
      await page.waitForURL(base + firstArticle); await settled(); await articleTrail()
      await assertAtTop('指南瀏覽器返回')
      assert.equal((await state()).length, beforeReturn.length)
      await page.goForward(); await settled(); await articleTrail()
      await assertAtTop('瀏覽器前進')
      assert.equal(page.url(), secondArticle)
      await nav().getByRole('link', { name: '廚房裝修指南', exact: true }).focus()
      await page.keyboard.press('Enter')
      await page.waitForURL(base + '/knowledge'); await settled()
      assert.equal(page.url(), base + '/knowledge')
      assert.deepEqual((await trail()).map(item => item.label), hierarchy)
      assert.equal(await page.locator('.breadcrumb-source-return').count(), 0)
      await assertAtTop('指南分類返回')
      console.log(`PASS ${width}px 指南列表／延伸文章固定分類、無額外返回連結、鍵盤返回分類、重整與前進後退`)
    }
    await page.setViewportSize({ width: 1440, height: 1000 })

    await go('/gallery')
    await click(page.getByRole('button', { name: '北部', exact: true }))
    const filtered = new URL(page.url()).pathname + new URL(page.url()).search
    assert.equal((await state()).sakuraBreadcrumb.source, null, '篩選不能變成自己的上一頁')
    await click(page.locator('.antra-store-grid a').first())
    await sourceIs(filtered, '案例門市')
    const detail = new URL(page.url()).pathname
    const detailState = await state()
    await page.reload(); await settled()
    await sourceIs(filtered, '案例門市')
    await click(nav().locator('a').nth(1))
    assert.equal(new URL(page.url()).pathname + new URL(page.url()).search, filtered)
    assert.equal(await page.getByRole('button', { name: '北部', exact: true }).getAttribute('aria-pressed'), 'true')
    assert.equal((await state()).length, detailState.length, '返回不應新增歷史')
    await page.goForward(); await settled()
    assert.equal(new URL(page.url()).pathname, detail)
    await sourceIs(filtered)
    await page.goBack(); await settled()
    assert.equal((await state()).sakuraBreadcrumb.source, null)
    console.log('PASS 篩選來源、重新整理、前進後退及無循環返回')

    await go('/design-inspiration')
    await click(page.locator('main .design-project-card__image-link').first())
    const inspirationCase = page.url()
    await sourceIs('/design-inspiration', '設計靈感')
    await nav().locator('a').nth(1).focus()
    await page.keyboard.press('Enter')
    await page.waitForURL(base + '/design-inspiration')
    await settled()
    await nav().locator('span[aria-current="page"]').filter({ hasText: '設計靈感' }).waitFor()
    assert.equal(new URL(page.url()).pathname, '/design-inspiration')
    assert.deepEqual((await trail()).map(item => item.label), ['首頁', '設計靈感'])
    await click(page.locator('main .design-project-card__image-link').first())
    const popupPromise = context.waitForEvent('page')
    await nav().locator('a').nth(1).click({ modifiers: ['ControlOrMeta'] })
    const popup = await popupPromise
    await popup.waitForLoadState('domcontentloaded')
    assert.equal(new URL(popup.url()).pathname, '/design-inspiration')
    await popup.close()
    assert.equal(page.url(), inspirationCase, '新分頁不能帶走原頁')
    await click(nav().getByRole('link', { name: '首頁', exact: true }))
    assert.equal(new URL(page.url()).pathname, '/')
    console.log('PASS 跨分類真實來源、鍵盤、新分頁及固定首頁')

    await go('/builders')
    assert.equal(await nav().count(), 0, '無麵包屑頁面不能新增區塊')
    await footer('/products/sakura')
    await rootIs('SAKURA 廚電')
    console.log('PASS Footer 新入口不繼承剛才的頁面')

    await go('/gallery#footer-navigation')
    await click(page.locator('.antra-store-grid a').first())
    await sourceIs('/gallery#footer-navigation')
    await click(nav().locator('a').nth(1))
    assert.equal(new URL(page.url()).hash, '#footer-navigation')

    await go('/gallery/case10')
    await scrollToBottom()
    await click(page.locator('.case-detail-navigation__next'))
    assert.deepEqual((await trail()).map(item => item.label), ['首頁', '案例門市', '門市案例'])
    for (const width of [1440, 390]) {
      await page.setViewportSize({ width, height: 1000 })
      assert(await nav().evaluate(el => el.scrollWidth <= el.clientWidth + 1), `${width}px 長來源標題不可溢出`)
      if (process.env.BREADCRUMB_SCREENSHOT_DIR) await nav().screenshot({ path: `${process.env.BREADCRUMB_SCREENSHOT_DIR}/breadcrumb-${width}.png` })
    }
    await page.setViewportSize({ width: 1440, height: 1000 })

    await go('/knowledge/design/kitchen-outlet-planning')
    await click(page.locator('.knowledge-detail__meta a[href="/knowledge"]'))
    assert.deepEqual((await trail()).map(item => item.label), ['首頁', '廚房裝修指南'])
    await header('設計案例', '/knowledge')
    await rootIs('廚房裝修指南')
    await page.reload(); await settled(); await rootIs('廚房裝修指南')
    console.log('PASS Header 重選同一頁也會清除舊來源')

    await page.evaluate(() => {
      const old = { ...history.state }
      delete old.sakuraBreadcrumbVersion
      old.sakuraBreadcrumb = { current: location.pathname, source: { to: '/products/sakura', label: 'SAKURA Kitchen Appliances', position: 1 } }
      history.replaceState(old, '')
    })
    await page.reload(); await settled(); await rootIs('廚房裝修指南')
    console.log('PASS 舊版無入口區分的歷史紀錄失效')

    await go('/products/sakura/range-hood/near-suction/r7600')
    assert.equal((await state()).sakuraBreadcrumb.source, null)
    assert.equal(await nav().locator('a').count(), 4, '直接進入保留完整分類')
    await go('/catalogues/kitchenware-catalog?series=aikitchen')
    assert.equal(await nav().locator('a').nth(1).getAttribute('href'), '/home-style/aikitchen')
    for (const to of ['https://example.com/', '//example.com/', '/\\example.com', '/preview-access', '/preview-access/', '/api/preview-access', '/does-not-exist']) {
      await page.evaluate(to => history.replaceState({ ...history.state, sakuraBreadcrumb: { current: location.pathname + location.search, source: { to, label: '不可信來源', position: 1 } } }, ''), to)
      await page.reload(); await settled()
      assert.equal((await state()).sakuraBreadcrumb.source, null, '拒絕來源 ' + to)
    }
    console.log('PASS 無來源分類回退、既有 series 提示、無效或外站／登入來源拒絕')

    // Discover new pages automatically, instead of maintaining another exception list.
    await go('/')
    const routes = new Set(await page.evaluate(() => document.querySelector('#__nuxt').__vue_app__.config.globalProperties.$router.getRoutes()
      .map(route => route.path).filter(path => !path.includes(':') && !['/preview-access', '/sitemap'].includes(path))))
    routes.add('/catalogues/kitchenware-catalog?series=aikitchen')
    let breadcrumbPages = 0
    for (const path of routes) {
      await go(path)
      for (const linked of await page.evaluate(() => {
        const router = document.querySelector('#__nuxt').__vue_app__.config.globalProperties.$router
        return [...document.querySelectorAll('a[href]')].map(a => new URL(a.href)).filter(url => url.origin === location.origin
          && !['/preview-access', '/sitemap'].includes(url.pathname) && router.resolve(url.pathname).matched.length)
          .map(url => url.pathname + (url.pathname.startsWith('/gallery/') && url.searchParams.get('from') === 'inspiration' ? '?from=inspiration' : ''))
      })) routes.add(linked)
      const original = await trail()
      if (original.length) breadcrumbPages++
      assert.equal(await nav().count(), original.length ? 1 : 0, path)
      const parent = original.find(item => item.to && item.to !== '/')
      if (parent) {
        // Even a valid parent's SEO/history title cannot rename or flatten the hierarchy.
        await page.evaluate(to => history.replaceState({ ...history.state, sakuraBreadcrumb: {
          current: location.pathname + location.search + location.hash,
          source: { to, label: '父頁的另一個長 SEO 標題，不是分類名稱', position: 1 },
        } }, ''), parent.to)
        await page.reload(); await settled()
        assert.deepEqual(await trail(), original, `${path} 合法父頁來源也不能改寫分類名稱或層數`)
      }
      for (const width of [1440, 390]) {
        await page.setViewportSize({ width, height: 1000 })
        const unrelated = path.startsWith('/gallery/case10') ? '/gallery/case56' : '/gallery/case10'
        await push(unrelated)
        await push(path)
        assert((await state()).sakuraBreadcrumb.source, '必須由站內頁面跳轉，不能只測直接開啟')
        assert.deepEqual(await trail(), original, `${path} ${width}px 不能由上一頁改寫分類、名稱或連結`)
        assert.equal(await page.locator('.breadcrumb-source-return').count(), 0)
        await assertAtTop(`${path} 全站跨頁檢查`)
        if (original.length) assert(await nav().evaluate(el => [...el.querySelectorAll('a,span')].every(child => {
          const r = child.getBoundingClientRect()
          return r.left >= -1 && r.right <= innerWidth + 1
        })), `${path} ${width}px 麵包屑溢出`)
      }
      await page.setViewportSize({ width: 1440, height: 1000 })
      console.log(`PASS 全站分類不變 ${path}`)
    }
    assert.deepEqual(errors, [])
    console.log(`PASS 自動發現 ${routes.size} 個網址（${breadcrumbPages} 個有麵包屑），桌機／手機跨頁分類不變；無前端或 hydration 錯誤`)
  } finally { await browser.close() }
}
main().catch(error => { console.error(error); process.exitCode = 1 })
