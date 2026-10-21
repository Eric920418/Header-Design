<script setup lang="ts">
const props = defineProps<{ modelValue: any }>()
const emit = defineEmits<{ 'update:modelValue': [value: any] }>()
const devices = [
  { key: 'desktop', label: '桌機', field: 'image', size: '1920 × 1280', frame: '1440 × 952' },
  { key: 'mobile', label: '手機', field: 'mobileImage', size: '780 × 1174', frame: '390 × 587' },
] as const
const axes = [{key:'X',label:'水平',start:'左',end:'右'}, {key:'Y',label:'垂直',start:'上',end:'下'}]
const picking = ref<'desktop' | 'mobile' | null>(null)
const phase = ref<'start' | 'end'>('start')
function set(key: string, value: string | number) { emit('update:modelValue', { ...props.modelValue, [key]: value }) }
function select(src: string) { set(picking.value === 'mobile' ? 'mobileImage' : 'image', src); picking.value = null }
</script>

<template>
  <section class="cms-hero-images" aria-label="輪播圖片與裁切設定">
    <div class="cms-hero-image-heading">
      <strong>輪播圖片與裁切</strong>
      <label>動態裁切預覽<select v-model="phase" aria-label="動態裁切預覽"><option value="start">進場構圖</option><option value="end">停留末端構圖</option></select></label>
    </div>
    <div class="cms-hero-image-grid">
      <section v-for="device in devices" :key="device.key" class="cms-hero-image-card" :aria-label="`${device.label}圖片設定`">
        <header><strong>{{ device.label }}圖片</strong><span v-if="device.key === 'mobile' && !modelValue.mobileImage" class="cms-count">沿用桌機圖</span></header>
        <p class="cms-field-help">建議 {{ device.size }} px · JPG／PNG／WebP</p>

        <div class="cms-actions">
          <button type="button" class="cms-button" @click="($event.currentTarget as HTMLButtonElement).focus(); picking = device.key">選擇或上傳圖片</button>
          <button v-if="device.key === 'mobile' && modelValue.mobileImage" type="button" class="cms-button" @click="set('mobileImage', '')">沿用桌機圖片</button>
        </div>
        <figure class="cms-hero-crop">
          <div class="cms-hero-crop-frame" :class="`cms-hero-crop-${device.key}`">
            <HomeHeroImage v-if="modelValue.image || (device.key === 'mobile' && modelValue.mobileImage)" :slide="modelValue" :viewport="device.key" :alt="`${modelValue.title || '輪播'}・${device.label}裁切預覽`" :image-class="phase === 'end' ? 'hero-page1-image-settled' : 'cms-hero-image-start'" />
            <p v-else class="cms-hero-empty">請先選擇圖片</p>
          </div>
          <figcaption>{{ device.frame }} px 參考畫面</figcaption>
        </figure>
        <label v-for="axis in axes" :key="axis.key" class="cms-hero-focus">
          <span>{{ device.label }}{{ axis.label }}焦點 <output>{{ modelValue[`${device.key}Focus${axis.key}`] ?? 50 }}%</output></span>
          <span class="cms-hero-focus-track"><span>{{ axis.start }}</span><input type="range" min="0" max="100" step="1" :value="modelValue[`${device.key}Focus${axis.key}`] ?? 50" :aria-label="`${device.label}${axis.label}焦點`" @input="set(`${device.key}Focus${axis.key}`, Number(($event.target as HTMLInputElement).value))" /><span>{{ axis.end }}</span></span>
        </label>
      </section>
    </div>
    <p class="cms-field-help">焦點與選圖即時套用於預覽。官網會依螢幕比例滿版裁切，輪播含緩慢放大與平移，重要主體請保留邊界；更新官網後才會讓訪客看到。</p>
    <AdminDialog :open="Boolean(picking)" :title="`選擇${picking === 'mobile' ? '手機' : '桌機'}輪播圖片`" wide @close="picking = null"><AdminMediaGrid picking kind="image" @select="select($event.src)" /></AdminDialog>
  </section>
</template>
