#' Origin-destination London bikeshare trips 2018
#'
#' Raw trip data are released by TfL. This is a cleaned and summarised dataset describing trip frequencies between unique OD docking station pairs.
#'
#' @format A tibble with 382,517 observation and 9 variables:
#' \describe{
#'   \item{start_station_id}{chr docking station id of origin}
#'   \item{end_station_id}{chr docking station id of destination}
#'   \item{o_name}{chr bikeshare village name of origin}
#'   \item{o_east}{dbl docking station easting of origin}
#'   \item{o_northing}{dbl docking station northing of origin}
#'   \item{d_name}{chr bikeshare village name of destination}
#'   \item{d_east}{dbl docking station easting of destination}
#'   \item{d_northing}{dbl docking station northing of destination}
#'   \item{count}{int trip count for od pair}
#' }
#' @source \url{https://cycling.data.tfl.gov.uk/}
"bs_ods"
