#' Conversational Dominance and Psychopathy
#'
#' Data from an experiment performed on American college students. Students were observed conversing for 10 minutes and summary
#' data was recorded of the conversational dynamics. Pictures of the students were then rated by observers for personality
#' characteristics. The Levenson Self-Report Psychopathy Scale is used to assess subclinical psychopathy of the students, and
#' the students were also subjected to a prisoners' dilemma.
#'
#' This data is the combination of the data sets from two papers. For ease of use in classroom setting, median_income was imputed
#' for students with missing data. This imputation is strictly for pedagogy.
#'
#' From the authors: "The determinants of conversational dominance are not well understood. We used videotaped triadic interactions among unacquainted same-sex American college students to test predictions drawn from the theoretical distinction between dominance and prestige as modes of human status competition."
#'
#' From the authors' second paper: "Recent evidence suggests that psychopathy is a trait continuum. To test this, we focus on a ubiquitous real-life source of conditional behaviour: the expected relational value of social partners, both in terms of their quality and the likely quantity of future interactions with them."
#'
#' @format A data frame with 210 observations of 28 variables. Descriptions of some variables are from the authors.
#' \describe{
#'   \item{gender}{1 = female; 0 =  male }
#'   \item{f1_psychopathy}{individual 1's standardized score on factor 1 of LSRP}
#'   \item{f2_psychopathy}{individual 1's standardized score on factor 2 of LSRP}
#'   \item{total_psychopathy}{ individual 1's standardized score on full LSRP}
#'   \item{attractiveness}{individual 1's facial attractiveness, standardized (M = 0, SD = 1) separately for males and females}
#'   \item{fighting_ability}{student rating of fighting ability from pictures}
#'   \item{strength}{student rating of strength from pictures}
#'   \item{height}{standardized height score - standardization separate for each gender}
#'   \item{median_income}{in childhood zip code, in 1000s USD (individual 1)}
#'   \item{oldest}{Not described in paper}
#'   \item{highest_class_rank}{Not described in paper}
#'   \item{major_presige}{perceived prestige of self-reported academic major}
#'   \item{dyad_status_difference}{Not described in paper}
#'   \item{proportion_words}{an individual’s proportion of the triad’s words uttered}
#'   \item{proportion_sequence_starts}{proportion of the triad’s sequence starts performed, hereafter proportion of sequence starts (sequential dominance)}
#'   \item{interruptions_per_min}{interruptions performed per transcribed minute (participatory dominance)}
#'   \item{sequence_starts_per_word_x}{sequence starts per word produced times 100}
#'   \item{interruptions_per_word_x}{interruptions performed per word produced times 100}
#'   \item{affect_words}{frequency of affect words as described by the Linguistic Inquiry and Word Count (LIWC) 2007 program dictionary}
#'   \item{indiv_1}{id of individual 1}
#'   \item{indiv_2}{id of individual 2}
#'   \item{camera}{1 = facing the camera; 0 = not facing the camera (individual 1) during prisoner's dilemma}
#'   \item{indiv_1_interrupts_indiv_2}{interruptions by individual 1 of individual 2 per minute of transcribed conversation}
#'   \item{indiv_2_interrupts_indiv_1}{interruptions by individual 2 of individual 1 per minute of transcribed conversation}
#'   \item{indiv_1_pd_indiv_2}{Individual 1 decision toward individual 2 in PDG; 1 = individual 1 cooperates toward individual 2 in Prisoner's Dilemma; 0 = individual 1 defects toward individual 2}
#'   \item{indiv_2_pd_indiv_1}{Individual 2 decision toward individual 1 in PDG; 1 = individual 2 cooperates toward individual 1 in Prisoner's Dilemma: 0 = individual 2 defects toward individual 1}
#'   \item{indiv_1_predicts_indiv_2}{1 = individual 1 predicts that individual 2 cooperates toward individual 1; 0 = individual 1 predicts that individual 2 defects toward individual 1}
#'   \item{indiv_2_predicts_indiv_1}{1 = individual 2 predicts that individual 1 cooperates toward individual 2; 0 = individual 2 predicts that individual 1 defects toward individual 2}
#' }
#'
#' @source Manson JH, Gervais MM, Fessler DMT, Kline MA (2014) Subclinical Primary Psychopathy, but Not Physical Formidability or Attractiveness, Predicts Conversational Dominance in a Zero-Acquaintance Situation. PLoS ONE 9(11): e113135.
#' @source Gervais Matthew M., Kline Michelle, Ludmer Mara, George Rachel and Manson Joseph H. 2013The strategy of psychopathy: primary psychopathic traits predict defection on low-value relationshipsProc. R. Soc. B.28020122773
#' @source \url{https://escholarship.org/uc/item/2bx584t4}
#' @source \url{https://datadryad.org/stash/dataset/doi:10.5061/dryad.848cc}
"conversation"
