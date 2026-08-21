export interface KitchenCatalogue {
  id: string
  title: string
  description: string
  cover: string
  pdfUrl: string
}

export const KITCHEN_CATALOGUES: KitchenCatalogue[] = [
  {
    id: 'basic-plus',
    title: 'MUJI Basic+ 型錄',
    description: 'SAKURA with MUJI RENOVATION Basic+ 系列產品型錄',
    cover: '/section-1/catalogues/basic-plus.jpg',
    pdfUrl: 'https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/08Basic+.pdf',
  },
  {
    id: 'clever',
    title: 'Clever巧域廚房 型錄',
    description: 'Clever巧域廚房 系列產品型錄',
    cover: '/section-1/catalogues/clever.jpg',
    pdfUrl: 'https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/07Clever.pdf',
  },
  {
    id: 'ipremium',
    title: 'iPremium 廚房 型錄',
    description: 'AI KITCHEN iPremium產品系列型錄',
    cover: '/section-1/catalogues/ipremium.jpg',
    pdfUrl: 'https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/06AI_iPremium.pdf',
  },
  {
    id: 'joyful',
    title: 'Joyful童樂廚房 型錄',
    description: 'Joyful童樂廚房 系列產品型錄',
    cover: '/section-1/catalogues/joyful.png',
    pdfUrl: 'https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/04Joyful.pdf',
  },
  {
    id: 'premium',
    title: 'Premium君璽廚房 型錄',
    description: 'Premium君璽廚房 系列產品型錄',
    cover: '/section-1/catalogues/premium.jpg',
    pdfUrl: 'https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/01Premium.pdf',
  },
  {
    id: 'harmony',
    title: 'Harmony閤樂廚房 型錄',
    description: 'Harmony閤樂廚房 產品系列型錄',
    cover: '/section-1/catalogues/harmony.jpg',
    pdfUrl: 'https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/05Harmony.pdf',
  },
  {
    id: 'loft-chic',
    title: 'Loft Chic潮派廚房 型錄',
    description: 'Loft Chic潮派廚房 產品系列型錄',
    cover: '/section-1/catalogues/loft-chic.jpg',
    pdfUrl: 'https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/03Loftchic.pdf',
  },
  {
    id: 'elegant',
    title: 'Elegant臻美廚房 型錄',
    description: 'Elegant臻美廚房 產品系列型錄',
    cover: '/section-1/catalogues/elegant.png',
    pdfUrl: 'https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/02Elegant.pdf',
  },
]
