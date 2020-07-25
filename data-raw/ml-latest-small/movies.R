dd <- read.csv("data-raw/ml-latest-small/movies.csv")
dd2 <- read.csv("data-raw/ml-latest-small/ratings.csv")
dd3 <- dplyr::left_join(dd2, dd, by = "movieId")
movies <- dd3
save(list = c("movies"), file = "data/movies.rda")
