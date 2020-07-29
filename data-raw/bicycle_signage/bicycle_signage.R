dd <- read.csv("data-raw/bicycle_signage/S2 Data.DAT")
head(dd)
names(dd)
for(i in c(3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15, 16, 17, 19, 20)) {
  dd[,i] <- factor(dd[,i])
}
dd$CommuteType <- NULL
dd$CommuteType1 <- NULL
library(tidyverse)
wilcox.test(as.integer(BikeMoveRight2) ~ CommuteType2, data = dd)

unique(dd$Treatment)

dd$Gender[dd$Gender == ""] <- NA
dd$Gender <- factor(dd$Gender)
dd$Education[dd$Education == ""] <- NA
dd$Education <- factor(dd$Education)
dd <- select(dd, !matches("4$"))
dd$Timestamp <- NULL
dd <- select(dd, !matches("st[12]$"))
bicycle_signage <- dd
library(magrittr)
bicycle_signage <- janitor::clean_names(bicycle_signage)
save(bicycle_signage, file = "data/bicycle_signage.rda")
bicycle_signage <- filter(bicycle_signage, cycle_distance == "None")
filter(bicycle_signage, str_detect(cycle_distance,"None|Less than 10 miles"))
bicycle_signage%>%
  with(table(bike_move_right2, treatment)) %>%
  as.matrix() %>%
  as.data.frame %>%
  pivot_wider(names_from = treatment, values_from = Freq) %>%
  janitor::clean_names() %>%
  select(!matches("2$")) %>%
  as.matrix() %>%
  t() %>%
  chisq.test()
