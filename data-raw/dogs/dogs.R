dd <- read.csv("data-raw/dogs/data_osm.csv")
dd$dog_id <- rep(1:117, 3)
dd <- select(dd, obs_number, obs_pref, obs_position, demo_pref, condition, dropout, trial, start_direction, conform)
dogs <- dd
#save(list = c("dogs"), file = "data/dogs.rda")


