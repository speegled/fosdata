#' Shark Documentary Music
#'
#' Studies the effect of different kinds of background music on people watching shark documentaries.
#'
#' From the authors: "Despite the ongoing need for shark conservation and management, prevailing negative sentiments marginalize these animals and legitimize permissive exploitation. These negative attitudes arise from an instinctive, yet exaggerated fear, which is validated and reinforced by disproportionate and sensationalistic news coverage of shark ‘attacks’ and by highlighting shark-on-human violence in popular movies and documentaries. In this study, we investigate another subtler, yet powerful factor that contributes to this fear: the ominous background music that often accompanies shark footage in documentaries."
#'
#'
#' @format A data frame with 732 observations of 19 variables. For variables with values from 1-7 without description, 1 = not at all and 7 = very much
#' \describe{
#'   \item{av}{did the subject see video or listen to audio}
#'   \item{music}{was the music played to subject uplifting, ominous or silence}
#'   \item{scary}{how well does scary describe sharks 1-7}
#'   \item{dangerous}{how well does dangerous describe sharks 1-7}
#'   \item{vicious}{how well does vicious describe sharks 1-7}
#'   \item{peaceful}{how well does peaceful describe sharks 1-7}
#'   \item{beautiful}{how well does beautiful describe sharks 1-7}
#'   \item{graceful}{how well does graceful describe sharks 1-7}
#'   \item{conserve}{willingness to conserve from 1-7}
#'   \item{gender}{1 male, 2 female}
#'   \item{age}{age in years}
#'   \item{race_ethnicity}{1 white_or_caucasian 2 black_or_african_american 3 hispanic_or_latino 4 asian 5 american_indian_or_alaskan_native 6 native_hawaiian_or_pacific_islander 7 other}
#'   \item{annual_income}{1-9 by increments of 25K, so 1 = 0-25K, 2 = 25-50K, ..., 9 = 200K+}
#'   \item{political_views}{levels 1-7 with 1 extremely liberal, 4 moderate and 7 extremely conservative}
#' }
#'
#' @source Nosal AP, Keenan EA, Hastings PA, Gneezy A (2016) The Effect of Background Music in Shark Documentaries on Viewers' Perceptions of Sharks. PLoS ONE 11(8): e0159279. https://doi.org/10.1371/journal.pone.0159279
"sharks"
