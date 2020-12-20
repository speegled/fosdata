this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

covid <- read.csv("covid.csv", stringsAsFactors = FALSE)

save(covid, file = "../../data/covid.rda")

