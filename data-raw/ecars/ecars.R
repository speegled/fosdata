this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

ecars <- read.csv("station_data_dataverse.csv", stringsAsFactors = FALSE)
ecars <- ecars %>% mutate(facilityType = factor(facilityType,labels = c('Manufacturing','Office','R & D', 'Other'))) %>%
  select(-one_of(c('Mon','Tues','Wed','Thurs','Fri','Sat','Sun')))

save(ecars, file = "../../data/ecars.rda")

