// Local acceptance only: inputs are previewed, never saved or published.
const assert=require('node:assert/strict'),{chromium}=require('playwright'),{mkdtempSync}=require('node:fs'),{tmpdir}=require('node:os'),{join}=require('node:path')
;(async()=>{
 const base=process.env.PREVIEW_URL||'http://localhost:3100';assert(['localhost','127.0.0.1'].includes(new URL(base).hostname))
 for(const key of ['PREVIEW_PASSWORD','CMS_TEST_EMAIL','CMS_TEST_PASSWORD'])assert(process.env[key],`Missing ${key}`)
 const browser=await chromium.launch(),context=await browser.newContext(),page=await context.newPage(),errors=[],shots=mkdtempSync(join(tmpdir(),'sakura-workflow-'))
 page.on('pageerror',e=>errors.push(e.message));page.on('console',m=>{if(/hydration|duplicate keys/i.test(m.text()))errors.push(m.text())});page.on('dialog',d=>d.accept())
 const go=async path=>{await page.goto(base+path);await page.waitForFunction(()=>document.querySelector('#__nuxt')?.__vue_app__?.config.globalProperties.$nuxt?.isHydrating===false)}
 const read=path=>page.evaluate(async path=>{const r=await fetch(path);return{status:r.status,body:await r.json(),cache:r.headers.get('cache-control')}},path)
 const api=async(path,body)=>page.evaluate(async({path,body})=>{const s=await(await fetch('/api/admin/session')).json(),r=await fetch('/api/admin/'+path,body?{method:'POST',headers:{'Content-Type':'application/json','X-CSRF-Token':s.csrf},body:JSON.stringify(body)}:{});return{status:r.status,body:await r.json()}},{path,body})
 try{
 await go('/admin');if(page.url().includes('preview-access')){await page.getByLabel('預覽密碼',{exact:true}).fill(process.env.PREVIEW_PASSWORD);await page.getByRole('button',{name:'進入網站',exact:true}).click();await page.waitForURL(base+'/admin/login')}
 await go('/admin/login')
 await page.getByLabel('電子郵件',{exact:true}).fill(process.env.CMS_TEST_EMAIL);await page.getByLabel('密碼',{exact:true}).fill(process.env.CMS_TEST_PASSWORD);await page.getByRole('button',{name:'登入',exact:true}).click();await page.waitForURL(base+'/admin');await page.getByRole('heading',{name:'今天要修改什麼？'}).waitFor()
 const names=(await api('workspaces')).body;assert.equal(names.length,48);for(const w of names){assert(w.section&&w.pageTitle&&w.purpose);assert.equal(w.title,w.pageTitle+'｜'+w.purpose)}
 const before=await api('documents'),id='view-components-home-HomeProject'
 // Preview APIs must include unsaved collections and remain private.
 const productDoc=(await api('documents/catalog-sakura')).body,liveProducts=(await read('/api/products/sakura/items?page=1')).body
 const first=liveProducts.items[0];assert(first);productDoc.body.items.find(i=>String(i.id)===String(first.id)).enabled=false
 const productPreview=await api('workspaces/catalog-sakura',{action:'preview',documents:[{id:productDoc.id,revision:productDoc.revision,body:productDoc.body}]});assert.equal(productPreview.status,200)
 const previewProducts=await read('/api/products/sakura/items?page=1&cmsPreview=catalog-sakura&cmsDraft='+productPreview.body.previewToken);assert.equal(previewProducts.status,200);const productList=previewProducts.body;assert.equal(productList.total,liveProducts.total-1);assert(productList.items.every(i=>String(i.id)!==String(first.id)))
 const cases=(await api('documents/custom-cases')).body,entry=JSON.parse(JSON.stringify(cases.schema.fields.items.template));Object.assign(entry,{id:require('node:crypto').randomUUID(),title:'未儲存的案例預覽',description:'只用於預覽',form:'一字型',style:'現代風'});cases.body.items.unshift(entry)
 const casePreview=await api('workspaces/custom-cases',{action:'preview',documents:[{id:cases.id,revision:cases.revision,body:cases.body}]});assert.equal(casePreview.status,200)
 const caseResponse=await read('/api/design-inspiration/cases/'+entry.id+'?cmsPreview=custom-cases&cmsDraft='+casePreview.body.previewToken);assert.equal(caseResponse.status,200);assert.equal(caseResponse.body.title,entry.title);assert.match(caseResponse.cache,/no-store/)
 const invalidToken=await read('/api/content/custom-cases?preview=custom-cases&cmsDraft=invalid');assert.equal(invalidToken.status,404);assert.equal(invalidToken.body.data.cmsPreviewExpired,true)
 const csrf=await page.evaluate(async()=>{const r=await fetch('/api/admin/workspaces/custom-cases',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({action:'preview',documents:[]})});return r.status});assert.equal(csrf,403)
 const news=(await api('documents/news-articles')).body;news.body.items[0].summary.title='未儲存的文章預覽';const newsPreview=await api('workspaces/news-articles',{action:'preview',documents:[{id:news.id,revision:news.revision,body:news.body}]});assert.equal(newsPreview.status,200)
 const alias=(await read('/api/content/data-news?preview=news-articles&cmsDraft='+newsPreview.body.previewToken)).body;assert(alias.newsArticles.some(n=>n.title==='未儲存的文章預覽'))
 const text=(await api('documents/'+id)).body,series=(await api('documents/data-kitchenStyles')).body;text.body.copy.text1=42;const validation=await api('workspaces/'+id,{action:'preview',documents:[text,series].map(d=>({id:d.id,revision:d.revision,body:d.body}))});assert.equal(validation.status,400);assert.equal(validation.body.data.fieldErrors[0].path,'copy.text1');assert(!validation.body.message.includes('copy.text1'))
 console.log('PASS: unsaved product filtering, new case detail, article aliases, private/no-store preview, CSRF and readable field errors')

 for(const width of [1440,1024,768,390]){
  await page.setViewportSize({width,height:960})
  for(const path of ['/admin','/admin/home',...['design','products','service','news','brand','franchise','builders','shared','all'].map(s=>'/admin/content?section='+s),...['pages','news','cases','products','stores','settings'].map(a=>'/admin/content?area='+a),'/admin/media','/admin/inbox','/admin/users','/admin/audit','/']){
   await go(path);await page.locator(path==='/'?'#top':'.cms-page').waitFor();assert(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth),`Overflow ${width}: ${path}`);assert.equal(await page.locator('.cms-main>.cms-error,.cms-page>.cms-error').count(),0,`${width}: ${path}`)
   if(path==='/admin/home'){assert.equal(await page.locator('.cms-section-card').count(),8);await page.screenshot({path:join(shots,`${width}-home.png`),fullPage:true})}
  }
  await go('/admin/home?edit='+id);await page.getByLabel('區塊標題（前半段）',{exact:true}).waitFor();assert(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth));assert(await page.getByRole('link',{name:'查看官網位置',exact:true}).isVisible())
  if(width>=992){
   const geometry=()=>page.evaluate(()=>({rail:document.querySelector('.cms-sidebar').getBoundingClientRect().width,main:document.querySelector('.cms-shell').getBoundingClientRect().left,save:document.querySelector('.cms-savebar').getBoundingClientRect().left}))
   assert.deepEqual(await geometry(),{rail:76,main:76,save:76})
   const expand=page.getByRole('button',{name:'展開選單',exact:true});assert.equal(await expand.getAttribute('aria-expanded'),'false');await expand.press('Enter')
   assert.deepEqual(await geometry(),{rail:220,main:220,save:220})
   await page.locator('.cms-part-tabs button').last().click();assert.equal(await page.getByRole('button',{name:'收合選單',exact:true}).getAttribute('aria-expanded'),'true')
   await page.locator('.cms-part-tabs button').first().click();await page.getByLabel('區塊標題（前半段）',{exact:true}).fill('側欄操作檢查')
   assert.deepEqual(await geometry(),{rail:220,main:220,save:220});await page.getByRole('button',{name:'收合選單',exact:true}).click();assert.deepEqual(await geometry(),{rail:76,main:76,save:76})
   await page.locator('.cms-editor-breadcrumb').getByRole('link').click();assert.equal(await page.locator('.cms-sidebar').evaluate(el=>el.getBoundingClientRect().width),220)
   await page.locator('.cms-section-card').first().click();assert.equal(await page.locator('.cms-sidebar').evaluate(el=>el.getBoundingClientRect().width),76)
   await go('/admin/home?edit='+id);await page.getByLabel('區塊標題（前半段）',{exact:true}).waitFor()
  }else{
   assert(!await page.locator('.cms-sidebar').isVisible());assert(!await page.locator('.cms-sidebar-toggle').isVisible())
   const menu=page.getByRole('button',{name:'開啟後台選單',exact:true});await menu.click();await page.getByRole('dialog',{name:'管理選單',exact:true}).waitFor();await page.getByRole('button',{name:'關閉視窗',exact:true}).press('Escape');assert(await menu.evaluate(el=>el===document.activeElement))
   assert.equal(await page.locator('.cms-savebar').evaluate(el=>el.getBoundingClientRect().left),0)
  }
  if(width<1200){await page.getByRole('button',{name:'看效果',exact:true}).first().click();assert(await page.locator('.cms-effect-panel').isVisible());await page.getByRole('button',{name:'修改內容',exact:true}).click()}
  assert.equal(await page.locator('.cms-work-editor h1').innerText(),names.find(w=>w.id===id).title)
  await page.screenshot({path:join(shots,`${width}-editor.png`),fullPage:true})
  await go('/admin/content?section=design&q='+encodeURIComponent('廚房知識文章'))
  const knowledge=names.find(w=>w.id==='knowledge-articles');await page.getByRole('link').filter({has:page.getByText(knowledge.title,{exact:true})}).click();assert.equal(await page.locator('.cms-work-editor h1').innerText(),knowledge.title)
  await page.locator('.cms-editor-breadcrumb').getByRole('link').click();assert.equal(new URL(page.url()).searchParams.get('q'),'廚房知識文章');assert.equal(await page.locator('input[aria-label="搜尋內容"]').inputValue(),'廚房知識文章')
 }
 await page.setViewportSize({width:1440,height:960});await go('/admin/home?edit='+id);const field=page.getByLabel('區塊標題（前半段）',{exact:true});await field.waitFor();await field.fill('未儲存的即時測試')
 await page.frameLocator('iframe[title="目前輸入的官網效果"]').getByText('未儲存的即時測試',{exact:false}).first().waitFor({timeout:45000});await page.waitForFunction(()=>document.querySelector('.cms-effect-panel')?.textContent.includes('目前輸入的效果'));const frame=page.frames().find(f=>f.url().includes('cmsPreview='));assert(frame);await frame.waitForFunction(()=>{const r=document.getElementById('kitchen-series')?.getBoundingClientRect();return r&&r.top>=-1&&r.top<innerHeight/2});assert.deepEqual((await api('documents')).body,before.body);await page.screenshot({path:join(shots,'live-unsaved-preview.png'),fullPage:true})
 const oldPreviewToken=new URL(frame.url()).searchParams.get('cmsDraft'),initialPreviewToken=new URL(await page.locator('iframe[title="目前輸入的官網效果"]').getAttribute('src'),base).searchParams.get('cmsDraft'),previewDocuments=[]
 for(const documentId of [id,'data-kitchenStyles']){const d=(await api('documents/'+documentId)).body;previewDocuments.push({id:d.id,revision:d.revision,body:d.body})}
 for(let i=0;i<41;i++)assert.equal((await api('workspaces/'+id,{action:'preview',documents:previewDocuments})).status,200)
 assert.equal((await read('/api/content/'+id+'?preview='+id+'&cmsDraft='+oldPreviewToken)).status,404)
 await frame.locator('a[href="/home-style/basic-plus"]').first().click()
 await page.waitForFunction(({oldToken,initialToken})=>{const panel=document.querySelector('.cms-effect-panel'),iframe=panel?.querySelector('iframe'),token=iframe&&new URL(iframe.src).searchParams.get('cmsDraft');return panel?.textContent.includes('目前輸入的效果')&&token&&token!==oldToken&&token!==initialToken&&!panel.querySelector('[role=alert]')},{oldToken:oldPreviewToken,initialToken:initialPreviewToken},{timeout:45000})
 await page.frameLocator('iframe[title="目前輸入的官網效果"]').getByText('未儲存的即時測試',{exact:false}).first().waitFor();assert.equal(await field.inputValue(),'未儲存的即時測試');assert.deepEqual((await api('documents')).body,before.body)
 await page.getByRole('button',{name:'重新載入',exact:true}).click();await page.frameLocator('iframe[title="目前輸入的官網效果"]').getByText('未儲存的即時測試',{exact:false}).first().waitFor();await page.waitForFunction(()=>document.querySelector('.cms-effect-panel')?.textContent.includes('目前輸入的效果'))
 console.log('PASS: expired preview automatically rebuilds; manual reload, unsaved inputs and stored content remain intact')
 await page.route('**/api/admin/workspaces/'+id,async r=>r.request().postDataJSON().action==='save'?r.fulfill({status:409,contentType:'application/json',body:JSON.stringify({message:'有人已修改這個區塊。你的輸入已保留。',data:{traceId:'ui-conflict-check'}})}):r.continue())
 await page.getByRole('button',{name:'儲存',exact:true}).click();await page.getByRole('alert').filter({hasText:'ui-conflict-check'}).waitFor();assert.equal(await field.inputValue(),'未儲存的即時測試');await page.unroute('**/api/admin/workspaces/'+id)
 await page.getByRole('button',{name:'系列卡片',exact:true}).click();const rows=page.locator('.cms-array-row');await rows.first().locator('summary').focus();await page.keyboard.press('Enter');await rows.nth(1).locator('summary').focus();await page.keyboard.press('Enter');assert.equal(await page.locator('.cms-array-row[open]').count(),1)
 console.log('PASS: live preview, conflict retention and single-item editing');
 const choose=rows.nth(1).getByRole('button',{name:'更換圖片',exact:true}).first();await choose.click();const dialog=page.getByRole('dialog',{name:'選擇圖片',exact:true});await dialog.waitFor();await dialog.getByRole('button',{name:'上傳新檔案'}).waitFor();await dialog.getByRole('button',{name:/^選擇 /}).first().click();await dialog.waitFor({state:'hidden'});assert(await choose.evaluate(el=>el===document.activeElement))
 console.log('PASS: image selection and focus return');await page.getByRole('button',{name:'更新官網',exact:true}).click();await page.getByRole('dialog',{name:'確認要更新到官網的內容'}).waitFor();assert(await page.getByText('會更新的位置',{exact:true}).isVisible());await page.getByRole('button',{name:'返回修改',exact:true}).click()
 console.log('PASS: update summary');await page.getByRole('dialog',{name:'確認要更新到官網的內容'}).waitFor({state:'hidden'});await page.evaluate(async()=>{const root=document.querySelector('#__nuxt').__vue_app__,app=root.config.globalProperties.$nuxt;await new Promise((resolve,reject)=>{const off=app.hook('page:finish',()=>{off();resolve()});root.config.globalProperties.$router.push('/admin/inbox').catch(reject)})});await page.waitForURL(base+'/admin/inbox');await page.getByLabel('處理狀態篩選').selectOption('已完成');await page.waitForURL(/status=/);await go('/admin/users');await page.getByRole('button',{name:'新增帳號',exact:true}).click();assert(await page.getByLabel('可以做的工作').isVisible());await page.getByRole('button',{name:'關閉視窗'}).click()
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
