<script setup lang="ts">
import {pageEditorLink} from '~/shared/cms/page-editors.mjs'
const props=defineProps<{modelValue:any;schema:any;documentId?:string;path:string}>()
const emit=defineEmits<{'update:modelValue':[value:any]}>()
const carousel=ref<HTMLElement>(),story=ref<HTMLElement>(),storySection=ref<HTMLElement>()
const route=useRoute()
const mainSchema=computed(()=>({...props.schema,fields:Object.fromEntries(Object.entries(props.schema.fields||{}).filter(([key])=>!['images','article','contact','reservationUrl','reviews'].includes(key)))}))
const contactSchema=computed(()=>({...props.schema.fields.contact,fields:Object.fromEntries(Object.entries(props.schema.fields.contact.fields).filter(([key])=>!['reservationUrl','lineUrl','mapUrl'].includes(key)))}))
const firstStory=computed(()=>Math.max(0,(props.modelValue.article||[]).findIndex((section:any)=>section.images?.length)))
function update(key:string,value:any){emit('update:modelValue',{...props.modelValue,[key]:value})}
function jump(target:'carousel'|'story'){const heading=target==='carousel'?carousel.value:storySection.value?.querySelector<HTMLElement>('.cms-item-editor-heading')||story.value;heading?.focus({preventScroll:true});heading?.scrollIntoView({block:'start',behavior:'instant'})}
</script>
<template>
 <div class="cms-store-case-form">
  <nav class="cms-actions cms-store-case-shortcuts" aria-label="案例圖片編輯入口"><button type="button" class="cms-button" @click="jump('carousel')">頁首輪播圖片</button><button type="button" class="cms-button" @click="jump('story')">文章段落圖片</button></nav>
  <p class="cms-field-help">輪播與文章配圖分開設定；即使使用同一個檔案，修改其中一處也不會自動更換另一處。</p>
  <AdminFields :model-value="modelValue" :schema="mainSchema" :document-id="documentId" :path="path" @update:model-value="emit('update:modelValue',$event)" />
  <fieldset class="cms-fields cms-store-case-link-group" :data-cms-path="path+'.reservationUrl'"><legend>推薦案例卡片 · 預約門市（備用連結）</legend><p class="cms-field-help">推薦案例卡片優先使用下方 LINE 諮詢連結；未設定 LINE 時，才使用此網址。</p><AdminFields :model-value="modelValue.reservationUrl" :schema="schema.fields.reservationUrl" :document-id="documentId" :path="path+'.reservationUrl'" @update:model-value="update('reservationUrl',$event)" /><p v-if="modelValue.contact?.lineUrl" class="cms-field-help">目前有設定 LINE，此備用網址尚未使用。</p></fieldset>
  <section class="cms-store-case-contact">
   <h3>門市資訊與連結</h3>
   <AdminFields :model-value="modelValue.contact" :schema="contactSchema" :document-id="documentId" :path="path+'.contact'" @update:model-value="update('contact',$event)" />
   <fieldset v-for="link in [{key:'lineUrl',title:'LINE 諮詢按鈕',help:'案例內頁的 LINE 諮詢按鈕與推薦案例卡片的「預約門市」共用此連結。'},{key:'mapUrl',title:'Google Map 按鈕',help:'控制 Google Map 按鈕及地圖下方的「查看完整位置」。內嵌地圖另依門市地址定位。'}]" :key="link.key" class="cms-fields cms-store-case-link-group"><legend>{{ link.title }}</legend><p class="cms-field-help">{{ link.help }}</p><AdminFields :model-value="modelValue.contact?.[link.key]" :schema="schema.fields.contact.fields[link.key]" :document-id="documentId" :path="path+'.contact.'+link.key" @update:model-value="update('contact',{...modelValue.contact,[link.key]:$event})" /></fieldset>
   <p class="cms-field-help">案例內頁的兩個「到店預約」按鈕另有共用設定：</p>
   <div class="cms-actions"><NuxtLink class="cms-button" :to="pageEditorLink('store-cases',route.query,'store-cases:上方到店預約')">上方到店預約設定</NuxtLink><NuxtLink class="cms-button" :to="pageEditorLink('store-cases',route.query,'store-cases:門市資訊旁到店預約')">門市資訊旁到店預約設定</NuxtLink></div>
   <details v-if="modelValue.contact?.reservationUrl!==undefined" class="cms-secondary cms-unused-reservation"><summary>舊版預約連結（官網未使用）</summary><p class="cms-field-help">這個舊欄位目前沒有對應任何官網按鈕，保留原資料供查閱。</p><label class="cms-field" :data-cms-path="path+'.contact.reservationUrl'">舊版預約連結（唯讀）<input type="url" :value="modelValue.contact.reservationUrl" readonly /></label></details>
  </section>
  <AdminFields v-if="schema.fields.reviews" :model-value="modelValue.reviews" :schema="schema.fields.reviews" :document-id="documentId" :path="path+'.reviews'" @update:model-value="update('reviews',$event)" />
  <section class="cms-store-case-image-section">
   <h3 ref="carousel" tabindex="-1" :data-cms-path="path+'.images'">頁首輪播圖片</h3>
   <p class="cms-field-help">官網案例內頁最上方的輪播。第一張也會用於設計靈感案例卡片。</p>
   <AdminFields :model-value="modelValue.images" :schema="schema.fields.images" :document-id="documentId" :path="path+'.images'" @update:model-value="update('images',$event)" />
  </section>
  <section ref="storySection" class="cms-store-case-image-section">
   <h3 ref="story" tabindex="-1" :data-cms-path="path+'.article.'+firstStory+'.images'">文章段落圖片</h3>
   <p class="cms-field-help">選擇下方段落，再點圖片即可更換；段落標題與內文可在同一處編輯。右側「看位置」會對應目前段落。</p>
   <AdminItems :model-value="modelValue.article||[]" :schema="schema.fields.article" :document-id="documentId" :path="path+'.article'" :display-name="(section:any)=>section.title||'文章開頭'" @update:model-value="update('article',$event)">
    <template #list="{rows,choose,add}">
     <div class="cms-items-tools"><strong>文章段落 <span class="cms-count">{{ rows.length }}</span></strong><button type="button" class="cms-button" @click="add">新增段落</button></div>
     <div class="cms-store-case-story-list"><button v-for="row in rows" :key="row.key" type="button" class="cms-item-open cms-store-case-story-entry" @click="choose(row)">
      <AdminThumbnail :src="row.value.images?.[0]" :alt="'第 '+(row.index+1)+' 段配圖'" />
      <span><strong>第 {{ row.index+1 }} 段 · {{ row.value.title||'文章開頭' }}</strong><small>{{ row.value.images?.length||0 }} 張圖片 · 編輯本段圖片與內文</small></span>
     </button></div>
    </template>
    <template #editor="{row}">
     <AdminFields :model-value="row.value.images" :schema="schema.fields.article.item.fields.images" :document-id="documentId" :path="path+'.article.'+row.index+'.images'" @update:model-value="update('article',modelValue.article.map((section:any,index:number)=>index===row.index?{...section,images:$event}:section))" />
     <AdminFields :model-value="row.value" :schema="{...schema.fields.article.item,fields:Object.fromEntries(Object.entries(schema.fields.article.item.fields).filter(([key])=>key!=='images'))}" :document-id="documentId" :path="path+'.article.'+row.index" @update:model-value="update('article',modelValue.article.map((section:any,index:number)=>index===row.index?$event:section))" />
    </template>
   </AdminItems>
  </section>
 </div>
</template>
