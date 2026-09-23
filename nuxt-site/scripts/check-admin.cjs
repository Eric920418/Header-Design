// NODE_PATH must expose the existing Playwright installation.
// PREVIEW_URL defaults to http://127.0.0.1:3018; set PREVIEW_PASSWORD.
const assert = require('node:assert/strict')
const { chromium } = require('playwright')
const { mkdtempSync } = require('node:fs')
const { tmpdir } = require('node:os')
const { join } = require('node:path')

;(async () => {
  assert(process.env.PREVIEW_PASSWORD, 'Set PREVIEW_PASSWORD for the preview gate')
  const browser = await chromium.launch({ headless: true })
  const screenshots = mkdtempSync(join(tmpdir(), 'sakura-cms-'))
  const base = process.env.PREVIEW_URL || 'http://127.0.0.1:3018'
  try {
    const context = await browser.newContext()
    const locked = await context.request.get(`${base}/admin`, { maxRedirects: 0 })
    assert.equal(locked.status(), 302, 'CMS must retain preview password protection')
    assert(locked.headers().location.includes('/preview-access?redirect='))
    const login = await context.request.post(`${base}/api/preview-access`, { data: { password: process.env.PREVIEW_PASSWORD } })
    assert.equal(login.status(), 200)
    const page = await context.newPage()
    const errors = []
    const writes = []
    page.on('pageerror', error => errors.push(error.message))
    page.on('console', message => { if (message.type() === 'error' || /hydration/i.test(message.text())) errors.push(message.text()) })
    page.on('request', request => { if (['POST', 'PUT', 'PATCH', 'DELETE'].includes(request.method())) writes.push(request.url()) })
    const visit = async path => {
      await page.goto(base + path)
      await page.locator('.cms-page').waitFor()
      await page.evaluate(() => document.fonts.ready)
      await page.locator('.cms-page').evaluate(el => Promise.all(el.getAnimations().map(animation => animation.finished)))
      await page.waitForFunction(() => [...document.querySelectorAll('.cms img')].every(img => img.complete))
    }
    const closed = async () => assert.equal(await page.locator('dialog[open]').count(), 0)
    for (const width of [1440, 1024, 768, 390]) {
      await page.setViewportSize({ width, height: 1000 })
      for (const path of ['/admin', '/admin/home', '/admin/content', '/admin/media']) {
        await visit(path)
        assert(await page.getByText('提案展示・假資料').isVisible())
        assert.equal(await page.locator('.cms-sidebar').isVisible(), width >= 992)
        assert.equal(await page.locator('.site-header-spacer').count(), 0, 'No public site layout in CMS')
        assert.equal(await page.locator('.cms-image-error').count(), 0, `Broken image: ${path}`)
        assert.equal(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth), true, `Horizontal overflow ${width}: ${path}`)
        assert.equal(await page.evaluate(() => document.documentElement.classList.contains('lenis')), false, `Native CMS scroll ${path}`)
        assert.equal(await page.locator('.cms-error').count(), 0)
        assert.equal(await page.locator('.cms-sidebar-note, .cms-content-banner, .cms-library-intro').count(), 0)
        assert.deepEqual(await page.locator('.cms').evaluate(el => {
          const css = getComputedStyle(el)
          return ['--gold', '--ink', '--ink-80'].map(name => css.getPropertyValue(name).trim())
        }), ['#caa05c', '#1c1c1d', '#59585d'])
        const typeIssues = await page.locator('.cms').evaluate(root => [...root.querySelectorAll('h1,h2,h3,button,input,textarea,select')].filter(el => { const font = getComputedStyle(el).fontFamily; return !font.includes('Noto Sans TC') || /Serif|Bodoni/.test(font) }).map(el => el.tagName + ':' + el.textContent?.slice(0,30)))
        assert.deepEqual(typeIssues, [], 'CMS interface must use consistent sans-serif typography')
        assert.equal(await page.locator('.cms-heading h1').evaluate(el => getComputedStyle(el).fontWeight), '700')
        await page.screenshot({ path: join(screenshots, `${path.replaceAll('/', '-')}-${width}.png`), fullPage: true })
      }
      if (width < 992) {
        await page.getByRole('button', { name: '開啟後台選單' }).click()
        await page.getByRole('dialog').getByRole('link', { name: '工作台總覽' }).click()
        await page.waitForURL('**/admin')
        await closed()
      }
    }
    for (const width of [1440, 390]) {
      console.log(`Checking interactions at ${width}px`)
      await page.setViewportSize({ width, height: 1000 })
      await visit('/admin/home')
      await page.getByLabel('主標題', { exact: true }).fill('為日常，\n留一點美好。')
      assert.equal(await page.getByTestId('hero-preview-title').textContent(), '為日常，\n留一點美好。')
      await page.getByRole('button', { name: '更換圖片', exact: true }).click()
      await page.getByRole('button', { name: '選擇 Clever・巧域生活' }).click()
      assert.equal(await page.locator('.cms-mini-hero img').getAttribute('src'), '/home-2026/hero/clever-kitchen.jpg')
      assert.equal(await page.evaluate(() => document.activeElement?.textContent?.trim()), '更換圖片', 'Picker restores keyboard focus')
      await page.getByRole('button', { name: '預覽', exact: true }).click()
      assert(await page.getByRole('dialog').getByRole('heading', { name: '為日常， 留一點美好。' }).isVisible())
      await page.screenshot({ path: join(screenshots, `home-preview-${width}.png`) })
      await page.keyboard.press('Escape')
      await closed()
      assert.equal(await page.evaluate(() => document.activeElement?.textContent?.trim()), '預覽')
      await page.getByRole('button', { name: '手機預覽', exact: true }).click()
      assert(await page.locator('.cms-mini-mobile').isVisible())
      const sections = [
        ['廚房系列', '找到你的理想廚房'],
        ['精選設計案例', '生活的樣子，設計的答案'],
        ['品牌理念', '以廚房，連結家的美好'],
        ['門市據點', '走進門市，遇見理想生活'],
      ]
      for (const [name, title] of sections) {
        await page.locator('.cms-section-list button').filter({ hasText: name }).click()
        assert(await page.locator('.cms-preview-column').getByRole('heading', { name: title, exact: true }).isVisible(), `${name} must change the central preview`)
        assert.equal(await page.locator('.cms-properties').count(), 0, 'Read-only section uses the full preview width')
        assert.equal(await page.locator('.cms-preview-column .cms-mini-hero').count(), 0, 'Do not leave the Hero visible for other sections')
        await page.getByRole('button', { name: '預覽', exact: true }).click()
        assert(await page.getByRole('dialog').getByRole('heading', { name: title, exact: true }).isVisible(), `${name} must also update the expanded preview`)
        await page.keyboard.press('Escape')
      }
      await page.locator('.cms-section-list button').filter({ hasText: '首頁主視覺' }).click()
      assert.equal(await page.getByTestId('hero-preview-title').textContent(), '為日常，\n留一點美好。', 'Section switches preserve unsaved Hero edits')
      await page.getByRole('button', { name: '儲存草稿', exact: true }).click()
      assert(await page.getByRole('status').getByText('未儲存、未發布', { exact: false }).isVisible())
      await page.getByRole('button', { name: '發布網站', exact: true }).click()
      assert(await page.getByRole('status').getByText('「發布網站」', { exact: false }).isVisible())
      await page.reload()
      await page.getByLabel('主標題', { exact: true }).waitFor()
      assert.equal(await page.getByLabel('主標題', { exact: true }).inputValue(), '讓理想生活，\n在此展開。')

      await visit('/admin/content')
      await page.getByRole('button', { name: '設計案例 3', exact: true }).click()
      assert.equal(await page.locator('tbody tr').count(), 3)
      await page.getByLabel('內容狀態', { exact: true }).selectOption('草稿')
      assert.equal(await page.locator('tbody tr').count(), 1)
      await page.getByLabel('搜尋內容', { exact: true }).fill('不存在的內容')
      assert(await page.getByRole('status').getByText('沒有符合的內容', { exact: false }).isVisible())
      await page.getByLabel('搜尋內容', { exact: true }).fill('中島')
      await page.getByRole('button', { name: '編輯 一座中島，串起家的每個片刻', exact: true }).click()
      await page.getByLabel('內容標題', { exact: true }).fill('示範編輯案例')
      await page.getByRole('button', { name: '更換封面', exact: true }).click()
      await page.getByRole('button', { name: '選擇 Basic+・日常之間', exact: true }).click()
      assert.equal(await page.locator('.cms-content-cover img').getAttribute('src'), '/home-2026/hero/basic-plus.jpg')
      await page.getByRole('button', { name: '預覽內容', exact: true }).click()
      assert(await page.getByRole('heading', { name: '示範編輯案例', exact: true }).isVisible())
      await page.keyboard.press('Escape')
      assert.equal(await page.locator('dialog[open]').count(), 1)
      await page.getByRole('button', { name: '發布內容', exact: true }).click()
      assert(await page.getByRole('status').getByText('沒有寫入資料', { exact: false }).isVisible())
      await page.screenshot({ path: join(screenshots, `content-editor-${width}.png`) })
      await page.keyboard.press('Escape')
      await closed()
      assert.equal(await page.getByText('示範編輯案例', { exact: true }).count(), 0)
      await page.getByRole('button', { name: '新增內容', exact: true }).click()
      assert.equal(await page.getByLabel('內容標題', { exact: true }).inputValue(), '')
      await page.keyboard.press('Escape')

      await visit('/admin/media')
      await page.getByRole('button', { name: '品牌消息', exact: true }).click()
      assert.equal(await page.locator('.cms-media-card').count(), 2)
      await page.getByLabel('搜尋素材', { exact: true }).fill('找不到')
      assert(await page.getByRole('status').getByText('沒有符合的素材', { exact: false }).isVisible())
      await page.getByLabel('搜尋素材', { exact: true }).fill('台中')
      await page.getByRole('button', { name: '檢視 台中・品牌生活館', exact: true }).click()
      assert(await page.getByRole('dialog').getByText('/section-5/brand-pavilion/pavilion-taichung.jpg', { exact: true }).isVisible())
      await page.keyboard.press('Tab')
      assert(await page.evaluate(() => Boolean(document.activeElement?.closest('dialog[open]'))), 'Modal traps focus')
      await page.keyboard.press('Escape')
      await closed()
      await page.getByRole('button', { name: '上傳素材', exact: true }).click()
      assert(await page.getByRole('status').getByText('不會開啟檔案', { exact: false }).isVisible())
    }
    await page.setViewportSize({ width: 1440, height: 1000 })
    for (const path of ['/admin/content?status=draft', '/admin/content?status=published']) {
      await visit(path)
      assert.equal(await page.locator('tbody tr').count(), path.endsWith('draft') ? 2 : 4)
    }
    await visit('/admin/content?edit=01')
    await page.getByRole('dialog').waitFor()
    assert.equal(await page.getByLabel('內容標題', { exact: true }).inputValue(), '讓生活，從一座美好的廚房開始')
    await page.goBack()
    await closed()
    await visit('/admin/content?new=1')
    await page.getByRole('dialog').waitFor()
    assert.equal(await page.getByLabel('內容標題', { exact: true }).inputValue(), '')
    await page.keyboard.press('Escape')
    assert.deepEqual(writes, [], 'Demo interaction must never write to an API')
    assert.deepEqual(errors, [], 'No frontend or hydration errors')

    // Exercise client navigation so route-dependent Lenis initialization is tested.
    await page.goto(base + '/')
    await page.locator('.hero-template-section').waitFor()
    await page.waitForFunction(() => document.documentElement.classList.contains('lenis'))
    const publicBefore = await page.locator('.hero-template-section').evaluate(el => ({ height: el.getBoundingClientRect().height, font: getComputedStyle(el.querySelector('h1')).fontFamily }))
    const navigate = async path => {
      await page.evaluate(path => document.querySelector('#__nuxt').__vue_app__.config.globalProperties.$router.push(path), path)
    }
    await navigate('/admin')
    await page.locator('.cms-page').waitFor()
    await page.waitForFunction(() => !document.documentElement.classList.contains('lenis'))
    await navigate('/')
    await page.locator('.hero-template-section').waitFor()
    await page.waitForFunction(() => document.documentElement.classList.contains('lenis'))
    const publicAfter = await page.locator('.hero-template-section').evaluate(el => ({ height: el.getBoundingClientRect().height, font: getComputedStyle(el.querySelector('h1')).fontFamily }))
    assert.deepEqual(publicAfter, publicBefore, 'Public homepage styling survives admin visit')
    for (const width of [1440, 390]) {
      await page.setViewportSize({ width, height: 1000 })
      await page.goto(base + '/')
      await page.locator('.hero-template-section').waitFor()
      await page.evaluate(async () => {
        await document.fonts.ready
        await Promise.all(document.getAnimations().filter(animation => animation.effect?.getComputedTiming().iterations !== Infinity).map(animation => animation.finished.catch(() => {})))
      })
      assert.equal(await page.locator('.cms').count(), 0)
      assert(await page.locator('.site-header-spacer').isVisible())
      assert.equal(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth), true)
      await page.screenshot({ path: join(screenshots, `public-home-${width}.png`) })
    }
    await page.emulateMedia({ reducedMotion: 'reduce' })
    await visit('/admin')
    assert.equal(await page.locator('.cms-page').evaluate(el => getComputedStyle(el).animationName), 'none')
    assert.equal(await page.evaluate(() => document.documentElement.classList.contains('lenis')), false)
    assert.deepEqual(errors, [], 'No frontend or hydration errors after public regression')
    // Intentional failed-image fixture: verify source and description are visible.
    await page.route('**/home-2026/hero/ai-kitchen.jpg', route => route.abort())
    await visit('/admin/home')
    await page.locator('.cms-image-error').first().waitFor({ state: 'visible' })
    assert((await page.locator('.cms-image-error').first().textContent()).includes('/home-2026/hero/ai-kitchen.jpg'))
    console.log(`PASS: 4 CMS routes × 4 sizes; desktop/mobile edit, picker, preview, search, filter, reset, deep links, focus, no writes; password, Lenis/public regression, reduced motion and visible image errors. Screenshots: ${screenshots}`)
  } finally { await browser.close() }
})().catch(error => { console.error(error); process.exitCode = 1 })
