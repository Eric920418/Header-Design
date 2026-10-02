<script setup lang="ts">
import { ArrowRight, ExternalLink, LoaderCircle, Plus } from 'lucide-vue-next'
import { FRANCHISE_OFFICIAL_FORM_URL as cmsSeed_FRANCHISE_OFFICIAL_FORM_URL } from '~/data/franchise'
import { franchiseChoiceGroups, franchiseInitialValues, franchiseErrors } from '~/shared/franchise-form.mjs'
const { FRANCHISE_OFFICIAL_FORM_URL } = await useCmsResource('data-franchise', { FRANCHISE_OFFICIAL_FORM_URL: cmsSeed_FRANCHISE_OFFICIAL_FORM_URL })


type FormKey = keyof ReturnType<typeof franchiseInitialValues>
type SubmitState = 'idle' | 'submitting' | 'success' | 'error'

const endpoint = computed(() => '/api/forms/franchise')
const requestKey = ref('')
const formElement = ref<HTMLFormElement | null>(null)
const submitState = ref<SubmitState>('idle')
const notice = ref<{ title: string, message: string, detail?: string } | null>(null)

const form = reactive(franchiseInitialValues())
const profileGroups = franchiseChoiceGroups.filter(g => g.section === 'profile')
const planningGroups = franchiseChoiceGroups.filter(g => g.section === 'planning')

watch(form,()=>{if(submitState.value!=='submitting')requestKey.value=''}, {deep:true})

const errors = reactive<Record<string, string>>({})

const budgetOptions = ['200萬以下', '200萬 - 300萬', '300萬 - 400萬', '400萬以上']
const timelineOptions = ['暫無計畫', '三個月內', '半年內', '一年內', '其他']

const validateField = (key: string) => { errors[key] = franchiseErrors(form)[key] || '' }
watch(() => form.storeType, () => { errors.storeAddress = ''; errors.storeWidth = ''; errors.storeArea = '' })

const validate = () => {
  Object.keys(form).forEach(validateField)
  return !Object.values(errors).some(Boolean)
}

const focusFirstError = async () => {
  await nextTick()
  formElement.value?.querySelector<HTMLElement>('input[aria-invalid="true"], select[aria-invalid="true"], textarea[aria-invalid="true"]')?.focus()
}

const formatSubmitError = (error: unknown) => useCmsAdmin().message(error)

const resetForm = () => {
  Object.assign(form, franchiseInitialValues())
  Object.keys(errors).forEach(key => { errors[key] = '' })
}

const submit = async () => {
  if(submitState.value==='submitting')return
  notice.value = null
  submitState.value = 'idle'

  if (!validate()) {
    submitState.value = 'error'
    notice.value = {
      title: '申請資料尚未完成',
      message: '請修正表單中標示的必填欄位後再送出。',
      detail: '請確認必填欄位，並勾選資料使用同意。',
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
  if (!requestKey.value) requestKey.value = crypto.randomUUID()

  try {
    await $fetch(endpoint.value, {
      method: 'POST',
      headers: { 'Idempotency-Key': requestKey.value },
      body: { ...form, ...(form.storeType !== '自有店面' ? { storeAddress: '', storeWidth: '', storeArea: '' } : {}) },
    })
    submitState.value = 'success'
    requestKey.value = ''
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
      message: '目前無法確認接收結果，已保留輸入。請重試，相同送出不會重複建單。請稍後重試或改用現行官方申請表。',
      detail: formatSubmitError(error),
    }
  }
}
</script>

<template>
  <section class="application-form" aria-labelledby="application-form-heading">
    <header class="application-form__header">
      <span>Application Form</span>
      <h2 id="application-form-heading">加盟申請資料</h2>
      <p>標示 * 為必填；複選題可選擇多項。送出前請再次確認聯絡方式與加盟規劃。</p>
    </header>

    <form ref="formElement" novalidate @submit.prevent="submit">
      <fieldset class="application-form__body" :disabled="submitState === 'submitting'">
      <div class="application-form__identity">
        <label>
          <span>聯絡姓名 *</span>
          <input :disabled="submitState === 'submitting'" v-model="form.name" name="name" type="text" autocomplete="name" :aria-invalid="Boolean(errors.name)" aria-describedby="application-name-error" @blur="validateField('name')" />
          <small v-if="errors.name" id="application-name-error">{{ errors.name }}</small>
        </label>
        <label>
          <span>電子郵件 *</span>
          <input :disabled="submitState === 'submitting'" v-model="form.email" name="email" type="email" inputmode="email" autocomplete="email" :aria-invalid="Boolean(errors.email)" aria-describedby="application-email-error" @blur="validateField('email')" />
          <small v-if="errors.email" id="application-email-error">{{ errors.email }}</small>
        </label>
        <label>
          <span>聯絡電話 *</span>
          <input :disabled="submitState === 'submitting'" v-model="form.phone" name="phone" type="tel" inputmode="tel" autocomplete="tel" :aria-invalid="Boolean(errors.phone)" aria-describedby="application-phone-error" @blur="validateField('phone')" />
          <small v-if="errors.phone" id="application-phone-error">{{ errors.phone }}</small>
        </label>
      </div>

      <fieldset class="application-form__intent">
        <legend>個人資料</legend>
        <template v-for="group in profileGroups" :key="group.key">
          <label v-if="group.key === 'education'" class="application-field">
            <span>居住地</span>
            <input v-model="form.residence" name="residence" autocomplete="street-address" maxlength="500" :aria-invalid="Boolean(errors.residence)" aria-describedby="application-residence-error" @blur="validateField('residence')" />
            <small v-if="errors.residence" id="application-residence-error">{{ errors.residence }}</small>
          </label>
          <label v-if="group.key === 'contactTimes'" class="application-field">
            <span>LINE ID</span>
            <input v-model="form.lineId" name="lineId" maxlength="100" :aria-invalid="Boolean(errors.lineId)" aria-describedby="application-lineId-error" @blur="validateField('lineId')" />
            <small v-if="errors.lineId" id="application-lineId-error">{{ errors.lineId }}</small>
          </label>
          <fieldset class="application-choice">
            <legend>{{ group.label }} * <span v-if="group.multiple">（可複選）</span></legend>
            <div class="application-choice__options">
              <label v-for="option in group.options" :key="option">
                <input v-model="form[group.key as FormKey]" :type="group.multiple ? 'checkbox' : 'radio'" :name="group.key" :value="option" :aria-invalid="Boolean(errors[group.key])" :aria-describedby="`application-${group.key}-error`" @change="validateField(group.key)" />
                <span>{{ option }}</span>
              </label>
            </div>
            <small v-if="errors[group.key]" :id="`application-${group.key}-error`">{{ errors[group.key] }}</small>
          </fieldset>
        </template>
      </fieldset>

      <fieldset class="application-form__intent">
        <legend>加盟意向</legend>

        <div class="application-field application-field--experience" :aria-invalid="Boolean(errors.experience)" aria-describedby="application-experience-error">
          <span>您有過創業或經營加盟店的經驗嗎？ *</span>
          <div class="application-form__radios">
            <label><input :disabled="submitState === 'submitting'" v-model="form.experience" type="radio" name="experience" value="是" :aria-invalid="Boolean(errors.experience)" aria-describedby="application-experience-error" @change="validateField('experience')" /><span>是</span></label>
            <label><input :disabled="submitState === 'submitting'" v-model="form.experience" type="radio" name="experience" value="否" :aria-invalid="Boolean(errors.experience)" aria-describedby="application-experience-error" @change="validateField('experience')" /><span>否</span></label>
          </div>
          <small v-if="errors.experience" id="application-experience-error">{{ errors.experience }}</small>
        </div>

        <label class="application-field">
          <span>您預計投入多少創業資本？ *</span>
          <span class="application-select">
            <select :disabled="submitState === 'submitting'" v-model="form.budget" name="budget" :aria-invalid="Boolean(errors.budget)" aria-describedby="application-budget-error" @blur="validateField('budget')" @change="validateField('budget')">
              <option value="" disabled>預計投入的預算</option>
              <option v-for="option in budgetOptions" :key="option" :value="option">{{ option }}</option>
            </select>
            <Plus aria-hidden="true" />
          </span>
          <small v-if="errors.budget" id="application-budget-error">{{ errors.budget }}</small>
        </label>

        <label class="application-field">
          <span>您希望開店的地區是？ *</span>
          <input :disabled="submitState === 'submitting'" v-model="form.area" name="area" type="text" autocomplete="address-level2" placeholder="（城市／區域）" :aria-invalid="Boolean(errors.area)" aria-describedby="application-area-error" @blur="validateField('area')" />
          <small v-if="errors.area" id="application-area-error">{{ errors.area }}</small>
        </label>

        <label class="application-field">
          <span>請問您預計多久後創業？ *</span>
          <span class="application-select">
            <select :disabled="submitState === 'submitting'" v-model="form.timeline" name="timeline" :aria-invalid="Boolean(errors.timeline)" aria-describedby="application-timeline-error" @blur="validateField('timeline')" @change="validateField('timeline')">
              <option value="" disabled>預計多久後創業</option>
              <option v-for="option in timelineOptions" :key="option" :value="option">{{ option }}</option>
            </select>
            <Plus aria-hidden="true" />
          </span>
          <small v-if="errors.timeline" id="application-timeline-error">{{ errors.timeline }}</small>
        </label>
      </fieldset>

      <fieldset class="application-form__intent">
        <legend>加盟規劃</legend>
        <template v-for="group in planningGroups" :key="group.key">
          <label v-if="group.key === 'sources'" class="application-field">
            <span>想要創業的原因（開放題）</span>
            <textarea v-model="form.motivation" name="motivation" rows="4" maxlength="4000" :aria-invalid="Boolean(errors.motivation)" aria-describedby="application-motivation-error" @blur="validateField('motivation')" />
            <small v-if="errors.motivation" id="application-motivation-error">{{ errors.motivation }}</small>
          </label>
          <fieldset class="application-choice">
            <legend>{{ group.label }}{{ group.optional ? '' : ' *' }} <span v-if="group.multiple">（可複選）</span></legend>
            <div class="application-choice__options">
              <label v-for="option in group.options" :key="option">
                <input v-model="form[group.key as FormKey]" :type="group.multiple ? 'checkbox' : 'radio'" :name="group.key" :value="option" :aria-invalid="Boolean(errors[group.key])" :aria-describedby="`application-${group.key}-error`" @change="validateField(group.key)" />
                <span>{{ option }}</span>
              </label>
            </div>
            <small v-if="errors[group.key]" :id="`application-${group.key}-error`">{{ errors[group.key] }}</small>
          </fieldset>
          <div v-if="group.key === 'storeType' && form.storeType === '自有店面'" class="application-form__store">
            <label class="application-field"><span>店面地址 *</span><input v-model="form.storeAddress" name="storeAddress" maxlength="500" :aria-invalid="Boolean(errors.storeAddress)" aria-describedby="application-storeAddress-error" @blur="validateField('storeAddress')" /><small v-if="errors.storeAddress" id="application-storeAddress-error">{{ errors.storeAddress }}</small></label>
            <label class="application-field"><span>店面寬（公尺） *</span><input v-model="form.storeWidth" name="storeWidth" inputmode="decimal" maxlength="20" :aria-invalid="Boolean(errors.storeWidth)" aria-describedby="application-storeWidth-error" @blur="validateField('storeWidth')" /><small v-if="errors.storeWidth" id="application-storeWidth-error">{{ errors.storeWidth }}</small></label>
            <label class="application-field"><span>實際坪數 *</span><input v-model="form.storeArea" name="storeArea" inputmode="decimal" maxlength="20" :aria-invalid="Boolean(errors.storeArea)" aria-describedby="application-storeArea-error" @blur="validateField('storeArea')" /><small v-if="errors.storeArea" id="application-storeArea-error">{{ errors.storeArea }}</small></label>
          </div>
        </template>
      </fieldset>

      <label class="application-form__consent">
        <input :disabled="submitState === 'submitting'" v-model="form.consent" name="consent" type="checkbox" :aria-invalid="Boolean(errors.consent)" aria-describedby="application-consent-error" @change="validateField('consent')" />
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
      </fieldset>

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

.application-form__notice > a { display: inline-flex; align-items: center; gap: 6px; margin-top: 8px; color: #9a6c27; font-size: 14px; text-decoration: underline; text-underline-offset: 3px; }
.application-form__notice > a svg { width: 15px; height: 15px; }

.application-form form { margin-top: 38px; }
.application-form__body { min-width: 0; margin: 0; padding: 0; border: 0; }
.application-form__identity { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 20px; }
.application-form label,
.application-field { display: block; min-width: 0; color: #1c1c1d; font-family: var(--font-cjk-sans); font-size: 15px; line-height: 22px; }
.application-form label > span:first-child,
.application-field > span:first-child { display: block; margin-bottom: 9px; }

.application-form input:not([type='radio'], [type='checkbox']),
.application-form select,
.application-form textarea {
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
.application-form textarea { height: auto; min-height: 130px; padding: 16px 21px; resize: vertical; }
.application-form input::placeholder { color: #9f9fa4; }
.application-form input:focus,
.application-form select:focus,
.application-form textarea:focus { border-color: #caa05c; box-shadow: 0 0 0 3px rgb(202 160 92 / 12%); }
.application-form input[aria-invalid='true'],
.application-form select[aria-invalid='true'],
.application-form textarea[aria-invalid='true'] { border-color: #a74335; }
.application-form small { display: block; margin-top: 6px; color: #a74335; font-size: 13px; line-height: 20px; }

.application-form__intent { display: grid; gap: 24px; margin: 42px 0 0; padding: 40px 0 0; border: 0; border-top: 1px solid #e3e3e8; }
.application-form__intent > legend { display: block; width: 100%; padding: 0 0 22px; color: #1c1c1d; font-family: var(--font-cjk-sans); font-size: 24px; font-weight: 600; line-height: 30px; }
.application-choice { min-width: 0; margin: 0; padding: 0; border: 0; }
.application-choice legend { margin-bottom: 9px; font-size: 15px; line-height: 22px; }
.application-choice legend span { color: #59585d; font-size: 13px; }
.application-choice__options { display: flex; flex-wrap: wrap; gap: 8px 20px; }
.application-choice__options label { display: inline-flex; align-items: center; gap: 8px; min-height: 44px; cursor: pointer; }
.application-choice__options input { width: 18px; height: 18px; margin: 0; accent-color: #caa05c; cursor: pointer; }
.application-choice__options input:focus-visible { outline: 2px solid #caa05c; outline-offset: 3px; }
.application-choice__options input[aria-invalid='true'] { outline: 1px solid #a74335; }
.application-choice__options span { margin: 0 !important; }
.application-form__store { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; padding: 20px; border-radius: 18px; background: #faf8f4; }
.application-form__store > label:first-child { grid-column: 1 / -1; }
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

.application-form__notice { margin-top: 28px; padding: 18px 20px; border: 1px solid #d0d0d5; border-radius: 18px; color: #59585d; background: #fafafa; }
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
  .application-form__intent > legend { font-size: 22px; line-height: 28px; }
  .application-form__store { grid-template-columns: 1fr; padding: 16px; }
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
