<script setup lang="ts">
import { AlertCircle, ArrowRight, ExternalLink, LoaderCircle, Plus } from 'lucide-vue-next'
import { FRANCHISE_OFFICIAL_FORM_URL } from '~/data/franchise'

type FormKey = 'name' | 'email' | 'phone' | 'experience' | 'budget' | 'area' | 'timeline' | 'consent'
type SubmitState = 'idle' | 'submitting' | 'success' | 'error'

const config = useRuntimeConfig()
const endpoint = computed(() => String(config.public.franchiseApplicationEndpoint || '').trim())
const serviceConfigured = computed(() => Boolean(endpoint.value))
const formElement = ref<HTMLFormElement | null>(null)
const submitState = ref<SubmitState>('idle')
const notice = ref<{ title: string, message: string, detail?: string } | null>(null)

const form = reactive({
  name: '',
  email: '',
  phone: '',
  experience: '',
  budget: '',
  area: '',
  timeline: '',
  consent: false,
})

const errors = reactive<Record<FormKey, string>>({
  name: '',
  email: '',
  phone: '',
  experience: '',
  budget: '',
  area: '',
  timeline: '',
  consent: '',
})

const budgetOptions = ['200萬以下', '200萬 - 300萬', '300萬 - 400萬', '400萬以上']
const timelineOptions = ['暫無計畫', '三個月內', '半年內', '一年內', '其他']

const validateField = (key: FormKey) => {
  if (key === 'name') errors.name = form.name.trim().length >= 2 ? '' : '請輸入至少 2 個字的姓名。'
  if (key === 'email') errors.email = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(form.email.trim()) ? '' : '請輸入有效的電子郵件。'
  if (key === 'phone') {
    const digits = form.phone.replace(/\D/g, '')
    errors.phone = digits.length >= 9 && digits.length <= 10 ? '' : '請輸入 9 至 10 碼的有效聯絡電話。'
  }
  if (key === 'experience') errors.experience = form.experience ? '' : '請選擇是否有創業或加盟經驗。'
  if (key === 'budget') errors.budget = form.budget ? '' : '請選擇預計投入的創業資本。'
  if (key === 'area') errors.area = form.area.trim().length >= 2 ? '' : '請填寫希望開店的城市或區域。'
  if (key === 'timeline') errors.timeline = form.timeline ? '' : '請選擇預計創業時間。'
  if (key === 'consent') errors.consent = form.consent ? '' : '請先同意個人資料運用告知聲明。'
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
  form.name = ''
  form.email = ''
  form.phone = ''
  form.experience = ''
  form.budget = ''
  form.area = ''
  form.timeline = ''
  form.consent = false
  ;(Object.keys(errors) as FormKey[]).forEach(key => { errors[key] = '' })
}

const submit = async () => {
  notice.value = null
  submitState.value = 'idle'

  if (!validate()) {
    submitState.value = 'error'
    notice.value = {
      title: '申請資料尚未完成',
      message: '請修正表單中標示的必填欄位後再送出。',
      detail: 'ValidationError: one or more required fields are invalid.',
    }
    await focusFirstError()
    return
  }

  if (!endpoint.value) {
    submitState.value = 'error'
    notice.value = {
      title: '申請資料未送出',
      message: '目前尚未連接櫻花公司後台。為保護個人資料，本頁沒有傳送或儲存任何輸入內容，請改用現行官方申請表。',
      detail: 'ConfigurationError: NUXT_PUBLIC_FRANCHISE_APPLICATION_ENDPOINT is empty.',
    }
    return
  }

  submitState.value = 'submitting'

  try {
    await $fetch(endpoint.value, {
      method: 'POST',
      body: {
        name: form.name.trim(),
        email: form.email.trim(),
        phone: form.phone.trim(),
        experience: form.experience,
        budget: form.budget,
        area: form.area.trim(),
        timeline: form.timeline,
        consent: form.consent,
      },
    })
    submitState.value = 'success'
    notice.value = {
      title: '申請資料已送出',
      message: '感謝您的申請，櫻花整體廚房將依您留下的聯絡方式與您聯繫。',
    }
    resetForm()
  }
  catch (error) {
    submitState.value = 'error'
    notice.value = {
      title: '申請資料送出失敗',
      message: '後台沒有完成接收，輸入內容未在本頁儲存。請稍後重試或改用現行官方申請表。',
      detail: `${formatSubmitError(error)} · Endpoint: ${endpoint.value}`,
    }
  }
}
</script>

<template>
  <section class="application-form" aria-labelledby="application-form-heading">
    <header class="application-form__header">
      <span>Application Form</span>
      <h2 id="application-form-heading">加盟申請資料</h2>
      <p>所有欄位皆為必填；送出前請再次確認聯絡方式與加盟規劃。</p>
    </header>

    <div v-if="!serviceConfigured" class="application-form__service" role="status">
      <AlertCircle aria-hidden="true" />
      <div>
        <strong>線上送出服務正在串接中</strong>
        <p>本頁目前只提供欄位與驗證測試，不會傳送或儲存個人資料。</p>
        <a :href="FRANCHISE_OFFICIAL_FORM_URL" target="_blank" rel="noopener noreferrer">前往現行官方申請表 <ExternalLink aria-hidden="true" /></a>
      </div>
    </div>

    <form ref="formElement" novalidate @submit.prevent="submit">
      <div class="application-form__identity">
        <label>
          <span>消費者姓名 *</span>
          <input v-model="form.name" name="name" type="text" autocomplete="name" :aria-invalid="Boolean(errors.name)" aria-describedby="application-name-error" @blur="validateField('name')" />
          <small v-if="errors.name" id="application-name-error">{{ errors.name }}</small>
        </label>
        <label>
          <span>電子郵件 *</span>
          <input v-model="form.email" name="email" type="email" inputmode="email" autocomplete="email" :aria-invalid="Boolean(errors.email)" aria-describedby="application-email-error" @blur="validateField('email')" />
          <small v-if="errors.email" id="application-email-error">{{ errors.email }}</small>
        </label>
        <label>
          <span>聯絡電話 *</span>
          <input v-model="form.phone" name="phone" type="tel" inputmode="tel" autocomplete="tel" :aria-invalid="Boolean(errors.phone)" aria-describedby="application-phone-error" @blur="validateField('phone')" />
          <small v-if="errors.phone" id="application-phone-error">{{ errors.phone }}</small>
        </label>
      </div>

      <fieldset class="application-form__intent">
        <legend>加盟意向</legend>

        <div class="application-field application-field--experience" :aria-invalid="Boolean(errors.experience)" aria-describedby="application-experience-error">
          <span>您有過創業或經營加盟店的經驗嗎？ *</span>
          <div class="application-form__radios">
            <label><input v-model="form.experience" type="radio" name="experience" value="是" @change="validateField('experience')" /><span>是</span></label>
            <label><input v-model="form.experience" type="radio" name="experience" value="否" @change="validateField('experience')" /><span>否</span></label>
          </div>
          <small v-if="errors.experience" id="application-experience-error">{{ errors.experience }}</small>
        </div>

        <label class="application-field">
          <span>您預計投入多少創業資本？ *</span>
          <span class="application-select">
            <select v-model="form.budget" name="budget" :aria-invalid="Boolean(errors.budget)" aria-describedby="application-budget-error" @blur="validateField('budget')" @change="validateField('budget')">
              <option value="" disabled>預計投入的預算</option>
              <option v-for="option in budgetOptions" :key="option" :value="option">{{ option }}</option>
            </select>
            <Plus aria-hidden="true" />
          </span>
          <small v-if="errors.budget" id="application-budget-error">{{ errors.budget }}</small>
        </label>

        <label class="application-field">
          <span>您希望開店的地區是？ *</span>
          <input v-model="form.area" name="area" type="text" autocomplete="address-level2" placeholder="（城市／區域）" :aria-invalid="Boolean(errors.area)" aria-describedby="application-area-error" @blur="validateField('area')" />
          <small v-if="errors.area" id="application-area-error">{{ errors.area }}</small>
        </label>

        <label class="application-field">
          <span>請問您預計多久後創業？ *</span>
          <span class="application-select">
            <select v-model="form.timeline" name="timeline" :aria-invalid="Boolean(errors.timeline)" aria-describedby="application-timeline-error" @blur="validateField('timeline')" @change="validateField('timeline')">
              <option value="" disabled>預計多久後創業</option>
              <option v-for="option in timelineOptions" :key="option" :value="option">{{ option }}</option>
            </select>
            <Plus aria-hidden="true" />
          </span>
          <small v-if="errors.timeline" id="application-timeline-error">{{ errors.timeline }}</small>
        </label>
      </fieldset>

      <label class="application-form__consent">
        <input v-model="form.consent" name="consent" type="checkbox" :aria-invalid="Boolean(errors.consent)" aria-describedby="application-consent-error" @change="validateField('consent')" />
        <span>本人已完整審閱及清楚知悉、瞭解並同意台灣櫻花股份有限公司 <NuxtLink to="/privacy" target="_blank">【個人資料運用告知聲明】</NuxtLink></span>
        <small v-if="errors.consent" id="application-consent-error">{{ errors.consent }}</small>
      </label>

      <div v-reveal="{ anim: 'opalScaleUp' }" data-ev="opalScaleUp" class="application-form__submit-row ev">
        <button type="submit" :disabled="submitState === 'submitting'">
          <span>{{ submitState === 'submitting' ? '送出中' : '確認送出' }}</span>
          <span class="application-form__submit-icon">
            <LoaderCircle v-if="submitState === 'submitting'" aria-hidden="true" class="is-spinning" />
            <ArrowRight v-else aria-hidden="true" />
          </span>
        </button>
        <p>正式送出將啟用後台防濫用驗證；目前未載入假的 reCAPTCHA 元件。</p>
      </div>

      <div v-if="notice" class="application-form__notice" :class="`is-${submitState}`" role="alert" aria-live="assertive">
        <strong>{{ notice.title }}</strong>
        <p>{{ notice.message }}</p>
        <div v-if="notice.detail" class="application-form__notice-detail">
          <span>完整錯誤資訊</span>
          <code>{{ notice.detail }}</code>
        </div>
        <a v-if="submitState === 'error'" :href="FRANCHISE_OFFICIAL_FORM_URL" target="_blank" rel="noopener noreferrer">改用現行官方申請表 <ExternalLink aria-hidden="true" /></a>
      </div>
    </form>
  </section>
</template>

<style scoped>
.application-form {
  padding: 62px 64px 70px;
  border-radius: 24px;
  background: #fff;
  box-shadow: 0 18px 70px rgb(28 28 29 / 8%);
  font-family: var(--font-cjk-sans);
}

.application-form__header > span { color: #caa05c; font-family: var(--font-cjk-sans); font-size: 12px; letter-spacing: .14em; text-transform: uppercase; }
.application-form__header h2 { margin: 10px 0 0; color: #1c1c1d; font-family: var(--font-cjk-serif); font-size: 40px; font-weight: 600; line-height: 48px; }
.application-form__header p { margin: 9px 0 0; color: #59585d; font-size: 15px; line-height: 24px; }

.application-form__service {
  display: grid;
  grid-template-columns: 24px minmax(0, 1fr);
  gap: 13px;
  margin-top: 28px;
  padding: 18px 20px;
  border: 1px solid #e8c891;
  border-radius: 18px;
  color: #59585d;
  background: #fff9ed;
}

.application-form__service > svg { width: 22px; height: 22px; margin-top: 1px; color: #a97628; }
.application-form__service strong { color: #1c1c1d; }
.application-form__service p { margin: 4px 0 0; font-size: 14px; line-height: 22px; }
.application-form__service a,
.application-form__notice > a { display: inline-flex; align-items: center; gap: 6px; margin-top: 8px; color: #9a6c27; font-size: 14px; text-decoration: underline; text-underline-offset: 3px; }
.application-form__service a svg,
.application-form__notice > a svg { width: 15px; height: 15px; }

.application-form form { margin-top: 38px; }
.application-form__identity { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 20px; }
.application-form label,
.application-field { display: block; min-width: 0; color: #1c1c1d; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 22px; }
.application-form label > span:first-child,
.application-field > span:first-child { display: block; margin-bottom: 9px; }

.application-form input:not([type='radio'], [type='checkbox']),
.application-form select {
  width: 100%;
  height: 58px;
  border: 1px solid rgb(159 159 164 / 26%);
  border-radius: 24px;
  color: #1c1c1d;
  background: #fff;
  font-family: var(--font-cjk-sans);
  font-size: 15px;
  outline: none;
  transition: border-color .3s ease, box-shadow .3s ease;
}

.application-form input:not([type='radio'], [type='checkbox']) { padding: 0 21px; }
.application-form select { appearance: none; padding: 0 52px 0 21px; }
.application-form input::placeholder { color: #9f9fa4; }
.application-form input:focus,
.application-form select:focus { border-color: #caa05c; box-shadow: 0 0 0 3px rgb(202 160 92 / 12%); }
.application-form input[aria-invalid='true'],
.application-form select[aria-invalid='true'] { border-color: #a74335; }
.application-form small { display: block; margin-top: 6px; color: #a74335; font-size: 13px; line-height: 20px; }

.application-form__intent { display: grid; gap: 24px; margin: 42px 0 0; padding: 40px 0 0; border: 0; border-top: 1px solid #e3e3e8; }
.application-form__intent legend { display: block; width: 100%; padding: 0 0 22px; color: #1c1c1d; font-family: var(--font-cjk-sans); font-size: 24px; font-weight: 600; line-height: 30px; }
.application-form__radios { display: flex; flex-wrap: wrap; gap: 12px; }
.application-form__radios label { position: relative; }
.application-form__radios input { position: absolute; width: 1px; height: 1px; overflow: hidden; opacity: 0; }
.application-form__radios label span { display: flex !important; width: 102px; height: 36px; align-items: center; justify-content: center; margin: 0 !important; border: 1px solid #59585d; border-radius: 100px; color: #59585d; cursor: pointer; transition: color .25s ease, background-color .25s ease, border-color .25s ease; }
.application-form__radios input:checked + span { color: #fff; border-color: #1c1c1d; background: #1c1c1d; }
.application-form__radios input:focus-visible + span { outline: 2px solid #caa05c; outline-offset: 3px; }
.application-select { position: relative; display: block; }
.application-select > svg { position: absolute; top: 50%; right: 20px; width: 18px; height: 18px; color: #caa05c; pointer-events: none; transform: translateY(-50%); }

.application-form__consent { display: grid !important; grid-template-columns: 19px minmax(0, 1fr); gap: 2px 11px; align-items: start; margin-top: 30px; color: #59585d !important; }
.application-form__consent input { width: 19px; height: 19px; margin-top: 2px; accent-color: #caa05c; }
.application-form__consent span { margin: 0 !important; }
.application-form__consent a { color: #9a6c27; text-decoration: underline; text-underline-offset: 3px; }
.application-form__consent small { grid-column: 2; }

.application-form__submit-row { display: flex; align-items: center; justify-content: space-between; gap: 30px; margin-top: 38px; }
.application-form__submit-row > button { position: relative; display: inline-flex; min-height: 60px; align-items: center; gap: 8px; padding: 9px 9px 9px 30px; border: 1px solid rgb(159 159 164 / 64%); border-radius: 999px; color: #1c1c1d; background: transparent; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 22px; isolation: isolate; transition: color .3s ease, border-color .3s ease, background-color .3s ease; }
.application-form__submit-row > button:hover:not(:disabled) { color: #fff; border-color: #caa05c; background: #caa05c; }
.application-form__submit-row > button:disabled { cursor: wait; opacity: .62; }
.application-form__submit-icon { position: relative; display: flex; width: 40px; height: 40px; align-items: center; justify-content: center; border-radius: 50%; color: #fff; background: #caa05c; transform: rotate(-45deg); transition: transform .5s ease; }
.application-form__submit-icon::before { position: absolute; z-index: -1; inset: 0; border: 1px solid #caa05c; border-radius: inherit; animation: application-radar 2s ease-out infinite; content: ''; }
.application-form__submit-row > button:hover .application-form__submit-icon { transform: rotate(0); }
.application-form__submit-icon svg { width: 20px; height: 20px; }
.application-form__submit-icon .is-spinning { animation: application-spin .8s linear infinite; }
.application-form__submit-row > p { max-width: 360px; margin: 0; color: #9f9fa4; font-size: 12px; line-height: 19px; text-align: right; }

.application-form__notice { margin-top: 28px; padding: 18px 20px; border: 1px solid #d0d0d5; border-radius: 18px; color: #59585d; background: #f6f6f6; }
.application-form__notice.is-error { border-color: #e2aaa1; background: #fff4f1; }
.application-form__notice.is-success { border-color: #9fc2a7; background: #f3fbf4; }
.application-form__notice strong { color: #1c1c1d; }
.application-form__notice p { margin: 5px 0 0; font-size: 14px; line-height: 22px; }
.application-form__notice-detail { margin-top: 10px; }
.application-form__notice-detail > span { display: block; color: #59585d; font-size: 13px; }
.application-form__notice code { display: block; margin-top: 8px; overflow-wrap: anywhere; color: #8b3329; font-size: 12px; line-height: 19px; }

@keyframes application-spin { to { transform: rotate(360deg); } }
@keyframes application-radar {
  0% { opacity: .65; transform: scale(1); }
  75%, 100% { opacity: 0; transform: scale(1.55); }
}

@media (max-width: 767px) {
  .application-form { padding: 36px 20px 42px; border-radius: 18px; }
  .application-form__header h2 { font-size: 30px; line-height: 36px; }
  .application-form__identity { grid-template-columns: 1fr; gap: 21px; }
  .application-form__intent { margin-top: 34px; padding-top: 32px; }
  .application-form__intent legend { font-size: 22px; line-height: 28px; }
  .application-form__submit-row { align-items: flex-start; flex-direction: column; }
  .application-form__submit-row > p { max-width: none; text-align: left; }
}

@media (prefers-reduced-motion: reduce) {
  .application-form input,
  .application-form select,
  .application-form__radios label span,
  .application-form__submit-row > button,
  .application-form__submit-icon { transition: none; }
  .application-form__submit-icon::before { animation: none; }
}
</style>
