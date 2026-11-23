import { homeHeroSchema } from './hero-media.mjs'
import { homeGallerySchema, customCasesSchema } from './gallery-cases.mjs'
import { builderSeriesSchema } from './builder-series.mjs'
import { kitchenSeriesHeroSchema } from './kitchen-series-hero.mjs'
import { homeHeadingSchema } from './home-headings.mjs'
import { pageDestinationSchema } from './page-destinations.mjs'

import { breadcrumbSchema } from './page-breadcrumbs.mjs'
import { builderStrengthsSchema } from './builder-strengths.mjs'
import { builderHomeOneSchema } from './builder-home-one.mjs'
import { builderAppointmentSchema } from './builder-appointment.mjs'
import { builderCatalogueSchema } from './builder-catalogue.mjs'
import { productCatalogueSchema } from './product-catalogue.mjs'

export function documentSchema(id, schema) {
  for (const extend of [homeHeroSchema, homeGallerySchema, builderSeriesSchema, kitchenSeriesHeroSchema, customCasesSchema, homeHeadingSchema, pageDestinationSchema, breadcrumbSchema, builderStrengthsSchema, builderHomeOneSchema, builderAppointmentSchema, builderCatalogueSchema, productCatalogueSchema]) {
    schema = extend(id, schema)
  }
  return schema
}
