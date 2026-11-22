<script setup lang="ts">
const props=defineProps<{selected?:string;picking?:boolean;kind?:'image'|'pdf'}>()
const emit=defineEmits<{select:[media:any]}>()
const context=inject<any>('cms-media-context',ref([])),scope=ref(props.picking?'page':'all')
const uploadInput=ref<HTMLInputElement>(),{upload,uploading,progress,uploadError}=useCmsUpload()
async function uploadFile(event:Event){const file=(event.target as HTMLInputElement).files?.[0];if(!file)return;const result=await upload(file);if(result&&props.picking)emit('select',result);(event.target as HTMLInputElement).value=''}
const {api,message}=useCmsAdmin(),query=ref(''),category=ref('全部'),page=ref(1)
const fileType=ref<'image'|'pdf'>('image'),usage=ref('all')
const useLabels:Record<string,string>={published:'已發布內容有引用',draft:'草稿有引用',history:'過去版本有引用',unverified:'未確認官網引用'}
const {data:media,error,pending,refresh}=await useAsyncData<any[]>('cms-media',()=>api('media'))
const kindFilter=computed(()=>props.kind||(props.picking?undefined:fileType.value))
const matchesKind=(i:any)=>!kindFilter.value||(kindFilter.value==='pdf'?i.mime==='application/pdf':i.mime.startsWith('image/'))
const local=computed<any[]>(()=>context.value.filter((i:any)=>kindFilter.value==='pdf'?i.pdf:!i.pdf))
const available=computed(()=>{
 const records=(media.value||[]).filter(i=>!i.archived&&matchesKind(i)),extra=[...local.value]
 if(props.selected&&!extra.some(i=>i.src===props.selected))extra.unshift({src:props.selected,label:'目前使用的'+(props.kind==='pdf'?'檔案':'圖片'),pdf:props.kind==='pdf'})
 return [...extra.filter(i=>!records.some(m=>m.src===i.src||m.originUrl===i.src)).map(i=>({id:'page:'+i.src,src:i.src,name:'',alt:i.label,category:'本頁使用',mime:i.pdf?'application/pdf':'image/unknown',uses:[],originUrl:i.src})),...records].sort((a,b)=>Number(current(b))-Number(current(a)))
})
const categories=computed(()=>['全部',...new Set(available.value.map(i=>i.category))])
function current(i:any){return !!props.selected&&(i.src===props.selected||i.originUrl===props.selected)}
function pageUse(i:any){return local.value.find(l=>l.src===i.src||l.src===i.originUrl)}
function description(i:any){return pageUse(i)?.label||i.alt||i.name||'素材'}
const filtered=computed(()=>available.value.filter(i=>(scope.value==='all'||scope.value==='page'&&!!pageUse(i)||scope.value==='current'&&current(i)||scope.value==='recent'&&!i.originUrl)&&(category.value==='全部'||i.category===category.value)&&(usage.value==='all'||i.usage===usage.value)&&`${i.name} ${i.alt} ${pageUse(i)?.label||''} ${pageUse(i)?.location||''}`.toLocaleLowerCase().includes(query.value.trim().toLocaleLowerCase())))
watch([query,category,scope,fileType,usage],()=>page.value=1)
watch(fileType,()=>{category.value='全部';usage.value='all'})
watch(()=>filtered.value.length,()=>page.value=Math.max(1,Math.min(page.value,Math.ceil(filtered.value.length/12))))
if(props.picking&&!local.value.length)scope.value=props.selected?'current':'all'
</script>
<template>
 <div v-if="picking" class="cms-actions"><button type="button" class="cms-button" :disabled="uploading" @click="uploadInput?.click()">{{ uploading?`上傳中 ${progress}%`:'上傳新檔案' }}</button><input ref="uploadInput" type="file" :accept="kind==='pdf'?'application/pdf':'image/jpeg,image/png,image/webp'" class="cms-sr-only" aria-label="選擇要上傳的檔案" @change="uploadFile" /></div>
 <p v-if="uploadError" class="cms-error" role="alert">{{ uploadError }}</p>
 <div v-if="picking" class="cms-media-scopes" role="group" aria-label="找圖片或檔案的方式"><button v-for="s in [{id:'page',label:kind==='pdf'?'本頁檔案':'本頁圖片'},{id:'current',label:'目前使用'},{id:'recent',label:'最近上傳'},{id:'all',label:'全部素材'}]" :key="s.id" type="button" class="cms-button" :aria-pressed="scope===s.id" @click="scope=s.id;category='全部'">{{ s.label }}</button></div>
 <div v-else class="cms-media-scopes" role="group" aria-label="檔案類型"><button type="button" class="cms-button" :aria-pressed="fileType==='image'" @click="fileType='image'">圖片</button><button type="button" class="cms-button" :aria-pressed="fileType==='pdf'" @click="fileType='pdf'">PDF</button></div>
 <div class="cms-media-tools"><label class="cms-search"><input v-model="query" type="search" aria-label="搜尋圖片或檔案" placeholder="搜尋圖片說明、用途或檔案名稱" /></label><select v-if="!picking" v-model="usage" aria-label="官網引用狀態"><option value="all">全部引用狀態</option><option v-for="(label,state) in useLabels" :key="state" :value="state">{{ label }}</option></select><select v-model="category" aria-label="圖片或檔案分類"><option v-for="c in categories" :key="c">{{ c }}</option></select></div>
 <p v-if="error" class="cms-error" role="alert">{{ message(error) }} <button type="button" class="cms-button" @click="refresh()">重新載入素材</button></p><p v-if="pending" role="status">正在載入圖片與檔案…</p>
 <div class="cms-media-grid">
  <button v-for="item in filtered.slice((page-1)*12,page*12)" :key="item.id" type="button" class="cms-media-card" :class="{selected:current(item)}" :aria-pressed="picking?current(item):undefined" :aria-label="`${picking?'選擇':'檢視'} ${description(item)}${current(item)?'，目前使用':''}`" @click="emit('select',{...item,src:current(item)?selected:item.src})">
   <div class="cms-media-photo">
    <AdminMediaPreview :src="item.src" :origin-url="item.originUrl" :name="description(item)" :pdf="item.mime==='application/pdf'" />
    <span v-if="current(item)" class="cms-current-media">目前使用</span>
   </div>
   <div class="cms-media-caption">
    <strong :title="description(item)">{{ pageUse(item)?.caption||description(item) }}</strong>
    <span>{{ pageUse(item)?'本頁・'+(pageUse(item).purpose||'圖片'):item.category }}</span>
    <span v-if="!picking" class="cms-media-usage" :class="{'is-published':item.usage==='published'}">{{ useLabels[item.usage]||useLabels.unverified }}</span>
    <small v-if="item.name&&item.name!==description(item)">{{ item.name }}</small>
   </div>
  </button>
 </div>
 <p v-if="!filtered.length&&!pending" class="cms-empty">{{ scope==='page'?'本頁尚未使用這類素材。':scope==='current'?'這個欄位尚未選擇素材。':scope==='recent'?'尚無上傳的素材。':'沒有符合的素材。' }}<button v-if="scope!=='all'" type="button" class="cms-button" @click="scope='all';category='全部';query=''">查看全部素材</button></p>
 <div v-if="filtered.length>12" class="cms-actions cms-pagination"><button type="button" class="cms-button" :disabled="page===1" @click="page--">上一頁</button><span>{{ page }} / {{ Math.ceil(filtered.length/12) }} · 共 {{ filtered.length }} 筆</span><button type="button" class="cms-button" :disabled="page*12>=filtered.length" @click="page++">下一頁</button></div>
</template>
