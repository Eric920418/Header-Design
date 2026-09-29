// Existing Playwright installation required (NODE_PATH). No packages are installed by this script.
// Set PREVIEW_URL, PREVIEW_PASSWORD, CMS_TEST_EMAIL, CMS_TEST_PASSWORD to local test credentials.
const assert=require('node:assert/strict')
const {chromium}=require('playwright')
const {mkdtempSync}=require('node:fs')
const {join}=require('node:path')
const {tmpdir}=require('node:os')
;(async()=>{
 const base=process.env.PREVIEW_URL||'http://localhost:3100'
 for(const key of ['PREVIEW_PASSWORD','CMS_TEST_EMAIL','CMS_TEST_PASSWORD'])assert(process.env[key],`Set ${key}`)
 assert(['localhost','127.0.0.1'].includes(new URL(base).hostname),'Only run against the local acceptance environment')
 const browser=await chromium.launch({headless:true}),context=await browser.newContext(),page=await context.newPage(),errors=[],screenshots=mkdtempSync(join(tmpdir(),'sakura-cms-'))
 page.on('pageerror',e=>errors.push(e.message));page.on('console',m=>{if(/hydration/i.test(m.text()))errors.push(m.text())})
 try{
  await page.goto(base+'/admin');await page.getByLabel('預覽密碼',{exact:true}).fill(process.env.PREVIEW_PASSWORD);await page.getByRole('button',{name:'進入網站'}).click()
  await page.getByLabel('電子郵件',{exact:true}).fill(process.env.CMS_TEST_EMAIL);await page.getByLabel('密碼',{exact:true}).fill(process.env.CMS_TEST_PASSWORD);await page.getByRole('button',{name:'登入',exact:true}).click();await page.waitForURL(base+'/admin')
  for(const width of [1440,1024,768,390]){
   await page.setViewportSize({width,height:960})
   for(const route of ['/admin','/admin/home','/admin/content','/admin/media','/']){
    await page.goto(base+route);await page.locator(route==='/'?'#top':'.cms-page').waitFor();await page.evaluate(()=>document.fonts.ready)
    assert(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth),`Overflow: ${route} at ${width}`)
    assert.equal(await page.locator('.cms-error').count(),0)
    if(route!=='/')assert.equal(await page.locator('.site-header-spacer').count(),0)
    await page.screenshot({path:join(screenshots,`${width}-${route.replaceAll('/','_')||'home'}.png`)})
   }
  }
  await page.setViewportSize({width:1440,height:960});await page.goto(base+'/admin/content');await page.getByLabel('搜尋內容').fill('消息');assert((await page.locator('.cms-resource-row').count())>1)
  await page.getByLabel('內容分類').selectOption('文章管理');assert.equal(await page.locator('.cms-resource-row').count(),1)
  await page.goto(base+'/admin/home');await page.getByText('AI Kitchen',{exact:true}).click();const title=page.locator('.cms-array-row[open]').getByLabel('標題',{exact:true}),original=await title.inputValue();await title.fill(original+'驗收');assert(await page.getByRole('button',{name:'儲存草稿',exact:true}).isEnabled());await title.fill(original)
  await page.getByRole('button',{name:'儲存並預覽'}).click();await page.frameLocator('iframe[title="官網草稿預覽"]').getByRole('heading',{name:original,exact:true}).waitFor();await page.keyboard.press('Escape');assert.equal(await page.locator('dialog[open]').count(),0);assert.equal(await page.evaluate(()=>document.activeElement.textContent.trim()),'儲存並預覽')
  await page.getByRole('button',{name:'從媒體庫選擇'}).first().click();await page.getByLabel('搜尋素材').fill('aikitchen');await page.getByRole('button',{name:'選擇 aikitchen.webp'}).waitFor();await page.keyboard.press('Escape')
  await page.emulateMedia({reducedMotion:'reduce'});assert.equal(await page.locator('.cms-button').first().evaluate(el=>getComputedStyle(el).transitionDuration),'0s')
  assert.deepEqual(errors,[]);console.log('PASS: navigation, search/filter, editing, preview, media picker, focus return, reduced motion and 4 widths. Screenshots:',screenshots)
 }finally{await browser.close()}
})().catch(e=>{console.error(e);process.exitCode=1})
