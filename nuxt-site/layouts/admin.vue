<script setup lang="ts">
import {LayoutDashboard,PanelsTopLeft,Files,Images,Menu,Users,Inbox,History,LogOut} from 'lucide-vue-next'
import '~/assets/css/admin.css'
const route=useRoute(),mobileNav=ref(false),fatalError=ref('')
const {session,api,message}=useCmsAdmin()
const navigation=computed(()=>[
 {to:'/admin',label:'工作首頁',icon:LayoutDashboard,group:''},{to:'/admin/home',label:'首頁',icon:PanelsTopLeft,group:'修改網站'},
 ...[['pages','其他頁面'],['news','消息與文章'],['cases','設計案例'],['products','廚房產品'],['stores','門市與品牌館']].map(([area,label])=>({to:'/admin/content?area='+area,label,icon:Files,group:'修改網站'})),
 {to:'/admin/media',label:'圖片與檔案',icon:Images,group:'日常處理'},
 ...(session.value?.role==='admin'?[{to:'/admin/inbox',label:'申請與留言',icon:Inbox,group:'日常處理'}]:[]),
 {to:'/admin/content?area=settings',label:'選單與頁尾',icon:PanelsTopLeft,group:'管理設定'},
 ...(session.value?.role==='admin'?[{to:'/admin/users',label:'帳號',icon:Users,group:'管理設定'},{to:'/admin/audit',label:'操作紀錄',icon:History,group:'管理設定'}]:[]),
])
const groups=computed(()=>[...new Set(navigation.value.map(i=>i.group))])
function isActive(item:any){const u=new URL(item.to,'http://cms.local');return u.pathname===route.path&&(route.path!=='/admin/content'||u.searchParams.get('area')===(route.query.area||'pages'))}
const active=computed(()=>navigation.value.find(isActive)?.label||'帳號設定')
watch(()=>route.fullPath,()=>mobileNav.value=false)
useSeoMeta({robots:'noindex, nofollow',title:'SAKURA 管理後台'})
onErrorCaptured((error)=>{fatalError.value=message(error);return false})
async function logout(){try{await api('logout',{method:'POST'});session.value=null;await navigateTo('/admin/login')}catch(e){fatalError.value=message(e)}}
</script>
<template><div class="cms" :class="{'cms-auth':route.path==='/admin/login'}"><a href="#cms-main" class="cms-skip">跳至主要內容</a><aside v-if="route.path!=='/admin/login'" class="cms-sidebar"><NuxtLink to="/admin" class="cms-brand"><img src="/home-2026/logos/sakura-kitchen-horizontal.svg" alt="SAKURA KITCHEN" /></NuxtLink><nav aria-label="後台主選單"><section v-for="group in groups" :key="group" class="cms-nav-group"><h2 v-if="group">{{ group }}</h2><NuxtLink v-for="item in navigation.filter(i=>i.group===group)" :key="item.to" :to="item.to" :class="{active:isActive(item)}" :aria-current="isActive(item)?'page':undefined"><component :is="item.icon" :size="18" />{{ item.label }}</NuxtLink></section></nav><a href="/" target="_blank" rel="noopener" class="cms-visit">查看品牌網站 ↗</a><div class="cms-profile"><div>{{ session?.name }}<small>{{ session?.role==='admin'?'管理員':'編輯者' }}</small></div></div><NuxtLink to="/admin/password" class="cms-visit">變更密碼</NuxtLink><button class="cms-button" @click="logout"><LogOut :size="16" />登出</button></aside><div class="cms-shell"><header class="cms-topbar"><div class="cms-topbar-location"><button v-if="route.path!=='/admin/login'" class="cms-icon-button cms-menu-toggle" aria-label="開啟後台選單" @click="($event.currentTarget as HTMLButtonElement).focus();mobileNav=true"><Menu :size="20" /></button><strong>{{ active }}</strong></div><span class="cms-demo-badge">網站管理</span></header><main id="cms-main" class="cms-main" tabindex="-1"><p v-if="fatalError" class="cms-error" role="alert">{{ fatalError }}</p><slot v-else /></main></div><AdminDialog :open="mobileNav" title="管理選單" @close="mobileNav=false"><nav class="cms-mobile-nav"><section v-for="group in groups" :key="group" class="cms-nav-group"><h2 v-if="group">{{ group }}</h2><NuxtLink v-for="item in navigation.filter(i=>i.group===group)" :key="item.to" :to="item.to" :aria-current="isActive(item)?'page':undefined">{{ item.label }}</NuxtLink></section><NuxtLink to="/admin/password">變更密碼</NuxtLink><button class="cms-button" @click="logout">登出</button></nav></AdminDialog></div></template>
