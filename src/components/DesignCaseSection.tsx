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
    <div className="relative py-6 lg:py-12 overflow-hidden">
      {/* 背景浮水印文字 */}
      <div className="absolute top-0 right-0 text-[80px] md:text-[120px] lg:text-[180px] font-bold text-gray-200/40 leading-none tracking-wider pointer-events-none">
        <div>SAKURA</div>
        <div>KITCHRO</div>
      </div>

      <div className="max-w-7xl mx-auto px-4 lg:px-12 relative">
        <div className="hidden md:block absolute top-90 left-12 md:w-[300px] md:h-[180px] lg:w-[400px] lg:h-[220px] bg-gray-100 z-0"></div>
        <div className="flex flex-col lg:flex-row gap-1">
          {/* 左側大圖 */}
          <div className="w-full lg:w-1/2 relative aspect-[4/3] bg-gray-300 overflow-hidden group h-[280px] md:h-[380px] lg:h-[450px] z-10">
            <img
              src={cases[currentCase].images[0]}
              alt="Kitchen case 1"
              className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500 z-10"
            />
            {/* Best Design 標籤 */}
            <div className="absolute top-8 left-8">
              <div className="bg-white/20 backdrop-blur-sm px-4 py-2 border border-white/40">
                <span className="text-white text-sm italic tracking-wider">
                  Best Design
                </span>
              </div>
            </div>
            {/* 契約案例按鈕 */}
            <div className="absolute bottom-8 left-8 lg:bottom-12 lg:left-12">
              <button className="border-2 border-white text-white px-6 lg:px-10 py-3 text-sm tracking-[0.3em] hover:bg-white hover:text-gray-900 transition-colors">
                契約案例
              </button>
            </div>
          </div>

          {/* 右側區域 */}
          <div className="w-full lg:w-1/2 flex flex-col gap-6">
            {/* 上方兩張小圖 */}
            <div className="grid grid-cols-2 gap-1">
              <div className="relative aspect-[4/3] bg-gray-300 overflow-hidden group">
                <img
                  src={cases[currentCase].images[1]}
                  alt="Kitchen case 2"
                  className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
                />
                {/* Best Design 標籤 */}
                <div className="absolute top-4 left-4 lg:top-6 lg:left-6">
                  <div className="bg-gray-900/70 backdrop-blur-sm px-3 py-1">
                    <span className="text-white text-sm italic tracking-wider">
                      Best Design
                    </span>
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
            <div className="p-4 md:p-8 lg:p-12">
              {/* 分頁指示點 */}

              <div className="mb-8">
                <div className="flex justify-between items-center">
                  <div className="border-l-4 border-gray-400 pl-3 mb-6">
                    <span className="text-gray-600 text-sm italic tracking-wider">
                      Best Design
                    </span>
                  </div>
                  <div className="flex gap-2 justify-end ">
                    {Array.from({ length: totalPages }).map((_, index) => (
                      <button
                        key={index}
                        onClick={() => setCurrentCase(index)}
                        className={`rounded-full transition-all ${
                          currentCase === index
                            ? "w-2 h-2 bg-gray-800"
                            : "w-2 h-2 bg-gray-300 hover:bg-gray-400"
                        }`}
                        aria-label={`Go to case ${index + 1}`}
                      />
                    ))}
                  </div>
                </div>
                <h3 className="text-2xl lg:text-3xl leading-relaxed">
                  最完美的設計，來自
                  <br />
                  最完美的決定
                </h3>
              </div>

              <div className="space-y-4 border-t border-black pt-3 w-full md:w-[280px] lg:w-[350px]">
                <div className="flex items-center text-base">
                  <span className="text-gray-600 w-24">設計師</span>
                  <span className="text-gray-900">
                    {cases[currentCase].designer}
                  </span>
                </div>
                <div className="flex items-center text-base border-y border-black py-3">
                  <span className="text-gray-600 w-24">設計門市</span>
                  <span className="text-gray-900">
                    {cases[currentCase].location}
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
