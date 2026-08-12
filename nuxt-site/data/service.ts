import type { FaqGroup, ServiceStep } from '~/types/content'

export const serviceSteps: ServiceStep[] = [
  {
    number: '1',
    title: '專業諮詢',
    icon: '/section-3/service-process/service-consult.png',
    description: ['門市接待介紹', '商品操作體驗', '溝通使用需求'],
  },
  {
    number: '2',
    title: '到府丈量',
    icon: '/section-3/service-process/service-measure.png',
    description: ['廚房問題診斷', '空間動線規劃', '水電管路配置討論'],
  },
  {
    number: '3',
    title: '量身設計',
    icon: '/section-3/service-process/service-design.png',
    description: ['專業3D設計解決方案洽談', '廚房風格／材質／機能選擇', '精準報價'],
    expandedDescription: ['透過數位平台整合', '設計立即報價並且下單連結生產製造', '快速滿足你對家的想像'],
    emphasized: true,
  },
  {
    number: '4',
    title: '簽約',
    icon: '/section-3/service-process/service-contract.png',
    description: ['支付簽約定金30%', '確認安裝日期', '工程進場協調'],
  },
  {
    number: '5',
    title: '製作期',
    icon: '/section-3/service-process/service-production.png',
    description: ['現場尺寸覆量', '最終圖面確認後', '支付出貨款60%', '生產前置期10-45個工作天'],
    expandedDescription: ['台灣最大生產廠', '自動化產線', '品質第一'],
    emphasized: true,
  },
  {
    number: '6',
    title: '現場安裝',
    icon: '/section-3/service-process/service-install.png',
    description: ['櫻花認證技師專業安裝', '安裝工期1-3個工作天'],
    expandedDescription: ['專業原廠技師安裝', '安裝環境具備基本防塵作業', '安裝環境整潔無虞'],
    emphasized: true,
  },
  {
    number: '7',
    title: '完工驗收',
    icon: '/section-3/service-process/service-inspect.png',
    description: ['櫻花標準驗收流程', '櫻花整體廚房使用說明', '支付尾款10%'],
  },
  {
    number: '8',
    title: '櫻花售後服務',
    icon: '/section-3/service-process/service-aftercare.png',
    description: ['0800免費諮詢', '365天服務不打烊', '五大永久免費服務', '品質保證、安心保固'],
    expandedDescription: ['指定櫻花整體廚房', '享受服務不間斷'],
    emphasized: true,
  },
]

export const faqGroups: FaqGroup[] = [
  {
    id: 'service',
    title: '服務與流程',
    items: [
      { question: '櫻花整體廚房提供哪些服務？', answer: '我們提供從需求了解、到府丈量、量身設計、簽約、製作、現場安裝、完工驗收，到售後服務的一站式完整服務，讓您從規劃到入住，都有專業團隊協助把關。' },
      { question: '你們會先到家裡丈量嗎？', answer: '會。專業人員會到府丈量，依照現場空間條件與使用需求進行規劃，作為後續設計與配置的基礎，讓廚房規劃更貼近實際生活需求。' },
      { question: '什麼是量身設計？', answer: '量身設計是依照您的空間條件、生活習慣與收納需求，規劃更適合您的整體廚房配置，不是套用制式方案，而是從實際使用出發，做更合適的安排。' },
      { question: '簽約之後，還會有哪些服務？', answer: '簽約後會進入製作與安裝流程，完工後也會有驗收與售後服務承接，讓您不只買到產品，更享有從交付到使用後的完整服務保障。' },
      { question: '安裝完成後，還有售後服務嗎？', answer: '有。完工驗收後，仍有櫻花售後服務提供後續支援，讓您在日後使用上更安心。' },
    ],
  },
  {
    id: 'after-sales',
    title: '售後保障',
    items: [
      { question: '什麼是五大永久免費服務？', answer: '五大永久免費服務是櫻花提供的重要售後保障之一，目的是讓消費者在購買與使用整體廚房後，仍能持續享有品牌服務支持，降低後續使用上的疑慮，提升長期使用安心感。' },
      { question: '為什麼售後服務很重要？', answer: '整體廚房不只是單一商品，而是結合設計、安裝與日常使用的整體系統。完善的售後服務，代表您在入住後若有使用、保養或服務需求，都有品牌體系可持續提供支援。' },
    ],
  },
  {
    id: 'certification',
    title: '原廠認證',
    items: [
      { question: '我要怎麼確認自己買到的是櫻花原廠整體廚房？', answer: '您可從產品上的原廠識別細節辨識，包括品牌銘板、靜音緩衝抽屜邊蓋、不鏽鋼桶身沖印、座式緩衝滑軌籃沖印、鉸鍊邊蓋，以及門材前緣封邊壓印等，這些都是原廠認證的重要識別依據。' },
      { question: '為什麼原廠認證這麼重要？', answer: '原廠認證不只是辨識品牌，更代表產品來源清楚、規格一致，並能對應原有的品質要求與售後保障，讓消費者在購買與使用上更有保障。' },
      { question: '購買後會有保證書嗎？', answer: '會。原廠認證內容包含保證書與相關說明，作為產品保障與服務承接的重要依據，讓您在使用期間更有憑據，也更安心。' },
      { question: 'SAKURA iCare 是什麼？', answer: 'SAKURA iCare 是櫻花保證與服務體系的一部分，與保證書說明一同提供，讓消費者在購買後能更清楚了解保障內容與後續服務依據。' },
    ],
  },
  {
    id: 'quality',
    title: '品質保證',
    items: [
      { question: '櫻花整體廚房有哪些品質保證？', answer: '櫻花整體廚房強調多項品質把關，包括通過德國 LGA 檢測合格、符合 SGS 與歐盟官方認證，並符合 CNS8088 國家標準，讓產品在品質與使用安全上更具保障。' },
      { question: '這些檢測與認證對消費者代表什麼？', answer: '代表產品不只重視外觀設計，也重視材料、結構與使用安全等基本要求。對消費者而言，這些檢測與標準是品質把關的重要依據，也是選購時的重要安心保證。' },
      { question: '你們對五金與板材也有品質要求嗎？', answer: '有。品質保證內容涵蓋五金與板材等項目，並對應相關檢測與標準要求，目的是讓消費者在長期使用上，享有更穩定、更值得信賴的品質表現。' },
      { question: '為什麼要特別強調國家標準與國際檢測？', answer: '因為整體廚房屬於高使用頻率的居家空間，從五金耐用、板材品質到基本使用安全，都與日常生活密切相關。清楚揭示檢測與標準，能讓消費者更放心，也更了解品牌對品質的重視。' },
    ],
  },
]
