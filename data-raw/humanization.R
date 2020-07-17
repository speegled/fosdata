dd <- haven::read_sav("/Users/speegled/foundations-of-statistics/data/ingroup_outgroup/Studyone1.sav")
dd2 <- dd %>% select(Age, Gender, group, PAK_sec, PAK_primary, USsecondary, USprimary)
dd2 <- dd2[complete.cases(dd2),]
dd2$Gender <- haven::as_factor(dd2$Gender)
dd2$group <- haven::as_factor(dd2$group)
dd2 <- janitor::clean_names(dd2)
dd2 <- rename(dd2,
              us_sec = u_ssecondary,
              pak_prim = pak_primary,
              us_prim = u_sprimary)
humanization <- dd2
#save(list = c("humanization"), file = "data/humanization.rda")
