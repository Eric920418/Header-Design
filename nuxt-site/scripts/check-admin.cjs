// Local acceptance: preview input only; never save or publish website content.
const assert=require('node:assert/strict'),{chromium}=require('playwright'),{mkdtempSync}=require('node:fs'),{tmpdir}=require('node:os'),{join}=require('node:path')
;(async()=>{
 const base=process.env.PREVIEW_URL||'http://localhost:3114';assert(['localhost','127.0.0.1'].includes(new URL(base).hostname))
 for(const key of ['PREVIEW_PASSWORD','CMS_TEST_EMAIL','CMS_TEST_PASSWORD'])assert(process.env[key],`Missing ${key}`)
 const browser=await chromium.launch(),page=await browser.newPage(),errors=[],shots=mkdtempSync(join(tmpdir(),'sakura-page-editor-'))
 page.on('pageerror',e=>errors.push(e.message));page.on('console',m=>{if(/hydration|duplicate keys/i.test(m.text()))errors.push(m.text())})
 const go=async path=>{await page.goto(base+path);await page.waitForLoadState('networkidle')}
 const field=(id,path)=>page.locator(`[data-cms-document="${id}"][data-cms-path="${path}"]`).locator('textarea,input:not([type=hidden])').first()
 const select=async(name,width)=>{if(width<1280){await page.getByRole('button',{name:/選擇區塊/}).click();await page.getByRole('dialog').getByRole('button').filter({has:page.getByText(name,{exact:true})}).click()}else await page.getByRole('navigation',{name:'官網區塊',exact:true}).getByRole('button').filter({has:page.getByText(name,{exact:true})}).click()}
 try{
  await go('/admin');if(page.url().includes('preview-access')){await page.getByLabel('預覽密碼',{exact:true}).fill(process.env.PREVIEW_PASSWORD);await page.getByRole('button',{name:'進入網站',exact:true}).click()}
  await go('/admin/login');await page.getByLabel('電子郵件',{exact:true}).fill(process.env.CMS_TEST_EMAIL);await page.getByLabel('密碼',{exact:true}).fill(process.env.CMS_TEST_PASSWORD);await page.getByRole('button',{name:'登入',exact:true}).click();await page.waitForURL(base+'/admin')
  const api=async(path,body)=>page.evaluate(async({path,body})=>{const session=await(await fetch('/api/admin/session')).json(),r=await fetch('/api/admin/'+path,body?{method:'POST',headers:{'Content-Type':'application/json','X-CSRF-Token':session.csrf},body:JSON.stringify(body)}:{});return{status:r.status,body:await r.json()}},{path,body})
  const before=(await api('documents')).body
  const pages=(await api('page-editors')).body;assert.equal(pages.length,28)
  for(const width of [1440,1024,768,390]){
   await page.setViewportSize({width,height:960})
   for(const p of pages){
    await go(p.id==='home'?'/admin/home':`/admin/content?section=${p.section}&sitePage=${p.id}`);await page.locator('.cms-block-title').waitFor()
    for(const name of await page.locator('.cms-block-nav>button strong').allTextContents()){
     await select(name,width)
     if(width<1024)await page.getByRole('button',{name:'看位置',exact:true}).click()
     assert(await page.locator('.cms-position:visible .cms-scene-target img,.cms-position:visible .cms-inspiration-position img,.cms-position:visible .cms-home-hero-preview img').count(),`${p.id}/${name} needs a corresponding picture`)
     if(p.id==='home'&&name==='首頁輪播圖片')assert(await page.locator('.cms-position:visible .cms-home-hero-frame').evaluate(el=>el.getBoundingClientRect().height>100),'The home photo frame must not collapse')
     assert.equal(await page.locator('.cms-page-editor .cms-image-error:visible').count(),0,`${p.id}/${name}: image failed`)
     assert.equal(await page.locator('.cms-effect-viewport iframe').count(),0,'Section selection must not load a full preview')
     assert(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth),`${p.id}/${name} overflow at ${width}`)
     if(width<1024)await page.getByRole('dialog',{name:'官網位置示意',exact:true}).getByRole('button',{name:'關閉視窗',exact:true}).click()
    }
   }
   await go('/admin/content?section=design')
   await page.locator('.cms-section-card').first().waitFor();assert.deepEqual(await page.locator('.cms-section-card strong').allTextContents(),['品牌系列','設計靈感','廚房裝修指南','品牌系列型錄'])
   await page.getByRole('searchbox',{name:'找要修改的內容'}).fill('設計靈感 按鈕');await page.locator('.cms-section-card').first().click();await page.locator('.cms-block-title').waitFor();assert.match(await page.locator('h1').innerText(),/設計靈感/)
   await page.getByRole('link',{name:'← 返回',exact:true}).click();assert(new URL(page.url()).searchParams.get('q').includes('按鈕'))
   await go('/admin/home');await page.locator('.cms-block-title').waitFor();assert.equal(await page.locator('.cms-effect-viewport iframe').count(),0,'No background preview on entry');assert.equal(await page.locator('dialog.cms-live-preview').isVisible(),false,'Closed preview must not reserve blank space');assert.equal(await page.locator('.cms-item-row .cms-thumbnail').count(),await page.locator('.cms-item-row').count(),'Every content row has a picture')
   await page.locator('.cms-item-edit').first().click();const hero='view-components-home-HomeHero';await field(hero,'slides.0.title').fill('未儲存輪播驗收');await page.getByRole('button',{name:'返回清單',exact:true}).click()
   if(width<1024)await page.getByRole('button',{name:'看位置',exact:true}).click()
   assert.equal(await page.locator('.cms-position:visible .cms-home-hero-copy h3').innerText(),'未儲存輪播驗收');if(width<1024)await page.getByRole('dialog',{name:'官網位置示意',exact:true}).getByRole('button',{name:'關閉視窗',exact:true}).click()
   await select('品牌系列',width);const project='view-components-home-HomeProject';await page.locator('.cms-common-settings summary').click();await field(project,'copy.text1').fill('未儲存品牌驗收')
   assert.match(await page.locator('.cms-save-status').innerText(),/2 處修改/)
   await select('首頁輪播圖片',width);await page.locator('.cms-item-edit').first().click();assert.equal(await field(hero,'slides.0.title').inputValue(),'未儲存輪播驗收')
   await select('品牌系列',width);if(!await page.locator('.cms-common-settings').evaluate(el=>el.open))await page.locator('.cms-common-settings summary').click();assert.equal(await field(project,'copy.text1').inputValue(),'未儲存品牌驗收')
   await page.getByRole('button',{name:'預覽效果',exact:true}).click();await page.locator('.cms-effect-viewport iframe').waitFor();await page.getByText('目前輸入的效果・尚未更新官網',{exact:true}).waitFor({timeout:30000})
   await page.getByRole('button',{name:'返回修改',exact:true}).click();assert.equal(await page.locator('.cms-effect-viewport iframe').count(),0);assert.equal(await page.locator('dialog.cms-live-preview').isVisible(),false);assert.equal(await field(project,'copy.text1').inputValue(),'未儲存品牌驗收')
   assert(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth),`Overflow ${width}`)
   await page.screenshot({path:join(shots,`${width}-editor.png`),fullPage:true})
   page.once('dialog',d=>d.accept());await go('/admin/content?section=design&edit=view-pages-design-inspiration-id-&q=案例&page=2');assert.match(page.url(),/sitePage=inspiration/);await page.locator('.cms-block-title').waitFor()
   await go('/admin/content?section=franchise&sitePage=franchise');await page.locator('.cms-block-title').waitFor();assert(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth))
  }
  await page.setViewportSize({width:1440,height:960});await go('/admin/content?section=design&sitePage=inspiration&block='+encodeURIComponent('inspiration:案例管理與顯示排序'))
  for(const name of ['操作驗收 A','操作驗收 B','操作驗收 C']){
   await page.getByRole('button',{name:'新增案例',exact:true}).click();await page.getByRole('textbox',{name:'案例標題',exact:true}).fill(name)
   await page.locator('[data-cms-document="custom-cases"][data-cms-path$=".cover"]').getByRole('button').click();await page.getByRole('textbox',{name:'搜尋圖片或檔案',exact:true}).fill('aikitchen');await page.getByRole('button',{name:'選擇 aikitchen.webp',exact:true}).click();await page.getByRole('button',{name:'返回清單',exact:true}).click()
  }
  await page.locator('.cms-case-order').first().dragTo(page.locator('.cms-case-table tbody tr').nth(2));assert.deepEqual(await page.locator('.cms-case-table .cms-item-open').allTextContents(),['操作驗收 B','操作驗收 C','操作驗收 A'])
  await page.locator('.cms-case-order').first().press('ArrowDown');assert.deepEqual(await page.locator('.cms-case-table .cms-item-open').allTextContents(),['操作驗收 C','操作驗收 B','操作驗收 A'])
  await page.locator('.cms-case-status').last().click();await page.getByText('下架後不顯示',{exact:true}).waitFor();await page.getByRole('searchbox',{name:'搜尋案例標題',exact:true}).fill('操作驗收 B');assert.equal(await page.locator('.cms-case-table tbody tr').count(),1);assert.equal(await page.locator('.cms-case-order').isEnabled(),false);await page.getByRole('searchbox',{name:'搜尋案例標題',exact:true}).fill('')
  await select('案例卡片按鈕',1440);await page.getByRole('textbox',{name:'案例圖片上的按鈕文字',exact:true}).fill('查看驗收案例');assert((await page.locator('.cms-inspiration-view').allTextContents()).every(t=>t==='查看驗收案例'));await select('案例管理與顯示排序',1440);assert.deepEqual(await page.locator('.cms-case-table .cms-item-open').allTextContents(),['操作驗收 C','操作驗收 B','操作驗收 A'])
  for(const width of [1440,1024,768,390]){await page.setViewportSize({width,height:960});assert(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth));assert.equal(await page.locator('.cms-effect-viewport iframe').count(),0);await page.screenshot({path:join(shots,`${width}-case-table.png`),fullPage:true})}
  await page.locator('.cms-case-table .cms-item-edit').first().click();await page.getByRole('textbox',{name:'案例標題',exact:true}).waitFor();await page.getByRole('button',{name:'往後移',exact:true}).click();await page.getByRole('button',{name:'返回清單',exact:true}).click();assert(await page.locator('.cms-case-table .cms-item-open[aria-pressed="true"]').evaluate(el=>el===document.activeElement))
  assert.deepEqual((await api('documents')).body,before,'UI preview checks must not modify website documents');page.once('dialog',d=>d.accept())
  await go('/');assert(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth));assert.deepEqual(errors,[])
  console.log('PASS: all-page positions, case table drag/keyboard sorting, display changes, filtering, card text, retained input/focus, four widths, on-demand previews and unchanged website documents. Screenshots: '+shots)
 }finally{await browser.close()}
})().catch(e=>{console.error(e);process.exitCode=1})
