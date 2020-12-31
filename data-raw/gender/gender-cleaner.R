this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

library(dplyr)
library(tidyr)
tfile <- "transgender-data.csv"
gender <- read.csv(tfile, stringsAsFactors = TRUE, na.strings = "")
gender <- select(gender, -Question..1.Answer)
gender <- rename(gender, sex_at_birth = Question..3.Answer, hispanic = Question..4.Answer)
gender <- gender %>% unite("race",starts_with("Question..5"), sep = ",", remove = TRUE, na.rm = TRUE)
gender <- gender %>% mutate(hispanic = factor(hispanic), sex_at_birth = factor(sex_at_birth))
gender <- rename(gender,
                 gender_male = Question..2.Answer.1..Male,
                 gender_female = Question..2.Answer.2..Female,
                 gender_trans = Question..2.Answer.3..Transgender,
                 gender_queer = Question..2.Answer.4..Genderqueer.Gender.non.conforming,
                 gender_not_sure = Question..2.Answer.5..I.am.not.sure.of.my.gender.identity,
                 gender_unclear = Question..2.Answer.6..I.do.not.know.what.this.question.is.asking,
                 gender_na = Question..2.Answer..None.of.the.above)
# convert gender variables to logical TRUE/FALSE
gender <- mutate(gender, across(starts_with("gender"), ~!is.na(.x)))

save(gender, file = "../../data/gender.rda")
