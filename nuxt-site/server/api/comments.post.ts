import {receiveCmsForm} from '../utils/cmsForms'
export default defineEventHandler(event=>receiveCmsForm(event,'comment'))
