import sql from 'mssql'
import type { DesignCasePage } from '~/types/designCloud'
import { caseSelect, caseWhere, designQuery, filterSql, withDesignDb } from '../../../utils/designCloud'

export default defineEventHandler(event => {
  const { form, style, page } = designQuery(getQuery(event))
  return withDesignDb(event, async pool => {
    const options = (await pool.request().query(filterSql)).recordset
    for (const [category, value] of [['型式', form], ['設計風格', style]]) {
      if (value && !options.some(row => row.category === category && row.name === value)) throw createError({ statusCode: 400, message: `未知${category}：${value}` })
    }
    const result = await pool.request().input('form', sql.NVarChar(50), form).input('style', sql.NVarChar(50), style)
      .input('offset', sql.Int, (page - 1) * 9).query(`
        SELECT COUNT(*) AS total FROM sync.DesignCloudCases c ${caseWhere};
        ${caseSelect} ${caseWhere} ORDER BY c.name, c.id OFFSET @offset ROWS FETCH NEXT 9 ROWS ONLY;`)
    const sets = result.recordsets as sql.IRecordSet<any>[]
    const total = Number(sets[0]?.[0]?.total ?? 0)
    const totalPages = Math.ceil(total / 9)
    if (page > Math.max(1, totalPages)) throw createError({ statusCode: 400, message: `頁碼超出範圍，目前共 ${totalPages} 頁` })
    return { items: sets[1] ?? [], total, page, pageSize: 9, totalPages } satisfies DesignCasePage
  })
})
