export type ProductBrand = 'sakura' | 'svago' | 'teka'
export interface ProductSummary {
  id: number; model: string; title: string; image: string | null; price: number | null; route: string; classIds: number[]
}
export interface ProductCategory {
  id: number; parentId: number; title: string; description: string; count: number; image: string | null; route: string
}
export interface ProductCategories {
  brand: ProductBrand; total: number; categories: ProductCategory[]; allCategories: ProductCategory[]
}
export interface ProductList {
  items: ProductSummary[]; total: number; page: number; pages: number; pageSize: number
  category: ProductCategory | null; ancestors: ProductCategory[]; children: ProductCategory[]
}
export interface ProductDetail extends ProductSummary {
  brand: ProductBrand; gallery: string[]; features: string[]
  variants: { model: string; price: number }[]
  properties: { label: string; value: string }[]
  attachments: { id: string; label: string; url: string }[]
  categories: ProductCategory[]; related: ProductSummary[]
}
