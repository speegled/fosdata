dd <- readxl::read_xlsx("data-raw/mice_pot/S1_Data.xlsx", sheet = 7,skip = 2)
head(dd)
dd <- janitor::clean_names(dd)
dd$gen <- factor(dd$gen)
unique(dd$group)
dd <- dd %>% filter(group != "10")
dd$group <- factor(dd$group, levels = c("VEH", "0.3", "1", "3"))
summary(dd)
library(ggplot2)
ggplot(dd, aes(x = group, y = percent_of_act)) +
  geom_boxplot(outlier.size = -.1) +
  geom_jitter(height = 0, width = .3) +
  facet_wrap(~gen)
library(dplyr)
dd %>% filter(gen == "WT", group != "10") %>%
  with(lm(percent_of_act ~ group)) %>% anova

dd %>% group_by(group) %>% summarize(m = mean(d_in_temp))
dd %>% filter(gen == "WT", group != "10") %>%
  with(pairwise.t.test(percent_of_act, group, pool.sd = FALSE))

mice_pot <- dd
mice_pot <- filter(mice_pot, gen == "WT", group != "10") %>% select(group, percent_of_act)
mice_pot <- as.data.frame(mice_pot)
save(mice_pot, file = "data/mice_pot.rda")





