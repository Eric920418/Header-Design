<script setup lang="ts">
import { regionCities } from '~/data/storeCases'
const props=defineProps<{modelValue:Record<string,string[]>}>()
const emit=defineEmits<{'update:modelValue':[value:Record<string,string[]>]}>()
const regions=Object.keys(regionCities),region=ref(regions[0]!),fieldId=useId()
const cities=computed(()=>props.modelValue[region.value]||[])
const choices=computed(()=>regionCities[region.value]||[])
const available=computed(()=>choices.value.filter(city=>!cities.value.includes(city)))
function update(next:string[]){emit('update:modelValue',{...props.modelValue,[region.value]:next})}
function change(index:number,city:string){if(choices.value.includes(city)&&!cities.value.some((value,i)=>i!==index&&value===city))update(cities.value.map((value,i)=>i===index?city:value))}
function move(index:number,step:number){const next=[...cities.value],other=index+step;if(other<0||other>=next.length)return;[next[index],next[other]]=[next[other]!,next[index]!];update(next)}
async function add(){const city=available.value[0];if(!city)return;const index=cities.value.length;update([...cities.value,city]);await nextTick();document.getElementById(`${fieldId}-${index}`)?.focus()}
async function remove(index:number){if(cities.value.length<=1)return;update(cities.value.filter((_,i)=>i!==index));await nextTick();document.getElementById(`${fieldId}-${Math.min(index,cities.value.length-1)}`)?.focus()}
</script>

<template>
  <fieldset class="cms-fields cms-store-regions">
    <legend>地區與縣市設定</legend>
    <div class="cms-field"><label :for="fieldId+'-region'">區域</label><select :id="fieldId+'-region'" v-model="region" :aria-describedby="fieldId+'-hint'"><option v-for="name in regions" :key="name" :value="name">{{ name }}</option></select></div>
    <p :id="fieldId+'-hint'" class="cms-field-help">設定首頁門市查詢的縣市選項；切換區域不會更動其他區域資料。</p>
    <section class="cms-array" :aria-label="region+'縣市設定'">
      <div class="cms-section-heading"><strong>{{ region }} <span class="cms-count">{{ cities.length }}</span></strong><button type="button" class="cms-button" :disabled="!available.length" @click="add">新增縣市</button></div>
      <div v-for="(city,index) in cities" :key="index" class="cms-store-city-row">
        <div class="cms-field"><label :for="`${fieldId}-${index}`">縣市 {{ index+1 }}</label><select :id="`${fieldId}-${index}`" :value="city" :aria-describedby="choices.includes(city)?undefined:`${fieldId}-error-${index}`" @change="change(index,($event.target as HTMLSelectElement).value)"><option v-if="!choices.includes(city)" :value="city" disabled>{{ city }}（原有設定）</option><option v-for="name in choices" :key="name" :value="name" :disabled="name!==city&&cities.includes(name)">{{ name }}</option></select><p v-if="!choices.includes(city)" :id="`${fieldId}-error-${index}`" class="cms-error" role="alert">「{{ city }}」不屬於{{ region }}，請選擇此區域的縣市；原值尚未更動。</p></div>
        <div class="cms-actions"><button type="button" class="cms-button" :aria-label="'上移'+city" :disabled="index===0" @click="move(index,-1)">上移</button><button type="button" class="cms-button" :aria-label="'下移'+city" :disabled="index===cities.length-1" @click="move(index,1)">下移</button><button type="button" class="cms-button" :aria-label="'移除'+city" :disabled="cities.length<=1" @click="remove(index)">移除</button></div>
      </div>
    </section>
  </fieldset>
</template>
