import React, { useState } from 'react';

export function GallerySection() {
  const images = [
    "https://images.unsplash.com/photo-1610177534644-34d881503b83?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtb2Rkcm4lMjBraXRjaGVuJTIwaW50ZXJpb3J8ZW58MXx8fHwxNzY4Mzc2MTc3fDA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
    "https://images.unsplash.com/photo-1639405069836-f82aa6dcb900?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxsdXh1cnklMjBraXRjaGVuJTIwZGVzaWdufGVufDF8fHx8MTc2ODQwMzI2MHww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
    "https://images.unsplash.com/photo-1592839656073-833413ae8874?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjb250ZW1wb3JhcnklMjBraXRjaGVuJTIwZGluaW5nfGVufDF8fHx8MTc2ODQ1NTczNHww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
    "https://images.unsplash.com/photo-1585128833500-ec98262cb4f5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtaW5pbWFsaXN0JTIwa2l0Y2hlbnxlbnwxfHx8fDE3NjgzNDM1OTF8MA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral"
  ];

  const [currentIndex, setCurrentIndex] = useState(0);

  return (
    <div className="relative bg-white pb-32">
      <div className="flex">
        {/* 左側留白區域 */}
        <div className="w-[25%] bg-gray-50"></div>

        {/* 右側大圖區域 */}
        <div className="w-[75%] relative">
          <div className="relative h-[600px]">
            <img
              src={images[currentIndex]}
              alt="Kitchen Gallery"
              className="w-full h-full object-cover"
            />
            
            {/* 尋找靈感按鈕 */}
            <div className="absolute bottom-8 right-8">
              <button className="px-8 py-3 border-2 border-white text-white text-sm tracking-[0.3em] hover:bg-white/10 transition-colors backdrop-blur-sm">
                尋找靈感
              </button>
            </div>
          </div>
        </div>
      </div>

      {/* 底部縮圖區域 - 與大圖交疊，靠左對齊 */}
      <div className="absolute bottom-0 left-0  bg-gray-100 py-8 max-w-[500px]">
        <div className="pl-12 pr-12">
          <div className="flex items-center gap-8">
            {/* 三張縮圖 - 靠左 */}
            <div className="grid grid-cols-3 gap-6 flex-shrink-0">
              {images.slice(0, 3).map((image, index) => (
                <button
                  key={index}
                  onClick={() => setCurrentIndex(index)}
                  className={`relative aspect-[16/10] w-64 overflow-hidden transition-all ${
                    currentIndex === index 
                      ? 'ring-2 ring-gray-400' 
                      : 'opacity-70 hover:opacity-100'
                  }`}
                >
                  <img
                    src={image}
                    alt={`Kitchen ${index + 1}`}
                    className="w-full h-full object-cover"
                  />
                </button>
              ))}
            </div>

            {/* 指示點 - 輪播右邊 */}
            <div className="flex gap-3">
              {images.map((_, index) => (
                <button
                  key={index}
                  onClick={() => setCurrentIndex(index)}
                  className={`rounded-full transition-all ${
                    currentIndex === index 
                      ? 'w-2 h-2 bg-gray-600' 
                      : 'w-2 h-2 bg-gray-300'
                  }`}
                />
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}