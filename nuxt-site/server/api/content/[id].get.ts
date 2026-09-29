import { readContent,contentAliases } from '../../cms/content.mjs'
import { cmsHandler,cmsUser } from '../../utils/cms'
export default defineEventHandler(event=>cmsHandler(event,async()=>{
 const id=getRouterParam(event,'id')||'',preview=getQuery(event).preview
 if(preview)await cmsUser(event)
 return readContent(id,Boolean(preview)&&(preview===id||(contentAliases as Record<string,string>)[id]===preview))
}))
