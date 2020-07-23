dd <- readxl::read_xlsx("data-raw/wrist_cast/journal.pone.0232153.s006.xlsx")
dd <- janitor::clean_names(dd)
wrist <- dd
save(list = c("wrist"), file = "data/wrist.rda")
