<script setup lang="ts">
definePageMeta({layout:'admin'})
const email=ref(''),password=ref(''),error=ref(''),busy=ref(false)
const {api,refreshSession,message}=useCmsAdmin()
async function login(){busy.value=true;error.value='';try{await api('login',{method:'POST',body:{email:email.value,password:password.value}});const u=await refreshSession();await navigateTo(u.mustChange?'/admin/password':'/admin')}catch(e){error.value=message(e)}finally{busy.value=false}}
</script>
<template><section class="cms-panel cms-login"><h1>登入管理後台</h1><form class="cms-form" @submit.prevent="login"><label>電子郵件<input v-model="email" type="email" autocomplete="username" required /></label><label>密碼<input v-model="password" type="password" autocomplete="current-password" required /></label><p v-if="error" class="cms-error" role="alert">{{ error }}</p><button class="cms-button cms-button-gold" :disabled="busy">{{ busy?'登入中…':'登入' }}</button></form></section></template>
