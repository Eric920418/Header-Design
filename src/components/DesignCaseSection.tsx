import React, { useState } from 'react';

export function DesignCaseSection() {
  const [currentCase, setCurrentCase] = useState(0);

  const cases = [
    {
      designer: "陳冠瑋",
      location: "櫻花整體廚房 承德店",
      images: [
        "https://images.unsplash.com/photo-1759150712537-0e32b6c6a373?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtb2Rlcm4lMjBraXRjaGVuJTIwZGluaW5nfGVufDF8fHx8MTc2ODM5NzI5OHww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
        "https://images.unsplash.com/photo-1475584681345-8503b2f13841?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxraXRjaGVuJTIwaGFsbHdheSUyMGNvcnJpZG9yfGVufDF8fHx8MTc2ODQ1NjUwNHww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
        "https://images.unsplash.com/photo-1620086464194-5127366b51ea?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxsdXh1cnklMjBraXRjaGVuJTIwaW50ZXJpb3J8ZW58MXx8fHwxNzY4MzkxODg5fDA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral"
      ]
    }
  ];

  const totalPages = 5;

  return (
    <div className="relative bg-gray-100 py-24 overflow-hidden">
      {/* 背景浮水印文字 */}
      <div className="absolute top-0 right-0 text-[180px] font-bold text-gray-200/40 leading-none tracking-wider pointer-events-none">
        <div>SAKURA</div>
        <div>KITCHRO</div>
      </div>

      <div className="max-w-7xl mx-auto px-12 relative">
        <div className="flex gap-6">
          {/* 左側大圖 - 佔50% */}
          <div className="w-1/2 relative aspect-[4/3] bg-gray-300 overflow-hidden group">
            <img
              src={cases[currentCase].images[0]}
              alt="Kitchen case 1"
              className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
            />
            {/* Best Design 標籤 */}
            <div className="absolute top-8 left-8">
              <div className="bg-white/20 backdrop-blur-sm px-4 py-2 border border-white/40">
                <span className="text-white text-sm italic tracking-wider">Best Design</span>
              </div>
            </div>
            {/* 契約案例按鈕 */}
            <div className="absolute bottom-12 left-12">
              <button className="border-2 border-white text-white px-10 py-3 text-sm tracking-[0.3em] hover:bg-white hover:text-gray-900 transition-colors">
                契約案例
              </button>
            </div>
          </div>

          {/* 右側區域 - 佔50% */}
          <div className="w-1/2 flex flex-col gap-6">
            {/* 上方兩張小圖 */}
            <div className="grid grid-cols-2 gap-6">
              <div className="relative aspect-[4/3] bg-gray-300 overflow-hidden group">
                <img
                  src={cases[currentCase].images[1]}
                  alt="Kitchen case 2"
                  className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
                />
                {/* Best Design 標籤 */}
                <div className="absolute top-6 left-6">
                  <div className="bg-gray-900/70 backdrop-blur-sm px-3 py-1">
                    <span className="text-white text-sm italic tracking-wider">Best Design</span>
                  </div>
                </div>
              </div>
              
              <div className="relative aspect-[4/3] bg-gray-300 overflow-hidden group">
                <img
                  src={cases[currentCase].images[2]}
                  alt="Kitchen case 3"
                  className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
                />
              </div>
            </div>

            {/* 下方資訊卡片 */}
            <div className="bg-white p-10 flex-1 shadow-lg relative">
              {/* 分頁指示點 - 在卡片右上角 */}
              <div className="absolute top-8 right-8 flex gap-2">
                {Array.from({ length: totalPages }).map((_, index) => (
                  <button
                    key={index}
                    onClick={() => setCurrentCase(index)}
                    className={`rounded-full transition-all ${
                      currentCase === index
                        ? 'w-2 h-2 bg-gray-800'
                        : 'w-2 h-2 bg-gray-300 hover:bg-gray-400'
                    }`}
                    aria-label={`Go to case ${index + 1}`}
                  />
                ))}
              </div>

              <div className="mb-8">
                <div className="border-l-4 border-gray-400 pl-3 mb-6">
                  <span className="text-gray-600 text-sm italic tracking-wider">Best Design</span>
                </div>
                <h3 className="text-3xl leading-relaxed">
                  最完美的設計，來自<br />
                  最完美的決定
                </h3>
              </div>

              <div className="space-y-4 border-t border-gray-200 pt-6">
                <div className="flex items-center text-sm">
                  <span className="text-gray-600 w-24">設計師</span>
                  <span className="text-gray-900">{cases[currentCase].designer}</span>
                </div>
                <div className="flex items-center text-sm border-t border-gray-100 pt-4">
                  <span className="text-gray-600 w-24">設計門市</span>
                  <span className="text-gray-900">{cases[currentCase].location}</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}