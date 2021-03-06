#' Malaria Transmission and Parasites
#'
#' Mice were bit 10 times by mosquitoes, and the number of salivary gland sporozoites detected in the mosquitoes was
#' measured. The mice were then observed to determine whether they got malaria. Some of the mice were given a malarial
#' antibody pre-mosquito bite.
#'
#' From the authors: "Over a century since Ronald Ross discovered that malaria is caused by the bite of an infectious mosquito it is still unclear how the number of parasites injected influences disease transmission. Currently it is assumed that all mosquitoes with salivary gland sporozoites are equally infectious irrespective of the number of parasites they harbour, though this has never been rigorously tested."
#'
#' @format A tibble with 180 observations of 3 variables.
#' \describe{
#'   \item{sporozoite}{The total number of sporozoites detected from the 10 bites.}
#'   \item{malaria}{1 = yes malaria detected, 0 = no malaria detected}
#'   \item{antibody}{yes/no did the mouse receive an antibody treatment pre-mosquito bites}
#' }
#'
#' @source Churcher TS, Sinden RE, Edwards NJ, Poulton ID, Rampling TW, Brock PM, et al. (2017) Probability of Transmission of Malaria from Mosquito to Human Is Regulated by Mosquito Parasite Density in Naïve and Vaccinated Hosts. PLoS Pathog 13(1): e1006108. https://doi.org/10.1371/journal.ppat.1006108
"malaria"
