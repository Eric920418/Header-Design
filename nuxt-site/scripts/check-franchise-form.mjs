import assert from 'node:assert/strict'
import {readFileSync} from 'node:fs'
import {randomUUID} from 'node:crypto'
import {franchiseInitialValues,franchiseChoiceGroups,franchiseErrors} from '../shared/franchise-form.mjs'

const valid={...franchiseInitialValues(),name:'測試姓名',email:'test@example.test',phone:'0912345678',experience:'否',budget:'200萬以下',area:'台北市',residence:'台北市',timeline:'半年內',consent:true,storeAddress:'台北市測試路 1 號',storeWidth:'4.5',storeArea:'30'}
for(const group of franchiseChoiceGroups)valid[group.key]=group.multiple?(group.optional?[]:[group.options[0]]):group.options[0]
assert.deepEqual(franchiseErrors(valid),{})
const age=franchiseChoiceGroups.find(g=>g.key==='age')
assert.deepEqual(age.options,['26~30','31~35','36~40','41~45','46~50','51~55','56歲以上'])
for(const value of age.options)assert.deepEqual(franchiseErrors({...valid,age:value}),{})
for(const value of ['50~55','55歲以上','','56歲','非法選項',undefined])assert(franchiseErrors({...valid,age:value}).age)
for(const value of ['', '  ', '\t\n',undefined,null,123,'地'.repeat(501)])assert(franchiseErrors({...valid,residence:value}).residence)
for(const value of ['台',' 台北市 ','地'.repeat(500)])assert.deepEqual(franchiseErrors({...valid,residence:value}),{})
assert.deepEqual(franchiseErrors({...valid,lineId:undefined,motivation:undefined,sources:undefined}),{})
assert.deepEqual(franchiseErrors({...valid,storeType:'承租店面',storeAddress:'',storeWidth:'',storeArea:''}),{})
assert(franchiseErrors({...valid,consent:false}).consent)

// 執行實際服務端驗證，注入禁止交易的邊界，不連資料庫或建立測試申請。
const server=readFileSync(new URL('../server/cms/forms.mjs',import.meta.url),'utf8').replace(/^import .*$/gm,'').replace('export async function submit','async function submit')
const fail=(statusCode,message)=>{throw Object.assign(new Error(message),{statusCode})}
const submit=new Function('franchiseErrors','fail','transaction',server+'\nreturn submit')(franchiseErrors,fail,()=>{throw Error('此測試禁止資料庫交易')})
for(const residence of ['', ' ',undefined])await assert.rejects(submit('franchise',{...valid,residence},randomUUID()),e=>e.statusCode===400&&e.message.includes('居住地'))
for(const value of ['50~55','55歲以上'])await assert.rejects(submit('franchise',{...valid,age:value},randomUUID()),e=>e.statusCode===400&&e.message.includes('年齡'))
console.log('PASS 七組不重疊年齡選項、居住地必填／空白／長度邊界、選填／店面條件／同意欄保留及 API 寫入前拒收')
