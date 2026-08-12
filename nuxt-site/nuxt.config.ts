import tailwindcss from '@tailwindcss/vite'

export default defineNuxtConfig({
  compatibilityDate: '2026-08-11',
  devtools: { enabled: true },
  ssr: true,
  dir: {
    public: '../public',
  },
  css: ['~/assets/css/main.css'],
  devServer: {
    port: 3000,
  },
  app: {
    head: {
      htmlAttrs: { lang: 'zh-Hant' },
      meta: [
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        { name: 'theme-color', content: '#CAA05C' },
      ],
      link: [
        { rel: 'preconnect', href: 'https://fonts.googleapis.com' },
        { rel: 'preconnect', href: 'https://fonts.gstatic.com', crossorigin: '' },
        {
          rel: 'stylesheet',
          href: 'https://fonts.googleapis.com/css2?family=Cal+Sans&family=Golos+Text:wght@400..900&display=swap',
        },
      ],
    },
  },
  runtimeConfig: {
    public: {
      googleMapsApiKey: '',
    },
  },
  vite: {
    // Nuxt 3.21 的 config schema 仍引用 Vite 6 型別，但 builder 實際使用 Vite 7。
    // 僅在外掛邊界消除兩份同名型別的 package-identity 衝突。
    plugins: [tailwindcss()] as any,
  },
  typescript: {
    typeCheck: true,
    strict: true,
  },
  nitro: {
    // Nuxt 位於 workspace 子目錄；Vercel 的 Build Output API 必須落在 Repository 根目錄。
    // 否則 Nitro 會寫進 nuxt-site/.vercel/output，Vercel 只看到根目錄舊 Vite 的 dist 預設。
    output: process.env.VERCEL ? { dir: '../.vercel/output' } : undefined,
  },
})
