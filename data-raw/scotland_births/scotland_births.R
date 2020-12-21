dd <- read.csv("data-raw/scotland_births/births-time-series-19-bt_BT.02.csv", skip = 3)
names(dd)[1] <- "age"
library(tidyverse)
dd <- select(dd, -matches("X\\."))
dd <- janitor::clean_names(dd)
dd <- dd[-1,]
dd <- dd %>% filter(str_detect(age, "^[0-9]+$"))
dd <- dd %>%
  mutate_all(function(x) str_remove(x, ",")) %>%
  mutate_all(function(x) ifelse(str_detect(x, "[0-9]"), x, "0")) %>%
  mutate(age = as.integer(age))

scotland_births <- dd
save(scotland_births, file = "data/scotland_births.rda")
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
