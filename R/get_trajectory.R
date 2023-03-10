#' @title get_trajectory
#'
#' @description This function takes cartesian coordinates defining origin and
#' destination locations returns a tibble representing a path for an asymmetric
#' bezier curve, which  curves towards the destination location. The tibble has
#' three rows representing an origin, destination and control point for the
#' bezier curve. The parameterisation follows that published in
#' [Wood et al. 2011](https://openaccess.city.ac.uk/id/eprint/538/).
#'
#' @import tibble
#'
#' @param o_x Location in x of origin.
#' @param o_y Location in y of origin.
#' @param d_x Location in x of destination.
#' @param d_y Location in y of destination.
#' @param od_pair Character string naming OD-pair.
#' @param curve_angle Angle in degrees with which curves bend towards destination. Default is -90 degrees.
#' @param curve_extent Extent relative to overall line length that curve bends out. Default is 6 (length/6).
#'
#' @return A tibble of coordinate pairs representing the, origin, destination
#' and control point of the asymmetric curve.
#'
#' @export
#' @examples
#' outward <- get_trajectory(o_x=0,o_y=0,d_x=1,d_y=0, "out")
#' inward <- get_trajectory(o_x=1,o_y=0,d_x=0,d_y=0, "in")
get_trajectory <- function(o_x, o_y, d_x, d_y, od_pair, curve_angle=-90, curve_extent=6) {
  curve_angle=get_radians(curve_angle)
  x=(o_x-d_x)/curve_extent
  y=(o_y-d_y)/curve_extent
  c_x=d_x + x*cos(curve_angle) - y*sin(curve_angle)
  c_y=d_y + y*cos(curve_angle) + x*sin(curve_angle)
  d <- tibble::tibble(
    x=c(o_x,c_x,d_x),
    y=c(o_y,c_y,d_y),
    od_pair=od_pair
  )
  return(d)
}
