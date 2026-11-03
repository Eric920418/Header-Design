import assert from 'node:assert/strict'
import { readFile } from 'node:fs/promises'
import vm from 'node:vm'
import ts from 'typescript'

const source = await readFile(new URL('../pages/about/introduce.vue', import.meta.url), 'utf8')
const names = ['refreshValuesLayout', 'updateValuesProgress', 'valuesLayerStyle']
const functions = names.map(name => {
  const code = source.match(new RegExp(`function ${name}\\([^]*?\\n\\}`))?.[0]
  assert.ok(code, `缺少${name}`)
  return code
}).join('\n')
let mobile = true
let top = 60
let styleReads = 0
let writes = 0
const layerNode = () => ({ style: { setProperty: () => { writes++ } } })
const section = { offsetHeight: 2848, getBoundingClientRect: () => ({ top }) }
const stage = { ...layerNode(), offsetHeight: 712 }
const state = {
  valuesFrame: 1, valuesProgress: -1, valuesTop: 0, valuesRange: 1,
  mobileValues: { value: false }, nativeValuesTimeline: { value: false }, reducedMotion: { value: false },
  valuesSection: { value: section }, valuesStage: { value: stage },
  valuesImages: Array.from({ length: 4 }, layerNode), valuesCards: Array.from({ length: 4 }, layerNode),
  activeValueId: { value: 'service' },
  brandValues: ['brand', 'integration', 'service', 'family'].map(id => ({ id })),
  window: { matchMedia: () => ({ matches: mobile }) },
  getComputedStyle: () => { styleReads++; return { top: '60px' } },
  scheduleValuesProgress: () => {},
}
const { refresh, run, style } = vm.runInNewContext(`${ts.transpile(functions)}; ({refresh:refreshValuesLayout,run:updateValuesProgress,style:valuesLayerStyle})`, state)
refresh()
for (const [position, expected] of [[800, 'brand'], [60, 'brand'], [-473.9, 'brand'], [-474, 'integration'], [-1008, 'service'], [-1542, 'family'], [-3000, 'family'], [-1008, 'service'], [60, 'brand']]) {
  top = position
  run()
  assert.equal(state.activeValueId.value, expected, `位置${position}必須同步正確理念`)
}
assert.equal(styleReads, 1, '捲動期間不得重複讀取computed style／尺寸')
const stoppedWrites = writes
run()
assert.equal(writes, stoppedWrites, '停手或離開區塊後相同進度不得重寫DOM')
stage.offsetHeight = 243
section.offsetHeight = 972
refresh()
top = -122.25
run()
assert.equal(state.activeValueId.value, 'integration', '短窗須刷新舞台高度')
section.offsetHeight = 2848
stage.offsetHeight = 792
refresh()
top = 60 - (2848 - 792) * .625
run()
assert.equal(state.valuesRange, 2056, '工具列收合時只更新舞台高度，捲動軌道不變')
assert.equal(state.activeValueId.value, 'service', '可視高度變更後仍須正確換字換圖')

mobile = false
refresh()
top = -3000
run()
assert.equal(state.activeValueId.value, 'service', '桌面捲動不得覆寫Hover／Focus')
assert.equal(style(1), undefined, '桌面不得套用手機樣式')
mobile = true
refresh()
for (let index = 0; index < 4; index++) {
  state.valuesProgress = (index + .5) / 4
  state.activeValueId.value = state.brandValues[index].id
  assert.equal(style(index)['--value-copy-opacity'], 1, '保留完整可讀停留段')
  assert.equal(style(index)['--value-image-opacity'], 1)
  assert.equal(style(index)['--value-copy-y'], '0px')
}
for (let index = 1; index < 4; index++) {
  const samples = [.84, .92, 1, 1.08, 1.16].map(offset => {
    state.valuesProgress = (index - 1 + offset) / 4
    return style(index)['--value-image-opacity']
  })
  assert.ok(samples.every((value, i) => i === 0 || value > samples[i - 1]), '舊瀏覽器仍須連續混合')
  state.valuesProgress = index / 4
  const forward = style(index)
  state.valuesProgress += .02
  style(index)
  state.valuesProgress -= .02
  assert.deepEqual(style(index), forward, '反向不得有時間追趕')
}
state.reducedMotion.value = true
state.activeValueId.value = 'integration'
assert.equal(style(1)['--value-image-opacity'], 1)
assert.equal(style(0)['--value-image-opacity'], 0)
state.nativeValuesTimeline.value = true
state.reducedMotion.value = false
refresh()
const nativeWrites = writes
for (top of [-400, -450, -500]) run()
assert.equal(writes, nativeWrites, '原生timeline模式不得逐幀以JS更新視覺屬性')
assert.equal(style(1)['--value-image-start'], '20.5%')
assert.equal(style(1)['--value-image-end'], '29.5%')
assert.equal(style(0)['--value-copy-start'], '0%')
assert.equal(style(3)['--value-copy-end'], '78.5%')
state.brandValues = []
assert.doesNotThrow(run, '空資料不得產生索引錯誤')
console.log('PASS 四階段／反向／短窗／桌面／空資料、原生timeline無逐幀DOM寫入及舊版快取布局與混合')
