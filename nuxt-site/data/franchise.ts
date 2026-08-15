export interface FranchiseAdvantage {
  id: string
  number: string
  title: string
  summary: string
  image: string
  imageAlt: string
  iconStrip: string
  iconAlt: string
  badge?: string
}

export interface FranchiseTestimonial {
  name: string
  role: string
  tenure: string
  store: string
  portrait: string
  quote: string
}

export interface FranchiseMarketingStory {
  title: string
  image: string
}

export interface FranchiseFaqItem {
  question: string
  answer: string
}

export const FRANCHISE_FORM_URL = '/franchising/form'
export const FRANCHISE_OFFICIAL_FORM_URL = 'https://www.sakura-kitchenlife.com.tw/franchising/form'
export const FRANCHISE_BROCHURE_URL = '/section-6/franchise/franchising_info.pdf'

export const franchiseAdvantages: FranchiseAdvantage[] = [
  {
    id: 'factory',
    number: '01',
    title: '全國最大自有工廠',
    summary: '透過生產數據視覺化系統掌握生產流程，並導入 AI 自動化生產線，從繪圖、下單到生產一條龍作業，大幅提升生產效能。',
    image: '/section-6/franchise/factory.png',
    imageAlt: '櫻花整體廚房自有工廠與自動化生產線',
    iconStrip: '/section-6/franchise/factory-icons.png',
    iconAlt: 'AI 自動化生產、產品專屬 QR Code 與生產數據視覺化系統',
    badge: 'AI 導入',
  },
  {
    id: 'innovation',
    number: '02',
    title: '精準掌握市場趨勢',
    summary: '透過對全台數百萬戶家庭生活的研究與觀察，精準掌握市場趨勢與顧客需求，持續推出領導潮流且具競爭優勢的創新商品。',
    image: '/section-6/franchise/innovation.png',
    imageAlt: '櫻花整體廚房多元廚房設計成果',
    iconStrip: '/section-6/franchise/innovation-icons.png',
    iconAlt: '一站式整合、智能設計導入與產品差異化創新力',
    badge: '研究與創新',
  },
  {
    id: 'service',
    number: '03',
    title: '永久售後服務保障',
    summary: '嚴謹的選品與製程驗證，結合櫻花全系列廚房健檢、強大後勤支援與消費者服務體系，實踐「櫻花永久服務」的承諾。',
    image: '/section-6/franchise/service.png',
    imageAlt: '櫻花原廠服務人員提供廚房健檢與售後服務',
    iconStrip: '/section-6/franchise/service-icons.png',
    iconAlt: '熱水器、油煙機、廚房與淨水器健檢服務',
    badge: '永久服務',
  },
  {
    id: 'market',
    number: '04',
    title: '商圈保證機制',
    summary: '由總部專業商圈商機評估機制協助選擇最佳地點，以高含金量開店模式，幫助加盟夥伴創造更好的坪效與經營基礎。',
    image: '/section-6/franchise/market.png',
    imageAlt: '商圈數據分析與櫻花整體廚房全台門市分布',
    iconStrip: '/section-6/franchise/market-icons.png',
    iconAlt: '最佳地點、最大效益與專業後勤支援',
    badge: '效益最大化',
  },
  {
    id: 'support',
    number: '05',
    title: '全台據點支援',
    summary: '提供全省物流配送、完善安裝團隊與專業施工認證，保障售後施工品質，成為加盟創業穩健經營的資源後盾。',
    image: '/section-6/franchise/support.png',
    imageAlt: '廚房安裝、設計規劃與材料選配支援',
    iconStrip: '/section-6/franchise/support-icons.png',
    iconAlt: '各點物流配送、強大團隊支援與專業施工認證',
    badge: '完善支援網絡',
  },
  {
    id: 'training',
    number: '06',
    title: '完善的教育訓練',
    summary: '從開店準備到新進員工實習訓練，透過「櫻花廚藝大學」協助掌握銷售技巧與廚具專業知識，全面提升競爭實力。',
    image: '/section-6/franchise/training.png',
    imageAlt: '櫻花廚藝大學教育訓練現場',
    iconStrip: '/section-6/franchise/training-icons.png',
    iconAlt: '示範店實習、專業督導協助與標準化手冊',
    badge: '櫻花廚藝大學',
  },
]

export const franchiseTestimonials: FranchiseTestimonial[] = [
  {
    name: '劉芳玲',
    role: '店經理',
    tenure: '加盟年資 2 年',
    store: 'SAKURA KITCHEN 台中大甲店',
    portrait: '/section-6/franchise/manager-liu.jpg',
    quote: '當初選擇櫻花，是因為它是很大的品牌，我想找一個可以長期經營、未來也能交給下一代的事業。櫻花提供三週廚藝大學培訓、繪圖軟體教學，以及開店前一個月的實店實習，對開店後順利營運非常有幫助。',
  },
  {
    name: '謝立宸',
    role: '店經理',
    tenure: '加盟年資 14 年',
    store: 'SAKURA KITCHEN 高雄巨蛋店',
    portrait: '/section-6/franchise/manager-hsieh.jpg',
    quote: '從完全不懂廚具，到逐漸摸索出自己的廚房設計理念，總部從店面規劃、銷售技巧，到櫃體板材、檯面知識與運送安裝流程，都提供了完善的培訓與指導。品牌用心經營，客源自然會來。',
  },
]

export const franchiseMarketingStories: FranchiseMarketingStory[] = [
  { title: '袁艾菲與老公結婚二周年甜蜜獻禮，讓愛增溫的法寶藏在簡約美廚細節裡', image: '/section-6/franchise/marketing-01.jpg' },
  { title: '一心只為孩子的成長！小蠻與邵翔攜手打造安心親子廚房', image: '/section-6/franchise/marketing-02.jpg' },
  { title: '凱希與爸爸共築夢想廚居，幸福傳承再續新篇', image: '/section-6/franchise/marketing-03.jpg' },
  { title: '顛覆對廚房的既定想像，藝人荳荳新居唯一指定', image: '/section-6/franchise/marketing-04.jpg' },
  { title: '名人推薦：鍾欣怡體驗全新升級 SAKURA KITCHEN 門市', image: '/section-6/franchise/marketing-05.jpg' },
]

export const franchiseProcessSteps = [
  '加盟諮詢',
  '資格審核',
  '商圈與店址評估',
  '營運計畫確認',
  '簽約與店面規劃',
  '教育訓練與實習',
  '開幕與持續輔導',
]

export const franchiseQualifications = [
  { title: '良好服務態度', detail: '具備積極、熱忱、親切及服務客人的態度。' },
  { title: '營業面積與租期', detail: '自有店面或取得五年以上租期；面寬須 5.5 米以上，營業面積須 30 坪以上（不含騎樓）。' },
  { title: '年齡與學歷', detail: '年滿 25 歲至 55 歲，並具高中（職）以上學歷。' },
  { title: '經營人數', detail: '至少 3 人，並需專職投入經營。' },
]

export const franchiseSupportHighlights = [
  { title: '高額創業補助', detail: '包含招牌補貼 50% 以上、裝潢補貼最高 80 萬元。' },
  { title: '加盟補助金', detail: '協助開店資金一步到位，減輕創業初期負擔。' },
  { title: '業績獎金', detail: '業績達標即享現金獎勵，讓經營成果清楚可見。' },
  { title: '專業教育訓練', detail: '從基礎到營運實務逐步教學，無經驗也能建立專業。' },
]

export const franchiseFaqItems: FranchiseFaqItem[] = [
  {
    question: '沒有廚具或加盟經驗，也能申請嗎？',
    answer: '可以。總部會依申請者條件進行審核，並提供廚藝大學、繪圖軟體、銷售技巧、產品知識與實店實習等完整訓練，協助建立營運所需能力。',
  },
  {
    question: '加盟需要準備多少資金？',
    answer: '實際投入會依店面條件、地點、裝修規模與設備配置不同而調整。建議先填寫加盟申請表，由專人說明加盟金、補助方案與完整資金規劃。',
  },
  {
    question: '店面地點可以自己決定嗎？',
    answer: '可先提出預計店址，總部會透過商圈評估機制共同確認市場潛力、店面條件與展店可行性，降低選址風險。',
  },
  {
    question: '加盟後會得到哪些持續支援？',
    answer: '包含品牌行銷、商品與系統更新、物流配送、安裝施工、營運督導、教育訓練及售後服務等支援，並持續協助門市提升經營能力。',
  },
  {
    question: '要如何開始申請？',
    answer: '請先填寫線上加盟申請表，留下基本資料與預計經營區域。專人收到資料後會與您聯繫，安排後續諮詢、資格與商圈評估。',
  },
]
