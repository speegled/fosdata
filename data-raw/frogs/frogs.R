tt <- pdftools::pdf_ocr_text("data-raw/frogs/frogs.pdf")
library(tidyverse)
tt <- str_remove(tt, "[a-z A-Z.\\n\\s\\)\\(\\)\\,0-9]+Table.\\n\\nMuseum ")
vv <- str_replace_all(tt, "\\/", "7") %>% str_replace_all("D ", "D") %>% str_remove("\\n$") %>%
  str_replace_all("\\n\\n", "\n") %>% str_remove_all("= ") %>%
  str_replace("IODFAL", "IOD FAL") %>% str_replace_all(" M", "M") %>%
  str_replace("SLMBE", "SLM BE") %>%
  str_split(pattern = " |\\n") %>% unlist()
vv <- vv[-645]

vv <- matrix(vv, ncol = 15, byrow = T)
vv[,1] <- str_replace_all(vv[,1], "MZD7", "MZD/")
dd <- as.data.frame(vv)
names(dd) <- dd[1,]
dd <- dd[-1,]
dd <- janitor::clean_names(dd)
dd$svl[37] <- "44"
dd$fol <- str_remove(dd$fol, "\\.$")
dd <- mutate(dd, across(-accession, as.numeric))
dd$species <- NA
dd$species[1:11] <- "nepalensis"
dd$species[12:16] <- "pierrei"
dd$species[17:25] <- "syhadrensis"
dd$species[26:46] <- "teraiensis"
dd$species[47:52] <- "asmati"
dd$species[53:64] <- "dhaka"
frogs <- dd
#save(list = c("frogs"), file = "data/frogs.rda")
