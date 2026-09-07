export type BreadcrumbLink = { label: string, to?: string }
export type BreadcrumbSource = { label: string, to: string, position: number }
export type BreadcrumbEntry = { current: string, source: BreadcrumbSource | null }

// History state survives reload and belongs to this tab; never accept external/auth URLs.
export function readBreadcrumbSource(value: unknown): BreadcrumbSource | null {
  if (!value || typeof value !== 'object') return null
  const source = value as Partial<BreadcrumbSource>
  if (typeof source.to !== 'string' || !source.to.startsWith('/') || /^\/[\/\\]/.test(source.to)
    || /[\\\u0000-\u0020]/.test(source.to) || source.to.length > 8192
    || typeof source.label !== 'string' || !source.label.trim() || source.label.length > 2000
    || !Number.isSafeInteger(source.position) || source.position! < 0) return null
  const path = new URL(source.to, 'https://internal.invalid').pathname.replace(/\/+$/, '')
  if (path === '/preview-access' || path === '/sitemap' || path === '/api' || path.startsWith('/api/') || path.startsWith('/_')) return null
  return { to: source.to, label: source.label.trim(), position: source.position! }
}

export const useBreadcrumbSource = () => useState<BreadcrumbEntry | null>('breadcrumb-source', () => null)
