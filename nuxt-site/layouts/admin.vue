<script setup lang="ts">
import {LayoutDashboard,PanelsTopLeft,Files,Images,Menu,Users,Inbox,History,LogOut,Newspaper,BookImage,CookingPot,MapPin,PanelLeftClose,PanelLeftOpen,ExternalLink,KeyRound,HeartHandshake,Handshake,Building2,Settings2} from 'lucide-vue-next'
import '~/assets/css/admin.css'
import {navigationSections,sectionForQuery} from '~/shared/cms/navigation.mjs'
const route=useRoute(),mobileNav=ref(false),fatalError=ref('')
const {session,api,message}=useCmsAdmin()
const {data:workspaces,error:navigationError,refresh:refreshNavigation}=await useCmsWorkspaces()
const sections=computed(()=>navigationSections(workspaces.value))
const sectionIcons={design:BookImage,products:CookingPot,service:MapPin,news:Newspaper,brand:Building2,franchise:HeartHandshake,builders:Handshake,shared:Settings2}
const sidebarChoice=ref<boolean|null>(null)
const editing=computed(()=>(route.path==='/admin/home'||route.path==='/admin/content')&&typeof route.query.edit==='string')
const sidebarCollapsed=computed(()=>sidebarChoice.value??editing.value)
const cmsRoot=ref<HTMLElement>()
useCmsSidebarMotion(sidebarCollapsed,cmsRoot)
// Re-entering the main content takes priority over a manual expansion.
watch([()=>route.path,()=>route.query.edit],()=>{sidebarChoice.value=null})
function collapseSidebar(){sidebarChoice.value=true}
function bindPreviewClick(event:Event){
 const frame=event.target
 if(frame instanceof HTMLIFrameElement&&new URL(frame.src,location.href).origin===location.origin)frame.contentDocument?.addEventListener('click',collapseSidebar,{capture:true})
}
const navigation=computed(()=>[
 {to:'/admin',label:'工作首頁',shortLabel:'工作首頁',icon:LayoutDashboard,group:''},{to:'/admin/home',label:'首頁',shortLabel:'首頁',icon:PanelsTopLeft,group:'修改網站'},
 ...sections.value.filter(s=>s.key!=='shared').map(s=>({to:'/admin/content?section='+s.key,label:s.label,shortLabel:s.shortLabel,icon:sectionIcons[s.key as keyof typeof sectionIcons]||Files,group:'修改網站'})),
 {to:'/admin/media',label:'圖片與檔案',shortLabel:'檔案',icon:Images,group:'日常處理'},
 ...(session.value?.role==='admin'?[{to:'/admin/inbox',label:'申請與留言',shortLabel:'申請',icon:Inbox,group:'日常處理'}]:[]),
 {to:'/admin/content?section=shared',label:'網站共用設定',shortLabel:'共用',icon:Settings2,group:'管理設定'},
 ...(session.value?.role==='admin'?[{to:'/admin/users',label:'帳號',shortLabel:'帳號',icon:Users,group:'管理設定'},{to:'/admin/audit',label:'操作紀錄',shortLabel:'紀錄',icon:History,group:'管理設定'}]:[]),
])
const groups=computed(()=>[...new Set(navigation.value.map(i=>i.group))])
function isActive(item:any){const u=new URL(item.to,'http://cms.local');return u.pathname===route.path&&(route.path!=='/admin/content'||u.searchParams.get('section')===sectionForQuery(route.query))}
const active=computed(()=>navigation.value.find(isActive)?.label||(route.path==='/admin/content'?'全部可修改頁面':'帳號設定'))
watch(()=>route.fullPath,()=>mobileNav.value=false)
useSeoMeta({robots:'noindex, nofollow',title:'SAKURA 管理後台'})
onErrorCaptured((error)=>{fatalError.value=message(error);return false})
async function logout(){try{await api('logout',{method:'POST'});session.value=null;await navigateTo('/admin/login')}catch(e){fatalError.value=message(e)}}
</script>
<template><div ref="cmsRoot" class="cms" :class="{'cms-auth':route.path==='/admin/login','cms-nav-collapsed':sidebarCollapsed}"><a href="#cms-main" class="cms-skip">跳至主要內容</a><aside v-if="route.path!=='/admin/login'" id="cms-sidebar" class="cms-sidebar"><NuxtLink to="/admin" class="cms-brand"><img src="/home-2026/logos/sakura-kitchen-horizontal.svg" alt="SAKURA KITCHEN" /></NuxtLink><nav aria-label="後台主選單"><section v-for="group in groups" :key="group" class="cms-nav-group"><h2 v-if="group">{{ group }}</h2><NuxtLink v-for="item in navigation.filter(i=>i.group===group)" :key="item.to" :to="item.to" :class="{active:isActive(item)}" :aria-current="isActive(item)?'page':undefined" :aria-label="item.label" :title="sidebarCollapsed?item.label:undefined"><component :is="item.icon" :size="18" aria-hidden="true" /><span class="cms-nav-label">{{ item.label }}</span><span class="cms-nav-short" aria-hidden="true">{{ item.shortLabel }}</span></NuxtLink></section></nav><a href="/" target="_blank" rel="noopener" class="cms-visit" aria-label="查看品牌網站（另開視窗）" title="查看品牌網站（另開視窗）"><ExternalLink :size="18" aria-hidden="true" /><span class="cms-nav-label">查看品牌網站 ↗</span><span class="cms-nav-short" aria-hidden="true">官網</span></a><div class="cms-profile"><div>{{ session?.name }}<small>{{ session?.role==='admin'?'管理員':'編輯者' }}</small></div></div><NuxtLink to="/admin/password" class="cms-visit" aria-label="變更密碼" title="變更密碼"><KeyRound :size="18" aria-hidden="true" /><span class="cms-nav-label">變更密碼</span><span class="cms-nav-short" aria-hidden="true">密碼</span></NuxtLink><button class="cms-button cms-sidebar-logout" aria-label="登出" title="登出" @click="logout"><LogOut :size="18" aria-hidden="true" /><span class="cms-nav-label">登出</span><span class="cms-nav-short" aria-hidden="true">登出</span></button></aside><div class="cms-shell"><header class="cms-topbar"><div class="cms-topbar-location"><button v-if="route.path!=='/admin/login'" class="cms-icon-button cms-menu-toggle" aria-label="開啟後台選單" @click="($event.currentTarget as HTMLButtonElement).focus();mobileNav=true"><Menu :size="20" /></button><button v-if="route.path!=='/admin/login'" class="cms-icon-button cms-sidebar-toggle" type="button" :aria-label="sidebarCollapsed?'展開選單':'收合選單'" :title="sidebarCollapsed?'展開選單':'收合選單'" :aria-expanded="!sidebarCollapsed" aria-controls="cms-sidebar" @click="sidebarChoice=!sidebarCollapsed"><component :is="sidebarCollapsed?PanelLeftOpen:PanelLeftClose" :size="20" aria-hidden="true" /></button><strong>{{ active }}</strong></div><span class="cms-demo-badge">網站管理</span></header><main id="cms-main" class="cms-main" tabindex="-1" @click.capture="collapseSidebar" @load.capture="bindPreviewClick"><p v-if="navigationError" class="cms-error" role="alert">{{ message(navigationError) }} <button class="cms-button" @click="refreshNavigation()">重新載入選單名稱</button></p><p v-if="fatalError" class="cms-error" role="alert">{{ fatalError }}</p><slot v-else /></main></div><AdminDialog :open="mobileNav" title="管理選單" @close="mobileNav=false"><nav class="cms-mobile-nav"><section v-for="group in groups" :key="group" class="cms-nav-group"><h2 v-if="group">{{ group }}</h2><NuxtLink v-for="item in navigation.filter(i=>i.group===group)" :key="item.to" :to="item.to" :aria-current="isActive(item)?'page':undefined">{{ item.label }}</NuxtLink></section><NuxtLink to="/admin/password">變更密碼</NuxtLink><button class="cms-button" @click="logout">登出</button></nav></AdminDialog></div></template>
