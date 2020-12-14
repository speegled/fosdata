#' Social Media Engagement of Particle Physicists
#'
#' Social media engagements of 4 different types of posts on 4 different platforms by The European Organization for Nuclear Research, better known as CERN.
#'
#' From the authors: "Although the scientific community increasingly recognizes that its communication with the public may shape civic engagement with science, few studies have characterized how this communication occurs online. This study sets out to explore how users engage with science communication items on different platforms of social media, and what are the characteristics of the items that tend to attract large numbers of user interactions."
#'
#'
#' @format A data frame with 214 observations of 11 variables.
#' \describe{
#'   \item{postdate}{DD-MMM-YYYY character variable, where MMM is three letter abbreviation for English month}
#'   \item{platform}{Social media platform of post, factor with 5 levels. Facebook, Google+, Instagra, Tw Frenc, Twitter}
#'   \item{type}{type of post, factor with 4 levels. GWII = "Guess what that is", News = "News", TBT = "Throw back Thursday", or Wow = "Awe-inspiring images"}
#'   \item{subject}{subject of post}
#'   \item{followers}{number of followers on platform at time of post}
#'   \item{likes}{number of times post was "liked"}
#'   \item{comments}{number of comments}
#'   \item{shares}{number of times media was shared}
#'   \item{click_throughs}{number of click throughs}
#'   \item{avg_visit_duration}{mean length of time people stayed on CERN cite after click through, in seconds}
#'   \item{post}{link to actual post on social media}
#' }
#'
#' @source Kahle K, Sharon AJ, Baram-Tsabari A (2016) Footprints of Fascination: Digital Traces of Public Engagement with Particle Physics on CERN's Social Media Platforms. PLoS ONE 11(5): e0156409. https://doi.org/10.1371/journal.pone.0156409
"cern"
