https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0198254

One good thing to do is length of time to finish test versus age. Looks pretty linear to me.

dd <- readxl::read_xlsx("/Users/speegled/Downloads/6398801/pone.0198254.s002.xlsx", 
                        sheet = 1)
dd <- janitor::clean_names(dd)
dd
filter(dd)
ggplot(dd, aes(x = age_in_months, stt_cv_trail_b_secs)) +
  geom_point() +
  geom_smooth(method = "lm")

lm(stt_cv_trail_b_secs ~ age_in_months, data = dd) %>% plot


