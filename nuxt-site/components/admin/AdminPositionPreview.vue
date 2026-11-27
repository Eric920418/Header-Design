<script setup lang="ts">
const props=defineProps<{block:any;bodies:Record<string,any>;selected?:any;pageTitle:string;presentation?:any;focusedField?:string;linkTarget?:any;sharedTarget?:any}>()
</script>
<template>
 <section class="cms-position" aria-label="官網位置示意">
  <header><h2>官網位置預覽</h2><span class="cms-position-badge">局部預覽</span></header>
  <div class="cms-position-trail">{{ pageTitle }}<template v-if="block?.name&&block.name!==pageTitle"><span aria-hidden="true"> › </span>{{ block.name }}</template><template v-if="selected"> › {{ selected.caption }}</template></div>
  <section v-if="linkTarget" class="cms-link-target" aria-label="正在設定的官網連結" :data-link-path="linkTarget.path" :data-shared-path="sharedTarget?.path">
   <h3>{{ sharedTarget?.label||linkTarget.label }}</h3>
   <small>{{ sharedTarget?.scope||(linkTarget.shared?'所有相關頁面共用':linkTarget.item?'此筆內容的連結':'本區塊的連結') }} · {{ linkTarget.state }}</small>
   <strong class="cms-link-target-caption">{{ linkTarget.caption }}</strong>
   <p v-if="linkTarget.effective">{{ linkTarget.file?'預覽使用的檔案':'預覽使用的連結' }}<code>{{ linkTarget.effective }}</code></p>
   <p v-else-if="!linkTarget.unused">尚未設定連結。</p>
   <p v-if="linkTarget.raw&&linkTarget.raw!==linkTarget.effective">本欄保留的網址<code>{{ linkTarget.raw }}</code></p>
   <p v-if="linkTarget.note" class="cms-field-help">{{ linkTarget.note }}</p>
  </section>
  <section v-if="sharedTarget&&!linkTarget&&block?.id!=='news:頁面共用設定'" class="cms-link-target cms-shared-target" aria-label="正在編輯的共用設定" :data-shared-path="sharedTarget.path">
   <h3>正在編輯：{{ sharedTarget.label }}</h3>
   <p>官網位置：{{ sharedTarget.location }}</p>
   <small>{{ sharedTarget.scope }}</small><p v-if="sharedTarget.note" role="status" data-shared-inactive>{{ sharedTarget.note }}</p>
  </section>
  <template v-if="!linkTarget?.unused">
  <AdminStoreCaseContentPreview v-if="selected&&['store-case-story','store-case-carousel','store-case-links'].includes(block?.kind)" :item="selected.value" :block="block" :path="'storeCases.'+selected.index" :copy="bodies['view-pages-gallery-slug-']?.copy" :focused-field="focusedField" />
  <AdminSeriesPositionPreview v-else-if="block?.seriesPart" :part="block.seriesPart" :item="selected?.value" :focused-field="focusedField" />
  <AdminHomeHeroPreview v-else-if="block?.id==='home:主視覺輪播'" :bodies="bodies" :selected="selected" :focused-field="focusedField" />
  <AdminHomeSectionPreview v-else-if="['home:設計案例','home:全台門市據點','home:設計風格','home:集團品牌標誌'].includes(block?.id)" :block="block" :bodies="bodies" :selected="selected" :focused-field="focusedField" />
  <AdminInspirationPreview v-else-if="block?.preview?.startsWith('inspiration-')" :kind="block.preview" :bodies="bodies" :presentation="presentation" :selected="selected" :focused-field="focusedField" />
  <AdminPagePositionPreview v-else :block="block" :bodies="bodies" :selected="selected" :page-title="pageTitle" :presentation="presentation" :focused-field="focusedField" />
  </template>
  <p class="cms-position-note">完整畫面請按「預覽效果」。</p>
 </section>
</template>
