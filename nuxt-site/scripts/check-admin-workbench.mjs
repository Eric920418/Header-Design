import assert from 'node:assert/strict'
import {readFile} from 'node:fs/promises'
import {runInNewContext} from 'node:vm'
import {randomUUID} from 'node:crypto'
import ts from 'typescript'
import {ref,reactive,computed,watch,nextTick,effectScope} from 'vue'
import {pageEditors,pageBlocks,searchResultLink,seriesCardRedirect} from '../shared/cms/page-editors.mjs'
import {checkPageBody,editorSchema} from '../server/cms/page-editors.mjs'
import {workbenchBlocks,itemKey,itemCaption,itemThumbnail,positionContent,freshArticleValue,thumbnailPlaceholder,inspirationPosition,pagePositionContent,newsBreadcrumbPosition,homeHeroPosition,itemWebsitePath,articleDateLabel,updateArticleField,recentArticleIndexes,updateFranchiseMarqueeImage,updateFranchiseFaqDestination} from '../shared/cms/workbench.mjs'
import {seriesEditorSections,seriesEditorSchema,sectionForSeriesField} from '../shared/cms/series-editor.mjs'
import {pagePositions} from '../shared/cms/positions.mjs'
import {firstImage} from '../shared/cms/workflow.mjs'
import {blockThumbnail} from '../shared/cms/page-editors.mjs'
import {valueAt,searchPages,pageTaskLink,pageSummary,storeCasesPageId,storeCaseRedirect,retiredBuilderPartnersRedirect} from '../shared/cms/page-editors.mjs'
import {sameContent,pageChanges,changeImpacts,blockImpacts,publishReview,pageSearchItems,pageMedia,hasPageChanges,itemPublication} from '../shared/cms/changes.mjs'
import {normalizeVideos,validate} from '../server/cms/content.mjs'
import {readableError,workspaceSummariesFromRows} from '../server/cms/workspaces.mjs'
import {editingSchema} from '../shared/cms/presentation.mjs'
import {compareNewsDates,franchiseNewsIds,publicContent} from '../shared/cms/public-content.mjs'
import {builderCatalogueBreadcrumb,franchiseDownloadBreadcrumb,storeBreadcrumb,storeCaseBreadcrumb} from '../shared/cms/page-breadcrumbs.mjs'
import {builderCatalogueNoticeAnchor,builderCatalogueNoticeFields,builderCatalogueNotice} from '../shared/cms/builder-catalogue.mjs'
import {remainingHomeHeadings,homeRemainingHeading,effectiveHomeHeadingBody} from '../shared/cms/home-headings.mjs'
import {caseManagementRows,filterCaseManagement,storeCaseManagementLink,caseManagementReturn} from '../shared/cms/case-management.mjs'
import {HOME_STORES_ID,homeStoreListSchema} from '../shared/cms/store-location.mjs'
import {knowledgeSearchExample,knowledgeListSearchDefaults} from '../shared/cms/search-settings.mjs'
import {serviceHeading,serviceHeadingDocument} from '../shared/cms/service-headings.mjs'
import {pageFieldValue} from '../shared/cms/page-editors.mjs'
import {headingFieldLabel} from '../shared/cms/heading-labels.mjs'
import {cataloguePreviewHref,productCatalogueDocument,productCatalogueText,productCatalogueFields,productCatalogueTitle} from '../shared/cms/product-catalogue.mjs'
import {builderStrengthsCopy,builderStrengthsDocument} from '../shared/cms/builder-strengths.mjs'
import {builderHomeOneImage,builderHomeOneImages} from '../shared/cms/builder-home-one.mjs'
import {builderAppointmentHeading,builderAppointmentHeadingFields} from '../shared/cms/builder-appointment.mjs'
const seed=JSON.parse(await readFile(new URL('../shared/cms/seed.json',import.meta.url)))
const docs=seed.map(d=>({...d,body:d.data,schema:editorSchema({...d,schemaJson:JSON.stringify(d.schema)})}))
{
 const homeBlocks=workbenchBlocks('home',pageBlocks(pageEditors[0],docs))
 const heroBlock=homeBlocks.find(b=>b.id==='home:主視覺輪播'),promiseBlock=homeBlocks.find(b=>b.id==='home:品牌承諾')
 const hero=docs.find(d=>d.id==='view-components-home-HomeHero'),project=docs.find(d=>d.id==='view-components-home-HomeProject')
 const saved={[hero.id]:hero.body,[project.id]:project.body},edited=structuredClone(saved)
 const context={heroTitlePages:[{href:'/home-style/basic-plus',title:'Basic+',fallbackTitle:'Basic+'}]}
 const links=impacts=>impacts.map(i=>i.href)
 assert.deepEqual(links(blockImpacts(heroBlock,[],context)),['/#hero-title','/home-style/basic-plus'])
 assert.deepEqual(links(blockImpacts(promiseBlock,[],context)),['/#brand-promise'])
 edited[project.id].copy.text3+='其他區塊修改'
 edited[hero.id].slides[0].description+='輪播描述修改'
 let changes=pageChanges(homeBlocks,[hero,project],saved,edited,context)
 assert.deepEqual(links(blockImpacts(heroBlock,changes,context)),['/#hero-title'])
 edited[hero.id].slides[0].title='有專屬圖文的系列'
 changes=pageChanges(homeBlocks,[hero,project],saved,edited,context)
 assert.deepEqual(links(blockImpacts(heroBlock,changes,context)),['/#hero-title'])
 edited[hero.id].slides.find(s=>s.route==='/home-style/basic-plus').title='Basic+ 預設標題'
 changes=pageChanges(homeBlocks,[hero,project],saved,edited,context)
 assert.deepEqual(links(blockImpacts(heroBlock,changes,context)),['/#hero-title','/home-style/basic-plus'])
 assert.deepEqual(links(changeImpacts([{documentId:'data-kitchenStyles',path:'KITCHEN_STYLES.0.desc'}])),['/#kitchen-series'])
 assert.deepEqual(links(changeImpacts([{documentId:'site-visuals',path:'images.asset_82b9dd3e'}])),['/franchising/intro','/franchising/form','/franchising/download'])
 assert.deepEqual(changeImpacts([{documentId:'site-visuals',path:'brandVideoId'}]),[])
 assert.deepEqual(changeImpacts([{documentId:'data-builders',path:'builderPartners.0.name'}]),[])
 assert.deepEqual(links(changeImpacts([{documentId:'data-brandPavilions',path:'pavilionNotice.0'}])),['/about/exhibition'])
 assert.deepEqual(links(changeImpacts([{documentId:'news-articles',path:'items.0.detail.paragraphs.0',category:'latest',slug:'test'}])),['/news/latest/test'])
}
const newsDoc=docs.find(d=>d.id==='news-articles'),invalid=structuredClone(newsDoc.body);invalid.items[0].detail.videoId='無效網址'
assert.throws(()=>normalizeVideos(invalid,newsDoc.schema),e=>{const issue=readableError(e,newsDoc.id,editingSchema(newsDoc.schema,newsDoc.id),invalid);assert.equal(issue.fieldErrors[0].path,'items.0.detail.videoId');assert.match(issue.message,/YouTube/);assert(issue.message.includes(invalid.items[0].summary.title));return true})
for(const p of pageEditors){
 const old=pageBlocks(p,docs.filter(d=>p.ids.includes(d.id))),before=JSON.stringify(old),next=workbenchBlocks(p.id,old)
 const paths=blocks=>blocks.flatMap(b=>b.fields.map(f=>f.documentId+':'+f.path)).sort()
 assert.deepEqual(paths(next),paths(old),p.id+' must preserve every field exactly once')
 assert.equal(JSON.stringify(old),before,'Display grouping cannot mutate server field definitions')
 for(const b of old)assert(next.some(n=>n.aliases.includes(b.id)),'Old block link missing: '+b.id)
 assert(pagePositions[p.id],p.id+' requires an explicit page position')
 for(const b of next.filter(b=>!b.secondary)){
  assert(b.hint&&b.kind,p.id+' '+b.name+' needs a clear purpose and image layout')
  assert(b.positionIndex||p.id==='inspiration',p.id+' '+b.name+' needs an explicit website location')
  assert(!/^(標題與說明|整頁共用文字|列表標題與按鈕|圖片集)$/.test(b.name))
  const values=Object.fromEntries(docs.map(d=>[d.id,d.body])),snapshot=JSON.stringify(values),scene=pagePositionContent(b,values)
  assert.equal(scene.kind,b.kind);assert.equal(JSON.stringify(values),snapshot,'Position views must never change content')
  if(scene.image)assert.match(scene.image,/^(?:\/|https?:|data:image)/)
  assert(!b.fields.some(f=>/版面文字|顯示文字（第|內容欄位/.test(f.label)),p.id+' '+b.name+' contains an unclear field name')
  for(const f of b.fields)assert.equal(f.label,headingFieldLabel(f.label),p.id+' '+b.name+'標題欄位命名須統一')
 }
}
const home=workbenchBlocks('home',pageBlocks(pageEditors[0],docs))
assert.deepEqual(home.filter(b=>!b.secondary).map(b=>b.name),['首頁輪播圖片','品牌系列','設計風格圖片','廚房產品','集團品牌標誌','設計案例','品牌承諾','全台門市據點'])
const seriesPage=pageEditors.find(p=>p.id==='series'),series=pageBlocks(seriesPage,docs)
assert.deepEqual(seriesPage.ids,['data-kitchenSeries'])
assert.deepEqual(series.filter(b=>!b.secondary).map(b=>b.name),['品牌系列內頁'])
assert(series[0].aliases.includes('series:系列內頁'))
const seriesSchema=series[0].fields.find(field=>field.path==='KITCHEN_SERIES_PAGES').schema.item
const sections=seriesEditorSections.map(part=>seriesEditorSchema(seriesSchema,part.id))
assert.deepEqual(seriesEditorSections.map(part=>part.name),['主視覺輪播','探索廚房美學','套系與特色','板材顏色選擇','廚房電器推薦','風格廚房實例'])
assert.deepEqual(sections.flatMap(section=>Object.keys(section.fields).filter(key=>key!=='buttonDestinations')).sort(),
 Object.keys(seriesSchema.fields).filter(key=>key!=='buttonDestinations'&&!seriesSchema.fields[key].hidden).sort())
assert.deepEqual(sections.flatMap(section=>Object.keys(section.fields.buttonDestinations?.fields||{})).sort(),
 Object.keys(seriesSchema.fields.buttonDestinations.fields).sort())
const seriesTemplate=await readFile(new URL('../components/internal/KitchenSeriesPage.vue',import.meta.url),'utf8')
for(const part of seriesEditorSections){
 assert(seriesTemplate.includes('id="'+part.anchor+'"'),part.name+' must have a website anchor')
 for(const field of part.fields)assert.equal(sectionForSeriesField('KITCHEN_SERIES_PAGES.0.'+field)?.id,part.id)
 for(const button of part.buttons)assert.equal(sectionForSeriesField('KITCHEN_SERIES_PAGES.1.buttonDestinations.'+button)?.id,part.id)
}

const homeSeries=home.find(b=>b.id==='home:品牌系列')
assert(homeSeries.fields.some(f=>f.path==='KITCHEN_STYLES'))
assert.equal(searchPages([{title:'首頁',blocks:home}],'首頁與選單系列卡片')[0].block.id,homeSeries.id)
const oldCards=seriesCardRedirect({sitePage:'series',block:'series:首頁與選單系列卡片',section:'design',q:'AI',page:'2',list:'data-kitchenStyles:KITCHEN_STYLES',item:'aikitchen'})
assert.deepEqual(oldCards,{path:'/admin/home',query:{section:'design',q:'AI',page:'2',returnPath:'/admin/content',sitePage:'home',block:'home:品牌系列',list:'data-kitchenStyles:KITCHEN_STYLES',item:'aikitchen'}})
assert.equal(seriesCardRedirect({sitePage:'series',block:'series:系列內頁'}),undefined)
const guidePage=pageEditors.find(p=>p.id==='knowledge'),guideBlocks=pageBlocks(guidePage,docs)
assert.deepEqual(guideBlocks.filter(b=>!b.secondary).map(b=>b.name),['主視覺標題','麵包屑編輯設定','文章管理','頁面共用設定'])
const guideArticles=guideBlocks.find(b=>b.name==='文章管理'),guideShared=guideBlocks.find(b=>b.name==='頁面共用設定')
assert(guideArticles.aliases.includes('knowledge:系統櫃板材比較'))
assert(guideShared.aliases.includes('knowledge:延伸文章按鈕'))
assert.deepEqual(guideArticles.fields.filter(f=>!f.formGroup).map(f=>[f.documentId,f.path]),[['knowledge-articles','items']])
assert(guideArticles.fields.some(f=>f.path==='systemCabinetMaterials'&&f.formGroup==='系統櫃板材比較'))
const guideSearch=guideBlocks.find(b=>b.name==='顯示與搜尋設定')
assert(guideSearch.secondary);assert.equal(guideSearch.fields.length,3)
assert(guideSearch.aliases.includes('knowledge:文章顯示設定'))
for(const p of pageEditors){
 const blocks=workbenchBlocks(p.id,pageBlocks(p,docs))
 for(const block of blocks)for(const field of block.fields)if(['cmsSettings','seo'].includes(field.path)){
  assert(block.secondary,p.id+': search settings must be under Other settings')
  assert.equal(block.name,'顯示與搜尋設定');assert(!field.schema.advanced)
  assert.equal(block.hint,'官網顯示開關與搜尋結果文字')
 }
}
const seoBodies=Object.fromEntries(docs.map(d=>[d.id,d.body])),seoBefore=JSON.stringify(seoBodies)
assert.deepEqual(knowledgeSearchExample('view-pages-knowledge-index',seoBodies,{}).title,knowledgeListSearchDefaults.title)
for(const [id,system] of [['view-pages-knowledge-design-systemcabinet',true],['view-pages-knowledge-design-slug-',false]]){
 const article=seoBodies['knowledge-articles'].items.find(i=>i.enabled!==false&&(system?i.slug==='systemcabinet':i.slug!=='systemcabinet'))
 const example=knowledgeSearchExample(id,seoBodies,{seoTitle:'',seoDescription:''})
 assert.equal(example.title,article.summary.title+'｜SAKURA 整體廚房');assert.equal(example.description,article.summary.excerpt)
 assert.equal(knowledgeSearchExample(id,seoBodies,{seoTitle:'自訂搜尋標題',seoDescription:'自訂摘要'}).title,'自訂搜尋標題')
}
assert.equal(JSON.stringify(seoBodies),seoBefore,'Automatic SEO examples must not write duplicate data')
const knowledgeListing=docs.find(d=>d.id==='view-pages-knowledge-index')
const relabelledGuide=structuredClone(knowledgeListing.body)
relabelledGuide.copy.breadcrumbList='裝修指南測試'
checkPageBody(guidePage,knowledgeListing.id,knowledgeListing.body,relabelledGuide,knowledgeListing.schema)
validate(relabelledGuide,knowledgeListing.schema)
assert.deepEqual(changeImpacts([{documentId:knowledgeListing.id,path:'copy.breadcrumbList'}]).map(i=>i.href),['/knowledge#knowledge-breadcrumb','/knowledge/design/systemcabinet#knowledge-breadcrumb'])
assert.equal(searchResultLink({page:guidePage,block:guideArticles},{q:'系統櫃板材比較'}).query.block,'knowledge:系統櫃板材比較')
for(const [id,definitions] of Object.entries(remainingHomeHeadings)){
 const doc=docs.find(d=>d.id===id),snapshot=structuredClone(doc.body)
 const block=home.find(b=>b.fields.some(f=>f.documentId===id))
 const fields=Object.keys(definitions).map(key=>block.fields.find(f=>f.path==='copy.'+key))
 assert(fields.every(Boolean),'Every visible heading needs an editable field')
 assert.deepEqual(fields.map(f=>f.label),Object.values(definitions).map(f=>f.label))
 const original={[id]:doc.body},materialized={[id]:effectiveHomeHeadingBody(id,doc.body)}
 assert.equal(hasPageChanges(home,original,materialized),false,'Default values must not create changes')
 for(const [key,definition] of Object.entries(definitions)){
  const next={...doc.body,copy:{...doc.body.copy,[key]:'編輯 '+key}}
  const change=pageChanges(home,[doc],original,{[id]:next}).find(c=>c.path==='copy.'+key)
  assert.equal(change.before,definition.value)
  assert.equal(change.after,'編輯 '+key)
  assert.equal(change.impacts[0].href,id.endsWith('HomeGallery')?'/#gallery-heading':'/#contact')
  checkPageBody(pageEditors[0],id,doc.body,next,doc.schema)
  validate(next,doc.schema)
  assert.equal(homeRemainingHeading(id,{[key]:''})[key],'','Intentional blank must remain blank')
 }
 assert.deepEqual(doc.body,snapshot,'Reading defaults must preserve archived documents')
}
const promise=docs.find(d=>d.id==='view-components-home-HomeWhatWeDo'),promiseFields=home.find(b=>b.id==='home:品牌承諾').fields
for(const key of ['field1','field2']){
 assert(!promiseFields.some(f=>f.documentId===promise.id&&f.path==='copy.'+key))
 const modified={...promise.body,copy:{...promise.body.copy,[key]:'/decor/other.png'}}
 assert.throws(()=>checkPageBody(pageEditors[0],promise.id,promise.body,modified,promise.schema),/目前頁面以外/)
}
assert(promiseFields.some(f=>f.documentId===promise.id&&f.path==='copy.field8'&&f.schema.destination))
assert(promiseFields.some(f=>f.path==='images.asset_10b5a86c'))
assert.deepEqual(promiseFields.filter(f=>['copy.text3','copy.chineseTitle','copy.text4','copy.text5'].includes(f.path)).map(f=>f.label),['區塊英文標籤','區塊中文主標題','區塊英文主標題（第一段）','區塊英文主標題（第二段）'])
const promiseEdit={...promise.body,copy:{...promise.body.copy,chineseTitle:'品牌承諾驗收'}}
checkPageBody(pageEditors[0],promise.id,promise.body,promiseEdit,promise.schema)
validate(promiseEdit,promise.schema)
assert.equal(pageChanges(home,[promise],{[promise.id]:promise.body},{[promise.id]:promiseEdit}).find(change=>change.path==='copy.chineseTitle').before,'品牌承諾')
const inspiration=workbenchBlocks('inspiration',pageBlocks(pageEditors.find(p=>p.id==='inspiration'),docs))
assert.deepEqual(inspiration.filter(b=>!b.secondary).map(b=>b.name),['主視覺標題','麵包屑編輯設定','案例管理','頁面共用設定'])
const inspirationShared=inspiration.find(b=>b.name==='頁面共用設定')
const inspirationBreadcrumb=inspiration.find(b=>b.preview==='inspiration-breadcrumb')
assert(!inspirationShared.fields.some(f=>['cmsSettings','seo'].includes(f.path)))
assert.equal(inspiration.find(b=>b.secondary&&b.name==='顯示與搜尋設定').fields.length,2)
assert.deepEqual(inspirationBreadcrumb.fields.map(f=>f.path),['copy.breadcrumbHome','copy.breadcrumbList','copy.breadcrumbDetail'])
const breadcrumbDocument=docs.find(d=>d.id==='view-pages-design-inspiration-index')
assert(!Object.hasOwn(breadcrumbDocument.body.copy,'breadcrumbHome'),'Older data must work without a migration')
const breadcrumbEdit=structuredClone(breadcrumbDocument.body)
breadcrumbEdit.copy.breadcrumbHome='網站首頁'
checkPageBody(pageEditors.find(p=>p.id==='inspiration'),breadcrumbDocument.id,breadcrumbDocument.body,breadcrumbEdit,breadcrumbDocument.schema)
validate(breadcrumbEdit,breadcrumbDocument.schema)
assert.deepEqual(changeImpacts([{documentId:breadcrumbDocument.id,path:'copy.breadcrumbHome'}],{caseDetailRoute:'/design-inspiration/sample'}).map(i=>i.href),['/design-inspiration#design-inspiration-breadcrumb','/design-inspiration/sample#design-inspiration-breadcrumb'])
assert.deepEqual(changeImpacts([{documentId:breadcrumbDocument.id,path:'copy.breadcrumbDetail'}],{caseDetailRoute:'/design-inspiration/sample'}).map(i=>i.href),['/design-inspiration/sample#design-inspiration-breadcrumb'])
assert.deepEqual(inspiration.filter(b=>b.preview==='inspiration-cases').flatMap(b=>b.fields.map(f=>f.documentId)),['custom-cases'])
for(const old of ['案例內容','案例管理與顯示排序','案例顯示與順序','案例列表','列表標題與按鈕','整頁共用文字','案例篩選列','搜尋結果提示','案例卡片按鈕','無符合案例提示','案例內頁文字'])assert(inspiration.some(b=>b.aliases.includes('inspiration:'+old)))
for(const i of Array.from({length:11},(_,i)=>i+1))assert.equal(inspiration.flatMap(b=>b.fields).filter(f=>f.documentId==='view-pages-design-inspiration-index'&&f.path==='copy.text'+i).length,1)
const filterFields=inspirationShared.fields.filter(f=>f.formGroup==='案例篩選列')
assert.deepEqual(filterFields.filter(f=>f.schema.advanced).map(f=>f.path),['copy.text2','copy.text3','copy.text4'])
assert.equal(filterFields.find(f=>f.path==='copy.text5').schema.advanced,undefined)
assert(inspirationShared.fields.filter(f=>f.formGroup==='搜尋結果提示').every(f=>f.schema.advanced&&f.schema.readingGroup==='搜尋結果'))
assert.deepEqual(inspirationShared.fields.filter(f=>f.formGroup==='案例卡片按鈕').map(f=>f.path),['copy.text8'])
const cataloguePage=pageEditors.find(p=>p.id==='series-catalogue'),catalogueBlocks=pageBlocks(cataloguePage,docs)
assert.deepEqual(catalogueBlocks.filter(b=>!b.secondary).map(b=>b.name),['主視覺標題','麵包屑編輯設定','型錄管理'])
const [catalogueHero,catalogueTrail,catalogueList]=catalogueBlocks
assert(catalogueHero.aliases.includes('series-catalogue:頁面最上方'))
assert(catalogueList.aliases.includes('series-catalogue:型錄封面與下載'))
assert.equal(catalogueList.hint,'管理型錄封面、預覽與下載檔案')
assert(catalogueList.fields.some(f=>f.documentId==='data-catalogues'&&f.path==='KITCHEN_CATALOGUES'))
assert.deepEqual(catalogueTrail.fields.map(f=>f.path),['copy.breadcrumbHome','copy.breadcrumbList'])
const catalogueCopy=docs.find(d=>d.id==='view-pages-catalogues-kitchenware-catalog')
const catalogueCopyEdit={...catalogueCopy.body,copy:{...catalogueCopy.body.copy,breadcrumbList:'系列型錄'}}
checkPageBody(cataloguePage,catalogueCopy.id,catalogueCopy.body,catalogueCopyEdit,catalogueCopy.schema)
validate(catalogueCopyEdit,catalogueCopy.schema)
assert.deepEqual(changeImpacts([{documentId:catalogueCopy.id,path:'copy.breadcrumbList'}]).map(i=>i.href),[catalogueTrail.href])
for(const id of ['series-catalogue','product-catalogue','builder-catalogues']){
 const block=id==='series-catalogue'?catalogueList:pageBlocks(pageEditors.find(p=>p.id===id),docs).find(b=>b.name==='型錄管理')
 assert.equal(block.fields.find(f=>f.path==='copy.text2')?.schema.readingGroup,'型錄區塊')
 assert(block.fields.find(f=>f.path==='copy.text2')?.schema.advanced)
 assert(block.fields.some(f=>f.label==='下載按鈕文字'&&!f.schema.advanced))
}
const builderCataloguePage=pageEditors.find(p=>p.id==='builder-catalogues')
const productCataloguePage=pageEditors.find(p=>p.id==='product-catalogue')
const [productHero,productTrail,productCards,productCare]=pageBlocks(productCataloguePage,docs)
assert.deepEqual([productHero.name,productTrail.name,productCards.name,productCare.name],['主視覺標題','麵包屑編輯設定','型錄管理','清潔與保養問答'])
const productDoc=docs.find(d=>d.id===productCatalogueDocument)
const productEdit={...productDoc.body,copy:{...productDoc.body.copy,careChineseTitle:'我的選購指南',kitchenwareTitle:'配備型錄測試'}}
validate(productEdit,productDoc.schema)
checkPageBody(productCataloguePage,productDoc.id,productDoc.body,productEdit,productDoc.schema)
assert(productCare.fields.some(f=>f.path==='copy.careChineseTitle'&&f.label===headingFieldLabel(productCatalogueFields.careChineseTitle.label)))
assert.equal(productCatalogueText(productDoc.body.copy,'careChineseTitle'),'廚房選購指南')
assert.equal(productCatalogueTitle({id:'kitchenware-2026',title:'推薦卡片名稱'},productEdit.copy),'配備型錄測試')
assert.deepEqual(changeImpacts([{documentId:productDoc.id,path:'copy.careChineseTitle'}]).map(i=>i.href),[productCare.href])
assert.equal(cataloguePreviewHref('/media/4c8ad00e-af11-43b1-856c-a49569fe3681'),'/media/4c8ad00e-af11-43b1-856c-a49569fe3681?preview=1')
assert.equal(cataloguePreviewHref('https://example.test/file.pdf'),'https://example.test/file.pdf')
const [builderCatalogueHero,builderCatalogueTrail,builderCatalogueCards]=pageBlocks(builderCataloguePage,docs)
assert.deepEqual([builderCatalogueHero.name,builderCatalogueTrail.name,builderCatalogueCards.name],['主視覺標題','麵包屑編輯設定','型錄管理'])
assert(builderCatalogueCards.aliases.includes('builder-catalogues:型錄封面與下載'))
assert.equal(builderCatalogueCards.hint,'管理型錄封面、預覽與下載檔案')
assert.deepEqual(builderCatalogueTrail.fields.map(f=>f.path),['copy.breadcrumbHome','copy.breadcrumbParent','copy.breadcrumbList'])
const builderCatalogueDoc=docs.find(doc=>doc.id==='view-pages-builders-catalogues')
const builderTrailEdit={...builderCatalogueDoc.body,copy:{...builderCatalogueDoc.body.copy,breadcrumbParent:' 建商合作 ',breadcrumbList:' '}}
assert.deepEqual(builderCatalogueBreadcrumb(builderTrailEdit.copy),{breadcrumbHome:'首頁',breadcrumbParent:'建商合作',breadcrumbList:'建商專區型錄'})
validate(builderTrailEdit,builderCatalogueDoc.schema)
checkPageBody(builderCataloguePage,builderCatalogueDoc.id,builderCatalogueDoc.body,builderTrailEdit,builderCatalogueDoc.schema)
assert.deepEqual(changeImpacts([{documentId:builderCatalogueDoc.id,path:'copy.breadcrumbParent'}]).map(i=>i.href),[builderCatalogueTrail.href])
const builderNoticeEdit={...builderCatalogueDoc.body,copy:{...builderCatalogueDoc.body.copy,noticeFirst:' 供工程專案選用。 ',noticeSecond:' '}}
const noticePaths=Object.keys(builderCatalogueNoticeFields).map(key=>'copy.'+key)
assert.deepEqual(builderCatalogueCards.fields.filter(f=>noticePaths.includes(f.path)&&!f.schema.advanced).map(f=>f.path),noticePaths)
validate(builderNoticeEdit,builderCatalogueDoc.schema)
checkPageBody(builderCataloguePage,builderCatalogueDoc.id,builderCatalogueDoc.body,builderNoticeEdit,builderCatalogueDoc.schema)
const builderNoticeChanges=pageChanges([builderCatalogueCards],[builderCatalogueDoc],{[builderCatalogueDoc.id]:builderCatalogueDoc.body},{[builderCatalogueDoc.id]:builderNoticeEdit})
assert.equal(builderNoticeChanges.find(c=>c.path==='copy.noticeFirst').before,builderCatalogueNoticeFields.noticeFirst.fallback)
assert.equal(builderNoticeChanges.find(c=>c.path==='copy.noticeFirst').after,'供工程專案選用。')
assert.equal(builderCatalogueNotice(builderNoticeEdit.copy,'noticeSecond'),builderCatalogueNoticeFields.noticeSecond.fallback)
assert.deepEqual(changeImpacts(builderNoticeChanges).map(i=>i.href),['/builders/catalogues#'+builderCatalogueNoticeAnchor])
const builderSeriesBlocks=pageBlocks(pageEditors.find(p=>p.id==='builder-series'),docs)
assert.deepEqual(builderSeriesBlocks.filter(b=>!b.secondary).map(b=>b.name),['主視覺標題','品牌承諾入口','品牌優勢','品牌系列'])
assert(builderSeriesBlocks[0].aliases.includes('builder-series:頁面最上方'))
assert(builderSeriesBlocks[0].fields.find(f=>f.path==='copy.field4').schema.previewTone==='dark')
const identity=pageBlocks(pageEditors.find(p=>p.id==='about'),docs).find(b=>b.name==='專屬品牌識別')
assert(!identity.fields.some(f=>f.path==='copy.field10'),'Fixed modal placement is not an editable field')
const previewBodies=Object.fromEntries(docs.map(d=>[d.id,structuredClone(d.body)])),presentation={heroImage:'/hero.jpg',cases:[{title:'真實案例',image:'/case.jpg'}]},serialized=JSON.stringify(presentation)
const menu=workbenchBlocks('menu',pageBlocks(pageEditors.find(p=>p.id==='menu'),docs))
assert.deepEqual(menu.slice(0,3).map(b=>b.name),['左側主導覽','右側主導覽','品牌系列選單設定'])
assert(menu[0].aliases.includes('menu:左側主選單')&&menu[0].aliases.includes('menu:展開選單中的型錄入口'))
assert.deepEqual(menu[0].fields.map(f=>f.path),['leftNav','copy.text2','copy.field1'])
const header=previewBodies['view-components-SiteHeader']
assert(menu.some(b=>b.name==='手機選單文字'&&b.fields.some(f=>f.path==='copy.field19')))
assert.equal(pagePositionContent(menu[0],previewBodies,{}, {value:header.leftNav.find(i=>i.mega)}).buttons[0].value,header.copy.text2)
assert.equal(pagePositionContent(menu[0],previewBodies,{}, {value:header.leftNav.find(i=>!i.mega)}).buttons.length,0)
const heroSchema=home.find(b=>b.id==='home:主視覺輪播').fields.find(f=>f.path==='slides').schema
assert.equal(heroSchema.label,'輪播內容');assert.equal(heroSchema.searchLabel,'搜尋輪播名稱')
const heroBefore=JSON.stringify(previewBodies),heroSelected={documentId:'view-components-home-HomeHero',path:'slides',index:1,value:{image:'/selected-home.webp',title:'所選輪播',description:'目前的介紹',mobileImage:'/mobile-home.webp',desktopFocusX:20}}
const heroScene=homeHeroPosition(previewBodies,heroSelected)
assert.equal(heroScene.slide.title,'所選輪播');assert.equal(heroScene.slide.image,'/selected-home.webp');assert.equal(heroScene.slide.mobileImage,'/mobile-home.webp');assert.equal(heroScene.slide.desktopFocusX,20);assert.equal(heroScene.pan,'4%')
assert.equal(homeHeroPosition(previewBodies).slide.title,previewBodies['view-components-home-HomeHero'].slides[0].title);assert.equal(homeHeroPosition(previewBodies).pan,'-4%');assert.equal(homeHeroPosition({}).slide,undefined)
assert.equal(homeHeroPosition(previewBodies,{documentId:'other',value:{title:'無關內容'}}).slide.title,previewBodies['view-components-home-HomeHero'].slides[0].title);assert.equal(JSON.stringify(previewBodies),heroBefore,'Home position views cannot modify shared content')
assert(homeHeroPosition(previewBodies).styles.length);assert.equal(homeHeroPosition({'view-components-home-HomeStyleMarquee':{styles:[{}],cmsSettings:{visible:false}}}).styles.length,0)
const heroCommon=home.find(b=>b.id==='home:主視覺輪播').fields
assert.equal(heroCommon.find(f=>f.path==='copy.text8').label,'滑過時按鈕文字（第一行）');assert(heroCommon.filter(f=>/^copy.field[1-4]$/.test(f.path)).every(f=>f.schema.advanced))
previewBodies['view-pages-design-inspiration-index'].copy.text5='套用篩選';previewBodies['view-pages-design-inspiration-index'].copy.text9='沒有符合的案例'
{
 const library=[{slug:'store-x',store:'門市甲',title:'門市作品',image:'/store.jpg',route:'/gallery/store-x',source:'門市案例'},{slug:'cloud-x',title:'同步作品',image:'/cloud.jpg',route:'/design-inspiration/cloud-x',source:'來源案例'},{slug:'removed',title:'待刪除案例',route:'/design-inspiration/removed',source:'自建案例'}]
 const custom=[{key:'draft',index:4,value:{id:'draft',title:'草稿作品',cover:'/draft.jpg',enabled:false}}],original=JSON.stringify({library,custom})
 const rows=caseManagementRows(library,custom)
 assert.equal(rows.length,4);assert.equal(rows.find(r=>r.slug==='draft').customRow.index,4)
 assert.equal(rows.find(r=>r.slug==='removed').draftRemoved,true)
 assert.equal(caseManagementRows([],[],[{id:'newly-published',title:'剛刊登的案例',enabled:true},{id:'hidden',enabled:false}])[0].draftRemoved,true,'Published custom records remain listed when removed from the current draft before reloading the page')
 assert.equal(filterCaseManagement(rows,'系統同步','同步').length,1)
 assert.equal(filterCaseManagement(rows,'門市案例','門市甲')[0].slug,'store-x')
 assert.equal(filterCaseManagement(rows,'自建案例').length,2)
 const link=storeCaseManagementLink(rows[0],{q:'舊搜尋',item:'old',list:'old',casePage:'99'},{source:'門市案例',search:'門市甲',page:2})
 assert.equal(link.query.sitePage,'store-cases');assert.equal(link.query.block,'store-cases:案例管理');assert.equal(link.query.list,'data-storeCases:storeCases');assert.equal(link.query.item,'store-x')
 assert.deepEqual(caseManagementReturn(link.query),{path:'/admin/content',query:{section:'design',sitePage:'inspiration',block:'inspiration:案例管理',caseSource:'門市案例',caseQuery:'門市甲',casePage:'2'}})
 assert.equal(storeCaseManagementLink(rows.find(r=>r.source==='系統同步')),undefined)
 assert.equal(caseManagementReturn({returnToCases:'https://evil.invalid'}),undefined)
 assert.equal(caseManagementReturn({returnToCases:'1',caseSource:'invalid',casePage:'-1'}).query.casePage,undefined)
 const selected=rows.find(r=>r.source==='系統同步')
 assert.equal(inspirationPosition({}, {cases:library.slice(0,1)}, {caption:selected.title,source:selected.source,image:selected.image,value:{id:selected.slug}}).cases[0].source,'系統同步')
 assert.equal(JSON.stringify({library,custom}),original,'Combining cases must never copy external records into the custom document')
}
const samplePosition=inspirationPosition(previewBodies,presentation)
assert.equal(samplePosition.copy.text5,'套用篩選');assert.equal(samplePosition.copy.text9,'沒有符合的案例');assert.equal(samplePosition.cases[0].title,'真實案例')
assert.equal(inspirationPosition(previewBodies,presentation,{caption:'正在編輯',image:'/selected.jpg'}).cases[0].image,'/selected.jpg');assert.equal(JSON.stringify(presentation),serialized,'The schematic cannot mutate published case samples')
const publishedCase={slug:'case-1',title:'已發布標題',source:'自建案例',image:'/published.jpg'}
const selectedCase={caption:'修改中的標題',image:'/selected.jpg',value:{id:'case-1',description:'修改中的介紹',enabled:false}}
const caseCards=inspirationPosition(previewBodies,{cases:[publishedCase,{slug:'store-1',source:'門市案例'}]},selectedCase).cases
assert.deepEqual(caseCards.map(c=>[c.slug,c.source]),[['case-1','自建案例'],['store-1','門市案例']])
assert.equal(caseCards[0].description,'修改中的介紹')
assert.equal(caseCards[0].enabled,false)

const builders=workbenchBlocks('builders',pageBlocks(pageEditors.find(p=>p.id==='builders'),docs)),builderHero=builders[0]
assert.equal(builderHero.id,'builders:主視覺標題')
assert(builderHero.aliases.includes('builders:頁面最上方'))
assert.equal(builderHero.href,'/builders#builders-title')
assert(builderHero.fields.some(f=>f.documentId==='data-builders'&&f.path==='BUILDER_APPOINTMENT_HASH'))
assert(!builders.some(block=>block.id==='builders:頁面最上方'))
assert(builderHero.fields.some(f=>f.path==='copy.field6'),'Builder hero image must be beside its heading, not in brand information')
previewBodies['view-pages-builders-index'].copy.text2='目前輸入的建商標題';previewBodies['view-pages-builders-index'].copy.field6='/changed-builder.webp'
const builderScene=pagePositionContent(builderHero,previewBodies,{heroImage:'/published-builder.webp'})
assert(builderScene.text.some(t=>t.value==='目前輸入的建商標題'));assert.equal(builderScene.image,'/changed-builder.webp');assert.equal(builderScene.heroImage,'/changed-builder.webp')
const builderBrand=builders.find(b=>b.name==='廚房品牌介紹')
assert.equal(builderBrand.href,'/builders#builders-team-title')
assert.equal(builderBrand.kind,'builders-brand-intro')
assert.equal(builderBrand.fields.find(f=>f.path==='copy.text9').label,'區塊中文主標題')
const brandScene=pagePositionContent(builderBrand,previewBodies)
assert.deepEqual(brandScene.heading,[{path:'copy.text9',label:'區塊中文主標題',value:previewBodies['view-pages-builders-index'].copy.text9}])
assert.equal(brandScene.mappedImage,previewBodies['data-builders'].builderProjectCards[0].image)
const iCare=builders.find(b=>b.id==='builders:SAKURA iCare')
assert(iCare.aliases.includes('builders:售後服務'))
assert.equal(iCare.href,'/builders#builders-icare')
assert.deepEqual(iCare.fields.filter(f=>!f.schema.advanced).map(f=>f.path),['copy.field28'])
assert.equal(iCare.fields.find(f=>f.path==='copy.field29').schema.imageReading,true)
const iCareScene=pagePositionContent(iCare,previewBodies)
const iCareCopy=previewBodies['view-pages-builders-index'].copy
assert.equal(iCareScene.image,iCareCopy.field28)
assert.equal(iCareScene.texts.length,0)
assert.deepEqual(iCareScene.auxiliary.map(f=>[f.path,f.value]),[['copy.text24',iCareCopy.text24],['copy.field29',iCareCopy.field29]])
assert.deepEqual(changeImpacts(iCare.fields).map(i=>i.href),['/builders#builders-icare'])
const strengthsBlock=builders.find(b=>b.id==='builders:智能整合')
const strengthsDocument=docs.find(d=>d.id===builderStrengthsDocument)
const strengthsPage=pageEditors.find(p=>p.id==='builders')
const originalStrengths=strengthsDocument.body
const appointmentBlock=builders.find(b=>b.id==='builders:品牌館資訊與預約')
assert(appointmentBlock.aliases.includes('builders:聯繫與參觀預約'))
assert.equal(appointmentBlock.href,'/builders#appointment')
assert.deepEqual(appointmentBlock.fields.slice(0,5).map(f=>f.path),['copy.text33',...Object.keys(builderAppointmentHeadingFields).map(key=>'copy.'+key)])
const originalAppointment=builderAppointmentHeading(originalStrengths.copy)
assert.deepEqual(originalAppointment,{eyebrow:'Explore Our',chinese:'櫻花集團品牌館',firstText:'The Art ',firstAccent:'Of',secondAccent:'Kitchen',secondText:' Showrooms'})
const appointmentEdit=structuredClone(originalStrengths)
appointmentEdit.copy.appointmentChineseTitle='品牌館標題驗收'
appointmentEdit.copy.appointmentEnglishTitleFirst='  '
validate(appointmentEdit,strengthsDocument.schema)
checkPageBody(strengthsPage,strengthsDocument.id,originalStrengths,appointmentEdit,strengthsDocument.schema)
assert.deepEqual(builderAppointmentHeading(appointmentEdit.copy),{...originalAppointment,chinese:'品牌館標題驗收'})
const appointmentChanges=pageChanges(builders,[strengthsDocument],{[strengthsDocument.id]:originalStrengths},{[strengthsDocument.id]:appointmentEdit})
assert(appointmentChanges.some(change=>change.path==='copy.appointmentChineseTitle'&&change.before===originalAppointment.chinese&&change.impacts[0].href==='/builders#appointment'))
assert(strengthsBlock.aliases.includes('builders:建商實力'))
assert.equal(strengthsBlock.href,'/builders#builders-capability-title')
assert.deepEqual(strengthsBlock.fields.map(f=>f.path),['strengths',...Object.keys(builderStrengthsCopy()).map(key=>'copy.'+key)])
const strengthEdit=structuredClone(originalStrengths)
strengthEdit.copy.strengthsChineseTitle='智能整合自訂標題'
assert.equal(builderStrengthsCopy({strengthsChineseTitle:'  '}).strengthsChineseTitle,'智能整合，打造建築新價值')
assert.equal(builderStrengthsCopy(strengthEdit.copy).strengthsChineseTitle,'智能整合自訂標題')
validate(originalStrengths,strengthsDocument.schema)
validate(strengthEdit,strengthsDocument.schema)
checkPageBody(strengthsPage,builderStrengthsDocument,originalStrengths,strengthEdit,strengthsDocument.schema)
const edits=pageChanges(builders,[strengthsDocument],{[builderStrengthsDocument]:originalStrengths},{[builderStrengthsDocument]:strengthEdit})
assert.deepEqual(edits.map(e=>[e.location,e.label,e.before,e.after,e.impacts[0].href]),[['智能整合','區塊中文主標題','智能整合，打造建築新價值','智能整合自訂標題','/builders#builders-capability-title']])
const badBuilder=structuredClone(previewBodies['view-pages-builders-index']);badBuilder.copy.text2=42
const builderSchema=docs.find(d=>d.id==='view-pages-builders-index').schema
assert.throws(()=>validate(badBuilder,builderSchema),e=>{const issue=readableError(e,'view-pages-builders-index',editingSchema(builderSchema,'view-pages-builders-index'),badBuilder);assert.equal(issue.fieldErrors[0].path,'copy.text2');assert.match(issue.message,/區塊中文主標題（第一段）/);return true})
const franchise=workbenchBlocks('franchise',pageBlocks(pageEditors.find(p=>p.id==='franchise'),docs))
{
 const formPage=pageEditors.find(p=>p.id==='franchise-form')
 const block=pageBlocks(formPage,docs).find(b=>b.kind==='franchise-application')
 assert.equal(block.name,'加盟申請表單')
 assert(block.aliases.includes('franchise-form:申請表單上方'))
 assert.equal(block.href,'/franchising/form#franchise-application-title')
 assert.deepEqual(block.fields.slice(0,2).map(f=>f.label),['區塊英文標籤','區塊中文主標題'])
 const copy=previewBodies['view-pages-franchising-form'].copy
 const scene=pagePositionContent(block,previewBodies)
 assert.equal(scene.heading.find(f=>f.path==='copy.text2').value,copy.text2)
 assert.deepEqual(scene.buttons.map(f=>f.value),[copy.text5])
 assert.equal(scene.destination.value,copy.field4)
}
{
 const page=pageEditors.find(p=>p.id==='franchise'),block=franchise.find(b=>b.kind==='franchise-news')
 const body=structuredClone(newsDoc.body),draft=structuredClone(body),unrelated=body.items.findIndex(i=>!franchiseNewsIds.includes(i.id))
 const article=draft.items.find(i=>i.id===franchiseNewsIds[0])
 assert(!page.unpublishIds.includes(newsDoc.id))
 assert.equal(block.href,'/franchising/intro#franchise-news-title')
 assert.deepEqual(block.fields.map(f=>f.path).sort(),['copy.field62','copy.text58','copy.text63','items'])
 const items=pageSearchItems(block,{[newsDoc.id]:body})
 assert.deepEqual(items.map(i=>i.key).sort(),franchiseNewsIds.slice().sort())
 const publishedIds=franchiseNewsIds.filter(id=>body.items.some(i=>i.id===id&&i.enabled))
 assert.deepEqual(pagePositionContent(block,{[newsDoc.id]:body}).items.map(i=>i.id),publishedIds)
 article.summary.title='加盟文章草稿'
 checkPageBody(page,newsDoc.id,body,draft,newsDoc.schema)
 assert.equal(pagePositionContent(block,{[newsDoc.id]:draft}).items[0].title,article.summary.title)
 const outOfScope=structuredClone(draft)
 outOfScope.items[unrelated].summary.title='其他文章草稿'
 assert.throws(()=>checkPageBody(page,newsDoc.id,draft,outOfScope,newsDoc.schema),/只可修改官網引用的加盟文章/)
 assert.throws(()=>checkPageBody(page,newsDoc.id,body,{items:draft.items.toReversed()},newsDoc.schema),/只可修改官網引用的加盟文章/)
 assert(!hasPageChanges(franchise,{[newsDoc.id]:draft},{[newsDoc.id]:outOfScope}))
 const review=publishReview(franchise,[{...newsDoc,body:outOfScope,publishedBody:body}],{[newsDoc.id]:outOfScope})
 assert(review.saved.some(c=>c.after==='其他文章草稿'&&c.blockId!==block.id))
}
const downloadEntry=franchise.find(b=>b.name==='加盟資料下載入口')
assert(downloadEntry.fields.some(f=>f.path==='copy.field53'))
assert(downloadEntry.aliases.includes('franchise:加盟資料下載'))
assert.equal(downloadEntry.href,'/franchising/intro#franchise-faq-title')
const downloadPage=pageEditors.find(p=>p.id==='franchise-download')
const downloadBlocks=workbenchBlocks('franchise-download',pageBlocks(downloadPage,docs))
const downloadHero=downloadBlocks.find(b=>b.name==='主視覺標題')
const downloadDocument=downloadBlocks.find(b=>b.kind==='franchise-download-document')
const downloadCatalogue=downloadBlocks.find(b=>b.name==='型錄管理')
const downloadBreadcrumb=downloadBlocks.find(b=>b.name==='麵包屑編輯設定')
assert.deepEqual(downloadBlocks.filter(b=>!b.secondary).map(b=>b.name),['主視覺標題','麵包屑編輯設定','型錄管理','區塊共用設定'])
assert(downloadHero.aliases.includes('franchise-download:頁面最上方'))
assert.equal(downloadHero.href,'/franchising/download#franchise-download-title')
assert.deepEqual(downloadHero.fields.filter(f=>f.path.startsWith('copy.text')).map(f=>[f.path,f.label]),[['copy.text3','區塊英文標籤'],['copy.text4','區塊英文主標題']])
assert.equal(pagePositionContent(downloadHero,previewBodies).image,previewBodies['view-pages-franchising-download'].copy.field1)
assert(downloadDocument.aliases.includes('franchise-download:加盟簡介與檔案'))
assert(['加盟簡介與下載按鈕','型錄載入提示','頁面底部返回按鈕'].every(name=>downloadDocument.aliases.includes('franchise-download:'+name)))
assert.equal(downloadDocument.href,'/franchising/download#franchise-document-title')
assert.deepEqual(downloadDocument.fields.slice(0,2).map(f=>[f.path,f.label]),[['copy.text5','區塊中文主標題（第一段）'],['copy.text6','區塊中文主標題（第二段）']])
assert.deepEqual(downloadCatalogue.fields.map(f=>f.path),['brochurePages','FRANCHISE_BROCHURE_URL'])
assert(downloadCatalogue.aliases.includes('franchise-download:型錄預覽圖片'))
assert.equal(downloadCatalogue.href,'/franchising/download#franchise-catalogue-preview')
assert.equal(downloadBreadcrumb.href,'/franchising/download#franchise-download-breadcrumb')
assert.deepEqual(downloadBreadcrumb.fields.map(f=>f.path),['copy.breadcrumbHome','copy.breadcrumbParent','copy.breadcrumbList'])
assert.deepEqual(franchiseDownloadBreadcrumb({breadcrumbHome:' ',breadcrumbParent:' 合作專區 ',breadcrumbList:''}),{breadcrumbHome:'首頁',breadcrumbParent:'合作專區',breadcrumbList:'加盟資料下載'})
{
 const doc=docs.find(d=>d.id==='view-pages-franchising-download')
 validate(doc.body,doc.schema)
 const draft={...doc.body,copy:{...doc.body.copy,breadcrumbParent:'合作專區'}}
 checkPageBody(downloadPage,doc.id,doc.body,draft,doc.schema)
 validate(draft,doc.schema)
 assert.deepEqual(draft.brochurePages,doc.body.brochurePages)
}
{
 const page=pageEditors.find(p=>p.id==='franchise'),support=franchise.find(b=>b.name==='總部支援')
 const intro=docs.find(d=>d.id==='view-pages-franchising-intro'),visuals=docs.find(d=>d.id==='site-visuals')
 assert.equal(support.href,'/franchising/intro#franchise-support')
 assert.deepEqual(support.fields.filter(f=>f.schema.type==='string').map(f=>f.label),['按鈕文字','前往頁面','總部支援背景圖片'])
 assert.equal(pagePositionContent(support,previewBodies).destination.value,previewBodies['data-franchise'].FRANCHISE_FORM_URL)
 assert.equal(pagePositionContent(support,previewBodies).mappedImage,visuals.body.images.asset_1795db00)
 const edited={...intro.body,copy:{...intro.body.copy,supportDestination:'/franchising/download'}}
 validate(edited,intro.schema);checkPageBody(page,intro.id,intro.body,edited,intro.schema)
 assert.equal(pagePositionContent(support,{...previewBodies,[intro.id]:edited}).destination.value,'/franchising/download')
 const newVisuals={...visuals.body,images:{...visuals.body.images,asset_1795db00:'/replaced-support.webp'}}
 checkPageBody(page,visuals.id,visuals.body,newVisuals,visuals.schema)
 assert.equal(pagePositionContent(support,{...previewBodies,[visuals.id]:newVisuals}).mappedImage,'/replaced-support.webp')
 assert.throws(()=>checkPageBody(page,visuals.id,visuals.body,{...newVisuals,images:{...newVisuals.images,asset_7692def0:'/unrelated.webp'}},visuals.schema),/頁面以外/)
}
{
 const page=pageEditors.find(p=>p.id==='franchise'),doc=docs.find(d=>d.id==='view-pages-franchising-intro'),marquee=franchise.find(b=>b.kind==='franchise-marquee')
 assert.deepEqual([franchise[0].name,franchise[2].name,franchise[5].name],['主視覺標題','加盟介紹輪播圖','品牌信賴'])
 for(const [index,oldName] of [[0,'頁面最上方'],[2,'品牌成果圖片'],[5,'品牌信賴與行銷']])assert(franchise[index].aliases.includes('franchise:'+oldName))
 assert.equal(marquee.href,'/franchising/intro#franchise-intro-marquee')
 assert.equal(blockThumbnail(marquee,previewBodies),doc.body.copy.field18)
 for(const [original,loop,other,alt] of [['field18','field20','field22','field19'],['field22','field24','field18','field23']]){
  const image='/section-6/franchise/hero-store.jpg',body=structuredClone(doc.body)
  body.copy[loop]=body.copy[original]
  const changed=updateFranchiseMarqueeImage(body,'copy.'+original,image)
  assert.equal(changed.copy[original],image);assert.equal(changed.copy[loop],image)
  assert.equal(changed.copy[other],body.copy[other]);assert.equal(changed.copy[alt],body.copy[alt])
  checkPageBody(page,doc.id,body,changed,doc.schema)
  const independent=updateFranchiseMarqueeImage({...body,copy:{...body.copy,[loop]:'/custom-loop.webp'}},'copy.'+original,image)
  assert.equal(independent.copy[loop],'/custom-loop.webp')
 }
}
const faqScene=pagePositionContent(franchise.find(b=>b.name==='了解加盟資訊'),previewBodies,{}, {caption:'申請條件',image:'',value:{question:'如何申請？',answer:'先填表'}})
assert.equal(faqScene.image,previewBodies['view-pages-franchising-intro'].copy.field53)
assert.equal(faqScene.items[0].value.answer,'先填表')
{
 const block=franchise.find(b=>b.name==='了解加盟資訊'),page=pageEditors.find(p=>p.id==='franchise')
 const doc=docs.find(d=>d.id==='view-pages-franchising-intro'),target='/franchising/form'
 assert(block.aliases.includes('franchise:加盟常見問題'))
 assert.equal(block.href,'/franchising/intro#franchise-faq-title')
 const previous={...doc.body,copy:{...doc.body.copy,field52:'/franchising/download',field55:'/franchising/download'}}
 const paired=updateFranchiseFaqDestination(previous,target)
 assert.equal(paired.copy.field52,target)
 assert.equal(paired.copy.field55,target)
 assert.equal(paired.copy.field53,previous.copy.field53)
 checkPageBody(page,doc.id,previous,paired,doc.schema)
 const independent={...previous,copy:{...previous.copy,field55:'/news'}}
 assert.equal(updateFranchiseFaqDestination(independent,target).copy.field55,'/news')
}
const pavilion=workbenchBlocks('pavilions',pageBlocks(pageEditors.find(p=>p.id==='pavilions'),docs)).find(b=>b.name==='品牌館空間介紹')
previewBodies['view-pages-about-exhibition'].copy.field7='/right-pavilion-photo.webp'
assert.equal(pagePositionContent(pavilion,previewBodies,{},null,'copy.field7').image,'/right-pavilion-photo.webp','Focusing the second photo must show that photo, not the first one')
assert.notEqual(thumbnailPlaceholder('申請表單'),thumbnailPlaceholder('品牌優勢問答'));assert.notEqual(thumbnailPlaceholder('網站選單'),thumbnailPlaceholder('板材比較'))
const activities=workbenchBlocks('news-activities',pageBlocks(pageEditors.find(p=>p.id==='news-activities'),docs)).find(b=>b.name==='活動管理')
assert.equal(blockThumbnail(activities,previewBodies),previewBodies['news-articles'].items.find(i=>i.summary.category==='activities').summary.cover,'A category thumbnail cannot borrow another category cover')
const products=workbenchBlocks('products-sakura',pageBlocks(pageEditors.find(p=>p.id==='products-sakura'),docs)).find(b=>b.name==='商品顯示與排序')
const productId=previewBodies['catalog-sakura'].items[0].id,productScene=pagePositionContent(products,previewBodies,{rows:{'catalog-sakura':{[productId]:{image:'/real-source-product.webp'}}}})
assert.equal(productScene.thumbnail,'/real-source-product.webp');assert.equal(productScene.items[0].image,'/real-source-product.webp');assert(!previewBodies['catalog-sakura'].items[0].image,'Read-only source images must never become editable content')
assert.equal(itemCaption({year:'1978'},0),'1978 年');assert.equal(itemCaption({value:['45','萬'],lines:['設計模組']},0),'45 萬 · 設計模組')
const homeOne=builders.find(b=>b.id==='builders:HOME IN ONE')
const [homeOneBanner,homeOneMontage]=builderHomeOneImages
assert(homeOne.aliases.includes('builders:三大服務'))
assert.equal(homeOne.href,'/builders#'+homeOneBanner.anchor)
const serviceScene=pagePositionContent(homeOne,previewBodies)
assert.equal(serviceScene.thumbnail,homeOneBanner.originalImage)
assert.deepEqual(serviceScene.media.map(media=>media.image),[homeOneBanner.originalImage,homeOneMontage.originalImage])
assert.equal(homeOne.fields.filter(f=>f.schema.imageReading).length,2)
const serviceEdit=structuredClone(originalStrengths)
serviceEdit.copy[homeOneMontage.imageKey]='/changed-builder.webp'
validate(serviceEdit,strengthsDocument.schema)
checkPageBody(strengthsPage,builderStrengthsDocument,originalStrengths,serviceEdit,strengthsDocument.schema)
assert.deepEqual(builderHomeOneImage(serviceEdit.copy,homeOneMontage),{src:'/changed-builder.webp',alt:homeOneMontage.label})
const serviceChanges=pageChanges(builders,[strengthsDocument],{[builderStrengthsDocument]:originalStrengths},{[builderStrengthsDocument]:serviceEdit})
assert.deepEqual(serviceChanges.map(e=>[e.before,e.after,e.impacts[0].href]),[[homeOneMontage.originalImage,'/changed-builder.webp','/builders#'+homeOneMontage.anchor]])
assert.equal(serviceScene.mappedImage,serviceScene.image,'The shared section photo must display above the text cards')
const builderDataDocument=docs.find(d=>d.id==='data-builders')
assert(!builders.some(b=>b.name==='合作夥伴'||b.fields.some(f=>f.path==='builderPartners')))
assert.equal(searchPages([pageSummary(strengthsPage,[],docs)],'合作夥伴').length,0)
for(const legacy of [{block:'builders:合作夥伴'},{list:'data-builders:builderPartners',item:'0'},{create:'data-builders:builderPartners'}])
 assert.deepEqual(retiredBuilderPartnersRedirect({sitePage:'builders',...legacy}),{path:'/admin/content',query:{section:'builders',sitePage:'builders',block:'builders:主視覺標題'}})
assert.equal(retiredBuilderPartnersRedirect({sitePage:'builders',block:'builders:SAKURA iCare'}),undefined)
const archivedEdit=structuredClone(builderDataDocument.body)
archivedEdit.builderPartners[0].name='已停用的編輯欄位'
assert.throws(()=>checkPageBody(strengthsPage,builderDataDocument.id,builderDataDocument.body,archivedEdit,builderDataDocument.schema),/目前頁面以外的內容/)
assert.deepEqual(pageChanges(builders,[builderDataDocument],{'data-builders':builderDataDocument.body},{'data-builders':archivedEdit}),[])
assert.equal(itemWebsitePath('data-storeCases','臺北市'),'','County selection keeps the filter position instead of linking to a case detail')
assert.equal(itemWebsitePath('data-storeCases',{slug:'songzhu'}),'/gallery/songzhu')
const storeRegions=pageBlocks(pageEditors.find(p=>p.id==='stores'),docs).find(b=>b.name==='區域與縣市')
assert.equal(storeRegions.kind,'filter')
assert.equal(storeRegions.fields[0].path,'regionCities')
assert.deepEqual(Object.keys(storeRegions.fields[0].schema.fields),['北部','中部','南部','東部','離島'])
assert.equal(storeRegions.fields[0].schema.fields['中部'].item.label,'縣市名稱')
const serviceEditor=pageEditors.find(p=>p.id==='service'),serviceBlocks=pageBlocks(serviceEditor,docs).filter(b=>!b.secondary)
assert.deepEqual(serviceBlocks.map(b=>b.name),['主視覺標題','服務流程','品牌影片','服務指南'])
for(const [name,oldName,anchor,field] of [
 ['服務流程','服務流程與介紹','service-intro-title','serviceSteps'],
 ['品牌影片','服務介紹影片','service-brand-video','serviceVideoSrc'],
 ['服務指南','服務指南問答','service-guide','faqGroups'],
]){
 const block=serviceBlocks.find(b=>b.name===name)
 assert(block.aliases.includes('service:'+oldName))
 assert.equal(block.href,'/service-process#'+anchor)
 assert(block.fields.some(f=>f.path===field))
 assert.equal(searchPages([pageSummary(serviceEditor,[],docs)],oldName)[0].block.id,block.id)
}
const serviceVideo=serviceBlocks.find(b=>b.kind==='video')
const legacyVideo={...serviceVideo,fields:serviceVideo.fields.filter(f=>f.documentId!=='site-visuals')}
assert.equal(pagePositionContent(legacyVideo,{},{serviceVideoCover:'/service-poster.webp'}).image,'/service-poster.webp')
const newsOverview=pageSummary(pageEditors.find(p=>p.id==='news'),[],docs)
const overviewSections=[
 ['最新消息列表','全部消息列表','news-list-title',['items','copy.text2']],
 ['最新消息分類標籤','消息分類選單','news-tags-title',['newsCategories','copy.text3']],
 ['最新文章','最近文章推薦','sidebar-recent-title',['copy.text4']],
]
assert.deepEqual(newsOverview.blocks.filter(b=>!b.secondary).map(b=>b.name),['主視覺標題',...overviewSections.map(row=>row[0])])
for(const [name,oldName,anchor,fields] of overviewSections){
 const block=newsOverview.blocks.find(b=>b.name===name)
 assert(block.aliases.includes('news:'+oldName))
 assert.equal(block.href,'/news#'+anchor)
 assert.deepEqual(block.fields.map(f=>f.path).sort(),[...fields].sort())
 assert.equal(searchPages([newsOverview],oldName)[0].block.id,block.id)
}
const newsSamples={samples:[{title:'總覽文章'}],recentArticles:[{title:'側欄文章'}]}
assert.equal(pagePositionContent(newsOverview.blocks[1],{},newsSamples).items[0].title,'總覽文章')
assert.equal(pagePositionContent(newsOverview.blocks[3],{},newsSamples).items[0].title,'側欄文章')
const overviewField=newsOverview.blocks[1].fields.find(f=>f.documentId==='news-articles')
assert(overviewField.schema.newsOverview&&!overviewField.schema.rowFilter)
assert(!newsOverview.unpublishIds.includes('news-articles'))
const overviewNewsDoc=docs.find(d=>d.id==='news-articles'),overviewEdit=structuredClone(overviewNewsDoc.body)
for(const item of overviewEdit.items)item.summary.excerpt+='驗收預覽'
checkPageBody(newsOverview,overviewNewsDoc.id,overviewNewsDoc.body,overviewEdit,overviewNewsDoc.schema)
const publishedNews=publicContent('data-news',overviewNewsDoc.body).newsArticles
assert.deepEqual(overviewNewsDoc.body.items.filter(i=>i.enabled).sort((a,b)=>compareNewsDates(a.summary.publishedAt,b.summary.publishedAt)).map(i=>i.id),publishedNews.map(i=>i.id))
{
 const {recentNewsArticles}=publicContent('data-news',overviewNewsDoc.body)
 const blocks=workbenchBlocks('news',newsOverview.blocks,recentNewsArticles)
 const sidebar=blocks.find(block=>block.kind==='news-recent'),field=sidebar.fields.find(f=>f.documentId==='news-articles')
 assert.equal(field.path,overviewField.path,'Sidebar editing uses the original article path')
 const draft=structuredClone(overviewNewsDoc.body)
 draft.items.reverse()
 const indexes=recentArticleIndexes(draft.items,field.schema.recentArticleIds)
 assert.deepEqual(indexes.map(index=>draft.items[index].id),recentNewsArticles.map(article=>article.id))
 const article=draft.items[indexes[0]]
 article.summary.title='側欄的文章草稿'
 const bodyArticle=draft.items[indexes.find(index=>draft.items[index].detail.sections?.some(section=>section.paragraphs?.length))]
 bodyArticle.detail.sections.find(section=>section.paragraphs?.length).paragraphs[0]='本次修改的內文'
 const preview=pagePositionContent(sidebar,{'news-articles':draft})
 assert.deepEqual(preview.items.map(item=>item.id),recentNewsArticles.map(article=>article.id))
 assert.equal(preview.items[0].title,article.summary.title)
 assert.equal(preview.items[0].image,article.summary.cover)
 checkPageBody(newsOverview,overviewNewsDoc.id,overviewNewsDoc.body,draft,overviewNewsDoc.schema)
}
for(const brand of ['sakura','svago','teka']){
 const p=pageEditors.find(p=>p.id==='products-'+brand)
 const block=pageBlocks(p,docs).find(b=>b.name==='商品頁型錄按鈕')
 const catalogueCovers=[{title:'已公開型錄',image:'/real-cover.webp'}]
 const position=pagePositionContent(block,previewBodies,{catalogueCovers})
 assert.equal(position.fixedAction,'廚房商品型錄下載')
 assert.deepEqual(position.items,catalogueCovers)
}
const faqBodies=JSON.stringify(previewBodies),faqContent=pagePositionContent(franchise.find(b=>b.name==='了解加盟資訊'),previewBodies,{}, {caption:'如何申請',image:'',value:{question:'如何申請？',answer:'先填表'}})
assert.equal(faqContent.questions[0].answer,'先填表');assert.equal(faqContent.image,previewBodies['view-pages-franchising-intro'].copy.field53);assert(faqContent.contextImage)
assert.equal(JSON.stringify(previewBodies),faqBodies)
assert(builderScene.heading.some(f=>f.value==='目前輸入的建商標題'))
assert(!builderScene.bodyText.some(f=>f.path==='copy.field7'))
assert(builderScene.auxiliary.some(f=>f.path==='copy.field7'&&f.value===previewBodies['view-pages-builders-index'].copy.field7))
for(const category of ['latest','activities','video']){
 const id='news-'+category,blocks=workbenchBlocks(id,pageBlocks(pageEditors.find(p=>p.id===id),docs))
 const articleBlock=blocks[1]
 assert.equal(articleBlock.name,category==='latest'?'麵包屑編輯設定':'麵包屑導覽設定')
 assert.equal(articleBlock.kind,'breadcrumb')
 assert(articleBlock.aliases.includes(id+':文章最上方與返回導覽'))
 const copy=previewBodies['view-pages-'+id+'-slug-'].copy
 const sample={title:'已公開文章',image:'/actual-cover.webp'},background='/article-background.webp'
 const scene=newsBreadcrumbPosition(articleBlock,previewBodies,{detailSample:sample,detailHeroImage:background})
 assert.equal(scene.image,background)
 assert.equal(scene.article,sample)
 assert.equal(scene.title,copy.text1)
 assert.deepEqual(scene.categories.map(c=>c.value),[copy.text3,copy.text5])
 if(category==='latest'){
  assert.deepEqual(blocks.filter(b=>!b.secondary).map(b=>b.name),['主視覺標題','麵包屑編輯設定','消息文章管理','頁面共用設定'])
  assert(blocks[2].aliases.includes(id+':消息管理')&&blocks[2].aliases.includes(id+':文章報名圖片提示'))
  assert(blocks[3].aliases.includes(id+':文章旁的分類選單'))
  assert.equal(blocks[2].href,'/news/latest#latest-list-title')
  const listDoc=docs.find(d=>d.id==='view-pages-news-latest-index'),articleDoc=docs.find(d=>d.id==='view-pages-news-latest-slug-'),edited=structuredClone(listDoc.body)
  assert.deepEqual(scene.trail,{breadcrumbHome:'首頁',breadcrumbParent:'優惠消息',breadcrumbList:'最新消息'})
  edited.copy.breadcrumbHome='返回首頁';edited.copy.breadcrumbList='品牌動態'
  validate(edited,listDoc.schema)
  checkPageBody(pageEditors.find(p=>p.id===id),listDoc.id,listDoc.body,edited,listDoc.schema)
  assert.equal(newsBreadcrumbPosition(articleBlock,{...previewBodies,[listDoc.id]:edited}).trail.breadcrumbList,'品牌動態')
  assert.deepEqual(scene.sharedCategories.map(c=>c.value),[copy.text8,copy.text10,copy.text12])
  assert(!blocks.flatMap(b=>b.fields).some(f=>f.documentId===articleDoc.id&&f.path==='copy.text6'))
  assert.throws(()=>checkPageBody(pageEditors.find(p=>p.id===id),articleDoc.id,articleDoc.body,{...articleDoc.body,copy:{...copy,text6:'不可修改'}},articleDoc.schema),/頁面以外/)
 }
}
const image='/home-2026/hero/10bn/aikitchen.webp',selected={caption:'AI Kitchen',image,value:{image,description:'介紹'}}
const before=JSON.stringify(selected);assert.equal(positionContent(home[0],{},selected).image,image);assert.equal(JSON.stringify(selected),before)
assert.equal(itemThumbnail({name:'來源商品'},{},{image:'/source.webp'}),'/source.webp')
const privateImage='/media/12345678-1234-1234-1234-123456789abc'
assert.equal(firstImage(['',privateImage]),privateImage)
assert.equal(firstImage([{image:''},{image:'https://images.example.test/kitchen.avif?size=small'}]),'https://images.example.test/kitchen.avif?size=small')
assert.equal(firstImage({images:['/download.pdf?token=x',privateImage]}),privateImage)
assert.equal(firstImage({href:'/products/sakura',video:'/video.mp4'}),'')
assert.equal(firstImage({pdfUrl:privateImage,brochureUrl:privateImage}),'','Private PDF files must not be treated as photos')
assert.equal(itemThumbnail(['',privateImage]),privateImage)
assert.equal(blockThumbnail({fields:[{documentId:'test',path:'decor',label:'裝飾線稿',schema:{type:'string',format:'media'}},{documentId:'test',path:'poster',label:'影片封面',schema:{type:'string',format:'media'}}]},{test:{decor:'/decor/drawing.png',poster:'/actual-poster.webp'}}),'/actual-poster.webp')
for(const label of ['文字段落','全台門市據點','型錄 PDF'])assert.match(decodeURIComponent(thumbnailPlaceholder(label)),/^data:image\/svg\+xml,<svg[\s\S]+<\/svg>$/)
assert.notEqual(thumbnailPlaceholder('文字段落'),thumbnailPlaceholder('全台門市據點'))
assert(!thumbnailPlaceholder('<script>不可信標題</script>').includes('script'))
const thumbnailSource=await readFile(new URL('../components/admin/AdminThumbnail.vue',import.meta.url),'utf8'),thumbnailProps=reactive({src:privateImage,alt:'SAKURA縮圖',contain:true}),thumbnailContext={computed,defineProps:()=>thumbnailProps,thumbnailPlaceholder}
runInNewContext(ts.transpileModule(thumbnailSource.match(/<script setup[^>]*>([\s\S]*?)<\/script>/)[1].replace(/^import .*$/gm,'')+'\nthis.mark=mark;',{compilerOptions:{target:ts.ScriptTarget.ES2022}}).outputText,thumbnailContext)
assert.equal(thumbnailContext.mark.value,true,'Uploaded logos retain full image display even without a recognizable filename')
thumbnailProps.contain=false;thumbnailProps.alt='品牌標誌縮圖';assert.equal(thumbnailContext.mark.value,true)
thumbnailProps.alt='一般照片';assert.equal(thumbnailContext.mark.value,false)
const source=await readFile(new URL('../components/admin/AdminItems.vue',import.meta.url),'utf8')
const script=source.match(/<script setup[^>]*>([\s\S]*?)<\/script>/)[1].replace(/^import .*$/gm,'')
const code=ts.transpileModule(script+'\nthis.ui={choose,back,item,add,move,remove,rows,active,visible,page,search,itemSchema,reorder,startDrag,drop,toggleVisibility,dragged,cancelItem,changed,focusRow,root};',{compilerOptions:{target:ts.ScriptTarget.ES2022}}).outputText
const model=reactive({modelValue:Array.from({length:8},(_,i)=>({id:'row-'+i,title:'內容 '+i,image:'/image.webp'})),schema:{type:'array',label:'輪播內容',item:{type:'object',fields:{id:{type:'string'},title:{type:'string'}}},template:{id:'',title:''}},documentId:'home',path:'slides'})
const route=reactive({query:{}}),state=ref({}),errors=ref([]),workbench={rows:ref({}),baseline:ref({home:{slides:JSON.parse(JSON.stringify(model.modelValue))}}),focused:ref(''),editing:ref(''),selection:ref(null),metadata:ref({}),busy:ref(false),select:()=>{}},emitted=[]
const context={ref,computed,watch,nextTick,useRoute:()=>route,useRouter:()=>({replace:async value=>{route.query=value.query}}),sameContent,itemPublication,compareNewsDates,recentArticleIndexes,defineProps:()=>model,defineEmits:()=>((_,v)=>{emitted.push(v);model.modelValue=v}),inject:(key,fallback)=>({'cms-workbench':workbench,'cms-item-selections':state,'cms-field-errors':errors}[key]??fallback),provide:()=>{},valueAt,itemKey,itemCaption,itemThumbnail,freshArticleValue,articleDateLabel,newStoreId:()=>123,crypto:{randomUUID},CSS:{escape:x=>x},document:{querySelector:()=>null},window:{confirm:()=>true},JSON}
const scope=effectScope();scope.run(()=>runInNewContext(code,context))
await nextTick();const ui=context.ui
assert.equal(ui.visible.value.length,6);assert.equal(workbench.selection.value.caption,'內容 0');assert.equal(workbench.editing.value,'')
ui.choose(ui.rows.value[2]);assert.equal(emitted.length,0);assert.equal(workbench.selection.value.caption,'內容 2');assert.equal(workbench.editing.value,'')
ui.choose(ui.rows.value[2],true);assert.equal(workbench.editing.value,'home:slides')
ui.item(2,{...model.modelValue[2],title:'修改後'});await nextTick();assert.equal(workbench.selection.value.caption,'修改後')
ui.back();assert.equal(workbench.editing.value,'');assert.equal(model.modelValue[2].title,'修改後');assert.equal(ui.active.value.key,'row-2')
ui.page.value=2;await nextTick();assert.equal(ui.visible.value.length,2);assert.equal(ui.active.value.key,'row-6')
ui.search.value='修改後';await nextTick();assert.equal(ui.page.value,1);assert.equal(ui.active.value.key,'row-2')
errors.value=[{documentId:'home',path:'slides.5.title',message:'請填寫'}];await nextTick();assert.equal(ui.active.value.key,'row-5');assert.equal(workbench.editing.value,'home:slides')
model.schema.source=true;assert.equal(ui.itemSchema.value.fields.id.readOnly,true)
errors.value=[];model.documentId='news-articles';model.path='items';model.modelValue=[];model.schema={...docs.find(d=>d.id==='news-articles').schema.fields.items,newCategory:'activities',newItemLabel:'活動'};ui.add();await nextTick()
assert.equal(ui.active.value.value.summary.category,'activities');assert.equal(ui.active.value.value.summary.categoryLabel,'優惠活動');assert.equal(ui.active.value.value.summary.excerpt,'');assert.equal(ui.active.value.value.summary.cover,'');assert.equal(ui.active.value.value.detail.sections.length,0,'New articles must not copy a real existing article')
model.documentId='custom-cases';model.schema=editingSchema(docs.find(d=>d.id==='custom-cases').schema,'custom-cases').fields.items;model.modelValue=Array.from({length:8},(_,i)=>({...JSON.parse(JSON.stringify(model.schema.template)),id:'case-'+i,title:'案例 '+i}));state.value={};workbench.focused.value='';workbench.editing.value='';await nextTick()
ui.choose(ui.rows.value[0]);workbench.focused.value='another-list:items';workbench.editing.value='another-list:items';const oldCases=JSON.stringify(model.modelValue);ui.reorder(0,2);await nextTick();assert.equal(workbench.focused.value,'custom-cases:items');assert.equal(workbench.editing.value,'','Moving a custom case must leave an unrelated editor')
assert.equal(model.modelValue.slice(0,3).map(i=>i.id).join(','),'case-1,case-2,case-0','Drag ordering inserts the selected case, not swaps two rows');assert.equal(ui.active.value.key,'case-0');assert.notEqual(JSON.stringify(model.modelValue),oldCases)
ui.toggleVisibility(ui.active.value);await nextTick();assert.equal(ui.active.value.value.enabled,false);assert.equal(workbench.selection.value.value.enabled,false);ui.toggleVisibility(ui.active.value);await nextTick();assert.equal(ui.active.value.value.enabled,true)
ui.reorder(2,6);await nextTick();assert.equal(ui.page.value,2);assert.equal(ui.active.value.key,'case-0');assert.equal(ui.visible.value[0].key,'case-0')
ui.search.value='案例 0';await nextTick();const filteredSnapshot=JSON.stringify(model.modelValue);ui.reorder(6,0);assert.equal(JSON.stringify(model.modelValue),filteredSnapshot,'Filtering must not reorder hidden rows')
ui.search.value='';await nextTick();workbench.busy.value=true;ui.reorder(0,1);ui.toggleVisibility(ui.rows.value[0]);assert.equal(JSON.stringify(model.modelValue),filteredSnapshot);workbench.busy.value=false
const transfer={value:'',effectAllowed:'',setData(type,value){this.value=value},getData(){return this.value}},dragEvent={dataTransfer:transfer,preventDefault(){}}
ui.startDrag(dragEvent,ui.rows.value[0]);ui.drop(dragEvent,ui.rows.value[2]);await nextTick();assert.equal(transfer.effectAllowed,'move');assert.equal(ui.active.value.index,2);assert.equal(ui.dragged.value,'')
const protectedSnapshot=JSON.stringify(model.modelValue);ui.startDrag(dragEvent,ui.rows.value[0]);transfer.value='unrelated-table';ui.drop(dragEvent,ui.rows.value[2]);assert.equal(JSON.stringify(model.modelValue),protectedSnapshot,'Foreign drag data must not move cases')
for(const [from,to]of [[-1,2],[0,99],[NaN,0],[0,1.5]])ui.reorder(from,to);assert.equal(JSON.stringify(model.modelValue),protectedSnapshot)
const renamedRow=ui.rows.value.find(r=>r.key==='case-0');ui.search.value=renamedRow.value.title;await nextTick();ui.choose(ui.active.value,true);let automaticOpens=0;workbench.select=()=>automaticOpens++
ui.item(ui.active.value.index,{...ui.active.value.value,title:'改名後仍可找到'});await nextTick();assert.equal(ui.rows.value.length,0);await ui.back();await nextTick();assert.equal(ui.search.value,'');assert.equal(ui.active.value.key,'case-0');assert(ui.visible.value.some(r=>r.key==='case-0'));assert.equal(automaticOpens,0,'Returning from a renamed filtered item must not open the position dialog')
ui.add();await nextTick();assert.equal(ui.active.value.value.title,'新增案例');assert.equal(ui.active.value.value.enabled,true);assert.equal(workbench.editing.value,'custom-cases:items')

// Cancellation must restore only this record, even after moving a row without an ID.
model.documentId='cancel-test';model.path='items';model.schema={type:'array',label:'測試清單',item:{type:'object',fields:{title:{type:'string',label:'名稱'}}},template:{title:''}}
model.modelValue=[{title:'甲'},{title:'乙'},{title:'丙'}];workbench.baseline.value={'cancel-test':{items:JSON.parse(JSON.stringify(model.modelValue))}};workbench.rows.value={};state.value={};workbench.focused.value='';await nextTick()
ui.choose(ui.rows.value[0],true);ui.item(0,{title:'甲修改'});ui.item(1,{title:'乙修改'});await nextTick();ui.move(0,1);await nextTick()
assert.equal(ui.active.value.value.title,'甲修改');ui.cancelItem();await nextTick()
assert.equal(model.modelValue[0].title,'乙修改');assert.equal(model.modelValue[1].title,'甲');assert.equal(ui.active.value.value.title,'甲');assert.equal(ui.changed(ui.active.value),false)
ui.back();ui.choose(ui.rows.value[0],true);ui.cancelItem();await nextTick();assert.equal(model.modelValue[0].title,'乙','Reopening a record must still restore the last saved value')
const count=model.modelValue.length;ui.add();await nextTick();assert.equal(model.modelValue.length,count+1);ui.cancelItem();await nextTick();assert.equal(model.modelValue.length,count,'Cancelling a new item removes only that item')
// A deep link opens the right item and page once, without repeatedly stealing input focus.
model.documentId='direct-test';model.modelValue=Array.from({length:9},(_,i)=>({id:'direct-'+i,title:'項目'+i}));workbench.rows.value={};state.value={};route.query={list:'direct-test:items',item:'direct-8'};await nextTick();await nextTick()
assert.equal(ui.active.value.key,'direct-8');assert.equal(ui.page.value,2);assert.equal(workbench.editing.value,'direct-test:items')
ui.item(8,{...model.modelValue[8],title:'仍在編輯'});await nextTick();assert.equal(ui.active.value.key,'direct-8');await ui.back();await nextTick();assert.equal(route.query.item,undefined);assert.equal(route.query.list,undefined);route.query={list:'direct-test:items',item:'direct-8'};await nextTick();await nextTick();assert.equal(workbench.editing.value,'direct-test:items','The same search result must be able to reopen after returning')
const shortcutBefore=model.modelValue.length;model.schema.source=false;route.query={create:'direct-test:items'};await nextTick();await new Promise(resolve=>setImmediate(resolve));assert.equal(model.modelValue.length,shortcutBefore+1);assert.equal(route.query.create,undefined);await nextTick();assert.equal(model.modelValue.length,shortcutBefore+1,'An already-consumed create link must not add another item')
let returnedToAdd=0;ui.root.value={querySelector:selector=>selector.includes('data-row-key')?null:{focus:()=>returnedToAdd++}};ui.focusRow();await nextTick();assert.equal(returnedToAdd,1,'Cancelling the last new item returns focus to add/search instead of the page body');ui.root.value=undefined
// Region management filters the view while preserving global indexes and editing state.
model.documentId=HOME_STORES_ID;model.path='stores'
const storeSchema=home.find(b=>b.id==='home:全台門市據點').fields.find(f=>f.path==='stores').schema
const storeRows=Array.from({length:10},(_,i)=>({id:200+i,name:'門市 '+i,region:i%3===1?'中部':'北部',city:i%3===1?'臺中市':'臺北市',address:'原地址 '+i,phone:'原電話 '+i}))
model.modelValue=structuredClone(storeRows);workbench.baseline.value={[HOME_STORES_ID]:{stores:structuredClone(storeRows)}};workbench.rows.value={};state.value={};route.query={};errors.value=[];workbench.focused.value='';workbench.editing.value=''
model.schema=homeStoreListSchema(storeSchema,'北部');await nextTick()
assert.equal(ui.rows.value.length,7);assert.equal(ui.visible.value.length,6)
assert.equal(ui.rows.value[1].index,2,'Filtering keeps the original write index')
const storesBefore=JSON.stringify(model.modelValue)
ui.page.value=2;await nextTick();ui.search.value='門市 9';await nextTick();assert.equal(ui.rows.value.length,1)
model.schema=homeStoreListSchema(storeSchema,'中部');workbench.focused.value='';workbench.editing.value='';await nextTick()
assert.equal(ui.rows.value.length,3);assert.equal(ui.search.value,'');assert.equal(ui.page.value,1)
assert.equal(JSON.stringify(model.modelValue),storesBefore,'Changing region must not write store data')
const central=ui.rows.value[1];ui.choose(central,true)
ui.item(central.index,{...central.value,region:'南部',city:''});await nextTick()
assert.equal(ui.active.value.key,central.key,'Changing region keeps the editor open for city selection')
ui.item(central.index,{...ui.active.value.value,city:'高雄市'});await nextTick()
assert.equal(ui.active.value.value.city,'高雄市')
ui.cancelItem();await nextTick();assert.equal(JSON.stringify(model.modelValue),storesBefore,'Cancel restores the original region and city')
ui.choose(ui.rows.value[0],true);const movedIndex=ui.active.value.index
ui.item(movedIndex,{...ui.active.value.value,region:'南部',city:'高雄市'});await nextTick();await ui.back();await nextTick()
assert.equal(ui.page.value,1);assert(ui.active.value?.value.region==='中部','Returning selects a remaining store in this region')
assert.equal(JSON.stringify(model.modelValue.filter(s=>s.region==='北部')),JSON.stringify(storeRows.filter(s=>s.region==='北部')),'Other regions remain untouched')
model.schema=homeStoreListSchema(storeSchema,'南部');workbench.focused.value='';workbench.editing.value='';await nextTick()
assert.equal(ui.rows.value.length,1);assert.equal(ui.rows.value[0].index,movedIndex)
ui.add();await nextTick();assert.equal(ui.active.value.value.region,'南部');assert.equal(ui.active.value.value.city,'');assert.equal(ui.active.value.value.name,'新增門市')
ui.cancelItem();await nextTick();assert.equal(model.modelValue.length,10,'Cancel a new store removes only the new item')
model.schema=homeStoreListSchema(storeSchema,'離島');workbench.focused.value='';workbench.editing.value='';workbench.selection.value=null;await nextTick()
assert.equal(ui.rows.value.length,0);assert.equal(workbench.selection.value,null)
model.schema=homeStoreListSchema(storeSchema,'北部');workbench.focused.value='';await nextTick()
assert.equal(ui.search.value,'門市 9','Search is scoped to each region')
assert.equal(ui.rows.value.length,1)
const errorIndex=model.modelValue.findIndex(s=>s.region==='中部');errors.value=[{documentId:HOME_STORES_ID,path:'stores.'+errorIndex+'.name',message:'請填寫門市名稱'}];await nextTick();model.schema=homeStoreListSchema(storeSchema,'中部');workbench.focused.value='';workbench.editing.value='';await nextTick();assert.equal(ui.active.value.index,errorIndex,'A server error must open the original row after switching to its region');assert.equal(workbench.editing.value,HOME_STORES_ID+':stores');errors.value=[]
console.log('PASS: homepage store region counts, original write indexes, per-region search/page, cross-region editing and cancellation, new-store defaults, empty regions and other-region preservation')
scope.stop()
const nestedModel=reactive({modelValue:['一','二'],schema:{type:'array',item:{type:'string'},template:''},documentId:'nested',path:'paragraphs'}),nestedState=ref({}),nested={...context,defineProps:()=>nestedModel,defineEmits:()=>((_,v)=>nestedModel.modelValue=v),inject:(key,fallback)=>key==='cms-array-depth'?1:key==='cms-item-selections'?nestedState:fallback}
const nestedScope=effectScope();nestedScope.run(()=>runInNewContext(code,nested));nested.ui.add();await nextTick();assert.equal(nested.ui.active.value.index,2,'Nested text/image additions must open the new item');nested.ui.choose(nested.ui.rows.value[0]);nested.ui.move(0,1);await nextTick();assert.equal(nested.ui.active.value.value,'一','Moving a nested item must keep editing the same content');nestedScope.stop()
{
const pavilion=docs.find(d=>d.id==='data-brandPavilions'),pavilionBlocks=workbenchBlocks('pavilions',pageBlocks(pageEditors.find(p=>p.id==='pavilions'),docs)),savedBodies={[pavilion.id]:structuredClone(pavilion.body)},nextBodies=structuredClone(savedBodies)
const pavilionRow=nextBodies[pavilion.id].brandPavilions[0],hours=Object.keys(pavilionRow).find(k=>/hour|time/i.test(k));assert(hours);pavilionRow[hours]+='驗收'
const detail=pageChanges(pavilionBlocks,[pavilion],savedBodies,nextBodies);assert.equal(detail.length,1);assert.match(detail[0].label,/台北館/);assert(detail[0].label.includes('時間'));assert(!detail[0].label.includes(hours));assert.notEqual(detail[0].before,detail[0].after)
const impacts=changeImpacts(detail);assert.equal(impacts.length,2);assert(impacts.every(i=>/品牌館/.test(i.label)));assert(!impacts.some(i=>/影片/.test(i.label)))
const stored=structuredClone(pavilion);stored.publishedBody=structuredClone(pavilion.body);stored.body.brandPavilions[1].address+='先前修改'
const reviewingBodies={[pavilion.id]:structuredClone(stored.body)};reviewingBodies[pavilion.id].brandPavilions[0][hours]+='本次修改';const review=publishReview(pavilionBlocks,[stored],reviewingBodies);assert(review.current.length);assert(review.saved.some(c=>c.label.includes('台中館')));assert(!review.saved.some(c=>c.label.includes('台北館')))
reviewingBodies[pavilion.id].brandPavilions.reverse();const reorderedReview=publishReview(pavilionBlocks,[stored],reviewingBodies);assert(reorderedReview.current.some(c=>c.kind==='order'));assert(reorderedReview.saved.some(c=>c.label.includes('台中館')&&c.after.includes('先前修改')),'Reordering must never hide an older saved edit in another row')
stored.body.brandPavilions[0][hours]+='先前營業時間';const overwritten={[pavilion.id]:structuredClone(stored.body)};overwritten[pavilion.id].brandPavilions[0][hours]+='本次營業時間';const overwrittenReview=publishReview(pavilionBlocks,[stored],overwritten);assert(!overwrittenReview.saved.some(c=>c.label.includes('台北館')),'The same stable item field is shown once, using its current value')
const indexed=pageEditors.map(p=>{const b=workbenchBlocks(p.id,pageBlocks(p,docs));return{...p,title:p.name,blocks:b.map(block=>({...block,items:pageSearchItems(block,Object.fromEntries(docs.map(d=>[d.id,d.body])))}))}})
const direct=searchPages(indexed,'台北館');assert(direct.some(r=>r.page.id==='pavilions'&&r.item?.caption==='台北館'));assert(direct.every(r=>r.item?.scope==='data-brandPavilions:brandPavilions'))
const servicePages=pageEditors.filter(p=>p.section==='service').map(p=>pageSummary(p,[],docs))
const serviceCards=searchPages(servicePages,'')
assert.deepEqual(serviceCards.map(r=>r.page.title),['案例門市','服務流程','門市案例'])
const caseCard=serviceCards[2],storeDoc=docs.find(d=>d.id==='data-storeCases')
assert.equal(caseCard.page.thumbnail,storeDoc.body.storeCases[0].images[0])
const storeManagement=caseCard.page.blocks.find(b=>b.name==='案例管理'),storeRows=storeManagement.fields.find(f=>f.path==='storeCases')
assert.equal(storeRows.schema.rowImage,'images')
assert.equal(blockThumbnail(storeManagement,{[storeDoc.id]:storeDoc.body}),storeDoc.body.storeCases[0].images[0])
for(const row of storeDoc.body.storeCases){
 assert.equal(itemThumbnail(row,storeRows.schema),row.images[0],'Case editor thumbnails must match the public case photo, not the storefront cover')
 assert.notEqual(itemThumbnail(row,storeRows.schema),row.cover)
}
const noCasePhotos=structuredClone(storeDoc.body);noCasePhotos.storeCases.forEach(row=>row.images=[])
assert.equal(blockThumbnail(storeManagement,{[storeDoc.id]:noCasePhotos}),'','Missing case photos cannot silently borrow storefront covers')
assert.equal(itemThumbnail({...storeDoc.body.storeCases[0],images:[]},storeRows.schema),'')
const sharedSections=['門市內頁預約按鈕','案例規格','門市內頁上一篇與下一篇','顧客評論']
assert.deepEqual(caseCard.page.blocks.filter(b=>!b.secondary).map(b=>b.name),['主視覺標題','麵包屑編輯設定','案例管理',...sharedSections])
assert.equal(storeRows.label,'案例清單')
assert.equal(storeRows.schema.searchLabel,'搜尋案例名稱')
for(const [oldName,name] of [['門市管理','案例管理'],['門市內頁規格與資訊','案例規格'],['門市內頁顧客評論','顧客評論']]){
 const block=caseCard.page.blocks.find(b=>b.name===name)
 assert(block.aliases.includes('store-cases:'+oldName),'Previous bookmarked block links remain usable')
 assert.equal(storeCaseRedirect({sitePage:'stores',block:'stores:'+oldName}).query.block,'store-cases:'+name)
}
const listPage=servicePages[0]
assert(!listPage.blocks.some(b=>sharedSections.includes(b.name)||b.name==='案例管理'))
assert.deepEqual(searchResultLink(searchPages(servicePages,'門市案例')[0],{section:'service',q:'門市案例'}).query,{section:'service',q:'門市案例',sitePage:storeCasesPageId})
for(const name of sharedSections)assert.equal(storeCaseRedirect({sitePage:'stores',block:'stores:'+name}).query.block,storeCasesPageId+':'+name)
const oldStoreLink={section:'service',sitePage:'stores',q:'安康店',page:'2',block:'stores:門市與案例',list:'data-storeCases:storeCases',item:storeDoc.body.storeCases[0].slug}
assert.deepEqual(storeCaseRedirect(oldStoreLink).query,{...oldStoreLink,sitePage:storeCasesPageId,block:storeCasesPageId+':案例管理'})
assert.equal(storeCaseRedirect({sitePage:'stores',block:'stores:區域與縣市'}),undefined)
const changedRegion=structuredClone(storeDoc.body)
changedRegion.regionCities['北部'].reverse()
checkPageBody(listPage,storeDoc.id,storeDoc.body,changedRegion,storeDoc.schema)
assert.throws(()=>checkPageBody(caseCard.page,storeDoc.id,storeDoc.body,changedRegion,storeDoc.schema),/目前頁面以外/)
const changedCase=structuredClone(storeDoc.body)
changedCase.storeCases[0].title='門市案例內容測試'
checkPageBody(caseCard.page,storeDoc.id,storeDoc.body,changedCase,storeDoc.schema)
assert.throws(()=>checkPageBody(listPage,storeDoc.id,storeDoc.body,changedCase,storeDoc.schema),/目前頁面以外/)
const crossPageReview=publishReview(caseCard.page.blocks,[{...storeDoc,body:changedRegion,publishedBody:storeDoc.body}],{[storeDoc.id]:changedRegion})
assert(crossPageReview.saved.length&&crossPageReview.saved.every(c=>c.location==='案例門市 › 區域與縣市'))
for(const page of [listPage,caseCard.page])assert(!page.unpublishIds.includes(storeDoc.id))
for(const id of ['news-latest','news-activities','news-video'])for(const block of indexed.find(p=>p.id===id).blocks)for(const i of block.items)assert(docs.find(d=>d.id==='news-articles').body.items.find(row=>itemKey(row)===i.key).summary.category===id.slice(5),'Search cannot leak other categories into a page')
const media=pageMedia(docs.filter(d=>pageEditors[0].ids.includes(d.id)),Object.fromEntries(docs.map(d=>[d.id,d.body])));assert(media.length);assert(media.every(i=>i.label&&!/copy\./.test(i.label)));assert.equal(new Set(media.map(i=>i.src)).size,media.length)
}
console.log('PASS: actual-name item search, category scoping, exact before/after values and changed-document impacts, other saved changes, isolated item cancellation after reorder/reopen, new-item cancellation, deep-link pagination and page media descriptions')

console.log('PASS: all page editors retain every field and old link; screenshot home order; list selection/edit/focus; custom case insertion sorting, drag scope, cross-page movement, search/busy guards and visibility toggles')

// Public status and pending counts reflect content, never version numbers or a draft switch.
const article=structuredClone(newsDoc.body.items[0]),publishedDoc={id:newsDoc.id,publishedBody:{items:[structuredClone(article)]}}
assert.equal(itemPublication(publishedDoc,'items',article,0).label,'官網已刊登')
assert.equal(itemPublication(publishedDoc,'items',{...article,id:'new-item'},0).label,'尚未刊登')
const futureHidden={...article,enabled:false};assert.equal(itemPublication(publishedDoc,'items',futureHidden,0).label,'有待更新修改');assert(itemPublication(publishedDoc,'items',futureHidden,0).visible,'The current website remains visible until publication')
assert(!itemPublication({...publishedDoc,publishedBody:{items:[{...article,enabled:false}]}},'items',article,0).visible)
assert.equal(itemPublication({...publishedDoc,publishedBody:null},'items',article,0).label,'尚未刊登')
assert.equal(itemWebsitePath(newsDoc.id,article),'/news/latest/'+article.slug)
const newsPage=pageEditors.find(p=>p.id==='news-latest'),newsBlocks=workbenchBlocks(newsPage.id,pageBlocks(newsPage,[newsDoc])),pub={[newsDoc.id]:structuredClone(newsDoc.body)},draft=structuredClone(pub)
assert(!hasPageChanges(newsBlocks,pub,draft))
draft[newsDoc.id].items.find(i=>i.summary.category==='activities').summary.title+='其他分類的草稿'
assert(!hasPageChanges(newsBlocks,pub,draft),'Another news category must not count toward this page')
draft[newsDoc.id].items.find(i=>i.summary.category==='latest').summary.title+='本頁的草稿';assert(hasPageChanges(newsBlocks,pub,draft))
const newsMedia=pageMedia([newsDoc],pub,newsBlocks)
for(const i of newsDoc.body.items)assert.equal(newsMedia.some(m=>m.src===i.summary.cover),i.summary.category==='latest','Page images must respect the active category')
assert(newsMedia.every(m=>m.caption&&m.purpose&&!m.label.includes(' › ')&&m.location));const punctuated=structuredClone(pub);punctuated[newsDoc.id].items[0].summary.title='新品｜品牌故事';assert(pageMedia([newsDoc],punctuated,newsBlocks).some(m=>m.caption==='新品｜品牌故事'&&m.purpose==='列表卡片圖片'))
assert.equal(articleDateLabel('2026-11-17'),'NOV 17, 2026')
const standard={...article,summary:{...article.summary,displayDate:'JUN 15, 2026'}},dated=updateArticleField(standard,'summary.publishedAt','2026-11-17');assert.equal(dated.summary.displayDate,'NOV 17, 2026');assert.equal(standard.summary.displayDate,'JUN 15, 2026')
const custom=structuredClone(article);custom.summary.displayDate='活動期間依門市公告';assert.equal(updateArticleField(custom,'summary.publishedAt','2026-11-17').summary.displayDate,'活動期間依門市公告')
const distinct=updateArticleField(article,'summary.cover','/changed.webp');assert.equal(distinct.detail.cover.src,article.detail.cover.src,'A separate article image must never be overwritten')
const noCover=structuredClone(article);noCover.detail={};assert.equal(updateArticleField(noCover,'summary.cover','/changed.webp').detail.cover.src,'/changed.webp')
const sameCover=structuredClone(article);sameCover.detail.cover.src=sameCover.summary.cover;assert.equal(updateArticleField(sameCover,'summary.cover','/changed.webp').detail.cover.src,'/changed.webp')
const newsTask=pageTaskLink([{...newsPage,blocks:newsBlocks}],newsPage.id,'news-articles:items',true,{q:'原搜尋',page:'2'});assert.equal(newsTask.query.block,newsBlocks.find(b=>b.fields.some(f=>f.documentId==='news-articles')).id);assert.equal(newsTask.query.create,'news-articles:items');assert.equal(newsTask.query.q,'原搜尋');assert.equal(newsTask.query.page,'2')

console.log('PASS: published-vs-draft status, category-scoped pending/media, preserved custom dates and images, direct task links and one-shot creation')

const identical=workspaceSummariesFromRows([{id:'data-kitchenSeries',body:'{"title":"相同內容"}',publishedBody:'{"title":"相同內容"}',draftId:'new-version',publishedId:'old-version'}]);assert.equal(identical.find(w=>w.ids.includes('data-kitchenSeries')).pending,false,'Equal content in different versions must never create a pending task')
const articleSource=await readFile(new URL('../components/admin/AdminArticleFields.vue',import.meta.url),'utf8'),articleProps=reactive({modelValue:structuredClone(article),schema:editingSchema(newsDoc.schema,newsDoc.id).fields.items.item,documentId:newsDoc.id,path:'items.0'}),articleContext={computed,valueAt,updateArticleField,defineProps:()=>articleProps,defineEmits:()=>((_,value)=>articleProps.modelValue=value)}
runInNewContext(ts.transpileModule(articleSource.match(/<script setup[^>]*>([\s\S]*?)<\/script>/)[1].replace(/^import .*$/gm,'')+'\nthis.ui={main,extra,field,update};',{compilerOptions:{target:ts.ScriptTarget.ES2022}}).outputText,articleContext)
const articleUi=articleContext.ui;assert.equal(articleUi.main.value[0],'summary.title');assert.equal(articleUi.field('summary.publishedAt').inputType,'date');assert.equal(articleUi.field('detail.sections').newItemLabel,'段落')
for(const group of ['summary','detail'])for(const key of Object.keys(articleProps.schema.fields[group].fields)){if(key==='category')continue;const path=group+'.'+key;assert([...articleUi.main.value,...articleUi.extra.value].includes(path),'Every original article setting must remain reachable: '+path)}
assert(!articleUi.extra.value.includes('slug'));const oldDetail=JSON.stringify(articleProps.modelValue.detail);articleUi.update('summary.title','新標題');assert.equal(JSON.stringify(articleProps.modelValue.detail),oldDetail,'Editing title must preserve a custom image description and all existing body content')
console.log('PASS: identical-version workspace counts and all original article settings remain reachable without changing custom content')

assert(sameContent({title:'相同',image:'/a.jpg'},{image:'/a.jpg',title:'相同'}),'Object key order is not a content change');assert(!sameContent(['甲','乙'],['乙','甲']),'Visible list order remains a real change')

{
 const page=pageEditors.find(p=>p.id==='service'),document=docs.find(d=>d.id===serviceHeadingDocument),before=structuredClone(document.body)
 const blocks=pageBlocks(page,docs),intro=blocks.find(b=>b.name==='服務流程')
 assert.deepEqual(intro.fields.filter(f=>f.documentId===serviceHeadingDocument&&f.path!=='copy.text6').map(f=>f.label),['區塊英文標籤','區塊中文主標題','區塊英文主標題'])
 assert(!blocks.some(b=>b.fields.some(f=>f.documentId===serviceHeadingDocument&&['copy.text3','copy.text4','copy.text5'].includes(f.path))))
 assert.equal(pageFieldValue({[document.id]:before},{documentId:document.id,path:'copy.englishLabel'}),'Service Process')
 assert.equal(serviceHeading(before.copy).englishTitle,before.copy.text3+before.copy.text4+before.copy.text5)
 const after=structuredClone(before);Object.assign(after.copy,{englishLabel:'SERVICE STEPS',text2:'專業服務每一步',englishTitle:'Design Your Dream Kitchen'})
 checkPageBody(page,document.id,before,after,document.schema);validate(after,document.schema)
 const changes=pageChanges(blocks,[document],{[document.id]:before},{[document.id]:after})
 assert.equal(changes.length,3)
 assert.equal(changes.find(c=>c.path==='copy.englishTitle').before,serviceHeading(before.copy).englishTitle)
 assert(changes.every(c=>c.impacts.some(i=>i.href==='/service-process#service-intro-title')))
 for(const key of ['text3','text4','text5'])assert.equal(after.copy[key],before.copy[key])
 assert.equal(serviceHeading({englishLabel:'',englishTitle:''}).englishTitle,'')
 assert.equal(headingFieldLabel('區塊英文主標題'),'區塊英文主標題')
 assert.equal(headingFieldLabel('區塊英文主標題（第二段）'),'區塊英文主標題（第二段）')
 assert.deepEqual(document.body,before)
 console.log('PASS service title labels, editable original rail label, combined legacy English title, preserved old fields, scoped review and immutable fallback')
}

{
 const page=pageEditors.find(p=>p.id==='stores'),document=docs.find(d=>d.id==='view-pages-gallery-index'),blocks=workbenchBlocks('stores',pageBlocks(page,docs))
 assert.deepEqual(blocks.filter(b=>!b.secondary).slice(0,3).map(b=>b.name),['主視覺標題','麵包屑編輯設定','地區篩選列'])
 const trail=blocks.find(b=>b.name==='麵包屑編輯設定')
 assert.deepEqual(trail.fields.map(f=>f.path),['copy.breadcrumbHome','copy.breadcrumbList'])
 assert.equal(trail.anchor,'gallery-breadcrumb');assert.equal(trail.href,'/gallery#gallery-breadcrumb')
 assert.deepEqual(storeBreadcrumb({}),{breadcrumbHome:'首頁',breadcrumbList:'案例門市'})
 assert.deepEqual(storeBreadcrumb({breadcrumbHome:' ',breadcrumbList:''}),storeBreadcrumb({}))
 const before=structuredClone(document.body),after=structuredClone(before);Object.assign(after.copy,{breadcrumbHome:'網站首頁',breadcrumbList:'體驗門市'})
 checkPageBody(page,document.id,before,after,document.schema);validate(after,document.schema)
 const changes=pageChanges(blocks,[document],{[document.id]:before},{[document.id]:after})
 assert.equal(changes.length,2);assert(changes.every(c=>c.impacts.some(i=>i.href==='/gallery#gallery-breadcrumb')))
 assert.deepEqual(document.body,before)
}

{
 const page=pageEditors.find(p=>p.id===storeCasesPageId),document=docs.find(d=>d.id==='view-pages-gallery-slug-'),blocks=workbenchBlocks(page.id,pageBlocks(page,docs))
 assert.deepEqual(blocks.filter(b=>!b.secondary).slice(0,3).map(b=>b.name),['主視覺標題','麵包屑編輯設定','案例管理'])
 assert.deepEqual(blocks.find(b=>b.name==='主視覺標題').fields.map(f=>f.path),['copy.heroTitle'])
 assert.deepEqual(blocks.find(b=>b.name==='麵包屑編輯設定').fields.map(f=>f.path),['copy.breadcrumbHome','copy.breadcrumbParent','copy.breadcrumbDetail'])
 assert.deepEqual(storeCaseBreadcrumb({}),{breadcrumbHome:'首頁',breadcrumbParent:'案例門市',breadcrumbDetail:'門市案例'})
 const before=structuredClone(document.body),after=structuredClone(before);Object.assign(after.copy,{heroTitle:'門市體驗案例',breadcrumbHome:'網站首頁',breadcrumbParent:'體驗門市',breadcrumbDetail:'案例介紹'})
 checkPageBody(page,document.id,before,after,document.schema);validate(after,document.schema)
 const changes=pageChanges(blocks,[document],{[document.id]:before},{[document.id]:after})
 assert.equal(changes.length,4);assert(changes.every(c=>c.impacts.some(i=>i.href.startsWith('/gallery/case10#store-case-'))))
 assert.deepEqual(document.body,before)
}
