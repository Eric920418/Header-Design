import React from 'react';

// 底部跑馬燈（採 Home Two elementor-scrolling）：全出血「KITCHEN PRODUCT」無限捲動。
// 字身用 background-clip:text + 上淺灰→透明漸層 + line-height 0.9 輕裁切（keyframes 定義於 globals.css）。
export function MarqueeBand() {
  return (
    <div className="bg-[#f6f6f6] overflow-hidden select-none" aria-hidden>
      <div className="flex w-max animate-marquee">
        {[0, 1].map((group) => (
          <div key={group} className="flex shrink-0">
            {Array.from({ length: 4 }).map((_, i) => (
              <span
                key={i}
                className="block font-bold leading-[0.9] whitespace-nowrap pr-[0.2em] text-[220px]"
                style={{
                  backgroundImage:
                    "linear-gradient(rgb(216,216,216) 0%, rgba(153,153,153,0) 90%)",
                  WebkitBackgroundClip: "text",
                  backgroundClip: "text",
                  WebkitTextFillColor: "transparent",
                  color: "transparent",
                }}
              >
                Kitchen Product
              </span>
            ))}
          </div>
        ))}
      </div>
    </div>
  );
}
