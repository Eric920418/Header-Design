import { getProductList, productQuery, requireProductBrand } from '~/server/utils/products'
export default defineEventHandler(event => getProductList(event, requireProductBrand(getRouterParam(event,'brand')), productQuery(getQuery(event))))
