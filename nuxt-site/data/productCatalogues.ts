export interface ProductCatalogue {
  id: string
  title: string
  description: string
  cover: string
  pdfUrl: string
}

export interface ProductCareDetail {
  title?: string
  body: string
}

export interface ProductCareQuestion {
  id: string
  question: string
  intro?: string
  details?: ProductCareDetail[]
  steps?: string[]
  tip?: string
  image?: string
  imageAlt?: string
}

export interface ProductCareCategory {
  id: string
  label: string
  questions: ProductCareQuestion[]
}

export const PRODUCT_CATALOGUES: ProductCatalogue[] = [
  {
    id: 'sakura-kitchen-2026',
    title: '櫻花整體廚房型錄',
    description: '2026 年綜合商品版',
    cover: '/section-2/catalogues/catalog/covers/sakura-kitchen-2026.jpg',
    pdfUrl: 'https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/2026_SAKURA%20KITCHEN_DM_260806.pdf',
  },
  {
    id: 'kitchenware-2026',
    title: '五金收納／水槽／龍頭／把手型錄',
    description: '2026 年商品版',
    cover: '/section-2/catalogues/catalog/covers/kitchenware-2026.jpg',
    pdfUrl: 'https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/2026_kitchenware_DM_0730.pdf',
  },
  {
    id: 'sakura-stone-2024',
    title: '櫻花石英石型錄',
    description: '2024 年產品版',
    cover: '/section-2/catalogues/catalog/covers/sakura-stone-2024.jpg',
    pdfUrl: 'https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/DM_2024_SAKURA%20STONE.pdf',
  },
  {
    id: 'sakura-all-2026',
    title: 'SAKURA 全產品型錄',
    description: '2026 年廚電商品綜合版',
    cover: '/section-2/catalogues/catalog/covers/sakura-all-2026.png',
    pdfUrl: 'https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/2026_SAKURA-ALL_DMST_final.pdf',
  },
  {
    id: 'imported-appliances-2026',
    title: '進口廚電商品型錄',
    description: '2026 年 SVAGO／TEKA 綜合版',
    cover: '/section-2/catalogues/catalog/covers/imported-appliances-2026.png',
    pdfUrl: 'https://www.sakura-kitchenlife.com.tw/uploads/files/shares/Catalogue/SAKURASELECT_PC_2026Q3.pdf',
  },
]

export const PRODUCT_CARE_CATEGORIES: ProductCareCategory[] = [
  {
    id: 'cooking',
    label: '瓦斯爐／IH 感應爐',
    questions: [
      {
        id: 'gas-selection',
        question: '如何選購瓦斯爐？',
        intro: '請依右側圖解，依序確認瓦斯型態、爐具類型、安裝尺寸、面板材質與日常烹調需求。',
        image: '/section-2/catalogues/catalog/care/gas-selection.jpg',
        imageAlt: '瓦斯爐選購流程圖解',
      },
      {
        id: 'ih-installation',
        question: 'IH 感應爐安裝注意事項？',
        details: [
          { body: '安裝前需確認是否配置 220V 電源供應，並使用能負荷該產品電流值的電源線及電路斷電器規格。' },
          { body: '因屬高電壓、高功率產品，必須由專業合格人員或技師進行安裝。' },
          { body: '安裝前確認挖孔尺寸，並與下方櫥櫃預留足夠的散熱空間。' },
        ],
      },
      {
        id: 'gas-safety',
        question: '櫻花瓦斯爐的安全設計有哪些？',
        details: [
          { title: '時間控制安全設計', body: '開火後即啟動自動計時功能，連續使用超過 30 分鐘後會自動關火，降低忘記關火的安全隱憂。' },
          { title: '定時烹煮功能', body: '開火後設定煮食時間，時間一到即自動關火。' },
          { title: '智慧溫度監控設計', body: '防乾燒並防止油溫過熱，雙重主動偵測保護機制讓使用更安心。' },
        ],
      },
      {
        id: 'gas-ignition',
        question: '瓦斯爐點不著的問題有哪些？',
        details: [
          { title: '確認燃氣是否開啟', body: '使用前先確認天然氣或瓦斯燃氣已開啟。' },
          { title: '確認點火針是否位移', body: '點火針有固定位置，若需調整，建議由專業人員處理。' },
          { title: '清潔點火針髒汙', body: '待瓦斯爐冷卻後，以柔軟毛巾輕拭點火針。' },
          { title: '檢查開關是否損壞', body: '若仍無法點火，可先確認是否為開關故障。' },
        ],
      },
      {
        id: 'gas-cleaning',
        question: '瓦斯爐保養清潔妙招？',
        details: [
          { title: '廚房海綿', body: '倒入少量中性清潔劑後擦拭，帶走油汙與髒汙。' },
          { title: '柔軟的布', body: '使用柔軟的布擦拭，避免清潔過程產生刮痕。' },
          { title: '牙刷', body: '細毛可清潔瓦斯爐的邊角與縫隙。' },
          { title: '廚房中性清潔劑', body: '選擇蔬果、餐具清潔專用的中性清潔劑，減少化學成分殘留。' },
          { title: '小蘇打粉', body: '用牙刷沾取少量小蘇打粉，可協助清除頑固油汙。' },
        ],
      },
    ],
  },
  {
    id: 'range-hood',
    label: '除油煙機',
    questions: [
      {
        id: 'range-hood-selection',
        question: '如何選購除油煙機？',
        intro: '請依右側圖解，從吸力、靜音除味、環吸技術、智慧風控與清潔便利性評估。',
        image: '/section-2/catalogues/catalog/care/range-hood-selection.jpg',
        imageAlt: '抽油煙機挑選要點圖解',
      },
      {
        id: 'range-hood-installation',
        question: '除油煙機安裝需注意什麼？',
        intro: '請依右側圖解確認排煙管、牆面、環境與安裝高度等條件。',
        image: '/section-2/catalogues/catalog/care/range-hood-installation.jpg',
        imageAlt: '除油煙機安裝注意事項圖解',
      },
      {
        id: 'range-hood-noise',
        question: '除油煙機噪音原因有哪些？',
        intro: '若除油煙機產生噪音或異音，可優先檢查以下原因：',
        details: [
          { title: '扇葉壞損', body: '扇葉受損或變形可能在運轉時產生噪音。' },
          { title: '排煙管線', body: '確認排煙管線是否暢通、彎折或堵塞。' },
          { title: '電機與葉輪', body: '電機功率或葉輪震動異常都可能形成噪音。' },
          { title: '安裝不當', body: '機體、牆面或櫃體固定不穩會放大震動聲。' },
          { title: '密實性不佳', body: '接合處密實性不足可能影響風扇運轉。' },
        ],
      },
      {
        id: 'range-hood-cleaning',
        question: '除油煙機如何清潔？',
        steps: [
          '將中性濃縮去油劑或洗衣粉塗抹於抽油煙機表面擦拭。',
          '用螺絲起子取下濾網，浸泡於中性清潔劑溫水中，靜置 10 分鐘。',
          '用抹布輕拭油汙，再以清水清洗乾淨。',
          '將中性清潔劑噴灑於扇葉中，靜置 3 分鐘。',
          '煮一鍋熱水，將蒸汽對準扇葉並開啟油煙機，利用離心力將油汙集中於集油杯。',
          '將集油杯中的廢油倒掉，浸泡於中性清潔劑溫水中後清洗乾淨。',
          '剩餘部分以清水抹布擦拭即可。',
        ],
        tip: '濃縮去油劑或洗衣粉先以溫水稀釋，更有利於後續清潔。',
      },
    ],
  },
  {
    id: 'dish-care',
    label: '烘碗機／洗碗機',
    questions: [
      {
        id: 'dishwasher-selection',
        question: '如何選購洗碗機？',
        intro: '請依右側圖解，從安裝空間、外觀形式、容量與重點功能評估。',
        image: '/section-2/catalogues/catalog/care/dishwasher-selection.jpg',
        imageAlt: '洗碗機挑選重點圖解',
      },
      {
        id: 'dish-dryer-installation',
        question: '烘碗機安裝注意事項？',
        intro: '請依右側圖解確認安裝尺寸、電壓、櫃體固定孔與門板空間。',
        image: '/section-2/catalogues/catalog/care/dish-dryer-installation.jpg',
        imageAlt: '烘碗機安裝注意事項圖解',
      },
      {
        id: 'dishwasher-installation',
        question: '洗碗機安裝注意事項？',
        intro: '請依右側圖解確認給排水、電源、排水管與櫃體門板的安裝條件。',
        image: '/section-2/catalogues/catalog/care/dishwasher-installation.jpg',
        imageAlt: '洗碗機安裝注意事項圖解',
      },
      {
        id: 'dish-dryer-benefits',
        question: '使用烘碗機的好處有哪些？',
        details: [
          { title: '乾淨烘乾', body: '碗盤乾燥收納，降低蟲害與濕氣問題。' },
          { title: 'O₃ 臭氧殺菌', body: '加強衛生管理，保持碗盤潔淨。' },
          { title: '系統櫃體', body: '整合櫃體配置，美觀且不占用檯面空間。' },
        ],
      },
      {
        id: 'dish-dryer-safety',
        question: '烘碗機有哪些使用注意事項？',
        details: [
          { body: '機器作業時，不能直接打開。' },
          { body: '不具耐熱性的物品，請勿放入烘乾。' },
          { body: '碗盤排列整齊並保留空隙。' },
          { body: '碗盤務必清洗乾淨後再放入烘乾。' },
          { body: '注意承載重量，避免櫥櫃結構受損。' },
          { body: '積水容器需定時清理。' },
          { body: '兒童使用時需留意安全。' },
        ],
      },
    ],
  },
]
