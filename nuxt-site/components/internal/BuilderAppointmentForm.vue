<script setup lang="ts">
import { AlertCircle, ArrowRight, LoaderCircle } from 'lucide-vue-next'

type FormKey = 'contactName' | 'phone' | 'company' | 'email'
type SubmitState = 'idle' | 'submitting' | 'success' | 'error'

const config = useRuntimeConfig()
const endpoint = computed(() => String(config.public.builderAppointmentEndpoint || '').trim())
const serviceConfigured = computed(() => Boolean(endpoint.value))
const formElement = ref<HTMLFormElement | null>(null)
const submitState = ref<SubmitState>('idle')
const notice = ref<{ title: string, message: string, detail?: string } | null>(null)

const form = reactive({
  contactName: '',
  phone: '',
  company: '',
  email: '',
  note: '',
})

const errors = reactive<Record<FormKey, string>>({
  contactName: '',
  phone: '',
  company: '',
  email: '',
})

const validateField = (key: FormKey) => {
  if (key === 'contactName') errors.contactName = form.contactName.trim().length >= 2 ? '' : '請輸入至少 2 個字的聯絡人姓名。'
  if (key === 'phone') {
    const digits = form.phone.replace(/\D/g, '')
    errors.phone = digits.length >= 9 && digits.length <= 10 ? '' : '請輸入 9 至 10 碼的有效聯絡電話。'
  }
  if (key === 'company') errors.company = form.company.trim().length >= 2 ? '' : '請輸入至少 2 個字的建設公司名稱。'
  if (key === 'email') errors.email = !form.email.trim() || /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(form.email.trim()) ? '' : '請輸入有效的電子信箱，或保留空白。'
}

const validate = () => {
  ;(Object.keys(errors) as FormKey[]).forEach(validateField)
  return !Object.values(errors).some(Boolean)
}

const focusFirstError = async () => {
  await nextTick()
  formElement.value?.querySelector<HTMLElement>('[aria-invalid="true"]')?.focus()
}

const formatSubmitError = (error: unknown) => {
  if (!(error instanceof Error)) return String(error)
  const responseError = error as Error & { status?: number, statusCode?: number, statusText?: string }
  const status = responseError.statusCode || responseError.status
  return [status ? `HTTP ${status}` : '', responseError.statusText || '', `${error.name}: ${error.message}`].filter(Boolean).join(' · ')
}

const resetForm = () => {
  form.contactName = ''
  form.phone = ''
  form.company = ''
  form.email = ''
  form.note = ''
  ;(Object.keys(errors) as FormKey[]).forEach((key) => { errors[key] = '' })
}

const submit = async () => {
  notice.value = null
  submitState.value = 'idle'

  if (!validate()) {
    submitState.value = 'error'
    notice.value = {
      title: '預約資料尚未完成',
      message: '請修正表單中標示的必填欄位後再送出。',
      detail: 'ValidationError: one or more required fields are invalid.',
    }
    await focusFirstError()
    return
  }

  if (!endpoint.value) {
    submitState.value = 'error'
    notice.value = {
      title: '預約資料未送出',
      message: '目前尚未連接櫻花公司後台。為保護個人資料，本頁沒有傳送或儲存任何輸入內容。',
      detail: 'ConfigurationError: NUXT_PUBLIC_BUILDER_APPOINTMENT_ENDPOINT is empty.',
    }
    return
  }

  submitState.value = 'submitting'

  try {
    await $fetch(endpoint.value, {
      method: 'POST',
      body: {
        contactName: form.contactName.trim(),
        phone: form.phone.trim(),
        company: form.company.trim(),
        email: form.email.trim() || null,
        note: form.note.trim() || null,
      },
    })
    submitState.value = 'success'
    notice.value = {
      title: '預約資料已送出',
      message: '感謝您的預約，櫻花整體廚房將依您留下的聯絡方式與您聯繫。',
    }
    resetForm()
  }
  catch (error) {
    submitState.value = 'error'
    notice.value = {
      title: '預約資料送出失敗',
      message: '後台沒有完成接收，輸入內容未在本頁儲存。請稍後重試。',
      detail: `${formatSubmitError(error)} · Endpoint: ${endpoint.value}`,
    }
  }
}
</script>

<template>
  <section class="builder-form" aria-labelledby="builder-form-heading">
    <header class="builder-form__header">
      <span>Appointment Form</span>
      <h3 id="builder-form-heading">預約專人聯繫</h3>
      <p>留下建案聯絡資訊，我們將提供整體廚房規劃建議。</p>
    </header>

    <div v-if="!serviceConfigured" class="builder-form__service" role="status">
      <AlertCircle aria-hidden="true" />
      <div>
        <strong>線上送出服務正在串接中</strong>
        <p>欄位與驗證可正常測試；正式端點設定前，本頁不會傳送或儲存任何個人資料。</p>
      </div>
    </div>

    <form ref="formElement" novalidate @submit.prevent="submit">
      <div class="builder-form__grid">
        <label>
          <span>聯絡人（必填）</span>
          <input v-model="form.contactName" name="contactName" type="text" autocomplete="name" placeholder="請輸入姓名" :aria-invalid="Boolean(errors.contactName)" aria-describedby="builder-contact-name-error" @blur="validateField('contactName')" />
          <small v-if="errors.contactName" id="builder-contact-name-error">{{ errors.contactName }}</small>
        </label>
        <label>
          <span>聯絡電話（必填）</span>
          <input v-model="form.phone" name="phone" type="tel" inputmode="tel" autocomplete="tel" placeholder="請輸入聯絡電話" :aria-invalid="Boolean(errors.phone)" aria-describedby="builder-phone-error" @blur="validateField('phone')" />
          <small v-if="errors.phone" id="builder-phone-error">{{ errors.phone }}</small>
        </label>
        <label>
          <span>建設公司（必填）</span>
          <input v-model="form.company" name="company" type="text" autocomplete="organization" placeholder="請輸入公司名稱" :aria-invalid="Boolean(errors.company)" aria-describedby="builder-company-error" @blur="validateField('company')" />
          <small v-if="errors.company" id="builder-company-error">{{ errors.company }}</small>
        </label>
        <label>
          <span>電子信箱</span>
          <input v-model="form.email" name="email" type="email" inputmode="email" autocomplete="email" placeholder="name@example.com" :aria-invalid="Boolean(errors.email)" aria-describedby="builder-email-error" @blur="validateField('email')" />
          <small v-if="errors.email" id="builder-email-error">{{ errors.email }}</small>
        </label>
        <label class="builder-form__note">
          <span>備註</span>
          <textarea v-model="form.note" name="note" rows="5" placeholder="可填寫建案地點、戶數、預計時程或希望了解的服務" />
        </label>
      </div>

      <div class="builder-form__submit-row">
        <button type="submit" class="site-content-cta" :disabled="submitState === 'submitting'">
          <span>{{ submitState === 'submitting' ? '送出中' : '立即預約' }}</span>
          <span class="builder-form__submit-icon site-cta-icon">
            <LoaderCircle v-if="submitState === 'submitting'" aria-hidden="true" class="is-spinning" />
            <ArrowRight v-else aria-hidden="true" />
          </span>
        </button>
        <p>送出即表示已閱讀 <NuxtLink to="/privacy" target="_blank">個人資料運用告知聲明</NuxtLink>。</p>
      </div>

      <div v-if="notice" class="builder-form__notice" :class="`is-${submitState}`" role="alert" aria-live="assertive">
        <strong>{{ notice.title }}</strong>
        <p>{{ notice.message }}</p>
        <div v-if="notice.detail" class="builder-form__notice-detail">
          <span>完整錯誤資訊</span>
          <code>{{ notice.detail }}</code>
        </div>
      </div>
    </form>
  </section>
</template>

<style scoped>
.builder-form { padding: 52px 54px 58px; border-radius: 24px; background: #fff; box-shadow: 0 18px 70px rgb(28 28 29 / 8%); }
.builder-form__header > span { color: #caa05c; font-family: "Cal Sans", sans-serif; font-size: 12px; letter-spacing: .14em; text-transform: uppercase; }
.builder-form__header h3 { margin: 10px 0 0; color: #1c1c1d; font-family: "Cal Sans", sans-serif; font-size: 40px; font-weight: 400; line-height: 48px; }
.builder-form__header p { margin: 9px 0 0; color: #59585d; font-size: 15px; line-height: 24px; }
.builder-form__service { display: grid; grid-template-columns: 24px minmax(0, 1fr); gap: 13px; margin-top: 26px; padding: 17px 19px; border: 1px solid #e8c891; border-radius: 18px; color: #59585d; background: #fff9ed; }
.builder-form__service > svg { width: 22px; height: 22px; color: #a97628; }
.builder-form__service strong { color: #1c1c1d; }
.builder-form__service p { margin: 4px 0 0; font-size: 14px; line-height: 22px; }
.builder-form form { margin-top: 32px; }
.builder-form__grid { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 22px 20px; }
.builder-form label { display: block; min-width: 0; color: #1c1c1d; font-size: 14px; line-height: 22px; }
.builder-form label > span:first-child { display: block; margin-bottom: 9px; }
.builder-form input,
.builder-form textarea { width: 100%; border: 1px solid rgb(159 159 164 / 28%); border-radius: 24px; color: #1c1c1d; background: #f6f6f6; outline: none; transition: border-color .3s ease, box-shadow .3s ease, background-color .3s ease; }
.builder-form input { height: 58px; padding: 0 21px; }
.builder-form textarea { min-height: 132px; resize: vertical; padding: 17px 21px; }
.builder-form input::placeholder,
.builder-form textarea::placeholder { color: #9f9fa4; }
.builder-form input:focus,
.builder-form textarea:focus { border-color: #caa05c; background: #fff; box-shadow: 0 0 0 3px rgb(202 160 92 / 12%); }
.builder-form input[aria-invalid='true'] { border-color: #a74335; }
.builder-form small { display: block; margin-top: 6px; color: #a74335; font-size: 13px; line-height: 20px; }
.builder-form__note { grid-column: 1 / -1; }
.builder-form__submit-row { display: flex; align-items: center; justify-content: space-between; gap: 24px; margin-top: 28px; }
.builder-form__submit-row button { display: inline-flex; width: max-content; min-height: 60px; align-items: center; gap: 8px; padding: 9px 9px 9px 30px; border: 1px solid rgb(159 159 164 / 64%); border-radius: 999px; color: #1c1c1d; background: transparent; font-size: 15px; line-height: 22px; cursor: pointer; transition: color .3s ease, border-color .3s ease, background-color .3s ease; }
.builder-form__submit-row button:hover:not(:disabled),
.builder-form__submit-row button:focus-visible:not(:disabled) { color: #fff; border-color: #caa05c; background: #caa05c; }
.builder-form__submit-row button:disabled { cursor: wait; opacity: .62; }
.builder-form__submit-icon { display: inline-flex; width: 40px; height: 40px; align-items: center; justify-content: center; border-radius: 50%; color: #fff; background: #caa05c; transform: rotate(-45deg); transition: transform .5s ease; }
.builder-form__submit-row button:hover .builder-form__submit-icon,
.builder-form__submit-row button:focus-visible .builder-form__submit-icon { transform: rotate(0); }
.builder-form__submit-icon svg { width: 20px; height: 20px; }
.builder-form__submit-row > p { max-width: 300px; margin: 0; color: #9f9fa4; font-size: 12px; line-height: 19px; text-align: right; }
.builder-form__submit-row > p a { color: #8b6224; text-decoration: underline; text-underline-offset: 3px; }
.is-spinning { animation: builder-spin 1s linear infinite; }
.builder-form__notice { margin-top: 26px; padding: 18px 20px; border: 1px solid #e3e3e8; border-radius: 18px; color: #59585d; background: #f6f6f6; }
.builder-form__notice.is-error { border-color: #d9a39b; background: #fff4f1; }
.builder-form__notice.is-success { border-color: #caa05c; background: #fff9ed; }
.builder-form__notice strong { color: #1c1c1d; }
.builder-form__notice p { margin: 5px 0 0; font-size: 14px; line-height: 22px; }
.builder-form__notice-detail { margin-top: 13px; padding: 12px 14px; border-radius: 12px; color: #7c2e23; background: rgb(167 67 53 / 8%); }
.builder-form__notice-detail span { display: block; margin-bottom: 4px; font-size: 12px; }
.builder-form__notice-detail code { overflow-wrap: anywhere; font-size: 12px; line-height: 19px; white-space: normal; }

@keyframes builder-spin { to { transform: rotate(360deg); } }

@media (max-width: 767px) {
  .builder-form { padding: 34px 20px 38px; border-radius: 18px; }
  .builder-form__header h3 { font-size: 34px; line-height: 40px; }
  .builder-form__grid { grid-template-columns: 1fr; }
  .builder-form__note { grid-column: auto; }
  .builder-form__submit-row { flex-direction: column; align-items: flex-start; }
  .builder-form__submit-row > p { max-width: none; text-align: left; }
}

@media (prefers-reduced-motion: reduce) {
  .builder-form input,
  .builder-form textarea,
  .builder-form__submit-row button { transition: none; }
  .builder-form__submit-icon { transition: none; }
  .is-spinning { animation: none; }
}
</style>
