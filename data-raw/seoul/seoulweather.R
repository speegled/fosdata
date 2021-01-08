dd <- read.csv("data-raw/seoul/Bias_correction_ucl.csv")
head(dd)
dd <- janitor::clean_names(dd)
seoulweather <- dd
save(seoulweather, file = "data/seoulweather.rda")
