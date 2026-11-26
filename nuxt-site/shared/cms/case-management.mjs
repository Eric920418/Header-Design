import {pageEditorLink,storeCasesPageId} from './page-editors.mjs'
export const caseSources=['門市案例','自建案例','系統同步']
export const caseManagementBlock='inspiration:案例管理'
export const caseSourceLabel=source=>source==='來源案例'?'系統同步':source

// Published external cases stay read-only; draft custom cases keep their original edit indexes.
export function caseManagementRows(library=[],customRows=[],publishedCustom){
 const external=library.filter(row=>row.source!=='自建案例').map(row=>({...row,key:row.source+':'+row.slug,source:caseSourceLabel(row.source),published:true}))
 const publishedRows=publishedCustom===undefined?library.filter(row=>row.source==='自建案例'):publishedCustom.filter(row=>row.enabled!==false).map(row=>({slug:row.id,title:row.title,image:row.cover||row.images?.[0]||'',route:'/design-inspiration/'+encodeURIComponent(row.id),source:'自建案例'}))
 const published=new Map(publishedRows.map(row=>[row.slug,row]))
 const removed=[...published.values()].filter(row=>!customRows.some(item=>item.value.id===row.slug)).map(row=>({...row,key:'自建案例:'+row.slug,published:true,draftRemoved:true}))
 const custom=customRows.map(row=>({key:'自建案例:'+row.value.id,slug:row.value.id,source:'自建案例',title:row.value.title,image:row.value.cover||row.value.images?.[0]||'',description:row.value.description,route:'/design-inspiration/'+encodeURIComponent(row.value.id),published:published.has(row.value.id),customRow:row}))
 return [...external.filter(row=>row.source==='門市案例'),...custom,...removed,...external.filter(row=>row.source!=='門市案例')]
}
export function filterCaseManagement(rows,source='',search=''){
 const term=search.trim().toLocaleLowerCase()
 return rows.filter(row=>(!source||row.source===source)&&(!term||[row.title,row.store].some(value=>String(value||'').toLocaleLowerCase().includes(term))))
}
export function storeCaseManagementLink(row,query={},state={}){
 if(row.source!=='門市案例')return undefined
 const link=pageEditorLink(storeCasesPageId,query,storeCasesPageId+':案例管理')
 return {...link,query:{...link.query,list:'data-storeCases:storeCases',item:row.slug,returnToCases:'1',caseSource:state.source||undefined,caseQuery:state.search||undefined,casePage:String(state.page||1)}}
}
export function caseManagementReturn(query={}){
 if(query.returnToCases!=='1')return undefined
 return {path:'/admin/content',query:{section:'design',sitePage:'inspiration',block:caseManagementBlock,
  ...(caseSources.includes(query.caseSource)?{caseSource:query.caseSource}:{}),
  ...(typeof query.caseQuery==='string'&&query.caseQuery?{caseQuery:query.caseQuery}:{}),
  ...(Number.isSafeInteger(Number(query.casePage))&&Number(query.casePage)>0?{casePage:String(query.casePage)}:{}),
 }}
}
