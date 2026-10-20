import assert from 'node:assert/strict'
import {readFile} from 'node:fs/promises'
import {resourceGuide,resourceSearchText,editingSchema,homeResources} from '../shared/cms/presentation.mjs'
const seed=JSON.parse(await readFile(new URL('../shared/cms/seed.json',import.meta.url),'utf8'))
const aliases=new Set(['data-news','data-latestArticles','data-activityArticles','data-mediaVideos','data-kitchenGuides','data-kitchenGuideDetails'])
const docs=seed.filter(d=>!aliases.has(d.id)),ids=new Set(docs.map(d=>d.id))
let fields=0
function verify(doc){
 const original=JSON.stringify(doc.schema),guide=resourceGuide(doc.id)
 assert(guide,`Missing guide: ${doc.id}`);assert.equal(guide.location.length,3)
 for(const label of [guide.title,...guide.location])assert(/[\u4e00-\u9fff]/.test(label),`Not a readable Chinese label: ${doc.id} ${label}`)
 assert(guide.impacts.length);for(const item of [{href:guide.href},...guide.impacts])assert(/^\/(?!\/)/.test(item.href),`Location must open this website: ${doc.id}`)
 for(const related of guide.related||[])assert(ids.has(related),`Broken editor link: ${doc.id} → ${related}`)
 const schema=editingSchema(doc.schema,doc.id)
 function walk(s,path='',hidden=false){hidden||=s.hidden||Object.hasOwn(s,'fixed');if(path&&!hidden){fields++;assert(!s.unmapped,`Missing label: ${doc.id}:${path}`);assert(/[\u4e00-\u9fff]/.test(s.label),`Not Chinese: ${doc.id}:${path}`);assert(s.label.length<=45,`Label contains prose: ${doc.id}:${path}`);assert(!/(?:^|\b)(?:text\d+|field\d+|asset_[a-f0-9]+)(?:$|\b)/.test(s.label))}for(const[k,v]of Object.entries(s.fields||{}))walk(v,path?path+'.'+k:k,hidden);if(s.item)walk(s.item,path+'.*',hidden)}
 walk(schema);assert.equal(JSON.stringify(doc.schema),original,'Presentation must never mutate the persisted schema')
 if(doc.id.startsWith('view-')){
  const guideCopies=schema.fields?.copy?.fields||{}
  for(const[key,s]of Object.entries(guideCopies))if(!s.hidden){const value=doc.data.copy?.[key]?.trim();if(value?.length>25)assert.notEqual(s.label,value,'Do not use an entire original paragraph as a field name')}
 }
}
for(const doc of docs)verify(doc)
assert.equal(homeResources.length,8)
const galleryCopy=editingSchema(seed.find(d=>d.id==='view-components-home-HomeGallery').schema,'view-components-home-HomeGallery').fields.copy
assert.equal(galleryCopy.label,'標題與按鈕設定')
assert.deepEqual(['text2','text3','field4','text5'].map(key=>galleryCopy.fields[key].label),['英文小標','區塊標題','按鈕連結','按鈕文字'])
const styleSchema=editingSchema(seed.find(d=>d.id==='view-components-home-HomeStyleMarquee').schema,'view-components-home-HomeStyleMarquee').fields.styles
assert.equal(styleSchema.label,'設計風格')
assert.equal(styleSchema.rowLabel,'zh')
assert.equal(styleSchema.rowImage,'images')
assert(editingSchema(seed.find(d=>d.id==='view-components-home-HomeStyleMarquee').schema,'view-components-home-HomeStyleMarquee').fields.copy.hidden,'Preview teleport target is a template setting, not editable website copy')
const storeSchema=editingSchema(seed.find(d=>d.id==='view-components-home-HomeStoreLocation').schema,'view-components-home-HomeStoreLocation')
assert.equal(storeSchema.fields.regions.label,'地區與縣市設定')
assert.equal(storeSchema.fields.regions.editor,'store-regions')
assert.equal(storeSchema.fields.stores.label,'門市')
assert.equal(storeSchema.fields.stores.idGenerator,'store')
assert.equal(storeSchema.fields.stores.item.editor,'store-location')
assert(storeSchema.fields.stores.item.fields.id.readOnly)
assert.equal(storeSchema.fields.stores.item.fields.region.label,'區域')
assert.equal(storeSchema.fields.stores.item.fields.city.label,'縣市')
assert(!editingSchema(seed.find(d=>d.id==='data-storeCases').schema,'data-storeCases').fields.regionCities.editor,'Only the homepage region settings use this editor')
assert(resourceGuide('data-storeCases').impacts.some(i=>i.href==='/design-inspiration'),'The server also merges store cases into design inspiration')
assert(resourceGuide('site-visuals').impacts.some(i=>i.href==='/about/exhibition'),'The brand video is also used in the brand pavilion hero')
const brands=editingSchema(seed.find(d=>d.id==='view-components-home-HomeServices').schema,'view-components-home-HomeServices').fields.services
assert.equal(brands.label,'廚電品牌')
assert.equal(brands.rowLabel,'alt','Brand captions follow the actual brand field, including after sorting')
assert.equal(brands.item.fields.n.label,'顯示編號')
assert.equal(brands.item.fields.img.label,'產品圖片')
assert.equal(brands.item.fields.logo.label,'品牌標誌')
assert.equal(brands.item.fields.logo.previewTone,'dark')
assert.equal(brands.item.fields.logoClass.label,'標誌尺寸')
assert(!brands.item.fields.logoClass.hidden)
assert.equal(brands.item.fields.logoClass.enum.length,brands.item.fields.logoClass.optionLabels.length)
assert.equal(brands.item.fields.captionTop.label,'品牌標誌與介紹置於圖片上方')
assert(brands.item.fields.captionTop.help.includes('569px'))
for(const brand of seed.find(d=>d.id==='view-components-home-HomeServices').data.services)assert(brands.item.fields.logoClass.enum.includes(brand.logoClass),'Existing brand sizes must retain their original values')
for(const [name,title]of [['HomeServices','廚房產品'],['HomeGallery','設計案例'],['HomeStyleMarquee','設計風格']]){
 const guide=resourceGuide('view-components-home-'+name)
 assert.equal(guide.tabTitle,title)
 assert(guide.title.startsWith(title+'・'))
 assert.equal(guide.location[1],title)
 assert(guide.impacts.some(i=>i.label==='首頁 → '+title))
}
const cards=docs.find(d=>d.id==='data-kitchenStyles')
assert.equal(resourceGuide(cards.id).title,'設計系列導覽')
assert(resourceSearchText(cards).includes('設計系列導覽'))
assert(resourceSearchText(cards).includes('首頁'));assert(resourceSearchText(cards).includes('品牌系列'))
assert.equal(resourceGuide(cards.id).href,'/#kitchen-series')
assert(resourceGuide(cards.id).impacts.some(i=>i.label.includes('全站主選單')))
assert(resourceGuide('view-components-home-HomeProject').related.includes(cards.id))
assert.equal(editingSchema(cards.schema,cards.id).fields.KITCHEN_STYLES.item.fields.image.label,'卡片圖片')
for(const id of ['view-pages-news-latest-slug-','view-pages-news-activities-slug-','view-pages-news-video-slug-','view-pages-gallery-slug-','view-pages-knowledge-design-slug-','view-pages-design-inspiration-id-'])assert.notEqual(resourceGuide(id).href,'/','Shared detail editor must not link to the homepage')
const root=new URL('../',import.meta.url)
const files={...Object.fromEntries(homeResources.map(id=>[id,'components/home/'+id.slice('view-components-home-'.length)+'.vue'])),'view-components-SiteHeader':'components/SiteHeader.vue','view-components-SiteFooter':'components/SiteFooter.vue','view-components-FloatingButtons':'components/FloatingButtons.vue'}
const viewPaths=['about/advantage','about/exhibition','about/introduce','builders/catalogues','builders/index','builders/sakura-kitchen','catalogues/catalog','catalogues/kitchenware-catalog','design-inspiration/[id]','design-inspiration/index','franchising/download','franchising/form','franchising/intro','gallery/[slug]','gallery/index','knowledge/design/[slug]','knowledge/design/systemcabinet','knowledge/index','news/activities/[slug]','news/activities/index','news/index','news/latest/[slug]','news/latest/index','news/video/[slug]','news/video/index','privacy','service-process']
for(const file of viewPaths)files['view-pages-'+file.replace(/[^a-zA-Z0-9]+/g,'-')]='pages/'+file+'.vue'
for(const[id,file]of Object.entries(files)){
 const source=await readFile(new URL(file,root),'utf8'),schema=editingSchema(seed.find(d=>d.id===id).schema,id)
 const used=new Set([...source.matchAll(/cmsCopy\.copy\.([a-zA-Z0-9_]+)/g)].map(m=>m[1]))
 for(const[key,s]of Object.entries(schema.fields.copy?.fields||{}))if(!Object.hasOwn(s,'fixed')){
  if(!used.has(key))assert(s.hidden,`Obsolete copy must be hidden: ${id}:${key}`)
  if(used.has(key)&&!s.hidden)assert(!s.unmapped,`Current field needs a description: ${id}:${key}`)
 }
 const href=resourceGuide(id).href
 if(href.startsWith('/#')&&!['SiteHeader','SiteFooter','FloatingButtons'].some(k=>id.endsWith(k))){const anchor=href.split('#')[1];assert(source.includes(`id="${anchor}"`),`Missing home location anchor: ${id} ${href}`)}
}
const editor=await readFile(new URL('components/admin/AdminResourceEditor.vue',root),'utf8')
assert(editor.includes('<AdminResourceContext :id="id" />'))
assert(editor.includes(':schema="formSchema"'))
assert(editor.includes("path.includes('?')?'&':'?'")&&editor.includes("anchor?'#'+anchor:''"),'Preview query must precede the section hash')
if(process.env.CMS_GUIDANCE_READ_DB==='1'){
 const{query,database}=await import('../server/cms/database.mjs')
 try{const rows=(await query("SELECT id,schemaJson FROM cms.Documents WHERE id NOT IN (N'data-kitchenGuides',N'data-kitchenGuideDetails',N'data-news',N'data-latestArticles',N'data-activityArticles',N'data-mediaVideos')")).recordset;for(const row of rows)verify({id:row.id,schema:JSON.parse(row.schemaJson),data:{}});console.log('PASS live local editing schemas (SELECT only):',rows.length)}finally{await(await database()).close()}
}
console.log(`PASS ${docs.length} content locations, ${fields} visible labels, 8 home entries, shared impacts, source copy usage, section links and unchanged schemas`)
