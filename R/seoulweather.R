#' Weather data for Seoul
#'
#' The forecast for the next day and current day weather conditions in and near Seoul from 2013-06-30 to 2017-08-30.
#'
#' From the source: "This data is for the purpose of bias correction of next-day maximum and minimum air temperatures forecast of the LDAPS model operated by the Korea Meteorological Administration over Seoul, South Korea. This data consists of summer data from 2013 to 2017. The input data is largely composed of the LDAPS model's next-day forecast data, in-situ maximum and minimum temperatures of present-day, and geographic auxiliary variables. There are two outputs (i.e. next-day maximum and minimum air temperatures) in this data."
#'
#' @format A data frame with 7752 observations of 25 variables
#' \describe{
#   \item{station}{used weather station number: 1 to 25}
#   \item{date}{Present day: yyyy-mm-dd ('2013-06-30' to '2017-08-30')}
#   \item{present_tmax}{Maximum air temperature between 0 and 21 h on the present day: 20 to 37.6}
#   \item{present_tmin}{Minimum air temperature between 0 and 21 h on the present day: 11.3 to 29.9}
#   \item{ldaps_r_hmin}{LDAPS model forecast of next-day minimum relative humidity (%): 19.8 to 98.5}
#   \item{ldaps_r_hmax}{LDAPS model forecast of next-day maximum relative humidity (%): 58.9 to 100}
#   \item{ldaps_tmax_lapse}{LDAPS model forecast of next-day maximum air temperature applied lapse rate: 17.6 to 38.5}
#   \item{ldaps_tmin_lapse}{LDAPS model forecast of next-day minimum air temperature applied lapse rate: 14.3 to 29.6}
#   \item{ldaps_ws}{LDAPS model forecast of next-day average wind speed (m/s): 2.9 to 21.9}
#   \item{ldaps_lh}{LDAPS model forecast of next-day average latent heat flux (W/m2): -13.6 to 213.4}
#   \item{ldaps_cc1}{LDAPS model forecast of next-day 1st 6-hour split average cloud cover (0-5 h) (%): 0 to 0.97}
#   \item{ldaps_cc2}{LDAPS model forecast of next-day 2nd 6-hour split average cloud cover (6-11 h) (%): 0 to 0.97}
#   \item{ldaps_cc3}{LDAPS model forecast of next-day 3rd 6-hour split average cloud cover (12-17 h) (%): 0 to 0.98}
#   \item{ldaps_cc4}{LDAPS model forecast of next-day 4th 6-hour split average cloud cover (18-23 h) (%): 0 to 0.97}
#   \item{ldaps_ppt1}{LDAPS model forecast of next-day 1st 6-hour split average precipitation (0-5 h) (%): 0 to 23.7}
#   \item{ldaps_ppt2}{LDAPS model forecast of next-day 2nd 6-hour split average precipitation (6-11 h) (%): 0 to 21.6}
#   \item{ldaps_ppt3}{LDAPS model forecast of next-day 3rd 6-hour split average precipitation (12-17 h) (%): 0 to 15.8}
#   \item{ldaps_ppt4}{LDAPS model forecast of next-day 4th 6-hour split average precipitation (18-23 h) (%): 0 to 16.7}
#   \item{lat}{Latitude: 37.456 to 37.645}
#   \item{lon}{Longitude: 126.826 to 127.135}
#   \item{dem}{Elevation (m): 12.4 to 212.3}
#   \item{slope}{Slope: 0.1 to 5.2}
#   \item{solar_radiation}{Daily incoming solar radiation (wh/m2): 4329.5 to 5992.9}
#   \item{next_tmax}{The next-day maximum air temperature: 17.4 to 38.9}
#   \item{next_tmin}{The next-day minimum air temperature: 11.3 to 29.8}
#' }
#'
#' @source 'Cho, D., Yoo, C., Im, J., & Cha, D. (2020). Comparative assessment of various machine learning-based bias correction methods for numerical weather prediction model forecasts of extreme air temperatures in urban areas. Earth and Space Science.'
#'
#' @source \url{https://archive.ics.uci.edu/ml/datasets/Bias+correction+of+numerical+prediction+model+temperature+forecast}
"seoulweather"
