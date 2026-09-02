import { createError, deleteCookie, getCookie, getRequestURL, sendRedirect } from 'h3'
import { isPreviewAccessTokenValid } from '../utils/previewAccess'

export default defineEventHandler((event) => {
  const url = getRequestURL(event)
  const path = url.pathname
  const isPublicRequest = path === '/preview-access'
    || path === '/api/preview-access'
    || path.startsWith('/_')
    || path.startsWith('/@')
    || /\.[a-z0-9]+$/i.test(path)

  if (isPublicRequest) return

  const configuredPassword = useRuntimeConfig(event).previewPassword
  if (isPreviewAccessTokenValid(getCookie(event, 'sakura_preview_access'), configuredPassword)) return

  deleteCookie(event, 'sakura_preview_access', { path: '/' })
  deleteCookie(event, 'sakura_preview_expires_at', { path: '/' })

  if (path.startsWith('/api/')) {
    throw createError({ statusCode: 401, statusMessage: '此網站需要先通過提案預覽密碼驗證。' })
  }

  return sendRedirect(event, `/preview-access?redirect=${encodeURIComponent(`${path}${url.search}`)}`, 302)
})
