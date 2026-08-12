import { gsap } from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

export default defineNuxtPlugin((nuxtApp) => {
  gsap.registerPlugin(ScrollTrigger)
  let contexts: gsap.Context[] = []

  const clear = () => {
    contexts.forEach(context => context.revert())
    contexts = []
  }

  const init = () => {
    clear()
    if (window.innerWidth <= 992 || window.matchMedia('(prefers-reduced-motion: reduce)').matches) return

    const gallery = document.querySelector<HTMLElement>('.gallery-section')
    if (gallery) {
      contexts.push(gsap.context(() => {
        gsap.fromTo('.gallery-bg', { yPercent: -8, scale: 1.12 }, {
          yPercent: 8,
          scale: 1.12,
          ease: 'none',
          scrollTrigger: { trigger: gallery, start: 'top bottom', end: 'bottom top', scrub: 0.5 },
        })
      }, gallery))
    }

    const promise = document.querySelector<HTMLElement>('.what-we-do-section')
    if (promise) {
      contexts.push(gsap.context(() => {
        gsap.fromTo('.wwd-blueprint', { yPercent: -6 }, {
          yPercent: 6,
          ease: 'none',
          scrollTrigger: { trigger: promise, start: 'top bottom', end: 'bottom top', scrub: 0.5 },
        })
      }, promise))
    }

    ScrollTrigger.refresh()
  }

  onNuxtReady(() => requestAnimationFrame(init))
  nuxtApp.hook('page:finish', () => {
    requestAnimationFrame(init)
  })
})
