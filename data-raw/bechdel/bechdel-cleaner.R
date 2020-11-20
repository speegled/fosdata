# Clean bechdel.csv for use in fosdata

# pick the bechdel.csv file
bfile <- file.choose() 

# Read with NA handling
bechdel <- read.csv(bfile,stringsAsFactors = TRUE,na.strings = c("#N/A"))

# Convert factors to strings
library(dplyr)
bechdel <- mutate(bechdel, imdb = as.character(imdb), title = as.character(title))

# Convert money values to num for consistency with international (too large for ints)
bechdel <- mutate(bechdel, budget = as.numeric(budget), budget_2013 = as.numeric(budget_2013),
                  domgross = as.numeric(domgross), domgross_2013 = as.numeric(domgross_2013))
