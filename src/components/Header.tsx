import React, { useState } from 'react';
import { Search, Menu, X, ChevronDown, ArrowRight } from 'lucide-react';

import { GOLD } from '../theme/cis';

// 對齊參考站 sakura-kitchenlife.com.tw 的 .l-header / .l-nav__item 實測值
const HEADER_GRADIENT = 'linear-gradient(90deg, #b79258 20%, #d2b587)';
const HEADER_FONT = '"Noto Sans TC", "PingFang TC", "Microsoft JhengHei", 微軟正黑體';

type MegaCard = { label: string; image: string; logo: string; href?: string };
type NavItem = {
  label: string;
  children?: string[];
  href?: string;
  external?: boolean;
  mega?: MegaCard[]; // 圖片式 mega-menu（hover 滿寬淡入展開，仿模板）
  megaCatalog?: string; // mega 面板底部型錄文字連結
};

const NAV_LEFT: NavItem[] = [
  { label: '設計案例', children: ['品牌系列', '設計靈感', '廚房小百科', '品牌系列型錄'] },
  {
    label: '廚房產品',
    // hover 展開滿寬 mega-menu：三張品牌產品大圖
    mega: [
      { label: 'SAKURA 廚電', image: '/products/sakura.jpg', logo: '/home-2026/logos/sakura.svg', href: '#' },
      { label: 'SVAGO', image: '/products/svago.jpg', logo: '/home-2026/logos/svago.svg', href: '#' },
      { label: 'TEKA', image: '/products/teka.jpg', logo: '/home-2026/logos/teka.svg', href: '#' },
    ],
    megaCatalog: '廚房商品型錄',
  },
  { label: '門市與服務', children: ['服務流程', '案例門市', '到府丈量', '客服中心'] },
  { label: '優惠活動', children: ['優惠活動', '最新消息', '媒體影音'] },
];

const NAV_RIGHT: NavItem[] = [
  { label: '品牌承諾', children: ['品牌優勢', '集團品牌館', '關於我們'] },
  { label: '我要加盟', children: ['加盟介紹', '加盟優勢', '加盟金與流程', '加盟Q&A'] },
  { label: '建商專區', href: '#' },
  { label: '櫻花集團', href: 'https://www.sakura.com.tw/', external: true },
];

// 桌面版單一導覽項（mega 圖片選單 → hover 下拉 → 純連結）
function DesktopNavItem({ item }: { item: NavItem }) {
  // 圖片式 mega-menu：hover 從 header 下方淡入展開滿寬面板 + 三張品牌大圖
  if (item.mega) {
    return (
      <div className="group">
        {/* 觸發鈕撐滿 bar 高度，讓面板無縫貼合、避免 hover 中斷 */}
        <button type="button" className="flex items-center gap-1 h-[72px] px-3 text-[15px] text-white hover:text-white/80 transition-colors whitespace-nowrap">
          {item.label}
          <ChevronDown className="w-3.5 h-3.5 transition-transform group-hover:rotate-180" />
        </button>
        {/* 面板：絕對定位於 header（滿寬），淡入展開（opacity+visibility，300ms，仿模板） */}
        <div className="absolute left-0 right-0 top-[72px] z-40 invisible opacity-0 group-hover:visible group-hover:opacity-100 group-focus-within:visible group-focus-within:opacity-100 transition-all duration-300">
          <div className="bg-white shadow-2xl border-t border-black/5">
            <div className="mx-auto max-w-[1200px] px-[30px] py-8 xl:px-0">
              <div className="grid grid-cols-3 gap-[30px]">
                {item.mega.map((m, i) => (
                  <a key={i} href={m.href} className="group/card block">
                    <div className="mb-4 flex h-[50px] items-center justify-start">
                      <img
                        src={m.logo}
                        alt={m.label}
                        className="h-[50px] w-[170px] object-contain object-left brightness-0"
                      />
                    </div>
                    <div className="relative aspect-[4/3] rounded-2xl overflow-hidden bg-[#1C1C1D]">
                      <img
                        src={m.image}
                        alt={m.label}
                        className="absolute inset-0 w-full h-full object-cover transition-transform duration-500 group-hover/card:scale-105"
                      />
                    </div>
                  </a>
                ))}
              </div>
              {item.megaCatalog && (
                <a
                  href="#"
                  className="mt-6 inline-flex items-center gap-2 text-sm text-[#1C1C1D] hover:text-[#CAA05C] transition-colors"
                >
                  {item.megaCatalog}
                  <ArrowRight aria-hidden className="h-4 w-4" />
                </a>
              )}
            </div>
          </div>
        </div>
      </div>
    );
  }

  if (!item.children) {
    return (
      <a
        href={item.href}
        {...(item.external ? { target: '_blank', rel: 'noopener noreferrer' } : {})}
        className="px-3 py-2 text-[15px] text-white hover:text-white/80 transition-colors whitespace-nowrap"
      >
        {item.label}
      </a>
    );
  }
  return (
    <div className="group relative">
      <button className="flex items-center gap-1 px-3 py-2 text-[15px] text-white hover:text-white/80 transition-colors whitespace-nowrap">
        {item.label}
        <ChevronDown className="w-3.5 h-3.5 transition-transform group-hover:rotate-180" />
      </button>
      {/* 下拉（pt-2 當作無縫橋接，避免游標移動時中斷 hover） */}
      <div className="absolute top-full left-1/2 -translate-x-1/2 pt-2 hidden group-hover:block z-50">
        <ul className="min-w-[190px] rounded-xl bg-white shadow-xl border border-[#E3E3E8] py-2">
          {item.children.map((c, i) => (
            <li key={i}>
              <a
                href="#"
                className="block px-5 py-2.5 text-sm text-[#59585D] hover:text-[#CAA05C] hover:bg-[#F6F6F6] transition-colors whitespace-nowrap"
              >
                {c}
              </a>
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
}

export function Header() {
  const [openSearch, setOpenSearch] = useState(false);
  const [mobileOpen, setMobileOpen] = useState(false);
  const [expanded, setExpanded] = useState<number | null>(null);

  const allNav = [...NAV_LEFT, ...NAV_RIGHT];

  return (
    <header className="w-full relative z-50" style={{ fontFamily: HEADER_FONT }}>
      <div style={{ background: HEADER_GRADIENT }}>
        <div className="px-5 lg:px-12 h-[72px] flex items-center">
          {/* ── 桌面版：左導覽 | logo | 右導覽 + 搜尋 ── */}
          <nav className="hidden lg:flex items-center w-full">
            <div className="flex-1 flex items-center justify-start gap-1">
              {NAV_LEFT.map((item, i) => (
                <DesktopNavItem key={i} item={item} />
              ))}
            </div>

            <a href="#" className="shrink-0 px-6">
              <img src="/sakura-logo.png" alt="SAKURA KITCHEN" className="h-11" />
            </a>

            <div className="flex-1 flex items-center justify-end gap-1">
              {NAV_RIGHT.map((item, i) => (
                <DesktopNavItem key={i} item={item} />
              ))}
              <span className="w-px h-5 bg-white/40 mx-2" aria-hidden />
              <button
                onClick={() => setOpenSearch((v) => !v)}
                className="p-2 text-white/90 hover:text-white transition-colors"
                aria-label="搜尋"
              >
                {openSearch ? <X className="w-5 h-5" /> : <Search className="w-5 h-5" />}
              </button>
            </div>
          </nav>

          {/* ── 手機版 bar：logo + 搜尋 + 漢堡 ── */}
          <div className="flex lg:hidden items-center justify-between w-full">
            <a href="#">
              <img src="/sakura-logo.png" alt="SAKURA KITCHEN" className="h-11" />
            </a>
            <div className="flex items-center gap-1">
              <button
                onClick={() => setOpenSearch((v) => !v)}
                className="p-2 text-white"
                aria-label="搜尋"
              >
                <Search className="w-5 h-5" />
              </button>
              <button
                onClick={() => setMobileOpen((v) => !v)}
                className="p-2 text-white"
                aria-label="選單"
              >
                {mobileOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
              </button>
            </div>
          </div>
        </div>

        {/* ── 搜尋展開列（桌面 + 手機共用） ── */}
        {openSearch && (
          <div className="border-t border-white/20">
            <div className="px-5 lg:px-12 py-3">
              <div className="relative">
                <Search className="absolute left-4 top-1/2 -translate-y-1/2 w-5 h-5 text-[#59585D]" />
                <input
                  autoFocus
                  type="text"
                  placeholder="搜尋商品 / 案例 / 門市…"
                  className="w-full h-12 rounded-full bg-white pl-12 pr-5 text-[#1C1C1D] placeholder:text-[#9F9FA4] focus:outline-none"
                />
              </div>
            </div>
          </div>
        )}
      </div>

      {/* ── 手機版抽屜（accordion） ── */}
      {mobileOpen && (
        <div className="lg:hidden bg-white border-t border-[#E3E3E8] shadow-lg">
          <ul className="divide-y divide-[#E3E3E8]">
            {allNav.map((item, i) => {
              // mega 項在手機以其品牌名 + 型錄當作可展開子項
              const subs =
                item.children ??
                (item.mega
                  ? [...item.mega.map((m) => m.label), ...(item.megaCatalog ? [item.megaCatalog] : [])]
                  : undefined);
              return (
              <li key={i}>
                {subs ? (
                  <>
                    <button
                      onClick={() => setExpanded(expanded === i ? null : i)}
                      className="w-full flex items-center justify-between px-6 py-4 text-left text-[#1C1C1D]"
                    >
                      <span>{item.label}</span>
                      <ChevronDown
                        className={`w-4 h-4 transition-transform ${expanded === i ? 'rotate-180' : ''}`}
                        style={expanded === i ? { color: GOLD } : undefined}
                      />
                    </button>
                    {expanded === i && (
                      <ul className="bg-[#F6F6F6] pb-2">
                        {subs.map((c, j) => (
                          <li key={j}>
                            <a
                              href="#"
                              onClick={() => setMobileOpen(false)}
                              className="block pl-10 pr-6 py-2.5 text-sm text-[#59585D] hover:text-[#CAA05C] transition-colors"
                            >
                              {c}
                            </a>
                          </li>
                        ))}
                      </ul>
                    )}
                  </>
                ) : (
                  <a
                    href={item.href}
                    {...(item.external ? { target: '_blank', rel: 'noopener noreferrer' } : {})}
                    onClick={() => setMobileOpen(false)}
                    className="block px-6 py-4 text-[#1C1C1D]"
                  >
                    {item.label}
                  </a>
                )}
              </li>
              );
            })}
          </ul>
        </div>
      )}
    </header>
  );
}
