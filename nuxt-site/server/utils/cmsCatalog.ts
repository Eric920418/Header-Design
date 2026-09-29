import type {H3Event} from 'h3'
import {getQuery,setResponseHeader} from 'h3'
import {cmsUser} from './cms'
import {readContent} from '../cms/content.mjs'
async function read(id:string,event?:H3Event){const preview=event?getQuery(event).cmsPreview:undefined;if(preview&&event){await cmsUser(event);setResponseHeader(event,'Cache-Control','private, no-store');setResponseHeader(event,'X-Robots-Tag','noindex, nofollow')}return readContent(id,preview===id)}
export async function cmsCatalog(key:string,event?:H3Event){return await read('catalog-'+key,event) as {items:{id:string;enabled:boolean;featured:boolean;sort:number}[]}}
export async function cmsCases(event?:H3Event){return (await read('custom-cases',event)).items as any[]}
export function applyCatalog<T extends {id:string|number}>(items:T[],policy:{items:{id:string;enabled:boolean;featured:boolean;sort:number}[]}){
 const settings=new Map(policy.items.map(p=>[String(p.id).toLowerCase(),p]))
 return items.filter(i=>settings.get(String(i.id).toLowerCase())?.enabled!==false).sort((a,b)=>{const x=settings.get(String(a.id).toLowerCase()),y=settings.get(String(b.id).toLowerCase());return Number(y?.featured||false)-Number(x?.featured||false)||(x?.sort??1e9)-(y?.sort??1e9)})
}
