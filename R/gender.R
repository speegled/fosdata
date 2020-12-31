#' Gender and race data from Google Android Panel survey
#'
#' From Sell, Goldberg, Conron:
#' Gaps in data collection systems, as well as challenges associated with gathering data from rare and dispersed populations,
#' render current health surveillance systems inadequate to identify and monitor efforts to reduce health disparities.
#' Using sexual and gender minorities we investigated the utility of using a large nonprobability online panel to conduct rapid population assessments
#' of such populations using brief surveys.
#' 
#' This data consists of responses from users of the Google Android Panel.
#' These are users of the Google Opinion Rewards application who have Smart phones
#' operated by Google’s Android operating system and receive small payments of up to one dollar per 10-item survey.
#' Users of Google Opinion Rewards tend to represent earlier-adopters and heavier technology users than on average.
#' For each survey an individual panel member is sent, Google informs the panel member of how data will be used and asks for their consent.
#' 
#' Gender identity information was collected with the question "Gender Identity—What is your current gender identity? (Select all that apply)".
#' 
#' @format A data frame with 20305 observations of 10 variables
#' \describe{
#'   \item{gender_male}{Male.}
#'   \item{gender_female}{Female.}
#'   \item{gender_trans}{Transgender.}
#'   \item{gender_queer}{Genderqueer/Gender non-conforming.}
#'   \item{gender_not_sure}{I am not sure of my gender identity.}
#'   \item{gender_unclear}{I do not know what this question is asking.}
#'   \item{gender_na}{None of the above.}
#'   \item{sex_at_birth}{"Sex—What sex were you assigned at birth, on your original birth certificate?" Male, Female.}
#'   \item{hispanic}{"Do you consider yourself to be Hispanic or Latino?" Yes, No, Don't know.}
#'   \item{race}{"What race or races do you consider yourself to be?".  Multiple categories may be selected and are comma separated.}
#' }
#' 
#' @source Sell R, Goldberg S, Conron K (2015) The Utility of an Online Convenience Panel for Reaching Rare and Dispersed Populations. PLOS ONE 10(12): e0144011.
#' @source \url{https://doi.org/10.1371/journal.pone.0144011}
"gender"
