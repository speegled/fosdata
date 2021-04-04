load("data-raw/county_pres/countypres_2000_2016.rda")
x <- as.data.frame(x)

attr(x$year, "comment") <- NULL
attr(x$state, "comment") <- NULL
attr(x$state_po, "comment") <- NULL
attr(x$county, "comment") <- NULL
attr(x$FIPS, "comment") <- NULL
attr(x$office, "comment") <- NULL
attr(x$candidate, "comment") <- NULL
attr(x$totalvotes, "comment") <- NULL
attr(x$candidatevotes, "comment") <- NULL
attr(x$version, "comment") <- NULL
attr(x$party, "comment") <- NULL

x$state <- as.character(x$state)
x$state_po <- as.character(x$state_po)
x$county <- as.character(x$county)
x$office <- as.character(x$office)
x$candidate <- as.character(x$candidate)
x$party <- as.character(x$party)

attr(x, "Rsafe2raw") <- NULL
attr(x, "var.type") <- NULL
attr(x, "var.labels") <- NULL
attr(x, "val.table") <- NULL
attr(x, "missval.table") <- NULL
attr(x, "val.list") <- NULL
attr(x, "missval.list") <- NULL
attr(x, "orig.names") <- NULL

pres_election <- x
save(pres_election, file = "data/pres_election.rda")
