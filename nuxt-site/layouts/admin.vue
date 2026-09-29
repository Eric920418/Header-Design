<script setup lang="ts">
import {LayoutDashboard,PanelsTopLeft,Files,Images,Menu,Users,Inbox,History,LogOut} from 'lucide-vue-next'
import '~/assets/css/admin.css'
const route=useRoute(),mobileNav=ref(false),fatalError=ref('')
const {session,api,message}=useCmsAdmin()
const navigation=computed(()=>[
 {to:'/admin',label:'工作台總覽',icon:LayoutDashboard},{to:'/admin/home',label:'首頁管理',icon:PanelsTopLeft},{to:'/admin/content',label:'網站內容',icon:Files},{to:'/admin/media',label:'媒體庫',icon:Images},
 ...(session.value?.role==='admin'?[{to:'/admin/inbox',label:'收件與留言',icon:Inbox},{to:'/admin/users',label:'帳號管理',icon:Users},{to:'/admin/audit',label:'操作紀錄',icon:History}]:[]),
])
const active=computed(()=>navigation.value.find(i=>i.to===route.path)?.label||'帳號設定')
watch(()=>route.fullPath,()=>mobileNav.value=false)
useSeoMeta({robots:'noindex, nofollow',title:'SAKURA 管理後台'})
onErrorCaptured((error)=>{fatalError.value=message(error);return false})
async function logout(){try{await api('logout',{method:'POST'});session.value=null;await navigateTo('/admin/login')}catch(e){fatalError.value=message(e)}}
</script>
<template><div class="cms" :class="{'cms-auth':route.path==='/admin/login'}"><a href="#cms-main" class="cms-skip">跳至主要內容</a><aside v-if="route.path!=='/admin/login'" class="cms-sidebar"><NuxtLink to="/admin" class="cms-brand"><img src="/home-2026/logos/sakura-kitchen-horizontal.svg" alt="SAKURA KITCHEN" /></NuxtLink><nav aria-label="後台主選單"><NuxtLink v-for="item in navigation" :key="item.to" :to="item.to" :class="{active:route.path===item.to}" :aria-current="route.path===item.to?'page':undefined"><component :is="item.icon" :size="19" />{{ item.label }}</NuxtLink></nav><a href="/" target="_blank" rel="noopener" class="cms-visit">查看品牌網站 ↗</a><div class="cms-profile"><div>{{ session?.name }}<small>{{ session?.role==='admin'?'管理員':'編輯者' }}</small></div></div><NuxtLink to="/admin/password" class="cms-visit">變更密碼</NuxtLink><button class="cms-button" @click="logout"><LogOut :size="16" />登出</button></aside><div class="cms-shell"><header class="cms-topbar"><div class="cms-topbar-location"><button v-if="route.path!=='/admin/login'" class="cms-icon-button cms-menu-toggle" aria-label="開啟後台選單" @click="($event.currentTarget as HTMLButtonElement).focus();mobileNav=true"><Menu :size="20" /></button><strong>{{ active }}</strong></div><span class="cms-demo-badge">SAKURA CMS</span></header><main id="cms-main" class="cms-main" tabindex="-1"><p v-if="fatalError" class="cms-error" role="alert">{{ fatalError }}</p><slot v-else /></main></div><AdminDialog :open="mobileNav" title="管理選單" @close="mobileNav=false"><nav class="cms-mobile-nav"><NuxtLink v-for="item in navigation" :key="item.to" :to="item.to">{{ item.label }}</NuxtLink><NuxtLink to="/admin/password">變更密碼</NuxtLink><button class="cms-button" @click="logout">登出</button></nav></AdminDialog></div></template>
