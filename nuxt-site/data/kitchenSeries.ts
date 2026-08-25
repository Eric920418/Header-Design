export type KitchenSuite = {
  id: string
  name: string
  images: string[]
  headlines: [string, string]
  descriptions: string[]
  equipment: string[]
}

export type KitchenFinish = {
  code: string
  name: string
  image: string
}

export type KitchenEquipment = {
  model: string
  name: string
  image: string
  route: string
}

export type KitchenCase = {
  title: string
  excerpt: string
  image: string
  url: string
}

export type KitchenSeriesPageData = {
  slug: string
  name: string
  heroSlides: string[]
  intro: {
    title: string
    paragraphs: string[]
  }
  suites: KitchenSuite[]
  finishes: KitchenFinish[]
  equipment: KitchenEquipment[]
  cases: KitchenCase[]
}

const base = '/section-1/brand-series/ai-kitchen'

export const AI_KITCHEN_PAGE: KitchenSeriesPageData = {
  slug: 'aikitchen',
  name: 'AI Kitchen',
  heroSlides: [
    `${base}/hero/ai-kitchen-01.jpg`,
    `${base}/hero/ai-kitchen-02.jpg`,
    `${base}/hero/ai-kitchen-03.jpg`,
  ],
  intro: {
    title: '突破未來格局 開啟廚房智高點',
    paragraphs: [
      'SAKURA AI KITCHEN，不僅是一個烹飪的場所，更是廚房的未來',
      '一個包含智能、創新美學和便利性的烹飪聖地',
      '翻轉廚房烹飪體驗，開啟AI KITCHEN新淨界',
    ],
  },
  suites: [
    {
      id: 'i-fun',
      name: 'i Fun',
      images: [`${base}/suites/i-fun-01.jpg`, `${base}/suites/i-fun-02.jpg`],
      headlines: ['將AI科技在空間規劃體現', '小廚房大智慧，輕鬆運用每一處細節'],
      descriptions: [
        '無接觸AI技術，重新定義現代科技美廚',
        '揮手識別科技，輕鬆操控廚房電器及廚下光氛、實現優雅煮食',
        '純粹素雅基調設計，營造清新療癒的舒適氛圍',
      ],
      equipment: [
        'R7352 近吸除油煙機－近吸隱藏系列（半隱藏）',
        'G2522 二口小面板易清檯面爐',
        'VE7545 半嵌式45cm自動開門洗碗機',
        'P0771 生飲淨水器',
        'Q7580 殺菌烘碗機',
      ],
    },
    {
      id: 'i-chef',
      name: 'i Chef',
      images: [`${base}/suites/i-chef-01.jpg`, `${base}/suites/i-chef-02.jpg`],
      headlines: ['簡約設計結合AI科技，滿足輕鬆料理', '呈現廚藝佳餚的品味，共享家的溫馨'],
      descriptions: [
        'AI精準掌握料理，專注沉潛美饌之藝',
        '智慧廚電便利質感，美好生活悉心打造',
        '簡約亮白輔以櫃體線條，兼顧實用機能收納設計巧思',
      ],
      equipment: [
        'DR7788 AI除油煙機－渦輪變頻 環吸系列',
        'G2926G 智能雙炫火二口玻璃檯面爐',
        'P0585 廚下SQC雙溫淨熱飲',
        'E7683 半嵌式自動開門洗碗機',
      ],
    },
    {
      id: 'i-loft-chic',
      name: 'i Loft Chic',
      images: [`${base}/suites/i-loft-chic-01.jpg`, `${base}/suites/i-loft-chic-02.jpg`],
      headlines: ['AI科技與時尚設計融為一體', '每一處細節體現智慧與時尚，簡單愜意'],
      descriptions: [
        'AI智慧蘊涵質感，實現時尚煮食生活',
        '光感金屬板材、深色金屬元件，打造個性居家氛圍',
        '跳脫傳統框架的自由空間，自在享受多元不拘的生活樣貌',
      ],
      equipment: [
        'DR7796 歐化除油煙機－渦輪變頻 AI風控系列',
        'G2929G 智能雙炫火精控爐',
        'P0531 廚下RO雙溫淨熱飲',
        'E8891 嵌入式微波蒸烤箱',
        'E7783 全嵌式自動開門洗碗機',
      ],
    },
    {
      id: 'i-premium',
      name: 'i Premium',
      images: [`${base}/suites/i-premium-01.jpg`, `${base}/suites/i-premium-02.jpg`],
      headlines: ['以AI科技融入輕奢風格設計，客餐廚界線不侷限', '氣派社交宴請、私密親友小聚怡然盡興'],
      descriptions: [
        '智慧科技重新詮釋餐廚體驗，展現無可取代的尊榮氣度',
        'AI感應閘門櫃烘托品味蒐藏的精品質感，詮釋高端氣息',
        '無論氣派社交宴請、私密親友小聚都優雅盡興，怡然自在',
      ],
      equipment: [
        'DR7396 AI除油煙機－近吸系列',
        'G2928G 智能雙炫火二口玻璃檯面爐',
        'P0531 廚下RO雙溫淨熱飲',
        'E8891 嵌入式微波蒸烤箱',
        'E7683 半嵌式自動開門洗碗機',
      ],
    },
  ],
  finishes: [
    { code: 'D0751', name: '齋浦爾紅', image: `${base}/finishes/d0751.jpg` },
    { code: 'D0754', name: '摩洛哥藍', image: `${base}/finishes/d0754.jpg` },
    { code: 'D0750', name: '湖水綠', image: `${base}/finishes/d0750.jpg` },
    { code: 'D0718', name: '倫敦灰', image: `${base}/finishes/d0718.jpg` },
    { code: 'D0032', name: '科斯白', image: `${base}/finishes/d0032.jpg` },
    { code: 'D0720', name: '亞光黑', image: `${base}/finishes/d0720.jpg` },
  ],
  equipment: [
    { model: 'DR7396', name: '近吸除油煙機－渦輪變頻 AI風控系列', image: `${base}/equipment/dr7396.png`, route: '/products/sakura/range-hood/near-suction/dr7396' },
    { model: 'G2926G', name: '智能雙炫火二口玻璃檯面爐', image: `${base}/equipment/g2926g.png`, route: '/products/sakura' },
    { model: 'P0531', name: '廚下RO雙溫淨熱飲', image: `${base}/equipment/p0531.png`, route: '/products/sakura' },
    { model: 'E8891', name: '嵌入式微波蒸烤箱', image: `${base}/equipment/e8891.png`, route: '/products/sakura' },
    { model: 'E7683', name: '半嵌式自動開門洗碗機', image: `${base}/equipment/e7683.png`, route: '/products/sakura' },
    { model: 'E3625', name: '嵌入式電器收納櫃', image: `${base}/equipment/e3625.png`, route: '/products/sakura' },
  ],
  cases: [
    {
      title: '巫苡萱規劃新家廚房 小L型廚房 × 中島延伸機能',
      excerpt: '在規劃新家的過程中，廚房往往是最需要細心思考的空間。這次節目主持人巫苡萱在打造新家的廚房時，也希望能找到一個既符合生活習慣，又能兼顧美感與機能的整體廚房方案。',
      image: `${base}/cases/wu-yixuan.png`,
      url: 'https://www.sakura-kitchenlife.com.tw/gallery/case62_kitchen_expert',
    },
    {
      title: '重現兒時回憶，凱希與爸爸共築夢想廚居',
      excerpt: '藝人徐凱希從小到大家中使用的一直是櫻花產品，因此在耳濡目染之下成為了SAKURA KITCHEN櫻花整體廚房的忠實粉絲。',
      image: `${base}/cases/cathy-hsu.jpg`,
      url: 'https://www.sakura-kitchenlife.com.tw/gallery/case49',
    },
    {
      title: '現代親子共伴設計，體貼母親的暖心廚居',
      excerpt: '30 多歲的屋主廖先生從事建築相關工作，在室內設計師的介紹下，他跟媽媽來到櫻花整體廚房承德店諮詢。廖媽媽希望能夠擁有ㄇ字型的開放式廚房，所以陳冠瑋設計師以「家的核心」為理念，規劃足夠的備餐檯面、好取用的收納櫃、開放式的烹飪空間，讓她下廚時既方便又能跟家人開心共處。',
      image: `${base}/cases/modern-family.jpg`,
      url: 'https://www.sakura-kitchenlife.com.tw/gallery/case47',
    },
  ],
}
