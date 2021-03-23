#' US Presidential Election Data 2000-2016
#'
#' County level results for presidential elections in the USA from 2000-2016.
#'
#' @format A data frame with 50524 observations of 9 variables.
#' \describe{
#'   \item{year}{Year of election.}
#'   \item{state}{State of results.}
#'   \item{state_po}{State postal abbreviation.}
#'   \item{county}{County within state.}
#'   \item{FIPS}{FIPS code for the county. Useful due to non-standard abbreviations of counties.}
#'   \item{candidate}{Name of candidate.}
#'   \item{party}{Political party of the candidate.}
#'   \item{candidatevotes}{Votes that candidate received in the county.}
#'   \item{totalvotes}{Total votes cast in the county.}
#' }
#'
#' @source MIT Election Data and Science Lab, 2018, "County Presidential Election Returns 2000-2016", https://doi.org/10.7910/DVN/VOQCHQ, Harvard Dataverse, V6, UNF:6:ZZe1xuZ5H2l4NUiSRcRf8Q== [fileUNF]
"pres_election"
