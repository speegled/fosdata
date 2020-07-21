#' Housing in King County
#'
#' House prices and characteristics for houses sold in King County (home of Seattle) from May, 2014 through May, 2015.
#'
#' @format A data frame with 21613 observations of 21 variables. Descriptions taken from \url{https://www.slideshare.net/PawanShivhare1/predicting-king-county-house-prices}
#' \describe{
#'   \item{id}{unique id of each home}
#'   \item{date}{date of sale}
#'   \item{price}{price of sale}
#'   \item{bedrooms}{number of bedrooms}
#'   \item{bathrooms}{number of bathrooms}
#'   \item{sqft_living}{Square footage of living space}
#'   \item{sqft_lot}{square foot of the lot}
#'   \item{floors}{number of floors}
#'   \item{waterfront}{Is the home on the waterfront?}
#'   \item{view}{Rating from 0 to 4 of how good the view is}
#'   \item{condition}{Rating from 1-5 on the condition of the home}
#'   \item{grade}{Rating of 1-13 on the quality of materials used. 1-3 is substandard, 7 is average and 11-13 is excellent.}
#'   \item{sqft_above}{square footage above ground level}
#'   \item{sqft_basement}{square footage of basement}
#'   \item{yr_built}{year built}
#'   \item{yr_renovated}{year renovated}
#'   \item{zipcode}{zip code of house}
#'   \item{lat}{lattitude}
#'   \item{long}{longitude}
#'   \item{sqft_living15}{square footage of the 15 nearest neighbors}
#'   \item{sqft_lot15}{lot sizes of 15 nearest neighbors}
#' }
#'
#' @source \url{https://www.kaggle.com/harlfoxem/housesalesprediction}
"houses"
