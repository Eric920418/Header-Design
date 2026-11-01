export function useCmsPages(){
 const {api,session}=useCmsAdmin()
 const allowed=computed(()=>!!session.value&&!session.value.mustChange)
 return useAsyncData<any[]>('cms-pages',()=>allowed.value?api('page-editors'):Promise.resolve([]),{default:()=>[],watch:[allowed]})
}
