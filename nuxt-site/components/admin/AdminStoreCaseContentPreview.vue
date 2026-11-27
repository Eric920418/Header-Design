<script setup lang="ts">
import {storeCaseRecommendationDestination} from '~/shared/cms/store-case-links.mjs'
const props=defineProps<{item:any;block:any;path:string;copy?:any;focusedField?:string}>()
const story=computed(()=>props.block.kind==='store-case-story'),section=computed(()=>props.item.article?.[props.block.sectionIndex])
const photos=computed<string[]>(()=>story.value?section.value?.images||[]:props.item.images||[])
const imagePath=(index:number)=>props.path+(story.value?'.article.'+props.block.sectionIndex:'')+'.images.'+index
</script>
<template>
 <div class="cms-store-case-content-preview" :data-position-kind="block.kind">
  <p class="cms-scene-tag">{{ block.kind==='store-case-links'?block.name:story?'案例內文 · 第 '+(block.sectionIndex+1)+' 段':'案例內頁頂部輪播' }}</p>
  <template v-if="block.kind==='store-case-links'">
   <h3>{{ item.contact?.name||item.storeName }}</h3>
   <template v-if="block.linkMode==='unused'"><p>此舊欄位沒有對應官網按鈕，原值保留供查閱。</p><code>{{ item.contact?.reservationUrl }}</code></template>
   <template v-else-if="block.linkMode==='recommendation'"><p>其他案例內頁下方的推薦案例卡片</p><AdminThumbnail :src="item.images?.[0]" :alt="item.title+'推薦案例圖片'" class="cms-store-case-carousel-photo" /><strong>{{ item.title }}</strong><div v-if="storeCaseRecommendationDestination(item)" class="cms-scene-buttons"><span class="is-focused">預約門市</span></div><p v-else>官網不顯示「預約門市」按鈕。</p><code>{{ storeCaseRecommendationDestination(item)||'尚未設定連結' }}</code><p v-if="item.contact?.lineUrl">目前使用 LINE；備用預約網址不會覆蓋它。</p></template>
   <template v-else-if="block.linkMode==='line'"><p>案例內頁的門市資訊</p><div v-if="item.contact?.lineUrl" class="cms-scene-buttons"><span class="is-focused">{{ copy?.text5||'LINE 諮詢' }}</span></div><code>{{ item.contact?.lineUrl||'尚未設定 LINE，官網不顯示此按鈕。' }}</code><p>同時用於推薦案例卡片的「預約門市」。</p></template>
   <template v-else-if="block.linkMode==='map'"><p>{{ item.contact?.address }}</p><div v-if="item.contact?.mapUrl" class="cms-scene-buttons"><span class="is-focused">{{ copy?.text6||'Google Map' }}</span><span class="is-focused">前往 Google Maps 查看完整位置</span></div><code>{{ item.contact?.mapUrl||'尚未設定地圖連結。' }}</code><p>內嵌地圖依門市地址定位；這個網址控制上面兩個外連按鈕。</p></template>
   <template v-else><p>門市資訊內的電話連結</p><div class="cms-scene-buttons"><span class="is-focused">{{ item.contact?.phone }}</span></div><code>{{ 'tel:'+(item.contact?.phone||'').replace(/[^\d+]/g,'') }}</code></template>
  </template>
  <template v-else-if="story">
   <h3 v-if="section?.title">{{ section.title }}</h3><p v-for="(paragraph,index) in section?.paragraphs||[]" :key="index">{{ paragraph }}</p>
   <div v-if="photos.length" class="cms-store-case-story-photos" :class="{'is-pair':section.imageLayout==='pair'}">
    <AdminThumbnail v-for="(photo,index) in photos" :key="index" :src="photo" :alt="item.title+'文章照片 '+(block.sectionIndex+1)+'-'+(index+1)" :class="{'is-focused':focusedField===imagePath(index)}" />
   </div>
   <p v-else class="cms-field-help">本段目前沒有配圖。</p>
   <p v-for="(link,index) in section?.links||[]" :key="index">{{ link.label }}</p>
  </template>
  <template v-else>
   <AdminThumbnail v-if="photos.length" :src="photos[block.photoIndex]" :alt="item.title+' 案例照片 '+(block.photoIndex+1)" class="cms-store-case-carousel-photo" :class="{'is-focused':focusedField===imagePath(block.photoIndex)}" />
   <p v-else class="cms-field-help">目前沒有頁首輪播圖片。</p>
   <div class="cms-store-case-carousel-thumbs"><AdminThumbnail v-for="(photo,index) in photos" :key="index" :src="photo" :alt="'輪播圖片 '+(index+1)" :class="{'is-focused':index===block.photoIndex}" /></div>
  </template>
 </div>
</template>
