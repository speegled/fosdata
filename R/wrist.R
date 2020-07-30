#' Wrist Casts
#'
#' Two types of casts are evaluated for treatment on elderly patients with a common type of wrist fracture.
#'
#' From the authors: "Distal radius fractures are common fractures and the cornerstone of treatment remains immobilization of the wrist in a cast. At present, there is a scarcity of studies that compare different cast immobilization methods. The objective of the study was therefore to compare volar-flexion and ulnar deviation cast to functional cast position in the treatment of dorsally displaced distal radius fracture among elderly patients."
#'
#' @format A tibble with 105 observations of 47 variables
#' \describe{
#'   \item{id}{ID number}
#'   \item{age}{Age in years}
#'   \item{sex}{0 = man and 1 = female}
#'   \item{handed_side}{1 = right and 2 = left}
#'   \item{centre}{Centres are anonymised in this excel file}
#'   \item{fracture_side}{1 = right and 2 = left}
#'   \item{cast_position}{1 = functional cast position and 2 = volar-flexion and ulnar deviation cast position}
#'   \item{pcs_start}{PCS score at baseline of follow-up}
#'   \item{operativetreatment}{No-operative treatment during follow-up = 0 and operative treatment during follow-up}
#'   \item{pain03m}{Reported pain of the fractured wrist at the outpatient visit at 3 months: 0 = no and 1 = yes}
#'   \item{stiffness03m}{Reported stiffness of the fractured wrist at the outpatient visit at 3 months: 0 = no and 1 = yes}
#'   \item{grip_strength_fractured_side}{Grip strength in kilograms}
#'   \item{grip_strength_controlled_side}{Grip strength in kilograms}
#'   \item{grip_strength_proportion}{Grip strength of fractured side to controlled side, proportion}
#'   \item{times_outside_from_home}{How many times the patient leave from home per week in average}
#'   \item{distance_per_week}{How many kilometers does the patient walk when leaving from home in average}
#'   \item{ancillary_inside}{Does the patient use walking aids inside of home: 0 = no and 1 = yes}
#'   \item{ancillary_outside}{Does the patient use walking aids outside of home: 0 = no and 1 = yes}
#'   \item{guided_physiotherapy}{Did the patient use guided physiotherapy for fractured hand during follow-up: 0 = no and 1 = yes}
#'   \item{guided_physiotherapy_times}{How many physiotherapist visits patient underwent if guided physiotherapy was used?}
#'   \item{cast_changes}{How many cast changes patient underwent, if any?}
#'   \item{x15d3m}{Health-related quality of life measured with 15D at 3 months of follow-up}
#'   \item{x15d12m}{Health-related quality of life measured with 15D at 12 months of follow-up}
#'   \item{uv_3m}{Ulnar variance at 3 months in millimeters: + = ulnar bone is more lengthy than radial bone}
#'   \item{inclination__3m}{Inclination at 3 months}
#'   \item{angulation__3m}{Angulation at 3 months: + dorsal angulation and - volar angulation}
#'   \item{uv_cast}{Ulnar variance after closed reduction in millimeters: + = ulnar bone is more lengthy than radial bone}
#'   \item{inclination_cast}{Inclination after closed reduction}
#'   \item{angluation_cast}{Angulation after closed reduction: + dorsal angulation and - volar angulation}
#'   \item{wrist_flexion_in_cast}{Angulation between 2nd metacarpal and radial bone after closed reduction and casting: + = dorsal flexion and - = volar flexion. In degrees}
#'   \item{x3mcpra_dulnardeviationdg}{Angulation between 3rd metacarpal and radial bone after closed reduction and casting: + = ulnar-deviation and - = volar-deviation In degrees}
#'   \item{uv_pre}{Ulnar variance before closed reduction in millimeters: + = ulnar bone is more lengthy than radial bone}
#'   \item{inclination_pre}{Inclination before closed reduction}
#'   \item{angulation_pre}{Angulation before closed reduction: + dorsal angulation and - volar angulation}
#'   \item{articulariness}{Articular line of fracture: 0 = no and 1 = yes}
#'   \item{psu_fracture}{Processus styloideus ulna fracture: 0 = no and 1 = yes}
#'   \item{qd3m}{Quick-DASH at 3 months}
#'   \item{qd12m}{Quick-DASH at 12 months}
#'   \item{vas3m}{VAS for pain at 3 months}
#'   \item{vas12m}{VAS for pain at 12 months}
#'   \item{pcs3m}{PCS at 3 months}
#'   \item{pcs12m}{PCS at 3 months}
#'   \item{cast_change_category}{Underwent cast change during follow-up: 0 = no and 1 = one or more changes}
#'   \item{prwe12m}{PRWE at 12 months}
#'   \item{prwe3m}{PRWE at 3 months}
#'   \item{d_pcs1}{PCS score at 3 months minus (-) PCS score at baseline}
#'   \item{d_pcs2}{PCS score at 12 months minus (-) PCS score at baseline}
#' }
#'
#' @source  Raittio L, Launonen AP, Hevonkorpi T, Luokkala T, Kukkonen J, Reito A, et al. (2020) Two casting methods compared in patients with Colles' fracture: A pragmatic, randomized controlled trial. PLoS ONE 15(5): e0232153.
#' @source \url{https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0232153}
"wrist"
