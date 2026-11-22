<script setup lang="ts">
import {workspaceFor} from '~/shared/cms/workflow.mjs'
definePageMeta({layout:'admin'})
const {api,message}=useCmsAdmin(),selected=ref<any>(null),error=ref(''),notice=ref(''),busy=ref(false),uploadInput=ref<HTMLInputElement>()
const baseline=ref('')
const pdf=computed(()=>selected.value?.mime==='application/pdf')
const original=ref('')
const {upload,uploading,progress,uploadError}=useCmsUpload()
const dirty=computed(()=>!!selected.value&&JSON.stringify(selected.value)!==baseline.value)
useCmsUnsaved(dirty)
function open(item:any){original.value=item.src;selected.value={...item};baseline.value=JSON.stringify(selected.value);error.value=''}
function close(){if(!busy.value&&(!dirty.value||window.confirm('檔案說明尚未儲存，確定關閉？')))selected.value=null}
async function uploadFile(event:Event){const file=(event.target as HTMLInputElement).files?.[0];if(!file)return;notice.value='';const result=await upload(file);if(result)notice.value='檔案已上傳，可在修改內容時選用。';(event.target as HTMLInputElement).value=''}
async function save(archive=false){if(busy.value)return;if(archive&&!window.confirm('收起後將無法在修改內容時選用，確定收起這個檔案？'))return;error.value='';busy.value=true;try{await api('media',{method:'PATCH',body:{...selected.value,archived:archive}});selected.value=null;await refreshNuxtData('cms-media');notice.value=archive?'已收起這個檔案。':'檔案說明已儲存。'}catch(e){error.value=message(e)}finally{busy.value=false}}
</script>
<template><div class="cms-page"><div class="cms-heading"><div><h1>圖片與檔案</h1><p class="cms-muted">圖片最大 10MB，PDF 最大 30MB。</p></div><button class="cms-button cms-button-gold" :disabled="uploading" @click="uploadInput?.click()">{{ uploading?`上傳中 ${progress}%`:'上傳圖片或檔案' }}</button><input ref="uploadInput" type="file" accept="image/jpeg,image/png,image/webp,application/pdf" class="cms-sr-only" aria-label="上傳圖片或檔案" @change="uploadFile" /></div><p v-if="uploadError||error&&!selected" class="cms-error" role="alert">{{ uploadError||error }}</p><p v-if="notice" class="cms-notice" role="status">{{ notice }}</p><AdminMediaGrid @select="open" /><AdminDialog :open="!!selected" title="圖片或檔案說明" @close="close"><form v-if="selected" class="cms-form" @submit.prevent="save()"><p v-if="error" class="cms-error" role="alert">{{ error }}</p><div class="cms-media-photo cms-media-detail-preview"><AdminMediaPreview :src="selected.src" :origin-url="selected.originUrl" :name="selected.alt||selected.name" :pdf="pdf" @source="original=$event" /></div>
<a :href="original" :download="pdf?selected.name:undefined" target="_blank" rel="noopener" class="cms-button">{{ pdf?'下載 PDF':'查看原圖 ↗' }}</a>
<label>檔案名稱<input v-model="selected.name" required maxlength="255" /></label>
<label>{{ pdf?'檔案說明':'圖片朗讀文字' }}<input v-model="selected.alt" maxlength="500" /><small v-if="!pdf" class="cms-field-help">簡短描述圖片內容，幫助無法看見圖片的人理解。</small></label>
<label>分類<input v-model="selected.category" maxlength="80" /></label>
<details open><summary>引用位置（{{ selected.uses.length }}）</summary><ul v-if="selected.uses.length"><li v-for="u in selected.uses" :key="u.documentId">{{ workspaceFor(u.documentId)?.title||u.title }} · {{ u.state==='published'?'已發布':u.state==='draft'?'草稿':'過去版本' }}</li></ul><p v-else class="cms-muted">目前未確認官網引用此檔案。</p></details>
<p v-if="selected.uses.length" class="cms-field-help">已記錄的引用可用於查看使用位置。仍有內容或版本引用時，收起功能會停用。</p><div class="cms-actions"><button type="button" class="cms-button" :disabled="busy||selected.uses.length>0" @click="save(true)">收起不用的檔案</button><button class="cms-button cms-button-gold" :disabled="busy">{{ busy?'儲存中…':'儲存說明' }}</button></div></form></AdminDialog></div></template>
