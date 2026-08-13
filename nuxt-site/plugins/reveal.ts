import type { DirectiveBinding, VNode } from 'vue'

type RevealAnimation =
  | 'opalMoveUp'
  | 'opalMoveDown'
  | 'opalMoveLeft'
  | 'opalMoveRight'
  | 'opalScaleUp'
  | 'slideInUp'
  | 'slideInDown'
  | 'slideInLeft'
  | 'slideInRight'
  | 'fadeIn'
  | 'fadeInUp'
  | 'fadeInDown'

type RevealDuration = 'fast' | 'normal' | 'slow'

interface RevealOptions {
  anim?: RevealAnimation
  delay?: number
  duration?: RevealDuration
}

const revealAnimations = new Set<RevealAnimation>([
  'opalMoveUp',
  'opalMoveDown',
  'opalMoveLeft',
  'opalMoveRight',
  'opalScaleUp',
  'slideInUp',
  'slideInDown',
  'slideInLeft',
  'slideInRight',
  'fadeIn',
  'fadeInUp',
  'fadeInDown',
])

const observers = new WeakMap<HTMLElement, IntersectionObserver>()

const optionsFrom = (binding: DirectiveBinding<RevealOptions | RevealAnimation | undefined>) => {
  if (typeof binding.value === 'string') return { anim: binding.value }
  return binding.value ?? {}
}

const validAnimation = (value: string | undefined): RevealAnimation =>
  value && revealAnimations.has(value as RevealAnimation) ? value as RevealAnimation : 'opalMoveUp'

const normalizedDelay = (value: number | undefined) =>
  typeof value === 'number' && Number.isFinite(value) ? Math.max(0, Math.min(5000, value)) : undefined

const durationClass = (duration: RevealDuration | undefined) =>
  duration === 'fast' ? 'ev-fast' : duration === 'slow' ? 'ev-slow' : undefined

const prepareElement = (
  element: HTMLElement,
  binding: DirectiveBinding<RevealOptions | RevealAnimation | undefined>,
) => {
  const options = optionsFrom(binding)
  const animation = validAnimation(options.anim ?? element.dataset.ev)
  const delay = normalizedDelay(options.delay)

  element.classList.add('ev')
  element.dataset.ev = animation

  if (delay !== undefined) element.style.animationDelay = `${delay}ms`
  if (options.duration) {
    element.classList.remove('ev-fast', 'ev-slow')
    const speedClass = durationClass(options.duration)
    if (speedClass) element.classList.add(speedClass)
  }
}

export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.vueApp.directive('reveal', {
    getSSRProps(binding: DirectiveBinding<RevealOptions | RevealAnimation | undefined>) {
      const options = optionsFrom(binding)
      if (!binding.value) return {}

      const delay = normalizedDelay(options.delay)
      const speedClass = durationClass(options.duration)

      return {
        class: ['ev', speedClass].filter(Boolean).join(' '),
        'data-ev': validAnimation(options.anim),
        ...(delay !== undefined ? { style: { animationDelay: `${delay}ms` } } : {}),
      }
    },
    created(
      element: HTMLElement,
      binding: DirectiveBinding<RevealOptions | RevealAnimation | undefined>,
      vnode: VNode,
    ) {
      const options = optionsFrom(binding)
      const delay = normalizedDelay(options.delay)
      const speedClass = durationClass(options.duration)
      const props = vnode.props ?? (vnode.props = {})

      props.class = [props.class, 'ev', speedClass].filter(Boolean)
      props['data-ev'] = validAnimation(options.anim ?? element.dataset.ev)
      if (delay !== undefined && props.style && typeof props.style === 'object' && !Array.isArray(props.style)) {
        props.style = { ...props.style, animationDelay: `${delay}ms` }
      }

      prepareElement(element, binding)
    },
    mounted(
      element: HTMLElement,
      binding: DirectiveBinding<RevealOptions | RevealAnimation | undefined>,
    ) {
      prepareElement(element, binding)

      const show = () => {
        if (element.classList.contains('is-visible')) return
        requestAnimationFrame(() => element.classList.add('is-visible'))
        observers.get(element)?.disconnect()
        observers.delete(element)
      }

      if (
        window.matchMedia('(prefers-reduced-motion: reduce)').matches
        || !('IntersectionObserver' in window)
      ) {
        element.classList.add('is-visible')
        return
      }

      const observer = new IntersectionObserver(
        ([entry]) => {
          if (entry?.isIntersecting) show()
        },
        { threshold: 0.01, rootMargin: '0px 0px -10% 0px' },
      )

      observers.set(element, observer)
      observer.observe(element)

      requestAnimationFrame(() => {
        const rect = element.getBoundingClientRect()
        if (rect.top <= window.innerHeight * 0.9) show()
      })
    },
    beforeUnmount(element: HTMLElement) {
      observers.get(element)?.disconnect()
      observers.delete(element)
    },
  })
})
