export function listPageState(total: number, value: unknown, pageSize = 9) {
  const totalPages = Math.ceil(Math.max(0, total) / pageSize)
  const requested = typeof value === 'string' && /^[1-9]\d*$/.test(value) ? Number(value) : 1
  const page = Number.isSafeInteger(requested) ? Math.min(requested, Math.max(1, totalPages)) : 1
  return { page, totalPages, start: (page - 1) * pageSize, end: page * pageSize }
}

export function visibleListPages(page: number, totalPages: number): Array<number | 'ellipsis'> {
  if (totalPages <= 7) return Array.from({ length: totalPages }, (_, index) => index + 1)
  const visible = new Set([1, totalPages, page - 1, page, page + 1].filter(value => value >= 1 && value <= totalPages))
  const pages: Array<number | 'ellipsis'> = []
  let previous = 0
  for (const value of [...visible].sort((a, b) => a - b)) {
    if (value > previous + 1) pages.push('ellipsis')
    pages.push(value)
    previous = value
  }
  return pages
}
