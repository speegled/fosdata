library(tidyverse)

dd <- read.csv("data-raw/cern_public_media/cern.csv")
dd <- janitor::clean_names(dd)
head(dd)
!str_detect(dd$code, "[b-z]$")
dd <- dd %>%
  filter(!str_detect(code, "[b-z]$"))
dd <- dd %>% select(-matches("pk_u|_z|retent|log10|code")) %>%
  select(postdate, platform, type, subject, followers, likes, comments, shares, click_throughs, avg_visit_duration, post)
dd$ccode
cern <- dd
cern$type <- factor(cern$type)
cern$platform <- factor(cern$platform)
str(cern)
save(cern, file = "data/cern.rda")
