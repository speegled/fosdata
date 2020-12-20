
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fosdata <a href='https://github.com/speegled/fosdata'><img src='man/figures/fosdata.png' align="right" height="138.5" /></a>

<!-- badges: start -->
<!-- badges: end -->

The `fosdata` package contains datasets for the textbook [Foundations of
Statistics with R](https://mathstat.slu.edu/~speegle/_book/) by Darrin
Speegle and Bryan Clair.

## Installation

<!--You can install the released version of fosdata from [CRAN](https://CRAN.R-project.org) with:
``` r
install.packages("fosdata")
```
-->

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("speegled/fosdata")
```

## The data

The `fosdata` package contains:

<table>
<thead>
<tr>
<th style="text-align:left;">
Name
</th>
<th style="text-align:left;">
Description
</th>
<th style="text-align:left;">
Dim (RxC)
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
accelerometer
</td>
<td style="text-align:left;">
Visual and accelerometer data on workouts
</td>
<td style="text-align:left;">
12245x25
</td>
</tr>
<tr>
<td style="text-align:left;">
adipose
</td>
<td style="text-align:left;">
BMI and Visceral Adipose Tissue Mass
</td>
<td style="text-align:left;">
81x12
</td>
</tr>
<tr>
<td style="text-align:left;">
austen
</td>
<td style="text-align:left;">
Full text of Emma and Pride and Prejudice, by Jane Austen
</td>
<td style="text-align:left;">
282295x7
</td>
</tr>
<tr>
<td style="text-align:left;">
barnacles
</td>
<td style="text-align:left;">
Barnacle Counts
</td>
<td style="text-align:left;">
88x4
</td>
</tr>
<tr>
<td style="text-align:left;">
bechdel
</td>
<td style="text-align:left;">
The Bechdel test
</td>
<td style="text-align:left;">
1794x15
</td>
</tr>
<tr>
<td style="text-align:left;">
bicycle\_signage
</td>
<td style="text-align:left;">
Bicycle Signage and Safety
</td>
<td style="text-align:left;">
1824x11
</td>
</tr>
<tr>
<td style="text-align:left;">
biomass
</td>
<td style="text-align:left;">
Biomass of insects in German nature protection areas
</td>
<td style="text-align:left;">
1512x8
</td>
</tr>
<tr>
<td style="text-align:left;">
brake
</td>
<td style="text-align:left;">
Pedal Error Correction
</td>
<td style="text-align:left;">
80x20
</td>
</tr>
<tr>
<td style="text-align:left;">
cern
</td>
<td style="text-align:left;">
Social Media Engagement of Particle Physicists
</td>
<td style="text-align:left;">
214x11
</td>
</tr>
<tr>
<td style="text-align:left;">
child\_tasks
</td>
<td style="text-align:left;">
Shape Trail Test
</td>
<td style="text-align:left;">
68x13
</td>
</tr>
<tr>
<td style="text-align:left;">
chimps
</td>
<td style="text-align:left;">
Gray haired chimpanzees
</td>
<td style="text-align:left;">
165x159
</td>
</tr>
<tr>
<td style="text-align:left;">
cigs
</td>
<td style="text-align:left;">
Nicotine, Tar and CO of Cigarettes
</td>
<td style="text-align:left;">
1294x9
</td>
</tr>
<tr>
<td style="text-align:left;">
cigs\_small
</td>
<td style="text-align:left;">
Nicotine, Tar and CO of Cigarettes
</td>
<td style="text-align:left;">
118x9
</td>
</tr>
<tr>
<td style="text-align:left;">
climate
</td>
<td style="text-align:left;">
Citations of Climate Change Papers
</td>
<td style="text-align:left;">
732x19
</td>
</tr>
<tr>
<td style="text-align:left;">
conversation
</td>
<td style="text-align:left;">
Conversational Dominance and Psychopathy
</td>
<td style="text-align:left;">
210x28
</td>
</tr>
<tr>
<td style="text-align:left;">
covid
</td>
<td style="text-align:left;">
New York Times COVID 19
</td>
<td style="text-align:left;">
16019x5
</td>
</tr>
<tr>
<td style="text-align:left;">
cows
</td>
<td style="text-align:left;">
Cooling down hot cows
</td>
<td style="text-align:left;">
798x9
</td>
</tr>
<tr>
<td style="text-align:left;">
cows\_small
</td>
<td style="text-align:left;">
Cooling down hot cows
</td>
<td style="text-align:left;">
19x4
</td>
</tr>
<tr>
<td style="text-align:left;">
crit\_period
</td>
<td style="text-align:left;">
Critical Period Hypothesis
</td>
<td style="text-align:left;">
138x3
</td>
</tr>
<tr>
<td style="text-align:left;">
dogs
</td>
<td style="text-align:left;">
Dogs and peer pressure
</td>
<td style="text-align:left;">
351x9
</td>
</tr>
<tr>
<td style="text-align:left;">
ecars
</td>
<td style="text-align:left;">
Electric vehicle charging sessions
</td>
<td style="text-align:left;">
3395x17
</td>
</tr>
<tr>
<td style="text-align:left;">
fish
</td>
<td style="text-align:left;">
Fish measurements from Laengelmavesi Lake, near Tampere, Finland
</td>
<td style="text-align:left;">
159x9
</td>
</tr>
<tr>
<td style="text-align:left;">
flint
</td>
<td style="text-align:left;">
Lead levels from tap water sampling in Flint, MI
</td>
<td style="text-align:left;">
271x7
</td>
</tr>
<tr>
<td style="text-align:left;">
frogs
</td>
<td style="text-align:left;">
Frog measurements
</td>
<td style="text-align:left;">
64x16
</td>
</tr>
<tr>
<td style="text-align:left;">
hot\_dogs
</td>
<td style="text-align:left;">
Hot Dog Nutrition
</td>
<td style="text-align:left;">
54x3
</td>
</tr>
<tr>
<td style="text-align:left;">
houses
</td>
<td style="text-align:left;">
Housing in King County
</td>
<td style="text-align:left;">
21613x21
</td>
</tr>
<tr>
<td style="text-align:left;">
humanization
</td>
<td style="text-align:left;">
Infrahumanization of outgroups
</td>
<td style="text-align:left;">
321x7
</td>
</tr>
<tr>
<td style="text-align:left;">
leg\_strength
</td>
<td style="text-align:left;">
Wii Leg Strength
</td>
<td style="text-align:left;">
30x3
</td>
</tr>
<tr>
<td style="text-align:left;">
leg\_strength\_full
</td>
<td style="text-align:left;">
Wii Leg Strength (full)
</td>
<td style="text-align:left;">
30x17
</td>
</tr>
<tr>
<td style="text-align:left;">
malaria
</td>
<td style="text-align:left;">
Malaria Transmission and Parasites
</td>
<td style="text-align:left;">
180x3
</td>
</tr>
<tr>
<td style="text-align:left;">
masks
</td>
<td style="text-align:left;">
Masks and Influenza Exposure
</td>
<td style="text-align:left;">
37x7
</td>
</tr>
<tr>
<td style="text-align:left;">
mice\_pot
</td>
<td style="text-align:left;">
Mice on pot
</td>
<td style="text-align:left;">
46x2
</td>
</tr>
<tr>
<td style="text-align:left;">
movies
</td>
<td style="text-align:left;">
MovieLens 100K
</td>
<td style="text-align:left;">
100836x6
</td>
</tr>
<tr>
<td style="text-align:left;">
normtemp
</td>
<td style="text-align:left;">
Temperature and heart rate data
</td>
<td style="text-align:left;">
130x3
</td>
</tr>
<tr>
<td style="text-align:left;">
plastics
</td>
<td style="text-align:left;">
Plastics in Snow
</td>
<td style="text-align:left;">
237x4
</td>
</tr>
<tr>
<td style="text-align:left;">
powerball
</td>
<td style="text-align:left;">
Powerball draws from 2010-2020
</td>
<td style="text-align:left;">
1094x8
</td>
</tr>
<tr>
<td style="text-align:left;">
pres\_election
</td>
<td style="text-align:left;">
US Presidential Election Data 2000-2016
</td>
<td style="text-align:left;">
50524x11
</td>
</tr>
<tr>
<td style="text-align:left;">
rio\_instagram
</td>
<td style="text-align:left;">
Olympians Instagram Account Data
</td>
<td style="text-align:left;">
226x14
</td>
</tr>
<tr>
<td style="text-align:left;">
sharks
</td>
<td style="text-align:left;">
Shark Documentary Music
</td>
<td style="text-align:left;">
616x13
</td>
</tr>
<tr>
<td style="text-align:left;">
skull\_geometry
</td>
<td style="text-align:left;">
Skull Geometry
</td>
<td style="text-align:left;">
56x2
</td>
</tr>
<tr>
<td style="text-align:left;">
snails
</td>
<td style="text-align:left;">
Snails near Oxford, England
</td>
<td style="text-align:left;">
228x5
</td>
</tr>
<tr>
<td style="text-align:left;">
weight\_estimate
</td>
<td style="text-align:left;">
Weight lifting judgment in children
</td>
<td style="text-align:left;">
80x7
</td>
</tr>
<tr>
<td style="text-align:left;">
wrist
</td>
<td style="text-align:left;">
Wrist Casts
</td>
<td style="text-align:left;">
105x47
</td>
</tr>
</tbody>
</table>

## Examples

You can find these and more code examples for exploring fosdata in
`vignette("examples")`.

## License

Most of the data sets in this package have a creative commons license.
Providing the data in this convenient package is not meant to cancel or
to modify the existing licenses in any way. Please refer to the
references in the `man` pages for information on any individual data
set.

## Citation

To cite the fosdata package, please use:

``` r
citation("fosdata")
#> 
#> To cite package 'fosdata' in publications use:
#> 
#>   Darrin Speegle and Bryan Clair (2020). fosdata: Data for use with the
#>   book, Foundations of Statistics with R, by Darrin Speegle and Bryan
#>   Clair. R package version 0.1.0.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {fosdata: Data for use with the book, Foundations of Statistics with R, by
#> Darrin Speegle and Bryan Clair},
#>     author = {Darrin Speegle and Bryan Clair},
#>     year = {2020},
#>     note = {R package version 0.1.0},
#>   }
#> 
#> ATTENTION: This citation information has been auto-generated from the
#> package DESCRIPTION file and may need manual editing, see
#> 'help("citation")'.
```

## References

**Data citations:**

It would be good to automatically generate this information from the
package.

<!---
This code gets close:
thefile <- help(chimps,package="fosdata")
parsedfile <- parse_Rd(thefile$path)
Rd2latex(parsedfile)

Maybe I can adapt Rd2list on this page:
https://stackoverflow.com/questions/8918753/r-help-page-as-object

-->
