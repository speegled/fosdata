# Set directory to match this script
setwd(dirname(parent.frame(2)$ofile))

dd <- readxl::read_xlsx("S1Dataset.XLSX")
dd <- janitor::clean_names(dd)
names(dd)
library(dplyr)
dd <- select(dd, matches("^experimen|^scar|^dang|^vici|^peace|^bea|^grace|^free|^willing|gender|^age|^race|^annual|^pol"))
names(dd) <- c("treatment", "scary", "dangerous", "vicious", "peaceful", "beautiful", "graceful", "free_response", "conserve", "gender", "age", "race_ethnicity", "annual_income", "political_views")
dd$av <- ifelse(dd$treatment <= 3, "video", "audio")
dd$music <- ifelse(dd$treatment %in% c(1, 4), "uplifting", ifelse(dd$treatment %in% c(2, 5), "ominous", "silence"))
dd$treatment <- NULL
dd$av <- factor(dd$av)
dd$music <- factor(dd$music)
dd <- relocate(dd, av, music)
summary(dd)
sharks <- data.frame(dd)
save(list = c("sharks"), file = "sharks.rda")

filter(sharks, av == "video", music %in% c("ominous", "uplifting")) %>%
  with(wilcox.test(vicious ~ music))
