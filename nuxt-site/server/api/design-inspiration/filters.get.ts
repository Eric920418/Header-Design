import type { DesignFilters } from '~/types/designCloud'
import { filterSql, withDesignDb } from '../../utils/designCloud'

export default defineEventHandler(event => withDesignDb(event, async pool => {
  const { recordset } = await pool.request().query(filterSql)
  return {
    forms: [...new Set<string>(recordset.filter(row => row.category === '型式').map(row => row.name))],
    styles: [...new Set<string>(recordset.filter(row => row.category === '設計風格').map(row => row.name))],
  } satisfies DesignFilters
}))
