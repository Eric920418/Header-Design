export function useCmsAdmin(){
 const session=useState<any>('cms-session',()=>null)
 const request=useRequestFetch()
 const api=async(path:string,options:any={})=>request<any>('/api/admin/'+path,{...options,headers:{...options.headers,...(options.method&&options.method!=='GET'?{'X-CSRF-Token':session.value?.csrf||''}:{})}})
 const refreshSession=async()=>{session.value=await api('session');return session.value}
 const message=(error:any)=>{
  const detail=error?.data?.message||(/timeout|timed out/i.test(error?.message||'')||error?.cause?.name==='TimeoutError'?'等候伺服器回應超過時間，請重試；目前輸入仍保留。':/failed to fetch|fetch failed|no response/i.test(error?.message||'')?'目前無法連線到伺服器，請確認網路後重試；目前輸入仍保留。':error?.message||'操作暫時無法完成，請重試。')
  return[detail,error?.data?.data?.traceId?`追蹤編號：${error.data.data.traceId}`:''].filter(Boolean).join('\n')
 }
 return{session,api,refreshSession,message}
}
