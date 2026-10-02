import {cmsCases,cmsStoreCases} from '../../utils/cmsCatalog'
import type { DesignFilters } from '~/types/designCloud'
import { filterSql, withDesignDb } from '../../utils/designCloud'

export default defineEventHandler(event => withDesignDb(event, async pool => {
  const { recordset } = await pool.request().query(filterSql)
  const custom=[...await cmsStoreCases(event),...await cmsCases(event)]
  return {
    forms: [...new Set<string>(recordset.filter(row => row.category === '型式').map(row => row.name).concat(custom.map(i=>i.form).filter(Boolean)))],
    styles: [...new Set<string>(recordset.filter(row => row.category === '設計風格').map(row => row.name).concat(custom.map(i=>i.style).filter(Boolean)))],
  } satisfies DesignFilters
}))
