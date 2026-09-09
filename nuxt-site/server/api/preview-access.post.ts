import { createHash, timingSafeEqual } from 'node:crypto'
import { createError, readBody, setCookie } from 'h3'
import { createPreviewAccessToken, PREVIEW_ACCESS_TTL_MS } from '../utils/previewAccess'

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

  const { expiresAt, token } = createPreviewAccessToken(configuredPassword)
  const cookieOptions = {
    httpOnly: true,
    sameSite: 'lax',
    secure: process.env.NODE_ENV === 'production',
    maxAge: PREVIEW_ACCESS_TTL_MS / 1000,
    path: '/',
  } as const

  setCookie(event, 'sakura_preview_access', token, cookieOptions)
  setCookie(event, 'sakura_preview_expires_at', String(expiresAt), { ...cookieOptions, httpOnly: false })

  return { ok: true }
})
