<script setup lang="ts">
import { storeRegionCities } from '~/shared/cms/store-location.mjs'
const props=defineProps<{modelValue:{id:number;region:string;city:string;[key:string]:any}}>()
const emit=defineEmits<{'update:modelValue':[value:typeof props.modelValue]}>()
const fieldId=useId(),regions=Object.keys(storeRegionCities)
const cities=computed<string[]>(()=>Object.hasOwn(storeRegionCities,props.modelValue.region)?storeRegionCities[props.modelValue.region as keyof typeof storeRegionCities]:[])
const error=computed(()=>!props.modelValue.city?'請選擇縣市。':!cities.value.includes(props.modelValue.city)?`「${props.modelValue.city}」不屬於${props.modelValue.region}，請重新選擇縣市。`:'')
function regionChange(region:string){if(regions.includes(region)&&region!==props.modelValue.region)emit('update:modelValue',{...props.modelValue,region,city:''})}
function cityChange(city:string){if(cities.value.includes(city))emit('update:modelValue',{...props.modelValue,city})}
</script>
<template>
  <div class="cms-fields cms-store-location">
    <div class="cms-field"><label :for="fieldId+'-region'">區域</label><select :id="fieldId+'-region'" :value="modelValue.region" @change="regionChange(($event.target as HTMLSelectElement).value)"><option v-if="!regions.includes(modelValue.region)" :value="modelValue.region" disabled>{{ modelValue.region }}（原有設定）</option><option v-for="name in regions" :key="name" :value="name">{{ name }}</option></select></div>
    <div class="cms-field"><label :for="fieldId+'-city'">縣市</label><select :id="fieldId+'-city'" :value="modelValue.city" :disabled="!cities.length" :aria-invalid="!!error" :aria-describedby="error?fieldId+'-error':undefined" @change="cityChange(($event.target as HTMLSelectElement).value)"><option value="" disabled>請選擇縣市</option><option v-if="modelValue.city&&!cities.includes(modelValue.city)" :value="modelValue.city" disabled>{{ modelValue.city }}（原有設定）</option><option v-for="name in cities" :key="name" :value="name">{{ name }}</option></select><p v-if="error" :id="fieldId+'-error'" class="cms-field-help" role="alert">{{ error }}</p></div>
  </div>
</template>
