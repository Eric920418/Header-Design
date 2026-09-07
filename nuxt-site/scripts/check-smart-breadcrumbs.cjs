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
      await page.waitForFunction(() => document.querySelector('#__nuxt')?.__vue_app__?.config.globalProperties.$nuxt?.isHydrating === false && history.state?.sakuraBreadcrumb?.current === location.pathname + location.search + location.hash)
      await page.waitForTimeout(500)
    }
    const go = async path => {
      assert.equal((await page.goto(base + path)).status(), 200, path)
      await settled()
    }
    const click = async locator => {
      const before = page.url()
      await locator.click()
      await page.waitForURL(url => url.href !== before)
      await settled()
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
    await footer('/products/sakura')
    await sourceIs('/design-inspiration', '設計靈感')
    await nav().locator('a').nth(1).focus()
    await page.keyboard.press('Enter')
    await page.waitForURL(base + '/design-inspiration')
    await settled()
    await nav().locator('span[aria-current="page"]').filter({ hasText: '設計靈感' }).waitFor()
    assert.equal(new URL(page.url()).pathname, '/design-inspiration')
    await footer('/products/sakura')
    const popupPromise = context.waitForEvent('page')
    await nav().locator('a').nth(1).click({ modifiers: ['ControlOrMeta'] })
    const popup = await popupPromise
    await popup.waitForLoadState('domcontentloaded')
    assert.equal(new URL(popup.url()).pathname, '/design-inspiration')
    await popup.close()
    assert.equal(new URL(page.url()).pathname, '/products/sakura', '新分頁不能帶走原頁')
    await click(nav().getByRole('link', { name: '首頁', exact: true }))
    assert.equal(new URL(page.url()).pathname, '/')
    console.log('PASS 跨分類真實來源、鍵盤、新分頁及固定首頁')

    await go('/builders')
    assert.equal(await nav().count(), 0, '無麵包屑頁面不能新增區塊')
    await footer('/products/sakura')
    await sourceIs('/builders', '建商專區')

    await go('/franchising/intro#introduction')
    await footer('/franchising/download')
    await sourceIs('/franchising/intro#introduction')
    await click(nav().locator('a').nth(1))
    assert.equal(new URL(page.url()).hash, '#introduction')

    await go('/knowledge/design/kitchen-outlet-planning')
    const articleTitle = (await page.title()).split('｜')[0]
    await footer('/about/introduce')
    await sourceIs('/knowledge/design/kitchen-outlet-planning', articleTitle)
    for (const width of [1440, 390]) {
      await page.setViewportSize({ width, height: 1000 })
      assert(await nav().evaluate(el => el.scrollWidth <= el.clientWidth + 1), `${width}px 長來源標題不可溢出`)
      if (process.env.BREADCRUMB_SCREENSHOT_DIR) await nav().screenshot({ path: `${process.env.BREADCRUMB_SCREENSHOT_DIR}/breadcrumb-${width}.png` })
    }
    await page.setViewportSize({ width: 1440, height: 1000 })

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

    const routes = ['/privacy', '/service-process', '/about/introduce', '/gallery', '/gallery/case10', '/design-inspiration', '/knowledge', '/knowledge/design/systemcabinet', '/knowledge/design/kitchen-outlet-planning', '/news', '/news/latest', '/news/latest/kaohsiung_opening', '/news/activities', '/news/activities/2025KC', '/news/video', '/news/video/american_urban', '/franchising/download', '/builders/catalogues', '/catalogues/catalog', '/catalogues/kitchenware-catalog', '/products/sakura', '/products/sakura/range-hood', '/products/sakura/range-hood/near-suction', '/products/sakura/range-hood/near-suction/r7600']
    for (const path of routes) {
      await go(path)
      await nav().waitFor({ state: 'visible' })
      assert.equal(await nav().count(), 1, path)
      for (const width of [1440, 390]) {
        await page.setViewportSize({ width, height: 1000 })
        assert(await nav().evaluate(el => [...el.querySelectorAll('a,span')].every(child => {
          const r = child.getBoundingClientRect()
          return r.left >= -1 && r.right <= innerWidth + 1
        })), `${path} ${width}px 麵包屑溢出`)
      }
      await page.setViewportSize({ width: 1440, height: 1000 })
    }
    assert.deepEqual(errors, [])
    console.log(`PASS ${routes.length} 頁桌機／手機既有麵包屑；無前端或 hydration 錯誤`)
  } finally { await browser.close() }
}
main().catch(error => { console.error(error); process.exitCode = 1 })
