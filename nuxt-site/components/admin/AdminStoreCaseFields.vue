<script setup lang="ts">
const props=defineProps<{modelValue:any;schema:any;documentId?:string;path:string}>()
const emit=defineEmits<{'update:modelValue':[value:any]}>()
const carousel=ref<HTMLElement>(),story=ref<HTMLElement>(),storySection=ref<HTMLElement>()
const mainSchema=computed(()=>({...props.schema,fields:Object.fromEntries(Object.entries(props.schema.fields||{}).filter(([key])=>!['images','article'].includes(key)))}))
const firstStory=computed(()=>Math.max(0,(props.modelValue.article||[]).findIndex((section:any)=>section.images?.length)))
function update(key:string,value:any){emit('update:modelValue',{...props.modelValue,[key]:value})}
function jump(target:'carousel'|'story'){const heading=target==='carousel'?carousel.value:storySection.value?.querySelector<HTMLElement>('.cms-item-editor-heading')||story.value;heading?.focus({preventScroll:true});heading?.scrollIntoView({block:'start',behavior:'instant'})}
</script>
<template>
 <div class="cms-store-case-form">
  <nav class="cms-actions cms-store-case-shortcuts" aria-label="案例圖片編輯入口"><button type="button" class="cms-button" @click="jump('carousel')">頁首輪播圖片</button><button type="button" class="cms-button" @click="jump('story')">文章段落圖片</button></nav>
  <p class="cms-field-help">輪播與文章配圖分開設定；即使使用同一個檔案，修改其中一處也不會自動更換另一處。</p>
  <AdminFields :model-value="modelValue" :schema="mainSchema" :document-id="documentId" :path="path" @update:model-value="emit('update:modelValue',$event)" />
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
