import assert from 'node:assert/strict'
import { listPageState, visibleListPages } from '../utils/listPagination.ts'

const items = Array.from({ length: 25 }, (_, id) => id)
const pages = ['1', '2', '3'].map(value => {
  const { start, end } = listPageState(items.length, value)
  return items.slice(start, end)
})
assert.deepEqual(pages.map(page => page.length), [9, 9, 7])
assert.deepEqual(pages.flat(), items)
assert.equal(listPageState(3, '1').totalPages, 1)
assert.equal(listPageState(0, '1').totalPages, 0)
for (const value of ['0', '-1', 'bad', '1.5', '9007199254740992', ['2'], undefined]) assert.equal(listPageState(25, value).page, 1)
assert.equal(listPageState(25, '999').page, 3)
assert.deepEqual(visibleListPages(1, 0), [])
assert.deepEqual(visibleListPages(1, 1), [1])
assert.deepEqual(visibleListPages(1, 3), [1, 2, 3])
assert.deepEqual(visibleListPages(50, 100), [1, 'ellipsis', 49, 50, 51, 'ellipsis', 100])
assert.ok(visibleListPages(1, 100).length <= 7)
console.log('PASS 9/9/7, no missing/duplicate records, single/empty lists, invalid/range pages, bounded page numbers')
