import { KITCHEN_CATALOGUES } from '~/data/catalogues'

export default defineEventHandler(async (event) => {
  const id = getRouterParam(event, 'id') || ''
  const catalogue = KITCHEN_CATALOGUES.find(item => item.id === id)

  if (!catalogue) {
    throw createError({
      statusCode: 404,
      statusMessage: '找不到指定的型錄',
      data: { id, availableIds: KITCHEN_CATALOGUES.map(item => item.id) },
    })
  }

  let upstream: Response
  try {
    upstream = await fetch(catalogue.pdfUrl, {
      headers: {
        Accept: 'application/pdf',
        Referer: 'https://www.sakura-kitchenlife.com.tw/',
        'User-Agent': 'Mozilla/5.0 (compatible; SAKURA-Kitchen-Catalogue-Downloader/1.0)',
      },
      signal: AbortSignal.timeout(30_000),
    })
  }
  catch (error) {
    throw createError({
      statusCode: 502,
      statusMessage: '型錄來源連線失敗',
      data: {
        id,
        source: catalogue.pdfUrl,
        reason: error instanceof Error ? error.message : String(error),
      },
    })
  }

  if (!upstream.ok) {
    throw createError({
      statusCode: 502,
      statusMessage: '型錄來源回應錯誤',
      data: {
        id,
        source: catalogue.pdfUrl,
        upstreamStatus: upstream.status,
        upstreamStatusText: upstream.statusText,
      },
    })
  }

  const bytes = new Uint8Array(await upstream.arrayBuffer())
  const signature = new TextDecoder().decode(bytes.slice(0, 5))
  const upstreamContentType = upstream.headers.get('content-type') || ''

  if (signature !== '%PDF-' && !upstreamContentType.includes('application/pdf')) {
    throw createError({
      statusCode: 502,
      statusMessage: '型錄來源未回傳 PDF',
      data: {
        id,
        source: catalogue.pdfUrl,
        upstreamContentType: upstreamContentType || '未提供 Content-Type',
        receivedBytes: bytes.byteLength,
      },
    })
  }

  setResponseHeaders(event, {
    'Content-Type': 'application/pdf',
    'Content-Disposition': `attachment; filename="${catalogue.downloadFilename}"`,
    'Content-Length': String(bytes.byteLength),
    'Cache-Control': 'public, max-age=3600',
    'X-Content-Type-Options': 'nosniff',
  })

  return bytes
})
