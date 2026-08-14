export interface KitchenCatalogue {
  id: string
  title: string
  description: string
  cover: string
  pdfUrl: string
}

export const KITCHEN_CATALOGUES: KitchenCatalogue[] = [
  {
    id: 'ipremium',
    title: 'iPremium 廚房 型錄',
    description: 'AI KITCHEN iPremium 產品系列型錄',
    cover: '/section-1/catalogues/ipremium.jpg',
    pdfUrl: 'https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/06AI_iPremium.pdf',
  },
  {
    id: 'joyful',
    title: 'Joyful 童樂廚房 型錄',
    description: 'Joyful 童樂廚房系列產品型錄',
    cover: '/section-1/catalogues/joyful.png',
    pdfUrl: 'https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/04Joyful.pdf',
  },
  {
    id: 'premium',
    title: 'Premium 君璽廚房 型錄',
    description: 'Premium 君璽廚房系列產品型錄',
    cover: '/section-1/catalogues/premium.jpg',
    pdfUrl: 'https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/01Premium.pdf',
  },
  {
    id: 'harmony',
    title: 'Harmony 閤樂廚房 型錄',
    description: 'Harmony 閤樂廚房產品系列型錄',
    cover: '/section-1/catalogues/harmony.jpg',
    pdfUrl: 'https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/05Harmony.pdf',
  },
  {
    id: 'loft-chic',
    title: 'Loft Chic 潮派廚房 型錄',
    description: 'Loft Chic 潮派廚房產品系列型錄',
    cover: '/section-1/catalogues/loft-chic.jpg',
    pdfUrl: 'https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/03Loftchic.pdf',
  },
  {
    id: 'elegant',
    title: 'Elegant 臻美廚房 型錄',
    description: 'Elegant 臻美廚房產品系列型錄',
    cover: '/section-1/catalogues/elegant.png',
    pdfUrl: 'https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/02Elegant.pdf',
  },
]
