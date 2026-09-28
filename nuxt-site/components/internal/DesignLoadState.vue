<script setup lang="ts">
const props = withDefaults(defineProps<{ pending: boolean; error?: any; label?: string }>(), { label: '設計案例' })
defineEmits<{ retry: [] }>()
const status = computed(() => props.error?.statusCode ?? props.error?.status ?? props.error?.data?.statusCode ?? 500)
const reason = computed(() => props.error?.data?.data?.reason ?? props.error?.data?.message ?? props.error?.message ?? '資料讀取失敗')
const code = computed(() => props.error?.data?.data?.code)
</script>

<template>
  <div v-if="pending" class="design-load-state" role="status" aria-live="polite">正在讀取{{ label }}…</div>
  <div v-else-if="error" class="design-load-state" role="alert">
    <h2>無法載入{{ label }}（HTTP {{ status }}{{ code ? ` / ${code}` : '' }}）</h2>
    <p>{{ reason }}</p>
    <button type="button" @click="$emit('retry')">重新載入</button>
  </div>
</template>

<style scoped>
.design-load-state { padding: 40px 24px; border: 1px solid #e3e3e8; border-radius: 24px; background: #fff; color: #59585d; overflow-wrap: anywhere; }
h2 { font-size: 22px; color: #1c1c1d; margin-bottom: 16px; }
p { white-space: pre-wrap; }
button { margin-top: 20px; padding: 10px 20px; border: 1px solid #caa05c; border-radius: 99px; cursor: pointer; }
</style>
