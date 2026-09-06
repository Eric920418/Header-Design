// Run with Playwright available in NODE_PATH and PREVIEW_PASSWORD set.
const assert = require('node:assert/strict')
const { chromium } = require('playwright')
const { mkdtempSync } = require('node:fs')
const { tmpdir } = require('node:os')
const { join } = require('node:path')

;(async () => {
  assert(process.env.PREVIEW_PASSWORD, 'Set PREVIEW_PASSWORD for the local preview site')
  const browser = await chromium.launch({ headless: true })
  try {
    const context = await browser.newContext()
    const base = process.env.PREVIEW_URL || 'http://127.0.0.1:3018'
    const login = await context.request.post(`${base}/api/preview-access`, {
      data: { password: process.env.PREVIEW_PASSWORD },
    })
    assert.equal(login.status(), 200, 'Preview login failed')
    const page = await context.newPage()
    const screenshots = mkdtempSync(join(tmpdir(), 'sakura-hero-'))
    const routes = ['/service-process', '/about/introduce', '/catalogues/catalog', '/products/sakura', '/gallery', '/builders/catalogues', '/news', '/franchising/download', '/gallery/case10', '/knowledge/design/systemcabinet', '/products/sakura/range-hood/near-suction/r7600']
    for (const width of [320, 390, 768, 1024, 1440, 1920, 2560]) {
      await page.setViewportSize({ width, height: 900 })
      for (const route of routes) {
        await page.goto(base + route)
        await page.locator('[data-hero-photo]').waitFor()
        await page.evaluate(() => document.fonts.ready)
        await page.locator('[data-hero-photo]').evaluate(el => {
          for (const child of el.querySelectorAll('*')) {
            child.style.animation = 'none'
            child.style.transform = 'none'
            child.style.opacity = '1'
          }
        })
        const result = await page.locator('[data-hero-photo]').evaluate(el => {
          const style = getComputedStyle(el)
          const rect = el.getBoundingClientRect()
          const imageWidth = Math.max(innerWidth, 740)
          const pavilion = el.dataset.heroPhoto === 'taichung'
          const x = pavilion ? 0 : (rect.width - imageWidth) * .88
          const y = parseFloat(style.backgroundPositionY)
          const bounds = pavilion ? [80 / 1800, 735 / 1800, 770 / 1800, 865 / 1800] : [1002 / 1919, 245 / 1919, 1746 / 1919, 395 / 1919]
          const logo = { left: x + bounds[0] * imageWidth, top: y + bounds[1] * imageWidth, right: x + bounds[2] * imageWidth, bottom: y + bounds[3] * imageWidth }
          const copy = el.querySelector('h1, [class$="__title"], nav')
          const range = document.createRange()
          range.selectNodeContents(copy)
          // Compare visible glyphs, excluding the font's empty ascender space.
          const canvas = document.createElement('canvas').getContext('2d')
          const copyStyle = getComputedStyle(copy)
          canvas.font = `${copyStyle.fontWeight} ${copyStyle.fontSize} ${copyStyle.fontFamily}`
          const metrics = canvas.measureText(copy.textContent)
          const glyphInset = metrics.fontBoundingBoxAscent - metrics.actualBoundingBoxAscent
          return { logo, width: rect.width, height: rect.height, header: parseFloat(getComputedStyle(document.documentElement).getPropertyValue('--site-header-height')), copyTop: range.getBoundingClientRect().top + glyphInset - rect.top, attachment: style.backgroundAttachment, position: style.backgroundPosition }
        })
        const label = `${route} at ${width}px: ${JSON.stringify(result)}`
        assert.equal(result.attachment, 'scroll', label)
        assert(result.logo.left >= 0 && result.logo.right <= result.width, label)
        assert(result.logo.top >= result.header && result.logo.bottom < result.height, label)
        assert(result.copyTop > result.logo.bottom, label)
        await page.setViewportSize({ width, height: 600 })
        assert.equal(await page.locator('[data-hero-photo]').evaluate(el => getComputedStyle(el).backgroundPosition), result.position, `Viewport height moves background: ${label}`)
        await page.setViewportSize({ width, height: 900 })
        if ([390, 1440].includes(width) && ['/service-process', '/catalogues/catalog', '/about/introduce'].includes(route)) {
          await page.screenshot({ path: join(screenshots, `${route.replaceAll('/', '-')}-${width}.png`) })
        }
      }
    }
    console.log(`PASS: ${routes.length * 7} layouts; logos inside Hero, below navigation and above copy; viewport height does not change crop. Screenshots: ${screenshots}`)
  } finally {
    await browser.close()
  }
})().catch(error => { console.error(error); process.exitCode = 1 })
