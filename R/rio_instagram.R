#' Olympians Instagram Account Data
#'
#' From the data creator: "This dataset includes Instagram user characteristics of those Olympic athletes who won gold medals in the individual events of Rio2016. The name of all these gold medalists of individual events are in the dataset (226 athletes), however only 149 athletes (85 men and 64 women) had their Instagram publicly available at the time of data crawling (the whole dataset was crawled from 9-Aug-2019 to 12-Aug-2019). Thus, for some athletes we could not present data in the dataset."
#'
#' @format A tibble with 226 observations of 14 variables. Variable descriptions by the data creator.
#' \describe{
#'   \item{sport}{Name of the individual event }
#'   \item{country}{Country}
#'   \item{name}{Name}
#'   \item{gender}{Gender}
#'   \item{id}{Instagram ID}
#'   \item{n_post}{Number of Posts}
#'   \item{n_follower}{Number of followers}
#'   \item{n_following}{Number of followings}
#'   \item{max_like}{Maximum Number of likes (in the last 10 photo posts)}
#'   \item{max_comment_for_max_like}{Number of comments for the post with Maximum Number of likes (in the last 10 photo posts)}
#'   \item{self_presenting}{Number of self-presenting posts in the last 10 photo posts (those posts in which the athlete is present)}
#'   \item{pure_self_presenting}{Number of pure self-presenting posts in the last 10 photo posts (those posts in which the athlete is the only person who is present)}
#'   \item{age}{Age}
#'   \item{date}{Date of data crawling}
#' }
#'
#' @source Amirhosein Bodaghi. (2019). Instagram Characteristics of Olympic gold medalists (Rio2016) [Data set]. Zenodo.
#' @source \url{http://doi.org/10.5281/zenodo.3469514}
"rio_instagram"
