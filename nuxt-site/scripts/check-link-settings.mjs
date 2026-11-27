import assert from 'node:assert/strict'
import{readFile}from'node:fs/promises'
import{pageEditors,pageBlocks}from'../shared/cms/page-editors.mjs'
import{linkSetting,focusedLinkSetting,linkSettingLocation}from'../shared/cms/link-settings.mjs'
const seed=JSON.parse(await readFile(new URL('../shared/cms/seed.json',import.meta.url),'utf8')),original=JSON.stringify(seed),bodies=Object.fromEntries(seed.map(d=>[d.id,d.data])),blocks=pageEditors.flatMap(p=>pageBlocks(p,seed));let count=0
for(const block of blocks)for(const field of block.fields){
 function walk(s,path){if(s.hidden||Object.hasOwn(s,'fixed'))return;if(s.destination){const setting=linkSetting(field.documentId,path);assert(setting,field.documentId+':'+path);assert.equal(s.label,setting.label);assert(!/^(前往頁面|連結|網址|預約)$/.test(s.label));count++;if(setting.unused){assert(s.readOnly);assert(s.advanced)}}for(const[k,v]of Object.entries(s.fields||{}))walk(v,path+'.'+k);if(s.item)walk(s.item,path+'.*')}
 walk(field.schema,field.path)
}
assert(count>=80,'All existing destination definitions must remain represented')
const block=(id)=>blocks.find(b=>b.id===id)
const support=focusedLinkSetting(block('franchise:總部支援'),bodies,null,'copy.supportDestination')
assert.equal(support.raw,'');assert.equal(support.effective,bodies['data-franchise'].FRANCHISE_FORM_URL)
assert.equal(linkSettingLocation(support,block('franchise:總部支援'),bodies,'/franchising/intro'),'/franchising/intro#franchise-support')
assert.equal(focusedLinkSetting(block('franchise:總部支援'),bodies,null,'copy.text46').path,'copy.supportDestination')
for(const [name,field,destination]of [['franchise:主視覺標題','copy.text9','data-franchise'],['franchise:加盟邀請','copy.text36','data-franchise'],['builders:主視覺標題','copy.text5','data-builders']]){
 const paired=focusedLinkSetting(block(name),bodies,null,field)
 assert.equal(paired.documentId,destination);assert.equal(paired.raw,bodies[destination][destination==='data-franchise'?'FRANCHISE_FORM_URL':'BUILDER_APPOINTMENT_HASH'])
 if(destination==='data-builders')assert.equal(paired.caption,'立即預約')
}
const footer=block('footer:網站地圖與隱私權入口'),cell=focusedLinkSetting(footer,bodies,null,'sitemapGroups.0.links.1.1')
assert.equal(cell.raw,bodies['view-components-SiteFooter'].sitemapGroups[0].links[1][1]);assert.equal(cell.caption,bodies['view-components-SiteFooter'].sitemapGroups[0].links[1][0])
assert.equal(focusedLinkSetting(footer,bodies,null,'sitemapGroups.0.links.1.0').path,'sitemapGroups.0.links.1.1')
const series=block('series:品牌系列內頁'),target=focusedLinkSetting(series,bodies,null,'KITCHEN_SERIES_PAGES.0.buttonDestinations.catalogue')
assert.equal(target.raw,'');assert.equal(target.effective,'/catalogues/kitchenware-catalog?series='+bodies['data-kitchenSeries'].KITCHEN_SERIES_PAGES[0].slug)
assert.equal(linkSettingLocation(target,series,bodies,'/home-style/aikitchen'),'/home-style/'+target.item.slug+'#ai-kitchen-hero-title')
const noCards=structuredClone(bodies);noCards['data-kitchenSeries'].KITCHEN_SERIES_PAGES[0].cases=[]
assert.equal(focusedLinkSetting(series,noCards,null,'KITCHEN_SERIES_PAGES.0.buttonDestinations.moreCases').effective,'/design-inspiration')
const legacy=focusedLinkSetting(block('news-activities:麵包屑導覽設定'),bodies,null,'copy.field2')
assert(legacy.unused);assert.equal(legacy.effective,'');assert.equal(legacy.raw,bodies['view-pages-news-activities-slug-'].copy.field2)
const news=structuredClone(bodies);news['news-articles']={items:[{slug:'example',summary:{category:'latest'},detail:{sections:[{links:[{label:'文章連結',url:'/knowledge'}]}]}}]}
const article=focusedLinkSetting(block('news-latest:消息文章管理'),news,null,'items.0.detail.sections.0.links.0.url')
assert.equal(article.caption,'文章連結');assert.equal(article.raw,'/knowledge');assert.equal(linkSettingLocation(article,{},news,'/news/latest'),'/news/latest/example#cms-article-links-1')
const duplicate={fields:[{documentId:'view-pages-gallery-slug-',path:'copy.field1',schema:{destination:true}},{documentId:'view-pages-knowledge-design-slug-',path:'copy.field1',schema:{destination:true}}]}
assert.equal(focusedLinkSetting(duplicate,bodies,null,'copy.field1','view-pages-knowledge-design-slug-').documentId,'view-pages-knowledge-design-slug-')
assert.equal(JSON.stringify(seed),original,'Presentation and fallback resolution must never mutate stored values or schema')
console.log('PASS '+pageEditors.length+' page editors and '+count+' destination definitions: explicit names, unchanged schema/data, exact nested/caption/tuple targets, source-document isolation, original fallbacks, conditional/unused fields and article anchors')
