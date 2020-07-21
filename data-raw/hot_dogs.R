dd <- read.csv("data-raw/hot-dogs.csv")
dd <- janitor::clean_names(dd)
hot_dogs <- dd
save(list = c("hot_dogs"), file = "data/hot_dogs.rda")
