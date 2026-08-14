export interface ServiceStep {
  number: string
  title: string
  icon: string
  description: string[]
  expandedDescription?: string[]
  emphasized?: boolean
}

export interface FaqItem {
  question: string
  answer: string
}

export interface FaqGroup {
  id: string
  title: string
  items: FaqItem[]
}

export interface BrandFamily {
  id: string
  title: string
  englishTitle: string
  image: string
}

export interface BrandAdvantageBenefit {
  id: string
  number: string
  englishTitle: string
  title: string
  description: string
  image: string
}

export interface BrandPavilion {
  id: 'taipei' | 'taichung' | 'kaohsiung'
  name: string
  address: string
  hours: string
  image: string
  alt: string
}

export interface BrandHistoryItem {
  year: '1978' | '1992' | '2016' | '2020'
  templateQuestion: string
  summary: string
  description: string
  image: string
  icon: string
}

export interface BrandValueItem {
  id: string
  eyebrow: string
  title: string
  description: string
  image: string
}

export interface BrandIdentityItem {
  id: string
  title: string
  image: string
}

export interface StoreContact {
  name: string
  hours?: string
  phone?: string
  address?: string
  reservationUrl?: string
  lineUrl?: string
  mapUrl?: string
}

export interface CaseMeta {
  style?: string
  color?: string
  series?: string
  form?: string
  size?: string
  kitchenArea?: string
  budget?: string
  countertop?: string
  household?: string
  designer?: string
}

export interface CaseArticleLink {
  label: string
  url: string
}

export interface CaseArticleBlock {
  title?: string
  paragraphs: string[]
  images?: string[]
  imageLayout?: 'single' | 'pair'
  links?: CaseArticleLink[]
}

export interface StoreCaseSummary {
  slug: 'case10' | 'case56' | 'case35'
  title: string
  storeName: string
  designer: string
  region: string
  city: string
  address: string
  cover: string
  reservationUrl: string
}

export interface StoreCaseDetail extends StoreCaseSummary {
  images: string[]
  meta?: CaseMeta
  contact?: StoreContact
  article?: CaseArticleBlock[]
}

export type DesignInspirationForm = '一字型' | 'L型' | 'ㄇ字型' | '中島' | '其他'

export type DesignInspirationStyle = '鄉村風' | '美式古典風' | '工業風' | '日式簡約風' | '北歐風' | '現代風'

export interface DesignFilterOption<T extends string = string> {
  label: string
  value: '' | T
}

export interface DesignInspirationCase {
  slug: StoreCaseSummary['slug']
  title: string
  storeName: string
  cover: string
  coverAlt: string
  form: DesignInspirationForm
  style: DesignInspirationStyle
  detailRoute: string
}

export interface KitchenGuideArticle {
  id: 'systemcabinet' | 'kitchen-outlet-planning' | 'kitchen-island-table'
  publishedAt: string
  displayDate: string
  categoryLabel: string
  title: string
  excerpt: string
  cover: string
  legacyUrl: string
  detailRoute?: string
}

export type NewsCategory = 'activities' | 'latest' | 'video'

export interface NewsArticleSummary {
  id: string
  category: NewsCategory
  categoryLabel: string
  publishedAt: string
  displayDate: string
  title: string
  excerpt: string
  cover: string
  legacyPath: string
  recentRank?: number
}

export interface ActivityArticleImage {
  src: string
  alt: string
}

export interface ActivityArticleLink {
  label: string
  url: string
}

export interface ActivityArticleSection {
  heading?: string
  paragraphs?: string[]
  bullets?: string[]
  images?: ActivityArticleImage[]
  links?: ActivityArticleLink[]
  note?: boolean
}

export interface ActivityArticleDetail {
  id: string
  slug: string
  sections: ActivityArticleSection[]
}

export type LatestArticleSection = ActivityArticleSection

export interface LatestArticleDetail {
  id: string
  slug: string
  cover: ActivityArticleImage
  sections: LatestArticleSection[]
}

export interface MediaVideoDetail {
  id: string
  slug: string
  videoId: string
  paragraphs: string[]
  caseLink: ActivityArticleLink
}
