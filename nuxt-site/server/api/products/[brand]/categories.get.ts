import { getProductCategories, requireProductBrand } from '~/server/utils/products'
export default defineEventHandler(event => getProductCategories(event, requireProductBrand(getRouterParam(event,'brand'))))
