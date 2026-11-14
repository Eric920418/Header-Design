<script setup lang="ts">
const props=defineProps<{block:any;bodies:Record<string,any>;selected?:any;pageTitle:string;presentation?:any;focusedField?:string}>()
</script>
<template>
 <section class="cms-position" aria-label="官網位置示意">
  <header><h2>官網位置預覽</h2><span class="cms-position-badge">位置示意</span></header>
  <div class="cms-position-trail">{{ pageTitle }}<span aria-hidden="true"> › </span>{{ block?.name }}<template v-if="selected"> › {{ selected.caption }}</template></div>
  <AdminInspirationPreview v-if="block?.preview?.startsWith('inspiration-')" :kind="block.preview" :bodies="bodies" :presentation="presentation" :selected="selected" :focused-field="focusedField" :page-title="pageTitle" />
  <AdminPagePositionPreview v-else :block="block" :bodies="bodies" :selected="selected" :page-title="pageTitle" :presentation="presentation" :focused-field="focusedField" />
  <p class="cms-position-note">示意修改位置；完整畫面請按「預覽效果」。</p>
 </section>
</template>
