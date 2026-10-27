export function useCmsWorkspaces(){
 const {api,session}=useCmsAdmin()
 const allowed=computed(()=>!!session.value&&!session.value.mustChange)
 return useAsyncData<any[]>('cms-workspaces',()=>allowed.value?api('workspaces'):Promise.resolve([]),{default:()=>[],watch:[allowed]})
}
