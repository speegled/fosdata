# Set directory to match this script
setwd(dirname(parent.frame(2)$ofile))

dd <- read.csv("births-time-series-19-bt_BT.02.csv", skip = 3)
names(dd)[1] <- "age"
library(tidyverse)
dd <- select(dd, -matches("X\\."))
dd <- janitor::clean_names(dd)
dd <- dd[-1,]
dd <- dd %>% filter(str_detect(age, "^[0-9]+$"))
dd <- dd %>%
  mutate_all(function(x) str_remove(x, ",")) %>%
  mutate_all(function(x) ifelse(str_detect(x, "[0-9]"), x, "0")) %>%
  mutate_all(function(x) as.integer(x))

scotland_births <- dd
save(scotland_births, file = "scotland_births.rda")
#'
#' usage
#'

dd %>% pivot_longer(cols = -age, names_to = "year") %>%
  mutate(year = str_extract(year, "[0-9]+")) %>%
  mutate(across(where(is.character), as.integer)) %>%
  filter(year > 1950) %>%
  ggplot(aes(x = year, y = value, color = age, group = age)) +
  geom_line() +
  gghighlight::gghighlight(age == 20|age == 30)

dd <- dd %>% pivot_longer(cols = -age, names_to = "year") %>%
  mutate(year = str_extract(year, "[0-9]+")) %>%
  mutate(across(where(is.character), as.integer))

dd %>%
  filter(age <= 20) %>%
  group_by(year) %>%
  summarize(babies = sum(value)) %>%
  top_n(1, babies)

dd %>%
  filter(age == 13) %>%
  pull(value) %>%
  acf() #looks independent; we could do test of Poisson on this
