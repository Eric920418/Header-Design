import type { ProductBrand } from '~/types/products'

export const PRODUCT_BRANDS = {
  sakura: { name: 'SAKURA', label: 'SAKURA 廚電', image: '/services/sakura-product.png', description: 'SAKURA 從廚房日常出發，整合烹調、清潔、熱水與淨水設備，讓每一項產品分類都回到真實家庭的使用需求。' },
  svago: { name: 'SVAGO', label: 'SVAGO', image: '/services/svago-product.png', description: '歐洲品牌 高質感美學。台灣櫻花獨家銷售，設計師好評推薦，引領歐式廚房美學，享樂高效料理生活。' },
  teka: { name: 'TEKA', label: 'TEKA', image: '/services/teka-product.png', description: '德國百年品味不凡。全球知名歐洲廚房電器製造商，秉承德系精工品質，全球累計超過1億家庭使用。' },
} satisfies Record<ProductBrand, { name: string; label: string; image: string; description: string }>

export function isProductBrand(value: unknown): value is ProductBrand {
  return typeof value === 'string' && Object.hasOwn(PRODUCT_BRANDS, value)
}
