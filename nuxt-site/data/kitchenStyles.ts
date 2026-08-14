export type KitchenStyle = {
  slug: string
  en: string
  zh: string
  desc: string
  image: string
  route?: string
  available: boolean
}

export const KITCHEN_STYLES: KitchenStyle[] = [
  { slug: 'basic-plus', en: 'Basic+', zh: 'Basic+', desc: 'Basic+廚房系列 以生活的基本為出發', image: '/kitchen-styles/basic-plus.jpg', available: false },
  { slug: 'aikitchen', en: 'AI Kitchen', zh: 'AI廚房', desc: '突破未來格局 開啟廚房智高點', image: '/kitchen-styles/ai-kitchen.jpg', route: '/home-style/aikitchen', available: true },
  { slug: 'clever', en: 'Clever Kitchen', zh: '巧域廚房', desc: '極致收納 在廚房', image: '/kitchen-styles/clever.jpg', available: false },
  { slug: 'loft-chic', en: 'Loft Chic Kitchen', zh: '潮派廚房', desc: '品味浪漫 在廚房', image: '/kitchen-styles/loft-chic.jpg', available: false },
  { slug: 'joyful', en: 'Joyful Kitchen', zh: '童樂廚房', desc: '幸福享樂 在廚房', image: '/kitchen-styles/joyful.jpg', available: false },
  { slug: 'premium', en: 'Premium Kitchen', zh: '君璽廚房', desc: '成就不凡 在廚房', image: '/kitchen-styles/premium.jpg', available: false },
  { slug: 'elegant', en: 'Elegant Kitchen', zh: '臻美廚房', desc: '臻萃美緻 在廚房', image: '/kitchen-styles/elegant.jpg', available: false },
  { slug: 'chef', en: 'Chef Kitchen', zh: '大廚廚房', desc: '心滿藝足 在廚房', image: '/kitchen-styles/chef.jpg', available: false },
  { slug: 'country', en: 'Country Kitchen', zh: '鄉村廚房', desc: '鄉村慢活 在廚房', image: '/kitchen-styles/country.jpg', available: false },
  { slug: 'harmony', en: 'Harmony Kitchen', zh: '閤樂廚房', desc: '天倫團聚 在廚房', image: '/kitchen-styles/harmony.jpg', available: false },
]
