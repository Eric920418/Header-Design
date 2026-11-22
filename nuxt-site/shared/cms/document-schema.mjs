import { homeHeroSchema } from './hero-media.mjs'
import { homeGallerySchema, customCasesSchema } from './gallery-cases.mjs'
import { builderSeriesSchema } from './builder-series.mjs'
import { kitchenSeriesHeroSchema } from './kitchen-series-hero.mjs'
import { homeHeadingSchema } from './home-headings.mjs'
import { pageDestinationSchema } from './page-destinations.mjs'

import { breadcrumbSchema } from './page-breadcrumbs.mjs'
import { builderStrengthsSchema } from './builder-strengths.mjs'

export function documentSchema(id, schema) {
  for (const extend of [homeHeroSchema, homeGallerySchema, builderSeriesSchema, kitchenSeriesHeroSchema, customCasesSchema, homeHeadingSchema, pageDestinationSchema, breadcrumbSchema, builderStrengthsSchema]) {
    schema = extend(id, schema)
  }
  return schema
}
