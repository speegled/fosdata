dd <- read.csv("data-raw/critical_period_hypothesis/Dataset S2.CSV")
dd$locale <- "Israel"
dd2 <- read.csv("data-raw/critical_period_hypothesis/Dataset S1.CSV")
dd2$locale <- "North America"
dd <- janitor::clean_names(dd)
dd2 <- janitor::clean_names(dd2)
dd <- rbind(dd, dd2)
crit_period <- dd
crit_period$locale <- as.factor(crit_period$locale)
save(list = c("crit_period"), file = "data/crit_period.rda")
