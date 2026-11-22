<script setup lang="ts">
import { FileImage, FileText } from 'lucide-vue-next'
import type { PDFDocumentLoadingTask, RenderTask } from 'pdfjs-dist'

const props=defineProps<{src:string;originUrl?:string;name:string;pdf?:boolean}>()
const emit=defineEmits<{source:[url:string]}>()
const original=computed(()=>props.originUrl?.startsWith('/')&&!props.originUrl.startsWith('//')?props.originUrl:undefined)
const source=ref(original.value||props.src),error=ref(''),ready=ref(false)
watch(source,url=>emit('source',url),{immediate:true})
const frame=ref<HTMLElement>(),canvas=ref<HTMLCanvasElement>(),picture=ref<HTMLImageElement>()
let observer:IntersectionObserver|undefined
let loading:PDFDocumentLoadingTask|undefined,render:RenderTask|undefined
let disposed=false

function imageError(){
 if(source.value!==props.src){source.value=props.src;return}
 error.value='圖片載入失敗'
}

async function renderCover(){
 const [{getDocument,GlobalWorkerOptions,AnnotationMode},{default:worker}]=await Promise.all([
  import('pdfjs-dist/legacy/build/pdf.mjs'),
  import('pdfjs-dist/legacy/build/pdf.worker.min.mjs?url')
 ])
 if(disposed)return
 GlobalWorkerOptions.workerSrc=worker
 for(const url of new Set([source.value,props.src])){
  const target=canvas.value
  if(!target||disposed)return
  const task=getDocument({url,disableAutoFetch:true,disableStream:true,enableXfa:false,stopAtErrors:true})
  loading=task
  const timeout=setTimeout(()=>void task.destroy().catch(()=>{}),25000)
  try{
   const page=await (await task.promise).getPage(1)
   const {width,height}=page.getViewport({scale:1})
   const viewport=page.getViewport({scale:480/Math.max(width,height)})
   target.width=Math.ceil(viewport.width)
   target.height=Math.ceil(viewport.height)
   render=page.render({canvas:target,viewport,annotationMode:AnnotationMode.DISABLE})
   await render.promise
   if(!disposed){
    source.value=url
    ready.value=true
   }
   return
  }catch(issue){
   if(!disposed&&url===props.src)throw issue
  }finally{
   clearTimeout(timeout)
   render=undefined
   if(loading===task){loading=undefined;await task.destroy().catch(()=>{})}
  }
 }
}

onMounted(()=>{
 if(!props.pdf){
  if(picture.value?.complete&&!picture.value.naturalWidth)imageError()
  return
 }
 if(!frame.value)return
 observer=new IntersectionObserver(([entry])=>{
  if(!entry?.isIntersecting)return
  observer?.disconnect()
  void renderCover().catch(issue=>{if(!disposed)error.value='無法載入 PDF 封面：'+(issue instanceof Error?issue.message:String(issue))})
 },{rootMargin:'80px'})
 observer.observe(frame.value)
})
onBeforeUnmount(()=>{
 disposed=true
 observer?.disconnect()
 render?.cancel()
 const task=loading
 loading=undefined
 if(task)void task.destroy().catch(()=>{})
})
</script>

<template>
 <div ref="frame" class="cms-media-preview" :class="{'is-pdf':pdf}">
  <canvas v-if="pdf" v-show="ready" ref="canvas" class="cms-media-cover" role="img" :aria-label="name+'的 PDF 封面'" />
  <img v-else-if="!error" ref="picture" :src="source" :alt="name" loading="lazy" decoding="async" @error="imageError" />
  <div v-if="error||pdf&&!ready" class="cms-media-preview-state" :role="error?'status':undefined">
   <component :is="pdf?FileText:FileImage" :size="34" aria-hidden="true" />
   <span>{{ error||'正在載入封面…' }}</span>
  </div>
 </div>
</template>
