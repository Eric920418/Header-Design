import {contentAliases,publicContent} from '~/shared/cms/public-content.mjs'
/** Read the published resource; sample only supplies the existing component's type. */
export async function useCmsResource<T extends object>(id: string, _sample: T): Promise<T> {
  const route = useRoute()
  const preview = typeof route.query.cmsPreview === 'string' ? route.query.cmsPreview : undefined
  if(import.meta.client&&preview){
    const bodies=useState<Record<string,any>>('cms-unsaved-preview',()=>({}))
    const body=bodies.value[(contentAliases as Record<string,string>)[id]||id]
    if(body)return publicContent(id,body) as T
  }
  const draft=typeof route.query.cmsDraft==='string'?route.query.cmsDraft:undefined
  const { data, error } = await useAsyncData(`cms:${id}:${preview || 'published'}:${draft||''}`, () => useRequestFetch()<T>(`/api/content/${id}`, {query: preview ? {preview,...(draft?{cmsDraft:draft}:{})} : undefined}), {getCachedData: key => useNuxtApp().isHydrating ? useNuxtApp().payload.data[key] : undefined})
  if(error.value?.statusCode===404&&!(error.value.data as any)?.data?.cmsPreviewExpired&&id.startsWith('view-')&&'cmsSettings' in _sample)return {..._sample,cmsSettings:{...(_sample as any).cmsSettings,visible:false}} as T
  if(error.value) throw createError({statusCode: error.value.statusCode || 503, message: (error.value.data as any)?.message || error.value.message, fatal: true, data: (error.value.data as any)?.data})
  if(!data.value) throw createError({statusCode:503,message:'內容尚未初始化，請聯絡管理員。'})
  return data.value as T
}
