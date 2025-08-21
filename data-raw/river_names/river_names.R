#' This data was obtained by taking a screenshot of the 1975 World Almanac and Book of Facts, page 408
#' and using pdftools to pull into R, followed by fixing up many mistakes by hand


river_names <- read.csv("data-raw/river_names/river_names.csv")
save(river_names, file = "data/river_names.rda")