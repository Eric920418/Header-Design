<script setup lang="ts">
const props=defineProps<{selected?:string;picking?:boolean;kind?:'image'|'pdf'}>()
const emit=defineEmits<{select:[media:any]}>()
const {api,message}=useCmsAdmin(),query=ref(''),category=ref('全部'),page=ref(1)
const {data:media,error}=await useAsyncData<any[]>('cms-media',()=>api('media'))
const categories=computed(()=>['全部',...new Set((media.value||[]).filter(i=>!i.archived).map(i=>i.category))])
const filtered=computed(()=>(media.value||[]).filter(i=>!i.archived&&(!props.kind||(props.kind==='pdf'?i.mime==='application/pdf':i.mime.startsWith('image/')))&&(category.value==='全部'||i.category===category.value)&&`${i.name} ${i.alt}`.includes(query.value)))
watch([query,category],()=>page.value=1)
</script>
<template><div class="cms-media-tools"><label class="cms-search"><input v-model="query" aria-label="搜尋素材" placeholder="搜尋素材名稱" /></label><select v-model="category" aria-label="素材分類"><option v-for="c in categories" :key="c">{{ c }}</option></select></div><p v-if="error" class="cms-error" role="alert">{{ message(error) }}</p><div class="cms-media-grid"><button v-for="item in filtered.slice((page-1)*12,page*12)" :key="item.id" class="cms-media-card" :class="{selected:selected===item.src}" :aria-label="`${picking?'選擇':'檢視'} ${item.name}`" @click="emit('select',item)"><div class="cms-media-photo"><AdminImage v-if="item.mime!=='application/pdf'" :src="item.src" :alt="item.alt||item.name" /><span v-else class="cms-pdf-tile">PDF</span></div><div class="cms-media-caption"><strong>{{ item.name }}</strong><span>{{ item.category }}</span></div></button></div><p v-if="!filtered.length" class="cms-empty">尚無素材或沒有符合的項目。可在媒體庫上傳圖片與 PDF。</p><div v-if="filtered.length>12" class="cms-actions cms-pagination"><button class="cms-button" :disabled="page===1" @click="page--">上一頁</button><span>{{ page }}</span><button class="cms-button" :disabled="page*12>=filtered.length" @click="page++">下一頁</button></div></template>
