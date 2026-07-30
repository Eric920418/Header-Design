import React, { useState } from 'react';
import { Search, Menu, X, ChevronDown, ArrowRight } from 'lucide-react';

import { GOLD } from '../theme/cis';
import { KITCHEN_STYLES } from '../data/kitchenStyles';

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
  seriesMega?: boolean; // 「設計案例 > 品牌系列」第二層滿寬圖片選單
};

type DropdownAlign = 'start' | 'center' | 'end';

const NAV_LEFT: NavItem[] = [
  {
    label: '設計案例',
    children: ['品牌系列', '設計靈感', '廚房小百科', '品牌系列型錄'],
    seriesMega: true,
  },
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
  { label: '優惠消息', children: ['優惠活動', '最新消息', '媒體影音'] },
];

const NAV_RIGHT: NavItem[] = [
  { label: '品牌承諾', children: ['品牌優勢', '集團品牌館', '關於我們'] },
  { label: '我要加盟', children: ['加盟介紹', '加盟優勢', '加盟金與流程', '加盟Q&A'] },
  { label: '建商專區', href: '#' },
  { label: '櫻花集團', href: 'https://www.sakura.com.tw/', external: true },
];

// 桌面版單一導覽項（mega 圖片選單 → hover 下拉 → 純連結）
function DesktopNavItem({
  item,
  dropdownAlign = 'center',
}: {
  item: NavItem;
  dropdownAlign?: DropdownAlign;
}) {
  // 圖片式 mega-menu：hover 從 header 下方淡入展開滿寬面板 + 三張品牌大圖
  if (item.mega) {
    return (
      <div className="group">
        {/* 觸發鈕撐滿 bar 高度，讓面板無縫貼合、避免 hover 中斷 */}
        <button type="button" className="flex h-[60px] items-center gap-0.5 whitespace-nowrap px-1 text-[15px] leading-[15px] text-white transition-colors hover:text-white/80 xl:gap-1 xl:px-3">
          {item.label}
          <ChevronDown className="h-3 w-3 transition-transform group-hover:rotate-180 xl:h-3.5 xl:w-3.5" />
        </button>
        {/* 面板：絕對定位於 header（滿寬），淡入展開（opacity+visibility，300ms，仿模板） */}
        <div className="absolute left-0 right-0 top-[60px] z-40 invisible opacity-0 group-hover:visible group-hover:opacity-100 group-focus-within:visible group-focus-within:opacity-100 transition-all duration-300">
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

  const dropdownPosition =
    dropdownAlign === 'start'
      ? 'left-0'
      : dropdownAlign === 'end'
        ? 'right-0'
        : 'left-1/2 -translate-x-1/2';

  if (!item.children) {
    return (
      <a
        href={item.href}
        {...(item.external ? { target: '_blank', rel: 'noopener noreferrer' } : {})}
        className="whitespace-nowrap px-1 py-2 text-[15px] leading-[15px] text-white transition-colors hover:text-white/80 xl:px-3"
      >
        {item.label}
      </a>
    );
  }
  return (
    <div className="group relative flex h-[60px] items-center">
      <button className="flex h-[60px] items-center gap-0.5 whitespace-nowrap px-1 text-[15px] leading-[15px] text-white transition-colors hover:text-white/80 xl:gap-1 xl:px-3">
        {item.label}
        <ChevronDown className="h-3 w-3 transition-transform group-hover:rotate-180 xl:h-3.5 xl:w-3.5" />
      </button>
      {/* 第一個左側項目沿左緣、右側項目沿右緣展開，避免 190px 面板超出 viewport。 */}
      <div
        className={`pointer-events-none invisible absolute top-full z-50 pt-2 opacity-0 transition-[opacity,visibility] duration-200 group-hover:pointer-events-auto group-hover:visible group-hover:opacity-100 group-focus-within:pointer-events-auto group-focus-within:visible group-focus-within:opacity-100 ${dropdownPosition}`}
      >
        <ul className="min-w-[190px] rounded-xl bg-white shadow-xl border border-[#E3E3E8] py-2">
          {item.children.map((c, i) => {
            const opensSeriesMega = item.seriesMega && i === 0;

            return (
              <li key={i} className={opensSeriesMega ? 'group/series' : undefined}>
                {opensSeriesMega ? (
                  <button
                    type="button"
                    aria-haspopup="true"
                    className="flex w-full items-center justify-between gap-4 px-5 py-2.5 text-left text-sm text-[#59585D] transition-colors whitespace-nowrap hover:bg-[#F6F6F6] hover:text-[#CAA05C] focus:bg-[#F6F6F6] focus:text-[#CAA05C] focus:outline-none"
                  >
                    {c}
                    <ArrowRight aria-hidden className="h-4 w-4" />
                  </button>
                ) : (
                  <a
                    href="#"
                    className="flex items-center justify-between gap-4 px-5 py-2.5 text-sm text-[#59585D] transition-colors whitespace-nowrap hover:bg-[#F6F6F6] hover:text-[#CAA05C]"
                  >
                    {c}
                  </a>
                )}

                {opensSeriesMega && (
                  <div className="pointer-events-none invisible fixed inset-x-0 top-[60px] z-[60] opacity-0 transition-[opacity,visibility] duration-300 group-hover/series:pointer-events-auto group-hover/series:visible group-hover/series:opacity-100 group-focus-within/series:pointer-events-auto group-focus-within/series:visible group-focus-within/series:opacity-100">
                    <div className="border-t border-black/5 bg-white shadow-2xl">
                      <div className="mx-auto flex max-w-[1512px] gap-6 px-5 py-7 xl:gap-[30px] xl:px-12">
                        <nav aria-label="設計案例子選單" className="w-[190px] shrink-0">
                          <p className="mb-3 px-5 text-[11px] font-medium uppercase tracking-[0.18em] text-[#9F9FA4]">
                            Design Cases
                          </p>
                          <ul className="overflow-hidden rounded-xl border border-[#E3E3E8] bg-white py-2">
                            {item.children.map((seriesChild, seriesIndex) => (
                              <li key={seriesChild}>
                                <a
                                  href={seriesIndex === 0 ? '#kitchen-series' : '#'}
                                  className={`flex items-center justify-between gap-3 px-5 py-2.5 text-sm transition-colors ${
                                    seriesIndex === 0
                                      ? 'bg-[#F6F6F6] text-[#CAA05C]'
                                      : 'text-[#59585D] hover:bg-[#F6F6F6] hover:text-[#CAA05C]'
                                  }`}
                                >
                                  {seriesChild}
                                  {seriesIndex === 0 && <ArrowRight aria-hidden className="h-4 w-4" />}
                                </a>
                              </li>
                            ))}
                          </ul>
                        </nav>

                        <div className="min-w-0 flex-1">
                          <div className="mb-3 flex items-end justify-between">
                            <div>
                              <p className="text-[11px] font-medium uppercase tracking-[0.18em] text-[#9F9FA4]">
                                Kitchen Series
                              </p>
                              <h2 className="mt-1 font-display text-[24px] leading-[30px] text-[#1C1C1D]">
                                十大廚房系列
                              </h2>
                            </div>
                            <a
                              href="#kitchen-series"
                              className="inline-flex items-center gap-2 text-sm text-[#59585D] transition-colors hover:text-[#CAA05C]"
                            >
                              查看全部
                              <ArrowRight aria-hidden className="h-4 w-4" />
                            </a>
                          </div>

                          <div className="grid grid-cols-5 gap-3 xl:gap-4">
                            {KITCHEN_STYLES.map((style) => (
                              <a
                                key={style.en}
                                href="#kitchen-series"
                                aria-label={`${style.zh} ${style.en}`}
                                className="group/card relative aspect-[16/10] overflow-hidden rounded-xl bg-[#1C1C1D]"
                              >
                                <img
                                  src={style.image}
                                  alt=""
                                  className="absolute inset-0 h-full w-full object-cover transition-transform duration-500 ease-out group-hover/card:scale-105"
                                />
                                <span
                                  aria-hidden
                                  className="absolute inset-0 bg-gradient-to-t from-black/85 via-black/15 to-transparent"
                                />
                                <span className="absolute inset-x-0 bottom-0 p-3 text-white">
                                  <span className="block text-[15px] font-medium leading-5">{style.zh}</span>
                                  <span className="mt-0.5 block truncate text-[11px] leading-4 text-white/70">
                                    {style.en}
                                  </span>
                                </span>
                              </a>
                            ))}
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                )}
              </li>
            );
          })}
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
        <div className="flex h-[60px] items-center px-5 xl:px-12">
          {/* ── 桌面版：左導覽 | logo | 右導覽 + 搜尋 ── */}
          <nav className="hidden w-full items-center lg:flex">
            <div className="flex-1 flex items-center justify-start gap-1">
              {NAV_LEFT.map((item, i) => (
                <DesktopNavItem
                  key={i}
                  item={item}
                  dropdownAlign={i === 0 ? 'start' : 'center'}
                />
              ))}
            </div>

            <a href="#" className="shrink-0 px-3 xl:px-6">
              <img
                src="/home-2026/footer/sakura-kitchen.png"
                alt="SAKURA KITCHEN"
                className="h-auto w-[160px] origin-center scale-125 object-contain brightness-0 invert xl:w-[260px]"
              />
            </a>

            <div className="flex-1 flex items-center justify-end gap-1">
              {NAV_RIGHT.map((item, i) => (
                <DesktopNavItem key={i} item={item} dropdownAlign="end" />
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
          <div className="flex w-full items-center justify-between lg:hidden">
            <a href="#">
              <img
                src="/home-2026/footer/sakura-kitchen.png"
                alt="SAKURA KITCHEN"
                className="h-auto w-[184px] origin-left scale-125 object-contain brightness-0 invert"
              />
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
        <div className="border-t border-[#E3E3E8] bg-white shadow-lg lg:hidden">
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
