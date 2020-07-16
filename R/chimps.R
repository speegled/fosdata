#' Gray haired chimpanzees
#'
#' It is known that humans' hair generally turns gray as they age. Is the same true for chimpanzees? This
#' data set contains demographic information on chimpanzees, together with human ratings of how gray their
#' hair is. The authors' original intent was to determine whether middle-aged chimpanzees got gray with
#' age.
#'
#' From the authors: "The greying of human head hair is arguably the most salient marker of human aging. In wild mammal populations, greying can change with life history or environmental factors (e.g., sexual maturity in silverback gorillas). Yet, whether humans are unique in our pattern of age-related hair depigmentation is unclear."
#'
#'
#' @format A data frame with 165 observations of 159 variables. Some individuals are evaluated twice at different ages.
#' \describe{
#'   \item{individual}{Name of the chimpanzee.}
#'   \item{year}{Year that photograph was taken.}
#'   \item{sex}{Factor with two levels, M and F.}
#'   \item{age}{Age in years of chimpanzee at time of photo.}
#'   \item{population}{Factor with three levels.
#'      NIRC corresponds to New Iberia Research Center,
#'      TAI corresponds to Taï National Park, Ivory Coast, and
#'      NGOGO corresponds to Ngogo, Kibale National Park, Uganda.}
#'   \item{subspecies}{Factor with levels versus and schweinfurthii.}
#'   \item{V1,...,V164}{Rankings on scale of 1-6 of how gray the chimpanzees hair is, by human raters.}
#'   \item{grey_score_avg}{Mean value of the gray score rankings given by human judges.}
#' }
#'
#' @source \url{https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0235610}
#' @source \url{https://datadryad.org/stash/dataset/doi:10.5061/dryad.f7m0cfxs7}
"chimps"
