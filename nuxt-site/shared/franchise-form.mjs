// 官網與 API 共用選項及驗證，避免畫面可選但後台拒收。
export const franchiseChoiceGroups = [
 {key:'gender',label:'性別',options:['男','女'],section:'profile'},
 {key:'age',label:'年齡',options:['26~30','31~35','36~40','41~45','46~50','50~55','55歲以上'],section:'profile'},
 {key:'education',label:'學歷',options:['國中(含)以下','高中職','大專院校','研究所以上'],section:'profile'},
 {key:'occupation',label:'職業',options:['製造業','服務業','金融業','資訊業','科技業','營造業','軍公教','設計業','待業中','其他'],section:'profile'},
 {key:'contactTimes',label:'方便聯繫時間',options:['上午10:00~12:00','下午13:00~18:00'],multiple:true,section:'profile'},
 {key:'funding',label:'資金來源',options:['自有資金','借貸資金','部分自有，部分借貸／合夥'],section:'planning'},
 {key:'storeType',label:'店面資訊',options:['自有店面','承租店面'],section:'planning'},
 {key:'team',label:'經營團隊',options:['本人','夫妻／子女','兄弟姊妹','其他親戚','朋友','合夥人','應徵員工','其他'],multiple:true,section:'planning'},
 {key:'reasons',label:'為什麼選擇櫻花整體廚房',options:['品牌形象','經營理念','產品品質','教育訓練','宣傳資源','其他'],multiple:true,section:'planning'},
 {key:'concerns',label:'您最在意的細節',options:['相關費用','教育訓練','總部資源','產品品質','後勤協助','其他'],multiple:true,section:'planning'},
 {key:'sources',label:'如何得知加盟訊息',options:['廣告推播','官網','朋友介紹','加盟展','yes123加盟網','其他'],multiple:true,optional:true,section:'planning'},
]
export const franchiseTextFields = [
 {key:'residence',label:'居住地',max:500}, {key:'lineId',label:'LINE ID',max:100},
 {key:'storeAddress',label:'店面地址',max:500}, {key:'storeWidth',label:'店面寬（公尺）',max:20},
 {key:'storeArea',label:'實際坪數',max:20}, {key:'motivation',label:'想要創業的原因',max:4000},
]
export function franchiseInitialValues() {
 return {name:'',email:'',phone:'',experience:'',budget:'',area:'',timeline:'',consent:false,
  gender:'',age:'',residence:'',education:'',occupation:'',lineId:'',contactTimes:[],
  funding:'',storeType:'',storeAddress:'',storeWidth:'',storeArea:'',team:[],reasons:[],concerns:[],motivation:'',sources:[]}
}
export function franchiseErrors(b) {
 /** @type {Record<string,string>} */
 const errors={}
 const text=(key,label,min,max)=>{const v=b[key]===undefined&&min===0?'':b[key];if(typeof v!=='string'||v.trim().length<min||v.length>max)errors[key]=`${label}須為 ${min}–${max} 個字元。`}
 text('name','姓名',2,100);text('email','電子郵件',1,254);text('phone','聯絡電話',1,500);text('area','希望開店地區',2,500)
 if(!errors.email&&!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(b.email.trim()))errors.email='請輸入有效的電子郵件。'
 if(!errors.phone&&!/^\d{9,10}$/.test(b.phone.replace(/\D/g,'')))errors.phone='請輸入 9 至 10 碼的有效聯絡電話。'
 for(const [key,label,options] of [
  ['experience','創業或加盟經驗',['是','否']],
  ['budget','預計投入的創業資本',['200萬以下','200萬 - 300萬','300萬 - 400萬','400萬以上']],
  ['timeline','預計創業時間',['暫無計畫','三個月內','半年內','一年內','其他']],
 ])if(!options.includes(b[key]))errors[key]=`請選擇有效的${label}。`
 for(const g of franchiseChoiceGroups){
  const v=b[g.key]===undefined&&g.optional?[]:b[g.key]
  if(g.multiple){
   if(!Array.isArray(v)||(!g.optional&&!v.length)||v.length>g.options.length||new Set(v).size!==v.length||v.some(x=>!g.options.includes(x)))errors[g.key]=`請${g.optional?'':'至少'}勾選「${g.label}」的${g.optional?'有效':'一個有效'}選項。`
  }else if(!g.options.includes(v))errors[g.key]=`請選擇有效的${g.label}。`
 }
 for(const f of franchiseTextFields)text(f.key,f.label,0,f.max)
 if(b.storeType==='自有店面'){
  text('storeAddress','自有店面地址',2,500)
  for(const key of ['storeWidth','storeArea'])if(typeof b[key]!=='string'||!/^\d+(\.\d{1,2})?$/.test(b[key])||Number(b[key])<=0||Number(b[key])>100000)errors[key]=`請輸入有效的${key==='storeWidth'?'店面寬':'實際坪數'}（大於 0，最多兩位小數）。`
 }
 if(b.consent!==true)errors.consent='請先同意個人資料運用告知聲明。'
 return errors
}
