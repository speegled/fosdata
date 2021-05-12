library(dplyr)

# load and clean data
dd <- read.csv("data-raw/masks/Table_S1.txt", sep = " ", header = FALSE)
dd <- as.data.frame(matrix(dd$V1, ncol = 7, byrow = T))
names(dd) <- dd[1,]
dd <- dd[-1,]
dd <- dd %>% mutate(across(-matches("PCR"), as.numeric))
dd$PCR_type <- factor(dd$PCR_type)

masks <- dd
masks <- janitor::clean_names(masks)

# save(masks, file = "data/masks.rda")

# examples
summary(masks)
boxplot(log(masks$no_mask_fine+1), log(masks$mask_fine+1))

wilcox.test(masks$mask_fine, masks$no_mask_fine, paired = TRUE)
t.test(log(masks$mask_fine + 1), log(masks$no_mask_fine + 1), paired = TRUE)

# reproduce analysis from the paper
fine_tab <- with(masks, table(mask_fine > 0, no_mask_fine > 0))
coarse_tab <- with(masks, table(mask_coarse > 0, no_mask_coarse > 0))
both_tab <- with(masks, table(mask_fine + mask_coarse > 0, no_mask_fine + no_mask_coarse > 0))

fine_tab
coarse_tab
both_tab

mcnemar.test(fine_tab, correct=FALSE)
mcnemar.test(coarse_tab, correct=FALSE)
mcnemar.test(both_tab, correct=FALSE)

# these are the same as prop.test with the off-diagonal table entries
prop.test(6,  7,  p=0.5, correct=FALSE) # p = 0.05878
prop.test(14, 16, p=0.5, correct=FALSE) # p = 0.0027
prop.test(6,  6,  p=0.5, correct=FALSE) # p = 0.01431

# Using binom.test is quite different
binom.test(6,  7,  p=0.5)  # p = 0.125
binom.test(14, 16, p=0.5)  # p = 0.004181
binom.test(6 , 6,  p=0.5)  # p = 0.03125
