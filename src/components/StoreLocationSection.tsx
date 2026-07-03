import React, { useMemo, useState } from 'react';
import { Search, MapPin } from 'lucide-react';

// 品牌重點金（沿用原站色）
const GOLD = '#C4A574';

const STORES = [
  { id: 0, region: '北部', name: '承德店', address: '臺北市士林區承德路四段238號', phone: '03 622689' },
  { id: 1, region: '梅竹', name: '北大店', address: '新竹縣湖杏鄉博愛北路2段296號', phone: '03 622689' },
  { id: 2, region: '中部', name: '河南店', address: '台中市西屯區河南路三段250號', phone: '03 622689' },
  { id: 3, region: '雲嘉', name: '虎尾店', address: '雲林縣虎尾鎮林森路一段185號', phone: '03 622689' },
  { id: 4, region: '南部', name: '湖美店', address: '臺南市北區中華北路一段87號', phone: '03 622689' },
];

export function StoreLocationSection() {
  const [selected, setSelected] = useState(STORES[0].id);
  const [query, setQuery] = useState('');

  // 即時篩選（比對 名稱 / 區域 / 地址）
  const filtered = useMemo(() => {
    const q = query.trim();
    if (!q) return STORES;
    return STORES.filter((s) => (s.name + s.region + s.address).includes(q));
  }, [query]);

  // 顯示中的門市：選取的若被篩掉，退回第一個可見門市（地圖永遠有目標）
  const visible =
    filtered.find((s) => s.id === selected) ?? filtered[0] ?? STORES.find((s) => s.id === selected)!;
  const mapSrc = `https://maps.google.com/maps?q=${encodeURIComponent(
    visible.address
  )}&z=16&output=embed`;

  return (
    <section className="relative bg-[#f6f6f6] py-20 overflow-hidden">
      <div className="max-w-7xl mx-auto px-4 lg:px-12">
        {/* 標題區（模板風格：膠囊 eyebrow + 雙色大標） */}
        <div className="mb-10 lg:mb-14">
          <span className="inline-flex items-center gap-2 rounded-full border border-gray-300 px-4 py-2 mb-6 text-[11px] tracking-[0.2em] uppercase text-[#1c1c1d]">
            <span className="inline-block w-1.5 h-1.5 rounded-full" style={{ background: GOLD }} />
            store locations
          </span>
          <h2 className="text-3xl lg:text-5xl font-bold leading-tight text-[#1c1c1d]">
            OOOOO <span style={{ color: GOLD }}>Store</span>
            <br />
            <span style={{ color: GOLD }}>Locator</span> OOOOO
          </h2>
        </div>

        <div className="flex flex-col lg:flex-row gap-8">
          {/* 左：地圖 + 搜尋（撐高與右側列表等高） */}
          <div className="w-full lg:w-[45%] lg:shrink-0 flex flex-col">
            {/* 真 Google Maps */}
            <div className="rounded-3xl overflow-hidden bg-gray-200 shadow-sm h-[var(--store-map-h)] lg:h-auto lg:flex-1 lg:min-h-[var(--store-map-h)]">
              <iframe
                title="門市地圖"
                src={mapSrc}
                loading="lazy"
                className="w-full h-full border-0"
                referrerPolicy="no-referrer-when-downgrade"
              />
            </div>

            {/* 搜尋框（即時篩選） */}
            <div className="relative mt-5">
              <input
                type="text"
                value={query}
                onChange={(e) => setQuery(e.target.value)}
                placeholder="搜尋門市 / 地區 / 地址"
                className="w-full h-[58px] rounded-full bg-white border border-[rgba(159,159,164,0.25)] pl-6 pr-16 text-[#1c1c1d] placeholder:text-gray-400 focus:outline-none focus:border-[#C4A574] transition-colors"
              />
              <span
                className="absolute right-2 top-1/2 -translate-y-1/2 w-11 h-11 rounded-full flex items-center justify-center text-white pointer-events-none"
                style={{ background: GOLD }}
                aria-hidden
              >
                <Search className="w-5 h-5" />
              </span>
            </div>
          </div>

          {/* 右：門市列表卡片 */}
          <div className="flex-1 space-y-3">
            {filtered.length === 0 ? (
              <div className="rounded-2xl bg-white border border-gray-200 px-6 py-10 text-center text-gray-500">
                查無門市，換個關鍵字試試。
              </div>
            ) : (
              filtered.map((store) => {
                const active = store.id === visible.id;
                return (
                  <button
                    key={store.id}
                    onClick={() => setSelected(store.id)}
                    className={`w-full text-left rounded-2xl border transition-colors ${
                      active
                        ? 'bg-[#C4A574] border-[#C4A574] text-white'
                        : 'bg-white border-gray-200 hover:border-[#C4A574]/50 text-[#1c1c1d]'
                    }`}
                  >
                    <div className="px-5 lg:px-6 py-5">
                      <div className="flex items-center gap-3">
                        <span
                          className={`text-xs px-2.5 py-1 rounded-full ${
                            active ? 'bg-white/20 text-white' : 'bg-gray-100 text-gray-500'
                          }`}
                        >
                          {store.region}
                        </span>
                        <span className="text-lg font-medium">{store.name}</span>
                      </div>
                      <div
                        className={`mt-3 flex items-start gap-2 text-sm ${
                          active ? 'text-white/85' : 'text-gray-500'
                        }`}
                      >
                        <MapPin className="w-4 h-4 shrink-0 mt-0.5" />
                        <span>{store.address}</span>
                      </div>
                      <div
                        className={`mt-1.5 pl-6 text-sm tracking-wider ${
                          active ? 'text-white' : 'text-gray-400'
                        }`}
                      >
                        {store.phone}
                      </div>
                    </div>
                  </button>
                );
              })
            )}
          </div>
        </div>
      </div>
    </section>
  );
}
