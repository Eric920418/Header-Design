export interface SakuraProductCategory {
  id: string
  title: string
  groupLabel: string
  image: string
  route?: string
}

export interface SakuraProductGroup {
  id: string
  label: string
  categories: SakuraProductCategory[]
}

export const SAKURA_PRODUCT_GROUPS: SakuraProductGroup[] = [
  {
    id: 'kitchen-appliances',
    label: 'SAKURA 廚電商品',
    categories: [
      { id: 'range-hood', title: '除油煙機', groupLabel: 'SAKURA 廚電商品', image: '/section-2/products/sakura/range-hood.png', route: '/products/sakura/range-hood' },
      { id: 'gas-stove', title: '瓦斯爐', groupLabel: 'SAKURA 廚電商品', image: '/section-2/products/sakura/gas-stove.png' },
      { id: 'ih-cooktop', title: 'IH 感應爐', groupLabel: 'SAKURA 廚電商品', image: '/section-2/products/sakura/ih-cooktop.png' },
      { id: 'dish-sterilizer', title: '殺菌烘碗機', groupLabel: 'SAKURA 廚電商品', image: '/section-2/products/sakura/dish-sterilizer.png' },
      { id: 'dishwasher', title: '洗碗機', groupLabel: 'SAKURA 廚電商品', image: '/section-2/products/sakura/dishwasher.png' },
      { id: 'oven-storage', title: '烤箱與電器收納櫃', groupLabel: 'SAKURA 廚電商品', image: '/section-2/products/sakura/oven-storage.png' },
    ],
  },
  {
    id: 'water-heaters',
    label: '熱水器',
    categories: [
      { id: 'gas-water-heater', title: '瓦斯熱水器', groupLabel: '熱水器', image: '/section-2/products/sakura/gas-water-heater.png' },
      { id: 'electric-water-heater', title: '電能熱水器', groupLabel: '熱水器', image: '/section-2/products/sakura/electric-water-heater.png' },
    ],
  },
  {
    id: 'water-purifiers',
    label: '淨水設備',
    categories: [
      { id: 'ro', title: 'RO 系列', groupLabel: '淨水設備', image: '/section-2/products/sakura/ro.png' },
      { id: 'sqc', title: 'SQC 系列', groupLabel: '淨水設備', image: '/section-2/products/sakura/sqc.png' },
      { id: 'hot-water-dispenser', title: '熱飲機系列', groupLabel: '淨水設備', image: '/section-2/products/sakura/hot-water-dispenser.png' },
      { id: 'purified-hot-water', title: '淨熱飲系列', groupLabel: '淨水設備', image: '/section-2/products/sakura/purified-hot-water.png' },
      { id: 'filter', title: '濾心', groupLabel: '淨水設備', image: '/section-2/products/sakura/filter.png' },
    ],
  },
]
