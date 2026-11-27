<script setup lang="ts">
const props=defineProps<{item:any;block:any;path:string;focusedField?:string}>()
const story=computed(()=>props.block.kind==='store-case-story'),section=computed(()=>props.item.article?.[props.block.sectionIndex])
const photos=computed<string[]>(()=>story.value?section.value?.images||[]:props.item.images||[])
const imagePath=(index:number)=>props.path+(story.value?'.article.'+props.block.sectionIndex:'')+'.images.'+index
</script>
<template>
 <div class="cms-store-case-content-preview" :data-position-kind="block.kind">
  <p class="cms-scene-tag">{{ story?'案例內文 · 第 '+(block.sectionIndex+1)+' 段':'案例內頁頂部輪播' }}</p>
  <template v-if="story">
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
