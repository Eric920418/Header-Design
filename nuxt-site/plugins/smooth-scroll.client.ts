import Lenis from 'lenis'

export default defineNuxtPlugin(() => {
  if (window.matchMedia('(prefers-reduced-motion: reduce)').matches || window.innerWidth <= 992) return

  const lenis = new Lenis({
    duration: 1.2,
    easing: (value: number) => Math.min(1, 1.001 - 2 ** (-10 * value)),
  })
  let frame = 0
  const raf = (time: number) => {
    lenis.raf(time)
    frame = requestAnimationFrame(raf)
  }
  frame = requestAnimationFrame(raf)

  onNuxtReady(() => {
    window.addEventListener('beforeunload', () => {
      cancelAnimationFrame(frame)
      lenis.destroy()
    }, { once: true })
  })
})
