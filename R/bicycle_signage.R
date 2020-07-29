#' Bicycle Signage and Safety
#'
#' Survey data where respondents describe the safety and propriety of a situation where a bicyclist is taking
#' the full lane on a narrow, two lane road.
#'
#' From the authors: "Many global challenges, including obesity, health care costs, and climate change, could be addressed in part by increasing the use of bicycles for transportation. Concern about the safety of bicycling on roadways is frequently cited as a deterrent to increasing bicycle use in the USA. The use of effective signage along roadways might help alleviate these concerns by increasing knowledge about the rights and duties of bicyclists and motorists, ideally reducing crashes."
#'
#'
#'
#' @format A data frame with 1824 observations of 11 variables
#' \describe{
#'   \item{treatment}{The traffic control device the respondent viewed. 1_None (no signage); 2_STR (Share the Road signage); 3_SLM (Shared Lane Markings); 4_BMUFL (Bicycles May Use Full Lane signage)}
#'   \item{bike_move_right2}{Response to the bicyclist should move to the right and allow the following motorist to pass within the lane.}
#'   \item{mv_wait2}{Response to the motorist behind the bicyclist should slow and wait for a break in incoming traffic before passing in the adjacent lane. 0_Disagree; 1_Agree}
#'   \item{permitted2}{Response to the bicyclist is permitted to ride in the center of the lane.}
#'   \item{safe2}{Response to it is safe for the bicyclists to ride in the center of the lane.}
#'   \item{cycle_distance}{How many miles do you bicycle during a typical week}
#'   \item{mv_distance}{How many miles do you drive a motor vehicle during a typical week}
#'   \item{commute_type2}{CommuteType recoded to motor vehicle or something else}
#'   \item{state}{State of residence}
#'   \item{gender}{Male or female}
#'   \item{education}{Level of education}
#' }
#'
#' @source Hess G, Peterson MN (2015) “Bicycles May Use Full Lane” Signage Communicates U.S. Roadway Rules and Increases Perception of Safety. PLoS ONE 10(8): e0136973. https://doi.org/10.1371/journal.pone.0136973
"bicycle_signage"
