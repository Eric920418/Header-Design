<script setup lang="ts">
const props = defineProps<{ address: string; focus?: boolean }>()
const config = useRuntimeConfig()
const container = ref<HTMLElement | null>(null)
const error = ref('')
let map: any
let marker: any
let maps: any
let observer: IntersectionObserver | undefined
let resizeTimer: ReturnType<typeof setTimeout> | undefined
let currentCenter = { lat: 23.7, lng: 120.95 }
const cache = new Map<string, { lat: number; lng: number }>()
const TAIWAN_CENTER = { lat: 23.7, lng: 120.95 }
const TAIWAN_ZOOM = 7
const TAIWAN_BOUNDS = { south: 21.85, west: 119.95, north: 25.35, east: 122.05 }
const STORE_ZOOM = 16

// 與遷移前 Vite 地圖相同的 Antra 中性色盤，完整保留道路、行政區、公園與水域規則。
const MAP_STYLE = [
  { elementType: 'geometry', stylers: [{ color: '#fafafa' }] },
  { elementType: 'labels.icon', stylers: [{ visibility: 'off' }] },
  { elementType: 'labels.text.fill', stylers: [{ color: '#59585d' }] },
  { elementType: 'labels.text.stroke', stylers: [{ color: '#fafafa' }] },
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
]

// 遷移前的深色水滴與白色 S 標記，避免退回 Google 預設紅色 pin。
const MARKER_SVG =
  'data:image/svg+xml;charset=UTF-8,' +
  encodeURIComponent(
    `<svg xmlns="http://www.w3.org/2000/svg" width="40" height="52" viewBox="0 0 40 52">
      <path d="M20 0C9 0 0 9 0 20c0 14.5 20 32 20 32s20-17.5 20-32C40 9 31 0 20 0z" fill="#1C1C1D"/>
      <text x="20" y="27" font-family="Arial, sans-serif" font-size="20" font-weight="700" fill="#ffffff" text-anchor="middle">S</text>
    </svg>`,
  )

function loadMaps(key: string) {
  const current = window as typeof window & { google?: any; __sakuraMapsPromise?: Promise<any> }
  if (current.google?.maps) return Promise.resolve(current.google.maps)
  if (current.__sakuraMapsPromise) return current.__sakuraMapsPromise
  current.__sakuraMapsPromise = new Promise((resolve, reject) => {
    const callback = '__initSakuraMaps'
    ;(current as any)[callback] = () => resolve(current.google.maps)
    const script = document.createElement('script')
    script.src = `https://maps.googleapis.com/maps/api/js?key=${encodeURIComponent(key)}&callback=${callback}&language=zh-TW&region=TW&loading=async`
    script.async = true
    script.onerror = () => reject(new Error('Google Maps 載入失敗：請確認 API 金鑰、允許網域與 Maps JavaScript API 設定。'))
    document.head.appendChild(script)
  })
  return current.__sakuraMapsPromise
}

function fitTaiwan() {
  if (!map || !maps) return
  map.fitBounds(
    new maps.LatLngBounds(
      new maps.LatLng(TAIWAN_BOUNDS.south, TAIWAN_BOUNDS.west),
      new maps.LatLng(TAIWAN_BOUNDS.north, TAIWAN_BOUNDS.east),
    ),
  )
}

function locate(address: string) {
  if (!map || !maps) return
  const place = (location: { lat: number; lng: number }) => {
    currentCenter = location
    if (!marker) {
      marker = new maps.Marker({
        map,
        title: address,
        icon: {
          url: MARKER_SVG,
          scaledSize: new maps.Size(40, 52),
          anchor: new maps.Point(20, 52),
        },
      })
    }
    marker.setPosition(location)
    if (props.focus) {
      map.panTo(location)
      map.setZoom(STORE_ZOOM)
    } else {
      fitTaiwan()
    }
  }
  const cached = cache.get(address)
  if (cached) return place(cached)
  new maps.Geocoder().geocode({ address, region: 'TW' }, (results: any[], status: string) => {
    if (status !== 'OK' || !results?.[0]) { error.value = `門市地址定位失敗（${status}）：請確認地址與 Geocoding API 設定。`; return }
    const point = results[0].geometry.location
    const location = { lat: point.lat(), lng: point.lng() }
    cache.set(address, location)
    place(location)
  })
}

onMounted(async () => {
  const key = String(config.public.googleMapsApiKey || '')
  if (!key) { error.value = '缺少 Google Maps API 金鑰：請設定 NUXT_PUBLIC_GOOGLE_MAPS_API_KEY 後重新啟動網站。'; return }
  try {
    maps = await loadMaps(key)
    if (!container.value) return
    map = new maps.Map(container.value, {
      center: TAIWAN_CENTER,
      zoom: TAIWAN_ZOOM,
      styles: MAP_STYLE,
      disableDefaultUI: true,
      zoomControl: true,
      gestureHandling: 'cooperative',
    })

    // 地圖在首屏外初始化時 Google 會延後繪製圖磚；進入視窗後重繪並恢復舊版視野。
    observer = new IntersectionObserver((entries) => {
      if (!entries.some(entry => entry.isIntersecting) || !map) return
      observer?.disconnect()
      resizeTimer = setTimeout(() => {
        if (!map) return
        maps.event.trigger(map, 'resize')
        window.dispatchEvent(new Event('resize'))
        if (props.focus) {
          map.setCenter(currentCenter)
          map.setZoom(STORE_ZOOM)
        } else {
          fitTaiwan()
        }
      }, 300)
    }, { threshold: 0.01 })
    observer.observe(container.value)
    locate(props.address)
  } catch (reason) {
    error.value = reason instanceof Error ? reason.message : String(reason)
  }
})

watch(() => [props.address, props.focus], () => locate(props.address))
onBeforeUnmount(() => {
  observer?.disconnect()
  if (resizeTimer) clearTimeout(resizeTimer)
})
</script>

<template>
  <div class="antra-map relative h-full w-full"><div ref="container" class="h-full w-full" /><div v-if="error" role="alert" class="absolute inset-0 flex items-center justify-center bg-[#F6F6F6] p-6 text-center text-sm leading-6 text-[#CAA05C]">{{ error }}</div></div>
</template>
