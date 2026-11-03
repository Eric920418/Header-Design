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

const layer = source.match(/function valuesLayerStyle\(index: number\) \{[\s\S]*?\n\}/)?.[0]
assert.ok(layer, '圖文必須直接使用捲動進度')
state.brandValues = ['brand', 'integration', 'service', 'family'].map(id => ({ id }))
state.mobileValues.value = true
state.reducedMotion = { value: false }
const style = vm.runInNewContext(`${ts.transpile(layer)}; valuesLayerStyle`, state)
for (let index = 0; index < 4; index++) {
  state.valuesProgress.value = (index + .5) / 4
  state.activeValueId.value = state.brandValues[index].id
  assert.equal(style(index)['--value-copy-opacity'], 1, '每段保留完整可讀的停留區')
  assert.equal(style(index)['--value-image-opacity'], 1)
  assert.equal(style(index)['--value-copy-y'], '0px')
}
for (let index = 1; index < 4; index++) {
  const samples = [.84, .92, 1, 1.08, 1.16].map(offset => {
    state.valuesProgress.value = (index - 1 + offset) / 4
    return style(index)['--value-image-opacity']
  })
  assert.ok(samples.every((value, i) => i === 0 || value > samples[i - 1]), '門檻附近必須連續漸變，不能整段靜止後跳換')
  state.valuesProgress.value = index / 4
  const forward = style(index)
  state.valuesProgress.value += .02
  style(index)
  state.valuesProgress.value -= .02
  assert.deepEqual(style(index), forward, '反向與停手必須得到相同進度，沒有時間追趕')
}
state.reducedMotion.value = true
state.activeValueId.value = 'integration'
assert.equal(style(1)['--value-image-opacity'], 1)
assert.equal(style(0)['--value-image-opacity'], 0)
assert.equal(style(1)['--value-copy-y'], '0px')
state.mobileValues.value = false
assert.equal(style(1), undefined, '桌面不得套用手機圖文透明度')
console.log('PASS 連續圖文混合、停留、反向、減少動態及桌面隔離')
