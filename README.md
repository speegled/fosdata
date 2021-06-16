
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fosdata <a href='https://github.com/speegled/fosdata'><img src='man/figures/fosdata.png' align="right" height="138.5" /></a>

<!-- badges: start -->
<!-- badges: end -->

The `fosdata` package contains datasets for the textbook [Probability,
Statistics, and Data: A Fresh Approach Using
R](https://mathstat.slu.edu/~speegle/_book/) by Darrin Speegle and Bryan
Clair.

## Installation

<!--You can install the released version of fosdata from [CRAN](https://CRAN.R-project.org) with:
``` r
install.packages("fosdata")
```
-->

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")  # if needed
remotes::install_github("speegled/fosdata")
```

## The data

The `fosdata` package contains:

| Name                | Description                                                      | Dim (RxC) |
|:--------------------|:-----------------------------------------------------------------|:----------|
| accelerometer       | Visual and accelerometer data on workouts                        | 12245x25  |
| acorns              | Acorn Size and Geographical Range                                | 39x5      |
| adipose             | BMI and Visceral Adipose Tissue Mass                             | 81x12     |
| austen              | Full text of Emma and Pride and Prejudice, by Jane Austen        | 282295x7  |
| barnacles           | Barnacle distribution on coral reefs                             | 134x8     |
| bechdel             | The Bechdel test                                                 | 1794x15   |
| bicycle\_signage    | Bicycle Signage and Safety                                       | 1824x11   |
| biomass             | Biomass of insects in German nature protection areas             | 1512x8    |
| brake               | Pedal Error Correction                                           | 80x20     |
| cern                | Social Media Engagement of Particle Physicists                   | 214x11    |
| child\_tasks        | Shape Trail Test                                                 | 68x13     |
| chimps              | Gray haired chimpanzees                                          | 165x159   |
| cigs                | Nicotine, Tar and CO of Cigarettes                               | 1294x9    |
| cigs\_small (cigs)  | Nicotine, Tar and CO of Cigarettes                               | 118x9     |
| climate             | Citations of Climate Change Papers                               | 732x19    |
| conversation        | Conversational Dominance and Psychopathy                         | 210x28    |
| covid               | New York Times COVID 19                                          | 24819x5   |
| cows                | Cooling down hot cows                                            | 798x9     |
| cows\_small         | Cooling down hot cows                                            | 19x4      |
| crit\_period        | Critical Period Hypothesis                                       | 138x3     |
| dogs                | Dogs and peer pressure                                           | 351x9     |
| draft               | The 1970 Draft Lottery                                           | 366x5     |
| ecars               | Electric vehicle charging sessions                               | 3395x17   |
| fish                | Fish measurements from Laengelmavesi Lake, near Tampere, Finland | 159x9     |
| flint               | Lead levels from tap water sampling in Flint, MI                 | 271x7     |
| frogs               | Frog measurements                                                | 64x16     |
| gender              | Gender and race data from Google Android Panel survey            | 20305x10  |
| hot\_dogs           | Hot Dog Nutrition                                                | 54x3      |
| houses              | Housing in King County                                           | 21613x21  |
| humanization        | Infrahumanization of outgroups                                   | 321x7     |
| leg\_strength       | Wii Leg Strength                                                 | 30x3      |
| leg\_strength\_full | Wii Leg Strength (full)                                          | 30x17     |
| letter\_frequency   | Letter Frequency List                                            | 84x15     |
| malaria             | Malaria Transmission and Parasites                               | 180x3     |
| masks               | Masks and Influenza Exposure                                     | 37x7      |
| mice\_pot           | Mice on pot                                                      | 46x2      |
| movies              | MovieLens 100K                                                   | 100836x6  |
| normtemp            | Temperature and heart rate data                                  | 130x3     |
| plastics            | Plastics in Snow                                                 | 237x4     |
| powerball           | Powerball draws from 2010-2020                                   | 1094x8    |
| pres\_election      | US Presidential Election Data 2000-2016                          | 50524x9   |
| rio\_instagram      | Olympians Instagram Account Data                                 | 226x14    |
| scotland\_births    | Births in Scotland                                               | 45x76     |
| scrabble            | Scrabble tile values                                             | 100x2     |
| scrabble\_ml        | Scrabble tile values                                             | 613x3     |
| seoulweather        | Weather data for Seoul                                           | 7752x25   |
| sharks              | Shark Documentary Music                                          | 616x15    |
| skull\_geometry     | Skull Geometry                                                   | 56x2      |
| snails              | Snails near Oxford, England                                      | 228x5     |
| weight\_estimate    | Weight lifting judgment in children                              | 80x7      |
| world\_cup          | FIFA World Cup 2014-2015 Results                                 | 116x8     |
| wrist               | Wrist Casts                                                      | 105x47    |

## License

Most of the data sets in this package have a creative commons license.
Providing the data in this convenient package is not meant to cancel or
to modify the existing licenses in any way. Please refer to the
references in the `man` pages for information on any individual data
set.

## Citation

    #> 
    #> To cite package 'fosdata' in publications use:
    #> 
    #>   Darrin Speegle and Bryan Clair (2021). fosdata: Data for use with the
    #>   book "Probability, Statistics, and Data: A Fresh Approach Using R",
    #>   by Darrin Speegle and Bryan Clair. R package version 0.1.0.
    #> 
    #> A BibTeX entry for LaTeX users is
    #> 
    #>   @Manual{,
    #>     title = {fosdata: Data for use with the book "Probability, Statistics, and Data: A
    #> Fresh Approach Using R", by Darrin Speegle and Bryan Clair},
    #>     author = {Darrin Speegle and Bryan Clair},
    #>     year = {2021},
    #>     note = {R package version 0.1.0},
    #>   }
    #> 
    #> ATTENTION: This citation information has been auto-generated from the
    #> package DESCRIPTION file and may need manual editing, see
    #> 'help("citation")'.

## References

**Data citations:**

It would be good to automatically generate this information from the
package.

<!---
This code gets close:
thefile <- help(chimps,package="fosdata")
parsedfile <- tools::parse_Rd(thefile$path)
Rd2latex(parsedfile)

Maybe I can adapt Rd2list on this page:
https://stackoverflow.com/questions/8918753/r-help-page-as-object

-->
