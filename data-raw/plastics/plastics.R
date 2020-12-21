library(tidyverse)

ee <- readxl::read_xlsx("data-raw/plastics/aax1157_Table_S3.xlsx", sheet = 2)
ee <- ee %>%
  janitor::clean_names()
ee <- ee %>%
  mutate(colour = tolower(colour)) %>%
  mutate(colour = str_replace(colour, "dark[- /]blue", "darkblue")) %>%
  mutate(colour = str_replace(colour, "ligth", "light")) %>%
  mutate(colour = str_replace_all(colour, " ", "")) %>%
  mutate(colour = str_replace_all(colour, "-|–", "/")) %>%
  mutate(colour = str_replace(colour, "wine/red", "winered")) %>%
  mutate(colour = str_replace(colour, "lila", "lilac")) %>%
  mutate(colour = str_replace(colour, "turquios|turquois", "turquoise")) %>%
  select(-fiber_id)

ee <- as.data.frame(ee)
plastics <- ee
save(plastics, file = "data/plastics.rda")
