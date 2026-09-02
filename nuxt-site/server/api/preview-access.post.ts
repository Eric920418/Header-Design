import { createHash, timingSafeEqual } from 'node:crypto'
import { createError, readBody, setCookie } from 'h3'

export default defineEventHandler(async (event) => {
  const body = await readBody<{ password?: unknown }>(event)
  if (typeof body.password !== 'string') {
    throw createError({ statusCode: 400, statusMessage: '請輸入預覽密碼。' })
  }

  const configuredPassword = useRuntimeConfig(event).previewPassword
  const submittedHash = createHash('sha256').update(body.password).digest()
  const configuredHash = createHash('sha256').update(configuredPassword).digest()

  if (!timingSafeEqual(submittedHash, configuredHash)) {
    throw createError({ statusCode: 401, statusMessage: '密碼錯誤，請確認大小寫與空格後再試一次。' })
  }

  setCookie(event, 'sakura_preview_access', configuredHash.toString('hex'), {
    httpOnly: true,
    sameSite: 'lax',
    secure: process.env.NODE_ENV === 'production',
    maxAge: 60 * 60 * 12,
    path: '/',
  })

  return { ok: true }
})
