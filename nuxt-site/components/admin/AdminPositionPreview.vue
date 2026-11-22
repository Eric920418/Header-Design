<script setup lang="ts">
const props=defineProps<{block:any;bodies:Record<string,any>;selected?:any;pageTitle:string;presentation?:any;focusedField?:string}>()
</script>
<template>
 <section class="cms-position" aria-label="官網位置示意">
  <header><h2>官網位置預覽</h2><span class="cms-position-badge">局部預覽</span></header>
  <div class="cms-position-trail">{{ pageTitle }}<span aria-hidden="true"> › </span>{{ block?.name }}<template v-if="selected"> › {{ selected.caption }}</template></div>
  <AdminSeriesPositionPreview v-if="block?.seriesPart" :part="block.seriesPart" :item="selected?.value" />
  <AdminHomeHeroPreview v-else-if="block?.id==='home:主視覺輪播'" :bodies="bodies" :selected="selected" :focused-field="focusedField" />
  <AdminInspirationPreview v-else-if="block?.preview?.startsWith('inspiration-')" :kind="block.preview" :bodies="bodies" :presentation="presentation" :selected="selected" :focused-field="focusedField" />
  <AdminPagePositionPreview v-else :block="block" :bodies="bodies" :selected="selected" :page-title="pageTitle" :presentation="presentation" :focused-field="focusedField" />
  <p class="cms-position-note">完整畫面請按「預覽效果」。</p>
 </section>
</template>
