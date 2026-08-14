export interface KitchenGuideDetailImage {
  src: string
  alt: string
}

export interface KitchenGuideDetailPoint {
  title: string
  paragraphs: string[]
  image?: KitchenGuideDetailImage
  url?: string
}

export interface KitchenGuideDetailSection {
  heading?: string
  paragraphs?: string[]
  image?: KitchenGuideDetailImage
  points?: KitchenGuideDetailPoint[]
}

export interface KitchenGuideDetailLink {
  label: string
  url: string
}

export interface KitchenGuideDetail {
  slug: 'kitchen-outlet-planning' | 'knowledge31'
  articleId: 'kitchen-outlet-planning' | 'kitchen-island-table'
  cover: KitchenGuideDetailImage
  sections: KitchenGuideDetailSection[]
  video?: {
    id: string
    title: string
    cover: string
  }
  closing: string
  links: KitchenGuideDetailLink[]
}

export const KITCHEN_GUIDE_DETAILS: KitchenGuideDetail[] = [
  {
    slug: 'kitchen-outlet-planning',
    articleId: 'kitchen-outlet-planning',
    cover: {
      src: '/section-1/kitchen-guide/kitchen-outlet/overview.jpg',
      alt: '吧檯與中島下方具備完整插座配置的現代廚房',
    },
    sections: [
      {
        paragraphs: [
          '廚房插座的多寡，關乎到我們電器產品的放置與使用習慣。無論是冰箱、微波爐、烤箱、氣炸鍋等等，都會需要廚房擁有完整的插座設施才能完美使用。而在廚房插座規劃不足的情況下，可能會造成插座不夠用、電線纏繞在一起等困擾。如果你也想要讓家中廚房擁有完美的設計規劃，那就要知道廚房插座該如何配置才能讓你在廚房烹飪更得心應手！',
        ],
        image: {
          src: '/section-1/kitchen-guide/kitchen-outlet/overview.jpg',
          alt: '廚房插座設計規劃建議',
        },
      },
      {
        heading: '廚房插座設計重要嗎？該如何規劃？',
        paragraphs: [
          '廚房插座的設計規劃，對於許多人來說可能會以為不起眼，但實際上卻是決定廚房使用便利性的重大關鍵因素之一。隨著各種廚房電器的增加，像是：電鍋、微波爐、氣炸鍋、烤箱、咖啡機等等，都會需要使用到電源插座。這時，若廚房插座的位置或數量規劃不足時，就可能會造成電線纏繞、不方便使用電器，甚至還存在著使用安全的疑慮。',
          '想要在廚房安全地使用所有電器？那就要事先做好廚房插座的設計，必須規劃出足夠使用的插座數量，這樣才能滿足你的日常所需。現在，就讓我們來看看廚房插座設計規劃3步驟：',
        ],
        points: [
          {
            title: 'STEP1. 日常習慣 列入考量',
            paragraphs: ['基本上，想要完整的設計出廚房插座的話，就要優先考量自己會在廚房中會使用到哪些電器產品。一般來說，冰箱、烘碗機、洗碗機已經是常見的基本電器配備，若再加上烤箱、微波爐、氣炸鍋、咖啡機等等，那就要想一下獨立的插座應該要有幾個。建議常用的電器商品就應該一個電器一個插座，而比較不常使用的電器，則可以考慮共用一個插座喔！'],
          },
          {
            title: 'STEP2. 高度設計 方便使用',
            paragraphs: [
              '廚房插座除了要考量日常使用習慣以外，也要想一下其電器擺放的位置高度是否有符合使用需求。以常見的微波爐、咖啡機來說，就要以順手且位置在操作區域附近的高度為主，這樣才不會造成使用上的不便。',
              '試想一下，在睡眼惺忪的早晨中，僅需在廚房隨手一插，就可立即使用咖啡機泡出香濃的咖啡提神，精神抖擻的開啟一天美好的工作行程。只要廚房插座高度有設計好，日常使用就是如此的輕鬆又方便。',
            ],
          },
          {
            title: 'STEP3. 安全至上 避開危險',
            paragraphs: ['在設計廚房插頭時，務必要避開水槽與容易積水的地方。畢竟廚房是會高度使用到水的場域，若沒有將插頭設計避開的話，就容易造成危險憾事發生。亦可採用防水設計的插座，這樣就不怕被水潑到造成危險。'],
          },
        ],
      },
      {
        heading: '廚房插座安裝注意事項有哪些？',
        paragraphs: ['基本上，廚房插座安裝絕對不是僅有打洞、接線這麼簡單，是必須要考量到長遠的使用安全與便利性才行。因此，廚房插座設計規劃好後，其安裝也要注意以下3大事項：'],
        points: [
          {
            title: '1. 電路負荷 是否足夠',
            paragraphs: ['由於現代廚房電器同時使用的話，可能會造成高功率問題產生。舉例來說，電磁爐、烤箱、微波爐同時使用時，就要確保廚房插座的電路是否可以同時承受這些負荷。當然，若有獨立的迴路來供應高功率電器，更可安全的避免電路過載問題發生。'],
          },
          {
            title: '2. 防水防潮 不怕意外',
            paragraphs: ['廚房插座安裝裝置，要以防水、防潮為主，這樣才可以有效避免濺水造成的短路或漏電危機。當然，在廚房插座配置上就要注意遠離火源、水源等，擁有安全的防水措施後使用電器插座時就不怕有意外發生。'],
          },
          {
            title: '3. 專業安裝 定期檢查',
            paragraphs: ['廚房插座畢竟關乎到水、電的問題，故還是要交由專業的人員幫忙處理才安全。並且要記得定期檢查電路系統，這樣才能隨時掌握廚房插座是否有使用上的隱憂。以櫻花集團來說，擁有永久免費廚房健檢服務，具有電器配備電路系統檢查服務，讓你在使用廚房插座上既安心又放心。'],
          },
        ],
      },
      {
        heading: '廚房插座設計案例介紹',
        points: [
          {
            title: '夢想廚房 親子共樂',
            url: 'https://www.sakura-kitchenlife.com.tw/gallery/case50',
            image: {
              src: '/section-1/kitchen-guide/kitchen-outlet/family-kitchen.jpg',
              alt: '夢想廚房親子共樂的廚房插座設計案例',
            },
            paragraphs: ['為了滿足屋主對於廚房電器的要求，設計師在設計規劃時就先在吧檯內側、中島下方安裝了許多插座。無論是要同時使用烤箱、微波爐，或是想要在廚房幫手機充個電，都不用擔心有插座不足的問題產生。如此便利性十足的廚房，讓屋主夫妻更熱愛享受廚房帶來的生活便利性。'],
          },
          {
            title: '美型好廚 人見人愛',
            url: 'https://www.sakura-kitchenlife.com.tw/gallery/case31',
            image: {
              src: '/section-1/kitchen-guide/kitchen-outlet/elegant-kitchen.jpg',
              alt: '美型好廚人見人愛的廚房插座設計案例',
            },
            paragraphs: ['由於該屋主特別在意其廚房使用習慣，故從廚房電器插座到檯面高度，都以屋主的烹飪使用習慣而定。特別打造出一個兼具機能且符合其品位的高顏值廚房，可彈性運用的友善廚房，也可以成為家庭互動的新核心場所。愜意料理、吃飯、品酒，放鬆生活的日子就是這麼的美好！'],
          },
          {
            title: '品味優雅 餐廚空間',
            url: 'https://www.sakura-kitchenlife.com.tw/gallery/case48',
            image: {
              src: '/section-1/kitchen-guide/kitchen-outlet/coffee-bar.jpg',
              alt: '品味優雅餐廚空間的咖啡吧檯插座設計案例',
            },
            paragraphs: ['喜愛在角落吧檯區擺放收集的咖啡用品，設計師特別為此規劃出完整的廚房插座，就是要讓屋主每天都可以在廚房開心的品嚐著香濃的咖啡。生活儀式感的創造，僅需一台小小的咖啡機就可以做到。插座高度配合著屋主的廚房使用習慣，每天到此煮上一杯濃醇的咖啡替平凡的日常打造出不一樣的浪漫氣息。'],
          },
        ],
      },
    ],
    closing: '廚房插座設計並不難，只要有想好廚房電器用品再搭配上使用習慣，就可以正確規劃出合宜的廚房插座配置。如果你對於你家的廚房插座規劃還是有問題的話，不妨就直接到櫻花整體廚房門市一趟，讓專業的服務為你量身設計吧！',
    links: [
      {
        label: '了解更多中島廚房大小事：中島廚房如何設計規劃？4大案例告訴你，機能＋收納成就完美廚房！',
        url: 'https://www.sakura-kitchenlife.com.tw/knowledge/maintain/knowledge29',
      },
      {
        label: '了解更多小廚房設計大小事：小廚房設計推薦：3大規劃重點要留意，簡單擁有大空間！',
        url: 'https://www.sakura-kitchenlife.com.tw/knowledge/maintain/knowledge30',
      },
    ],
  },
  {
    slug: 'knowledge31',
    articleId: 'kitchen-island-table',
    cover: {
      src: '/section-1/kitchen-guide/kitchen-island/hero.jpg',
      alt: '中島廚房結合餐桌的明亮開放式空間',
    },
    sections: [
      {
        paragraphs: [
          '每次翻開雜誌看到中島廚房的設計，總是讓人心生嚮往，多希望自己家的廚房也可以如此的夢幻美觀。中島廚房除了可以將餐桌完美結合外，亦提供額外的共廚空間，讓在廚房料理的你不再孤伶伶一個人。而在這個溫暖的中島廚房中，還可以讓一家人圍繞著中島餐桌享受美食。如果你也喜歡中島廚房卻不懂得如何設計的話，不妨就透過本文一起了解如何將中島廚房結合餐桌，成為自己心中的夢幻廚房吧！',
        ],
        image: {
          src: '/section-1/kitchen-guide/kitchen-island/details.jpg',
          alt: '中島廚房餐桌三大設計重點示意',
        },
      },
      {
        heading: '中島廚房好嗎？我家適合嗎？',
        paragraphs: [
          '中島廚房美觀是美觀，但還是有許多人會想問：我家真的適合嗎？其實，中島廚房設計裝潢取決於多個因素。舉例來說，首要考慮的就是廚房空間與大小的規劃，再來是使用習慣與需求問題。當這兩樣因素都考慮清楚後，就可以完整的了解自家是否適合裝潢成中島廚房。',
          '隨著現代小宅當道，中島廚房可將餐桌完美融合一起，不但節省空間規劃外，更能將廚房變成一個充滿歡樂氣氛的地方。而中島廚房可以在近期如此的受到大家的歡迎與愛戴，一定是有其必然的優點才對。當然，如果想要透過專業需求評估的話，也可以到SAKURA KITCHEN櫻花整體廚房找尋專人協助諮詢喔！',
        ],
      },
      {
        heading: '中島廚房結合餐桌後，優點有哪些？',
        paragraphs: ['中島廚房之所以可以成為近期廚房設計主流，主要也是因為其具備的優點眾多，並能夠解決到大部分民眾對於傳統廚房的困擾。除此之外，還可以藉由中島廚房設計將家人聚在一起，讓廚房空間不只是廚房，也可以成為家庭生活中凝聚眾人的場所。而中島餐桌設計，所帶來的優點如下：'],
        points: [
          {
            title: '親子共廚 天倫之樂',
            paragraphs: ['傳統廚房通常無法容納多人共廚，不但要互搶水龍頭外，就連要請個小孩幫忙洗菜都顯得過度擁擠。而中島廚房將餐桌結合後，可讓小孩在中島餐桌上幫忙備菜，親子共廚共享歡樂好不愜意。從此不用在廚房孤軍奮戰，而是讓廚房也成為一個可以製造美好家庭回憶的好場所。'],
          },
          {
            title: '家人互動 說說笑笑',
            paragraphs: ['試想一下，媽媽在廚房已經煮得差不多準備要吃飯時，這時全家開始圍繞在中島廚房餐桌上。爸爸幫忙把中島餐桌整理乾淨、媽媽正在灶台上做最後的烹煮、弟弟在幫忙拿著碗筷、而自己也正站在媽媽的旁邊，等著幫忙將煮好的料理放在餐桌上。而在這過程中，一路從在廚房幫忙開始就說說笑笑，那家庭氣氛該會有多美好多歡樂呢！'],
          },
          {
            title: '規劃完善 動線流暢',
            paragraphs: ['如果你家的廚房不是很大，卻又想要擁有中島廚房的話，那就建議一定在初期規劃時就要將動線流暢度給考量進去。就算是小廚房也可以運用結合餐桌，再搭配上完整的收納空間，使得小廚房也可以擁有猶如大廚房般的中島廚房設計。如此一來，無論是要聚餐還是聊天，中島廚房的餐桌都可以為動線流暢的舒適空間喔！'],
          },
        ],
      },
      {
        heading: '中島廚房餐桌如何設計？3大重點說明',
        paragraphs: ['根據《中島廚房如何設計規劃？4大案例告訴你，機能＋收納成就完美廚房！》一文中顯示，中島廚房在設計上要注意功能需求外，也要將空間利用與風格美學一起考量進去。因此，中島廚房餐桌設計上，就要考量到廚房的高度、寬度、座椅高度、走道寬度等空間規劃。既然有這麼多眉角要注意，那有統整的重點嗎？SAKURA KITCHEN已經幫你整理好3大設計重點，讓我們一起來看看吧！'],
        points: [
          {
            title: '1. 使用習慣 功能完整',
            paragraphs: ['中島廚房中的餐桌設計，必須要考量到烹飪時的習慣與對中島的需求性。必須讓餐桌也可以具有一定的中島功能，待使用完畢後可以立刻變成餐桌；一桌多用途，為廚房留點空間，使得動線流暢廚房再也不卡卡。'],
          },
          {
            title: '2. 設計風格 符合期待',
            paragraphs: ['在設計中島廚房餐桌時，必須要考量到整體居家設計風格。畢竟，現代人多以開放廚房為主要設計規劃，若沒有將整體風格都考慮進去的話，就會讓中島廚房顯得很突兀。且一致的設計風格，還可營造出專屬的美感。讓中島廚房餐桌，不僅只有中島功能更能無違和的融入整體居家設計風格中。'],
          },
          {
            title: '3. 選材耐用 加強收納',
            paragraphs: ['由於中島廚房餐桌，不僅僅是用於就餐，還可以有更多的用途，故在選材上就要以耐用為主要考量重點。當然，也可以運用完美的收納空間設計，加強中島餐桌的實用性。例如：在餐桌下方增加收納空間，或者設計成可折疊或延展的餐桌，以應對不同的場合與需求。特別推薦使用活動摺疊桌地櫃，可隨使用空間運用變化，輕鬆拿取上掀桌板好省力。'],
          },
        ],
      },
    ],
    video: {
      id: 'ervCQo-l2T4',
      title: '中島廚房餐桌設計影片',
      cover: '/section-1/kitchen-guide/kitchen-island/details.jpg',
    },
    closing: '家裡廚房空間不夠，害怕無法設計成美觀的中島廚房？如果你對於中島廚房結合餐桌設計，想要有更專業的深入了解，也可以到線上客服填寫表單，將會立即有專人為你服務喔！',
    links: [
      {
        label: '了解更多半開放式廚房設計大小事：開放式廚房好嗎？與封閉式、半封閉差在哪？2大案例帶你清楚了解！',
        url: 'https://www.sakura-kitchenlife.com.tw/knowledge/maintain/knowledge21',
      },
      {
        label: '了解更多廚房裝潢設計大小事：廚房裝潢風格重點有哪些？3大規劃趨勢分析，讓廚房好看又好用！',
        url: 'https://www.sakura-kitchenlife.com.tw/knowledge/maintain/knowledge27',
      },
    ],
  },
]
