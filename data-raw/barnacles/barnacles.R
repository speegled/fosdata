this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

barnacles_raw <- read.csv("pone.0199462.s001.csv")
barnacles <- barnacles_raw %>%
  select(!starts_with("X")) %>%
  select(!photo) %>%
  select(!barn.presence) %>%
  rename(deep = depth., area = area.m, coral_cover = coral.cover, barnacle_density = dens.m) %>%
  select(location, site, coral_cover, depth, deep, count, area, barnacle_density)

save(barnacles, file = "barnacles.rda")
