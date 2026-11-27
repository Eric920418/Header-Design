<script setup lang="ts">
const props=defineProps<{block:any;bodies:Record<string,any>;selected?:any;pageTitle:string;presentation?:any;focusedField?:string}>()
</script>
<template>
 <section class="cms-position" aria-label="官網位置示意">
  <header><h2>官網位置預覽</h2><span class="cms-position-badge">局部預覽</span></header>
  <div class="cms-position-trail">{{ pageTitle }}<template v-if="block?.name&&block.name!==pageTitle"><span aria-hidden="true"> › </span>{{ block.name }}</template><template v-if="selected"> › {{ selected.caption }}</template></div>
  <AdminStoreCaseContentPreview v-if="selected&&['store-case-story','store-case-carousel','store-case-links'].includes(block?.kind)" :item="selected.value" :block="block" :path="'storeCases.'+selected.index" :copy="bodies['view-pages-gallery-slug-']?.copy" :focused-field="focusedField" />
  <AdminSeriesPositionPreview v-else-if="block?.seriesPart" :part="block.seriesPart" :item="selected?.value" />
  <AdminHomeHeroPreview v-else-if="block?.id==='home:主視覺輪播'" :bodies="bodies" :selected="selected" :focused-field="focusedField" />
  <AdminHomeSectionPreview v-else-if="['home:設計案例','home:全台門市據點','home:設計風格','home:集團品牌標誌'].includes(block?.id)" :block="block" :bodies="bodies" :selected="selected" :focused-field="focusedField" />
  <AdminInspirationPreview v-else-if="block?.preview?.startsWith('inspiration-')" :kind="block.preview" :bodies="bodies" :presentation="presentation" :selected="selected" :focused-field="focusedField" />
  <AdminPagePositionPreview v-else :block="block" :bodies="bodies" :selected="selected" :page-title="pageTitle" :presentation="presentation" :focused-field="focusedField" />
  <p class="cms-position-note">完整畫面請按「預覽效果」。</p>
 </section>
</template>
