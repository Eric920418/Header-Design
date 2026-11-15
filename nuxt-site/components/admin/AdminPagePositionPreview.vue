<script setup lang="ts">
import {ArrowRight,Play,Plus} from 'lucide-vue-next'
import {pagePositionContent,thumbnailPlaceholder} from '~/shared/cms/workbench.mjs'
const props=defineProps<{block:any;bodies:Record<string,any>;selected?:any;pageTitle:string;presentation?:any;focusedField?:string}>()
const scene=computed(()=>pagePositionContent(props.block,props.bodies,props.presentation,props.selected,props.focusedField))
const nearby=computed(()=>scene.value.sections.filter((_:any,i:number)=>Math.abs(i-(props.block?.positionIndex||1)+1)<=1))
const illustration=computed(()=>thumbnailPlaceholder(props.block?.name||''))
const highlighted=(path:string)=>props.focusedField===path
const regions=computed(()=>Object.entries(props.bodies['data-storeCases']?.regionCities||{}) as [string,string[]][])
</script>
<template>
 <div class="cms-page-position-scene" :data-position-kind="scene.kind">
  <div class="cms-position-sitebar"><span>設計案例 · 廚房產品 · 門市與服務</span><img src="/home-2026/logos/sakura-kitchen-horizontal.svg" alt="SAKURA KITCHEN" /><span>品牌承諾 · 我要加盟</span></div>
  <div v-if="scene.heroImage&&scene.kind!=='hero'" class="cms-scene-context-image"><AdminThumbnail :src="scene.heroImage" :alt="pageTitle+'頁面圖片'" /><span>{{ pageTitle }}</span></div>
  <ol v-if="nearby.length" class="cms-scene-locations" aria-label="此區塊在官網的順序"><li v-for="part in nearby" :key="part.name" :class="{'is-current':part.name===block?.name}">{{ part.name===block?.name?'正在修改：':'' }}{{ part.name }}</li></ol>
  <section class="cms-scene-target" :aria-label="block?.name+'的位置示意'">
   <span class="cms-scene-tag">{{ block?.name }}<template v-if="block?.positionIndex"> · 第 {{ block.positionIndex }} 區</template></span>
   <template v-if="scene.kind==='hero'">
    <div class="cms-scene-hero"><AdminThumbnail :src="scene.image||scene.heroImage" :alt="block?.name+'主圖片位置'" /><div class="cms-scene-hero-copy"><strong>{{ scene.title }}</strong><p v-if="scene.description">{{ scene.description }}</p></div></div>
   </template>
   <template v-else-if="scene.kind==='filter'"><div class="cms-scene-filter"><strong :class="{'is-focused':highlighted('copy.text3')}">{{ bodies['view-pages-gallery-index']?.copy?.text3 }}</strong><span :class="{'is-focused':highlighted('copy.text4')}">{{ bodies['view-pages-gallery-index']?.copy?.text4 }}</span><span v-for="[region] in regions" :key="region">{{ region }}</span></div><div class="cms-scene-filter"><strong :class="{'is-focused':highlighted('copy.text5')}">{{ bodies['view-pages-gallery-index']?.copy?.text5 }}</strong><span v-for="city in regions[0]?.[1]?.slice(0,3)||[]" :key="city">{{ city }}</span></div><AdminThumbnail :src="presentation?.specialImage||illustration" :alt="block?.name+'下方的門市清單位置'" class="cms-scene-wide-image" /></template>
   <template v-else-if="scene.kind==='navigation'||scene.kind==='footer'"><div class="cms-scene-nav-image"><AdminThumbnail :src="scene.image||illustration" :alt="block?.name+'導覽位置圖'" contain /><strong>{{ selected?.caption||block?.name }}</strong><div v-if="selected?.value?.children?.length"><span v-for="child in selected.value.children" :key="child.label||child.title">{{ child.label||child.title }}</span></div></div></template>
   <template v-else-if="scene.kind==='faq'"><AdminThumbnail :src="scene.image||illustration" :alt="block?.name+'問答位置圖'" class="cms-scene-small-image" /><strong>{{ selected?.caption||block?.name }}</strong><div v-for="(item,index) in (selected?.value?.items||selected?.value?.questions||scene.items.map((i:any)=>i.value)).slice(0,3)" :key="index" class="cms-scene-question"><span>{{ item.question||item.title||item.label||selected?.caption }}</span><Plus :size="15" /><p v-if="index===0">{{ item.answer||item.intro }}</p></div></template>
   <template v-else-if="scene.kind==='form'"><AdminThumbnail :src="scene.image||illustration" :alt="block?.name+'表單與聯絡資訊位置圖'" class="cms-scene-wide-image" /><div class="cms-scene-form-drawing" aria-label="表單欄位位置示意"><i /><i /><i /><i /></div></template>
   <template v-else-if="scene.kind==='map'||scene.kind==='stores'"><AdminThumbnail :src="scene.image||illustration" :alt="block?.name+'門市位置圖'" class="cms-scene-wide-image" :contain="!scene.image" /><strong>{{ selected?.caption||scene.title }}</strong><p v-if="selected?.value?.address">{{ selected.value.address }}</p><p v-if="selected?.value?.phone">{{ selected.value.phone }}</p></template>
   <template v-else-if="scene.kind==='video'"><div class="cms-scene-video"><AdminThumbnail :src="scene.image||illustration" :alt="block?.name+'影片封面位置'" /><Play :size="32" aria-hidden="true" /></div><p v-if="!scene.image" class="cms-position-note">影片位置示意；完整播放請使用預覽效果。</p></template>
   <template v-else-if="scene.items.length&&['cards','products','catalogue','logos','steps','timeline'].includes(scene.kind)"><div class="cms-scene-cards" :class="{'is-single':scene.items.length===1,'is-logo':scene.kind==='logos'}"><article v-for="(item,index) in scene.items" :key="index"><AdminThumbnail :src="item.image||scene.image||illustration" :alt="item.title+'對應圖片'" :contain="scene.kind==='logos'||scene.kind==='products'" /><strong>{{ item.title }}</strong><p v-if="item.value?.summary?.excerpt||item.value?.description">{{ item.value?.summary?.excerpt||item.value?.description }}</p></article></div></template>
   <template v-else><AdminThumbnail :src="scene.image||illustration" :alt="block?.name+(scene.image?'對應圖片':'位置示意圖')" class="cms-scene-wide-image" :contain="!scene.image||scene.kind==='logos'" /><p v-if="!scene.image" class="cms-position-note">此區塊為文字或操作位置，以上為對應示意圖。</p></template>
   <div v-if="scene.kind!=='filter'" class="cms-scene-copy"><p v-for="field in scene.text" :key="field.path" :class="{'is-focused':highlighted(field.path)}"><small>{{ field.label }}</small><span>{{ field.value||'尚未填寫' }}</span></p></div>
   <div v-if="scene.buttons.length" class="cms-scene-buttons"><span v-for="field in scene.buttons" :key="field.path" :class="{'is-focused':highlighted(field.path)}">{{ field.value }} <ArrowRight :size="13" /></span></div>
  </section>
  <div class="cms-scene-footer">{{ pageTitle }} · 頁尾</div>
 </div>
</template>
