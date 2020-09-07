#' Lead levels from citizen tap water sampling in Flint, MI
#'
#' In 2014, the city of Flint, Michigan switched its drinking water supply
#' from Detroit's system to the Flint River to reduce costs.
#' 
#' In 2015, students and scientists at Virginia Tech assembled and shipped
#' 300 test kits to randomly selected Flint.  The residents sampled their water and returned
#' it to the lab for testing.
#' The kits comprised of three bottles (1L, 500 mL and 250 mL ones) and an
#' instruction sheet for sampling tap water.
#' 
#' Each home was instructed to sample water at first draw (after the tap was
#' unused for 6 hours), after running for 45 seconds, and after another 2 minutes.
#'
#' @format A data frame with 271 observations of 7 variables
#' \describe{
#'   \item{SampleID}{Test kit number}
#'   \item{Zip.Code}{Zip code (location) of sample within Flint.}
#'   \item{Ward}{Flint is divided into 9 geographical subdivisions called wards.} 
#'   \item{Pb1}{Lead level in first draw sample (parts per million).}
#'   \item{Pb2}{Lead level in second sample, 45 seconds later (parts per million).}
#'   \item{Pb3}{Lead level in third sample, 2 minutes later (parts per million).}
#'   \item{Notes}{}
#' }
#'
#' @source 'FlintWaterStudy.org (2015) "Lead Results from Tap Water Sampling in Flint, MI during the Flint Water Crisis"'
#' @source \url{http://flintwaterstudy.org/2015/12/complete-dataset-lead-results-in-tap-water-for-271-flint-samples/}
"flint"
