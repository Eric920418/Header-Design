export interface SakuraProductVariant {
  model: string
  price: number
}

export interface SakuraProductProperty {
  label: string
  value: string
}

export interface SakuraProductAttachment {
  id: string
  label: string
  url: string
}

export interface SakuraNearSuctionProduct {
  id: string
  title: string
  model: string
  price: string
  image: string
  gallery: string[]
  variants: SakuraProductVariant[]
  features: string[]
  properties: SakuraProductProperty[]
  attachments: SakuraProductAttachment[]
}

const detailAsset = (name: string) => `/section-2/products/sakura/range-hood/near-suction/details/${name}`

export const SAKURA_NEAR_SUCTION_PRODUCTS: SakuraNearSuctionProduct[] = [
  {
    id: 'r7600',
    title: '近吸除油煙機',
    model: 'R7600',
    price: '18,000',
    image: '/section-2/products/sakura/range-hood/near-suction/r7600.png',
    gallery: [detailAsset('r7600-1.png'), detailAsset('r7600-2.png'), detailAsset('r7600-3.png')],
    variants: [{ model: 'R7600XL', price: 18000 }],
    features: [
      '永久免費油網送到家',
      '更近距離接觸油煙，在第一時間補捉油煙、及時排除',
      '四面環吸進風口，上下左右全方位吸淨油煙',
      '全平斜面造型，不碰頭不擋視線',
      '鋼化玻璃材質搭配易拆卸油杯，輕鬆易清',
      '隱藏式油網，有效排煙濾油',
    ],
    properties: [
      { label: '機體尺寸（寬×深×高）', value: '895×427×973 mm' },
      { label: '顏色／材質', value: '黑／鋼化玻璃' },
      { label: 'CNS7778 風洞試驗法風量（m³/min）', value: '18' },
      { label: '出風口風量（m³/min）', value: '23' },
      { label: '重量（kg）', value: '25KG' },
      { label: '使用電壓', value: '110V／60Hz' },
      { label: '馬達耗電量', value: '263W' },
      { label: '照明', value: 'LED 1.5W ×2' },
      { label: '護罩尺寸（W×D×H）', value: '410×355 mm' },
      { label: '油網型式', value: '平油網' },
      { label: '馬達', value: 'AC 單馬達' },
      { label: '操作面板設計', value: '觸控式' },
    ],
    attachments: [
      { id: 'manual', label: '使用手冊', url: 'https://buy.sakura.com.tw/files/8868/R7600_R7602說明書.pdf' },
      { id: 'rohs', label: 'RoHS', url: 'https://buy.sakura.com.tw/files/8620/R7600_v1.pdf' },
      { id: 'catalogue', label: '商品型錄', url: 'https://buy.sakura.com.tw/files/9117/R7600XL-DM.pdf' },
    ],
  },
  {
    id: 'r7615',
    title: '近吸除油煙機',
    model: 'R7615',
    price: '15,700',
    image: '/section-2/products/sakura/range-hood/near-suction/r7615.png',
    gallery: [detailAsset('r7615-1.png'), detailAsset('r7615-2.png')],
    variants: [{ model: 'R7615', price: 15700 }],
    features: [
      '永久免費送油網，確保吸力永如新',
      '新型近吸排風結構，近吸直吸秒排煙',
      '大風機增壓馬達，龍捲大吸力暢排煙',
      '易拆磁吸式油網，省時輕巧好刷洗',
      '全鋼化黑玻璃，一抹即淨好省心',
      '完美傾斜度，釋放烹飪視線不碰頭',
    ],
    properties: [
      { label: '機體尺寸（寬×深×高）', value: '890／790×430×946 mm' },
      { label: '顏色／材質', value: '黑色鋼化玻璃／烤漆' },
      { label: 'CNS7778 風洞試驗法風量（m³/min）', value: '16.5' },
      { label: '出風口風量（m³/min）', value: '22' },
      { label: '重量（kg）', value: 'L：29KG' },
      { label: '重量（kg）', value: 'XL：31KG' },
      { label: '使用電壓', value: '110V／60Hz' },
      { label: '馬達耗電量', value: '250W' },
      { label: '照明', value: 'LED 5W ×1' },
      { label: '護罩尺寸（W×D×H）', value: '410×355（上：477／下：477）' },
      { label: '油網型式', value: '平油網' },
      { label: '馬達', value: '大風機增壓馬達' },
      { label: '操作面板設計', value: '按鍵式' },
    ],
    attachments: [
      { id: 'manual', label: '使用手冊', url: 'https://buy.sakura.com.tw/files/10170/R7615說明書.pdf' },
      { id: 'rohs', label: 'RoHS', url: 'https://buy.sakura.com.tw/files/10172/R7650XL-系列RoHS網站用-SAKURA.pdf' },
    ],
  },
  {
    id: 'r7653',
    title: '近吸除油煙機',
    model: 'R7653',
    price: '20,700',
    image: '/section-2/products/sakura/range-hood/near-suction/r7653.png',
    gallery: [detailAsset('r7653-1.png')],
    variants: [{ model: 'R7653', price: 20700 }],
    features: [
      '永久免費送油網，確保吸力永如新',
      '新型近吸排風結構，近吸直吸秒排煙',
      '大風機增壓馬達，龍捲大吸力暢排煙',
      '易拆磁吸式油網，省時輕巧好刷洗',
      '全鋼化黑玻璃，一抹即淨好省心',
      '完美傾斜度，釋放烹飪視線不碰頭',
      '雙效除油功能，機內清潔保如新',
      '900mm 自動擋煙板，擴大攏煙不跑煙',
      '黃金開合 66° 角，加速排煙吸更淨',
      '一鍵智能除味，5 分鐘排除油煙餘味',
    ],
    properties: [
      { label: '機體尺寸（寬×深×高）', value: '890×430×946 mm' },
      { label: '顏色／材質', value: '黑／鋼化玻璃' },
      { label: 'CNS7778 風洞試驗法風量（m³/min）', value: '16.5' },
      { label: '出風口風量（m³/min）', value: '22' },
      { label: '重量（kg）', value: '31KG' },
      { label: '使用電壓', value: '110V／60Hz' },
      { label: '馬達耗電量', value: '250W' },
      { label: '照明', value: 'LED 5W ×1' },
      { label: '護罩尺寸（W×D×H）', value: '410×355 mm' },
      { label: '油網型式', value: '平油網' },
      { label: '馬達', value: '大風機增壓馬達' },
      { label: '操作面板設計', value: '觸控式' },
    ],
    attachments: [
      { id: 'manual', label: '使用手冊', url: 'https://buy.sakura.com.tw/files/9473/R7615-R7610-R7650-R7653-R9650-說明書.pdf' },
      { id: 'rohs', label: 'RoHS', url: 'https://buy.sakura.com.tw/files/9472/R7650-R7653-R7610-系列RoHS網站用-SAKURA.pdf' },
    ],
  },
  {
    id: 'dr7396',
    title: '近吸除油煙機－渦輪變頻 AI風控系列',
    model: 'DR7396',
    price: '26,300',
    image: '/section-2/products/sakura/range-hood/near-suction/dr7396.png',
    gallery: [detailAsset('dr7396-1.png'), detailAsset('dr7396-2.png'), detailAsset('dr7396-3.png'), detailAsset('dr7396-4.png')],
    variants: [
      { model: 'DR7396H L／XL', price: 26300 },
      { model: 'DR7396 L／XL', price: 26300 },
    ],
    features: [
      'AI 智能風控科技，自動調節最適風量',
      '渦輪變頻科技，Turbo 大吸力吸更淨',
      '靜音除味功能，安靜舒適排除油煙餘味',
      '永久免費送油網，吸力永保如新',
      '進煙口自動下降，排煙更即時',
      '熱感偵測技術，不限瓦斯爐具隨心搭配',
    ],
    properties: [
      { label: '機體尺寸（寬×深×高）', value: 'DR7396H：890／790×347×546 mm' },
      { label: '機體尺寸（寬×深×高）', value: 'DR7396：790／890×366×546 mm' },
      { label: '顏色／材質', value: '黑／烤漆' },
      { label: 'CNS7778 風洞試驗法風量（m³/min）', value: '16' },
      { label: '出風口風量（m³/min）', value: '21' },
      { label: '重量（kg）', value: 'L：20KG' },
      { label: '重量（kg）', value: 'XL：24KG' },
      { label: '使用電壓', value: '110V／60Hz' },
      { label: '馬達耗電量', value: '230W' },
      { label: '照明', value: 'LED 5W ×1' },
      { label: '護罩尺寸（W×D×H）', value: '可依環境需求選購風管護罩' },
      { label: '油網型式', value: '平油網' },
      { label: '馬達', value: '渦輪變頻馬達' },
      { label: '操作面板設計', value: '觸控式／AI 智能風控' },
    ],
    attachments: [
      { id: 'manual', label: '使用手冊', url: 'https://buy.sakura.com.tw/files/11399/DR7396(H).DR9396(H)說明書2024.12.10.pdf' },
      { id: 'rohs', label: 'RoHS', url: 'https://buy.sakura.com.tw/files/12134/DR7396RoHS.pdf' },
    ],
  },
  {
    id: 'dr7397',
    title: '近吸除油煙機－渦輪變頻 AI風控系列',
    model: 'DR7397',
    price: '26,300',
    image: '/section-2/products/sakura/range-hood/near-suction/dr7397.png',
    gallery: [detailAsset('dr7397-1.png'), detailAsset('dr7397-2.png'), detailAsset('dr7397-3.png'), detailAsset('dr7397-4.png')],
    variants: [{ model: 'DR7397', price: 26300 }],
    features: [
      '高科技熱感偵測，全爐具皆可偵測',
      '永久免費送油網，確保吸力永如新',
      'AI 智能風控科技，自動調節最適風量',
      '智能 IH 連動，油煙機與 IH 同步啟閉',
      '智能料理輔助，提供即時鍋內溫度',
      '連動功能需搭配櫻花指定型號 IH 爐 EG2351G',
    ],
    properties: [
      { label: '機體尺寸（寬×深×高）', value: '890／790×366×546 mm' },
      { label: '顏色／材質', value: '黑／烤漆' },
      { label: 'CNS7778 風洞試驗法風量（m³/min）', value: '16' },
      { label: '出風口風量（m³/min）', value: '21' },
      { label: '重量（kg）', value: 'L：20KG／XL：24KG' },
      { label: '使用電壓', value: '110V／60Hz' },
      { label: '馬達耗電量', value: '230W' },
      { label: '照明', value: 'LED 5W ×1' },
      { label: '護罩尺寸（W×D×H）', value: '可依環境需求選購風管護罩' },
      { label: '油網型式', value: '平油網' },
      { label: '馬達', value: '渦輪變頻馬達' },
      { label: '操作面板設計', value: '觸控式／AI 智能風控／IH 連動' },
    ],
    attachments: [
      { id: 'manual', label: '使用手冊', url: 'https://buy.sakura.com.tw/files/12081/DR7397說明書FA.pdf' },
      { id: 'rohs', label: 'RoHS', url: 'https://buy.sakura.com.tw/files/12135/DR7397RoHS.pdf' },
    ],
  },
  {
    id: 'r7302a',
    title: '近吸除油煙機－近吸隱藏系列（半隱藏）',
    model: 'R7302A',
    price: '18,300',
    image: '/section-2/products/sakura/range-hood/near-suction/r7302a.png',
    gallery: [detailAsset('r7302a-1.png')],
    variants: [{ model: 'R7302A', price: 18300 }],
    features: [
      '永久免費送油網，吸力永保如新',
      '進煙口距離檯面僅 32cm，快速排煙',
      '首創揮手智控，淨煙零觸碰',
      '兩分鐘延遲關機，持續排除料理餘味',
      '可替換半隱藏機型，全平玻璃好擦拭',
      '標準安裝配件無附風管護罩，可依環境需求選購',
    ],
    properties: [
      { label: '進煙口設計', value: '固定式' },
      { label: '機體尺寸（寬×深×高）', value: 'R7302AL：790×366×632 mm' },
      { label: '機體尺寸（寬×深×高）', value: 'R7302AXL：890×366×632 mm' },
      { label: '護罩尺寸（寬×深×高）', value: '標準安裝無附風管護罩，請依環境需求另行選配' },
      { label: '重量（kg）', value: 'R7302AL：16.4KG／R7302AXL：18.4KG' },
      { label: '顏色／材質', value: '黑／烤漆' },
      { label: '使用電壓', value: '110V／60Hz' },
      { label: '傳動方式', value: 'AC 單馬達' },
      { label: '照明', value: 'LED 5W ×1' },
      { label: '開關型式', value: '觸控式／揮手智控' },
      { label: 'CNS7778 風洞試驗法風量（m³/min）', value: '15' },
      { label: '出風口風量（m³/min）', value: '20' },
    ],
    attachments: [
      { id: 'manual', label: '使用手冊', url: 'https://buy.sakura.com.tw/files/12306/R7301AR7302A說明書20241210.pdf' },
      { id: 'rohs', label: 'RoHS', url: 'https://buy.sakura.com.tw/files/12308/R7301AXL系列RoHS網站用-SAKURA.pdf' },
    ],
  },
  {
    id: 'r7301a',
    title: '近吸除油煙機－近吸隱藏系列（全隱藏）',
    model: 'R7301A',
    price: '18,300',
    image: '/section-2/products/sakura/range-hood/near-suction/r7301a.png',
    gallery: [detailAsset('r7301a-1.png')],
    variants: [{ model: 'R7301A', price: 18300 }],
    features: [
      '永久免費送油網，吸力永保如新',
      '進煙口距離檯面僅 32cm，快速排煙',
      '可替換全隱藏機型，全平玻璃好擦拭',
      '首創揮手智控，淨煙零觸碰',
      '兩分鐘延遲關機，持續排除料理餘味',
      '易拆卸油杯，方便清潔',
    ],
    properties: [
      { label: '進煙口設計', value: '固定式' },
      { label: '機體尺寸（寬×深×高）', value: 'R7301AL：790×347×632 mm' },
      { label: '機體尺寸（寬×深×高）', value: 'R7301AXL：890×347×632 mm' },
      { label: '重量（kg）', value: 'R7301AL：16KG／R7301AXL：18KG' },
      { label: '顏色／材質', value: '黑／烤漆' },
      { label: '使用電壓', value: '110V／60Hz' },
      { label: '傳動方式', value: 'AC 單馬達' },
      { label: '照明', value: 'LED 5W ×1' },
      { label: '開關型式', value: '觸控式／揮手智控' },
      { label: 'CNS7778 風洞試驗法風量（m³/min）', value: '15' },
      { label: '出風口風量（m³/min）', value: '20' },
    ],
    attachments: [
      { id: 'manual', label: '使用手冊', url: 'https://buy.sakura.com.tw/files/12302/R7301AR7302A說明書20241210.pdf' },
      { id: 'rohs', label: 'RoHS', url: 'https://buy.sakura.com.tw/files/12304/R7301AXL系列RoHS網站用-SAKURA.pdf' },
    ],
  },
]

export const getSakuraNearSuctionProductRoute = (product: Pick<SakuraNearSuctionProduct, 'id'>) =>
  `/products/sakura/range-hood/near-suction/${product.id}`
