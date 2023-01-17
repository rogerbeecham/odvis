#' River outline collected from OSM
#'
#' River outline of Thames collected from OSM and represented in sf geometry, snapped to bounds of London bikeshare.
#'
#' @format An sf data.frame with 1 observation and 2 variables:
#' \describe{
#'   \item{id}{num row identifier}
#'   \item{geometry}{MULTIPOLYGON representing river outline}
#' }
#' @source \url{https://www.openstreetmap.org/}
"rivers"
