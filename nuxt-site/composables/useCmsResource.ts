/** Read the published resource; sample only supplies the existing component's type. */
export async function useCmsResource<T extends object>(id: string, _sample: T): Promise<T> {
  const route = useRoute()
  const preview = typeof route.query.cmsPreview === 'string' ? route.query.cmsPreview : undefined
  const { data, error } = await useAsyncData(`cms:${id}:${preview || 'published'}`, () => useRequestFetch()<T>(`/api/content/${id}`, {query: preview ? {preview} : undefined}), {getCachedData: key => useNuxtApp().isHydrating ? useNuxtApp().payload.data[key] : undefined})
  if(error.value?.statusCode===404&&id.startsWith('view-')&&'cmsSettings' in _sample)return {..._sample,cmsSettings:{...(_sample as any).cmsSettings,visible:false}} as T
  if(error.value) throw createError({statusCode: error.value.statusCode || 503, message: (error.value.data as any)?.message || error.value.message, fatal: true, data: (error.value.data as any)?.data})
  if(!data.value) throw createError({statusCode:503,message:'內容尚未初始化，請聯絡管理員。'})
  return data.value as T
}
