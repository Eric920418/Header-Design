export const storeCaseRecommendationDestination=item=>item?.contact?.lineUrl||item?.reservationUrl||''
export function storeCaseLinkPosition(block,selected,relative,cases=[]){
 const modes={reservationUrl:['推薦案例卡片預約備用連結','recommendation','related-cases-title'],'contact.lineUrl':['LINE 諮詢按鈕','line','case-line-link'],'contact.mapUrl':['Google Map 按鈕','map','case-map-link'],'contact.phone':['門市電話連結','phone','case-phone-link'],'contact.reservationUrl':['舊版預約連結（未使用）','unused','case-store-title']}
 const match=modes[relative];if(!match)return
 const [name,linkMode,anchor]=match,item=selected.value,example=linkMode==='recommendation'?cases.find(row=>row.slug!==item.slug)||item:item
 const absent=linkMode==='line'&&!item.contact?.lineUrl||linkMode==='map'&&!item.contact?.mapUrl||linkMode==='phone'&&!item.contact?.phone
 return {...block,name,kind:'store-case-links',linkMode,previewPage:'/gallery/'+encodeURIComponent(example.slug)+'#'+(absent?'case-store-title':anchor)}
}
