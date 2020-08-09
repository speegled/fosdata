dd <- read.csv("data-raw/mask_influenza/Table_S1.txt", sep = " ", header = FALSE)
dd <- as.data.frame(matrix(dd$V1, ncol = 7, byrow = T))
names(dd) <- dd[1,]
dd <- dd[-1,]
library(dplyr)
dd <- dd %>% mutate(across(-matches("PCR"), as.numeric))
dd$PCR_type <- factor(dd$PCR_type)
summary(dd)

wilcox.test(dd$Mask_Fine, dd$No_Mask_Fine, paired = TRUE)
t.test(log(dd$Mask_Coarse + 1), log(dd$No_Mask_Coarse + 1), paired = TRUE)

boxplot(log(dd$No_Mask_Fine+1))
masks <- dd
masks <- janitor::clean_names(masks)
save(masks, file = "data/masks.rda")
