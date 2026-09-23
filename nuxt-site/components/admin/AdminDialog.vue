<script setup lang="ts">
import { X } from 'lucide-vue-next'
const props = defineProps<{ open: boolean; title: string; wide?: boolean }>()
const emit = defineEmits<{ close: [] }>()
const dialog = ref<HTMLDialogElement>()
const titleId = useId()
const syncDialog = () => {
  if (props.open && !dialog.value?.open) dialog.value?.showModal()
  if (!props.open && dialog.value?.open) dialog.value?.close()
}
watch(() => props.open, syncDialog, { flush: 'post' })
onMounted(syncDialog)
</script>

<template>
  <dialog ref="dialog" class="cms-dialog" :class="{ 'cms-dialog-wide': wide }" :aria-labelledby="titleId" data-lenis-prevent @cancel.prevent="emit('close')" @close="emit('close')" @click="event => { if (event.target === dialog) emit('close') }">
    <div class="cms-dialog-body">
      <header class="cms-dialog-header"><div><h2 :id="titleId">{{ title }}</h2></div><button class="cms-icon-button" type="button" aria-label="關閉視窗" autofocus @click="emit('close')"><X :size="20" /></button></header>
      <slot v-if="open" />
    </div>
  </dialog>
</template>
