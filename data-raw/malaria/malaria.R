library(tidyverse)
dd <- readxl::read_xlsx("data-raw/malaria/ppat.1006108.s006.xlsx", sheet = 1)
dd <- janitor::clean_names(dd)
dd_ten <- dd %>% filter(mosquito_bites_received == 10)
dd_ten$sporozoite <-dd_ten %>%
  select(matches("^sporo")) %>%
  mutate_all(as.integer) %>%
  as.matrix() %>%
  apply(1, sum)
dd_malaria <- dd_ten %>% select(!matches("sporozoite[0-9_na]+$")) %>%
  mutate(malaria = as.integer(para10 > 0)) %>%
  select(matches("spor|mal|study$"))
dd_malaria$antibody <- factor(dd_malaria$study, labels = c("no", "yes"), levels = c(1, 2))
dd_malaria$study <- NULL
ggplot(dd_malaria, aes(x = sporozoite, y = malaria)) +
  geom_jitter(height = 0, width = 0.2) +
  geom_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

mod <- glm(malaria ~ sporozoite, family = "binomial", data = dd_malaria)
summary(mod)
dd_malaria %>%
  group_by(antibody) %>%
  summarize(percent = mean(sporozoite))
malaria <- dd_malaria
save(malaria, file = "data/malaria.rda")
