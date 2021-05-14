this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

library(dplyr)
library(readxl)

# http://flintwaterstudy.org/2015/12/complete-dataset-lead-results-in-tap-water-for-271-flint-samples/

tfile <- "Flint-Samples-FINAL.xlsx"
flint.raw <- read_xlsx(tfile, range="A1:G272")
flint <- flint.raw %>%
  rename(Zip.Code = `Zip Code`) %>%
  rename(Pb1 = `Pb Bottle 1 (ppb) - First Draw`,
         Pb2 = `Pb Bottle 2 (ppb) - 45 secs flushing`,
         Pb3 = `Pb Bottle 3 (ppb) - 2 mins flushing`) %>%
  mutate(SampleID = as.integer(SampleID),
         Zip.Code = factor(Zip.Code),
         Ward = factor(Ward))

save(flint, file = "../../data/flint.rda")
