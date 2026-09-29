<script setup lang="ts">
import { ArrowRight } from 'lucide-vue-next'

const form = reactive({ name: '', email: '', website: '', comment: '', consent: false })
const errors = reactive({ name: '', email: '', website: '', comment: '', consent: '' })
const notice = ref('')

const route = useRoute()
const requestKey = ref('')
const sending = ref(false)
watch(form,()=>{if(!sending.value)requestKey.value=''}, {deep:true})
const { data: comments, refresh } = await useFetch<any[]>('/api/comments', { query: {route: route.path} })
const submit = async () => {
  errors.name = form.name.trim() ? '' : '請輸入姓名。'
  errors.email = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(form.email) ? '' : '請輸入有效的電子郵件。'
  errors.website = !form.website.trim() || /^https?:\/\/.+/i.test(form.website) ? '' : '網站網址需以 http:// 或 https:// 開頭。'
  errors.comment = form.comment.trim().length >= 10 ? '' : '留言至少需要 10 個字。'
  errors.consent = form.consent ? '' : '請先同意資料處理說明。'
  notice.value = ''
  if (Object.values(errors).some(Boolean)) return
  if (sending.value) return
  sending.value = true
  if (!requestKey.value) requestKey.value = crypto.randomUUID()
  try {
    await $fetch('/api/comments', {method:'POST',headers:{'Idempotency-Key':requestKey.value},body:{...form,route:route.path}})
    notice.value = '留言已收到，審核通過後將公開。'
    Object.assign(form,{name:'',email:'',website:'',comment:'',consent:false});requestKey.value=''
    await refresh()
  } catch (error:any) { notice.value = useCmsAdmin().message(error) }
  finally { sending.value=false }
}
</script>

<template>
  <section aria-labelledby="comment-form-title" class="comment-preview-form">
    <article v-for="item in comments" :key="item.id"><strong>{{ item.name }}</strong><p>{{ item.comment }}</p><time>{{ new Date(item.createdAt).toLocaleDateString('zh-TW') }}</time></article>
    <h3 id="comment-form-title">留下評論</h3>
    <p class="comment-preview-form__lead">你的電子郵件地址不會被公開。必填欄位已標示。</p>
    <form novalidate @submit.prevent="submit">
      <label>
        <span>姓名 *</span>
        <input :disabled="sending" v-model="form.name" type="text" autocomplete="name" :aria-invalid="Boolean(errors.name)" aria-describedby="comment-name-error" />
        <small id="comment-name-error" v-if="errors.name">{{ errors.name }}</small>
      </label>
      <label>
        <span>電子郵件 *</span>
        <input :disabled="sending" v-model="form.email" type="email" autocomplete="email" :aria-invalid="Boolean(errors.email)" aria-describedby="comment-email-error" />
        <small id="comment-email-error" v-if="errors.email">{{ errors.email }}</small>
      </label>
      <label>
        <span>網站</span>
        <input :disabled="sending" v-model="form.website" type="url" autocomplete="url" placeholder="https://" :aria-invalid="Boolean(errors.website)" aria-describedby="comment-website-error" />
        <small id="comment-website-error" v-if="errors.website">{{ errors.website }}</small>
      </label>
      <label class="comment-preview-form__message">
        <span>評論 *</span>
        <textarea :disabled="sending" v-model="form.comment" rows="7" :aria-invalid="Boolean(errors.comment)" aria-describedby="comment-message-error" />
        <small id="comment-message-error" v-if="errors.comment">{{ errors.comment }}</small>
      </label>
      <label class="comment-preview-form__consent">
        <input :disabled="sending" v-model="form.consent" type="checkbox" :aria-invalid="Boolean(errors.consent)" aria-describedby="comment-consent-error" />
        <span>我同意提供資料供留言審核使用；姓名與留言將在核准後公開，Email 不會公開。</span>
        <small id="comment-consent-error" v-if="errors.consent">{{ errors.consent }}</small>
      </label>
      <button :disabled="sending" type="submit" class="comment-preview-form__submit site-content-cta group/cta">
        <span>送出評論</span>
        <span class="site-cta-icon"><ArrowRight aria-hidden="true" /></span>
      </button>
      <p v-if="notice" class="comment-preview-form__notice" role="alert">{{ notice }}</p>
    </form>
  </section>
</template>

<style scoped>
.comment-preview-form { margin-top: 52px; }
.comment-preview-form h3 { color: #1c1c1d; font-family: var(--font-display); font-size: 40px; font-weight: 400; line-height: 48px; }
.comment-preview-form__lead { margin-top: 12px; color: #59585d; font-size: 15px; line-height: 24px; }
.comment-preview-form form { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 24px 20px; margin-top: 31px; }
.comment-preview-form label { display: block; min-width: 0; color: #1c1c1d; font-size: 14px; line-height: 22px; }
.comment-preview-form label > span:first-child { display: block; margin-bottom: 9px; }
.comment-preview-form input:not([type='checkbox']),
.comment-preview-form textarea { width: 100%; border: 1px solid rgba(159,159,164,.26); border-radius: 24px; color: #1c1c1d; background: #fff; outline: none; transition: border-color .3s ease; }
.comment-preview-form input:not([type='checkbox']) { height: 58px; padding: 0 21px; }
.comment-preview-form textarea { min-height: 180px; padding: 13px 21px 33px; resize: vertical; }
.comment-preview-form input:focus,
.comment-preview-form textarea:focus { border-color: #caa05c; }
.comment-preview-form small { display: block; margin-top: 6px; color: #9c322d; font-size: 13px; line-height: 20px; }
.comment-preview-form__message,
.comment-preview-form__consent,
.comment-preview-form__notice { grid-column: 1 / -1; }
.comment-preview-form__consent { display: grid !important; grid-template-columns: 18px 1fr; gap: 2px 10px; align-items: start; color: #59585d !important; }
.comment-preview-form__consent input { width: 18px; height: 18px; margin-top: 2px; accent-color: #caa05c; }
.comment-preview-form__consent span { margin: 0 !important; }
.comment-preview-form__consent small { grid-column: 2; }
.comment-preview-form__submit { display: inline-flex; width: max-content; height: 60px; align-items: center; gap: 8px; padding: 9px 9px 9px 30px; border: 1px solid rgba(159,159,164,.64); border-radius: 999px; color: #1c1c1d; background: transparent; font-size: 15px; line-height: 22px; transition: color .3s ease, border-color .3s ease, background-color .3s ease; }
.comment-preview-form__submit:hover { border-color: #caa05c; color: #fff; background: #caa05c; }
.comment-preview-form__submit .site-cta-icon { display: flex; width: 40px; height: 40px; align-items: center; justify-content: center; border-radius: 50%; color: #fff; background: #caa05c; transform: rotate(-45deg); transition: transform .5s ease; }
.comment-preview-form__submit:hover .site-cta-icon { transform: rotate(0); }
.comment-preview-form__submit :deep(svg) { width: 20px; height: 20px; }
.comment-preview-form__notice { padding: 14px 16px; border: 1px solid #caa05c; color: #59585d; background: #fff; font-size: 14px; line-height: 22px; }

@media (max-width: 767px) {
  .comment-preview-form { margin-top: 42px; }
  .comment-preview-form h3 { font-size: 30px; line-height: 35px; }
  .comment-preview-form form { grid-template-columns: 1fr; gap: 20px; }
  .comment-preview-form__message,
  .comment-preview-form__consent,
  .comment-preview-form__notice { grid-column: auto; }
}

@media (prefers-reduced-motion: reduce) {
  .comment-preview-form input,
  .comment-preview-form textarea,
  .comment-preview-form__submit,
  .comment-preview-form__submit .site-cta-icon { transition: none; }
}
</style>
