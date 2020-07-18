library(dplyr)
dd <- read.csv("data-raw/weight_estimate/Data_Anonym_published_6YO.csv", sep = ";", skip = 4)
names(dd) <- c("ID", "Height", "bias", "cv", "rms", "ratio", "mean100", "se100", "mean200", "se200", "mean300", "se300", "mean400", "se400", "totave", "aveabsbias", "X1", "intercept", "slope", "cilow", "cihigh", "r2", "X2", "age", "gender")
dd <- select(dd, ID, Height, mean100, mean200, mean300, mean400)
dd$age <- "6"
dd6 <- dd
dd <- read.csv("data-raw/weight_estimate/Data_Anonym_published_8YO.csv", sep = ";", skip = 4)
names(dd) <- c("ID", "Height", "bias", "cv", "rms", "ratio", "mean100", "se100", "mean200", "se200", "mean300", "se300", "mean400", "se400", "totave", "aveabsbias", "X1", "intercept", "slope", "cilow", "cihigh", "r2", "X2", "age", "gender")
dd <- select(dd, ID, Height, mean100, mean200, mean300, mean400)
dd$age <- "8"
dd8 <- dd
dd <- read.csv("data-raw/weight_estimate/Data_Anonym_published_10YO.csv", sep = ";", skip = 4)
names(dd) <- c("ID", "Height", "bias", "cv", "rms", "ratio", "mean100", "se100", "mean200", "se200", "mean300", "se300", "mean400", "se400", "totave", "aveabsbias", "X1", "intercept", "slope", "cilow", "cihigh", "r2", "X2", "age", "gender")
dd <- select(dd, ID, Height, mean100, mean200, mean300, mean400)
dd$age <- "10"
dd10 <- dd
dd <- read.csv("data-raw/weight_estimate/Data_Anonym_published_ADULTS.csv", sep = ";", skip = 4)
names(dd) <- c("ID", "Height", "bias", "cv", "rms", "ratio", "mean100", "se100", "mean200", "se200", "mean300", "se300", "mean400", "se400", "totave", "aveabsbias", "X1", "intercept", "slope", "cilow", "cihigh", "r2", "X2", "age", "gender")
dd <- select(dd, ID, Height, mean100, mean200, mean300, mean400)
dd$age <- "adult"
ddadults <- dd
dd <- rbind(dd6, dd8, dd10, ddadults)
dd <- dd[complete.cases(dd),]
dd <- mutate_if(dd, is.character, function(x) stringr::str_replace(x, ",", "."))
dd <- mutate(dd, across(.cols = dplyr::starts_with("mean"), as.numeric))

# dd <- mutate(dd, error100 = mean100 - 100,
#              error200 = mean200 - 200,
#              error300 = mean300 - 300,
#              error400 = mean400 - 400)

dd <- janitor::clean_names(dd)
weight_estimate <- dd
weight_estimate$age <- factor(weight_estimate$age, levels = c("6", "8", "10", "adult"))
#save(list = c("weight_estimate"), file = "data/weight_estimate.rda")


