export interface SakuraProductSeries {
  id: string
  title: string
  productCount: number
  image: string
  route?: string
}

export const RANGE_HOOD_SERIES: SakuraProductSeries[] = [
  { id: 'near-suction', title: '近吸系列', productCount: 7, image: '/section-2/products/sakura/range-hood/near-suction.png', route: '/products/sakura/range-hood/near-suction' },
  { id: 'european', title: '歐化系列', productCount: 9, image: '/section-2/products/sakura/range-hood/european.png' },
  { id: 'hidden', title: '隱藏系列', productCount: 7, image: '/section-2/products/sakura/range-hood/hidden.png' },
  { id: 'streamlined', title: '流線系列', productCount: 3, image: '/section-2/products/sakura/range-hood/streamlined.png' },
  { id: 'deep-hood', title: '深罩系列', productCount: 1, image: '/section-2/products/sakura/range-hood/deep-hood.png' },
  { id: 'slanted-back', title: '斜背系列', productCount: 4, image: '/section-2/products/sakura/range-hood/slanted-back.png' },
  { id: 'compact', title: '輕巧系列', productCount: 1, image: '/section-2/products/sakura/range-hood/compact.png' },
  { id: 'accessories', title: '配備', productCount: 8, image: '/section-2/products/sakura/range-hood/accessories.png' },
]
