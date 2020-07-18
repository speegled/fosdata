#' Dogs and peer pressure
#'
#' If all of your friends jumped off of a cliff, would you do it too? This study tries to determine whether
#' dogs follow their training over the example of other dogs. Dogs were trained to walk around a wall a certain
#' direction, and then they observed other walking around the wall in the opposite direction. Which way does
#' the dog choose?
#'
#' The control group `condition == 0` did not see any dogs doing anything. When `condition == 1`, the dog saw **the same dog**
#' go around the wall in the "wrong" direction three times. When `condition == 3`, the dog saw **three different dogs**
#' go around the wall in the "wrong" direction one time.
#'
#' In the experimental setup, each dog repeated the experiment three times. Dogs were led to the spot where they would have
#' to decide which way to go around the wall according to `start_direction`. If `start_direction == 1`, then the dog
#' was led to the spot in such a way that the dog was already facing the direction it had been trained to go. When
#' `start_direction == 0`, the dog was led to the spot facing the direction it was not trained to go. Some dogs did
#' not complete the trial because of stress or some other reason, They are indicated by `dropout == 1`.
#'
#' From the authors: "In recent years, an increasing number of studies has investigated majority influence in nonhuman animals. However, due to both terminological and methodological issues, evidence for conformity in nonhuman animals is scarce and controversial. Preliminary evidence suggests that wild birds, wild monkeys, and fish show conformity, that is, forgoing personal information in order to copy the majority. By contrast, chimpanzees seem to lack this tendency. The present study is the first to examine whether dogs (Canis familiaris) show conformity."
#'
#' @format A data frame with 351 observations of 9 variables. Descriptions of the variables due to authors.
#' \describe{
#'   \item{obs_number}{ID of each subject}
#'   \item{obs_pref}{preference of observer in german ("links" = bypass wall on the left side; "rechts" = bypass wall on the right side)}
#'   \item{obs_position}{observing position of observer in german ("links" = left ; "rechts" = right)}
#'   \item{demo_pref}{preference of demonstrator(s)in german ("links" = bypass wall on the left side; "rechts" = bypass wall on the right side)}
#'   \item{condition}{"0" = no demonstrator (control condition); "1" = one demonstrator, "3" = three demonstrator}
#'   \item{dropout}{"0" = remains in final sample, "1" = excluded from final sample}
#'   \item{trial}{number of trial (1,2,3)}
#'   \item{start_direction}{direction the observer was led from observing position to start position (see article for details; "0" = directed towards a stay response, "1" directed towards a switch response) )}
#'   \item{conform}{behavior of observer ("0" = stay response, "1" = switch response), as variable value but without misses (which were code NA for analyses)}
#' }
#'
#' @source "Germar M, Sultan A, Kaminski J, Mojzisch A (2018) Dogs (Canis familiaris) stick to what they have learned rather than conform to their conspecifics’ behavior. PLoS ONE 13(3): e0194808."
#' @source \url{https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0194808}
#' @source "Germar, Markus, and Andreas Mojzisch. 2018. “Dogs (Canis Familiaris) Stick to What They Have Learned rather than Conform to Their Conspecifics’ Behavior.” OSF. April 4. osf.io/dgtxt."
"dogs"
