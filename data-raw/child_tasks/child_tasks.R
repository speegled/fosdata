dd <- readxl::read_xlsx("data-raw/child_tasks/pone.0198254.s002.xlsx",
                        sheet = 1)
dd <- janitor::clean_names(dd)
dd <- mutate(dd, across(where(is.character), as.factor))
child_tasks <- dd
child_tasks <- select(child_tasks, !matches("night_[0-9]$") & !matches("switch_[0-9]$"))
#save(list = c("child_tasks"), file = "data/child_tasks.rda")
