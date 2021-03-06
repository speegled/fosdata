% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fish.R
\docType{data}
\name{fish}
\alias{fish}
\title{Fish measurements from Laengelmavesi Lake, near Tampere, Finland}
\format{
A data frame with 159 observations of 8 variables
\describe{
  \item{obs}{Observation number}
  \item{species}{One of 1 = Bream, 2 = Whitefish, 3 = Roach, 4 = Parkki, 5 = Smelt, 6 = Pike or 7 = Perch}
  \item{weight}{Weight of fish (g)}
  \item{length1}{Length from nose to the beginning of the tail (cm)}
  \item{length2}{Length from nose to the notch of the tail (cm)}
  \item{length3}{Length from nose to end of tail (cm)}
  \item{height_percent}{Maximal height as percentage of length3}
  \item{width_percent}{Maximal width as percentage of length3}
  \item{sex}{1 = male, 0 = female}
}
}
\source{
"Brofeldt, Pekka: Bidrag till kaennedom on fiskbestondet i vaara sjoear. Laengelmaevesi. T.H.Jaervi: Finlands Fiskeriet  Band 4 Meddelanden utgivna av fiskerifoereningen i Finland. Helsingfors 1917

\url{http://jse.amstat.org/datasets/fishcatch.txt}
}
\usage{
fish
}
\description{
Data set for modeling weight on the other variables. Data was first presented in a publication from 1917.
}
\details{
Apparently, observation 143 had 6 roach in its stomach and may be an outlier.
}
\keyword{datasets}
