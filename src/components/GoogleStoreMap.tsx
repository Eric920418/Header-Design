import React, { useEffect, useRef, useState } from 'react';

// Google Maps JS API 金鑰（前端可公開的 client key，建議在 Google Cloud 以 HTTP referrer 限制網域）
// 需在專案根目錄 .env 設定：VITE_GOOGLE_MAPS_API_KEY=你的金鑰
// 並在 Google Cloud 啟用「Maps JavaScript API」與「Geocoding API」
const API_KEY = (import.meta as any).env?.VITE_GOOGLE_MAPS_API_KEY as string | undefined;

// 初始總覽：整個台灣主島（fitBounds 用邊界 + 概略中心/縮放當尚未量到尺寸前的 fallback）
const TAIWAN_CENTER = { lat: 23.7, lng: 120.95 };
const TAIWAN_ZOOM = 7;
const TAIWAN_BOUNDS = { south: 21.85, west: 119.95, north: 25.35, east: 122.05 };
// 使用者點選門市後聚焦的街道級縮放
const STORE_ZOOM = 16;

// 地圖功能不變；可見圖面只使用 Antra 模板的中性色盤。
const LIGHT_STYLE: any[] = [
  { elementType: 'geometry', stylers: [{ color: '#f6f6f6' }] },
  { elementType: 'labels.icon', stylers: [{ visibility: 'off' }] },
  { elementType: 'labels.text.fill', stylers: [{ color: '#59585d' }] },
  { elementType: 'labels.text.stroke', stylers: [{ color: '#f6f6f6' }] },
  { featureType: 'administrative', elementType: 'geometry', stylers: [{ visibility: 'off' }] },
  { featureType: 'administrative.land_parcel', stylers: [{ visibility: 'off' }] },
  { featureType: 'administrative.neighborhood', stylers: [{ visibility: 'off' }] },
  { featureType: 'poi', stylers: [{ visibility: 'off' }] },
  { featureType: 'poi.park', elementType: 'geometry', stylers: [{ color: '#e3e3e8' }] },
  { featureType: 'poi.park', elementType: 'labels.text.fill', stylers: [{ color: '#9f9fa4' }] },
  { featureType: 'road', elementType: 'geometry', stylers: [{ color: '#ffffff' }] },
  { featureType: 'road', elementType: 'labels.text.fill', stylers: [{ color: '#59585d' }] },
  { featureType: 'road.arterial', elementType: 'geometry', stylers: [{ color: '#ffffff' }] },
  { featureType: 'road.highway', elementType: 'geometry', stylers: [{ color: '#e3e3e8' }] },
  { featureType: 'road.local', elementType: 'geometry', stylers: [{ color: '#ffffff' }] },
  { featureType: 'transit', stylers: [{ visibility: 'off' }] },
  { featureType: 'water', elementType: 'geometry', stylers: [{ color: '#e3e3e8' }] },
  { featureType: 'water', elementType: 'labels.text.fill', stylers: [{ color: '#9f9fa4' }] },
];

// 深色水滴 + 白色「S」標記（仿官網）
const MARKER_SVG =
  'data:image/svg+xml;charset=UTF-8,' +
  encodeURIComponent(
    `<svg xmlns="http://www.w3.org/2000/svg" width="40" height="52" viewBox="0 0 40 52">
      <path d="M20 0C9 0 0 9 0 20c0 14.5 20 32 20 32s20-17.5 20-32C40 9 31 0 20 0z" fill="#1C1C1D"/>
      <text x="20" y="27" font-family="Arial, sans-serif" font-size="20" font-weight="700" fill="#ffffff" text-anchor="middle">S</text>
    </svg>`
  );

// 全域只載入一次 Google Maps script（多個實例共用同一個 Promise）
let mapsPromise: Promise<any> | null = null;
function loadGoogleMaps(key: string): Promise<any> {
  if (typeof window === 'undefined') return Promise.reject(new Error('no window'));
  if ((window as any).google?.maps) return Promise.resolve((window as any).google.maps);
  if (mapsPromise) return mapsPromise;
  mapsPromise = new Promise((resolve, reject) => {
    const cbName = '__initGoogleMaps__';
    (window as any)[cbName] = () => resolve((window as any).google.maps);
    const script = document.createElement('script');
    script.src = `https://maps.googleapis.com/maps/api/js?key=${encodeURIComponent(
      key
    )}&callback=${cbName}&language=zh-TW&region=TW`;
    script.async = true;
    script.defer = true;
    script.onerror = () =>
      reject(new Error('Google Maps 載入失敗：請確認 API 金鑰有效、已啟用 Maps JavaScript API，且網域在金鑰允許清單內。'));
    document.head.appendChild(script);
  });
  return mapsPromise;
}

export function GoogleStoreMap({ address, focus = false }: { address: string; focus?: boolean }) {
  const containerRef = useRef<HTMLDivElement>(null);
  const mapRef = useRef<any>(null);
  const markerRef = useRef<any>(null);
  const geocodeCache = useRef<Map<string, { lat: number; lng: number }>>(new Map());
  const centerRef = useRef<{ lat: number; lng: number }>(TAIWAN_CENTER);
  // focus=false → 顯示整個台灣（總覽）；focus=true → 聚焦選定門市。用 ref 讓非同步回呼讀到最新值。
  const focusRef = useRef(focus);
  const observerRef = useRef<IntersectionObserver | null>(null);
  const [error, setError] = useState('');

  // 初始化地圖（金鑰就緒後載入 script、建立地圖）
  useEffect(() => {
    if (!API_KEY) {
      setError('缺少 Google Maps API 金鑰：請在專案根目錄建立 .env 並設定 VITE_GOOGLE_MAPS_API_KEY=你的金鑰，然後重啟 pnpm dev。');
      return;
    }
    let cancelled = false;
    loadGoogleMaps(API_KEY)
      .then((maps) => {
        if (cancelled || !containerRef.current) return;
        if (!mapRef.current) {
          mapRef.current = new maps.Map(containerRef.current, {
            center: TAIWAN_CENTER,
            zoom: TAIWAN_ZOOM,
            styles: LIGHT_STYLE,
            disableDefaultUI: true,
            zoomControl: true,
            gestureHandling: 'cooperative',
          });

          // 修正「地圖在視窗外/初始化尺寸未定時圖磚不繪製」：進入視窗時（一次性、延後一個 tick）觸發重繪
          observerRef.current = new IntersectionObserver(
            (entries) => {
              if (entries.some((e) => e.isIntersecting) && mapRef.current) {
                observerRef.current?.disconnect(); // 只需觸發一次
                // 延後發送，避開「建立當下」尚未完成合成的時機
                setTimeout(() => {
                  if (!mapRef.current) return;
                  maps.event.trigger(mapRef.current, 'resize');
                  window.dispatchEvent(new Event('resize'));
                  // 尺寸確定後再框：未聚焦 → 框整個台灣；已聚焦 → 回到門市中心+街道級
                  if (focusRef.current) {
                    mapRef.current.setCenter(centerRef.current);
                    mapRef.current.setZoom(STORE_ZOOM);
                  } else {
                    fitTaiwan(maps);
                  }
                }, 300);
              }
            },
            { threshold: 0.01 }
          );
          if (containerRef.current) observerRef.current.observe(containerRef.current);
        }
        updateMarker(maps, address);
      })
      .catch((e) => {
        if (!cancelled) setError(e.message || String(e));
      });
    return () => {
      cancelled = true;
      observerRef.current?.disconnect();
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // address / focus 變更 → 重新定位。focus=true 才聚焦門市；focus=false 維持台灣總覽。
  useEffect(() => {
    const maps = (window as any).google?.maps;
    if (!maps || !mapRef.current) return;
    focusRef.current = focus;
    updateMarker(maps, address); // 內部依 focusRef 決定是否平移/縮放到門市
    if (!focus) fitTaiwan(maps); // 取消聚焦 → 回到整個台灣
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [address, focus]);

  // 框住整個台灣主島（隨容器尺寸自適應）
  function fitTaiwan(maps: any) {
    if (!mapRef.current) return;
    mapRef.current.fitBounds(
      new maps.LatLngBounds(
        new maps.LatLng(TAIWAN_BOUNDS.south, TAIWAN_BOUNDS.west),
        new maps.LatLng(TAIWAN_BOUNDS.north, TAIWAN_BOUNDS.east)
      )
    );
  }

  function placeAt(maps: any, loc: { lat: number; lng: number }) {
    centerRef.current = loc;
    if (!markerRef.current) {
      markerRef.current = new maps.Marker({
        map: mapRef.current,
        icon: {
          url: MARKER_SVG,
          scaledSize: new maps.Size(40, 52),
          anchor: new maps.Point(20, 52),
        },
      });
    }
    markerRef.current.setPosition(loc);
    // 只有使用者選了門市（focus）才平移+放大到街道級；否則只放 pin、維持台灣總覽
    if (focusRef.current) {
      mapRef.current.panTo(loc);
      mapRef.current.setZoom(STORE_ZOOM);
    }
  }

  function updateMarker(maps: any, addr: string) {
    const cached = geocodeCache.current.get(addr);
    if (cached) {
      placeAt(maps, cached);
      return;
    }
    new maps.Geocoder().geocode({ address: addr, region: 'TW' }, (results: any, status: string) => {
      if (status === 'OK' && results && results[0]) {
        const l = results[0].geometry.location;
        const loc = { lat: l.lat(), lng: l.lng() };
        geocodeCache.current.set(addr, loc);
        placeAt(maps, loc);
      } else {
        setError('門市地址定位失敗（' + status + '）：請確認金鑰已啟用 Geocoding API。');
      }
    });
  }

  return (
    <div className="antra-map relative w-full h-full">
      <div ref={containerRef} className="w-full h-full" />
      {error && (
        <div className="absolute inset-0 flex items-center justify-center bg-[#F6F6F6] p-6 text-center text-sm text-[#CAA05C]">
          {error}
        </div>
      )}
    </div>
  );
}
