#' Wii Leg Strength
#'
#' Wii balance board and stationary isometric dynamometer measurements of leg force of adults in Denmark.
#'
#' The full, unmodified data set is available as `leg_strength_full`.
#'
#' From the authors: "Portable, low-cost, objective and reproducible assessment of muscle strength in the lower limbs is important as it allows clinicians to precisly track progression of patients undergoing rehabilitation. The purpose of the study was to evaluate (1) reproducibility and (2) concurrent validity of the WBB for measuring isometric muscle strength in the lower limb."
#'
#' @format A data frame with 30 observations of 2 variables. Descriptions of variables are from the authors.
#' \describe{
#'   \item{ID}{ID of participant. Can be used to match with `leg_strength_full` data set.}
#'   \item{mean_wii}{mean of 6 measurements of leg strength in kg on the wii balance board.}
#'   \item{mean_sid}{mean of the 6 measurements of leg strength in kg on the stationary isometric dynamometer.}
#' }
#'
#' @source Gronbech Jorgensen M, Andersen S, Ryg J, Masud T (2015) Novel Use of the Nintendo Wii Board for Measuring Isometric Lower Limb Strength: A Reproducible and Valid Method in Older Adults. PLoS ONE 10(10): e0138660.
#' @source \url{https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0138660}
"leg_strength"
