#' Origin-destination London bikeshare trips 2018
#'
#' Raw trip data are released by TfL. This is a cleaned and summarised dataset describing
#' trip frequencies between unique OD docking station pairs that take place during peak
#' times: weekdays between 0700-1000 (am peak), 1600-1900 (pm peak).
#'
#' @format A tibble with 238,927 observations and 5 variables:
#' \describe{
#'   \item{od_pair}{chr docking station id of origin-destination}
#'   \item{o_station}{chr docking station id of origin}
#'   \item{d_station}{chr docking station id of destination}
#'   \item{period}{chr period of day, am or pm peak}
#'   \item{count}{int trip count for od pair}
#' }
#' @source \url{https://cycling.data.tfl.gov.uk/}
"bs_ods"
