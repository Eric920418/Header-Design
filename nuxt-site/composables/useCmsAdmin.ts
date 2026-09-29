export function useCmsAdmin(){
 const session=useState<any>('cms-session',()=>null)
 const request=useRequestFetch()
 const api=async(path:string,options:any={})=>request<any>('/api/admin/'+path,{...options,headers:{...options.headers,...(options.method&&options.method!=='GET'?{'X-CSRF-Token':session.value?.csrf||''}:{})}})
 const refreshSession=async()=>{session.value=await api('session');return session.value}
 const message=(error:any)=>[error.data?.message||error.message,error.data?.data?.traceId?`追蹤編號：${error.data.data.traceId}`:''].filter(Boolean).join('\n')
 return{session,api,refreshSession,message}
}
