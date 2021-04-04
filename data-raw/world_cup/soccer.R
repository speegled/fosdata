dd <- readLines("data-raw/soccer/soccer")
library(tidyverse)
dd <- dd[dd != ""]
dd <- data.frame(x = dd)
dd
separate(dd, x, sep = ",", into = c("Team 1", "Team 2"))
dd$type <- cumsum(str_detect(dd$x, ":"))
dd <- dd %>%
  group_by(type) %>%
  mutate(game = str_remove(x[1], ":")) %>%
  filter(!str_detect(x, ":")) %>%
  ungroup() %>%
  select(-type) %>%
  mutate(type = cumsum(str_detect(x, "June|July"))) %>%
  group_by(type) %>%
  mutate(date = x[1]) %>%
  ungroup() %>%
  select(-type) %>%
  filter(!str_detect(x, "June|July")) %>%
  separate(col = x, sep = ",", into = c("team_1", "team_2")) %>%
  mutate(notes = str_extract(team_2, "\\(.+\\)")) %>%
  mutate(notes = str_remove_all(notes, "[\\(\\)]")) %>%
  mutate(team_2 = str_remove_all(team_2, "\\(.*\\)|^ ")) %>%
  separate(team_1, sep = " (?=[0-9])", into = c("team_1", "score_1"), convert = T) %>%
  separate(team_2, sep = " (?=[0-9])", into = c("team_2", "score_2"), convert = T) %>%
  print(n = 52) %>%
  mutate(competition = "2015 FIFA Women's World Cup")

wwc <- dd

goals <- c(dd$score_1, dd$score_2)
table(goals)

dd <- readLines("data-raw/soccer/soccer_2")
dd <- data.frame(x = dd[dd!= ""])
dd <- dd %>%
  mutate(type = cumsum(str_detect(x, "inal|Round|Third"))) %>%
  group_by(type) %>%
  mutate(game = str_remove(x[1], ":")) %>%
  ungroup() %>%
  filter(!str_detect(x, "inal|Round|Third")) %>%
  ungroup() %>%
  print(n = 94) %>%
  mutate(x = str_remove(x, "[a-zA-Z]*day, ")) %>%
  mutate(type = cumsum(str_detect(x, "June|July"))) %>%
  group_by(type) %>%
  mutate(date = x[1]) %>%
  ungroup() %>%
  select(-type) %>%
  filter(!str_detect(x, "June|July")) %>%
  mutate(notes = str_extract(x, "\\(.+\\)")) %>%
  mutate(notes = str_remove_all(notes, "[\\(\\)]")) %>%
  print(n = 65) %>%
  mutate(x = str_remove(x, " at.*")) %>%
  separate(col = x, sep = ",", into = c("team_1", "team_2")) %>%
  separate(team_1, sep = " (?=[0-9])", into = c("team_1", "score_1"), convert = T) %>%
  separate(team_2, sep = " (?=[0-9])", into = c("team_2", "score_2"), convert = T) %>%
  mutate(notes = ifelse(str_detect(score_2, "in"), str_extract(score_2, "[a-z ]+$"), notes)) %>%
  mutate(score_2 = as.integer(str_remove_all(score_2, "[a-z ]"))) %>%
  mutate(team_2 = str_remove(team_2, "^ ")) %>%
  mutate(notes = str_remove(notes, " "))  %>%
  mutate(competition = "2014 FIFA Men's World Cup")

world_cup <- rbind(dd, wwc)
unique(world_cup$game)
world_cup$game[world_cup$game == "Third-Place Game"] <- "Third Place"
world_cup$game[world_cup$game == "First Round"] <- "Group Stage"
save(world_cup, file = "data/world_cup.rda")

