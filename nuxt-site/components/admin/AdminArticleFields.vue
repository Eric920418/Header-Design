<script setup lang="ts">
import {valueAt} from '~/shared/cms/page-editors.mjs'
import {updateArticleField} from '~/shared/cms/workbench.mjs'
const props=defineProps<{modelValue:any;schema:any;documentId?:string;path?:string}>()
const emit=defineEmits<{'update:modelValue':[value:any]}>()
const video=computed(()=>props.modelValue.summary?.category==='video')
const main=computed(()=>['summary.title','summary.publishedAt','summary.cover','summary.excerpt',...(video.value?['detail.videoId','detail.paragraphs']:['detail.sections'])])
const extra=computed(()=>[
 'detail.cover',...(video.value?['detail.sections']:['detail.paragraphs','detail.videoId']),
 ...Object.keys(props.schema.fields.detail?.fields||{}).filter(k=>!['cover','sections','paragraphs','videoId'].includes(k)).map(k=>'detail.'+k),
 ...Object.keys(props.schema.fields.summary?.fields||{}).filter(k=>!['title','publishedAt','cover','excerpt','category'].includes(k)).map(k=>'summary.'+k),
 ...Object.keys(props.schema.fields).filter(k=>!['summary','detail','enabled'].includes(k))
].filter(p=>field(p)))
function field(path:string){let s=props.schema;for(const key of path.split('.')){if(s?.hidden)return null;s=s?.fields?.[key]}if(!s||s.hidden||Object.hasOwn(s,'fixed'))return null;return {...s,...(path==='detail.sections'?{label:video.value?'圖文補充內容':'文章內文',newItemLabel:'段落'}:path==='detail.paragraphs'?{label:video.value?'影片介紹文字':'文章開頭文字',newItemLabel:'文字'}:path==='detail.cover'?{help:'可使用不同於列表卡片的圖片；未另外選擇時沿用列表圖片。'}:{})}}
function update(path:string,value:any){emit('update:modelValue',updateArticleField(props.modelValue,path,value))}
</script>
<template>
 <div class="cms-article-form">
  <template v-for="name in main" :key="name"><AdminFields v-if="field(name)" :model-value="valueAt(modelValue,name)" :schema="field(name)" :document-id="documentId" :path="`${path}.${name}`" @update:model-value="update(name,$event)" /></template>
  <AdminFields v-if="schema.fields.enabled" :model-value="modelValue.enabled" :schema="schema.fields.enabled" :document-id="documentId" :path="`${path}.enabled`" @update:model-value="update('enabled',$event)" />
  <details v-if="extra.length" class="cms-secondary cms-article-extra"><summary>補充設定：內頁圖片、日期格式與相關連結</summary><div class="cms-article-form"><AdminFields v-for="name in extra" :key="name" :model-value="valueAt(modelValue,name)" :schema="field(name)" :document-id="documentId" :path="`${path}.${name}`" @update:model-value="update(name,$event)" /></div></details>
 </div>
</template>
