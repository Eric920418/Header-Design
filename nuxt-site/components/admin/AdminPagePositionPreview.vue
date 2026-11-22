<script setup lang="ts">
import {ArrowRight,Play,Plus,Search,MessageSquare,Download,MapPin,ExternalLink} from 'lucide-vue-next'
import {destinationGroups,destinationName} from '~/shared/cms/navigation.mjs'
import {franchiseDownloadBreadcrumb,knowledgeBreadcrumb,seriesCatalogueBreadcrumb} from '~/shared/cms/page-breadcrumbs.mjs'
import {pagePositionContent,newsBreadcrumbPosition} from '~/shared/cms/workbench.mjs'
import {valueAt} from '~/shared/cms/page-editors.mjs'
import {franchiseDownloadDocument,franchiseMarqueeDocument,franchiseMarqueeRows,franchiseSupportImagePath} from '~/shared/cms/positions.mjs'
import {builderBrandHeading,builderComingSoonImages,type builderProjectCards} from '~/data/builders'
import {FRANCHISE_FAQ_DISPLAY_LIMIT} from '~/data/franchise'
const props=defineProps<{block:any;bodies:Record<string,any>;selected?:any;pageTitle:string;presentation?:any;focusedField?:string}>()
const {data:sitePages}=useNuxtData<any[]>('cms-pages')
const {data:workspaces}=useNuxtData<any[]>('cms-workspaces')
const destinations=computed(()=>destinationGroups(sitePages.value||[],workspaces.value||[]))
const destinationTitle=computed(()=>destinationName(scene.value.destination?.value,destinations.value)||'沿用既有連結')
const scene=computed(()=>pagePositionContent(props.block,props.bodies,props.presentation,props.selected,props.focusedField))
const breadcrumb=computed(()=>newsBreadcrumbPosition(props.block,props.bodies,props.presentation))
const isCatalogueTrail=computed(()=>props.block?.id.startsWith('series-catalogue:'))
const trailCopy=computed(()=>props.bodies[props.block?.fields[0]?.documentId]?.copy)
const pageTrail=computed(()=>isCatalogueTrail.value?seriesCatalogueBreadcrumb(trailCopy.value):knowledgeBreadcrumb(trailCopy.value))
const highlighted=(path:string)=>props.focusedField===path
const isLabel=(label:string)=>/標籤|小標|前置英文/.test(label)
const headings=computed(()=>scene.value.heading.filter((f:any)=>!isLabel(f.label)&&!/語音/.test(f.label)))
const eyebrows=computed(()=>scene.value.heading.filter((f:any)=>isLabel(f.label)))
const seriesHeading=computed(()=>props.block?.id==='home:品牌系列'?scene.value.heading.filter((f:any)=>['copy.englishLabel','copy.englishLead','copy.chineseTitle','copy.englishTitleFirst','copy.englishTitleSecond'].includes(f.path)):null)
const regions=computed(()=>Object.entries(props.bodies['data-storeCases']?.regionCities||{}) as [string,string[]][])
const filterCities=computed(()=>props.block?.storeRegion?regions.value.find(([region])=>region===props.block.storeRegion)?.[1]||[]:regions.value[0]?.[1]?.slice(0,3)||[])
const filterImage=computed(()=>props.block?.storeRegion
 ? props.bodies['data-storeCases']?.storeCases?.find((store:any)=>store.region===props.block.storeRegion&&store.cover)?.cover
 : props.presentation?.specialImage)
const storeExampleKind=computed(()=>scene.value.kind.startsWith('store-'))
const storeDetails=computed(()=>props.bodies['view-pages-gallery-slug-'])
const storeCases=computed<any[]>(()=>props.bodies['data-storeCases']?.storeCases||[])
const storeExample=computed(()=>storeCases.value.find(store=>store.slug===props.presentation?.storeCaseExamples?.[scene.value.kind]?.slug))
const storeNeighbors=computed(()=>{
 const rows=storeCases.value,index=rows.indexOf(storeExample.value)
 return index<0?[]:[rows[(index-1+rows.length)%rows.length],rows[(index+1)%rows.length]]
})
const storeSpecs=computed(()=>Object.entries(storeDetails.value?.metaLabels||{}).flatMap(([key,label])=>storeExample.value?.meta?.[key]?[{key,label,value:storeExample.value.meta[key]}]:[]))
const captions=computed(()=>scene.value.bodyText.filter((f:any)=>!/供語音|載入|失敗|格式欄位|頁數欄位|大小欄位/.test(f.label)))
const media=computed(()=>scene.value.media.filter((f:any,index:number)=>index<3||highlighted(f.path)))
const itemText=(item:any)=>{const text=item.value?.summary?.excerpt||item.value?.intro?.paragraphs||item.value?.description||item.value?.paragraphs||item.value?.detail||item.value?.copy||item.value?.quote||item.value?.excerpt||item.value?.summary||'';return Array.isArray(text)?text.join('\n'):typeof text==='string'?text:''}
const marqueeRows=computed(()=>{
 const body=props.bodies[franchiseMarqueeDocument]
 return franchiseMarqueeRows.map(row=>({...row,src:valueAt(body,row.image),loopSrc:valueAt(body,row.loop),description:valueAt(body,row.alt)}))
})
const supportItems=computed<{title:string;detail:string}[]>(()=>props.bodies['data-franchise']?.franchiseSupportHighlights||[])
const franchiseQuestions=computed<{question:string;answer:string}[]>(()=>props.bodies['data-franchise']?.franchiseFaqItems?.slice(0,FRANCHISE_FAQ_DISPLAY_LIMIT)||[])
const franchiseDownloadCard=computed(()=>props.bodies[franchiseMarqueeDocument]?.copy)
const franchiseDownloadCopy=computed(()=>props.bodies[franchiseDownloadDocument]?.copy)
const downloadTrail=computed(()=>franchiseDownloadBreadcrumb(franchiseDownloadCopy.value))
const downloadAnchor=computed(()=>props.block?.previewPage?.split('#')[1]||props.block?.anchor)
const downloadSheets=computed(()=>{
 const pages=props.bodies[franchiseDownloadDocument]?.brochurePages||[]
 const index=props.selected?.path==='brochurePages'?props.selected.index:0
 const start=index<2?0:index
 return pages.slice(start,start+2).map((page:any,offset:number)=>({...page,index:start+offset}))
})
const brochureFile=computed(()=>props.bodies['data-franchise']?.FRANCHISE_BROCHURE_URL?.split(/[?#]/)[0].split('/').pop())
const franchiseApplication=computed(()=>props.bodies['view-pages-franchising-form']?.copy)
const builderBrandCopy=computed(()=>props.bodies['view-pages-builders-index']?.copy)
const builderBrandProject=computed(()=>(props.bodies['data-builders']?.builderProjectCards as typeof builderProjectCards|undefined)?.find(card=>card.type==='project'))
const links=computed(()=>scene.value.items.flatMap((i:any)=>i.value?.mega||i.value?.children||i.value?.links||[i.value]).map((i:any)=>Array.isArray(i)?{label:i[0]}:i).filter((i:any)=>i?.label||i?.title).slice(0,8))
const previewStores=computed(()=>scene.value.items.map((i:any)=>({name:i.value?.storeName||i.value?.name||i.title,address:i.value?.address,hours:i.value?.hours,phone:i.value?.contact?.phone||i.value?.phone,image:i.image})).filter((i:any)=>i.address||i.image))
const table=computed(()=>{const f=props.block?.fields.find((f:any)=>f.path==='systemCabinetMaterials');return f?props.bodies[f.documentId]?.[f.path]:null})
</script>
<template>
 <div class="cms-page-position-scene cms-website-scene" :data-position-kind="scene.kind">
  <div class="cms-position-sitebar"><span>設計案例 · 廚房產品 · 門市與服務</span><img src="/home-2026/logos/sakura-kitchen-horizontal.svg" alt="SAKURA KITCHEN" /><span>品牌承諾 · 我要加盟</span></div>
  <div v-if="scene.contextImage&&!scene.displaySettings.length&&!['hero','breadcrumb','page-breadcrumb','inactive','news-shared','franchise-application','franchise-download-breadcrumb'].includes(scene.kind)&&!scene.fixedAction" class="cms-scene-context-image" :class="{'cms-franchise-download-context':franchiseDownloadCopy}">
   <AdminThumbnail :src="scene.contextImage" :alt="pageTitle+'頁面位置參照'" /><span>{{ franchiseDownloadCopy?.text4 || pageTitle }}</span>
  </div>
  <section class="cms-scene-target" :aria-label="block?.name+'的位置示意'">
   <span class="cms-scene-tag">{{ block?.name }}<template v-if="selected"> · {{ selected.caption }}</template></span>
   <template v-if="scene.displaySettings.length">
    <div v-for="setting in scene.displaySettings" :key="setting.label" class="cms-scene-search-result">
     <small>{{ setting.label }}</small>
     <span v-if="'visible' in setting.value">{{ setting.value.visible?'允許顯示於官網':'本區塊已設定隱藏' }}</span>
     <template v-if="'seoTitle' in setting.value||'seoDescription' in setting.value||'title' in setting.value||'description' in setting.value">
      <b>{{ setting.value.seoTitle||setting.value.title||pageTitle }}</b>
      <p v-if="setting.value.seoDescription||setting.value.description">{{ setting.value.seoDescription||setting.value.description }}</p>
      <small v-else>搜尋結果使用原有摘要</small>
     </template>
    </div>
   </template>
   <p v-else-if="scene.kind==='inactive'" class="cms-scene-a11y">官網目前沒有顯示區塊，這些設定不會出現在頁面上。</p>
   <div v-else-if="scene.kind==='franchise-marquee'" class="cms-franchise-marquee-preview">
    <figure v-for="row in marqueeRows" :key="row.image">
     <figcaption>{{ row.label }}</figcaption>
     <AdminThumbnail :src="row.src" :alt="row.description||row.label" :class="{'is-focused':highlighted(row.image)||highlighted(row.alt)}" />
     <template v-if="row.loopSrc&&row.loopSrc!==row.src">
      <small>接續圖片（桌機）</small>
      <AdminThumbnail :src="row.loopSrc" :alt="row.label+'的接續畫面'" :class="{'is-focused':highlighted(row.loop)}" />
     </template>
    </figure>
   </div>
   <article v-else-if="scene.kind==='franchise-support'" class="cms-scene-franchise-support" :class="{'is-focused':highlighted(franchiseSupportImagePath)}">
    <AdminThumbnail :src="scene.mappedImage" alt="官網總部支援區的背景圖片" />
    <div v-for="(item,index) in supportItems" :key="index" :class="{'is-focused':selected?.index===index}">
     <h3><template v-if="index!==0">{{ item.title }} </template>{{ item.detail.split('！')[0] }}！</h3>
     <p>{{ item.detail.split('！').slice(1).join('！') }}</p>
    </div>
    <div class="cms-scene-franchise-support-button">
     <span v-for="field in scene.buttons" :key="field.path" :class="{'is-focused':highlighted(field.path)||highlighted(scene.destination?.path)}">{{ field.value }} <ArrowRight :size="14" aria-hidden="true" /></span>
     <small v-if="scene.destination">前往 {{ destinationTitle }}</small>
    </div>
   </article>
   <div v-else-if="scene.kind==='franchise-faq'" class="cms-franchise-faq-preview">
    <div class="cms-franchise-faq-questions">
     <h3>了解加盟資訊</h3>
     <p v-if="selected?.index>=FRANCHISE_FAQ_DISPLAY_LIMIT" class="cms-field-help">這題目前超出官網顯示範圍。</p>
     <div v-for="(item,index) in franchiseQuestions" :key="index" class="cms-scene-question" :class="{'is-focused':index===selected?.index}">
      <strong>{{ item.question }}</strong><Plus :size="15" aria-hidden="true" />
      <p v-if="index===(selected?.index??0)">{{ item.answer }}</p>
     </div>
    </div>
    <aside v-if="franchiseDownloadCard" class="cms-franchise-faq-card" :class="{'is-focused':['copy.field52','copy.field53','copy.field54'].includes(focusedField||'')}">
     <AdminThumbnail :src="franchiseDownloadCard.field53" :alt="franchiseDownloadCard.field54||'加盟資料封面'" contain />
     <strong>{{ franchiseDownloadCard.text56 }}</strong>
     <small>封面前往 {{ destinationName(franchiseDownloadCard.field52,destinations) }}</small>
     <small v-if="franchiseDownloadCard.field55!==franchiseDownloadCard.field52">標題前往 {{ destinationName(franchiseDownloadCard.field55,destinations) }}</small>
    </aside>
   </div>
   <div v-else-if="['hero','franchise-download-breadcrumb'].includes(scene.kind)&&franchiseDownloadCopy" class="cms-scene-hero cms-franchise-download-hero">
    <AdminThumbnail :src="franchiseDownloadCopy.field1" :alt="franchiseDownloadCopy.field2" :class="{'is-focused':highlighted('copy.field1')||highlighted('copy.field2')}" />
    <div class="cms-scene-hero-copy">
     <InternalSectionPill tone="dark" :class="{'is-focused':highlighted('copy.text3')}">{{ franchiseDownloadCopy.text3 }}</InternalSectionPill>
     <h3 :class="{'is-focused':highlighted('copy.text4')}">{{ franchiseDownloadCopy.text4 }}</h3>
     <small aria-label="麵包屑" class="cms-franchise-download-trail">
      <template v-for="(label,key,index) in downloadTrail" :key="key"><span v-if="index" aria-hidden="true"> / </span><span :class="{'is-focused':highlighted('copy.'+key)}">{{ label }}</span></template>
     </small>
    </div>
   </div>
   <template v-else-if="['franchise-download-document','franchise-download-catalogue'].includes(scene.kind)&&franchiseDownloadCopy">
    <div v-if="downloadAnchor==='franchise-download-back'" class="cms-scene-buttons">
     <span :class="{'is-focused':highlighted('copy.text23')||highlighted('copy.field22')}">{{ franchiseDownloadCopy.text23 }}<ArrowRight :size="14" aria-hidden="true" /></span>
     <small v-if="highlighted('copy.field22')" class="cms-field-help">前往 {{ destinationTitle }}</small>
    </div>
    <div v-else-if="scene.kind==='franchise-download-catalogue'||downloadAnchor!=='franchise-catalogue-preview'" class="cms-franchise-download-preview">
     <header>
      <h3><span :class="{'is-focused':highlighted('copy.text5')}"><InternalHeadingText :text="franchiseDownloadCopy.text5" /></span><br /><span :class="{'is-focused':highlighted('copy.text6')}"><InternalHeadingText :text="franchiseDownloadCopy.text6" /></span></h3>
      <AdminThumbnail v-if="franchiseDownloadCopy.field7" :src="franchiseDownloadCopy.field7" :alt="franchiseDownloadCopy.field8" :class="{'is-focused':highlighted('copy.field7')||highlighted('copy.field8')}" contain />
     </header>
     <div>
      <p :class="{'is-focused':highlighted('copy.text9')}">{{ franchiseDownloadCopy.text9 }}</p>
      <dl class="cms-franchise-download-meta">
       <div v-for="label in [10,12,14]" :key="label">
        <dt :class="{'is-focused':highlighted('copy.text'+label)}">{{ franchiseDownloadCopy['text'+label] }}</dt>
        <dd :class="{'is-focused':highlighted('copy.text'+(label+1))}">{{ franchiseDownloadCopy['text'+(label+1)] }}</dd>
       </div>
      </dl>
      <div class="cms-scene-buttons">
       <span v-for="key in ['text16','text17']" :key="key" :class="{'cms-preview-primary':key==='text16','is-focused':highlighted('copy.'+key)||highlighted('FRANCHISE_BROCHURE_URL')}">{{ franchiseDownloadCopy[key] }}<Download v-if="key==='text17'" :size="14" aria-hidden="true" /><ExternalLink v-else :size="14" aria-hidden="true" /></span>
      </div>
      <small v-if="highlighted('FRANCHISE_BROCHURE_URL')" class="cms-field-help">{{ brochureFile || '尚未選擇 PDF' }}</small>
      <div v-if="scene.kind==='franchise-download-document'&&downloadAnchor==='franchise-pdf-actions'" class="cms-scene-copy">
       <template v-for="key in ['text18','text19','text20']" :key="key">
        <p :class="{'is-focused':highlighted('copy.'+key)}">{{ franchiseDownloadCopy[key] }}</p>
       </template>
      </div>
     </div>
    </div>
    <div v-if="scene.kind==='franchise-download-catalogue'||downloadAnchor==='franchise-catalogue-preview'" class="cms-franchise-download-sheets">
     <figure v-for="sheet in downloadSheets" :key="sheet.index" :class="{'is-focused':sheet.index===selected?.index&&selected?.path==='brochurePages'}">
      <AdminThumbnail :src="sheet.image" :alt="sheet.alt" contain />
      <figcaption :class="{'is-focused':highlighted('copy.text21')}">{{ franchiseDownloadCopy.text21 }}{{ sheet.number }}</figcaption>
     </figure>
    </div>
   </template>
   <template v-else-if="storeExampleKind">
    <template v-if="storeExample&&storeDetails">
     <AdminThumbnail :src="storeExample.images?.[0]||storeExample.cover" :alt="storeExample.storeName+'案例照片'" class="cms-scene-wide-image" />
     <h3>{{ storeExample.title }}</h3>
     <div v-if="scene.kind==='store-booking'" class="cms-scene-buttons">
      <span :class="{'is-focused':highlighted('copy.text2')||highlighted('copy.field1')}">{{ storeDetails.copy.text2 }}<ArrowRight :size="13" /></span>
     </div>
     <template v-else-if="scene.kind==='store-info'">
      <h3 v-if="storeSpecs.length" :class="{'is-focused':highlighted('copy.text3')}">{{ storeDetails.copy.text3 }}</h3>
      <dl v-if="storeSpecs.length" class="cms-scene-details">
       <template v-for="spec in storeSpecs" :key="spec.key"><dt :class="{'is-focused':highlighted('metaLabels.'+spec.key)}">{{ spec.label }}</dt><dd>{{ spec.value }}</dd></template>
      </dl>
      <template v-if="storeExample.contact">
       <h3 :class="{'is-focused':highlighted('copy.text4')}">{{ storeDetails.copy.text4 }}</h3>
       <p>{{ storeExample.contact.address }}</p>
       <div class="cms-scene-buttons">
        <span :class="{'is-focused':highlighted('copy.storeBookingDestination')}">{{ storeDetails.copy.text2 }}<ArrowRight :size="13" /></span>
        <span v-if="storeExample.contact.lineUrl" :class="{'is-focused':highlighted('copy.text5')}">{{ storeDetails.copy.text5 }}</span>
        <span v-if="storeExample.contact.mapUrl" :class="{'is-focused':highlighted('copy.text6')}">{{ storeDetails.copy.text6 }}</span>
       </div>
      </template>
     </template>
     <dl v-else-if="scene.kind==='store-navigation'" class="cms-scene-details">
      <template v-for="(neighbor,index) in storeNeighbors" :key="index">
       <dt :class="{'is-focused':highlighted(index?'copy.text8':'copy.text7')}">{{ index?storeDetails.copy.text8:storeDetails.copy.text7 }}</dt><dd>{{ neighbor.title }}</dd>
      </template>
     </dl>
     <template v-else>
      <h3 :class="{'is-focused':highlighted('copy.text9')}">{{ storeDetails.copy.text9 }}</h3>
      <blockquote v-if="storeExample.reviews?.[0]">{{ storeExample.reviews[0] }}</blockquote>
     </template>
    </template>
    <p v-else class="cms-field-help">目前沒有刊登的門市案例顯示此區。</p>
   </template>
   <section v-else-if="scene.kind==='franchise-application'&&franchiseApplication" class="cms-scene-franchise-application" :style="scene.contextImage?{'background-image':`url(${JSON.stringify(scene.contextImage)})`}:undefined">
    <header>
     <InternalSectionPill :class="{'is-focused':highlighted('copy.text1')}">{{ franchiseApplication.text1 }}</InternalSectionPill>
     <h3 :class="{'is-focused':highlighted('copy.text2')}"><InternalHeadingText :text="franchiseApplication.text2" /></h3>
     <p :class="{'is-focused':highlighted('copy.text3')}">{{ franchiseApplication.text3 }}</p>
     <div class="cms-scene-buttons"><span :class="{'is-focused':highlighted('copy.text5')||highlighted('copy.field4')}">{{ franchiseApplication.text5 }}<Download :size="14" aria-hidden="true" /></span></div>
     <small v-if="highlighted('copy.field4')" class="cms-field-help">前往 {{ destinationTitle }}</small>
    </header>
    <div class="cms-scene-application-fields">
     <small>Application Form</small>
     <h4>加盟申請資料</h4>
     <div class="cms-scene-form-fields" aria-label="官網表單開頭">
      <span v-for="name in ['聯絡姓名','電子郵件','聯絡電話']" :key="name"><span>{{ name }} <span aria-label="必填">*</span></span><i aria-hidden="true" /></span>
     </div>
    </div>
   </section>
   <div v-else-if="scene.kind==='builders-brand-intro'&&builderBrandCopy" class="cms-scene-builders-brand">
    <header>
     <InternalSectionPill>{{ builderBrandHeading.label }}</InternalSectionPill>
     <h3>
      <b :class="{'is-focused':highlighted('copy.text9')}"><InternalHeadingText :text="builderBrandCopy.text9" /></b>
      <InternalHeadingText :text="builderBrandHeading.line1" /><span><InternalHeadingText :text="builderBrandHeading.line1Accent" /></span><br />
      <span><InternalHeadingText :text="builderBrandHeading.line2Accent" /></span><InternalHeadingText :text="builderBrandHeading.line2" />
     </h3>
     <p :class="{'is-focused':highlighted('copy.text11')}">{{ builderBrandCopy.text11 }}</p>
    </header>
    <div class="cms-builders-brand-cards">
     <div v-if="builderBrandProject" class="cms-builders-brand-card cms-builders-project-card" :class="{'is-focused':highlighted('copy.field12')||highlighted('copy.field13')}">
      <AdminThumbnail :src="builderBrandProject.image" :alt="builderBrandCopy.field12" />
      <AdminThumbnail v-if="builderBrandProject.logo" :src="builderBrandProject.logo" :alt="builderBrandCopy.field13" class="cms-builders-card-logo" contain />
      <span class="cms-builders-card-caption"><span><strong>{{ builderBrandProject.title }}</strong><br />{{ builderBrandProject.subtitle }}</span><ArrowRight :size="14" aria-hidden="true" /></span>
     </div>
     <div class="cms-builders-brand-card cms-builders-coming-soon" :class="{'is-focused':highlighted('copy.field14')}">
      <AdminThumbnail :src="builderComingSoonImages[0]" :alt="builderBrandCopy.field14" />
      <strong><span :class="{'is-focused':highlighted('copy.text15')}">{{ builderBrandCopy.text15 }}</span><br /><span :class="{'is-focused':highlighted('copy.text16')}">{{ builderBrandCopy.text16 }}</span></strong>
     </div>
    </div>
   </div>
   <div v-else-if="scene.kind==='franchise-news'" class="cms-scene-franchise-news">
    <span class="cms-franchise-news-eyebrow" :class="{'is-focused':highlighted('copy.text58')}">{{ franchiseDownloadCard?.text58 }}</span>
    <h3>最新加盟資訊</h3>
    <p class="cms-franchise-news-heading">Latest Franchise News<br />With <strong>SAKURA KITCHEN</strong></p>
    <ol v-if="scene.items.length">
     <li v-for="item in scene.items" :key="item.id" :class="{'is-focused':item.id===selected?.value?.id}">
      <span>{{ item.title }}</span><ArrowRight :size="16" aria-hidden="true" />
     </li>
    </ol>
    <p v-else class="cms-field-help">目前沒有顯示中的加盟文章。</p>
   </div>
   <div v-else-if="scene.kind==='news-overview'" class="cms-scene-news-overview">
    <article v-for="item in scene.items" :key="item.title">
     <AdminThumbnail v-if="item.image" :src="item.image" :alt="item.title+'封面'" />
     <div>
      <small v-if="item.value?.summary">{{ item.value.summary.categoryLabel }} · {{ item.value.summary.displayDate || item.value.summary.publishedAt }}</small>
      <h3>{{ item.title }}</h3>
      <p v-if="itemText(item)">{{ itemText(item) }}</p>
     </div>
    </article>
   </div>
   <div v-else-if="scene.kind==='news-recent'" class="cms-scene-news-recent">
    <figure v-if="presentation?.samples?.[0]" class="cms-scene-news-recent-main">
     <AdminThumbnail :src="presentation.samples[0].image" :alt="presentation.samples[0].title+'封面'" />
     <figcaption>{{ presentation.samples[0].title }}</figcaption>
    </figure>
    <div class="cms-scene-news-recent-sidebar">
     <h3 :class="{'is-focused':highlighted('copy.text4')}">{{ bodies['view-pages-news-index']?.copy?.text4 || block.name }}</h3>
     <ol v-if="scene.items.length">
      <li v-for="item in scene.items" :key="item.id" :class="{'is-selected':item.id===selected?.value?.id}" :aria-current="item.id===selected?.value?.id?'true':undefined">
       <AdminThumbnail :src="item.image" :alt="item.title+'封面'" />
       <div><small v-if="item.date">{{ item.date }}</small><strong>{{ item.title }}</strong><small v-if="item.enabled===false">更新官網後隱藏</small></div>
      </li>
     </ol>
     <p v-else class="cms-field-help">官網側欄目前沒有文章。</p>
    </div>
   </div>
   <template v-else-if="scene.kind==='page-breadcrumb'">
    <header class="cms-scene-news-hero">
     <AdminThumbnail v-if="scene.contextImage" :src="scene.contextImage" :alt="pageTitle+'頁首照片'" />
     <div>
      <strong>{{ trailCopy?.text1 }}</strong>
      <p><span :class="{'is-focused':highlighted('copy.breadcrumbHome')}">{{ pageTrail.breadcrumbHome }}</span> / <span :class="{'is-focused':highlighted('copy.breadcrumbList')}">{{ pageTrail.breadcrumbList }}</span></p>
     </div>
    </header>
    <p class="cms-field-help">{{ isCatalogueTrail?'從系列內頁進入型錄時，中間會顯示該系列的返回連結。':'列表與文章會使用同一組導覽文字。' }}</p>
   </template>
   <template v-else-if="scene.kind==='breadcrumb'||scene.kind==='news-shared'">
    <header v-if="scene.kind==='breadcrumb'" class="cms-scene-news-hero">
     <AdminThumbnail v-if="breadcrumb.image" :src="breadcrumb.image" alt="文章頁首背景" />
     <div>
      <strong :class="{'is-focused':highlighted('copy.text1')}">{{ breadcrumb.title }}</strong>
      <p v-if="breadcrumb.trail"><span :class="{'is-focused':highlighted('copy.breadcrumbHome')}">{{ breadcrumb.trail.breadcrumbHome }}</span> / <span :class="{'is-focused':highlighted('copy.breadcrumbParent')}">{{ breadcrumb.trail.breadcrumbParent }}</span> / <span :class="{'is-focused':highlighted('copy.breadcrumbList')}">{{ breadcrumb.trail.breadcrumbList }}</span></p>
      <p v-else>首頁 / 優惠消息 / {{ pageTitle }}</p>
     </div>
    </header>
    <div v-if="!breadcrumb.trail||scene.kind==='news-shared'" class="cms-scene-news-meta">
     <span v-for="category in breadcrumb.categories" :key="category.path" :class="{'is-focused':highlighted(category.path)||highlighted(category.destination)}">{{ category.value }}</span>
     <time v-if="breadcrumb.article?.date">{{ breadcrumb.article.date }}</time>
    </div>
    <h3 v-if="breadcrumb.article?.title" class="cms-scene-news-title">{{ breadcrumb.article.title }}</h3>
    <AdminThumbnail v-if="breadcrumb.article?.image" :src="breadcrumb.article.image" :alt="breadcrumb.article.alt" class="cms-scene-wide-image" />
    <div v-if="scene.kind==='news-shared'" class="cms-scene-buttons" aria-label="文章底部的分類選單">
     <span v-for="category in breadcrumb.sharedCategories" :key="category.path" :class="{'is-focused':highlighted(category.path)||highlighted(category.destination)}">{{ category.value }}</span>
    </div>
   </template>
   <template v-else-if="scene.kind==='hero'">
    <div class="cms-scene-hero"><AdminThumbnail v-if="scene.image||scene.contextImage" :src="scene.image||scene.contextImage" :alt="block?.name+'主圖片位置'" /><div class="cms-scene-hero-copy"><span v-for="f in eyebrows" :key="f.path" :class="{'is-focused':highlighted(f.path)}">{{ f.value }}</span><h3 v-for="f in headings" :key="f.path" :class="{'is-focused':highlighted(f.path)}">{{ f.value }}</h3><h3 v-if="!headings.length">{{ scene.title }}</h3><p v-for="f in captions.slice(0,2)" :key="f.path" :class="{'is-focused':highlighted(f.path)}">{{ f.value }}</p></div></div>
   </template>
   <template v-else>
    <header v-if="scene.fixedAction" class="cms-scene-heading">
     <h3>{{ scene.fixedAction==='廚房商品型錄下載'?'廚房商品型錄':'延伸閱讀' }}</h3>
     <div class="cms-scene-buttons"><span :class="{'is-focused':scene.destination&&highlighted(scene.destination.path)}">{{ scene.fixedAction }}<ArrowRight :size="13" /></span></div>
    </header>
    <header v-else-if="seriesHeading" class="cms-scene-series-heading">
     <template v-for="f in seriesHeading" :key="f.path">
      <small v-if="f.path==='copy.englishLabel'" class="cms-series-heading-label" :class="{'is-focused':highlighted(f.path)}">{{ f.value }}</small>
      <small v-else-if="f.path==='copy.englishLead'" :class="{'is-focused':highlighted(f.path)}">{{ f.value }}</small>
      <h3 v-else-if="f.path==='copy.chineseTitle'" :class="{'is-focused':highlighted(f.path)}">{{ f.value }}</h3>
      <strong v-else :class="{'is-focused':highlighted(f.path)}">{{ f.value }}</strong>
     </template>
    </header>
    <header v-else-if="headings.length||eyebrows.length" class="cms-scene-heading"><small v-for="f in eyebrows" :key="f.path" :class="{'is-focused':highlighted(f.path)}">{{ f.value }}</small><h3 v-for="f in headings" :key="f.path" :class="{'is-focused':highlighted(f.path)}">{{ f.value }}</h3></header>
    <template v-if="scene.kind==='filter'">
     <div class="cms-scene-filter">
      <strong :class="{'is-focused':highlighted('copy.text3')}">{{ bodies['view-pages-gallery-index']?.copy?.text3 }}</strong>
      <span :class="{'is-focused':highlighted('copy.text4')}">{{ bodies['view-pages-gallery-index']?.copy?.text4 }}</span>
      <span v-for="[region] in regions" :key="region" :class="{'is-focused':block?.storeRegion===region}">{{ region }}</span>
     </div>
     <div class="cms-scene-filter">
      <strong :class="{'is-focused':highlighted('copy.text5')}">{{ bodies['view-pages-gallery-index']?.copy?.text5 }}</strong>
      <span v-for="(city,index) in filterCities" :key="index" :class="{'is-focused':block?.storeRegion&&selected?.index===index}">{{ city }}</span>
     </div>
     <AdminThumbnail v-if="filterImage" :src="filterImage" :alt="block?.name+'下方的門市清單位置'" class="cms-scene-wide-image" />
    </template>
    <template v-else-if="scene.kind==='results'"><p v-for="f in scene.text" :key="f.path" class="cms-scene-result" :class="{'is-focused':highlighted(f.path)}"><Search :size="18" aria-hidden="true" />{{ (bodies['data-storeCases']?.storeCases?.length||0)+f.value }}</p><AdminThumbnail v-if="presentation?.specialImage" :src="presentation.specialImage" :alt="pageTitle+'搜尋結果第一張案例照片'" class="cms-scene-wide-image" /></template>
    <template v-else-if="scene.kind==='empty'"><div class="cms-scene-empty"><Search :size="25" /><p v-for="f in captions" :key="f.path" :class="{'is-focused':highlighted(f.path)}">{{ f.value }}</p></div></template>
    <template v-else-if="scene.kind==='navigation'||scene.kind==='footer'"><div class="cms-scene-navigation" :class="{'is-footer':scene.kind==='footer'}"><h3 v-if="selected">{{ selected.caption }}</h3><div v-if="links.length" class="cms-scene-link-grid"><span v-for="(link,index) in links" :key="index">{{ link.label||link.title }}<ArrowRight :size="12" /></span></div><p v-for="f in captions" :key="f.path" :class="{'is-focused':highlighted(f.path)}">{{ f.value }}</p><div v-if="media.length" class="cms-scene-nav-media"><AdminThumbnail v-for="f in media" :key="f.path" :src="f.image" :alt="f.label" :class="{'is-focused':highlighted(f.path)}" contain /></div><AdminThumbnail v-else-if="scene.image" :src="scene.image" :alt="block?.name+'導覽位置圖'" contain /></div></template>
    <template v-else-if="scene.kind==='faq'"><AdminThumbnail v-if="scene.image" :src="scene.image" :alt="block?.name+'問答位置圖'" class="cms-scene-small-image" /><h3 v-if="selected" class="cms-scene-item-title">{{ selected.caption }}</h3><div v-for="(item,index) in scene.questions" :key="index" class="cms-scene-question"><strong>{{ item.question||item.title||item.label }}</strong><Plus :size="15" /><p v-if="index===0">{{ item.answer||item.intro }}</p></div></template>
    <template v-else-if="scene.kind==='form'"><AdminThumbnail v-if="scene.image||scene.contextImage" :src="scene.image||scene.contextImage" :alt="block?.name+'表單與聯絡資訊位置圖'" class="cms-scene-wide-image" /><p v-for="f in captions" :key="f.path" :class="{'is-focused':highlighted(f.path)}">{{ f.value }}</p><div class="cms-scene-form-fields" aria-label="官網表單填寫位置示意"><span v-for="name in ['聯絡人','聯絡電話','建設公司','電子信箱']" :key="name">{{ name }}<i /></span></div></template>
    <template v-else-if="scene.kind==='map'||scene.kind==='stores'">
     <p v-if="block?.id==='home:全台門市據點'" class="cms-scene-map-label"><MapPin :size="17" aria-hidden="true" /> 官網地圖旁的門市資料</p>
     <article v-for="store in previewStores" :key="store.name" class="cms-scene-store-card">
      <AdminThumbnail v-if="store.image" :src="store.image" :alt="store.name+'照片'" class="cms-scene-wide-image" />
      <h3 class="cms-scene-item-title">{{ store.name }}</h3>
      <p v-if="store.address">{{ store.address }}</p><p v-if="store.hours">{{ store.hours }}</p><p v-if="store.phone">{{ store.phone }}</p>
     </article>
     <dl v-if="scene.kind==='map'&&regions.length" class="cms-scene-details"><template v-for="[region,cities] in regions" :key="region"><dt>{{ region }}</dt><dd>{{ cities.join('、') }}</dd></template></dl>
     <dl v-if="scene.details.length" class="cms-scene-details"><template v-for="f in scene.details" :key="f.label"><dt>{{ f.label }}</dt><dd>{{ f.value }}</dd></template></dl>
    </template>
    <template v-else-if="scene.kind==='video'"><div v-if="scene.image" class="cms-scene-video"><AdminThumbnail :src="scene.image" :alt="block?.name+'影片封面位置'" /><Play :size="32" aria-hidden="true" /></div><h3 v-if="selected" class="cms-scene-item-title">{{ selected.caption }}</h3><p v-if="scene.description">{{ scene.description }}</p></template>
    <template v-else-if="scene.kind==='table'"><div v-if="table" class="cms-scene-table-wrap"><table><thead><tr><th :class="{'is-focused':highlighted('copy.text6')}">{{ bodies['view-pages-knowledge-design-systemcabinet']?.copy?.text6||'材質' }}</th><th v-for="(column,index) in table.columns" :key="index">{{ typeof column==='string'?column:column.label }}</th></tr></thead><tbody><tr v-for="(row,index) in table.rows.slice(0,3)" :key="index"><th scope="row">{{ row.label }}</th><td v-for="(cell,i) in row.values" :key="i">{{ cell }}</td></tr></tbody></table></div><p v-for="f in captions" :key="f.path" :class="{'is-focused':highlighted(f.path)}">{{ f.value }}</p></template>
    <template v-else-if="scene.kind==='comments'"><p v-for="f in captions" :key="f.path" :class="{'is-focused':highlighted(f.path)}"><MessageSquare :size="18" aria-hidden="true" />{{ f.value }}</p><div class="cms-scene-form-fields"><span>留言內容<i class="is-long" /></span></div></template>
    <template v-else-if="scene.kind==='download'"><div class="cms-scene-download"><Download :size="28" /><p v-for="f in scene.text" :key="f.path" :class="{'is-focused':highlighted(f.path)}">{{ f.value }}</p></div></template>
    <template v-else-if="scene.items.length">
     <AdminThumbnail v-if="scene.mappedImage&&!scene.items.some((item:any)=>item.image)" :src="scene.mappedImage" :alt="block?.name+'官網圖片'" class="cms-scene-wide-image" />
     <div class="cms-scene-cards" :class="{'is-single':scene.items.length===1,'is-logo':scene.kind==='logos','is-catalogue':scene.kind==='catalogue','is-timeline':scene.kind==='timeline','is-step':scene.kind==='steps'}"><article v-for="(item,index) in scene.items" :key="index"><AdminThumbnail v-if="item.image" :src="item.image" :alt="item.title+'對應圖片'" :contain="['logos','products','steps'].includes(scene.kind)" /><small v-if="item.value?.number||item.value?.englishTitle||item.value?.eyebrow">{{ item.value.number||item.value.englishTitle||item.value.eyebrow }}</small><h3>{{ item.title }}</h3><p v-if="itemText(item)">{{ itemText(item) }}</p><p v-if="item.value?.enabled===false" class="cms-scene-paused">此內容目前暫停顯示</p></article></div></template>
    <template v-else><div v-if="media.length>1" class="cms-scene-media-grid"><figure v-for="f in media" :key="f.path" :class="{'is-focused':highlighted(f.path)}"><AdminThumbnail :src="f.image" :alt="f.label+'對應圖片'" /><figcaption>{{ f.label }}</figcaption></figure></div><AdminThumbnail v-else-if="scene.image" :src="scene.image" :alt="block?.name+(scene.image?'對應圖片':'位置示意圖')" class="cms-scene-wide-image" :contain="!scene.image||scene.kind==='logos'" /><dl v-if="scene.details.length" class="cms-scene-details"><template v-for="f in scene.details" :key="f.label"><dt>{{ f.label }}</dt><dd>{{ f.value }}</dd></template></dl></template>
    <div v-if="!['filter','results','empty','navigation','footer','form','table','comments','download'].includes(scene.kind)" class="cms-scene-reading"><p v-for="f in captions" :key="f.path" :class="{'is-focused':highlighted(f.path)}">{{ f.value }}</p></div>
   </template>
   <div v-if="!storeExampleKind&&!['breadcrumb','page-breadcrumb','news-shared','franchise-support','franchise-download-document','franchise-download-catalogue','franchise-download-breadcrumb','franchise-application'].includes(scene.kind)&&scene.buttons.length" class="cms-scene-buttons">
    <span v-for="field in scene.buttons" :key="field.path" :class="{'is-focused':highlighted(field.path)}">{{ field.value }}<ArrowRight :size="13" /></span>
   </div>
   <p v-if="!['franchise-support','franchise-application','franchise-download-document'].includes(scene.kind)&&scene.destination&&(scene.fixedAction||highlighted(scene.destination.path))" class="cms-scene-a11y">前往頁面 <span>{{ destinationTitle }}</span></p>
   <dl v-if="scene.auxiliary.some((f:any)=>highlighted(f.path))" class="cms-scene-details"><template v-for="field in scene.auxiliary.filter((f:any)=>highlighted(f.path))" :key="field.path"><dt>螢幕閱讀器會讀到</dt><dd>{{ field.value }}</dd></template></dl>
   <p v-if="!['breadcrumb','page-breadcrumb','news-shared','inactive','filter'].includes(scene.kind)&&!scene.fixedAction&&!scene.displaySettings.length&&!scene.image&&!scene.items.length&&!scene.texts.length&&!scene.details.length" class="cms-scene-a11y">{{ scene.auxiliary.length?'選取朗讀欄位，可查看訪客會聽到的文字。':'此位置目前沒有可顯示的內容。' }}</p>
  </section>
 </div>
</template>
