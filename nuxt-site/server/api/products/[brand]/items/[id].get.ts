import { getProductDetail, requireProductBrand } from '~/server/utils/products'
export default defineEventHandler(event => getProductDetail(event, requireProductBrand(getRouterParam(event,'brand')), String(getRouterParam(event,'id') ?? '')))
