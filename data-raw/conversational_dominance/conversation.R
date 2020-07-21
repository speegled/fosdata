dd <- readxl::read_xlsx("data-raw/conversational_dominance/Manson_et_al_Conv_Dominance_Dataset.xlsx")
dd <- janitor::clean_names(dd)
dd <- dd %>% select(-triad,-dyad,
                    - dyad_split, -individual_split, -shirt1, -shirt_type,
                    -triad_total_words_per_min
                    #,-proportion_sequence_starts,
                    #-interruptions_per_min,
                    #-sequence_starts_per_word_x100,
                    #-interruptions_per_word_x100
)
mod <- mice::mice(dd[,-(1:2)], m = 1, method = "pmm") #imputing values for median_income just so it works better in the chapter
dd2 <- mice::complete(mod)
dd2$indiv_1 <- dd$indiv_1
dd2$indiv_2 <- dd$indiv_2
conversation <- dd2

dd <- read.csv("data-raw/conversational_dominance/GervaisEtAl_TheStrategyOfPsychopathy_ArchivedData.txt", sep = "\t")
dd <- janitor::clean_names(dd)

dd <- select(dd, !matches("dyad|triad|ethni|source|split|style|cubicle|common|gameplay"))
conversation <- left_join(conversation, dd)
save(list = c("conversation"), file = "data/conversation.rda")
