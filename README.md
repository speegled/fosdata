
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fosdata <a href='https://github.com/speegled/fosdata'><img src='man/figures/fosdata.png' align="right" height="138.5" /></a>

<!-- badges: start -->
<!-- badges: end -->

The `fosdata` package contains datasets for the textbook [Probability,
Statistics, and Data: A Fresh Approach Using
R]([https://mathstat.slu.edu/~speegle/_book/](https://probstatsdata.com/) by Darrin Speegle and Bryan
Clair.

## Installation

<!--You can install the released version of fosdata from [CRAN](https://CRAN.R-project.org) with:
``` r
install.packages("fosdata")
```
-->

Install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")  # if needed
remotes::install_github("speegled/fosdata")
```

## Package Contents

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
| covid               | New York Times COVID 19                                          | 30814x5   |
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

To cite package `fosdata` in publications, use:

Darrin Speegle and Bryan Clair (2021). fosdata: Data for use with the
book “Probability, Statistics, and Data: A Fresh Approach Using R”, by
Darrin Speegle and Bryan Clair. R package version 0.2.0.

A BibTeX entry for LaTeX users is:

    @Manual{,
      title = {fosdata: Data for use with the book "Probability, Statistics, and Data: A
    Fresh Approach Using R", by Darrin Speegle and Bryan Clair},
      author = {Darrin Speegle and Bryan Clair},
      year = {2021},
      note = {R package version 0.2.0},
    }

## References

#### accelerometer

<https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0235156>

<https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/R3ZKYH>

#### acorns

Aizen, Marcelo & Patterson III, William. (1990). Acorn Size and
Geographical Range in the North American Oaks (Quercus L.). Journal of
Biogeography. 17. 327. 10.2307/2845128.
<https://www.jstor.org/stable/2845128>

#### adipose

Swainson MG, Batterham AM, Tsakirides C, Rutherford ZH, Hind K (2017)
Prediction of whole-body fat percentage and visceral adipose tissue mass
from five anthropometric variables. PLoS ONE 12(5): e0177175.
<https://doi.org/10.1371/journal.pone.0177175>

#### austen

<https://www.gutenberg.org/files/158/158-0.txt> and
<https://www.gutenberg.org/files/1342/1342-0.txt>

#### barnacles

Maher RL, Johnston MA, Brandt ME, Smith TB, Correa AMS (2018) Depth and
coral cover drive the distribution of a coral macroborer across two reef
systems. PLoS ONE 13(6): e0199462.
<https://doi.org/10.1371/journal.pone.0199462>

#### bechdel

“The Dollar-And-Cents Case Against Hollywood’s Exclusion of Women”, Walt
Hickey, FiveThirtyEight, April 1, 2014.

<https://github.com/fivethirtyeight/data/tree/master/bechdel>

#### bicycle\_signage

Hess G, Peterson MN (2015) “Bicycles May Use Full Lane” Signage
Communicates U.S. Roadway Rules and Increases Perception of Safety. PLoS
ONE 10(8): e0136973. <https://doi.org/10.1371/journal.pone.0136973>

#### biomass

Hallmann CA, Sorg M, Jongejans E, Siepel H, Hofland N, Schwan H, et
al. (2017) More than 75 percent decline over 27 years in total flying
insect biomass in protected areas. PLoS ONE 12(10): e0185809
<https://doi.org/10.1371/journal.pone.0185809>

#### brake

Hasegawa K, Kimura M, Takeda Y (2020) Age-related differences in
correction behavior for unintended acceleration. PLoS ONE 15(7):
e0236053.

<https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0236053>

<https://osf.io/mre6y/?view_only=5af130ecc3234435b7a7ffc1ba6c391f>

#### cern

Kahle K, Sharon AJ, Baram-Tsabari A (2016) Footprints of Fascination:
Digital Traces of Public Engagement with Particle Physics on CERN’s
Social Media Platforms. PLoS ONE 11(5): e0156409.
<https://doi.org/10.1371/journal.pone.0156409>

#### child\_tasks

Chan AYC, Morgan S-J (2018) Assessing children’s cognitive flexibility
with the Shape Trail Test. PLoS ONE 13(5): e0198254.

<https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0198254>

#### chimps

Tapanes E, Anestis S, Kamilar JM, Bradley BJ (2020) Does facial hair
greying in chimpanzees provide a salient progressive cue of aging? PLoS
ONE 15(7): e0235610. <https://doi.org/10.1371/journal.pone.0235610>

<https://datadryad.org/stash/dataset/doi:10.5061/dryad.f7m0cfxs7>

#### cigs

‘“Tar,” nicotine, and carbon monoxide of the smoke of 1294 varieties of
domestic cigarettes for the year 1998. Federal Trade Commission report,
2000.’

<https://www.ftc.gov/sites/default/files/documents/reports/2000-report-tar-nicotine-and-carbon-monoxide-covering-1998/1998tarnicotinereport_0.pdf>

#### climate

Hillier A, Kelly RP, Klinger T (2016) Narrative Style Influences
Citation Frequency in Climate Change Science. PLoS ONE 11(12): e0167983.
<https://doi.org/10.1371/journal.pone.0167983>

#### conversation

Manson JH, Gervais MM, Fessler DMT, Kline MA (2014) Subclinical Primary
Psychopathy, but Not Physical Formidability or Attractiveness, Predicts
Conversational Dominance in a Zero-Acquaintance Situation. PLoS ONE
9(11): e113135.

Gervais Matthew M., Kline Michelle, Ludmer Mara, George Rachel and
Manson Joseph H. 2013The strategy of psychopathy: primary psychopathic
traits predict defection on low-value relationshipsProc. R. Soc.
B.28020122773

<https://escholarship.org/uc/item/2bx584t4>

<https://datadryad.org/stash/dataset/doi:10.5061/dryad.848cc>

#### covid

<https://github.com/nytimes/covid-19-data>

#### cows

Tucker, Cassandra B., Schütz, Karin E., & Van Os (Chen), Jennifer M.
(2020). Data from: Cooling cows efficiently with sprinklers:
physiological responses to water spray \[Data set\].

<https://zenodo.org/record/3862181#.XwTRNpNKjEa>

#### cows\_small

Tucker, Cassandra B., Schütz, Karin E., & Van Os (Chen), Jennifer M.
(2020). Data from: Cooling cows efficiently with sprinklers:
physiological responses to water spray \[Data set\].

<https://zenodo.org/record/3862181#.XwTRNpNKjEa>

#### crit\_period

Vanhove J (2013) The Critical Period Hypothesis in Second Language
Acquisition: A Statistical Critique and a Reanalysis. PLoS ONE 8(7):
e69172.

<https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0069172>

#### dogs

“Germar M, Sultan A, Kaminski J, Mojzisch A (2018) Dogs (Canis
familiaris) stick to what they have learned rather than conform to their
conspecifics’ behavior. PLoS ONE 13(3): e0194808.”

<https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0194808>

“Germar, Markus, and Andreas Mojzisch. 2018. “Dogs (Canis Familiaris)
Stick to What They Have Learned rather than Conform to Their
Conspecifics’ Behavior.” OSF. April 4. osf.io/dgtxt."

#### draft

United States Government Selective Service System.
<https://www.sss.gov/history-and-records/vietnam-lotteries/>

#### ecars

Asensio, Omar Isaac; Apablaza, Camila Z; Lawson, M. Cade; Walsh, Sarah
Elizabeth, 2020, “Replication Data for: A Field Experiment on Workplace
Norms and Electric Vehicle Charging Etiquette”

<https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/NFPQLW>

#### fish

"Brofeldt, Pekka: Bidrag till kaennedom on fiskbestondet i vaara sjoear.
Laengelmaevesi. T.H.Jaervi: Finlands Fiskeriet Band 4 Meddelanden
utgivna av fiskerifoereningen i Finland. Helsingfors 1917

<http://jse.amstat.org/datasets/fishcatch.txt>

#### flint

FlintWaterStudy.org (2015) “Lead Results from Tap Water Sampling in
Flint, MI during the Flint Water Crisis”

<http://flintwaterstudy.org/2015/12/complete-dataset-lead-results-in-tap-water-for-271-flint-samples/>

#### frogs

Howlader MSA, Nair A, Merilä J (2016) A New Species of Frog (Anura:
Dicroglossidae) Discovered from the Mega City of Dhaka. PLoS ONE 11(3):
e0149597

<https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0149597>

#### gender

Sell R, Goldberg S, Conron K (2015) The Utility of an Online Convenience
Panel for Reaching Rare and Dispersed Populations. PLOS ONE 10(12):
e0144011.

<https://doi.org/10.1371/journal.pone.0144011>

#### hot\_dogs

Moore, David S., and George P. McCabe (1989). Introduction to the
Practice of Statistics. Original source: Consumer Reports, June 1986,
pp. 366-367.

<http://wiki.stat.ucla.edu/socr/index.php/SOCR_012708_ID_Data_HotDogs>

#### houses

<https://www.kaggle.com/harlfoxem/housesalesprediction>

#### humanization

Davies T, Yogeeswaran K, Verkuyten M, Loughnan S (2018) From
humanitarian aid to humanization: When outgroup, but not ingroup,
helping increases humanization. PLoS ONE 13(11): e0207343

Davies, Thomas J. “Humanitarian Helping.” OSF, 25 Oct. 2018. Web.

<https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0207343>

#### leg\_strength

Gronbech Jorgensen M, Andersen S, Ryg J, Masud T (2015) Novel Use of the
Nintendo Wii Board for Measuring Isometric Lower Limb Strength: A
Reproducible and Valid Method in Older Adults. PLoS ONE 10(10):
e0138660.

<https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0138660>

#### leg\_strength\_full

Gronbech Jorgensen M, Andersen S, Ryg J, Masud T (2015) Novel Use of the
Nintendo Wii Board for Measuring Isometric Lower Limb Strength: A
Reproducible and Valid Method in Older Adults. PLoS ONE 10(10):
e0138660.

<https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0138660>

#### letter\_frequency

<https://en.wikipedia.org/wiki/Letter_frequency> on January 9, 2020

#### malaria

Churcher TS, Sinden RE, Edwards NJ, Poulton ID, Rampling TW, Brock PM,
et al. (2017) Probability of Transmission of Malaria from Mosquito to
Human Is Regulated by Mosquito Parasite Density in Naïve and Vaccinated
Hosts. PLoS Pathog 13(1): e1006108.
<https://doi.org/10.1371/journal.ppat.1006108>

#### masks

Milton DK, Fabian MP, Cowling BJ, Grantham ML, McDevitt JJ (2013)
Influenza Virus Aerosols in Human Exhaled Breath: Particle Size,
Culturability, and Effect of Surgical Masks. PLoS Pathog 9(3): e1003205.
<https://doi.org/10.1371/journal.ppat.1003205>

#### mice\_pot

Viñals X, Moreno E, Lanfumey L, Cordomí A, Pastor A, de La Torre R, et
al. (2015) Cognitive Impairment Induced by Delta9-tetrahydrocannabinol
Occurs through Heteromers between Cannabinoid CB1 and Serotonin 5-HT2A
Receptors. PLoS Biol 13(7): e1002194.
<https://doi.org/10.1371/journal.pbio.1002194>

#### movies

F. Maxwell Harper and Joseph A. Konstan. 2015. The MovieLens Datasets:
History and Context. ACM Transactions on Interactive Intelligent Systems
(TiiS) 5, 4: 19:1–19:19. <https://doi.org/10.1145/2827872>

#### normtemp

“Datasets and Stories” article “What’s Normal? – Temperature, Gender,
and Heart Rate” in the Journal of Statistics Education (Shoemaker 1996).

<http://jse.amstat.org/datasets/normtemp.dat.txt>

<http://jse.amstat.org/v4n2/datasets.shoemaker.html>

Mackowiak, Wasserman, and Levine, “A Critical Appraisal of 98.6 Degrees
F, the Upper Limit of the Normal Body Temperature, and Other Legacies of
Carl Reinhold August Wunderlich”, JAMA 1992.

#### plastics

Bergmann M, Mützel S, Primpke S, Tekman MB, Trachsel J, Gerdts G. White
and wonderful? Microplastics prevail in snow from the Alps to the
Arctic. Sci Adv. 2019 Aug 14;5(8).doi: 10.1126/sciadv.aax1157. PMID:
31453336; PMCID: PMC6693909.

<https://advances.sciencemag.org/content/5/8/eaax1157>

#### powerball

data.gov,
<https://catalog.data.gov/dataset/lottery-powerball-winning-numbers-beginning-2010>

#### pres\_election

MIT Election Data and Science Lab, 2018, “County Presidential Election
Returns 2000-2016”, <https://doi.org/10.7910/DVN/VOQCHQ>, Harvard
Dataverse, V6, UNF:6:ZZe1xuZ5H2l4NUiSRcRf8Q== \[fileUNF\]

#### rio\_instagram

Amirhosein Bodaghi. (2019). Instagram Characteristics of Olympic gold
medalists (Rio2016) \[Data set\]. Zenodo.

<http://doi.org/10.5281/zenodo.3469514>

#### scotland\_births

National Records of Scotland,
<https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/vital-events/births/births-time-series-data>

#### scrabble

<https://en.wikipedia.org/wiki/Scrabble_letter_distributions>

#### scrabble\_ml

<https://en.wikipedia.org/wiki/Scrabble_letter_distributions>

#### seoulweather

‘Cho, D., Yoo, C., Im, J., & Cha, D. (2020). Comparative assessment of
various machine learning-based bias correction methods for numerical
weather prediction model forecasts of extreme air temperatures in urban
areas. Earth and Space Science.’

<https://archive.ics.uci.edu/ml/datasets/Bias+correction+of+numerical+prediction+model+temperature+forecast>

#### sharks

Nosal AP, Keenan EA, Hastings PA, Gneezy A (2016) The Effect of
Background Music in Shark Documentaries on Viewers’ Perceptions of
Sharks. PLoS ONE 11(8): e0159279.
<https://doi.org/10.1371/journal.pone.0159279>

#### skull\_geometry

Li, Zhigang et al. (2016), Data from: A statistical skull geometry model
for children 0-3 years old, Dryad, Dataset,
<https://doi.org/10.5061/dryad.p4p62>

<https://datadryad.org/stash/dataset/doi:10.5061/dryad.p4p62>

<https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0127322>

#### snails

Cain, A., Sheppard, P. Selection in the polymorphic land snail Cepæa
nemoralis. Heredity 4, 275–294 (1950). Data is from Table 6.
<https://doi.org/10.1038/hdy.1950.22>

#### weight\_estimate

Sciutti A, Patanè L, Sandini G (2019) Development of visual perception
of others’ actions: Children’s judgment of lifted weight. PLoS ONE
14(11): e0224979

<https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0224979>

Sciutti Alessandra, Patane’ Laura, & Sandini Giulio. (2019). Dataset -
weight lifting judgment in children \[Data set\]. Zenodo.
<http://doi.org/10.5281/zenodo.3524881>

#### world\_cup

<https://abcnews.go.com/Sports/2014-fifa-world-cup-tv-schedule-results/story?id=23748377>
and
<https://abcnews.go.com/Sports/2015-fifa-womens-world-cup-complete-tournament-results/story?id=31204768>

#### wrist

Raittio L, Launonen AP, Hevonkorpi T, Luokkala T, Kukkonen J, Reito A,
et al. (2020) Two casting methods compared in patients with Colles’
fracture: A pragmatic, randomized controlled trial. PLoS ONE 15(5):
e0232153.

<https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0232153>
