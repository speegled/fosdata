dd2 <- readxl::read_xlsx("data-raw/wii_data/leg_strength.xlsx")
library(dplyr)
dd2 <- dd2 %>% select(matches("WII M[0-9]$"), ID) %>%
  tidyr::pivot_longer(cols = -ID) %>%
  group_by(ID) %>%
  summarize(mean_wii = mean(value)) %>%
  left_join(dd2 %>% select(matches("SID M[0-9]$"), ID) %>%
              tidyr::pivot_longer(cols = -ID) %>%
              group_by(ID) %>%
              summarize(mean_sid = mean(value)))

leg_strength <- dd2
save(list = c("leg_strength"), file = "data/leg_strength.rda")

dd2 <- readxl::read_xlsx("data-raw/wii_data/leg_strength.xlsx")
dd2 <- janitor::clean_names(dd2)
dd2$x10 <- NULL
leg_strength_full <- dd2
save(list = c("leg_strength_full"), file = "data/leg_strength_full.rda")
