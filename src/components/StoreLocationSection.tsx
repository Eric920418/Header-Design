import React, { useState } from 'react';
import { Search, MapPin } from 'lucide-react';

export function StoreLocationSection() {
  const [selectedStore, setSelectedStore] = useState(1);

  const stores = [
    {
      id: 0,
      region: "北部",
      name: "承德店",
      address: "臺北市士林區承德路四段238號",
      phone: "03 622689",
    },
    {
      id: 1,
      region: "梅竹",
      name: "北大店",
      address: "新竹縣湖杏鄉博愛北路2段296號",
      phone: "03 622689",
    },
    {
      id: 2,
      region: "中部",
      name: "河南店",
      address: "台中市西屯區河南路三段250號",
      phone: "03 622689",
    },
    {
      id: 3,
      region: "雲嘉",
      name: "虎尾店",
      address: "雲林縣虎尾鎮林森路一段185號",
      phone: "03 622689",
    },
    {
      id: 4,
      region: "南部",
      name: "湖美店",
      address: "臺南市北區中華北路一段87號",
      phone: "03 622689",
    },
  ];

  return (
    <div className="bg-white py-24">
      <div className="max-w-7xl mx-auto px-4 lg:px-12">
        <div className="flex flex-col lg:flex-row gap-6 lg:gap-8">
          {/* 左側地圖區 */}
          <div className="w-full lg:w-[45%] lg:flex-shrink-0">
            <div className="bg-gray-200 h-[250px] lg:h-[400px] mb-4 relative overflow-hidden">
              {/* 台灣地圖 */}
              <div className="absolute inset-0 flex items-center justify-center"></div>
            </div>

            {/* 搜尋表單 */}
            <div className="flex  gap-3 bg-[#D9D9D9] p-4">
              <div className="flex flex-col gap-3 items-center justify-between w-full">
                <div className="flex  gap-3 w-full">
                  <input
                    type="text"
                    placeholder="縣 市"
                    className="w-full  px-3 py-2.5 bg-[#D9D9D9] border border-[#A3A3A3] text-sm focus:outline-none focus:border-gray-400"
                  />
                  <input
                    type="text"
                    placeholder="鄉 鎮"
                    className="w-full  px-3 py-2.5 bg-[#D9D9D9] border border-[#A3A3A3] text-sm focus:outline-none focus:border-gray-400"
                  />
                </div>
                <input
                  type="text"
                  placeholder="鄉 鎮"
                  className="w-full  px-3 py-2.5 bg-[#D9D9D9] border border-[#A3A3A3] text-sm focus:outline-none focus:border-gray-400"
                />
              </div>
              <button className="self-stretch w-24 shrink-0 bg-[#c9a961] text-white flex flex-col items-center justify-center gap-1 hover:bg-[#b89551] transition-colors">
                <Search className="w-4 h-4" />
                <span className="text-xs tracking-wider">搜尋</span>
              </button>
            </div>
          </div>

          {/* 右側門市列表 */}
          <div className="flex-1 space-y-2">
            {stores.map((store) => (
              <button
                key={store.id}
                onClick={() => setSelectedStore(store.id)}
                className={`w-full text-left transition-all ${
                  selectedStore === store.id
                    ? "bg-[#c9a961] text-white"
                    : "bg-white text-gray-800 hover:bg-gray-50"
                }`}
              >
                <div className="px-4 lg:px-6 py-3.5 border border-gray-300">
                  <div className="flex items-center justify-between">
                    <div className="flex items-baseline gap-3">
                      <span className="text-base">{store.region}</span>
                      <span className="text-base">{store.name}</span>
                    </div>
                  </div>
                  <div
                    className={`text-base mt-4 ms-11 flex justify-between ${
                      selectedStore === store.id
                        ? "text-white/90"
                        : "text-gray-600"
                    }`}
                  >
                    {store.address}

                    <div
                      className={`text-base tracking-wider ${
                        selectedStore === store.id
                          ? "text-white"
                          : "text-gray-500"
                      }`}
                    >
                      {store.phone}
                    </div>
                  </div>
                </div>
              </button>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}
