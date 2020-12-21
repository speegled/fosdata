#' New York Times COVID 19
#'
#' Cases and deaths due to COVID-19 by US state and date, due to The New York Times. Downloaded on December 19, 2020
#'
#' @format A data frame with 16019 observations of 5 variables.
#' \describe{
#'   \item{date}{YYYY-MM-DD}
#'   \item{state}{State where cases were recoreded}
#'   \item{fips}{FIPS code; useful if making maps}
#'   \item{cases}{Cumulative number of cases}
#'   \item{deaths}{Cumulative number of deaths}
#' }
#'
#' @source \url{https://github.com/nytimes/covid-19-data}
"covid"
