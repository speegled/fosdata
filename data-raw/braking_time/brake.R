dd <- read.csv("data-raw/braking_time/results_UA.csv")
dd <- janitor::clean_names(dd)
head(dd)
dd <- select(dd, !matches("normal|overall"))
brake <- dd
save(list = c("brake"), file = "data/brake.rda")
