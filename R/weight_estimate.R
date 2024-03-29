#' Weight lifting judgment in children
#'
#' Humans are able to estimate the weight of an object by watching how another person interacts with the object. Eighty
#' subjects of various ages were asked to estimate the weight of objects of various weights after watching a video of an actor interacting with the weights.
#'
#' From the authors: "Humans are excellent at perceiving different features of the actions performed by others. For instance, by viewing someone else manipulating an unknown object, one can infer its weight–an intrinsic feature otherwise not directly accessible through vision. How such perceptual skill develops during childhood remains unclear."
#'
#' @format A data frame with 80 observations of 7 variables
#' \describe{
#'   \item{id}{ID}
#'   \item{height}{Height of subject in cm.}
#'   \item{mean100}{Mean of estimated weight for objects that weighed 100 g.}
#'   \item{mean200}{Mean of estimated weight for objects that weighed 200 g.}
#'   \item{mean300}{Mean of estimated weight for objects that weighed 300 g.}
#'   \item{mean400}{Mean of estimated weight for objects that weighed 400 g.}
#'   \item{age}{Age group that the subject is in. Factor with levels 6, 8, 10 and adult.}
#' }
#'
#' @source Sciutti A, Patanè L, Sandini G (2019) Development of visual perception of others’ actions: Children’s judgment of lifted weight. PLoS ONE 14(11): e0224979
#' @source \url{https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0224979}
#' @source Sciutti Alessandra, Patane' Laura, & Sandini Giulio. (2019). Dataset - weight lifting judgment in children [Data set]. Zenodo. http://doi.org/10.5281/zenodo.3524881
"weight_estimate"
