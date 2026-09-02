import { createHash } from 'node:crypto'
import { createError, getCookie, getRequestURL, sendRedirect } from 'h3'

export default defineEventHandler((event) => {
  const url = getRequestURL(event)
  const path = url.pathname
  const isPublicRequest = path === '/preview-access'
    || path === '/api/preview-access'
    || path.startsWith('/_')
    || path.startsWith('/@')
    || /\.[a-z0-9]+$/i.test(path)

  if (isPublicRequest) return

  const expectedToken = createHash('sha256').update(useRuntimeConfig(event).previewPassword).digest('hex')
  if (getCookie(event, 'sakura_preview_access') === expectedToken) return

  if (path.startsWith('/api/')) {
    throw createError({ statusCode: 401, statusMessage: '此網站需要先通過提案預覽密碼驗證。' })
  }

  return sendRedirect(event, `/preview-access?redirect=${encodeURIComponent(`${path}${url.search}`)}`, 302)
})
