#' Temperature and heart rate data
#'
#' Temperature, gender and hear rate data reconstructed to match summary data from a paper.
#'
#' From the author: "This article takes data from a paper in the Journal of the American Medical Association that examined whether the true mean body temperature is 98.6 degrees Fahrenheit. Because the dataset suggests that the true mean is approximately 98.2, it helps students to grasp concepts about true means, confidence intervals, and t-statistics. Students can use a t-test to test for sex differences in body temperature and regression to investigate the relationship between temperature and heart rate."
#'
#' @format A data frame with 130 observations of 3 variables
#' \describe{
#'   \item{temp}{temperature of patient in degrees Fahrenheit}
#'   \item{gender}{gender of patient 1 = male, 2 = female}
#'   \item{bpm}{heart rate in beats per minute}
#' }
#'
#' @source "Datasets and Stories" article "What’s Normal? – Temperature, Gender, and Heart Rate" in the Journal of Statistics Education (Shoemaker 1996).
#' @source \url{http://jse.amstat.org/datasets/normtemp.dat.txt}
#' @source \url{http://jse.amstat.org/v4n2/datasets.shoemaker.html}
#' @source Mackowiak, Wasserman, and Levine, "A Critical Appraisal of 98.6 Degrees F, the Upper Limit of the Normal Body Temperature, and Other Legacies of Carl Reinhold August Wunderlich", JAMA 1992.
"normtemp"
