import {readFile,copyFile,mkdir,stat} from 'node:fs/promises'
import {join,extname} from 'node:path'
import {homedir} from 'node:os'
import {query,transaction,randomUUID,digest,database} from '../server/cms/database.mjs'
const root=new URL('../../public/',import.meta.url).pathname,dir=process.env.CMS_MEDIA_DIR||join(homedir(),'.sakura-cms','media')
const seed=JSON.parse(await readFile(new URL('../shared/cms/seed.json',import.meta.url),'utf8'));const urls=new Set()
function scan(value){if(typeof value==='string'&&/^\/(?!\/)[^?#]+\.(jpg|jpeg|png|webp|svg|pdf)$/i.test(value))urls.add(value);else if(Array.isArray(value))value.forEach(scan);else if(value&&typeof value==='object')Object.values(value).forEach(scan)}
seed.forEach(d=>scan(d.data));await mkdir(dir,{recursive:true});let imported=0,missing=[]
for(const url of urls){const path=join(root,url);try{await stat(path)}catch{missing.push(url);continue}
 if((await query('SELECT id FROM cms.Media WHERE originUrl=@url',{url})).recordset.length)continue
 const bytes=await readFile(path),id=randomUUID(),ext=extname(url).toLowerCase(),filename=id+ext
 await copyFile(path,join(dir,filename),1)
 const mime={'.jpg':'image/jpeg','.jpeg':'image/jpeg','.png':'image/png','.webp':'image/webp','.svg':'image/svg+xml','.pdf':'application/pdf'}[ext]
 await query('INSERT cms.Media(id,name,alt,category,mime,size,filename,hash,originUrl) VALUES(@id,@name,@alt,@category,@mime,@size,@filename,@hash,@url)',{id,name:decodeURIComponent(url.split('/').at(-1)),alt:'',category:'官網既有素材',mime,size:bytes.length,filename,hash:digest(bytes),url});imported++
}
await transaction(async tx=>{const media=(await query('SELECT id,originUrl FROM cms.Media WHERE originUrl IS NOT NULL',{},tx)).recordset;const versions=(await query('SELECT id,body FROM cms.Versions',{},tx)).recordset;for(const m of media)for(const v of versions)if(v.body.includes(JSON.stringify(m.originUrl)))await query('IF NOT EXISTS(SELECT 1 FROM cms.MediaRefs WHERE mediaId=@mid AND versionId=@vid) INSERT cms.MediaRefs(mediaId,versionId) VALUES(@mid,@vid)',{mid:m.id,vid:v.id},tx)})
console.log(JSON.stringify({imported,missing}));await(await database()).close()
