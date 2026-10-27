export function useCmsSidebarMotion(collapsed:Readonly<Ref<boolean>>,root:Ref<HTMLElement|undefined>){
 const reduced=useReducedMotion()
 let animations:Animation[]=[],sequence=0
 const cancel=()=>{sequence++;for(const animation of animations)animation.cancel();animations=[]}
 watch(reduced,value=>{if(value)cancel()})
 watch(collapsed,async()=>{
  if(!import.meta.client||!root.value)return
  if(reduced.value||window.innerWidth<992){cancel();return}
  const savebar=root.value.querySelector<HTMLElement>('.cms-savebar')
  // Transforming an ancestor of the fixed action bar would move it off the viewport.
  const parts=(element:HTMLElement):HTMLElement[]=>element!==savebar&&savebar&&element.contains(savebar)?Array.from(element.children).flatMap(child=>parts(child as HTMLElement)):[element]
  const main=root.value.querySelector<HTMLElement>('.cms-main')
  const targets=[...root.value.querySelectorAll<HTMLElement>('.cms-sidebar nav a,.cms-topbar'),...(main?Array.from(main.children).flatMap(child=>parts(child as HTMLElement)):[])]
  const before=targets.map(element=>({element,rect:element.getBoundingClientRect()}))
  cancel();const current=sequence
  await nextTick()
  if(current!==sequence||reduced.value||window.innerWidth<992)return
  for(const {element,rect} of before){
   if(!element.isConnected||!rect.width||rect.bottom<0||rect.top>window.innerHeight)continue
   const after=element.getBoundingClientRect(),x=rect.left-after.left,y=rect.top-after.top
   if(!after.width||Math.abs(x)+Math.abs(y)<1)continue
   const animation=element.animate?.([{transform:`translate(${x}px,${y}px)`},{transform:'translate(0px,0px)'}],{duration:240,easing:'cubic-bezier(.22,1,.36,1)'})
   if(animation)animations.push(animation)
  }
 },{flush:'pre'})
 onBeforeUnmount(cancel)
}
