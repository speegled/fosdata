#' Barnacle distribution on coral reefs
#'
#' Counts and density of barnacles on coral reefs in the Flower Garden Banks (Gulf of Mexico) and in the U.S. Virgin Islands.
#'
#' From the authors: "Bioerosion, the removal of calcium carbonate from coral frameworks by living organisms, influences a variety of reef features, from their topographic complexity to the net balance of carbonate budgets. Little is known, however, about how macroborers, which bore into reef substrates leaving traces greater than 0.1 mm diameter, are distributed across coral reefs, particularly reef systems with high (>50\%) stony coral cover or at mesophotic depths (≥30 m)."
#'
#' @format A data frame with 134 observations of 8 variables.
#' \describe{
#'   \item{location}{Either FGB (Flower Garden Banks) or USVI (U.S. Virgin Islands).}
#'   \item{site}{Specific site within location.}
#'   \item{coral_cover}{Percentage of reef covered in coral.}
#'   \item{depth}{Depth of reef (meters).}
#'   \item{deep}{Factor with two values, deep or shallow.}
#'   \item{count}{Number of barnacles.}
#'   \item{area}{Area where barnacles were counted in square meters.}
#'   \item{barnacle_density}{Barnacles per square meter.}
#' }
#'
#' @source Maher RL, Johnston MA, Brandt ME, Smith TB, Correa AMS (2018) Depth and coral cover drive the distribution of a coral macroborer across two reef systems. PLoS ONE 13(6): e0199462. https://doi.org/10.1371/journal.pone.0199462
"barnacles"
