dd <- readxl::read_xlsx("data-raw/rio_instagram/OlympicAthletesData.xlsx")
dd <- janitor::clean_names(dd)
dd$gender <- factor(dd$gender)
rio_instagram <- dd
save(list = c("rio_instagram"), file = "data/rio_instagram.rda")
