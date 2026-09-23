export const ADMIN_MEDIA = [
  { id: 'premium', name: 'Premium・開放式精品廚房', category: '首頁主視覺', src: '/home-2026/hero/ai-kitchen.jpg', alt: '深色木質與石紋中島的開放式精品廚房' },
  { id: 'clever', name: 'Clever・巧域生活', category: '首頁主視覺', src: '/home-2026/hero/clever-kitchen.jpg', alt: '明亮且兼具收納機能的巧域廚房' },
  { id: 'basic', name: 'Basic+・日常之間', category: '首頁主視覺', src: '/home-2026/hero/basic-plus.jpg', alt: '自然簡約的 Basic+ 廚房空間' },
  { id: 'custom', name: '訂製屬於你的生活', category: '設計案例', src: '/home-2026/gallery/custom-kitchen.jpg', alt: '具有大尺度中島的訂製廚房' },
  { id: 'oldhouse', name: '老宅的新日常', category: '設計案例', src: '/home-2026/gallery/old-house-kitchen.jpg', alt: '老屋翻新的明亮廚房' },
  { id: 'couple', name: '兩個人的料理時光', category: '設計案例', src: '/home-2026/gallery/yuan-aifei.jpg', alt: '展現居家生活感的廚房案例' },
  { id: 'store', name: '台中・品牌生活館', category: '品牌消息', src: '/section-5/brand-pavilion/pavilion-taichung.jpg', alt: '台中品牌生活館建築外觀' },
  { id: 'seminar', name: '一起創造美好生活', category: '品牌消息', src: '/section-4/news/latest-franchise-seminar-2026.jpg', alt: '櫻花整體廚房品牌活動主視覺' },
]
export type AdminMedia = typeof ADMIN_MEDIA[number]
export type AdminContent = {
  id: string
  title: string
  category: '最新消息' | '設計案例'
  status: '已發布' | '草稿'
  date: string
  excerpt: string
  image: string
}
export const ADMIN_CONTENT: AdminContent[] = [
  { id: '01', title: '讓生活，從一座美好的廚房開始', category: '最新消息', status: '草稿', date: '2026.09.14', excerpt: '從空間、材質到生活習慣，探索屬於自己的理想廚房。邀請你一起走進 SAKURA 的生活提案。', image: ADMIN_MEDIA[0]!.src },
  { id: '02', title: '台中品牌生活館・感受家的更多可能', category: '最新消息', status: '已發布', date: '2026.09.12', excerpt: '走進品牌生活館，親身體驗廚房與日常相遇的美好。', image: ADMIN_MEDIA[6]!.src },
  { id: '03', title: '光與木質，寫下老宅的新日常', category: '設計案例', status: '已發布', date: '2026.09.10', excerpt: '以溫暖木質與俐落收納，重新描繪一家人的料理時光。', image: ADMIN_MEDIA[4]!.src },
  { id: '04', title: '一座中島，串起家的每個片刻', category: '設計案例', status: '草稿', date: '2026.09.09', excerpt: '打開客餐廚的界線，讓料理、相聚與分享自然發生。', image: ADMIN_MEDIA[3]!.src },
  { id: '05', title: '秋日廚房靈感・把喜歡的生活帶回家', category: '最新消息', status: '已發布', date: '2026.09.06', excerpt: '柔和色彩與實用機能，構成值得期待的秋日生活。', image: ADMIN_MEDIA[1]!.src },
  { id: '06', title: '兩個人的日常，一起完成的理想廚房', category: '設計案例', status: '已發布', date: '2026.09.04', excerpt: '收藏每一次下廚的默契，在日常裡留下喜歡的風景。', image: ADMIN_MEDIA[5]!.src },
]
export const ADMIN_HOME = {
  title: '讓理想生活，\n在此展開。',
  subtitle: 'A KITCHEN. A WAY OF LIFE.',
  description: '從一座廚房開始，收藏生活裡每個值得珍惜的片刻。',
  button: '探索理想廚房',
  image: ADMIN_MEDIA[0]!.src,
}
