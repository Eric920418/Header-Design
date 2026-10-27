<script setup lang="ts">
import {workspaceFor,workspaceDefaults,cmsDate} from '~/shared/cms/workflow.mjs'
definePageMeta({layout:'admin'})
const {api,message}=useCmsAdmin(),q=ref('')
const {data:names}=useNuxtData<any[]>('cms-workspaces')
const {data:rows,error:loadError,refresh}=await useAsyncData<any[]>('cms-audit',()=>api('audit'))
const actions:Record<string,string>={save:'儲存內容',publish:'更新官網',unpublish:'暫停官網顯示',restore:'取回以前內容',login:'登入後台','account-update':'修改帳號','password-change':'更換密碼','media-upload':'上傳圖片或檔案','media-update':'修改檔案說明',review:'儲存申請或留言處理結果'}
function subject(row:any){const w=workspaceFor(row.subject);return names.value?.find(n=>n.id===w?.id)?.title||workspaceDefaults.find((n:any)=>n.id===w?.id)?.title||(row.action==='login'?row.subject:row.action.startsWith('media-')?'圖片或檔案':row.action==='account-update'?'後台帳號':row.action==='review'?'申請或留言':'網站內容')}
const filtered=computed(()=>(rows.value||[]).filter(r=>`${r.actorName||'系統'} ${actions[r.action]||'其他操作'} ${subject(r)}`.includes(q.value)))
</script>
<template><div class="cms-page"><div class="cms-heading"><div><h1>操作紀錄</h1><p class="cms-muted">最近 200 筆操作</p></div><button class="cms-button" @click="refresh()">重新整理</button></div><p v-if="loadError" class="cms-error" role="alert">{{ message(loadError) }}</p><label class="cms-search"><input v-model="q" aria-label="搜尋操作紀錄" placeholder="搜尋人員、工作或頁面名稱" /></label><div class="cms-panel"><div v-for="row in filtered" :key="row.sequence" class="cms-resource-row"><div><strong>{{ row.actorName||'系統' }} · {{ actions[row.action]||'其他操作' }}</strong><small>{{ subject(row) }}</small></div><time>{{ cmsDate(row.createdAt) }}</time></div><p v-if="!filtered.length" class="cms-empty">沒有符合的紀錄</p></div></div></template>
