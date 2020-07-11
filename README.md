
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ennet: Utilities to Extract Text Data From en-net <img src="man/figures/ennet.png" width="200px" align="right" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![R build
status](https://github.com/katilingban/ennet/workflows/R-CMD-check/badge.svg)](https://github.com/katilingban/ennet/actions)
[![R build
status](https://github.com/katilingban/ennet/workflows/test-coverage/badge.svg)](https://github.com/katilingban/ennet/actions)
[![Codecov test
coverage](https://codecov.io/gh/katilingban/ennet/branch/master/graph/badge.svg)](https://codecov.io/gh/katilingban/ennet?branch=master)
[![CodeFactor](https://www.codefactor.io/repository/github/katilingban/ennet/badge)](https://www.codefactor.io/repository/github/katilingban/ennet)
<!-- badges: end -->

[en-net](https://www.en-net.org) is the go to online forum for field
practitioners requiring prompt technical advice for operational
challenges for which answers are not readily accessible in current
guidelines. The questions and the corresponding answers raised within
en-net can provide insight into what the key topics of discussion are
within the nutrition sector. This package provides utility functions for
the extraction, processing and analysis of text data from the online
forum.

## Installation

`ennet` is in active development and is not yet available from
[CRAN](https://CRAN.R-project.org).

<!---
You can install the released version of rennet from [CRAN](https://CRAN.R-project.org) with:

```r
install.packages("rennet")
```
--->

You can install the development version from
[GitHub](https://github.com/) with:

``` r
if(!require(remotes) install.packages("remotes"))
remotes::install_github("katilingban/ennet")
```

## Usage

`ennet` package provides a set of functions that extracts information
from the [**en-net** online forum](https://www.en-net.org). This set of
functions was built on top of the [`rvest`](https://rvest.tidyverse.org)
package which provides robust and performant web scraping functions and
the [`dplyr`](https://dplyr.tidyverse.org) package which provides a full
suite of data manipulation functions. The `ennet` package was designed
to be able to interact with how the **en-net** online forum has been
structured.

### en-net website structure

The **en-net** online forum website has a very clear and clean
structure. The opening page is a list of **thematic areas** which are
linked to each of their respective webpages. In each of these **thematic
area** webpages is another list, this time a list of **topics** raised
within the **thematic area**. These **topics** are the text that an
online user provides as the title for the question she/he is going to
ask. Each of the **topics** are then again linked to their respective
webpages that show the actual full question raised and the ensuing
responses and **discussion** stemming from that question.

### Getting list of thematic areas

To get a list of thematic areas along with the link to the webpage of
each thematic area, we use the `get_themes()` function as follows:

    #> # A tibble: 19 x 2
    #>    themes                                           links                       
    #>    <chr>                                            <chr>                       
    #>  1 Announcements & Nutritionists needed             https://www.en-net.org/foru…
    #>  2 Assessment and Surveillance                      https://www.en-net.org/foru…
    #>  3 COVID-19 and nutrition programming               https://www.en-net.org/foru…
    #>  4 Coverage assessment                              https://www.en-net.org/foru…
    #>  5 Cross-cutting issues                             https://www.en-net.org/foru…
    #>  6 Food assistance                                  https://www.en-net.org/foru…
    #>  7 Infant and young child feeding interventions     https://www.en-net.org/foru…
    #>  8 Management of At Risk Mothers and Infants        https://www.en-net.org/foru…
    #>  9 Micronutrients                                   https://www.en-net.org/foru…
    #> 10 Partnerships for research                        https://www.en-net.org/foru…
    #> 11 Prevention and treatment of moderate acute maln… https://www.en-net.org/foru…
    #> 12 Prevention and treatment of severe acute malnut… https://www.en-net.org/foru…
    #> 13 Prevention and management of stunting            https://www.en-net.org/foru…
    #> 14 Scaling Up Nutrition (SUN)                       https://www.en-net.org/foru…
    #> 15 Upcoming trainings                               https://www.en-net.org/foru…
    #> 16 Other thematic area                              https://www.en-net.org/foru…
    #> 17 Multi-sector nutrition programming               https://www.en-net.org/foru…
    #> 18 Adolescent nutrition                             https://www.en-net.org/foru…
    #> 19 Simplified Approaches for the Management of Acu… https://www.en-net.org/foru…

This will be useful when choosing which themes to focus on when
extracting information. This function outputs an object of the
appropriate class and structure as the required input for the
`get_themes_topics()` function which would lend to piped operations
between the two functions (see below).

### Getting list of topics from thematic area/s

To get a list of topics for a particular theme, we use the
`get_theme_topics()` function as follows:

``` r
## Load dplyr to facilitate data manipulation
library(dplyr)

## Extract data from "Coverage assessment" theme
get_themes() %>%
  filter(themes == "Coverage assessment") %>%
  select(links) %>%
  as.character() %>%
  get_theme_topics()
#> # A tibble: 93 x 7
#>    Theme     Topic                  Views Replies Author   Posted  Link         
#>    <chr>     <chr>                  <chr>   <int> <chr>    <chr>   <chr>        
#>  1 Coverage… Resources for coverag… 7,379      11 Tamsin … 6 Dec … https://www.…
#>  2 Coverage… Use of single coverag… 1,100       7 Hugh Lo… 10 Nov… https://www.…
#>  3 Coverage… Real and theoretical … 849         3 Abdul    10 Oct… https://www.…
#>  4 Coverage… Single Coverage for M… 1,069       4 Ben All… 5 Jul … https://www.…
#>  5 Coverage… Cox's Bazar Refugee S… 1,307       4 Hugh Lo… 28 Mar… https://www.…
#>  6 Coverage… Wide Area Survey (Sta… 1,039       2 Anonymo… 9 Mar … https://www.…
#>  7 Coverage… Disconnection between… 1,041       2 Tammam … 3 Mar … https://www.…
#>  8 Coverage… Can we classify the p… 1,213       2 Anonymo… 18 Nov… https://www.…
#>  9 Coverage… Routine monitoring da… 1,134       0 Anonymo… 14 Nov… https://www.…
#> 10 Coverage… SQUEAC/coverage surve… 1,476       1 Anonymo… 5 Oct … https://www.…
#> # … with 83 more rows
```

To get a list of topics for multiple themes, we use the
`get_themes_topics()` function as follows:

``` r
## Extract data from "Coverage assessment" theme and "Food assistance" theme
get_themes() %>%
  filter(themes %in% c("Coverage assessment", "Food assistance")) %>%
  get_themes_topics()
#> # A tibble: 123 x 7
#>    Theme     Topic                  Views Replies Author   Posted  Link         
#>    <chr>     <chr>                  <chr>   <int> <chr>    <chr>   <chr>        
#>  1 Coverage… Resources for coverag… 7,379      11 Tamsin … 6 Dec … https://www.…
#>  2 Coverage… Use of single coverag… 1,100       7 Hugh Lo… 10 Nov… https://www.…
#>  3 Coverage… Real and theoretical … 849         3 Abdul    10 Oct… https://www.…
#>  4 Coverage… Single Coverage for M… 1,069       4 Ben All… 5 Jul … https://www.…
#>  5 Coverage… Cox's Bazar Refugee S… 1,307       4 Hugh Lo… 28 Mar… https://www.…
#>  6 Coverage… Wide Area Survey (Sta… 1,039       2 Anonymo… 9 Mar … https://www.…
#>  7 Coverage… Disconnection between… 1,041       2 Tammam … 3 Mar … https://www.…
#>  8 Coverage… Can we classify the p… 1,213       2 Anonymo… 18 Nov… https://www.…
#>  9 Coverage… Routine monitoring da… 1,134       0 Anonymo… 14 Nov… https://www.…
#> 10 Coverage… SQUEAC/coverage surve… 1,476       1 Anonymo… 5 Oct … https://www.…
#> # … with 113 more rows
```

### Getting discussions from topic/s

To get a list of discussions for a particular topic, we use the
`get_topic_discussions()` function as follows:

``` r
get_themes() %>%
  filter(themes == "Coverage assessment") %>%
  get_themes_topics() %>%
  filter(Topic == "Resources for coverage assessment") %>%
  select(Link) %>%
  as.character() %>%
  get_topic_discussions()
#> # A tibble: 12 x 10
#>    theme  topic   user    userCode job     role  date_time type  code  post     
#>    <chr>  <chr>   <chr>   <chr>    <chr>   <chr> <chr>     <chr> <chr> <chr>    
#>  1 Cover… Resour… Tamsin… user24   "en-ne… Foru… 6 Dec 20… ques… 574   "Dear al…
#>  2 Cover… Resour… Mark M… user31   "Consu… Freq… 6 Dec 20… answ… 1536  "And her…
#>  3 Cover… Resour… Ernest… user999  ""      Tech… 22 Dec 2… answ… 1603  "Worksho…
#>  4 Cover… Resour… Saul G… user1000 "Direc… Tech… 11 Jan 2… answ… 1664  "And her…
#>  5 Cover… Resour… Mark M… user31   "Consu… Freq… 1 May 20… answ… 2076  "Just a …
#>  6 Cover… Resour… Ernest… user999  ""      Tech… 26 May 2… answ… 2180  "We are …
#>  7 Cover… Resour… Ernest… user999  ""      Tech… 5 Jul 20… answ… 2278  "Dear Co…
#>  8 Cover… Resour… Mark M… user31   "Consu… Freq… 17 Sep 2… answ… 2442  "Updated…
#>  9 Cover… Resour… Mark M… user31   "Consu… Freq… 1 Nov 20… answ… 2615  "And her…
#> 10 Cover… Resour… Mark M… user31   "Consu… Freq… 30 Apr 2… answ… 3288  "The Cov…
#> 11 Cover… Resour… Mark M… user31   "Consu… Freq… 5 Sep 20… answ… 3445  "Here is…
#> 12 Cover… Resour… Alexan… user107… "Head … Norm… 11 Jun 2… answ… 7723  "The Sta…
```

To get a list of discussions for a set of topics, we use the
`get_topics_discussions()` function as follows:

``` r
get_themes() %>%
  filter(themes %in% c("Coverage assessment", "Food assistance")) %>%
  get_themes_topics() %>%
  get_topics_discussions()
#> # A tibble: 502 x 10
#>    theme  topic   user   userCode job     role   date_time type  code  post     
#>    <chr>  <chr>   <chr>  <chr>    <chr>   <chr>  <chr>     <chr> <chr> <chr>    
#>  1 Cover… Resour… Tamsi… user24   "en-ne… Forum… 6 Dec 20… ques… 574   "Dear al…
#>  2 Cover… Resour… Mark … user31   "Consu… Frequ… 6 Dec 20… answ… 1536  "And her…
#>  3 Cover… Resour… Ernes… user999  ""      Techn… 22 Dec 2… answ… 1603  "Worksho…
#>  4 Cover… Resour… Saul … user1000 "Direc… Techn… 11 Jan 2… answ… 1664  "And her…
#>  5 Cover… Resour… Mark … user31   "Consu… Frequ… 1 May 20… answ… 2076  "Just a …
#>  6 Cover… Resour… Ernes… user999  ""      Techn… 26 May 2… answ… 2180  "We are …
#>  7 Cover… Resour… Ernes… user999  ""      Techn… 5 Jul 20… answ… 2278  "Dear Co…
#>  8 Cover… Resour… Mark … user31   "Consu… Frequ… 17 Sep 2… answ… 2442  "Updated…
#>  9 Cover… Resour… Mark … user31   "Consu… Frequ… 1 Nov 20… answ… 2615  "And her…
#> 10 Cover… Resour… Mark … user31   "Consu… Frequ… 30 Apr 2… answ… 3288  "The Cov…
#> # … with 492 more rows
```
