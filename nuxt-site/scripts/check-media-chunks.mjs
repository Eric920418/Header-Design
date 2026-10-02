import assert from 'node:assert/strict'
import sharp from 'sharp'
import { PDFDocument } from 'pdf-lib'
import { normalizeMedia,validateChunk } from '../server/cms/media.mjs'
const b=Buffer.from('abcd')
assert.equal(validateChunk(Buffer.alloc(0),b,0,8),true)
assert.equal(validateChunk(b,b,0,8),false)
for(const args of [[b,b,2,8],[b,b,5,10],[b,b,-1,8],[b,b,4,7],[b,Buffer.alloc(0),4,8]])assert.throws(()=>validateChunk(...args))
assert.throws(()=>validateChunk(Buffer.alloc(0),Buffer.alloc(2*1024*1024+1),0,3*1024*1024))
const png=await sharp({create:{width:5,height:5,channels:3,background:'white'}}).png().toBuffer()
assert.equal((await normalizeMedia(png,'image/png')).mime,'image/webp')
await assert.rejects(()=>normalizeMedia(png,'image/jpeg'))
await assert.rejects(()=>normalizeMedia(Buffer.from('fake'),'image/png'))
const pdf=await PDFDocument.create();pdf.addPage()
assert.equal((await normalizeMedia(Buffer.from(await pdf.save()),'application/pdf')).mime,'application/pdf')
await assert.rejects(()=>normalizeMedia(Buffer.from('%PDF-1.7 broken %%EOF'),'application/pdf'))
console.log('media validation / chunk bounds / duplicate / gaps: passed')
