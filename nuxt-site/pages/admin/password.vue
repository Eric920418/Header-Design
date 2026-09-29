<script setup lang="ts">
definePageMeta({layout:'admin'})
const currentPassword=ref(''),password=ref(''),confirm=ref(''),error=ref(''),busy=ref(false)
const {api,refreshSession,message}=useCmsAdmin()
async function change(){error.value='';if(password.value!==confirm.value){error.value='兩次新密碼不一致';return}busy.value=true;try{await api('password',{method:'POST',body:{currentPassword:currentPassword.value,password:password.value}});await refreshSession();await navigateTo('/admin')}catch(e){error.value=message(e)}finally{busy.value=false}}
</script>
<template><section class="cms-panel cms-login"><h1>變更密碼</h1><p>臨時密碼須先更換才能使用後台。</p><form class="cms-form" @submit.prevent="change"><label>目前密碼<input v-model="currentPassword" type="password" autocomplete="current-password" required /></label><label>新密碼<input v-model="password" type="password" autocomplete="new-password" minlength="12" maxlength="128" required /></label><label>再次輸入新密碼<input v-model="confirm" type="password" autocomplete="new-password" required /></label><p v-if="error" class="cms-error" role="alert">{{ error }}</p><button class="cms-button cms-button-gold" :disabled="busy">變更密碼</button></form></section></template>
