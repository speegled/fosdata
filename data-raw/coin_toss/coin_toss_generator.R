dd <- read.csv("data-raw/coin_toss/coin_toss.csv")
dd
library(tidyverse)
dd <- dd %>% mutate(tot = heads + tails)
write.csv(x = dd, file = "data-raw/coin_toss/coin_toss.csv", row.names = FALSE)
