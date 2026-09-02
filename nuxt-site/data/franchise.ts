export interface FranchiseAdvantage {
  id: string
  number: string
  title: string
  summary: string
  image: string
  imageAlt: string
  features: FranchiseFeature[]
  badge?: string
}

export interface FranchiseFeature {
  icon: string
  label: string
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
  shortTitle: string
  title: string
  excerpt: string
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
    summary: '櫻花整體廚房擁有全國最大的自有工廠，透過生產數據視覺化系統掌握生產流程，並導入 AI 自動化生產線，從繪圖、下單到生產一條龍作業，大幅提升生產效能。',
    image: '/section-6/franchise/factory.png',
    imageAlt: '櫻花整體廚房自有工廠與自動化生產線',
    features: [
      { icon: '/section-6/franchise/icons/Global_Icon_Asset_02.svg', label: '導入 AI 全自動化生產' },
      { icon: '/section-6/franchise/icons/Global_Icon_Asset_03.svg', label: '產品專屬 QR Code' },
      { icon: '/section-6/franchise/icons/Global_Icon_Asset_04.svg', label: '生產數據視覺化系統' },
    ],
    badge: 'AI 導入',
  },
  {
    id: 'innovation',
    number: '02',
    title: '精準掌握市場趨勢',
    summary: '透過對全台數百萬戶家庭生活的研究與觀察，與消費者一起打造符合每個家庭的理想生活。精準掌握市場趨勢與顧客需求，持續推出領導潮流且具備競爭優勢的創新商品。',
    image: '/section-6/franchise/innovation.png',
    imageAlt: '櫻花整體廚房多元廚房設計成果',
    features: [
      { icon: '/section-6/franchise/icons/Global_Icon_Asset_04.svg', label: '一站式整合集團資源' },
      { icon: '/section-6/franchise/icons/Global_Icon_Asset_05.svg', label: '全台唯一智能繪圖系統導入' },
      { icon: '/section-6/franchise/icons/Global_Icon_Asset_06.svg', label: '產品差異化創新力' },
    ],
    badge: '研究與創新',
  },
  {
    id: 'service',
    number: '03',
    title: '永久售後服務保障',
    summary: '櫻花整體廚房內部有嚴謹的選品、製程等驗證程序，並提供客戶櫻花全系列廚房健檢服務，打造安心環境。強大後勤支援與消費者服務體系，實踐「櫻花永久服務」的承諾。',
    image: '/section-6/franchise/service.png',
    imageAlt: '櫻花原廠服務人員提供廚房健檢與售後服務',
    features: [
      { icon: '/section-6/franchise/icons/Global_Icon_Asset_07.svg', label: '熱水器送安檢' },
      { icon: '/section-6/franchise/icons/Global_Icon_Asset_09.svg', label: '油網送到家' },
      { icon: '/section-6/franchise/icons/Global_Icon_Asset_10.svg', label: '廚房健檢' },
      { icon: '/section-6/franchise/icons/Global_Icon_Asset_11.svg', label: '淨水器健檢' },
    ],
    badge: '永久服務',
  },
  {
    id: 'market',
    number: '04',
    title: '商圈保證機制',
    summary: '透過總部專業商圈商機評估機制，確保每家門市開在最佳地點，高含金量開店的模式，幫助加盟創造最大坪效利益。',
    image: '/section-6/franchise/market.png',
    imageAlt: '商圈數據分析與櫻花整體廚房全台門市分布',
    features: [
      { icon: '/section-6/franchise/icons/Global_Icon_Asset_12.svg', label: '最佳地點' },
      { icon: '/section-6/franchise/icons/Global_Icon_Asset_13.svg', label: '最大效益' },
      { icon: '/section-6/franchise/icons/Global_Icon_Asset_14.svg', label: '專業後勤支援' },
    ],
    badge: '效益最大化',
  },
  {
    id: 'support',
    number: '05',
    title: '全台據點支援',
    summary: '提供全省各點物流配送，保障貨暢其流，以及完善安裝團隊支援，專業認證專業施工，保障售後施工品質安心，讓加盟創業提供強大的資源後盾！',
    image: '/section-6/franchise/support.png',
    imageAlt: '廚房安裝、設計規劃與材料選配支援',
    features: [
      { icon: '/section-6/franchise/icons/Global_Icon_Asset_15.svg', label: '各點物流配送' },
      { icon: '/section-6/franchise/icons/Global_Icon_Asset_16.svg', label: '強大團隊支援' },
      { icon: '/section-6/franchise/icons/Global_Icon_Asset_17.svg', label: '專業施工認證' },
    ],
    badge: '完善支援網絡',
  },
  {
    id: 'training',
    number: '06',
    title: '完善的教育訓練',
    summary: '總部全力支援，從開店準備到新進員工實習訓練，透過「櫻花廚藝大學」協助掌握銷售技巧與廚具專業知識，全面提升競爭實力，幫助您快速站穩事業基礎！',
    image: '/section-6/franchise/training.png',
    imageAlt: '櫻花廚藝大學教育訓練現場',
    features: [
      { icon: '/section-6/franchise/icons/Global_Icon_Asset_18.svg', label: '示範店實習' },
      { icon: '/section-6/franchise/icons/Global_Icon_Asset_19.svg', label: '專業督導協助' },
      { icon: '/section-6/franchise/icons/Global_Icon_Asset_20.svg', label: '標準化手冊' },
    ],
    badge: '櫻花廚藝大學',
  },
]

export const franchiseTestimonials: FranchiseTestimonial[] = [
  {
    name: '謝立宸',
    role: '店經理',
    tenure: '加盟年資 14 年',
    store: 'SAKURA KITCHEN 高雄巨蛋店',
    portrait: '/section-6/franchise/manager-hsieh.jpg',
    quote: '年輕時我對設計充滿憧憬，剛開始進入廚具行業時，完全不懂這個領域；但在幫助客人解決需求的過程中，我逐漸摸索出了自己的廚房設計理念。選擇櫻花，品牌價值是很放心的重點，品牌用心經營，客源自然而然就會來。總部從店面規劃、銷售技巧，到櫃體版材、檯面知識與運送安裝流程，都得到了完善的培訓與指導。',
  },
  {
    name: '劉芳玲',
    role: '店經理',
    tenure: '加盟年資 2 年',
    store: 'SAKURA KITCHEN 台中大甲店',
    portrait: '/section-6/franchise/manager-liu.jpg',
    quote: '當初選擇櫻花，是因為它是很大的品牌，我想找一個可以長期經營，並且未來可以交給下一代的事業。櫻花提供的「廚藝大學」有三週的培訓，讓我獲得了專業的知識與技能，包括繪圖軟體的使用教學；開店前也有實際到店面實習一個月，這些對我開店後的順利運營非常有幫助。',
  },
]

export const franchiseMarketingStories: FranchiseMarketingStory[] = [
  {
    shortTitle: '藝人 袁艾菲',
    title: '袁艾菲與老公結婚二周年甜蜜獻禮，讓愛增溫的法寶藏在簡約美廚細節裡',
    excerpt: '以工業風「潮派廚房」為主軸，從動線、材質、家電與五金收納，打造兼具簡約風尚與實用機能的複合式美廚。',
    image: '/section-6/franchise/marketing-01.jpg',
  },
  {
    shortTitle: '藝人 小蠻與邵翔',
    title: '一心只為孩子的成長！小蠻與邵翔攜手打造安心親子廚房',
    excerpt: '開放式中島廚房透過動線、機能、收納與外型規劃，在有限空間中實現安心親子共廚。',
    image: '/section-6/franchise/marketing-02.jpg',
  },
  {
    shortTitle: '藝人 徐凱希',
    title: '凱希與爸爸共築夢想廚居，幸福傳承再續新篇',
    excerpt: '從選材配色、動線、工作區到收納整合，打造兼具高效率與高顏值的一字型理想廚房。',
    image: '/section-6/franchise/marketing-03.jpg',
  },
  {
    shortTitle: '藝人 荳荳',
    title: '顛覆對廚房的既定想像，藝人荳荳新居唯一指定',
    excerpt: '以全新品牌門市、專業設計服務與生活需求規劃，為新居量身打造時尚又實用的理想廚房。',
    image: '/section-6/franchise/marketing-04.jpg',
  },
  {
    shortTitle: '藝人 鍾欣怡',
    title: '名人推薦：鍾欣怡體驗全新升級 SAKURA KITCHEN 門市',
    excerpt: '一站整合品牌資源與永久免費廚房安心健檢，為家庭打造專屬夢想餐廚。',
    image: '/section-6/franchise/marketing-05.jpg',
  },
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
  { icon: '/section-6/franchise/icons/Global_Icon_Asset_23.svg', title: '良好服務態度', detail: '具備積極、熱忱、親切及服務客人的態度。' },
  { icon: '/section-6/franchise/icons/Global_Icon_Asset_24.svg', title: '營業面積與租期', detail: '自有店面或取得五年以上租期；面寬須 5.5 米以上，營業面積須 30 坪以上（不含騎樓）。' },
  { icon: '/section-6/franchise/icons/Global_Icon_Asset_25.svg', title: '年齡與學歷', detail: '年滿 25 歲至 55 歲，並具高中（職）以上學歷。' },
  { icon: '/section-6/franchise/icons/Global_Icon_Asset_26.svg', title: '經營人數', detail: '至少 3 人，並需專職投入經營。' },
]

export const franchiseSupportHighlights = [
  { title: '高額創業補助', detail: '業界唯一股票上市公司高額創業補助！包含招牌補貼 50% 以上、裝潢補貼最高 80 萬。' },
  { title: '加盟補助金', detail: '讓您起步沒壓力！開店資金幫助一步到位，減輕負擔，讓創業更輕鬆。' },
  { title: '業績獎金', detail: '幫您多賺一筆！業績達標即享現金獎勵，多賺多拿，回報看得見！' },
  { title: '專業教育訓練', detail: '讓經營超省力！一步步教會您經營秘訣，沒有經驗也能輕鬆上手！' },
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
