import {readContent} from '../../cms/content.mjs'
export default defineEventHandler(async (event) => {
  const catalogues=[...(await readContent('data-catalogues')).KITCHEN_CATALOGUES,...(await readContent('data-productCatalogues')).PRODUCT_CATALOGUES.map((item:any)=>({...item,downloadFilename:`${item.id}.pdf`}))]
  const id = getRouterParam(event, 'id') || ''
  const catalogue = catalogues.find((item:any) => item.id === id)

  if (!catalogue) {
    throw createError({
      statusCode: 404,
      statusMessage: '找不到指定的型錄',
      data: { id, availableIds: catalogues.map((item:any) => item.id) },
    })
  }

  if(/^\/media\/[a-f0-9-]{36}$/i.test(catalogue.pdfUrl))return sendRedirect(event,catalogue.pdfUrl,302)
  const source=new URL(catalogue.pdfUrl)
  if(source.protocol!=='https:'||source.hostname!=='www.sakura-kitchenlife.com.tw'||source.username||source.password)throw createError({statusCode:400,message:'型錄僅支援媒體庫 PDF 或櫻花官方型錄來源'})
  let upstream: Response
  try {
    upstream = await fetch(catalogue.pdfUrl, {
      redirect: 'error',
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

  if (signature !== '%PDF-') {
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
    'Content-Disposition': `attachment; filename="${String(catalogue.downloadFilename).replace(/[^a-zA-Z0-9_.-]/g,'_')}"`,
    'Content-Length': String(bytes.byteLength),
    'Cache-Control': 'no-store',
    'X-Content-Type-Options': 'nosniff',
  })

  return bytes
})
