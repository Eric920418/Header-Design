<script setup lang="ts">
import {ArrowRight} from 'lucide-vue-next'
import {firstImage,rowName} from '~/shared/cms/workflow.mjs'
import {kitchenHeroStory} from '~/shared/cms/kitchen-series-hero.mjs'
import {seriesEditorSection} from '~/shared/cms/series-editor.mjs'
import {KITCHEN_EQUIPMENT_CUTOUTS} from '~/data/kitchenEquipmentCutouts'

const props=defineProps<{part:string;item?:any;focusedField?:string}>()
const section=computed(()=>seriesEditorSection(props.part))
const heroImage=computed(()=>firstImage(props.item?.heroSlides))
const suiteImage=computed(()=>firstImage(props.item?.suites))
const story=computed(()=>props.item&&kitchenHeroStory(props.item,heroImage.value))
const cards=computed(()=>{
 const rows=props.item?.[props.part]
 if(!Array.isArray(rows))return []
 const index=props.focusedField?.match(new RegExp('\\.'+props.part+'\\.(\\d+)(?:\\.|$)'))?.[1]
 const shown=index!==undefined&&rows[Number(index)]?[rows[Number(index)]]:rows.slice(0,3)
 return shown.map((row:any,index:number)=>({
  title:rowName(row,index),
  caption:props.part==='finishes'?row.code:props.part==='equipment'?row.model:'',
  image:props.part==='equipment'?(KITCHEN_EQUIPMENT_CUTOUTS[row.image]||row.image):firstImage(row),
 }))
})
const buttons:Record<string,string>={catalogue:'品牌系列型錄',explore:'探索設計案例',booking:'立即預約',moreCases:'探索設計靈感'}
</script>

<template>
 <div class="cms-page-position-scene cms-website-scene">
  <div class="cms-position-sitebar"><span>設計案例 · 品牌系列</span><img src="/home-2026/logos/sakura-kitchen-horizontal.svg" alt="SAKURA KITCHEN" /><span>官網導覽</span></div>
  <section class="cms-scene-target" :aria-label="section.name+'的位置示意'">
   <span class="cms-scene-tag">{{ section.name }}</span>
   <p v-if="!item" class="cms-field-help">選擇系列查看官網位置。</p>
   <template v-else>
    <div v-if="part==='hero'" class="cms-scene-hero">
     <AdminThumbnail v-if="heroImage" :src="heroImage" :alt="item.name+'主視覺'" />
     <div class="cms-scene-hero-copy"><h3>{{ story?.title||item.name }}</h3><span v-if="story?.subtitle">{{ story.subtitle }}</span></div>
    </div>
    <template v-else-if="part==='intro'">
     <h3>{{ item.intro?.title }}</h3>
     <p v-for="(paragraph,index) in item.intro?.paragraphs" :key="index">{{ paragraph }}</p>
    </template>
    <div v-else-if="cards.length" class="cms-scene-cards" :class="{'is-single':cards.length===1,'is-logo':part==='finishes'||part==='equipment'}">
     <article v-for="(card,index) in cards" :key="index">
      <AdminThumbnail v-if="card.image" :src="card.image" :alt="card.title" :contain="part==='finishes'||part==='equipment'" />
      <small v-if="card.caption">{{ card.caption }}</small>
      <h3>{{ card.title }}</h3>
     </article>
    </div>
    <p v-else class="cms-field-help">{{ part==='cases'?'此系列目前尚無公開推薦案例。':'此系列目前沒有這個區塊的項目。' }}</p>
    <div v-if="section.buttons.length&&(part!=='cases'||!cards.length)" class="cms-scene-buttons">
     <span v-for="key in section.buttons" :key="key" :class="{'is-focused':focusedField?.endsWith('.buttonDestinations.'+key)}">{{ buttons[key] }}<ArrowRight :size="13" aria-hidden="true" /></span>
    </div>
   </template>
  </section>
  <div v-if="part==='intro'&&suiteImage" class="cms-scene-series-context">
   <small>下方區塊・套系與特色</small>
   <AdminThumbnail :src="suiteImage" :alt="item.name+'套系空間'" />
  </div>
 </div>
</template>
