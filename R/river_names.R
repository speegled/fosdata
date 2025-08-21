#' Names of 141 Major North American Rivers
#'
#' Names of the 141 major North American Rivers whose lengths (in miles) can be found in the built in data set `rivers`.
#' 
#' 
#' @format A vector of length 141 with no attributes.
#'
#' @examples
#' dd <- data.frame(name = river_names, length = rivers)
#' dplyr::arrange(dd, length)
#' 
#'
#' @details Data was obtained by copying the names from the 1975 World Almanac and Book of Facts (page 408, not 406 as listed in the help page for `rivers`). The book was accessed through archive.org on August 21, 2025.
#' @source The World Almanac & Book of Facts 1975, Delury, George E. (editor), ISBN 10: 0911818030 / ISBN 13: 9780911818031; Published by Newspaper Enterprise Association, Inc., 1974
"river_names"
