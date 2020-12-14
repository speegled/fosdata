library(tidyverse)

#'
#' I went through this and saw there are several repeated entries. I thought
#' all of the codes that ended in b were repeats, but there is exactly one that is not.
#'
#' tN09Tb
#'

dd <- read.csv("data-raw/cern_public_media/cern.csv")
dd <- janitor::clean_names(dd)

dd <- dd %>%
  filter(!str_detect(code, "b$") | str_detect(code, "tN09Tb"))

xtabs(~ type + platform, data = dd) %>% addmargins() #this matches the table in the paper

dd <- dd %>% select(-matches("pk_u|_z|retent|log10|code")) %>%
  select(postdate, platform, type, subject, followers, likes, comments, shares, click_throughs, avg_visit_duration, post)

cern <- dd
cern$type <- factor(cern$type)
cern$platform <- factor(cern$platform)
str(cern)
save(cern, file = "data/cern.rda")
