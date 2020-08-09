#' Masks and Influenza Exposure
#'
#' Fine and coarse influenza droplets that escape a surgical mask in laboratory setting.
#'
#' Participants wore masks for 30 minutes while a machine gathered their exhalations. Participants were
#' told to cough thirty times during the 30 minutes. One patient coughed naturally more than 30 times.
#'
#' From the authors: "The CDC recommends that healthcare settings provide influenza patients with facemasks as a means of reducing transmission to staff and other patients, and a recent report suggested that surgical masks can capture influenza virus in large droplet spray. However, there is minimal data on influenza virus aerosol shedding, the infectiousness of exhaled aerosols, and none on the impact of facemasks on viral aerosol shedding from patients with seasonal influenza."
#'
#'
#' @format A data frame with 37 observations of 7 variables.
#' \describe{
#'   \item{obs}{Observation number}
#'   \item{mask_fine}{viral copy number of fine particles (< 5 microns) for those wearing a mask, measured using quantitative RT-PCR}
#'   \item{no_mask_fine}{viral copy number of fine particules for those not wearing a mask}
#'   \item{nasal_swab}{viral load in the nasopharyngeal swab specimen}
#'   \item{mask_coarse}{viral copy number of coarse particles (> 5 microns) for those wearing a mask}
#'   \item{no_mask_coarse}{viral copy number of coarse particules for those not wearing a mask}
#'   \item{pcr_type}{A factor indicating which of two strains of influenza patient had}
#' }
#'
#' @source Milton DK, Fabian MP, Cowling BJ, Grantham ML, McDevitt JJ (2013) Influenza Virus Aerosols in Human Exhaled Breath: Particle Size, Culturability, and Effect of Surgical Masks. PLoS Pathog 9(3): e1003205. https://doi.org/10.1371/journal.ppat.1003205
"masks"
