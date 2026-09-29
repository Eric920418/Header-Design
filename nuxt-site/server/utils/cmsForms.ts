import {cmsHandler,sameOrigin} from './cms'
import {throttle,fail} from '../cms/database.mjs'
import {submit} from '../cms/forms.mjs'
import type {H3Event} from 'h3'
export function receiveCmsForm(event:H3Event,kind:string){return cmsHandler(event,async()=>{
 sameOrigin(event);if(Number(getHeader(event,'content-length'))>20000)fail(413,'表單內容過長');await throttle('form:'+getRequestIP(event),20,600)
 return submit(kind,await readBody(event),getHeader(event,'idempotency-key'))
})}
