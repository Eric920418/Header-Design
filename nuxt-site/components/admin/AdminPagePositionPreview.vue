<script setup lang="ts">
import {ArrowRight,Play,Plus,Search,MessageSquare,Download,MapPin} from 'lucide-vue-next'
import {destinationGroups} from '~/shared/cms/navigation.mjs'
import {pagePositionContent,newsBreadcrumbPosition} from '~/shared/cms/workbench.mjs'
const props=defineProps<{block:any;bodies:Record<string,any>;selected?:any;pageTitle:string;presentation?:any;focusedField?:string}>()
const {data:sitePages}=useNuxtData<any[]>('cms-pages')
const {data:workspaces}=useNuxtData<any[]>('cms-workspaces')
const destinationName=computed(()=>{
 const url=scene.value.destination?.value
 if(!url)return '沿用既有連結'
 if(url==='/')return '首頁'
 return destinationGroups(sitePages.value||[],workspaces.value||[]).flatMap(group=>group.links).find(page=>page.href===url)?.title||url
})
const scene=computed(()=>pagePositionContent(props.block,props.bodies,props.presentation,props.selected,props.focusedField))
const breadcrumb=computed(()=>newsBreadcrumbPosition(props.block,props.bodies,props.presentation))
const highlighted=(path:string)=>props.focusedField===path
const isLabel=(label:string)=>/標籤|小標|前置英文/.test(label)
const headings=computed(()=>scene.value.heading.filter((f:any)=>!isLabel(f.label)&&!/語音/.test(f.label)))
const eyebrows=computed(()=>scene.value.heading.filter((f:any)=>isLabel(f.label)))
const seriesHeading=computed(()=>props.block?.id==='home:品牌系列'?scene.value.heading.filter((f:any)=>['copy.englishLabel','copy.englishLead','copy.chineseTitle','copy.englishTitleFirst','copy.englishTitleSecond'].includes(f.path)):null)
const regions=computed(()=>Object.entries(props.bodies['data-storeCases']?.regionCities||{}) as [string,string[]][])
const captions=computed(()=>scene.value.bodyText.filter((f:any)=>!/供語音|載入|失敗|格式欄位|頁數欄位|大小欄位/.test(f.label)))
const media=computed(()=>scene.value.media.filter((f:any,index:number)=>index<3||highlighted(f.path)))
const itemText=(item:any)=>{const text=item.value?.summary?.excerpt||item.value?.intro?.paragraphs||item.value?.description||item.value?.paragraphs||item.value?.detail||item.value?.copy||item.value?.quote||item.value?.excerpt||item.value?.summary||'';return Array.isArray(text)?text.join('\n'):typeof text==='string'?text:''}
const formFields=computed(()=>props.block?.id.startsWith('franchise-form:')?['姓名','電子郵件','聯絡電話','居住地']:['聯絡人','聯絡電話','建設公司','電子信箱'])
const links=computed(()=>scene.value.items.flatMap((i:any)=>i.value?.children||i.value?.links||[i.value]).map((i:any)=>Array.isArray(i)?{label:i[0]}:i).filter((i:any)=>i?.label||i?.title).slice(0,8))
const previewStores=computed(()=>scene.value.items.map((i:any)=>({name:i.value?.storeName||i.value?.name||i.title,address:i.value?.address,hours:i.value?.hours,phone:i.value?.contact?.phone||i.value?.phone,image:i.image})).filter((i:any)=>i.address||i.image))
const table=computed(()=>{const f=props.block?.fields.find((f:any)=>f.path==='systemCabinetMaterials');return f?props.bodies[f.documentId]?.[f.path]:null})
</script>
<template>
 <div class="cms-page-position-scene cms-website-scene" :data-position-kind="scene.kind">
  <div class="cms-position-sitebar"><span>設計案例 · 廚房產品 · 門市與服務</span><img src="/home-2026/logos/sakura-kitchen-horizontal.svg" alt="SAKURA KITCHEN" /><span>品牌承諾 · 我要加盟</span></div>
  <div v-if="scene.contextImage&&!scene.displaySettings.length&&!['hero','breadcrumb','inactive','registration'].includes(scene.kind)&&!scene.fixedAction" class="cms-scene-context-image"><AdminThumbnail :src="scene.contextImage" :alt="pageTitle+'頁面位置參照'" /><span>{{ pageTitle }}</span></div>
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
   <template v-else-if="scene.kind==='registration'">
    <small v-if="presentation?.registration?.title">{{ presentation.registration.title }}</small>
    <h3 v-if="presentation?.registration?.heading">{{ presentation.registration.heading }}</h3>
    <AdminThumbnail v-for="image in presentation?.registration?.images" :key="image.src" :src="image.src" :alt="image.alt||'報名 QR Code'" class="cms-scene-wide-image" />
    <p v-for="f in captions" :key="f.path" :class="{'is-focused':highlighted(f.path)}">{{ f.value }}</p>
    <p v-if="!presentation?.registration" class="cms-scene-a11y">報名文章目前沒有可顯示的公開範例。</p>
   </template>
   <template v-else-if="scene.kind==='breadcrumb'">
    <header class="cms-scene-news-hero">
     <AdminThumbnail v-if="breadcrumb.image" :src="breadcrumb.image" alt="文章頁首背景" />
     <div>
      <strong :class="{'is-focused':highlighted('copy.text1')}">{{ breadcrumb.title }}</strong>
      <p>首頁 / 優惠消息 / {{ pageTitle }}</p>
     </div>
    </header>
    <div class="cms-scene-news-meta">
     <span v-for="category in breadcrumb.categories" :key="category.path" :class="{'is-focused':highlighted(category.path)||highlighted(category.destination)}">{{ category.value }}</span>
     <time v-if="breadcrumb.article?.date">{{ breadcrumb.article.date }}</time>
    </div>
    <h3 v-if="breadcrumb.article?.title" class="cms-scene-news-title">{{ breadcrumb.article.title }}</h3>
    <AdminThumbnail v-if="breadcrumb.article?.image" :src="breadcrumb.article.image" :alt="breadcrumb.article.alt" class="cms-scene-wide-image" />
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
    <template v-if="scene.kind==='filter'"><div class="cms-scene-filter"><strong :class="{'is-focused':highlighted('copy.text3')}">{{ bodies['view-pages-gallery-index']?.copy?.text3 }}</strong><span :class="{'is-focused':highlighted('copy.text4')}">{{ bodies['view-pages-gallery-index']?.copy?.text4 }}</span><span v-for="[region] in regions" :key="region">{{ region }}</span></div><div class="cms-scene-filter"><strong :class="{'is-focused':highlighted('copy.text5')}">{{ bodies['view-pages-gallery-index']?.copy?.text5 }}</strong><span v-for="city in regions[0]?.[1]?.slice(0,3)||[]" :key="city">{{ city }}</span></div><AdminThumbnail v-if="presentation?.specialImage" :src="presentation.specialImage" :alt="block?.name+'下方的門市清單位置'" class="cms-scene-wide-image" /></template>
    <template v-else-if="scene.kind==='results'"><p v-for="f in scene.text" :key="f.path" class="cms-scene-result" :class="{'is-focused':highlighted(f.path)}"><Search :size="18" aria-hidden="true" />{{ (bodies['data-storeCases']?.storeCases?.length||0)+f.value }}</p><AdminThumbnail v-if="presentation?.specialImage" :src="presentation.specialImage" :alt="pageTitle+'搜尋結果第一張案例照片'" class="cms-scene-wide-image" /></template>
    <template v-else-if="scene.kind==='empty'"><div class="cms-scene-empty"><Search :size="25" /><p v-for="f in captions" :key="f.path" :class="{'is-focused':highlighted(f.path)}">{{ f.value }}</p></div></template>
    <template v-else-if="scene.kind==='navigation'||scene.kind==='footer'"><div class="cms-scene-navigation" :class="{'is-footer':scene.kind==='footer'}"><h3 v-if="selected">{{ selected.caption }}</h3><div v-if="links.length" class="cms-scene-link-grid"><span v-for="(link,index) in links" :key="index">{{ link.label||link.title }}<ArrowRight :size="12" /></span></div><p v-for="f in captions" :key="f.path" :class="{'is-focused':highlighted(f.path)}">{{ f.value }}</p><div v-if="media.length" class="cms-scene-nav-media"><AdminThumbnail v-for="f in media" :key="f.path" :src="f.image" :alt="f.label" :class="{'is-focused':highlighted(f.path)}" contain /></div><AdminThumbnail v-else-if="scene.image" :src="scene.image" :alt="block?.name+'導覽位置圖'" contain /></div></template>
    <template v-else-if="scene.kind==='faq'"><AdminThumbnail v-if="scene.image" :src="scene.image" :alt="block?.name+'問答位置圖'" class="cms-scene-small-image" /><h3 v-if="selected" class="cms-scene-item-title">{{ selected.caption }}</h3><div v-for="(item,index) in scene.questions" :key="index" class="cms-scene-question"><strong>{{ item.question||item.title||item.label }}</strong><Plus :size="15" /><p v-if="index===0">{{ item.answer||item.intro }}</p></div></template>
    <template v-else-if="scene.kind==='form'"><AdminThumbnail v-if="scene.image||scene.contextImage" :src="scene.image||scene.contextImage" :alt="block?.name+'表單與聯絡資訊位置圖'" class="cms-scene-wide-image" /><p v-for="f in captions" :key="f.path" :class="{'is-focused':highlighted(f.path)}">{{ f.value }}</p><div class="cms-scene-form-fields" aria-label="官網表單填寫位置示意"><span v-for="name in formFields" :key="name">{{ name }}<i /></span></div></template>
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
   <div v-if="scene.kind!=='breadcrumb'&&scene.buttons.length" class="cms-scene-buttons">
    <span v-for="field in scene.buttons" :key="field.path" :class="{'is-focused':highlighted(field.path)}">{{ field.value }}<ArrowRight :size="13" /></span>
   </div>
   <p v-if="scene.destination&&(scene.fixedAction||highlighted(scene.destination.path))" class="cms-scene-a11y">前往頁面 <span>{{ destinationName }}</span></p>
   <dl v-if="scene.auxiliary.some((f:any)=>highlighted(f.path))" class="cms-scene-details"><template v-for="field in scene.auxiliary.filter((f:any)=>highlighted(f.path))" :key="field.path"><dt>{{ field.label }}</dt><dd>{{ field.value }}</dd></template></dl>
   <p v-if="!['breadcrumb','registration','inactive'].includes(scene.kind)&&!scene.fixedAction&&!scene.displaySettings.length&&!scene.image&&!scene.items.length&&!scene.texts.length&&!scene.details.length" class="cms-scene-a11y">{{ scene.auxiliary.length?'這裡設定語音朗讀或其他輔助資訊。可選取欄位查看對應文字。':'此位置目前沒有可顯示的內容。' }}</p>
  </section>
 </div>
</template>
