% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cigarettes.R
\docType{data}
\name{cigs_small}
\alias{cigs_small}
\title{Nicotine, Tar and CO of Cigarettes}
\format{
A data frame with 118 observations of 9 variables.
\describe{
  \item{brand_name}{Brand name of the cigarette Each brand name is unique.}
  \item{flavor}{Information about the cigarette that came after the brand name, such as Ultra or LtSlim}
  \item{co}{Carbon monoxide content, in mg, rounded to nearest mg}
  \item{nic}{Nicotine content, in mg, rounded to nearest .1}
  \item{tar}{Amount of tar, in mg, rounded to nearest mg}
  \item{size}{All sizes are equal to 100}
  \item{filter}{All filters are equal to F}
  \item{pack}{Factor with levels HP = hard pack, SP = soft pack}
  \item{menthol}{Factor with levels no = not menthol, and yes = menthol.}
}
}
\source{
'"Tar," nicotine, and carbon monoxide of the smoke of 1294 varieties of domestic cigarettes for the year 1998.  Federal Trade Commission report, 2000.'

\url{https://www.ftc.gov/sites/default/files/documents/reports/2000-report-tar-nicotine-and-carbon-monoxide-covering-1998/1998tarnicotinereport_0.pdf}
}
\usage{
cigs_small
}
\description{
In 2000, the Federal Trade Commission tested cigarettes to determine the amount of nicotine, tar and carbom monoxide in them. This
data set also contains the other information that the FTC collected at that time. This data set is randomly selected from
the full data set `cigs` by filtering on size == 100 and sampling one of each brand.
}
\details{
From the authors: "This report contains data on the "tar," nicotine, and carbon monoxide yields of 1294 varieties of cigarettes manufactured and sold in the United States in 1998."
}
\keyword{datasets}
