% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bs_villages.R
\docType{data}
\name{bs_villages}
\alias{bs_villages}
\title{Bikeshare villages.}
\format{
A tibble with 66 observation and 4 variables:
\describe{
\item{name}{chr bikeshare village name}
\item{esting}{dbl easting of bikeshare village centroid}
\item{northing}{dbl northing of bikeshare village centroid}
\item{geometry}{sfc_MULTIPOLYGON" bikeshare village polygon}
}
}
\source{
\url{https://github.com/rogerbeecham/connected-bikeability-london/blob/main/generate-villages.md}
}
\usage{
bs_villages
}
\description{
Bikeshare villages are derived via a voronoi tessellation around key villages locations within the London bikeshare boundary.
}
\keyword{datasets}
