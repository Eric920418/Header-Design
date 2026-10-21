export function useCmsUpload(){
 const {api,message}=useCmsAdmin(),uploading=ref(false),progress=ref(0),uploadError=ref('')
 async function upload(file:File){uploading.value=true;progress.value=0;uploadError.value=''
 try{const limit=file.type==='application/pdf'?30:10;if(!['image/jpeg','image/png','image/webp','application/pdf'].includes(file.type))throw Error('請選擇 JPG、PNG、WebP 圖片或 PDF 檔案。');if(file.size>limit*1024*1024)throw Error(`這份檔案太大，最大可上傳 ${limit}MB。`)
 const {id}=await api('media-upload',{method:'POST',body:{name:file.name,mime:file.type,size:file.size}})
 for(let offset=0;offset<file.size;offset+=2*1024*1024){await api(`media-upload?id=${id}&offset=${offset}`,{method:'PUT',headers:{'Content-Type':'application/octet-stream'},body:file.slice(offset,offset+2*1024*1024)});progress.value=Math.round(Math.min(file.size,offset+2*1024*1024)/file.size*100)}
 const result=await api(`media-upload?id=${id}`,{method:'PATCH'});await refreshNuxtData('cms-media');return result
 }catch(e){uploadError.value=message(e);return null}finally{uploading.value=false}}
 return{upload,uploading,progress,uploadError}
}
