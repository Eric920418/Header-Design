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
    year: '2016',
    templateQuestion: '導入 AR3D 系統，讓每個顧客立即看到廚房將呈現的樣貌',
    summary: '導入 AR 3D 系統，第 100 家門市開幕',
    description: '導入AR 3D系統，讓每個顧客立即看到廚房將呈現的樣貌，且讓設計溝通無距離，更精準的滿足顧客的廚房使用需求。第100家門市開幕，櫻花廚藝生活館更靠近每位顧客，更以「成為在地的廚房諮詢專家」為目標。',
    image: '/section-5/about-us/history-2016.png',
    icon: '/section-5/about-us/history-icon-2016.svg',
  },
  {
    year: '2020',
    templateQuestion: '櫻花整體廚房產線整合、新廠落成啟用。',
    summary: '產線整合，新廠落成啟用',
    description: '櫻花整體廚房產線整合、新廠落成啟用。櫻花廚藝生活館首家四代店直營店於台中開幕，擬開展新零售模式。',
    image: '/section-5/about-us/history-2020.jpg',
    icon: '/section-5/about-us/history-icon-2020.svg',
  },
]

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
