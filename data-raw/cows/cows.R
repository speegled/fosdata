cows <- read.csv("data-raw/cows/cows.csv")
cows_small <- filter(cows, nozzle %in% c("TK-0.75", "Control", "TK-12"), body_part == "shoulder") %>%
  group_by(cow, nozzle) %>%
  summarize(temp_change = mean(min_04 - min_01),
            cow = first(cow))
cows_small <- cows_small %>% pivot_wider(names_from = "nozzle", values_from = temp_change)
cows_small <- janitor::clean_names(cows_small)
save(list = c("cows_small"), file = "data/cows_small.rda")
plot(cows_small$tk_0_75, cows_small$tk_12)
