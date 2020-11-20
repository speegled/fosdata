#' Full text of Emma and Pride and Prejudice, by Jane Austen
#'
#' Downloaded from Project Gutenberg. Emma and Pride and Prejudice are free from
#' copyright in the US and in most countries, according to Project Gutenberg. Please
#' check laws in your country before use.
#'
#'
#' @format A data frame with 282295 observations of 7 variables
#' \describe{
#'   \item{word}{A word in either Emma or Pride and Prejudice}
#'   \item{sentence}{The sentence number of the book that the word appears in.}
#'   \item{chapter}{The chapter of the book that the word appears in.}
#'   \item{word_length}{The length of the word.}
#'   \item{stop_word}{Is the word a stop word? Stop word are words such as "the" "and" or "of," which are common and don't carry sentiment.}
#'   \item{sentiment_score}{Sentiment score of the word. Larger numbers correspond to more positive sentiment.}
#'   \item{novel}{One of Emma or Pride and Prejudice.}
#' }
#'
#' @source \url{https://www.gutenberg.org/files/158/158-0.txt} and \url{https://www.gutenberg.org/files/1342/1342-0.txt}
"austen"



