import {randomUUID} from './database.mjs'
import {contentAliases,publicContent} from '../../shared/cms/public-content.mjs'
const previews=new Map(),ttl=5*60*1000
// Ephemeral previews are private to the authenticated author, never database versions.
export function createDraftPreview(userId,documents){
 for(const [key,value]of previews)if(value.expires<Date.now())previews.delete(key)
 const owned=[...previews].filter(([,value])=>value.userId===userId)
 while(owned.length>=40)previews.delete(owned.shift()[0])
 if(previews.size>=400)previews.delete(previews.keys().next().value)
 const token=randomUUID();previews.set(token,{userId,expires:Date.now()+ttl,bodies:Object.fromEntries(documents.map(d=>[d.id,structuredClone(d.body)]))});return token
}
export function readDraftPreview(token,userId,id){
 const preview=typeof token==='string'?previews.get(token):null
 if(!preview||preview.userId!==userId||preview.expires<Date.now())throw Object.assign(new Error('預覽已過期或無法存取，請回後台重新看效果。'),{statusCode:404,data:{cmsPreviewExpired:true}})
 const body=preview.bodies[contentAliases[id]||id]
 return body?publicContent(id,body):undefined
}
