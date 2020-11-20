ff <- read.csv("data-raw/fish/fish.csv")
names(ff)[8] <- "width_percent"
fish <- ff
save(fish, file = "data/fish.rda")
