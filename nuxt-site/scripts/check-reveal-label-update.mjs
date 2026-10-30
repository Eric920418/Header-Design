import { readFile } from 'node:fs/promises'
import vm from 'node:vm'
import assert from 'node:assert/strict'
import ts from 'typescript'

const input = await readFile(new URL('../plugins/reveal.ts', import.meta.url), 'utf8')
const output = ts.transpileModule(input, {
  compilerOptions: { target: ts.ScriptTarget.ES2022, module: ts.ModuleKind.ESNext },
}).outputText.replace(/^import .* from ['"]vue['"];?\n/m, '').replace('export default ', '')

let directive
let mobile = true
class Observer { observe() {} disconnect() {} }
vm.runInNewContext(output, {
  normalizeClass: () => '',
  normalizeStyle: () => ({}),
  window: {
    innerHeight: 900,
    IntersectionObserver: Observer,
    matchMedia: query => ({ matches: query.includes('max-width') ? mobile : false }),
  },
  IntersectionObserver: Observer,
  requestAnimationFrame: fn => fn(),
  defineNuxtPlugin: fn => fn({ vueApp: { directive: (_, value) => { directive = value } } }),
})

const make = (label, top = 0) => {
  const classes = new Set(label ? ['section-pill'] : [])
  return {
    classes,
    el: {
      classList: {
        add: (...values) => values.forEach(value => classes.add(value)),
        remove: (...values) => values.forEach(value => classes.delete(value)),
        contains: value => classes.has(value),
      },
      dataset: {},
      style: {},
      getBoundingClientRect: () => ({ top }),
    },
  }
}
const binding = { value: { anim: 'opalMoveUp' } }
const waiting = make(true, 2000)
directive.mounted(waiting.el, binding)
directive.updated(waiting.el)
assert.equal(waiting.classes.has('is-visible'), false)
assert.equal(waiting.el.dataset.revealDirect, undefined)

const entered = make(true)
directive.mounted(entered.el, binding)
assert.equal(entered.classes.has('is-visible'), true)
assert.equal(entered.el.dataset.revealDirect, undefined)
entered.classes.delete('is-visible')
directive.updated(entered.el)
assert.equal(entered.classes.has('is-visible'), true)
assert.equal(entered.el.dataset.revealDirect, '')
directive.updated(entered.el)
assert.equal(entered.el.dataset.revealDirect, '')

for (const [isMobile, isLabel] of [[false, true], [true, false]]) {
  mobile = isMobile
  const excluded = make(isLabel)
  directive.mounted(excluded.el, binding)
  excluded.classes.delete('is-visible')
  directive.updated(excluded.el)
  assert.equal(excluded.classes.has('is-visible'), false)
  assert.equal(excluded.el.dataset.revealDirect, undefined)
}
directive.beforeUnmount(waiting.el)
console.log('PASS mobile label restoration, pending entry, initial animation, idempotence, desktop and non-label exclusions')
