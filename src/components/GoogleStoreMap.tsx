import React, { useEffect, useRef, useState } from 'react';

// Google Maps JS API 金鑰（前端可公開的 client key，建議在 Google Cloud 以 HTTP referrer 限制網域）
// 需在專案根目錄 .env 設定：VITE_GOOGLE_MAPS_API_KEY=你的金鑰
// 並在 Google Cloud 啟用「Maps JavaScript API」與「Geocoding API」
const API_KEY = (import.meta as any).env?.VITE_GOOGLE_MAPS_API_KEY as string | undefined;

// 台北市中心當預設中心（金鑰/定位就緒前）
const DEFAULT_CENTER = { lat: 25.0478, lng: 121.5319 };

// 極簡淺灰地圖樣式（仿 sakura-kitchenlife.com.tw/store/location 的 Positron 風）
const LIGHT_STYLE: any[] = [
  { elementType: 'geometry', stylers: [{ color: '#f5f5f5' }] },
  { elementType: 'labels.icon', stylers: [{ visibility: 'off' }] },
  { elementType: 'labels.text.fill', stylers: [{ color: '#8f8f8f' }] },
  { elementType: 'labels.text.stroke', stylers: [{ color: '#f5f5f5' }] },
  { featureType: 'administrative', elementType: 'geometry', stylers: [{ visibility: 'off' }] },
  { featureType: 'administrative.land_parcel', stylers: [{ visibility: 'off' }] },
  { featureType: 'administrative.neighborhood', stylers: [{ visibility: 'off' }] },
  { featureType: 'poi', stylers: [{ visibility: 'off' }] },
  { featureType: 'poi.park', elementType: 'geometry', stylers: [{ color: '#eaeaea' }] },
  { featureType: 'poi.park', elementType: 'labels.text.fill', stylers: [{ color: '#b0b0b0' }] },
  { featureType: 'road', elementType: 'geometry', stylers: [{ color: '#ffffff' }] },
  { featureType: 'road', elementType: 'labels.text.fill', stylers: [{ color: '#9a9a9a' }] },
  { featureType: 'road.arterial', elementType: 'geometry', stylers: [{ color: '#ffffff' }] },
  { featureType: 'road.highway', elementType: 'geometry', stylers: [{ color: '#efefef' }] },
  { featureType: 'road.local', elementType: 'geometry', stylers: [{ color: '#ffffff' }] },
  { featureType: 'transit', stylers: [{ visibility: 'off' }] },
  { featureType: 'water', elementType: 'geometry', stylers: [{ color: '#e4e4e4' }] },
  { featureType: 'water', elementType: 'labels.text.fill', stylers: [{ color: '#bcbcbc' }] },
];

// 深色水滴 + 白色「S」標記（仿官網）
const MARKER_SVG =
  'data:image/svg+xml;charset=UTF-8,' +
  encodeURIComponent(
    `<svg xmlns="http://www.w3.org/2000/svg" width="40" height="52" viewBox="0 0 40 52">
      <path d="M20 0C9 0 0 9 0 20c0 14.5 20 32 20 32s20-17.5 20-32C40 9 31 0 20 0z" fill="#3a3a3c"/>
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

export function GoogleStoreMap({ address }: { address: string }) {
  const containerRef = useRef<HTMLDivElement>(null);
  const mapRef = useRef<any>(null);
  const markerRef = useRef<any>(null);
  const geocodeCache = useRef<Map<string, { lat: number; lng: number }>>(new Map());
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
            center: DEFAULT_CENTER,
            zoom: 16,
            styles: LIGHT_STYLE,
            disableDefaultUI: true,
            zoomControl: true,
            gestureHandling: 'cooperative',
          });
        }
        updateMarker(maps, address);
      })
      .catch((e) => {
        if (!cancelled) setError(e.message || String(e));
      });
    return () => {
      cancelled = true;
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  // address 變更 → 重新定位
  useEffect(() => {
    const maps = (window as any).google?.maps;
    if (maps && mapRef.current) updateMarker(maps, address);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [address]);

  function placeAt(maps: any, loc: { lat: number; lng: number }) {
    mapRef.current.panTo(loc);
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
    <div className="relative w-full h-full">
      <div ref={containerRef} className="w-full h-full" />
      {error && (
        <div className="absolute inset-0 flex items-center justify-center bg-gray-100 p-6 text-center text-sm text-red-600">
          {error}
        </div>
      )}
    </div>
  );
}
