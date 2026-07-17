import React from 'react';

// Services 底部跑馬燈（採 Home Two elementor-scrolling）：全出血「KITCHEN PRODUCT」無限捲動。
// 與 Services 共用深色背景，字身使用模板金→透明漸層；動畫 keyframes 定義於 globals.css。
export function MarqueeBand() {
  return (
    <div className="overflow-hidden select-none" aria-hidden>
      <div className="flex w-max animate-marquee">
        {[0, 1].map((group) => (
          <div key={group} className="flex shrink-0">
            {Array.from({ length: 4 }).map((_, i) => (
              <span
                key={i}
                className="block font-display font-normal leading-[0.9] whitespace-nowrap pr-[0.2em] text-[220px]"
                style={{
                  backgroundImage:
                    "linear-gradient(rgb(202,160,92) 0%, rgba(202,160,92,0) 90%)",
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
