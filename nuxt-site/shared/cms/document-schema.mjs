import { homeHeroSchema } from './hero-media.mjs'
import { homeGallerySchema, customCasesSchema } from './gallery-cases.mjs'
import { builderSeriesSchema } from './builder-series.mjs'
import { kitchenSeriesHeroSchema } from './kitchen-series-hero.mjs'
import { homeHeadingSchema } from './home-headings.mjs'
import { pageDestinationSchema } from './page-destinations.mjs'

import { inspirationBreadcrumbSchema } from './inspiration-breadcrumb.mjs'

export function documentSchema(id, schema) {
  for (const extend of [homeHeroSchema, homeGallerySchema, builderSeriesSchema, kitchenSeriesHeroSchema, customCasesSchema, homeHeadingSchema, pageDestinationSchema, inspirationBreadcrumbSchema]) {
    schema = extend(id, schema)
  }
  return schema
}
