import type { MaybeRefOrGetter } from 'vue'
import { listPageState } from '~/utils/listPagination'

/** Paginate published CMS lists without copying or changing the source records. */
export function useListPagination<T>(items: MaybeRefOrGetter<readonly T[]>) {
  const route = useRoute()
  const state = computed(() => listPageState(toValue(items).length, route.query.page))
  return {
    currentPage: computed(() => state.value.page),
    totalPages: computed(() => state.value.totalPages),
    paginatedItems: computed(() => toValue(items).slice(state.value.start, state.value.end)),
  }
}
