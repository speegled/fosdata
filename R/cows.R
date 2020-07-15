#' Cooling down hot cows
#'
#' Cows in California were sprayed down with water using various nozzles. The temperature of the cows
#' was measured at various body parts and time intervals. Descriptions of the variables are due to the
#' authors of the study.
#'
#' From the authors: "Dairies in the United States commonly cool cattle with sprinklers mounted over the feed bunk that intermittently spray the cows' backs. These systems use potable water—an increasingly scarce resource—but there is little experimental evidence about how much is needed to cool cows or about droplet size, which is thought to affect hair coat penetration. "
#'
#'
#' @format A data frame with 798 observations of 9 variables
#' \describe{
#'   \item{cow}{ID of the cow that was measured.}
#'   \item{date}{Date that the cow was treated.}
#'   \item{nozzle}{Model number of the 6 nozzles tested; control indicates treatment with no spray; each cow received each treatment 3 times}
#'   \item{flow_rate}{Rate at which water was sprayed on cows, in liters per minute.}
#'   \item{body_part}{The body part of the cow where the temperature (degrees Celsius) was taken.}
#'   \item{min_01, min_02, min_03, min_04}{Value of the skin temperature measurement recorded 1, 2, 3 or 4 minutes after the first 3-min spray application began.}
#' }
#'
#' @source \url{https://zenodo.org/record/3862181#.XwTRNpNKjEa}
"cows"
