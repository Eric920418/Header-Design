<script setup lang="ts">
import type { ProductCareCategory } from '~/data/productCatalogues'
import { productCatalogueText, productCareDescription } from '~/shared/cms/product-catalogue.mjs'

const props = defineProps<{
  copy: Record<string, string>
  categories: ProductCareCategory[]
  selected?: { path: string; index: number }
  focusedField?: string
}>()

const selection = computed(() => {
  const path = props.focusedField || props.selected?.path || ''
  const match = path.match(/^PRODUCT_CARE_CATEGORIES\.(\d+)(?:\.questions\.(\d+))?/)
  const categoryIndex = match ? Number(match[1]) : props.selected?.path === 'PRODUCT_CARE_CATEGORIES' ? props.selected.index : 1
  const exampleField = path === 'copy.text9' ? 'steps' : path === 'copy.text10' ? 'tip' : undefined
  const category = (exampleField && props.categories.find(row => row.questions.some(question => question[exampleField]?.length))) || props.categories[categoryIndex] || props.categories[0]
  const questionIndex = match?.[2] !== undefined ? Number(match[2]) : (props.selected?.path === 'PRODUCT_CARE_CATEGORIES.' + categoryIndex + '.questions' ? props.selected.index : 0)
  const question = (exampleField && category?.questions.find(question => question[exampleField]?.length)) || category?.questions[questionIndex] || category?.questions[0]
  const categoryPath = 'PRODUCT_CARE_CATEGORIES.' + props.categories.indexOf(category)
  const questionPath = categoryPath + '.questions.' + (category?.questions.indexOf(question) ?? -1)
  return { category, question, categoryPath, questionPath }
})
const featureImage = computed(() => selection.value.question?.image || selection.value.category?.questions.find(q => q.image)?.image)
const text = (key: string) => productCatalogueText(props.copy, key)
const focused = (path: string) => props.focusedField === path
const questionField = (key: string) => focused(selection.value.questionPath + '.' + key)
</script>

<template>
 <div class="cms-product-care-scene">
  <header>
   <p :class="{'is-focused':focused('copy.careEyebrow')}">{{ text('careEyebrow') }}</p>
   <h3>
    <span class="cms-product-care-accent" :class="{'is-focused':focused('copy.careChineseTitle')}">{{ text('careChineseTitle') }}</span>
    <span :class="{'is-focused':focused('copy.careEnglishStart')}">{{ text('careEnglishStart') }}</span>
    <span class="cms-product-care-accent" :class="{'is-focused':focused('copy.careEnglishAccent')}">{{ text('careEnglishAccent') }}</span>
    <span :class="{'is-focused':focused('copy.careEnglishMiddle')}">{{ text('careEnglishMiddle') }}</span>
    <span class="cms-product-care-accent" :class="{'is-focused':focused('copy.careEnglishEnd')}">{{ text('careEnglishEnd') }}</span>
   </h3>
  </header>
  <ul class="cms-product-care-filters">
   <li v-for="(category,index) in categories" :key="category.id" :class="{'is-active':selection.category===category,'is-focused':focused('PRODUCT_CARE_CATEGORIES.'+index+'.label')}">{{ category.label }}</li>
  </ul>
  <div v-if="selection.question" class="cms-product-care-layout">
   <div class="cms-scene-question">
    <strong :class="{'is-focused':questionField('question')}">{{ selection.question.question }}</strong>
    <p v-if="selection.question.intro" :class="{'is-focused':questionField('intro')}">{{ selection.question.intro }}</p>
    <ul v-if="selection.question.details?.length">
     <li v-for="(detail,index) in selection.question.details" :key="index">
      <strong v-if="detail.title" :class="{'is-focused':questionField('details.'+index+'.title')}">{{ detail.title }} </strong>
      <span :class="{'is-focused':questionField('details.'+index+'.body')}">{{ detail.body }}</span>
     </li>
    </ul>
    <ol v-if="selection.question.steps?.length">
     <li v-for="(step,index) in selection.question.steps" :key="index">
      <strong :class="{'is-focused':index===0&&focused('copy.text9')}">{{ copy.text9 }}{{ index+1 }}</strong>
      <span :class="{'is-focused':questionField('steps.'+index)}">{{ step }}</span>
     </li>
    </ol>
    <p v-if="selection.question.tip"><strong :class="{'is-focused':focused('copy.text10')}">{{ copy.text10 }}</strong><span :class="{'is-focused':questionField('tip')}">{{ selection.question.tip }}</span></p>
   </div>
   <aside>
    <AdminThumbnail v-if="featureImage" :src="featureImage" :alt="selection.question.imageAlt||selection.category.label+'產品保養圖解'" :class="{'is-focused':questionField('image')||questionField('imageAlt')}" />
    <h4 :class="{'is-focused':questionField('question')}">{{ selection.question.question }}</h4>
    <p>{{ productCareDescription(selection.question,copy) }}</p>
    <p v-if="focused('copy.careFallback')" class="is-focused">問答未填其他說明時顯示：{{ text('careFallback') }}</p>
   </aside>
  </div>
 </div>
</template>
