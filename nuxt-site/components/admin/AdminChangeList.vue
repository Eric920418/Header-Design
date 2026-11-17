<script setup lang="ts">
import {firstImage} from '~/shared/cms/workflow.mjs'
defineProps<{changes:any[]}>()
</script>
<template><ol class="cms-change-list"><li v-for="(c,index) in changes" :key="c.documentId+':'+c.path+':'+index"><strong>{{ c.location }}</strong><p>{{ c.label }}</p><div class="cms-change-values"><div><small>修改前</small><AdminThumbnail v-if="c.image&&firstImage(c.before)" :src="c.before" alt="修改前的圖片" /><span v-else>{{ c.before }}</span></div><span aria-hidden="true">→</span><div><small>修改後</small><AdminThumbnail v-if="c.image&&firstImage(c.after)" :src="c.after" alt="修改後的圖片" /><span v-else>{{ c.after }}</span></div></div></li></ol></template>
