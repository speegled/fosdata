# source file is
pefile <- "countypres_2000-2016.RData"
# from https://dataverse.harvard.edu/file.xhtml?persistentId=doi:10.7910/DVN/VOQCHQ/HEIJCQ

# Set directory to match this script
setwd(dirname(parent.frame(2)$ofile))

# Load original data. It loads as variable 'x'.  Nice work, MIT election lab!
load(pefile)

# remove the ridiculous attributes
pres_election <- data.frame(lapply(x, function(x) { attributes(x) <- NULL; x }))

# No need for office - it's all president
pres_election$office <- NULL

# Drop the version variable, just store it as an attribute
attributes(pres_election)$version <- pres_election$version[1]
pres_election$version <- NULL

# Replace "NA" with actual NA in the party variable
is.na(pres_election$party) <- pres_election$party == "NA"

# Save the results
save(pres_election, file="pres_election.rda")