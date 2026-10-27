import { readContent,contentAliases } from '../../cms/content.mjs'
import { cmsHandler,cmsUser } from '../../utils/cms'
import {readDraftPreview} from '../../cms/previews.mjs'
export default defineEventHandler(event=>cmsHandler(event,async()=>{
 const id=getRouterParam(event,'id')||'',preview=getQuery(event).preview,draft=getQuery(event).cmsDraft
 if(draft){const user=await cmsUser(event);const body=await readDraftPreview(draft,user.id,id);if(body)return body}
 if(preview)await cmsUser(event)
 return readContent(id,Boolean(preview)&&(preview===id||(contentAliases as Record<string,string>)[id]===preview))
}))
