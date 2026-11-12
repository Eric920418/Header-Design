import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import { transpileModule, ScriptTarget } from 'typescript'

const source = readFileSync(new URL('../pages/builders/index.vue', import.meta.url), 'utf8')
const script = source.slice(source.indexOf('const strengthsList ='), source.indexOf('const selectPavilion ='))
const js = transpileModule(script, { compilerOptions: { target: ScriptTarget.ES2022 } }).outputText
const items = [0, 1, 2].map(index => ({ dataset: { strengthIndex: String(index) } }))
const mounted = [], unmounted = [], observed = [], strengths = [{ value: ['45', '萬'] }, { value: ['AI', '智能'] }, { value: ['管理', '平台'] }]
let observer
class Observer {
  constructor(callback, options) { this.callback = callback; this.options = options; observer = this }
  observe(item) { observed.push(item) }
  disconnect() { this.disconnected = true }
}
const api = new Function('ref', 'computed', 'strengths', 'onMounted', 'onBeforeUnmount', 'window', 'IntersectionObserver', js + ';return { strengthsList, activeStrengthIndex, activeStrength }')(
  value => ({ value }), fn => ({ get value() { return fn() } }), strengths,
  fn => mounted.push(fn), fn => unmounted.push(fn), { IntersectionObserver: Observer, innerHeight: 900 }, Observer,
)
api.strengthsList.value = { querySelectorAll: () => items }
mounted.forEach(fn => fn())
assert.deepEqual(observed, items)
assert.equal(observer.options.rootMargin, '-35% 0px -35% 0px')
for (const index of [0, 1, 2, 1, 0]) {
  observer.callback([{ target: items[index], isIntersecting: true, boundingClientRect: { top: 300, height: 300 } }])
  assert.equal(api.activeStrengthIndex.value, index)
  assert.equal(api.activeStrength.value, strengths[index])
}
observer.callback([{ target: items[2], isIntersecting: false }])
assert.equal(api.activeStrengthIndex.value, 0, '離開中央區域不能跳到不可見圖片')
unmounted.forEach(fn => fn())
assert(observer.disconnected)
console.log('PASS 三圖中央區域選取、前進／返回切換、離開保留及卸載清理')
