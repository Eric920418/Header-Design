<script setup lang="ts">
const props = defineProps<{ modelValue: any }>()
const emit = defineEmits<{ 'update:modelValue': [value: any] }>()
const devices = [
  { key: 'desktop', label: '桌機', field: 'image', size: '1920 × 1280', frame: '1440 × 952' },
  { key: 'mobile', label: '手機', field: 'mobileImage', size: '780 × 1174', frame: '390 × 587' },
] as const
const axes = [{key:'X',label:'左右',start:'左',end:'右'}, {key:'Y',label:'上下',start:'上',end:'下'}]
const picking = ref<'desktop' | 'mobile' | null>(null)
const phase = ref<'start' | 'end'>('start')
function set(key: string, value: string | number) { emit('update:modelValue', { ...props.modelValue, [key]: value }) }
function select(src: string) { set(picking.value === 'mobile' ? 'mobileImage' : 'image', src); picking.value = null }
</script>

<template>
  <section class="cms-hero-images" aria-label="輪播圖片與顯示位置">
    <div class="cms-hero-image-heading">
      <strong>輪播圖片</strong>
      <label>查看圖片位置<select v-model="phase" aria-label="查看圖片位置"><option value="start">圖片剛出現時</option><option value="end">圖片停留時</option></select></label>
    </div>
    <div class="cms-hero-image-grid">
      <component :is="device.key==='mobile'?'details':'section'" v-for="device in devices" :key="device.key" class="cms-hero-image-card" :aria-label="`${device.label}圖片設定`">
        <summary v-if="device.key==='mobile'">手機圖片 <span v-if="!modelValue.mobileImage" class="cms-count">沿用桌機圖</span></summary><header v-else><strong>桌機圖片</strong></header>
        <p class="cms-field-help">建議 {{ device.size }} px · JPG／PNG／WebP</p>

        <div class="cms-actions">
          <button type="button" class="cms-button" @click="($event.currentTarget as HTMLButtonElement).focus(); picking = device.key">選擇或上傳圖片</button>
          <button v-if="device.key === 'mobile' && modelValue.mobileImage" type="button" class="cms-button" @click="set('mobileImage', '')">沿用桌機圖片</button>
        </div>
        <figure class="cms-hero-crop">
          <div class="cms-hero-crop-frame" :class="`cms-hero-crop-${device.key}`">
            <HomeHeroImage v-if="modelValue.image || (device.key === 'mobile' && modelValue.mobileImage)" :slide="modelValue" :viewport="device.key" :alt="`${modelValue.title || '輪播'}・${device.label}圖片顯示範圍`" :image-class="phase === 'end' ? 'hero-page1-image-settled' : 'cms-hero-image-start'" />
            <p v-else class="cms-hero-empty">請先選擇圖片</p>
          </div>
          <figcaption>{{ device.frame }} px 參考畫面</figcaption>
        </figure>
        <details class="cms-crop-focus"><summary>調整圖片顯示位置</summary><label v-for="axis in axes" :key="axis.key" class="cms-hero-focus">
          <span>{{ device.label }}圖片{{ axis.label }}位置 <output>{{ modelValue[`${device.key}Focus${axis.key}`] ?? 50 }}%</output></span>
          <span class="cms-hero-focus-track"><span>{{ axis.start }}</span><input type="range" min="0" max="100" step="1" :value="modelValue[`${device.key}Focus${axis.key}`] ?? 50" :aria-label="`${device.label}圖片${axis.label}位置`" @input="set(`${device.key}Focus${axis.key}`, Number(($event.target as HTMLInputElement).value))" /><span>{{ axis.end }}</span></span>
        </label></details>
      </component>
    </div>
    <p class="cms-field-help">若主體被切到，可展開「調整圖片顯示位置」修正。手機可另外選圖，或沿用桌機圖片；更新官網後生效。</p>
    <AdminDialog :open="Boolean(picking)" :title="`選擇${picking === 'mobile' ? '手機' : '桌機'}輪播圖片`" wide @close="picking = null"><AdminMediaGrid picking kind="image" @select="select($event.src)" /></AdminDialog>
  </section>
</template>
