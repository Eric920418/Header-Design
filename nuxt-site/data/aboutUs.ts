import type { BrandHistoryItem, BrandIdentityItem, BrandValueItem } from '~/types/content'

export const brandHistory: BrandHistoryItem[] = [
  {
    year: '1978',
    templateQuestion: '成立「台灣櫻花工業股份有限公司」，自創櫻花品牌行銷市場',
    summary: '成立「台灣櫻花工業股份有限公司」',
    description: '成立「台灣櫻花工業股份有限公司」，自創櫻花品牌行銷市場。',
    image: '/section-5/about-us/history-1978.png',
    icon: '/section-5/about-us/history-icon-1978.svg',
  },
  {
    year: '1992',
    templateQuestion: '開始發展系統廚具產品，進入系統廚具的建設公司市場。',
    summary: '開始發展系統廚具產品',
    description: '開始發展系統廚具產品，進入系統廚具的建設公司市場。',
    image: '/section-5/about-us/history-1992.jpg',
    icon: '/section-5/about-us/history-icon-1992.svg',
  },
  {
    year: '1994',
    description: '投資設立霧峰廚具廠。',
    image: '/section-5/about-us/history-1994.png',
  },
  {
    year: '1997',
    description: '成立廚具事業處，專職櫻花系統廚具產銷經營。引進micro-station系統，成為首家自行研發廚具電腦軟體的企業。成立櫻花廚藝生活館連鎖加盟總部，正式進入零售通路，11月第一家店面開幕。',
    image: '/section-5/about-us/history-1997.jpg',
  },
  {
    year: '2000',
    description: '成立櫻花廚藝大學，推動專業證照制度，建立全員設計師的廚具連鎖通路。',
    image: '/section-5/about-us/history-2000.jpg',
  },
  {
    year: '2003',
    description: '開設最遠店面宜蘭羅東店，將第一代店面的規劃設計全面更新為第二代店格。',
    image: '/section-5/about-us/history-2003.jpg',
  },
  {
    year: '2008',
    description: '推動並完成第三代店全面換裝升級計畫。展現「專業」及「精品廚具」的品牌形象。',
    image: '/section-5/about-us/history-2008.jpg',
  },
  {
    year: '2009',
    description: '獨家開發SAKURA 3D虛擬實境電腦繪圖系統，可讓消費者預先看到未來廚房的實境效果。',
    image: '/section-5/about-us/history-2009.jpg',
  },
  {
    year: '2011',
    description: '蟬連27年管理雜誌消費者調查廚具類第一品牌。蟬連漂亮家居家用品理想品牌第一品牌。',
    image: '/section-5/about-us/history-2011.jpg',
  },
  {
    year: '2013',
    description: '櫻花整體廚房商品系列化，提供消費者更專業的設計建議，滿足生活化廚房的想像。',
    image: '/section-5/about-us/history-2013.jpg',
  },
  {
    year: '2014',
    description: '推出自有品牌〈SAKURA Stone櫻花石英石〉檯面，提供高耐刮、高耐蝕、高耐污、高耐熱性的廚具檯面，更安心地處理食材，廚房料理更輕鬆。',
    image: '/section-5/about-us/history-2014.jpg',
  },
  {
    year: '2016',
    templateQuestion: '導入 AR3D 系統，讓每個顧客立即看到廚房將呈現的樣貌',
    summary: '導入 AR 3D 系統，第 100 家門市開幕',
    description: '導入AR 3D系統，讓每個顧客立即看到廚房將呈現的樣貌，且讓設計溝通無距離，更精準的滿足顧客的廚房使用需求。第100家門市開幕，櫻花廚藝生活館更靠近每位顧客，更以「成為在地的廚房諮詢專家」為目標。',
    image: '/section-5/about-us/history-2016.png',
    icon: '/section-5/about-us/history-icon-2016.svg',
  },
  {
    year: '2017',
    description: '櫻花廚藝生活館20年來供應數十萬套廚具給台灣家庭。投資擴建生產廠房，以快速、高效率地替更多顧客建構夢想中的廚房。',
    image: '/section-5/about-us/history-2017.jpg',
  },
  {
    year: '2018',
    description: '櫻花整體廚房產線整合、新廠落成啟用。櫻花廚藝生活館首家四代店直營店於台中開幕，擬開展新零售模式。',
    image: '/section-5/about-us/history-2018.jpg',
  },
  {
    year: '2020',
    templateQuestion: '投資自動化生產設備及軟體，導入C2M智能設計AI生產系統。',
    summary: '導入C2M智能設計AI生產系統',
    description: '櫻花整體廚房投資自動化生產設備及軟體，導入C2M智能設計AI生產系統。櫻花以「廚房是家的新核心」的理念，打造符合每個家庭族群的理想廚房。',
    image: '/section-5/about-us/history-2020.jpg',
    icon: '/section-5/about-us/history-icon-2020.svg',
  },
  {
    year: '2021',
    description: '簡約洗鍊的開放式廚房設計，展現成就不凡品味，PREMIUM君璽廚房系列上市。連續榮獲消費者理想品牌第一名。',
    image: '/section-5/about-us/history-2021.png',
  },
]

export const brandHistoryHighlights = brandHistory.filter(item => ['1978', '1992', '2016', '2020'].includes(item.year))

export const brandValues: BrandValueItem[] = [
  {
    id: 'brand',
    eyebrow: 'Our Brand',
    title: '一站滿足 樂享幸福',
    description: '憑藉多年累積的數據和服務經驗，櫻花整體廚房提供全方位廚房解決方案，一站整合品牌資源以專業解決廚房使用痛點，以美學勾勒夢想廚房藍圖',
    image: '/section-5/about-us/banner-kitchen.jpg',
  },
  {
    id: 'integration',
    eyebrow: 'Integrated Resources',
    title: '一站整合品牌資源\n以專業解決廚房使用痛點',
    description: '搭配永久免費的安心健檢，為每個家庭打造專屬的夢想餐廚從產生需求到使用的當下，都能創造精緻而美好的體驗',
    image: '/section-5/about-us/value-integration.jpg',
  },
  {
    id: 'service',
    eyebrow: 'Lifetime Care',
    title: '永久免費的安心健檢\n為每個家庭打造專屬的夢想餐廚',
    description: '櫻花整體廚房相信，廚房是家的新核心，也是凝聚情感的空間能實踐美好生活儀式，陪伴家庭品味日常的每一個時刻',
    image: '/section-5/about-us/value-service.jpg',
  },
  {
    id: 'family',
    eyebrow: 'Family Core',
    title: '廚房是家的新核心\n陪伴家庭品味日常的每一個時刻',
    description: '',
    image: '/section-5/about-us/value-family.jpg',
  },
]

export const brandIdentities: BrandIdentityItem[] = [
  { id: 'nameplate', title: '品牌銘板', image: '/section-5/about-us/identity-nameplate.jpg' },
  { id: 'drawer-cap', title: '靜音緩衝抽屜邊蓋', image: '/section-5/about-us/identity-drawer-cap.jpg' },
  { id: 'steel-stamp', title: '不鏽鋼桶身沖印', image: '/section-5/about-us/identity-steel-stamp.jpg' },
  { id: 'slide-cap', title: '座式緩衝滑軌蓋沖印', image: '/section-5/about-us/identity-slide-cap.jpg' },
  { id: 'hinge-cap', title: '鉸鏈邊蓋', image: '/section-5/about-us/identity-hinge-cap.jpg' },
  { id: 'door-edge', title: '門板前緣邊壓印', image: '/section-5/about-us/identity-door-edge.jpg' },
]
