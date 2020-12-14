#' BMI and Visceral Adipose Tissue Mass
#'
#' Measurements of BMI and adipose tissue for adults.
#'
#' The response variables of interest in this study were BMI and VAT. According to the authors of the study, the VAT measurements of 5 or lower are suspect and may need to be excluded.
#'
#' From the authors: "The aims of this study were (a) to compare five anthropometric predictors of precent FM and VAT mass, and (b) to explore new cut-points for the best of these predictors to improve the characterisation of obesity."
#'
#'
#' @format A data frame with 81 observations of 12 variables.
#' \describe{
#'   \item{sex}{Male or Female}
#'   \item{health}{Description of general health of participant}
#'   \item{age}{age in years}
#'   \item{ldl}{LDL cholesterol in mmol/L}
#'   \item{hdl}{HDL cholesterol in mmol/L}
#'   \item{trig}{Triglycerides in mmol/L}
#'   \item{glucose}{Blood glucose in mmol/L}
#'   \item{stature_cm}{height in centimeters}
#'   \item{waist_cm}{waist measurement in cm}
#'   \item{hips_cm}{hips measurement in cm}
#'   \item{vat}{visceral adipose tissue fat mass in grams}
#'   \item{bmi}{body mass index kg/m^2}
#' }
#'
#' @source Swainson MG, Batterham AM, Tsakirides C, Rutherford ZH, Hind K (2017) Prediction of whole-body fat percentage and visceral adipose tissue mass from five anthropometric variables. PLoS ONE 12(5): e0177175. https://doi.org/10.1371/journal.pone.0177175
"adipose"
