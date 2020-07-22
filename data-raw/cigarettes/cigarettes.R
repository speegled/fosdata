cigs <- data.frame(Brand_Name = character(0),
                   properties = character(0),
                   CO = numeric(0),
                   nic = numeric(0),
                   tar = numeric(0))
for(i in 1:33) {
  a <- pdftools::pdf_ocr_text("data-raw/cigarettes/1998tarnicotinereport.pdf", pages = i)
  as <- str_remove(a, "^.*Page [0-9| ]*\n*")
  as<- str_remove(as, "^.*\n")
  as1 <- str_remove(as, "\n$")

  cigs <- rbind(cigs, data.frame(
    Brand_Name = str_split(as, "\n") %>%
      unlist() %>%
      str_extract_all("^.*Reg|^.*King|^.*100|^.*120|^.*80") %>%
      unlist(),
    properties = str_split(as1, "\n") %>%
      unlist() %>%
      str_remove_all("^.*Reg|^.*King|^.*100|^.*120|^.*80") %>%
      str_remove_all("^\\s") %>%
      str_remove_all(" [0-9.NA]*\\s*[0-9.NA]*\\s*[0-9NA.]*$") %>%
      str_remove_all("[\\—_]") %>%
      str_replace_all("  ", " "),
    CO = str_extract_all(as, "[0-9NA.]*\n") %>%
      unlist() %>%
      str_remove("\\n") %>%
      as.numeric(),
    nic = str_extract_all(as, "[0-9NA.]*\\s*[0-9NA.]*\n") %>%
      unlist() %>%
      str_remove_all("[0-9NA.]*\n$") %>%
      as.numeric(),
    tar = str_extract_all(as, "[0-9NA.]*\\s*[0-9NA.]*\\s*[0-9NA.]*\n") %>%
      unlist() %>%
      str_remove_all("\\s*[0-9NA.]*\\s*[0-9NA.]*\n$") %>%
      as.numeric()
  ))
}

cigs <- cigs %>%
  mutate(properties = paste(str_extract(Brand_Name, "[a-zA-Z0-9]*$") %>% unlist(), properties)) %>%
  mutate(Brand_Name = str_remove(Brand_Name, "[a-zA-Z0-9]*$"))

cigs <- cigs %>%
  mutate(size = str_extract(properties, "^[A-Za-z0-9]*"),
         properties = str_remove(properties, "^[A-Za-z0-9]*\\s{0,1}"))
cigs <- cigs %>%
  mutate(filter = str_extract(properties, "^[A-Za-z0-9]*"),
         properties = str_remove(properties, "^[A-Za-z0-9]*\\s{0,1}"))

cigs <- cigs %>%
  mutate(pack = str_extract(properties, "^[A-Za-z0-9]*"),
         properties = str_remove(properties, "^[A-Za-z0-9]*\\s{0,1}"))

cigs <- cigs %>%
  mutate(menthol = str_detect(properties, "Menthol"),
         properties = str_remove(properties, "\\s*Menthol\\s*"))
cigs <- rename(cigs, flavor = properties)
cigs <- cigs %>%
  mutate(menthol = ifelse(menthol, "yes", "no"))

cigs <- cigs %>%
  mutate(flavor = str_remove_all(flavor, "\\s")) %>%
  mutate_if(is.character, factor)
cigs <- janitor::clean_names(cigs)
set.seed(72220)
cigs_small <- cigs[complete.cases(cigs),]
cigs_small <- filter(cigs_small, size == "100") %>%
  group_by(brand_name) %>%
  sample_n(1)
lm(co ~ flavor + nic + tar + pack + menthol, data = cigs_small) %>% MASS::stepAIC() %>% summary
save(list = c("cigs", "cigs_small"), file = "data/cigs.rda")
summary(cigs_small)
