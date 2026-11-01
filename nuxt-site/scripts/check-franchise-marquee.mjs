import assert from 'node:assert/strict'
import { readFile } from 'node:fs/promises'
import vm from 'node:vm'
import ts from 'typescript'

const source = await readFile(new URL('../pages/franchising/intro.vue', import.meta.url), 'utf8')
const update = source.match(/const updateMarqueeRatio = [\s\S]*?\n\}/)?.[0]
assert.ok(update)
class Image {
  constructor(width, height) { this.naturalWidth = width; this.naturalHeight = height }
}
const marqueeRatios = { value: [0, 0] }
const run = vm.runInNewContext(`${ts.transpile(update)}; updateMarqueeRatio`, { HTMLImageElement: Image, marqueeRatios })
run(new Image(7092, 570), 0)
run(new Image(5031, 472), 1)
assert.equal(marqueeRatios.value[0] * 200, 7092 / 570 * 200, '上排循環距離必須等於整張圖的呈現寬度')
assert.equal(marqueeRatios.value[1] * 180, 5031 / 472 * 180, '下排獨立使用自己的圖高比例')
for (const invalid of [null, {}, new Image(0, 570), new Image(7092, 0)]) {
  run(invalid, 0)
  assert.equal(marqueeRatios.value[0], 7092 / 570, '未完成或失敗圖片不得破壞有效循環距離')
}
run(new Image(1600, 900), 0)
assert.equal(marqueeRatios.value[0], 1600 / 900, 'CMS換圖後不得沿用寫死的素材比例')
console.log('PASS 雙排獨立循環比例、圖片未載入與CMS換圖')
