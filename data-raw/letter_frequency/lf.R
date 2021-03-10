dd <- read.csv("data-raw/letter_frequency/lf2")
library(tidyverse)
dd$Letter
dd <- dd %>% mutate_all(.funs = function(x) str_remove(x, "\\*")) %>%
  mutate(Turkish = as.numeric(Turkish))
dd <- dd %>%
  mutate(across(where(is.numeric), function(x) x/100)) %>%
  select(-Czech) #Czech only added up to 88 percent; there must be some errors
letter_frequency <- dd
letter_frequency <- janitor::clean_names(letter_frequency)
save(letter_frequency, file = "data/letter_frequency.rda")
