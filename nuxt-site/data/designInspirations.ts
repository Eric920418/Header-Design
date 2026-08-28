import type {
  DesignFilterOption,
  DesignInspirationCase,
  DesignInspirationForm,
  DesignInspirationStyle,
} from '~/types/content'

export const DESIGN_FORM_OPTIONS: DesignFilterOption<DesignInspirationForm>[] = [
  { label: '全部型式', value: '' },
  { label: '一字型', value: '一字型' },
  { label: '一字型+中島', value: '一字型+中島' },
  { label: '島', value: '中島' },
  { label: 'L型', value: 'L型' },
  { label: 'L型+中島', value: 'L型+中島' },
  { label: 'ㄇ字型', value: 'ㄇ字型' },
]

export const DESIGN_STYLE_OPTIONS: DesignFilterOption<DesignInspirationStyle>[] = [
  { label: '全部風格', value: '' },
  { label: '鄉村風', value: '鄉村風' },
  { label: '美式古典風', value: '美式古典風' },
  { label: '工業風', value: '工業風' },
  { label: '日式簡約風', value: '日式簡約風' },
  { label: '北歐風', value: '北歐風' },
  { label: '現代風', value: '現代風' },
]

export const DESIGN_INSPIRATION_CASES: DesignInspirationCase[] = [
  {
    slug: 'case10',
    title: '袁艾菲與老公結婚二周年甜蜜獻禮！',
    storeName: '櫻花整體廚房 安康店',
    cover: '/section-3/cases/case10/case10_content_asset_03_2026.jpg',
    coverAlt: '袁艾菲夫妻與工業風一字型整體廚房',
    form: '一字型',
    style: '工業風',
    detailRoute: '/gallery/case10?from=inspiration',
  },
  {
    slug: 'case56',
    title: '老宅廚房改頭換面，甜蜜夫妻的質感北歐風廚房',
    storeName: '櫻花整體廚房 承德店',
    cover: '/section-3/cases/case56/case56_content_asset_04_2026.jpg',
    coverAlt: '明亮北歐風一字型整體廚房與設計師',
    form: '一字型',
    style: '北歐風',
    detailRoute: '/gallery/case56?from=inspiration',
  },
  {
    slug: 'case35',
    title: '量身打造型男夢想廚房！輕奢中島展社交魅力',
    storeName: '櫻花整體廚房 松竹店',
    cover: '/section-3/cases/case35/case35_content_asset_11_2026.jpg',
    coverAlt: '現代風中島整體廚房與設計師',
    form: '中島',
    style: '現代風',
    detailRoute: '/gallery/case35?from=inspiration',
  },
]
