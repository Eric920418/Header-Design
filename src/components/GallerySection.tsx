import React, { useState } from 'react';

const IMGS = {
  topL:
    'https://images.unsplash.com/photo-1639405069836-f82aa6dcb900?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxsdXh1cnklMjBraXRjaGVuJTIwZGVzaWdufGVufDF8fHx8MTc2ODQwMzI2MHww&ixlib=rb-4.1.0&q=80&w=1080',
  topR:
    'https://images.unsplash.com/photo-1610177534644-34d881503b83?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtb2Rlcm4lMjBraXRjaGVuJTIwaW50ZXJpb3J8ZW58MXx8fHwxNzY4Mzc2MTc3fDA&ixlib=rb-4.1.0&q=80&w=1080',
  t1: 'https://images.unsplash.com/photo-1610177534644-34d881503b83?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtb2Rlcm4lMjBraXRjaGVuJTIwaW50ZXJpb3J8ZW58MXx8fHwxNzY4Mzc2MTc3fDA&ixlib=rb-4.1.0&q=80&w=600',
  t2: 'https://images.unsplash.com/photo-1592839656073-833413ae8874?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjb250ZW1wb3JhcnklMjBraXRjaGVuJTIwZGluaW5nfGVufDF8fHx8MTc2ODQ1NTczNHww&ixlib=rb-4.1.0&q=80&w=600',
  t3: 'https://images.unsplash.com/photo-1585128833500-ec98262cb4f5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtaW5pbWFsaXN0JTIwa2l0Y2hlbnxlbnwxfHx8fDE3NjgzNDM1OTF8MA&ixlib=rb-4.1.0&q=80&w=600',
};

const DOTS = 5;

export function GallerySection() {
  const [current, setCurrent] = useState(0);

  return (
    <div className="">
      {/* ── 上方：左灰色空白 + 右兩張廚房圖並排 ── */}
      <div className="hidden lg:flex" style={{ height: '470px' }}>
        {/* 左側灰色空白（與 Hero sidebar 視覺延伸） */}
        <div
          className="shrink-0 bg-white"
          style={{ width: '41%',  }}
        />

        {/* 右側兩張圖 */}
        <div className="flex flex-1 overflow-hidden">
          <div className="flex-1 overflow-hidden">
            <img
              src={IMGS.topL}
              alt="Kitchen Design"
              className="w-full h-full object-cover"
            />
          </div>
          <div className="flex-1 overflow-hidden">
            <img
              src={IMGS.topR}
              alt="Kitchen Interior"
              className="w-full h-full object-cover"
            />
          </div>
        </div>
      </div>

      {/* ── 下方：縮圖 × 3 ＋ 搜尋廚電 ＋ 分頁點 ── */}
      <div
        className="flex items-center"
        style={{
          paddingLeft: '8%',
          paddingRight: '3%',
          paddingTop: '36px',
          paddingBottom: '48px',
          background: '#fff',
        }}
      >
        {/* 三張縮圖 */}
        <div className="flex gap-5 flex-1 mr-6">
          {[IMGS.t1, IMGS.t2, IMGS.t3].map((src, i) => (
            <button
              key={i}
              onClick={() => setCurrent(i)}
              className="flex-1 overflow-hidden"
              style={{ height: '175px' }}
            >
              <img
                src={src}
                alt={`Slide ${i + 1}`}
                className="w-full h-full object-cover hover:scale-105 transition-transform duration-300"
              />
            </button>
          ))}
        </div>

        {/* 搜尋廚電 ＋ 分頁點（右側欄） */}
        <div
          className="shrink-0 flex flex-col items-center gap-7"
          style={{ width: '22%' }}
        >
          {/* 邊框按鈕 */}
          <button
            style={{
              border: '1px solid rgba(120,120,120,0.65)',
              padding: '14px 28px',
              letterSpacing: '0.32em',
              color: '#888',
              fontSize: '13px',
              background: 'transparent',
              whiteSpace: 'nowrap',
            }}
            className="hover:bg-gray-50 transition-colors"
          >
            搜 尋 廚 電
          </button>

          {/* 分頁點 */}
          <div className="flex items-center gap-[10px]">
            {Array.from({ length: DOTS }).map((_, i) => (
              <button
                key={i}
                onClick={() => setCurrent(i)}
                style={{
                  borderRadius: '50%',
                  width: i === current ? '11px' : '8px',
                  height: i === current ? '11px' : '8px',
                  background: i === current ? '#444' : '#bbb',
                  transition: 'all 0.2s',
                  flexShrink: 0,
                }}
              />
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}
