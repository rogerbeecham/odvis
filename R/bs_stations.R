#' Bikeshare docking stations.
#'
#' Bikeshare docking stations from the London Cycle Hire Scheme, released by TfL.
#'
#' @format A sf tibble with 820 observation and 4 variables:
#' \describe{
#'   \item{id}{num bikeshare docking station id}
#'   \item{name}{chr bikeshare docking station name}
#'   \item{capacity}{num bikeshare docking station capacity}
#'   \item{geometry}{sfc_POINT" bikeshare docking station location in x,y}
#' }
#' @source \url{https://cycling.data.tfl.gov.uk/}
"bs_stations"
