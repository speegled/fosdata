#' Scrabble tile values
#'
#' This dataset contains 100 records corresponding to the 100 tiles in English language editions of the board game Scrabble.
#'
#' @format A data frame with 100 observations of 2 variables
#' \describe{
#'   \item{piece}{the letter A-Z shown on the tile or "blank"}
#'   \item{points}{the points shown on the tile}
#' }
#'
#' @source \url{https://en.wikipedia.org/wiki/Scrabble_letter_distributions}
"scrabble"


#' Scrabble tile values
#'
#' This dataset contains 613 observations corresponding to the tiles in editions of the board game Scrabble for 6 languages.
#'
#' @format A data frame with 613 observations of 3 variables
#' \describe{
#'   \item{lang}{language of the scrabble tiles; one of dutch, english, french, l33t, malagasy, or tswana}
#'   \item{piece}{the letter A-Z (or number in the case of l33t) shown on the tile or "blank." Diacritics are ignored.}
#'   \item{points}{the points shown on the tile}
#' }
#'
#' @source \url{https://en.wikipedia.org/wiki/Scrabble_letter_distributions}
"scrabble_ml"
