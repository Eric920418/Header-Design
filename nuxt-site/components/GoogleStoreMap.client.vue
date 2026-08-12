<script setup lang="ts">
const props = defineProps<{ address: string; focus?: boolean }>()
const config = useRuntimeConfig()
const container = ref<HTMLElement | null>(null)
const error = ref('')
let map: any
let marker: any
let maps: any
const cache = new Map<string, { lat: number; lng: number }>()
const TAIWAN = { lat: 23.7, lng: 120.95 }

const style = [
  { elementType: 'geometry', stylers: [{ color: '#f6f6f6' }] },
  { elementType: 'labels.icon', stylers: [{ visibility: 'off' }] },
  { elementType: 'labels.text.fill', stylers: [{ color: '#59585d' }] },
  { elementType: 'labels.text.stroke', stylers: [{ color: '#f6f6f6' }] },
  { featureType: 'poi', stylers: [{ visibility: 'off' }] },
  { featureType: 'transit', stylers: [{ visibility: 'off' }] },
  { featureType: 'road', elementType: 'geometry', stylers: [{ color: '#ffffff' }] },
  { featureType: 'water', elementType: 'geometry', stylers: [{ color: '#e3e3e8' }] },
]

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
  map.fitBounds(new maps.LatLngBounds(new maps.LatLng(21.85, 119.95), new maps.LatLng(25.35, 122.05)))
}

function locate(address: string) {
  if (!map || !maps) return
  const place = (location: { lat: number; lng: number }) => {
    if (!marker) marker = new maps.Marker({ map, title: address })
    marker.setPosition(location)
    if (props.focus) { map.panTo(location); map.setZoom(16) } else fitTaiwan()
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
    map = new maps.Map(container.value, { center: TAIWAN, zoom: 7, styles: style, disableDefaultUI: true, zoomControl: true, gestureHandling: 'cooperative' })
    locate(props.address)
  } catch (reason) {
    error.value = reason instanceof Error ? reason.message : String(reason)
  }
})

watch(() => [props.address, props.focus], () => locate(props.address))
</script>

<template>
  <div class="antra-map relative h-full w-full"><div ref="container" class="h-full w-full" /><div v-if="error" role="alert" class="absolute inset-0 flex items-center justify-center bg-[#F6F6F6] p-6 text-center text-sm leading-6 text-[#CAA05C]">{{ error }}</div></div>
</template>
