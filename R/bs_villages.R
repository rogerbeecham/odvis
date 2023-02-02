#' Bikeshare villages.
#'
#' Bikeshare villages are derived via a voronoi tessellation around key villages locations within the London bikeshare boundary.
#'
#' @format A tibble with 66 observation and 4 variables:
#' \describe{
#'   \item{name}{chr bikeshare village name}
#'   \item{esting}{dbl easting of bikeshare village centroid}
#'   \item{northing}{dbl northing of bikeshare village centroid}
#'   \item{geometry}{sfc_MULTIPOLYGON" bikeshare village polygon}
#' }
#' @source \url{https://github.com/rogerbeecham/connected-bikeability-london/blob/main/generate-villages.md}
"bs_villages"
