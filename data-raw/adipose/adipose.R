library(tidyverse)

bb <- haven::read_sav("data-raw/adipose/S1File.sav")

bb <- janitor::clean_names(bb)

bb <- bb %>%
  mutate(sex = as_factor(sex))
ggplot(filter(bb, vis_fat_mass_pre > 5), aes(x = waist_height_ratio, y = log(vis_fat_mass_pre), color = sex)) +
  geom_point() +
  geom_smooth(method = "lm")

ggplot(filter(bb, vis_fat_mass_pre > 1), aes(x = waist_height_ratio, y = bmi, color = sex)) +
  geom_point() +
  geom_smooth(method = "lm")

bb <- bb %>% select(sex, health, age, matches("pre$"), bmi) %>%
  select(-matches("^total|^sbp|^dbp|^tc|^body|^fat|^lean|^bone|^andro|^gyn|^a_g|^crp|^il6|^le|^adi|^h_w")) %>%
  rename_all(function(x) str_remove(x, "_pre"))

bb <- labelled::remove_attributes(bb, "format.spss") %>%
  labelled::remove_attributes(c("display_width")) %>%
  labelled::remove_attributes("labels") %>%
  labelled::remove_labels()


#' bb$vis_fat_mass > 5
#' bb$vis_fat_mass <- ifelse(bb$vis_fat_mass > 5, bb$vis_fat_mass, NA)

bb <- rename(bb, vat = vis_fat_mass)
adipose <- bb
save(adipose, file = "data/adipose.rda")
