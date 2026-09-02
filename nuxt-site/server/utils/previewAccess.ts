import { createHmac, timingSafeEqual } from 'node:crypto'
import { pathToFileURL } from 'node:url'

export const PREVIEW_ACCESS_TTL_MS = 60 * 60 * 1000

const signExpiry = (expiresAt: number, secret: string) => createHmac('sha256', secret)
  .update(`sakura-preview:${expiresAt}`)
  .digest('hex')

export const createPreviewAccessToken = (secret: string, now = Date.now()) => {
  const expiresAt = now + PREVIEW_ACCESS_TTL_MS
  return { expiresAt, token: `${expiresAt}.${signExpiry(expiresAt, secret)}` }
}

export const isPreviewAccessTokenValid = (token: string | undefined, secret: string, now = Date.now()) => {
  if (!token) return false

  const [expiresAtText, signature, extra] = token.split('.')
  if (extra || !expiresAtText || !signature || !/^\d+$/.test(expiresAtText) || !/^[a-f0-9]{64}$/.test(signature)) return false

  const expiresAt = Number(expiresAtText)
  if (!Number.isSafeInteger(expiresAt) || now >= expiresAt) return false

  return timingSafeEqual(Buffer.from(signature, 'hex'), Buffer.from(signExpiry(expiresAt, secret), 'hex'))
}

if (process.argv[1] && import.meta.url === pathToFileURL(process.argv[1]).href) {
  const secret = 'self-check-secret'
  const now = 1_800_000_000_000
  const { expiresAt, token } = createPreviewAccessToken(secret, now)
  const tamperedToken = `${expiresAt + PREVIEW_ACCESS_TTL_MS}.${token.split('.')[1]}`

  if (!isPreviewAccessTokenValid(token, secret, expiresAt - 1)) throw new Error('有效的預覽權杖遭拒。')
  if (isPreviewAccessTokenValid(token, secret, expiresAt)) throw new Error('過期的預覽權杖仍被接受。')
  if (isPreviewAccessTokenValid(tamperedToken, secret, now)) throw new Error('遭竄改的預覽權杖仍被接受。')

  console.log('Preview access expiry checks passed.')
}
