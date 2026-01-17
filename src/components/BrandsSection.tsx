import React from 'react';

export function BrandsSection() {
  const brands = [
    {
      name: "SAKURA",
      image: "https://images.unsplash.com/photo-1740803292822-a742c6a4fef0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxraXRjaGVuJTIwYXBwbGlhbmNlJTIwZGlzcGxheXxlbnwxfHx8fDE3Njg0NTYzNDF8MA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral"
    },
    {
      name: "svago",
      image: "https://images.unsplash.com/photo-1749704647512-3f556575a241?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtb2Rlcm4lMjBvdmVuJTIwaW50ZXJpb3J8ZW58MXx8fHwxNzY4MzU4OTYyfDA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral"
    },
    {
      name: "TEKA",
      image: "https://images.unsplash.com/photo-1768321611019-7402da38e214?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxyZWZyaWdlcmF0b3IlMjBkaXNwbGF5fGVufDF8fHx8MTc2ODQ1NjM0Mnww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral"
    }
  ];

  return (
    <div className="bg-gray-50 py-20">
      {/* 標題區 */}
      <div className="text-center mb-16">
        <h2 className="text-4xl mb-4 tracking-wider">品牌陣容</h2>
        <p className="text-gray-500 text-sm tracking-[0.3em]">Domestic Appliances</p>
      </div>

      {/* 內容區 */}
      <div className="max-w-7xl mx-auto px-12">
        <div className="flex gap-12 items-center">
          {/* 左側：三張品牌圖片 */}
          <div className="grid grid-cols-3 gap-6 flex-1">
            {brands.map((brand, index) => (
              <div 
                key={index}
                className="relative aspect-[3/4] bg-gray-200 overflow-hidden group cursor-pointer"
              >
                <img
                  src={brand.image}
                  alt={brand.name}
                  className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                />
                {/* 品牌名稱覆蓋層 */}
                <div className="absolute inset-0 bg-black/40 flex items-center justify-center">
                  <span className="text-white text-3xl font-light tracking-wider">
                    {brand.name}
                  </span>
                </div>
              </div>
            ))}
          </div>

          {/* 右側：文字內容 */}
          <div className="w-[400px] space-y-8">
            <div className="border-l-4 border-gray-400 pl-4">
              <p className="text-gray-600 text-sm tracking-wider mb-2">Best Deal gas</p>
            </div>
            
            <h3 className="text-3xl leading-relaxed">
              最完美的設計，來自<br />最完美的決定
            </h3>
            
            <p className="text-gray-500 text-sm tracking-wider leading-relaxed">
              Every beautiful moment<br />in your life.
            </p>
            
            <button className="bg-gray-600 text-white px-8 py-3 text-sm tracking-[0.2em] hover:bg-gray-700 transition-colors">
              搜尋總覽
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
