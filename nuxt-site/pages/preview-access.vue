<script setup lang="ts">
definePageMeta({ layout: false })

useSeoMeta({
  title: '提案預覽｜SAKURA 整體廚房',
  robots: 'noindex, nofollow',
})

const route = useRoute()
const password = ref('')
const pending = ref(false)
const errorMessage = ref('')

async function unlockPreview() {
  errorMessage.value = ''
  pending.value = true

  try {
    await $fetch('/api/preview-access', {
      method: 'POST',
      body: { password: password.value },
    })

    const requestedPath = typeof route.query.redirect === 'string' ? route.query.redirect : '/'
    window.location.assign(requestedPath.startsWith('/') && !requestedPath.startsWith('//') ? requestedPath : '/')
  }
  catch (error: any) {
    errorMessage.value = error?.data?.statusMessage || error?.statusMessage || error?.message || '驗證失敗，請稍後再試。'
  }
  finally {
    pending.value = false
  }
}
</script>

<template>
  <main class="preview-access">
    <div class="preview-access__shade" aria-hidden="true" />
    <section class="preview-access__card" aria-labelledby="preview-access-title">
      <img src="/home-2026/logos/sakura-kitchen-horizontal.svg" alt="SAKURA KITCHEN" width="266" height="21" />
      <span>PRIVATE PROPOSAL</span>
      <h1 id="preview-access-title">Enter The<br /><b>Kitchen Preview</b></h1>
      <p>此網站為提案預覽版本，請輸入密碼以查看完整內容。</p>

      <form @submit.prevent="unlockPreview">
        <label for="preview-password">預覽密碼</label>
        <div class="preview-access__field">
          <input
            id="preview-password"
            v-model="password"
            type="password"
            autocomplete="current-password"
            required
            :aria-invalid="Boolean(errorMessage)"
            :aria-describedby="errorMessage ? 'preview-access-error' : undefined"
            placeholder="請輸入密碼"
          />
          <button type="submit" :disabled="pending">{{ pending ? '驗證中…' : '進入網站' }}</button>
        </div>
        <p v-if="errorMessage" id="preview-access-error" class="preview-access__error" role="alert">{{ errorMessage }}</p>
      </form>
    </section>
  </main>
</template>

<style scoped>
.preview-access { position: relative; display: grid; min-height: 100dvh; place-items: center; overflow: hidden; padding: 30px; color: #fff; background: #1c1c1d url('/section-6/builders/builder-hero.jpg') center / cover no-repeat; }
.preview-access__shade { position: absolute; inset: 0; background: linear-gradient(90deg, rgb(16 8 1 / 88%), rgb(16 8 1 / 48%)); }
.preview-access__card { position: relative; z-index: 1; width: min(620px, 100%); padding: 58px; border: 1px solid rgb(255 255 255 / 18%); border-radius: 28px; background: rgb(20 19 18 / 72%); box-shadow: 0 28px 90px rgb(0 0 0 / 34%); backdrop-filter: blur(18px); }
.preview-access__card > img { display: block; width: min(266px, 72%); height: auto; margin-bottom: 58px; filter: brightness(0) invert(1); }
.preview-access__card > span { display: block; margin-bottom: 16px; color: #caa05c; font-family: var(--font-ui); font-size: 12px; font-weight: 600; letter-spacing: .16em; }
.preview-access h1 { margin: 0; font-family: var(--font-display); font-size: clamp(42px, 5vw, 64px); font-weight: 400; line-height: .98; letter-spacing: -.03em; }
.preview-access h1 b { color: #caa05c; font-weight: inherit; }
.preview-access__card > p { max-width: 420px; margin: 24px 0 38px; color: rgb(255 255 255 / 72%); font-family: var(--font-cjk-sans); font-size: 15px; line-height: 25px; }
.preview-access form > label { display: block; margin-bottom: 10px; font-family: var(--font-cjk-sans); font-size: 14px; }
.preview-access__field { display: flex; gap: 10px; padding: 8px; border: 1px solid rgb(255 255 255 / 20%); border-radius: 999px; background: rgb(255 255 255 / 8%); }
.preview-access input { min-width: 0; flex: 1; border: 0; padding: 0 18px; color: #fff; background: transparent; font-family: var(--font-ui); font-size: 16px; outline: 0; }
.preview-access input::placeholder { color: rgb(255 255 255 / 45%); }
.preview-access__field:focus-within { border-color: #caa05c; box-shadow: 0 0 0 3px rgb(202 160 92 / 16%); }
.preview-access button { min-height: 52px; flex: none; border: 0; border-radius: 999px; padding: 0 28px; color: #1c1c1d; background: #caa05c; font-family: var(--font-cjk-sans); font-size: 15px; font-weight: 600; cursor: pointer; transition: color .25s ease, background-color .25s ease; }
.preview-access button:hover { color: #caa05c; background: #fff; }
.preview-access button:focus-visible { outline: 2px solid #fff; outline-offset: 3px; }
.preview-access button:disabled { cursor: wait; opacity: .65; }
.preview-access__error { margin: 12px 12px 0; color: #ffb4ab; font-family: var(--font-cjk-sans); font-size: 14px; line-height: 22px; }

@media (max-width: 600px) {
  .preview-access { padding: 15px; }
  .preview-access__card { padding: 36px 24px; border-radius: 22px; }
  .preview-access__card > img { margin-bottom: 42px; }
  .preview-access h1 { font-size: 42px; }
  .preview-access__field { display: grid; border-radius: 24px; }
  .preview-access input { min-height: 48px; }
  .preview-access button { width: 100%; }
}

@media (prefers-reduced-motion: reduce) {
  .preview-access button { transition: none; }
}
</style>
