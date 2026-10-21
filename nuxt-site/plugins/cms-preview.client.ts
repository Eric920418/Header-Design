export default defineNuxtPlugin(nuxtApp=>{
 const route=useRoute(),router=useRouter()
 const bodies=useState<Record<string,any>>('cms-unsaved-preview',()=>({}))
 const revision=useState('cms-preview-revision',()=>0)
 const send=(type:string,extra:Record<string,any>={})=>{if(window.parent!==window)window.parent.postMessage({type,...extra},window.location.origin)}
 const ready=()=>{if(route.query.cmsPreview)send('sakura:ready')}
 let applying=false,queued:MessageEvent|null=null,activeToken=''
 const receive=async(event:MessageEvent)=>{
  if(event.origin!==location.origin||event.source!==window.parent||window.parent===window||!route.query.cmsPreview||event.data?.type!=='sakura:preview')return
  if(applying){queued=event;return}
  applying=true
  try{
   await useCmsAdmin().refreshSession()
   const documents=event.data.documents
   if(!Array.isArray(documents)||documents.some(d=>typeof d.id!=='string'||!d.body||typeof d.body!=='object'))throw Error('預覽內容不完整，請重試。')
   activeToken=event.data.previewToken
   bodies.value=Object.fromEntries(documents.map(d=>[d.id,d.body]))
   await router.replace({path:route.path,query:{...route.query,cmsDraft:event.data.previewToken},hash:route.hash})
   // Finish this page before remounting again; interrupted async setup can lose fetched content.
   const rendered=new Promise<void>((resolve,reject)=>{
    const timeout=setTimeout(()=>{off();reject(Error('官網效果更新逾時，請重新載入預覽。'))},20000)
    const off=nuxtApp.hook('page:finish',()=>{clearTimeout(timeout);off();resolve()})
   })
   revision.value++
   await rendered
  }catch(e:any){send('sakura:preview-error',{message:e.data?.message||e.message})}
  finally{applying=false;if(queued){const next=queued;queued=null;void receive(next)}}
 }
 window.addEventListener('message',receive)
 document.addEventListener('submit',event=>{if(route.query.cmsPreview){event.preventDefault();send('sakura:preview-error',{message:'看效果時不會送出申請或留言，請返回後台繼續修改。'})}},true)
 document.addEventListener('click',event=>{if(!route.query.cmsPreview)return;const anchor=(event.target as Element)?.closest?.('a');if(!anchor)return;const url=new URL(anchor.href,location.origin);event.preventDefault();event.stopPropagation();if(url.origin===location.origin&&!url.pathname.startsWith('/admin')&&!url.pathname.startsWith('/media/'))void router.push({path:url.pathname,query:{...Object.fromEntries(url.searchParams),cmsPreview:route.query.cmsPreview,cmsDraft:route.query.cmsDraft},hash:url.hash})},true)
 nuxtApp.hook('app:mounted',ready)
 nuxtApp.hook('page:finish',()=>{
  if(!route.query.cmsPreview)return
  if(revision.value){send('sakura:applied',{previewToken:activeToken});if(route.hash)document.getElementById(decodeURIComponent(route.hash.slice(1)))?.scrollIntoView()}
  else ready()
 })
 nuxtApp.hook('app:error',error=>send('sakura:preview-error',{message:(error as any).message||'預覽載入失敗，請重新載入。'}))
})
