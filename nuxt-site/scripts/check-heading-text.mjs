import assert from 'node:assert/strict'
import { readFileSync } from 'node:fs'
import ts from 'typescript'

const source = readFileSync(new URL('../utils/headingText.ts', import.meta.url), 'utf8')
const { outputText } = ts.transpileModule(source, { compilerOptions: { module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2022 } })
const exports = {}
new Function('exports', outputText)(exports)
const { splitHeadingText } = exports
for (const text of ['品牌系列', 'Creative Projects That Define Our Style', 'SAKURA 櫻花整體廚房', 'AI智能', 'Story Of Growth', 'Q&A', 'HOME IN O.N.E', 'Basic+', 'Café 廚房', '200–300CM 廚房', ' 混合 AI Kitchen\n標題 ', '<script>中文</script>', '', '123']) {
  const parts = splitHeadingText(text)
  assert.equal(parts.map(part => part.text).join(''), text, '不得改動文字、空白、換行或HTML字元')
  for (const part of parts) assert.equal(part.english, /\p{Script=Latin}/u.test(part.text), `${text}: 中英文分色錯誤`)
}
assert.deepEqual(splitHeadingText('AI智能').map(part => [part.text, part.english]), [['AI', true], ['智能', false]])
assert.deepEqual(splitHeadingText('SAKURA 櫻花').map(part => [part.text, part.english]), [['SAKURA ', true], ['櫻花', false]])
assert.deepEqual(splitHeadingText(null), [])
assert.deepEqual(splitHeadingText(undefined), [])
assert.deepEqual(splitHeadingText(45), [{ text: '45', english: false }])
console.log('PASS 中英混合、縮寫、Unicode、數字、空值與原文字完整保留')
