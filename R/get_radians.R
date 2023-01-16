#' get_radians
#'
#' @description Convert angle in degrees to radians.
#'
#' @param degrees angle value in degrees to be transformed
#'
#' @return A double describing radian angle.
#' @export
#'
#' @examples
#' get_radians(degrees=90)
get_radians <- function(degrees) {
  return((degrees * pi) / (180))
}
