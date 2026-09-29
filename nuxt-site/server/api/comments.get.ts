import {query,fail} from '../cms/database.mjs'
import {cmsHandler} from '../utils/cms'
export default defineEventHandler(event=>cmsHandler(event,async()=>{
 const route=getQuery(event).route;if(typeof route!=='string'||route.length>500)fail(400,'頁面格式不正確')
 return(await query("SELECT id,name,comment,createdAt FROM cms.Comments WHERE route=@route AND status=N'已核准' ORDER BY createdAt",{route})).recordset
}))
