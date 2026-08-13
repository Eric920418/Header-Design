import type { BrandAdvantageBenefit, BrandFamily, FaqGroup } from '~/types/content'

export const brandFamilies: BrandFamily[] = [
  { id: 'single', title: '小資貴族', englishTitle: 'Single', image: '/section-5/brand-advantage/family-single.jpg' },
  { id: 'couple', title: '天生一對', englishTitle: 'Couple', image: '/section-5/brand-advantage/family-couple.jpg' },
  { id: 'children', title: '親子世界', englishTitle: 'Children', image: '/section-5/brand-advantage/family-children.jpg' },
  { id: 'core-family', title: '家成業就', englishTitle: 'Core Family', image: '/section-5/brand-advantage/family-core.jpg' },
  { id: 'extended-family', title: '三代同堂', englishTitle: 'Extended Family', image: '/section-5/brand-advantage/family-extended.jpg' },
]

export const brandBenefits: BrandAdvantageBenefit[] = [
  {
    id: 'digitization',
    number: '01',
    englishTitle: 'Digitization',
    title: '夢想廚房，清晰可見',
    description: '獨家 SAKURA KITCHEN DESIGN 廚房設計系統，整合上萬筆櫥櫃大數據資料，讓消費者在設計圖洽談過程中可直接將需求轉換為 3D 櫥櫃圖像，更可更換配色及樣式，縮短廚房規劃時間。',
    image: '/section-5/brand-advantage/benefit-digitization.jpg',
  },
  {
    id: 'safety',
    number: '02',
    englishTitle: 'Safety',
    title: '產品安心，服務貼心',
    description: '櫻花整體廚房所生產銷售之商品皆經內部嚴謹的選品、製程等驗證程序，確保商品安全無虞；購買安裝後，更主動提供客戶進行櫻花全系列廚房健檢服務，為您打造安心環境！',
    image: '/section-5/brand-advantage/benefit-safety.jpg',
  },
  {
    id: 'professional',
    number: '03',
    englishTitle: 'Professional',
    title: '專業形象，值得信賴',
    description: '櫻花整體廚房擁有近百家門市，第一線接觸消費者的設計師皆受過專業的產品力及設計力之培訓、及廚藝大學之認證，提供給消費者最符合其需求的廚房規劃。此外，櫻花整體廚房更擁有全國最大的自有工廠，導入 AI 自動化生產線，全生產數據可視化以掌握生產流程細節；並透過 Qrcode，把銷售端、生產端與客戶關係管理系統（CRM）完整串接。',
    image: '/section-5/brand-advantage/benefit-professional.jpg',
  },
]

export const brandAdvantageFaqGroups: FaqGroup[] = [
  {
    id: 'brand-value',
    title: '整合與品牌價值',
    items: [
      { question: '櫻花整體廚房能帶給我什麼？', answer: '櫻花整體廚房不只是提供產品，而是提供全方位的廚房解決方案。對您來說，這代表從規劃、整合到後續照顧，都能獲得更完整、更一致的體驗，不必自己分頭處理各種零散需求。' },
      { question: '為什麼說是「一站整合品牌資源」？這對我有什麼好處？', answer: '一站整合代表您不需要自己再去找不同品牌、不同廠商反覆比對與協調。對消費者來說，最大的好處就是省下溝通時間、降低搭配落差，也減少責任歸屬不清的風險，讓整體規劃更順暢、更安心。' },
      { question: '近百家門市，對我來說有什麼價值？', answer: '門市多的價值不只是品牌規模，而是代表您更容易找到諮詢與服務據點。對消費者來說，這意味著前期規劃更便利，後續若有問題也更容易獲得支援，整體購買體驗更有保障。' },
      { question: '櫻花整體廚房的品牌承諾是什麼？', answer: '櫻花整體廚房的品牌承諾，是以全方位廚房解決方案回應您的生活需求，以一站整合品牌資源減輕規劃負擔，以專業設計與 3D 溝通提升規劃效率與理解，以主動健檢延續安心感，並以嚴謹的品質驗證守護日常使用。' },
    ],
  },
  {
    id: 'planning-design',
    title: '規劃與設計溝通',
    items: [
      { question: '你們的規劃方式，和一般廚房規劃有什麼不同？', answer: '櫻花整體廚房有獨家的廚房設計系統，整合上萬筆櫥櫃大數據資料，能在洽談過程中把需求直接轉換成 3D 櫥櫃圖像，還可更換配色與樣式。對您來說，這樣更容易看懂未來廚房的樣子，也能更快確認方向、縮短規劃時間。' },
      { question: '設計圖可以幫助我什麼？', answer: '設計圖不只是展示效果，更是幫助您把抽象想法變具體的重要工具。透過 3D 圖像與配色、樣式調整，您能更早看見規劃成果，減少想像落差，也更容易在施工前就做出適合自己的選擇。' },
      { question: '你們說能解決廚房使用痛點，對我來說是什麼意思？', answer: '這代表規劃不是只看表面風格，而是會回到您真正的使用情境，思考廚房是否好收納、好操作、好整理、動線是否順手。對您而言，重點不只是做出一個廚房，而是做出一個更適合每天生活的廚房。' },
      { question: '除了機能，還能兼顧美感嗎？', answer: '可以。品牌強調的不只是功能完整，也希望以美學勾勒夢想廚房藍圖。對您來說，就是在追求好用的同時，也能兼顧整體空間風格與視覺質感，讓廚房真正融入理想生活。' },
    ],
  },
  {
    id: 'quality-care',
    title: '品質與售後保障',
    items: [
      { question: '你們的設計與服務團隊專業嗎？', answer: '第一線接觸消費者的設計師，皆受過專業產品力與設計力培訓，並有廚藝大學認證。對您來說，這代表在規劃過程中，有更懂產品、也更懂使用需求的人協助您，能提出更符合生活實際的建議。' },
      { question: '為什麼選擇你們會比較安心？', answer: '安心不只來自設計與產品，也來自後續持續的照顧。購買安裝後，會主動提供全系列廚房健檢服務，讓您不是安裝完成就結束，而是後續使用中仍有持續被照顧的安心感。' },
      { question: '你們如何把關產品品質？', answer: '所生產銷售的商品皆經過內部嚴謹的選品與製程驗證程序，確保商品安全無虞。對您來說，這代表品牌不只在意外觀與銷售，更重視產品真正進入家庭後的安全、品質與使用穩定性。' },
      { question: '購買後還會有人主動關心使用狀況嗎？', answer: '會。主動提供健檢服務的意義，在於品牌不是等問題發生才處理，而是更早協助您檢視廚房使用狀況，幫助維持更安心、更穩定的使用環境。' },
    ],
  },
]
