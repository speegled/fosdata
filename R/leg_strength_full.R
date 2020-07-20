#' Wii Let Strength (full)
#'
#' Wii balance board and stationary isometric dynamometer measurements of leg force of adults in Denmark.
#'
#' The smaller data set consisting of means only is available as `leg_strength`.
#'
#' From the authors: "Portable, low-cost, objective and reproducible assessment of muscle strength in the lower limbs is important as it allows clinicians to precisly track progression of patients undergoing rehabilitation. The purpose of the study was to evaluate (1) reproducibility and (2) concurrent validity of the WBB for measuring isometric muscle strength in the lower limb."
#'
#' @format A data frame with 30 observations of 2 variables. Descriptions of variables are from the authors.
#' \describe{
#'   \item{id}{ID of participant. Can be used to match with `leg_strength` data set}
#'   \item{wii_m1}{wii measurement 1}
#'   \item{wii_m2}{wii measurement 2}
#'   \item{wii_m3}{wii measurement 3}
#'   \item{wii_max3}{max wii measurement (day 1)}
#'   \item{day2_wii_m1}{wii measurement 1 (Day 2)}
#'   \item{day2_wii_m2}{wii measurement 2 (day 2)}
#'   \item{day2_wii_m3}{wii measurement 3 (day 3)}
#'   \item{day2_wii_max3}{max wii measurement (Day 2)}
#'   \item{sid_m1}{sid measurement 1 day 1}
#'   \item{sid_m2}{sid measurement 2 day 1}
#'   \item{sid_m3}{sid measurement 3 day 1}
#'   \item{sid_max3}{max sid measurement day 1}
#'   \item{day2_sid_m1}{sid measurement 1 day 2}
#'   \item{day_2_sid_m2}{sid measurement 2 day 2}
#'   \item{day_2_sid_m3}{sid measurement 3 day 2}
#'   \item{day_2_sid_max3}{max sid measurement day 2}
#' }
#'
#' @source Gronbech Jorgensen M, Andersen S, Ryg J, Masud T (2015) Novel Use of the Nintendo Wii Board for Measuring Isometric Lower Limb Strength: A Reproducible and Valid Method in Older Adults. PLoS ONE 10(10): e0138660.
#' @source \url{https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0138660}
"leg_strength_full"
