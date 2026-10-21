import type {ComputedRef} from 'vue'
export function useCmsUnsaved(dirty:ComputedRef<boolean>){
 const allow=()=>!dirty.value||window.confirm('還有尚未儲存的修改，確定離開？')
 const unload=(event:BeforeUnloadEvent)=>{if(dirty.value){event.preventDefault();event.returnValue=''}}
 onBeforeRouteLeave(allow);onBeforeRouteUpdate(allow)
 onMounted(()=>window.addEventListener('beforeunload',unload))
 onBeforeUnmount(()=>window.removeEventListener('beforeunload',unload))
}
