import assert from 'node:assert/strict'
import { readFile } from 'node:fs/promises'
import vm from 'node:vm'
import ts from 'typescript'

const source = await readFile(new URL('../pages/about/introduce.vue', import.meta.url), 'utf8')
const update = source.match(/function updateValuesProgress\(\) \{[\s\S]*?\n\}/)?.[0]
assert.ok(update, '品牌理念必須有捲動進度更新')
let mobile = true
let top = 60
const section = { offsetHeight: 2848, getBoundingClientRect: () => ({ top }) }
const stage = { offsetHeight: 712 }
const state = {
  valuesFrame: 1,
  mobileValues: { value: false },
  valuesSection: { value: section },
  valuesStage: { value: stage },
  valuesProgress: { value: 0 },
  activeValueId: { value: 'service' },
  brandValues: ['brand', 'integration', 'service', 'family'].map(id => ({ id })),
  window: { matchMedia: () => ({ matches: mobile }) },
  getComputedStyle: () => ({ top: '60px' }),
}
const run = vm.runInNewContext(`${ts.transpile(update)}; updateValuesProgress`, state)
for (const [position, expected] of [[800, 'brand'], [60, 'brand'], [-473.9, 'brand'], [-474, 'integration'], [-1008, 'service'], [-1542, 'family'], [-3000, 'family'], [-1008, 'service'], [60, 'brand']]) {
  top = position
  run()
  assert.equal(state.activeValueId.value, expected, `捲動位置${position}必須同步正確理念`)
}
stage.offsetHeight = 243
section.offsetHeight = 972
top = -122.25
run()
assert.equal(state.activeValueId.value, 'integration', '橫向短窗須使用新的舞台高度與安全留白')
mobile = false
top = -3000
run()
assert.equal(state.activeValueId.value, 'integration', '桌面捲動不得覆寫原Hover／Focus狀態')
mobile = true
state.brandValues = []
assert.doesNotThrow(run, '空資料不得產生索引錯誤')
console.log('PASS 手機理念捲動邊界、反向、短窗、桌面隔離與空資料')
