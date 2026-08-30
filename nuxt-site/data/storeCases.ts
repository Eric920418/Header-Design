import type { StoreCaseDetail, StoreCaseSummary } from '~/types/content'

export const regionCities: Record<string, string[]> = {
  北部: ['臺北市', '新北市', '基隆市', '新竹市', '桃園市', '新竹縣', '宜蘭縣'],
  中部: ['臺中市', '苗栗縣', '彰化縣', '南投縣', '雲林縣'],
  南部: ['高雄市', '臺南市', '嘉義市', '嘉義縣', '屏東縣', '澎湖縣'],
  東部: ['花蓮縣', '臺東縣'],
  離島: ['金門縣', '連江縣'],
}

const caseImages = (slug: 'case10' | 'case56' | 'case35', start: number, end: number) =>
  Array.from({ length: end - start + 1 }, (_, index) => {
    const number = String(start + index).padStart(2, '0')
    return `/section-3/cases/${slug}/${slug}_content_asset_${number}_2026.jpg`
  })

const mapSearchUrl = (address: string) =>
  `https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(address)}`

const case10Images = caseImages('case10', 3, 10)
const case56Images = caseImages('case56', 3, 12)
const case35Images = caseImages('case35', 3, 11)
const case10Review = '新家使用櫻花系統廚具，我們還自費換購洗碗機。接待的紀先生專業又親切，來安裝時跟技師合作無間很迅速就完成！完工後也很熱心回答各種疑問，還會溫馨提醒該注意的眉角，值得五星好評'

export const storeCases: StoreCaseDetail[] = [
  {
    slug: 'case10',
    title: '袁艾菲與老公結婚二周年甜蜜獻禮！讓愛增溫的法寶，藏在簡約的櫻花美廚細節裡',
    storeName: '櫻花整體廚房 安康店',
    designer: '陳彥君',
    region: '北部',
    city: '新北市',
    address: '23154 新北市新店區安德街58號1樓',
    cover: '/section-3/store-ankang.jpg',
    reservationUrl: 'https://pse.is/95cq3r',
    images: case10Images,
    meta: {
      style: '工業風',
      color: '單色系(非白色)',
      series: '潮派廚房',
      form: '一字型',
      size: '200-300CM',
      kitchenArea: '2-4坪',
      budget: '35萬以上',
      countertop: '櫻花石',
      designer: '陳彥君',
    },
    contact: {
      name: '櫻花整體廚房 安康店',
      hours: '週一～週六 09:30~21:00',
      phone: '02- 8666 6958',
      address: '23154新北市新店區安德街58號1樓',
      reservationUrl: 'https://pse.is/95cq3r',
      lineUrl: 'https://lin.ee/2px4nRA',
      mapUrl: 'https://pse.is/9edmvk',
    },
    reviews: [case10Review, case10Review, case10Review],
    article: [
      {
        paragraphs: [
          '要讓新婚夫妻持續甜蜜升溫，可從味蕾靈感下功夫，而廚房設計的細節就像展開中的旅行地圖，讓兩人總有說不完的話題、源源不絕的創意，更紀錄著美味記憶。融入工業風格的「潮派廚房」設計概念，從動線、材質、家電選配到五金收納，創造出簡約風尚與實用兼備的複合式美廚，吻合兩人世界的生活品味，成為情感恆溫的獨家秘方！',
        ],
        images: [case10Images[1]!, case10Images[2]!],
        imageLayout: 'pair',
      },
      {
        title: '獨家黑色櫻花石英石中島與深色細節 體現極簡品味',
        paragraphs: [
          '將隔間牆拆除，打造開放式廚房，而為了讓整體的簡約摩登風格更到位，從事多年廚房設計的陳彥君設計師挑選獨家櫻花石英石黑色檯面、不鏽鋼美背的中島為核心，搭配深灰、霧面陶烤門板，再搭佐黑銀色系質感的櫻花三機配備，讓整體氛圍一氣呵成。',
        ],
      },
      {
        title: '動線、檯面高度與收納 創造化繁為簡的廚藝生活',
        paragraphs: [
          '廚房以中島為核心，透過口字形動線規劃，讓檯面兩側擁有流暢走道，滿足料理過程中進出廚房的彈性需求；且順著室內結構，於牆邊空間規劃30cm邊櫃，做為小家電、咖啡機及沖泡飲品的空間。此外，更貼心考量人體工學，訂製符合老魚身高的工作檯、中島高度，讓愛做菜的他不必辛苦彎腰駝背。',
        ],
      },
      {
        title: '客製化的廚房設計 櫻花廚藝深深打動消費者的心',
        paragraphs: [
          '從前期溝通生活需求、風格喜好、機能等細節，到3D立體圖秀出真實情境，一直到最後完工，櫻花廚藝生活館以無微不至的貼心服務，替兩人實現純粹、簡約的美味廚房。',
        ],
        images: [case10Images[6]!, case10Images[7]!],
        imageLayout: 'pair',
        links: [
          {
            label: '了解更多工業風廚房：工業風廚房設計好看嗎？3大案例推薦告訴你，夢想廚房就在眼前！',
            url: 'https://www.sakura-kitchenlife.com.tw/knowledge/design/industrial-loft-style-kitchen',
          },
        ],
      },
    ],
  },
  {
    slug: 'case56',
    title: '老宅廚房改頭換面，甜蜜夫妻的質感北歐風廚房',
    storeName: '櫻花整體廚房 承德店',
    designer: '陳冠瑋',
    region: '北部',
    city: '臺北市',
    address: '111 臺北市士林區承德路四段238號',
    cover: '/section-3/store-chengde.jpg',
    reservationUrl: 'https://pse.is/95cq3r',
    images: [case56Images[1]!, case56Images[0]!, ...case56Images.slice(2)],
    meta: {
      style: '北歐風',
      color: '單色系(非白色)',
      series: '其他',
      form: '一字型',
      size: '400CM以上',
      kitchenArea: '2-4坪',
      budget: '35萬以上',
      countertop: '櫻花石',
      designer: '陳冠瑋',
    },
    contact: {
      name: '櫻花整體廚房 承德店',
      hours: '週一～週六 10:30~21:00',
      phone: '02- 2883 9919',
      address: '111臺北市士林區後港里承德路四段238號',
      reservationUrl: 'https://lin.ee/50meLfG',
      lineUrl: 'https://lin.ee/50meLfG',
      mapUrl: mapSearchUrl('臺北市士林區後港里承德路四段238號'),
    },
    reviews: [case10Review, case10Review, case10Review],
    article: [
      {
        paragraphs: [
          '房價高漲的環境下，老屋成為許多購屋族考慮的選項之一，透過裝修創造老屋新生，打造出合適的居住環境。本案為生活努力打拼的屋主夫妻，選擇翻修屋齡 40 多年的老屋，決定釋放封閉狹小的廚房空間，讓機能配置更加彈性！SAKURA KITCHEN承德店的陳冠瑋設計師，充分了解屋主夫妻的需要，透過大數據資料庫經驗客製化 3D 圖面，從挑選色彩、規劃中島機能、整合收納系統及選擇家電款式等，一點一滴完成夢想中的北歐質感廚房。',
        ],
        images: [case56Images[4]!, case56Images[2]!],
        imageLayout: 'pair',
      },
      {
        title: '改造老宅傳統廚房 格局動線機能一次到位',
        paragraphs: [
          '屋主夫妻回憶當時的老宅廚房，設備老舊又封閉，煮菜熱氣油煙都悶在裡面，亦沒有充足的備料和收納空間。重新改為一字型廚房，釋放隔間加入中島設計，並依照需求及使用，將格局、動線、收納配置進行優化，翻新一次到位，打造合適夫妻兩人生活的烹飪環境，無論是日常下廚或是好友聚會使用都十分順手。',
        ],
      },
      {
        title: '完美結合奶茶色居家 廚房搭佐淺灰色質感門板',
        paragraphs: [
          '因為開放式廚房凸顯視覺風格的重要，整體廚房的顏色材質必須與居家風格相互搭配！夫妻倆為了貫徹理想中的簡約北歐風調性，選擇淺灰色的絲絨觸感門板，霧面設計不僅擁有清新質感，再搭配上白色中島與黑色的結合式把手，在簡約中創造溫暖愜意的氛圍。',
        ],
      },
      {
        title: '貼心加深中島檯面 為居家時光甜蜜增溫',
        paragraphs: [
          '中島是開放式廚房的靈魂，更是這對夫妻生活中的核心場域。為了讓中島滿足多功能使用，陳冠瑋設計師特別加深檯面寬度，增添水槽與雙向收納櫃，實現清潔與實用的完美結合，省下打掃清理的心力，讓夫妻每天下班回到家，都能在此用餐料理，分享生活為彼此打氣，成為家中最溫馨甜蜜的地方！',
        ],
      },
      {
        title: '抽屜收納規劃 分層分類讓食器取用一目瞭然',
        paragraphs: [
          '完美化解收納不足的問題，不僅在中島下方規劃收納，料理檯下也依據不同廚房用品加入SAKURA靜音緩衝抽屜設計，將餐具食器、碗盤鍋具分類收納，讓廚房整潔有序，收納取用效率大大提升，側邊更因應零食、調味料瓶罐的收納，特別規劃側拉籃地櫃及拉籃高櫃，避免調味品堆積在檯面上的窘境，真正實現輕鬆流暢的廚房體驗。',
        ],
      },
      {
        title: '廚電符合生活烹飪情境 相伴夫妻精彩生活',
        paragraphs: [
          '為了能符合夫妻倆的日常多種烹飪習慣，選用svago橫式雙口IH感應爐，讓大火煎炒或是慢燉細煮，都能滿足不同火候的需求。而針對開放式廚房最惱人的油煙問題，陳冠瑋設計師為屋主建議挑選高效能的SAKURA歐化渦輪變頻除油煙機，吸力強勁且運行安靜，能快速排出油煙，讓廚房始終保持清新舒適的空氣環境，提供夫妻在忙碌的都市生活中，依然能隨時享受愜意的烹飪時光。',
        ],
        links: [
          { label: 'DR7786B歐化渦輪變頻除油煙機', url: 'https://www.sakura.com.tw/Product/Content/7989' },
          { label: 'VEG2380W 橫式雙口IH感應爐', url: 'https://www.svago-kitchens.com.tw/Product/View/81845' },
        ],
      },
    ],
  },
  {
    slug: 'case35',
    title: '量身打造型男夢想廚房！輕奢中島展社交魅力',
    storeName: '櫻花整體廚房 松竹店',
    designer: '沈志剛',
    region: '中部',
    city: '臺中市',
    address: '406臺中市北屯區軍功里松竹路一段763號',
    cover: '/section-3/store-songzhu.jpg',
    reservationUrl: 'https://lin.ee/xIPto4o',
    images: case35Images,
    meta: {
      style: '現代風',
      color: '石紋色',
      series: '潮派廚房',
      form: 'L型+中島',
      size: '400CM以上',
      kitchenArea: '4坪以上',
      budget: '35萬以上',
      countertop: '櫻花石',
      designer: '沈志剛',
    },
    contact: {
      name: '櫻花整體廚房 松竹店',
      hours: '週一～週六 09:30~21:00',
      phone: '04-2239 7068',
      address: '406臺中市北屯區軍功里松竹路一段763號',
      reservationUrl: 'https://lin.ee/xIPto4o',
      lineUrl: 'https://lin.ee/xIPto4o',
      mapUrl: mapSearchUrl('臺中市北屯區軍功里松竹路一段763號'),
    },
    reviews: [case10Review, case10Review, case10Review],
    article: [
      {
        paragraphs: [
          '受到歐美文化與後疫情時代的催化，單一功能的傳統封閉式廚房逐漸走入歷史，取而代之的是具備多功能的開放式廚房設計，將單純的料理空間跨足成居家交誼場域。',
          '因為朋友介紹而接觸到SAKURA KITCHEN櫻花整體廚房台中松竹店，在深入了解屋主使用習慣、以及對廚房空間的想像後，以輕奢華現代風格設計作為廚房主題，與住宅風格自然接軌。開放式L型廚具囊括了實用新型的廚電設備與齊備的收納，各國料理、中西式烹飪等各種需求都能滿足。除此之外更替屋主訂製一座中島化廚房空間為居家交誼場域，讓料理不再是一件孤獨的事情，不僅家人可以自然參與，親友來訪時廚房更取代了客廳，創造自然互動的社交場所，也實踐了屋主理想中的夢想廚房。',
        ],
        images: [case35Images[1]!, case35Images[2]!],
        imageLayout: 'pair',
      },
      {
        title: '清水模與泥灰岩的風格搭配，呼應屋主獨特性格空間',
        paragraphs: [
          '性格爽朗的男屋主在規劃透天新居廚房時，腦海中浮現的是電影和美劇裡重複出現的水泥質感的大器廚房。對於風格有明確想法但卻不知道如何化為現實，多虧了櫻花整體廚房替屋主完美設計運用搭配清水模＆泥灰岩的風格搭配，將屋主腦內的畫面完美呈現出來。因應喜歡灰白色調、帶有個性的廚房設計，店經理沈志剛挑選清水模門板作為廚房主調，擬真紋理與略帶凹凸的觸感非常合男屋主需求，大面積使用上也不會單調。門板紋理也不會過深造成卡油污，且具有耐磨、耐刮特性、易清潔保養，簡單清水擦拭就能隨時保持廚房整潔。原本男屋主想在中島下鋪貼鏡面，但經過櫻花整體廚房專業建議改為泥灰岩板材，除油煙機底板也運用同樣材質做跳色設計，展現灰階色變化，是讓男屋主最滿意的地方。',
        ],
      },
      {
        title: '專屬訂製多功能中島，廚房升級為社交場域',
        paragraphs: [
          '屋主舊宅是開放式廚房但沒有配置中島，這次在規劃時就是要一圓中島夢！對於男屋主來說擁有中島廚房是希望能打造與朋友聚會的社交場域。依照需求訂製110公分高的廚房中島，符合屋主身高備料洗滌不彎腰，高於一般標準的中島更顯氣派，寬闊尺度獨家櫻花石英石檯面暖白基底帶著閃石質感極佳外，克服造型切角，一路由檯面延伸到中島立面，整體質感瞬間提升。中島對於屋主來說是家裡最重要的社交場域，除了視覺氣派之外，機能配置上也要讓朋友感受賓至如歸。超寬敞的中島鑲嵌大尺寸不鏽鋼水槽能滿足泡茶、洗水果等生活需求。中島配置收納抽屜，方便收納輕食用的碗盤；外側可擺放放茶葉、茶具。',
          '機能與美型兼具的中島對屋主來說是比起客廳是更舒適的社交場域不論是週末廣邀好友來家裡開料理趴，或是想靜靜地與親友談天品茶，都能全然滿足。另外，中島內側除了鑲嵌烤箱更在側邊設定了插座迴路，想要簡單輕食料理、自己吃個小火鍋都非常方便。',
        ],
      },
      {
        title: '順手收納藏於無形，齊備廚房電器滿足各種需求',
        paragraphs: [
          '作為一個氣派舒適的社交場域，在機能配置上當然不能馬虎！對於下廚沒有太多概念的屋主，多虧了櫻花整體廚房專業建議，首先針對屋主過去開放式廚房的使用經驗，特別挑選歐化除油煙機，不僅外型簡約俐落、抽油煙效率強大，同時維持高效吸淨油煙，大幅改善開放式廚房擔心的油煙問題。另外，二口雙炫火玻璃檯面爐質感精緻，煲湯與煎煮雙管齊下，讓屋主朋友都躍躍欲試想試用新落成的絕美廚房。',
          '廚房的機能還不僅如此，電器櫃整合烤箱與微波爐，並預留上方大空間與下方抽屜櫃，可以收納廚房備品與大型鍋具，將收納分門別類，整體美觀節省空間。另外，烹飪區爐檯下方的不繡鋼圍籃地櫃設計，透氣性佳，是聚會使用的大型鍋具及餐盤的收納幫手。狹長側拉籃收放各式瓶罐醬料，讓整體檯面乾淨不凌亂，貼心的收納設計給屋主滿滿的驚喜。為了應付朋友聚會後大量的杯具與碗盤，聽從店經理建議選配櫻花全平面玻璃觸控落地式烘碗機，能讓洗好的碗盤殺菌烘乾，同時也是另一個帶機能性的碗盤收納空間。',
        ],
      },
      {
        title: '廚具領導品牌，讓屋主使用安心有保障',
        paragraphs: [
          '屋主表示，從他媽媽那一輩就一直是使用櫻花廚具，對櫻花品牌的信賴感已經悄悄植入心底。這次委託櫻花整體廚房台中松竹店，除了將屋主落實夢想的風格中島廚房，在材質運用、風格搭配都超越屋主期待。收納機能面向更做了全方位考量，讓屋主也能感受到SAKURA KITCHEN對於客戶的用心，在預算內達到最符合理想的設計。SAKURA KITCHEN 櫻花整體廚房作為全方位廚房解決專家，一站式整合品牌及服務，廚房成為喜愛聚會的屋主與親友相聚最佳地點，滿足自在生活美好時刻。',
          '轉載：2023年設計家',
        ],
        images: [case35Images[8]!],
        imageLayout: 'single',
        links: [
          {
            label: '了解更多廚房大小事：2024廚房配件品牌推薦：櫻花卓越出品設計，搭配五金品質有保障！',
            url: 'https://www.sakura-kitchenlife.com.tw/knowledge/design/knowledge34',
          },
          { label: '馬上申請免費丈量改裝家中廚房！', url: 'https://www.sakura-kitchenlife.com.tw/measuring' },
          { label: '查詢離我家最近的門市！', url: 'https://www.sakura-kitchenlife.com.tw/store/location' },
        ],
      },
    ],
  },
]

export const storeCaseSummaries: StoreCaseSummary[] = storeCases.map(({ images: _images, meta: _meta, contact: _contact, article: _article, ...summary }) => summary)

export const getStoreCase = (slug: string) => storeCases.find(item => item.slug === slug)
