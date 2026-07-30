export type KitchenStyle = {
  en: string;
  zh: string;
  desc: string;
  image: string;
};

// Header 品牌系列 mega-menu 與首頁系列輪播共用同一份資料，避免名稱、順序及圖片不同步。
export const KITCHEN_STYLES: KitchenStyle[] = [
  {
    en: 'Basic+',
    zh: 'Basic+',
    desc: 'Basic+廚房系列 以生活的基本為出發',
    image: '/kitchen-styles/basic-plus.jpg',
  },
  {
    en: 'AI Kitchen',
    zh: 'AI廚房',
    desc: '突破未來格局 開啟廚房智高點',
    image: '/kitchen-styles/ai-kitchen.jpg',
  },
  {
    en: 'Clever Kitchen',
    zh: '巧域廚房',
    desc: '極致收納 在廚房',
    image: '/kitchen-styles/clever.jpg',
  },
  {
    en: 'Loft Chic Kitchen',
    zh: '潮派廚房',
    desc: '品味浪漫 在廚房',
    image: '/kitchen-styles/loft-chic.jpg',
  },
  {
    en: 'Joyful Kitchen',
    zh: '童樂廚房',
    desc: '幸福享樂 在廚房',
    image: '/kitchen-styles/joyful.jpg',
  },
  {
    en: 'Premium Kitchen',
    zh: '君璽廚房',
    desc: '成就不凡 在廚房',
    image: '/kitchen-styles/premium.jpg',
  },
  {
    en: 'Elegant Kitchen',
    zh: '臻美廚房',
    desc: '臻萃美緻 在廚房',
    image: '/kitchen-styles/elegant.jpg',
  },
  {
    en: 'Chef Kitchen',
    zh: '大廚廚房',
    desc: '心滿藝足 在廚房',
    image: '/kitchen-styles/chef.jpg',
  },
  {
    en: 'Country Kitchen',
    zh: '鄉村廚房',
    desc: '鄉村慢活 在廚房',
    image: '/kitchen-styles/country.jpg',
  },
  {
    en: 'Harmony Kitchen',
    zh: '閣樂廚房',
    desc: '天倫團聚 在廚房',
    image: '/kitchen-styles/harmony.jpg',
  },
];
