
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `rscope`

<!-- badges: start -->
<!-- badges: end -->

`rscope` is an R package to simplify working with Gradescope rosters in
R.

## Installation

You can install the development version of rscope from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("CarterZenke/rscope")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(rscope)
parse_lateness("1:00:00", unit="seconds")
#> [1] 3600
## 3600
parse_lateness("12:30:10", unit="minutes")
#> [1] 750.1667
## 750.1667
parse_lateness("3:15:04", unit="hours")
#> [1] 3.251111
## 3.251111
```
