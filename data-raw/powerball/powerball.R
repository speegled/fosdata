setwd(dirname(parent.frame(2)$ofile))
powerball_raw <- read.csv("Lottery_Powerball_Winning_Numbers__Beginning_2010.csv")
powerball <- powerball_raw %>%
  separate(Winning.Numbers,into=paste("Ball",1:6,sep=""), sep=" ", convert=TRUE) %>%
  mutate(Draw.Date = as.Date(Draw.Date, "%m/%d/%Y"))
# save(powerball, file="powerball.rda")

powerball_long <- powerball %>% pivot_longer(names_to = "Ball", values_to = "Number", cols = 2:7)

# plot draws across time.
# Note Ball1-Ball5 are sorted, Ball6 is from a different pool, and
# there were format changes in January 15, 2012 and October 4, 2015.
powerball_long %>% ggplot(aes(x=Draw.Date, y=Number, color=Ball)) + geom_point()

# Get the distribution of white balls since the last format change
white_balls <- powerball_long %>% filter(Draw.Date > "2015-10-04" & Ball != "Ball6") %>% pull(Number)

# It's uniform!
plot(table(white_balls))
chisq.test(table(white_balls))
