// Local acceptance only: inputs are previewed, never saved or published.
const assert=require('node:assert/strict'),{chromium}=require('playwright'),{mkdtempSync}=require('node:fs'),{tmpdir}=require('node:os'),{join}=require('node:path')
;(async()=>{
 const base=process.env.PREVIEW_URL||'http://localhost:3100';assert(['localhost','127.0.0.1'].includes(new URL(base).hostname))
 for(const key of ['PREVIEW_PASSWORD','CMS_TEST_EMAIL','CMS_TEST_PASSWORD'])assert(process.env[key],`Missing ${key}`)
 const browser=await chromium.launch(),context=await browser.newContext(),page=await context.newPage(),errors=[],shots=mkdtempSync(join(tmpdir(),'sakura-workflow-'))
 page.on('pageerror',e=>errors.push(e.message));page.on('console',m=>{if(/hydration|duplicate keys/i.test(m.text()))errors.push(m.text())});page.on('dialog',d=>d.accept())
 const go=async path=>{await page.goto(base+path);await page.waitForFunction(()=>document.querySelector('#__nuxt')?.__vue_app__?.config.globalProperties.$nuxt?.isHydrating===false)}
 const api=async(path,body)=>page.evaluate(async({path,body})=>{const s=await(await fetch('/api/admin/session')).json(),r=await fetch('/api/admin/'+path,body?{method:'POST',headers:{'Content-Type':'application/json','X-CSRF-Token':s.csrf},body:JSON.stringify(body)}:{});return{status:r.status,body:await r.json()}},{path,body})
 try{
 await go('/admin');if(page.url().includes('preview-access')){await page.getByLabel('預覽密碼',{exact:true}).fill(process.env.PREVIEW_PASSWORD);await page.getByRole('button',{name:'進入網站',exact:true}).click();await page.waitForURL(base+'/admin/login')}
 await go('/admin/login')
 await page.getByLabel('電子郵件',{exact:true}).fill(process.env.CMS_TEST_EMAIL);await page.getByLabel('密碼',{exact:true}).fill(process.env.CMS_TEST_PASSWORD);await page.getByRole('button',{name:'登入',exact:true}).click();await page.waitForURL(base+'/admin');await page.getByRole('heading',{name:'今天要修改什麼？'}).waitFor()
 const before=await api('documents'),id='view-components-home-HomeProject'
 // Preview APIs must include unsaved collections and remain private.
 const productDoc=(await api('documents/catalog-sakura')).body,liveProducts=await(await context.request.get(base+'/api/products/sakura/items?page=1')).json()
 const first=liveProducts.items[0];assert(first);productDoc.body.items.find(i=>String(i.id)===String(first.id)).enabled=false
 const productPreview=await api('workspaces/catalog-sakura',{action:'preview',documents:[{id:productDoc.id,revision:productDoc.revision,body:productDoc.body}]});assert.equal(productPreview.status,200)
 const previewProducts=await context.request.get(base+'/api/products/sakura/items?page=1&cmsPreview=catalog-sakura&cmsDraft='+productPreview.body.previewToken);assert.equal(previewProducts.status(),200);const productList=await previewProducts.json();assert.equal(productList.total,liveProducts.total-1);assert(productList.items.every(i=>String(i.id)!==String(first.id)))
 const cases=(await api('documents/custom-cases')).body,entry=JSON.parse(JSON.stringify(cases.schema.fields.items.template));Object.assign(entry,{id:require('node:crypto').randomUUID(),title:'未儲存的案例預覽',description:'只用於預覽',form:'一字型',style:'現代風'});cases.body.items.unshift(entry)
 const casePreview=await api('workspaces/custom-cases',{action:'preview',documents:[{id:cases.id,revision:cases.revision,body:cases.body}]});assert.equal(casePreview.status,200)
 const caseResponse=await context.request.get(base+'/api/design-inspiration/cases/'+entry.id+'?cmsPreview=custom-cases&cmsDraft='+casePreview.body.previewToken);assert.equal(caseResponse.status(),200);assert.equal((await caseResponse.json()).title,entry.title);assert.match(caseResponse.headers()['cache-control'],/no-store/)
 const invalidToken=await context.request.get(base+'/api/content/custom-cases?preview=custom-cases&cmsDraft=invalid');assert.equal(invalidToken.status(),404)
 const csrf=await context.request.post(base+'/api/admin/workspaces/custom-cases',{headers:{Origin:base},data:{action:'preview',documents:[]}});assert.equal(csrf.status(),403)
 const news=(await api('documents/news-articles')).body;news.body.items[0].summary.title='未儲存的文章預覽';const newsPreview=await api('workspaces/news-articles',{action:'preview',documents:[{id:news.id,revision:news.revision,body:news.body}]});assert.equal(newsPreview.status,200)
 const alias=await(await context.request.get(base+'/api/content/data-news?preview=news-articles&cmsDraft='+newsPreview.body.previewToken)).json();assert(alias.newsArticles.some(n=>n.title==='未儲存的文章預覽'))
 const text=(await api('documents/'+id)).body,series=(await api('documents/data-kitchenStyles')).body;text.body.copy.text1=42;const validation=await api('workspaces/'+id,{action:'preview',documents:[text,series].map(d=>({id:d.id,revision:d.revision,body:d.body}))});assert.equal(validation.status,400);assert.equal(validation.body.data.fieldErrors[0].path,'copy.text1');assert(!validation.body.message.includes('copy.text1'))
 console.log('PASS: unsaved product filtering, new case detail, article aliases, private/no-store preview, CSRF and readable field errors')

 for(const width of [1440,1024,768,390]){
  await page.setViewportSize({width,height:960})
  for(const path of ['/admin','/admin/home',...['pages','news','cases','products','stores','settings'].map(a=>'/admin/content?area='+a),'/admin/media','/admin/inbox','/admin/users','/admin/audit','/']){
   await go(path);await page.locator(path==='/'?'#top':'.cms-page').waitFor();assert(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth),`Overflow ${width}: ${path}`);assert.equal(await page.locator('.cms-main>.cms-error,.cms-page>.cms-error').count(),0,`${width}: ${path}`)
   if(path==='/admin/home'){assert.equal(await page.locator('.cms-section-card').count(),8);await page.screenshot({path:join(shots,`${width}-home.png`),fullPage:true})}
  }
  await go('/admin/home?edit='+id);await page.getByLabel('區塊標題（前半段）',{exact:true}).waitFor();assert(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth));assert(await page.getByRole('link',{name:'查看官網位置',exact:true}).isVisible())
  if(width<1200){await page.getByRole('button',{name:'看效果',exact:true}).first().click();assert(await page.locator('.cms-effect-panel').isVisible());await page.getByRole('button',{name:'修改內容',exact:true}).click()}
  await page.screenshot({path:join(shots,`${width}-editor.png`),fullPage:true})
 }
 await page.setViewportSize({width:1440,height:960});await go('/admin/home?edit='+id);const field=page.getByLabel('區塊標題（前半段）',{exact:true});await field.waitFor();await field.fill('未儲存的即時測試')
 await page.frameLocator('iframe[title="目前輸入的官網效果"]').getByText('未儲存的即時測試',{exact:false}).first().waitFor({timeout:45000});assert.deepEqual((await api('documents')).body,before.body);await page.screenshot({path:join(shots,'live-unsaved-preview.png'),fullPage:true})
 await page.route('**/api/admin/workspaces/'+id,async r=>r.request().postDataJSON().action==='save'?r.fulfill({status:409,contentType:'application/json',body:JSON.stringify({message:'有人已修改這個區塊。你的輸入已保留。',data:{traceId:'ui-conflict-check'}})}):r.continue())
 await page.getByRole('button',{name:'儲存',exact:true}).click();await page.getByRole('alert').filter({hasText:'ui-conflict-check'}).waitFor();assert.equal(await field.inputValue(),'未儲存的即時測試');await page.unroute('**/api/admin/workspaces/'+id)
 await page.getByRole('button',{name:'系列卡片',exact:true}).click();const rows=page.locator('.cms-array-row');await rows.first().locator('summary').focus();await page.keyboard.press('Enter');await rows.nth(1).locator('summary').focus();await page.keyboard.press('Enter');assert.equal(await page.locator('.cms-array-row[open]').count(),1)
 console.log('PASS: live preview, conflict retention and single-item editing');
 const choose=rows.nth(1).getByRole('button',{name:'更換圖片',exact:true}).first();await choose.click();const dialog=page.getByRole('dialog',{name:'選擇圖片',exact:true});await dialog.waitFor();await dialog.getByRole('button',{name:'上傳新檔案'}).waitFor();await dialog.getByRole('button',{name:/^選擇 /}).first().click();await dialog.waitFor({state:'hidden'});assert(await choose.evaluate(el=>el===document.activeElement))
 console.log('PASS: image selection and focus return');await page.getByRole('button',{name:'更新官網',exact:true}).click();await page.getByRole('dialog',{name:'確認要更新到官網的內容'}).waitFor();assert(await page.getByText('會更新的位置',{exact:true}).isVisible());await page.getByRole('button',{name:'返回修改',exact:true}).click()
 console.log('PASS: update summary');await page.getByRole('dialog',{name:'確認要更新到官網的內容'}).waitFor({state:'hidden'});await page.evaluate(()=>document.querySelector('#__nuxt').__vue_app__.config.globalProperties.$router.push('/admin/inbox'));await page.waitForURL(base+'/admin/inbox');await page.waitForFunction(()=>document.querySelector('.cms-page')?.__vueParentComponent?.isMounted);await page.getByLabel('處理狀態篩選').selectOption('已完成');await page.waitForURL(/status=/);await go('/admin/users');await page.getByRole('button',{name:'新增帳號',exact:true}).click();assert(await page.getByLabel('可以做的工作').isVisible());await page.getByRole('button',{name:'關閉視窗'}).click()
 await go('/admin/content?area=pages');await page.getByLabel('搜尋內容').fill('加盟');await page.waitForURL(/q=/);await page.waitForTimeout(300);const list=page.url();await page.locator('.cms-section-card').first().click();await page.getByRole('link',{name:'← 返回列表'}).click();await page.waitForURL(list);assert.equal(page.url(),list)
 await go('/admin/content?edit=data-kitchenStyles');await page.waitForURL(/\/admin\/home\?.*edit=view-components-home-HomeProject/);await page.getByRole('button',{name:'系列卡片',exact:true}).waitFor();assert(await page.locator('.cms-array').count());
 await go('/admin/media');const upload=page.getByLabel('上傳圖片或檔案',{exact:true}),image=await require('sharp')({create:{width:4,height:4,channels:3,background:'#caa05c'}}).png().toBuffer()
 await upload.setInputFiles({name:'workflow-acceptance.png',mimeType:'image/png',buffer:image});await page.getByRole('status').filter({hasText:'檔案已上傳'}).waitFor()
 const {PDFDocument}=require('pdf-lib'),pdf=await PDFDocument.create();pdf.addPage();await upload.setInputFiles({name:'workflow-acceptance.pdf',mimeType:'application/pdf',buffer:Buffer.from(await pdf.save())});await page.getByRole('status').filter({hasText:'檔案已上傳'}).waitFor()
 await upload.setInputFiles({name:'invalid.txt',mimeType:'text/plain',buffer:Buffer.from('invalid')});await page.getByRole('alert').filter({hasText:'請選擇 JPG'}).waitFor()
 await page.emulateMedia({reducedMotion:'reduce'});await go('/admin/home?edit='+id);await page.getByLabel('區塊標題（前半段）',{exact:true}).waitFor();assert.equal(await page.locator('.cms-page').evaluate(el=>getComputedStyle(el).animationName),'none')
 console.log('PASS: actual image and PDF uploads (temporary acceptance files)')
 assert.deepEqual((await api('documents')).body,before.body);assert.deepEqual(errors,[]);console.log('PASS: 4 widths, all navigation, live preview without saving, conflicts, single-item editing, image selection/focus, confirmation, filters, accounts and website. Screenshots:',shots)
 }catch(e){console.error('Original UI failure:',e);console.error('UI failure:',page.url(),await page.locator('[role=alert]').allTextContents().catch(()=>[]));await page.screenshot({path:join(shots,'failure.png'),fullPage:true}).catch(()=>{});console.error('Screenshots:',shots);throw e}finally{await browser.close()}
})().catch(e=>{console.error(e);process.exitCode=1})
