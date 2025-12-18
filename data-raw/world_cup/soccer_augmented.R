dd <- readLines(here::here("data-raw/world_cup/soccer"))
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

aa <- data.frame(x = readLines("data-raw/world_cup/2014_mens_info.txt"))
team_info_men <- aa %>% 
  mutate(x = str_remove(x, " \\([a-z]+\\)")) %>% 
  mutate(rank = str_extract(x, "[0-9]+")) %>% 
  mutate(x = str_remove(x, " \\([0-9]+\\)")) %>% 
  mutate(confed = ifelse(str_detect(x, "[a-z]"), "", x)) %>% 
  mutate(group = cumsum(str_detect(confed, "[A-Z]"))) %>% 
  group_by(group) %>% 
  mutate(confed = first(confed)) %>% 
  ungroup() %>% 
  filter(x != "") %>% 
  filter(str_detect(x, "[a-z]")) %>% 
  filter(!str_detect(x, "qual")) %>% 
  select(x, rank, confed) %>% 
  rename(team = x) %>% 
  mutate(year = 2014, group = "men") %>% 
  mutate(team = ifelse(str_detect(team, "Bosn"), "Bosnia-Herzegovina", team)) 

aa <- data.frame(x = readLines("data-raw/world_cup/2015_team_info.txt"))
team_info_women <- aa %>% 
  mutate(x = str_remove(x, " \\([a-z]+\\)")) %>% 
  mutate(rank = str_extract(x, "[0-9]+")) %>% 
  mutate(x = str_remove(x, " \\([0-9]+\\)")) %>% 
  mutate(confed = ifelse(str_detect(x, "[a-z]"), "", x)) %>% 
  mutate(group = cumsum(str_detect(confed, "[A-Z]"))) %>% 
  group_by(group) %>% 
  mutate(confed = first(confed)) %>% 
  ungroup() %>% 
  filter(x != "") %>% 
  filter(str_detect(x, "[a-z]")) %>% 
  filter(!str_detect(x, "qual")) %>% 
  select(x, rank, confed) %>% 
  rename(team = x) %>% 
  mutate(year = 2015, group = "women") %>% 
  mutate(team = ifelse(str_detect(team, "China"), "China", team)) %>% 
  mutate(team = ifelse(str_detect(team, "United S"), "USA", team))
team_info_women %>% 
  print(n = 24)

wwc <- left_join(dd, team_info_women, by = c("team_1" = "team")) %>% 
  rename(rank_1 = rank, confed_1 = confed) %>% 
  select(-year, -group)

wwc <- left_join(wwc, team_info_women, by = c("team_2" = "team")) %>% 
  rename(rank_2 = rank, confed_2 = confed) %>% 
  mutate(id = 1:n(), .before = game) %>% 
  pivot_longer(cols = c(score_1, score_2)) %>%   
  mutate(name = ifelse(str_detect(name, "1"), "winner", "loser")) %>% 
  rename(goals = value) %>% 
  mutate(team = ifelse(str_detect(name, "winner"), team_1, team_2)) %>% 
  select(-team_1, -team_2) %>% 
  mutate(rank = ifelse(str_detect(name, "winner"), rank_1, rank_2)) %>% 
  mutate(confed = ifelse(str_detect(name, "winner"), confed_1, confed_2)) %>% 
  select(-competition, -matches("[0-9]$")) %>% 
  group_by(id) %>% 
  mutate(change = first(goals) == last(goals)) %>% 
  ungroup() %>% 
  mutate(name = ifelse(change, "tie", name)) %>% 
  select(-change) 


goals <- c(dd$score_1, dd$score_2)
table(goals)

dd <- readLines("data-raw/world_cup/soccer_2")
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
team_info_men %>% 
  print(n = 24)
mwc <- left_join(dd, team_info_men, by = c("team_1" = "team")) %>% 
  rename(rank_1 = rank, confed_1 = confed) %>% 
  select(-year, -group)
mwc %>% 
  print(n = 64)
mwc <- left_join(mwc, team_info_men, by = c("team_2" = "team")) %>% 
  rename(rank_2 = rank, confed_2 = confed) %>% 
  mutate(id = 1:n(), .before = game) %>% 
  pivot_longer(cols = c(score_1, score_2)) %>%   
  mutate(name = ifelse(str_detect(name, "1"), "winner", "loser")) %>% 
  rename(goals = value) %>% 
  mutate(team = ifelse(str_detect(name, "winner"), team_1, team_2)) %>% 
  select(-team_1, -team_2) %>% 
  mutate(rank = ifelse(str_detect(name, "winner"), rank_1, rank_2)) %>% 
  mutate(confed = ifelse(str_detect(name, "winner"), confed_1, confed_2)) %>% 
  select(-competition, -matches("[0-9]$")) %>% 
  group_by(id) %>% 
  mutate(change = first(goals) == last(goals)) %>% 
  ungroup() %>% 
  mutate(name = ifelse(change, "tie", name)) %>% 
  select(-change) 
mwc %>% 
  print(n = 128)

team_info_men %>% 
  print(n = 32)
world_cup <- rbind(wwc, mwc)
unique(world_cup$game)
world_cup$game[world_cup$game == "Third-Place Game"] <- "Third Place"
world_cup$game[world_cup$game == "First Round"] <- "Group Stage"

aa <- data.frame(x = readLines("data-raw/world_cup/2014_mens_info.txt"))

world_cup <- world_cup %>% 
  rename(team_outcome = name)
world_cup_augmented <- world_cup
save(world_cup_augmented, file = "data/world_cup_augmented.rda")

