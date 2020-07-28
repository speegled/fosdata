dd <- readxl::read_xlsx("data-raw/sharks/S1Dataset.XLSX")
dd <- janitor::clean_names(dd)
names(dd)
library(dplyr)
dd <- select(dd, matches("^experimen|^scar|^dang|^vici|^peace|^bea|^grace|^free|gender|^age|^race|^pol"))
names(dd) <- c("treatment", "scary", "dangerous", "vicious", "peaceful", "beautiful", "graceful", "free_response", "gender", "age", "race", "political_views")
dd$av <- ifelse(dd$treatment <= 3, "video", "audio")
dd$music <- ifelse(dd$treatment %in% c(1, 4), "uplifting", ifelse(dd$treatment %in% c(2, 5), "ominous", "silence"))
dd$treatment <- NULL
dd$av <- factor(dd$av)
dd$music <- factor(dd$music)
summary(dd)
sharks <- dd
save(list = c("sharks"), file = "data/sharks.rda")

filter(sharks, av == "video", music %in% c("ominous", "uplifting")) %>%
  with(wilcox.test(vicious ~ music))
