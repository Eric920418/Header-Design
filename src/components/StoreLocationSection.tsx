import React, { useMemo, useState } from 'react';
import { MapPin, LocateFixed, ChevronDown } from 'lucide-react';

// 品牌重點金（沿用原站色）
const GOLD = '#C4A574';

type Store = {
  id: number;
  region: string;
  city: string;
  name: string;
  address: string;
  phone: string;
};

// 真實門市（取自「首頁 Section 說明.pptx」slide 2 文字清單；目前全為北部/臺北市）
const STORES: Store[] = [
  { id: 0, region: '北部', city: '臺北市', name: '承德店', address: '臺北市士林區承德路四段238號', phone: '02-28839919' },
  { id: 1, region: '北部', city: '臺北市', name: '石牌店', address: '臺北市北投區石牌路一段68號', phone: '02-28218500' },
  { id: 2, region: '北部', city: '臺北市', name: '民權店', address: '臺北市中山區民權東路二段68號', phone: '02-25371659' },
  { id: 3, region: '北部', city: '臺北市', name: '中山南京店', address: '臺北市中山區中山北路一段71號', phone: '02-25238868' },
  { id: 4, region: '北部', city: '臺北市', name: '八德店', address: '臺北市松山區八德路4段230號', phone: '02-27486733' },
];

// 區域 → 縣市對照（下拉來源，取自 slide 2 文字）
const REGIONS: Record<string, string[]> = {
  北部: ['臺北市', '新北市', '基隆市', '新竹市', '桃園市', '新竹縣', '宜蘭縣'],
  中部: ['臺中市', '苗栗縣', '彰化縣', '南投縣', '雲林縣'],
  南部: ['高雄市', '臺南市', '嘉義市', '嘉義縣', '屏東縣', '澎湖縣'],
  東部: ['花蓮縣', '臺東縣'],
  離島: ['金門縣', '連江縣'],
};

export function StoreLocationSection() {
  const [selected, setSelected] = useState(STORES[0].id);
  const [region, setRegion] = useState('');
  const [city, setCity] = useState('');

  // 依「區域 / 城市」下拉篩選（皆未選時顯示全部）
  const filtered = useMemo(
    () =>
      STORES.filter(
        (s) => (!region || s.region === region) && (!city || s.city === city)
      ),
    [region, city]
  );

  // 顯示中的門市：選取的若被篩掉，退回第一個可見門市（地圖永遠有目標）
  const visible =
    filtered.find((s) => s.id === selected) ??
    filtered[0] ??
    STORES.find((s) => s.id === selected)!;
  const mapSrc = `https://maps.google.com/maps?q=${encodeURIComponent(
    visible.address
  )}&z=16&output=embed`;

  return (
    // 間距依模板實測：py 120、標題 60/64、標題→內容 60
    <section className="relative bg-[#f6f6f6] py-[120px] overflow-hidden">
      <div className="max-w-[1410px] mx-auto">
        {/* 標題區（模板風格：膠囊 eyebrow + 雙色大標） */}
        <div className="mb-[60px]">
          <span className="inline-flex items-center gap-2 rounded-full border border-gray-300 px-4 py-2 mb-5 text-[15px] tracking-[1px] uppercase text-[#1c1c1d]">
            <span className="inline-block w-1.5 h-1.5 rounded-full" style={{ background: GOLD }} />
            get in touch
          </span>
          <h2 className="text-[60px] font-bold leading-[64px] text-[#1c1c1d]">
            Have A Project In <span style={{ color: GOLD }}>Store</span>
            <br />
            <span style={{ color: GOLD }}>Locator</span> It Happen
          </h2>
        </div>

        <div className="flex flex-col lg:flex-row gap-8">
          {/* 左：地圖（撐高與右側列表等高） */}
          <div className="w-full lg:w-[45%] lg:shrink-0 flex flex-col">
            <div className="rounded-3xl overflow-hidden bg-gray-200 shadow-sm h-[var(--store-map-h)] lg:h-auto lg:flex-1 lg:min-h-[var(--store-map-h)]">
              <iframe
                title="門市地圖"
                src={mapSrc}
                loading="lazy"
                className="w-full h-full border-0"
                referrerPolicy="no-referrer-when-downgrade"
              />
            </div>
          </div>

          {/* 右：我的位置 + 區域/城市下拉 + 門市列表 */}
          <div className="flex-1">
            {/* 我的位置標示 */}
            <div className="flex items-center gap-2 mb-4 text-[#1c1c1d]">
              <span className="text-[15px]">我的位置</span>
              <LocateFixed className="w-[22px] h-[22px]" style={{ color: GOLD }} />
            </div>

            {/* 區域 / 城市下拉（並排兩欄） */}
            <div className="grid grid-cols-2 gap-3 mb-4">
              <div className="relative">
                <select
                  value={region}
                  onChange={(e) => {
                    setRegion(e.target.value);
                    setCity(''); // 換區域時清空城市
                  }}
                  className="w-full h-[52px] appearance-none rounded-full bg-white border border-[rgba(159,159,164,0.25)] pl-5 pr-11 text-[15px] text-[#1c1c1d] focus:outline-none focus:border-[#C4A574] transition-colors cursor-pointer"
                >
                  <option value="">選擇區域</option>
                  {Object.keys(REGIONS).map((r) => (
                    <option key={r} value={r}>
                      {r}
                    </option>
                  ))}
                </select>
                <ChevronDown className="absolute right-4 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400 pointer-events-none" />
              </div>

              <div className="relative">
                <select
                  value={city}
                  onChange={(e) => setCity(e.target.value)}
                  disabled={!region}
                  className="w-full h-[52px] appearance-none rounded-full bg-white border border-[rgba(159,159,164,0.25)] pl-5 pr-11 text-[15px] text-[#1c1c1d] focus:outline-none focus:border-[#C4A574] transition-colors cursor-pointer disabled:cursor-not-allowed disabled:text-gray-400 disabled:bg-gray-50"
                >
                  <option value="">選擇城市</option>
                  {(REGIONS[region] ?? []).map((c) => (
                    <option key={c} value={c}>
                      {c}
                    </option>
                  ))}
                </select>
                <ChevronDown className="absolute right-4 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-400 pointer-events-none" />
              </div>
            </div>

            {/* 門市列表卡片 */}
            <div className="space-y-3">
              {filtered.length === 0 ? (
                <div className="rounded-2xl bg-white border border-gray-200 px-6 py-10 text-center text-gray-500">
                  此區域尚無門市資料。
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
                          {/* 區域標籤：模版灰底 pill */}
                          <span
                            className={`text-xs px-2.5 py-1 rounded-full ${
                              active ? 'bg-white/20 text-white' : 'bg-[#f0f0f0] text-gray-500'
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
                          <MapPin className="w-[18px] h-[18px] shrink-0 mt-0.5" />
                          <span>{store.address}</span>
                        </div>
                        <div
                          className={`mt-1.5 pl-6 text-sm tracking-wider ${
                            active ? 'text-white' : 'text-[#C4A574]'
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
      </div>
    </section>
  );
}
