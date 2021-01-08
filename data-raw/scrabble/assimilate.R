library(tidyverse)
library(purrr)

files <- data.frame(x = list.files(path = "data-raw/scrabble/"))
files <- files %>%
  filter(!str_detect(x, "\\.csv|\\.R")) %>%
  mutate(path = str_c("data-raw/scrabble/", x))

scrabble_ml <- map_dfr(files$path, ~read.csv(., header = FALSE, sep = "\t")) %>%
  mutate(lang = cumsum(str_detect(V1, "blank|asterisk"))) %>%
  mutate(lang = files$x[lang]) %>%
  mutate(points = str_extract(V1, "[0-9]*(?= poin)")) %>%
  separate_rows(V1, sep = ",") %>%
  mutate(number = str_extract(V1, "(?<=×)[0-9]*|[0-9]*(?= blank)")) %>%
  mutate(tile = str_extract(V1, "[A-Z0-9](?= ×)|blank")) %>%
  mutate(number = ifelse(str_detect(V1, "aster"), 2, number),
         tile = ifelse(str_detect(V1, "aster"), "*", tile)) %>%
  print(n = 130) %>%
  select(-V1) %>%
  mutate(number = strrep("1,", number)) %>%
  mutate(number = str_remove(number, ",$")) %>%
  separate_rows(number) %>%
  select(-number)

english <- read.csv("data-raw/scrabble/scrabble.csv")
english$lang <- "english"
scrabble_ml <- scrabble_ml %>%
  select(lang, tile, points) %>%
  rename(piece = tile) %>%
  rbind(english) %>%
  mutate(across(matches("points"), as.integer)) %>%
  arrange(lang, points, piece)

save(scrabble_ml, file = "data/scrabble_ml.rda")

