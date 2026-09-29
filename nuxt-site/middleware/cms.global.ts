export default defineNuxtRouteMiddleware(async(to)=>{
 if(to.query.cmsPreview){await useCmsAdmin().refreshSession();useHead({meta:[{name:'robots',content:'noindex,nofollow'}]});if(import.meta.server){const event=useRequestEvent();if(event){event.node.res.setHeader('Cache-Control','private, no-store');event.node.res.setHeader('X-Robots-Tag','noindex, nofollow')}}}
 if(!to.path.startsWith('/admin')||to.path==='/admin/login')return
 const {refreshSession}=useCmsAdmin()
 try{const user=await refreshSession();if(user.mustChange&&to.path!=='/admin/password')return navigateTo('/admin/password')}
 catch(error:any){if(error.statusCode===401||error.status===401)return navigateTo('/admin/login');throw createError({statusCode:error.statusCode||503,message:error.data?.message||error.message})}
})
