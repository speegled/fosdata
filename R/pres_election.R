#' US Presidential Election Data 2000-2016
#'
#' County level results for presidential elections in the USA from 2000-2016.
#'
#' @format A data frame with 50524 observations of 11 variables.
#' \describe{
#'   \item{year}{Year of election}
#'   \item{state}{State of results}
#'   \item{state_po}{State Postal Abbreviation}
#'   \item{county}{County within state}
#'   \item{FIPS}{FIPS code for the county. Useful due to non-standard abbreviations of counties}
#'   \item{office}{Office for which the election was held}
#'   \item{candidate}{Name of candidate}
#'   \item{party}{Political party of the candidate}
#'   \item{candidatevotes}{Votes that candidate received}
#'   \item{totalvotes}{Total votes cast in county}
#'   \item{version}{Value 20191203}
#' }
#'
#' @source MIT Election Data and Science Lab, 2018, "County Presidential Election Returns 2000-2016", https://doi.org/10.7910/DVN/VOQCHQ, Harvard Dataverse, V6, UNF:6:ZZe1xuZ5H2l4NUiSRcRf8Q== [fileUNF]
"pres_election"
