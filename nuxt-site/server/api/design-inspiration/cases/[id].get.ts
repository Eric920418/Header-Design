import {cmsCatalog,cmsCases} from '../../../utils/cmsCatalog'
import sql from 'mssql'
import type { DesignCaseDetail } from '~/types/designCloud'
import { caseSelect, withDesignDb } from '../../../utils/designCloud'

export default defineEventHandler(async event => {
  const id = (getRouterParam(event, 'id') ?? '').toLowerCase()
  if (!/^[a-f\d]{8}(-[a-f\d]{4}){3}-[a-f\d]{12}$/i.test(id)) throw createError({ statusCode: 400, message: '案例 ID 格式錯誤，必須是 UUID' })
  const custom=(await cmsCases(event)).find(i=>i.id===id)
  if(custom)return custom
  if((await cmsCatalog('cases',event)).items.some(i=>i.id===id&&!i.enabled))throw createError({statusCode:404,message:'案例已下架'})
  return withDesignDb(event, async pool => {
    const result = await pool.request().input('id', sql.VarChar(80), id).query(`
      ${caseSelect} WHERE c.id=@id AND c.isWebsite=1;
      SELECT url FROM sync.DesignCloudFiles f WHERE f.caseId=@id AND f.type='Image'
        AND EXISTS (SELECT 1 FROM sync.DesignCloudCases c WHERE c.id=f.caseId AND c.isWebsite=1)
        ORDER BY mainImage DESC, CASE WHEN sort IS NULL THEN 1 ELSE 0 END, sort, url;
      SELECT RTRIM(name) AS name, RTRIM(CONVERT(nvarchar(max), value)) AS value FROM sync.DesignCloudProperty p
        WHERE p.caseId=@id AND EXISTS (SELECT 1 FROM sync.DesignCloudCases c WHERE c.id=p.caseId AND c.isWebsite=1)
        AND name IN (N'設計風格',N'設計顏色',N'系列',N'型式',N'尺寸',N'坪數',N'預算',N'檯面') AND value IS NOT NULL
        ORDER BY CASE WHEN sort IS NULL THEN 1 ELSE 0 END, sort DESC, id;`)
    const sets = result.recordsets as sql.IRecordSet<any>[]
    const item = sets[0]?.[0]
    if (!item) throw createError({ statusCode: 404, message: '案例不存在或尚未公開' })
    return { ...item, images: (sets[1] ?? []).map(row => row.url), specs: (sets[2] ?? []).filter(row => row.value?.trim()) } as DesignCaseDetail
  })
})
