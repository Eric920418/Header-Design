import React, { useEffect, useMemo, useRef, useState } from 'react';
import { MapPin, LocateFixed, ChevronDown } from 'lucide-react';
import { GoogleStoreMap } from './GoogleStoreMap';
import { prefersReducedMotion } from '../motion/prefersReducedMotion';

// 全區顏色使用 Antra 模板色盤（單一來源）。
import { GOLD } from '../theme/cis';

type Store = {
  id: number;
  region: string;
  city: string;
  name: string;
  address: string;
  phone: string;
};

// 真實門市（取自「首頁 Section 說明.pptx」slide 2 文字清單；目前全為北部/臺北市）
const STORES: Store[] = [
  { id: 0, region: '北部', city: '臺北市', name: '承德店', address: '臺北市士林區承德路四段238號', phone: '02-28839919' },
  { id: 1, region: '北部', city: '臺北市', name: '石牌店', address: '臺北市北投區石牌路一段68號', phone: '02-28218500' },
  { id: 2, region: '北部', city: '臺北市', name: '民權店', address: '臺北市中山區民權東路二段68號', phone: '02-25371659' },
  { id: 3, region: '北部', city: '臺北市', name: '中山南京店', address: '臺北市中山區中山北路一段71號', phone: '02-25238868' },
  { id: 4, region: '北部', city: '臺北市', name: '八德店', address: '臺北市松山區八德路4段230號', phone: '02-27486733' },
];

// 區域 → 縣市對照（下拉來源，取自 slide 2 文字）
const REGIONS: Record<string, string[]> = {
  北部: ['臺北市', '新北市', '基隆市', '新竹市', '桃園市', '新竹縣', '宜蘭縣'],
  中部: ['臺中市', '苗栗縣', '彰化縣', '南投縣', '雲林縣'],
  南部: ['高雄市', '臺南市', '嘉義市', '嘉義縣', '屏東縣', '澎湖縣'],
  東部: ['花蓮縣', '臺東縣'],
  離島: ['金門縣', '連江縣'],
};

const STORE_BOARD_ROWS = 4;
const STORE_FLIP_INTERVAL = 2200;
const STORE_FLIP_DURATION = 760;

function StoreBoardFace({
  store,
  active,
  className = '',
}: {
  store: Store;
  active: boolean;
  className?: string;
}) {
  return (
    <div
      className={`store-board-face rounded-2xl border ${
        active
          ? 'border-[#CAA05C] bg-[#CAA05C] text-white'
          : 'border-[#E3E3E8] bg-white text-[#1C1C1D]'
      } ${className}`}
    >
      <div className="flex h-full flex-col justify-center px-5 py-3 lg:px-6">
        <div className="flex items-center gap-3">
          <span
            className={`rounded-full px-2.5 py-1 text-xs ${
              active ? 'bg-white/20 text-white' : 'bg-[#F6F6F6] text-[#59585D]'
            }`}
          >
            {store.region}
          </span>
          <span className="text-lg font-medium">{store.name}</span>
        </div>

        <div className="mt-2.5 flex min-w-0 flex-col items-start gap-2 text-sm sm:flex-row sm:items-center sm:justify-between sm:gap-3 lg:flex-col lg:items-start lg:justify-start xl:flex-row xl:items-center xl:justify-between">
          <span
            className={`flex min-w-0 items-start gap-1.5 ${
              active ? 'text-white/85' : 'text-[#59585D]'
            }`}
          >
            <MapPin className="mt-px h-[18px] w-[18px] shrink-0" />
            <span className="min-w-0 break-words">{store.address}</span>
          </span>
          <span
            className={`shrink-0 tracking-wider ${
              active ? 'text-white' : 'text-[#CAA05C]'
            }`}
          >
            {store.phone}
          </span>
        </div>
      </div>
    </div>
  );
}

export function StoreLocationSection() {
  const [selected, setSelected] = useState(STORES[0].id);
  const [region, setRegion] = useState('');
  const [city, setCity] = useState('');
  const [displayedIds, setDisplayedIds] = useState(
    STORES.slice(0, STORE_BOARD_ROWS).map((store) => store.id)
  );
  const [flipState, setFlipState] = useState<{ slot: number; previousId: number } | null>(null);
  const [boardPaused, setBoardPaused] = useState(false);
  const [reduceMotion, setReduceMotion] = useState(false);
  const flipTimeoutRef = useRef<number | null>(null);
  // 地圖初始顯示整個台灣（總覽）；使用者點門市卡片後才聚焦到該門市
  const [focused, setFocused] = useState(false);

  // 依「區域 / 城市」下拉篩選（皆未選時顯示全部）
  const filtered = useMemo(
    () =>
      STORES.filter(
        (s) => (!region || s.region === region) && (!city || s.city === city)
      ),
    [region, city]
  );

  const filteredKey = filtered.map((store) => store.id).join(',');

  // 篩選條件改變時重建資訊板；只顯示固定列數，其餘門市成為翻牌候補。
  useEffect(() => {
    setDisplayedIds(filtered.slice(0, STORE_BOARD_ROWS).map((store) => store.id));
    setFlipState(null);
  }, [filteredKey]);

  // 尊重系統的減少動態設定；設定變更時即時停止／恢復自動翻牌。
  useEffect(() => {
    const media = window.matchMedia('(prefers-reduced-motion: reduce)');
    const update = () => setReduceMotion(prefersReducedMotion());
    update();
    media.addEventListener('change', update);
    return () => media.removeEventListener('change', update);
  }, []);

  useEffect(
    () => () => {
      if (flipTimeoutRef.current !== null) {
        window.clearTimeout(flipTimeoutRef.current);
      }
    },
    []
  );

  // 機場翻牌：每次只隨機替換一列，候補不與目前四列重複；
  // 使用者已選取的門市保留在板上，避免地圖目標突然消失。
  useEffect(() => {
    if (
      boardPaused ||
      reduceMotion ||
      flipState !== null ||
      filtered.length <= STORE_BOARD_ROWS ||
      displayedIds.length === 0
    ) {
      return;
    }

    const timer = window.setTimeout(() => {
      const candidates = filtered.filter((store) => !displayedIds.includes(store.id));
      const replaceableSlots = displayedIds
        .map((id, index) => ({ id, index }))
        .filter(({ id }) => id !== selected);

      if (candidates.length === 0 || replaceableSlots.length === 0) return;

      const target =
        replaceableSlots[Math.floor(Math.random() * replaceableSlots.length)];
      const replacement = candidates[Math.floor(Math.random() * candidates.length)];

      setFlipState({ slot: target.index, previousId: target.id });
      setDisplayedIds((current) =>
        current.map((id, index) => (index === target.index ? replacement.id : id))
      );

      if (flipTimeoutRef.current !== null) {
        window.clearTimeout(flipTimeoutRef.current);
      }
      flipTimeoutRef.current = window.setTimeout(() => {
        setFlipState(null);
        flipTimeoutRef.current = null;
      }, STORE_FLIP_DURATION);
    }, STORE_FLIP_INTERVAL);

    return () => window.clearTimeout(timer);
  }, [boardPaused, displayedIds, filtered, flipState, reduceMotion, selected]);

  // 顯示中的門市：選取的若被篩掉，退回第一個可見門市（地圖永遠有目標）
  const visible =
    filtered.find((s) => s.id === selected) ??
    filtered[0] ??
    STORES.find((s) => s.id === selected)!;

  return (
    // 間距依模板實測：py 120
    <section
      aria-labelledby="store-location-heading"
      className="store-location-section relative overflow-hidden bg-[#f6f6f6] py-[60px]"
    >
      <div className="mx-auto w-full max-w-[1512px] pl-5 pr-[88px] sm:pl-8 sm:pr-[90px] lg:pl-[51px] lg:pr-[86px]">
        {/* ── 標題列：eyebrow(左欄) + 大標(右偏) + 十字裝飾線（同 PricingSection，相同座標/位置） ── */}
        <div className="relative mb-[60px]">
          {/* 十字裝飾線（桌面，座標與 PricingSection 一致）：橫線 y16 寬502、直線 x363、兩端箭頭 15px；#e3e3e8 */}
          <div
            aria-hidden
            className="absolute left-[-13px] top-[16px] hidden h-px w-[502px] bg-[#e3e3e8] lg:block"
          />
          <div
            aria-hidden
            className="absolute left-[363px] top-[-38px] hidden h-[179px] w-px bg-[#e3e3e8] lg:block"
          />
          <svg
            aria-hidden
            className="absolute left-[474px] top-0 hidden text-[#e3e3e8] lg:block"
            width="15"
            height="15"
            viewBox="0 0 15 15"
          >
            <path d="M15 15L3 11L0 11L12 15L15 15Z" fill="currentColor" />
          </svg>
          <svg
            aria-hidden
            className="absolute left-[347px] top-[126px] hidden text-[#e3e3e8] lg:block"
            width="15"
            height="15"
            viewBox="0 0 15 15"
          >
            <path d="M15 15L11 3L11 0L15 12L15 15Z" fill="currentColor" />
          </svg>

          <div className="grid grid-cols-1 items-start lg:grid-cols-[minmax(260px,424px)_minmax(0,1fr)] lg:pt-[46px]">
            <div className="mb-5 min-w-0 lg:mb-0">
              <span className="font-display inline-flex items-center gap-1.5 rounded-[24px] border border-[rgba(159,159,164,0.18)] pt-[7px] pr-[13px] pb-[6px] pl-[9px] text-[12px] tracking-[1px] uppercase text-[#1C1C1D]">
                <span className="inline-block w-1.5 h-1.5 rounded-full" style={{ background: GOLD }} />
                門市查詢
              </span>
            </div>
            {/* 模板 Contact 頁逐字：Have a Project in [Mind? Let’s Make] It Happen（金字重點 Mind? Let’s Make；彎引號 ’） */}
            <h2
              id="store-location-heading"
              className="min-w-0 max-w-[661px] font-display text-[42px] leading-[46px] capitalize text-[#1C1C1D] sm:text-[52px] sm:leading-[56px] xl:w-[661px] xl:text-[60px] xl:leading-[64px]"
            >
              Have a Project in{" "}
              <span style={{ color: GOLD }}>
                Mind?
                <br />
                Let’s Make
              </span>{" "}
              It Happen
            </h2>
          </div>
        </div>

        {/* ── 內容：地圖（寬，左）+ 門市清單（窄，右） ── */}
        <div className="flex min-w-0 flex-col gap-8 lg:flex-row">
          {/* 左：地圖（撐高與右側列表等高） */}
          <div className="flex w-full min-w-0 flex-col lg:w-[62%] lg:shrink-0">
            <div className="h-[var(--store-map-h)] overflow-hidden rounded-3xl bg-[#F6F6F6] shadow-sm lg:h-auto lg:min-h-[var(--store-map-h)] lg:flex-1">
              <GoogleStoreMap address={visible.address} focus={focused} />
            </div>
          </div>

          {/* 右：我的位置 + 區域/城市下拉 + 門市列表 */}
          <div className="min-w-0 flex-1">
            {/* 三個篩選控制固定同排、等寬；窄螢幕縮小內距與字級避免爆版。 */}
            <div className="store-location-filters mb-4 grid min-w-0 grid-cols-3 items-center gap-2 sm:gap-3">
              <button
                type="button"
                className="store-location-locate flex h-[52px] min-w-0 items-center justify-between gap-1 rounded-full border border-[rgba(159,159,164,0.25)] bg-white px-2 text-[13px] text-[#1C1C1D] transition-colors hover:border-[#CAA05C] focus:border-[#CAA05C] focus:outline-none sm:pl-5 sm:pr-4 sm:text-[15px]"
              >
                <span className="whitespace-nowrap">我的位置</span>
                <LocateFixed className="h-[18px] w-[18px] shrink-0 sm:h-[22px] sm:w-[22px]" style={{ color: GOLD }} />
              </button>

              <div className="relative min-w-0">
                <select
                  value={region}
                  onChange={(e) => {
                    setRegion(e.target.value);
                    setCity(''); // 換區域時清空城市
                  }}
                  className={`store-location-select h-[52px] w-full appearance-none rounded-full border border-[rgba(159,159,164,0.25)] bg-white pl-2.5 pr-6 text-[13px] transition-colors cursor-pointer focus:border-[#CAA05C] focus:outline-none sm:pl-5 sm:pr-10 sm:text-[15px] ${
                    region === '' ? 'text-[#9F9FA4]' : 'text-[#1C1C1D]'
                  }`}
                >
                  <option value="">選擇區域</option>
                  {Object.keys(REGIONS).map((r) => (
                    <option key={r} value={r}>
                      {r}
                    </option>
                  ))}
                </select>
                <ChevronDown className="store-location-select-chevron pointer-events-none absolute right-2 top-1/2 h-3.5 w-3.5 -translate-y-1/2 text-[#59585D] sm:right-3.5 sm:h-4 sm:w-4" />
              </div>

              <div className="relative min-w-0">
                <select
                  value={city}
                  onChange={(e) => setCity(e.target.value)}
                  aria-disabled={!region}
                  className={`store-location-select h-[52px] w-full appearance-none rounded-full border border-[rgba(159,159,164,0.25)] pl-2.5 pr-6 text-[13px] transition-colors focus:border-[#CAA05C] focus:outline-none sm:pl-5 sm:pr-10 sm:text-[15px] ${
                    !region
                      ? 'bg-[#F6F6F6] text-[#9F9FA4] cursor-not-allowed pointer-events-none'
                      : city === ''
                        ? 'bg-white cursor-pointer text-[#9F9FA4]'
                        : 'bg-white cursor-pointer text-[#1C1C1D]'
                  }`}
                >
                  <option value="">選擇城市</option>
                  {(REGIONS[region] ?? []).map((c) => (
                    <option key={c} value={c}>
                      {c}
                    </option>
                  ))}
                </select>
                <ChevronDown className="store-location-select-chevron pointer-events-none absolute right-2 top-1/2 h-3.5 w-3.5 -translate-y-1/2 text-[#59585D] sm:right-3.5 sm:h-4 sm:w-4" />
              </div>
            </div>

            {/* 門市資訊板：固定四列，候補門市逐列以機場翻牌方式隨機輪換。 */}
            <div
              className="space-y-3"
              onMouseEnter={() => setBoardPaused(true)}
              onMouseLeave={() => setBoardPaused(false)}
              onFocusCapture={() => setBoardPaused(true)}
              onBlurCapture={(event) => {
                if (!event.currentTarget.contains(event.relatedTarget as Node | null)) {
                  setBoardPaused(false);
                }
              }}
            >
              {filtered.length === 0 ? (
                <div className="rounded-2xl bg-white border border-[#E3E3E8] px-6 py-10 text-center text-[#59585D]">
                  此區域尚無門市資料。
                </div>
              ) : (
                displayedIds.map((storeId, index) => {
                  const store = filtered.find((item) => item.id === storeId);
                  if (!store) return null;

                  const active = store.id === visible.id;
                  const previousStore =
                    flipState?.slot === index
                      ? STORES.find((item) => item.id === flipState.previousId)
                      : undefined;

                  return (
                    <button
                      key={index}
                      type="button"
                      aria-label={`查看${store.name}：${store.address}`}
                      onClick={() => {
                        setSelected(store.id);
                        setFocused(true); // 點門市 → 地圖聚焦該門市（街道級）
                      }}
                      className="store-board-slot relative h-[112px] w-full rounded-2xl text-left outline-none sm:h-[94px] lg:h-[118px] xl:h-[94px]"
                    >
                      <StoreBoardFace
                        store={store}
                        active={active}
                        className={
                          previousStore ? 'store-board-face-in' : 'transition-colors'
                        }
                      />
                      {previousStore && (
                        <StoreBoardFace
                          store={previousStore}
                          active={previousStore.id === visible.id}
                          className="store-board-face-out absolute inset-0"
                        />
                      )}
                    </button>
                  );
                })
              )}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
