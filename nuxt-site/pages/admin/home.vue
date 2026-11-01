<script setup lang="ts">
import {legacyPageLink} from '~/shared/cms/page-editors.mjs'
definePageMeta({layout:'admin'})
const route=useRoute()
if(typeof route.query.edit==='string')await navigateTo(legacyPageLink(route.query.edit,route.query),{replace:true})
</script>
<template><div class="cms-page"><AdminPageEditor id="home" /></div></template>
