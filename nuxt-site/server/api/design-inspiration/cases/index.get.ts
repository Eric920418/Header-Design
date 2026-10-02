import sql from 'mssql'
import { caseSelect, filterSql, withDesignDb, designQuery } from '../../../utils/designCloud'
import {cmsCatalog,cmsCases,cmsStoreCases,applyCatalog} from '../../../utils/cmsCatalog'
export default defineEventHandler(async event=>{
 const {form,style,page}=designQuery(getQuery(event))
 const source=await withDesignDb(event,async pool=>(await pool.query(`${caseSelect} WHERE c.isWebsite=1 ORDER BY c.name,c.id`)).recordset)
 const custom=[...await cmsStoreCases(event),...await cmsCases(event)]
 const tags=await withDesignDb(event,async pool=>(await pool.query(filterSql)).recordset)
 if(form&&!tags.some(t=>t.category==='型式'&&t.name===form)&&!custom.some(i=>i.form===form)||style&&!tags.some(t=>t.category==='設計風格'&&t.name===style)&&!custom.some(i=>i.style===style))throw createError({statusCode:400,message:'型式或風格選項無效'})
 const items=[...custom,...applyCatalog(source,await cmsCatalog('cases',event))].filter(i=>(!form||i.form===form)&&(!style||i.style===style))
 const total=items.length,totalPages=Math.ceil(total/9)
 if(page>Math.max(1,totalPages))throw createError({statusCode:400,message:`頁碼超出範圍，目前共 ${totalPages} 頁`})
 return{items:items.slice((page-1)*9,page*9),total,page,pageSize:9,totalPages}
})
